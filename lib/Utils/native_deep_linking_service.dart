import 'package:flutter/services.dart';
import 'package:logger/Logger.dart';
import 'package:gag_cars_frontend/Utils/simple_deep_link_handler.dart'; // FIXED: Full import path

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
      // Get initial link if app was launched by a deep link
      final initialLink = await getInitialLink();
      if (initialLink != null) {
        logger.i("🎯 App launched with deep link: $initialLink");
        SimpleDeepLinkHandler.handleIncomingLink(initialLink);
      }

      // Listen for incoming links when app is running
      _linkStream = eventChannel.receiveBroadcastStream().cast<String>();
      _linkStream!.listen((String link) {
        logger.i("🎯 Incoming deep link while app running: $link");
        SimpleDeepLinkHandler.handleIncomingLink(link);
      }, onError: (error) {
        logger.e("❌ Deep link stream error: $error");
      });

      _isInitialized = true;
      logger.i("✅ Native Deep Link Service initialized successfully");
    } catch (e) {
      logger.e("❌ Error initializing native deep links: $e");
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