import 'package:flutter/services.dart';
import 'package:logger/Logger.dart';
import 'package:gag_cars_frontend/Utils/simple_deep_link_handler.dart';
import 'package:gag_cars_frontend/Utils/special_offer_deep_link_handler.dart';

class NativeDeepLinkService {
  static final logger = Logger();
  static const platform = MethodChannel('com.gagcars/deeplink');
  static const eventChannel = EventChannel('com.gagcars/deeplink_events');
  
  static Stream<String>? _linkStream;
  static bool _isInitialized = false;

  static Future<void> initDeepLinking() async {
    if (_isInitialized) return;
    
    logger.i("🔗 Initializing Native Deep Link Service...");
    
    try {
      // Initialize both deep link handlers
      await SimpleDeepLinkHandler.initDeepLinking();
      await SpecialOfferDeepLinkHandler.initDeepLinking();
      
      // Get initial link if app was launched by a deep link
      final initialLink = await getInitialLink();
      if (initialLink != null) {
        logger.i("🎯 App launched with deep link: $initialLink");
        _routeDeepLink(initialLink);
      }

      // Listen for incoming links when app is running
      _linkStream = eventChannel.receiveBroadcastStream().cast<String>();
      _linkStream!.listen((String link) {
        logger.i("🎯 Incoming deep link while app running: $link");
        _routeDeepLink(link);
      }, onError: (error) {
        logger.e("❌ Deep link stream error: $error");
      });

      _isInitialized = true;
      logger.i("✅ Native Deep Link Service initialized successfully - Now supports both regular items and special offers");
    } catch (e) {
      logger.e("❌ Error initializing native deep links: $e");
    }
  }

  /// Smart routing that precisely distinguishes between regular items and special offers
  static void _routeDeepLink(String link) {
    try {
      logger.i("🔄 Smart routing deep link: $link");
      
      final uri = Uri.parse(link);
      
      // 1. First check custom schemes (most specific)
      if (uri.scheme == 'gagcars') {
        if (uri.host == 'special-offer' || uri.host == 'offer') {
          logger.i("🎯 Detected SPECIAL OFFER custom scheme");
          SpecialOfferDeepLinkHandler.handleIncomingLink(link);
          return;
        } else if (uri.host == 'item') {
          logger.i("🎯 Detected REGULAR ITEM custom scheme");
          SimpleDeepLinkHandler.handleIncomingLink(link);
          return;
        } else if (uri.host == 'paystack') {
          logger.i("🎯 Detected PAYSTACK callback");
          SimpleDeepLinkHandler.handleIncomingLink(link); // Paystack uses simple handler
          return;
        }
      }
      
      // 2. Check for special offer parameters in universal links
      final hasOfferId = uri.queryParameters.containsKey('offerId');
      final hasItemIdAndDiscount = uri.queryParameters.containsKey('itemId') && 
                                  uri.queryParameters.containsKey('discount');
      
      if (hasOfferId || hasItemIdAndDiscount) {
        logger.i("🎯 Detected SPECIAL OFFER universal link with offer parameters");
        SpecialOfferDeepLinkHandler.handleIncomingLink(link);
        return;
      }
      
      // 3. Check for special offer paths
      if (uri.path.contains('special-offer') || uri.path.contains('s-offer')) {
        logger.i("🎯 Detected SPECIAL OFFER path");
        SpecialOfferDeepLinkHandler.handleIncomingLink(link);
        return;
      }
      
      // 4. Everything else goes to regular item handler (including regular item links)
      logger.i("🎯 Defaulting to REGULAR ITEM handler");
      SimpleDeepLinkHandler.handleIncomingLink(link);
      
    } catch (e) {
      logger.e("❌ Error in smart routing, falling back to original behavior: $e");
      // Fallback to the original behavior that already works
      SimpleDeepLinkHandler.handleIncomingLink(link);
    }
  }

  static Future<String?> getInitialLink() async {
    try {
      final String? initialLink = await platform.invokeMethod('getInitialLink');
      return initialLink;
    } on PlatformException catch (e) {
      logger.e("Failed to get initial link: '${e.message}'");
      return null;
    }
  }

  static void dispose() {
    _isInitialized = false;
    logger.i("🔗 Native Deep Link Service disposed");
  }
}