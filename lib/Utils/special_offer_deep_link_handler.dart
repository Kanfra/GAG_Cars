
import 'package:flutter/material.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Models/specialOfferModel.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Providers/homeProvider.dart';
import 'package:gag_cars_frontend/Routes/routeClass.dart';
import 'package:get/get.dart';
import 'package:logger/Logger.dart';
import 'package:provider/provider.dart';

class SpecialOfferDeepLinkHandler {
  static final logger = Logger();
  static bool _isInitialized = false;

  // Your actual domain for special offers
  static const String _domainBaseUrl = 'https://gagcars.com';
  static const String _specialOfferRoutePath = '/route/specialoffer';

  static Future<void> initDeepLinking() async {
    if (_isInitialized) return;
    _isInitialized = true;
    logger.i("🔗 SpecialOfferDeepLinkHandler initialized with domain: $_domainBaseUrl");
  }

  static void handleIncomingLink(String link) {
    logger.i("🎯 Handling incoming special offer link: $link");
    
    try {
      final uri = Uri.parse(link);
      _processDeepLink(uri);
    } catch (e) {
      logger.e("❌ Error parsing special offer deep link: $e");
    }
  }

  static void _processDeepLink(Uri uri) {
    logger.i("🎯 Processing special offer deep link: $uri");
    
    // Handle custom scheme deep links
    if (uri.scheme == 'gagcars') {
      _handleCustomScheme(uri);
    }
    // Handle universal links (including your actual domain)
    else if (uri.scheme.startsWith('http')) {
      _handleUniversalLink(uri);
    }
    else {
      logger.w("⚠️ Unhandled special offer deep link: $uri");
    }
  }

  static void _handleCustomScheme(Uri uri) {
    switch (uri.host) {
      case 'special-offer':
        _handleSpecialOfferDeepLink(uri);
        break;
      case 'offer':
        _handleSpecialOfferDeepLink(uri);
        break;
      case 'paystack':
        _handlePaystackCallback(uri);
        break;
      default:
        logger.w("⚠️ Unhandled special offer custom scheme: ${uri.host}");
    }
  }

  static void _handleSpecialOfferDeepLink(Uri uri) {
    final offerId = uri.queryParameters['id'];
    final itemId = uri.queryParameters['itemId'];
    final offerName = uri.queryParameters['name'];
    final discount = uri.queryParameters['discount'];
    
    logger.i("🔍 [SPECIAL_OFFER_DEEP_LINK] Custom Scheme - Offer ID: $offerId, Item ID: $itemId, Name: $offerName, Discount: $discount");
    
    // Prefer offerId, fallback to itemId
    final idToUse = offerId ?? itemId;
    
    if (idToUse != null && idToUse.isNotEmpty) {
      _navigateToSpecialOfferDetailPage(idToUse, offerName, discount, 'special_offer_deep_link');
    } else {
      logger.e("❌ Invalid special offer deep link: missing offer ID or item ID");
      _showErrorSnackbar("Invalid special offer link: Missing ID");
    }
  }

  static void _handleUniversalLink(Uri uri) {
    final pathSegments = uri.pathSegments;
    
    logger.i("🔍 [SPECIAL_OFFER_UNIVERSAL_LINK] Host: ${uri.host}, Path: ${uri.path}, Query: ${uri.query}");
    
    // Handle your actual domain URLs: https://gagcars.com/route/specialoffer/?offerId=123&itemId=456&name=Test&discount=20
    if ((uri.host == 'gagcars.com' || uri.host == 'www.gagcars.com')) {
      // Handle special offer route path: https://gagcars.com/route/specialoffer/?offerId=123&itemId=456&name=Test&discount=20
      if (uri.path == _specialOfferRoutePath || uri.path == '$_specialOfferRoutePath/') {
        final offerId = uri.queryParameters['offerId'];
        final itemId = uri.queryParameters['itemId'];
        final offerName = uri.queryParameters['name'];
        final discount = uri.queryParameters['discount'];
        
        logger.i("🔍 [GAGCARS_SPECIAL_OFFER_ROUTE] Offer ID: $offerId, Item ID: $itemId, Name: $offerName, Discount: $discount");
        
        final idToUse = offerId ?? itemId;
        if (idToUse != null && idToUse.isNotEmpty) {
          _navigateToSpecialOfferDetailPage(idToUse, offerName, discount, 'gagcars_special_offer_route');
          return;
        }
      }
      
      // Handle path-based special offer routes: https://gagcars.com/route/specialoffer/123?name=Test&discount=20
      if (pathSegments.isNotEmpty && 
          pathSegments[0] == 'route' && 
          pathSegments.length >= 2 && 
          pathSegments[1] == 'specialoffer') {
        
        if (pathSegments.length >= 3) {
          // Format: /route/specialoffer/{offerId}
          final offerId = pathSegments[2];
          final offerName = uri.queryParameters['name'];
          final discount = uri.queryParameters['discount'];
          
          logger.i("🔍 [PATH_BASED_SPECIAL_OFFER] Extracted - Offer ID: $offerId, Name: $offerName, Discount: $discount");
          _navigateToSpecialOfferDetailPage(offerId, offerName, discount, 'path_based_special_offer');
          return;
        } else {
          // Format: /route/specialoffer?offerId=123 (query parameters)
          final offerId = uri.queryParameters['offerId'];
          final itemId = uri.queryParameters['itemId'];
          final offerName = uri.queryParameters['name'];
          final discount = uri.queryParameters['discount'];
          
          logger.i("🔍 [QUERY_BASED_SPECIAL_OFFER] Offer ID: $offerId, Item ID: $itemId, Name: $offerName, Discount: $discount");
          
          final idToUse = offerId ?? itemId;
          if (idToUse != null && idToUse.isNotEmpty) {
            _navigateToSpecialOfferDetailPage(idToUse, offerName, discount, 'query_based_special_offer');
            return;
          }
        }
      }
      
      // Handle legacy special offer URLs for backward compatibility
      if (uri.path == '/special-offer.html' || uri.path == '/offer.html') {
        final offerId = uri.queryParameters['offerId'];
        final itemId = uri.queryParameters['itemId'];
        final offerName = uri.queryParameters['name'];
        final discount = uri.queryParameters['discount'];
        
        logger.i("🔍 [LEGACY_SPECIAL_OFFER_REDIRECT] Offer ID: $offerId, Item ID: $itemId, Name: $offerName, Discount: $discount");
        
        final idToUse = offerId ?? itemId;
        if (idToUse != null && idToUse.isNotEmpty) {
          _navigateToSpecialOfferDetailPage(idToUse, offerName, discount, 'legacy_special_offer_redirect');
          return;
        }
      }
    }
    
    // Handle old Netlify domains for backward compatibility
    else if (uri.host == 'cerulean-syrniki-7ccb7a.netlify.app') {
      final offerId = uri.queryParameters['offerId'];
      final itemId = uri.queryParameters['itemId'];
      final offerName = uri.queryParameters['name'];
      final discount = uri.queryParameters['discount'];
      
      logger.i("🔍 [NETLIFY_LEGACY_SPECIAL_OFFER] Offer ID: $offerId, Item ID: $itemId, Name: $offerName, Discount: $discount");
      
      final idToUse = offerId ?? itemId;
      if (idToUse != null && idToUse.isNotEmpty) {
        _navigateToSpecialOfferDetailPage(idToUse, offerName, discount, 'netlify_legacy_special_offer');
        return;
      }
    }
    
    // Handle alternative Netlify domain
    else if (uri.host == 'radiant-sable-70d147.netlify.app') {
      final offerId = uri.queryParameters['offerId'];
      final itemId = uri.queryParameters['itemId'];
      final offerName = uri.queryParameters['name'];
      final discount = uri.queryParameters['discount'];
      
      logger.i("🔍 [NETLIFY_ALT_SPECIAL_OFFER] Offer ID: $offerId, Item ID: $itemId, Name: $offerName, Discount: $discount");
      
      final idToUse = offerId ?? itemId;
      if (idToUse != null && idToUse.isNotEmpty) {
        _navigateToSpecialOfferDetailPage(idToUse, offerName, discount, 'netlify_alt_special_offer');
        return;
      }
    }
    
    logger.w("⚠️ Unhandled special offer universal link: $uri");
  }

  static Future<void> _navigateToSpecialOfferDetailPage(String id, String? offerName, String? discount, String linkType) async {
    try {
      logger.i("🔍 [SPECIAL_OFFER_DEEP_LINK] Preparing to navigate to SpecialOfferDetailPage with ID: $id");
      logger.i("🔍 [SPECIAL_OFFER_DEEP_LINK] Link type: $linkType");
      
      // Show loading dialog
      Get.dialog(
        _buildLoadingDialog(),
        barrierDismissible: false,
      );

      // Get the current context safely
      final BuildContext? context = Get.context;
      if (context == null || !context.mounted) {
        throw Exception("No valid context available for Provider access");
      }

      // Access HomeProvider through Provider package
      final homeProvider = Provider.of<HomeProvider>(context, listen: false);
      
      // Fetch the complete special offer data using HomeProvider
      logger.i("🔍 [SPECIAL_OFFER_DEEP_LINK] Fetching special offer data for ID: $id");
      await homeProvider.fetchSpecialOfferById(id);
      
      // Using selectedSpecialOffer from HomeProvider - this is the SpecialOffer object
      final SpecialOffer? offer = homeProvider.selectedSpecialOffer;
      
      if (offer != null) {
        // ✅ PERFECT MATCH: Create the EXACT same data structure as HomePage
        final arguments = {
          "specialOffer": offer, // This is the SpecialOffer object from your model
          "type": "specialOffer",
        };

        logger.i("🚀 [SPECIAL_OFFER_NAVIGATION] Successfully fetched special offer data, navigating to SpecialOfferDetailPage");
        logger.i("   - Offer ID: ${offer.id}");
        logger.i("   - Item Name: ${offer.item?.name}");
        logger.i("   - Discount: ${offer.discount}%");
        logger.i("   - Start Date: ${offer.startAt}");
        logger.i("   - End Date: ${offer.endAt}");
        logger.i("   - Data Structure: EXACT match with HomePage");
        logger.i("   - Arguments: $arguments");

        // Close loading dialog
        if (Get.isDialogOpen == true) {
          Get.back();
        }

        // ✅ PERFECT MATCH: Navigate with EXACT same data structure as HomePage
        Get.offAllNamed(
          RouteClass.getSpecialOfferDetailPage(),
          arguments: arguments, // Same as: {"specialOffer": offer, "type": "specialOffer"}
        );
        
        logger.i("✅ [SPECIAL_OFFER_NAVIGATION] Navigation completed successfully");
        
      } else {
        // Close loading dialog
        if (Get.isDialogOpen == true) {
          Get.back();
        }
        
        logger.e("❌ [SPECIAL_OFFER_NAVIGATION] Failed to fetch special offer data or special offer not found");
        logger.e("❌ [SPECIAL_OFFER_NAVIGATION] ID: $id");
        logger.e("❌ [SPECIAL_OFFER_NAVIGATION] Provider state - hasError: ${homeProvider.hasSingleSpecialOfferError}, error: ${homeProvider.singleSpecialOfferErrorMessage}");
        
        _showErrorSnackbar("Special offer not found or failed to load details");
        
        // Navigate to fallback
        _navigateToFallback();
      }
      
    } catch (e, stackTrace) {
      // Close loading dialog if still open
      if (Get.isDialogOpen == true) {
        Get.back();
      }
      
      logger.e("❌ [SPECIAL_OFFER_NAVIGATION] Error navigating to special offer detail page: $e");
      logger.e("❌ [SPECIAL_OFFER_NAVIGATION] Stack trace: $stackTrace");
      _showErrorSnackbar("Failed to load special offer details: ${e.toString()}");
      
      // Navigate to fallback
      _navigateToFallback();
    }
  }

  static Widget _buildLoadingDialog() {
    return PopScope(
      canPop: false,
      child: Dialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.1),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFFF6B35)), // Orange color for special offers
              ),
              const SizedBox(height: 16),
              Text(
                'Loading Special Offer',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[800],
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Please wait while we fetch this exclusive offer',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[600],
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  static void _navigateToFallback() {
    try {
      logger.i("🔄 [SPECIAL_OFFER_FALLBACK] Navigating to fallback page");
      // Navigate to main bottom navigation as fallback
      Get.offAllNamed(RouteClass.getMainBottomNavigationPage());
    } catch (e) {
      logger.e("❌ [SPECIAL_OFFER_FALLBACK] Error navigating to fallback: $e");
      // Last resort - try to go back or close dialogs
      if (Get.isDialogOpen == true) {
        Get.back();
      }
    }
  }

  static void _handlePaystackCallback(Uri uri) {
    logger.i("💰 Handling Paystack callback: $uri");
    
    final reference = uri.queryParameters['reference'];
    final status = uri.queryParameters['status'];
    
    final allJson = {
      'reference': reference,
      'status': status,
      'message': uri.queryParameters['message'],
      'type': 'paystack_callback',
    };

    logger.i("🔍 [PAYSTACK] Payment callback data: $allJson");
    
    if (status == 'success' || status == 'approved') {
      Get.offAllNamed(
        RouteClass.getPaymentSuccessPage(),
        arguments: allJson,
      );
    } else {
      Get.offAllNamed(
        RouteClass.getPaymentFailedPage(),
        arguments: allJson,
      );
    }
  }

  /// ========== UPDATED LINK GENERATION METHODS WITH GAGCARS.COM DOMAIN ==========

  /// Generate deep link for a specific special offer (custom scheme)
  static String generateSpecialOfferDeepLink(String offerId, String itemId, String offerName, int discount) {
    final String encodedOfferName = Uri.encodeComponent(offerName);
    return 'gagcars://special-offer?id=$offerId&itemId=$itemId&name=$encodedOfferName&discount=$discount';
  }

  /// Generate universal link for a specific special offer (using your actual domain)
  static String generateSpecialOfferUniversalLink(String offerId, String itemId, String offerName, int discount) {
    final String encodedOfferName = Uri.encodeComponent(offerName);
    
    // Use your actual domain with /route/specialoffer path
    return '$_domainBaseUrl$_specialOfferRoutePath/?offerId=$offerId&itemId=$itemId&name=$encodedOfferName&discount=$discount';
  }

  /// Generate shareable link for special offers that works across all platforms
  static String generateSpecialOfferShareableLink(String offerId, String itemId, String offerName, int discount) {
    final String encodedOfferName = Uri.encodeComponent(offerName);
    
    // Use your actual domain for maximum compatibility and branding
    return '$_domainBaseUrl$_specialOfferRoutePath/?offerId=$offerId&itemId=$itemId&name=$encodedOfferName&discount=$discount';
  }

  /// Generate short link for special offers (easy to share)
  static String generateSpecialOfferShortLink(String offerId, String itemId, String offerName, int discount) {
    final String encodedOfferName = Uri.encodeComponent(offerName);
    
    // Short URL format using your domain: /route/specialoffer/{offerId}
    return '$_domainBaseUrl$_specialOfferRoutePath/$offerId?name=$encodedOfferName&discount=$discount';
  }

  /// Generate path-based link for special offers (better SEO)
  static String generateSpecialOfferPathLink(String offerId, String itemId, String offerName, int discount) {
    final String encodedOfferName = Uri.encodeComponent(offerName);
    
    // Path-based format: /route/specialoffer/offer/{offerId}
    return '$_domainBaseUrl$_specialOfferRoutePath/offer/$offerId?name=$encodedOfferName&discount=$discount';
  }

  /// Generate promotional link with emphasis on discount
  static String generateSpecialOfferPromoLink(String offerId, String itemId, String offerName, int discount) {
    final String encodedOfferName = Uri.encodeComponent(offerName);
    
    // Promotional format that highlights the discount
    return '$_domainBaseUrl$_specialOfferRoutePath/?offer=$offerId&name=$encodedOfferName&save=$discount%';
  }

  /// Show error snackbar
  static void _showErrorSnackbar(String message) {
    Get.snackbar(
      'Special Offer Error',
      message,
      backgroundColor: Colors.orange, // Orange color for special offer errors
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 4),
      margin: const EdgeInsets.all(16),
      borderRadius: 12,
    );
  }

  /// Show success snackbar
  static void _showSuccessSnackbar(String message) {
    Get.snackbar(
      'Special Offer Success',
      message,
      backgroundColor: Colors.green,
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.all(16),
      borderRadius: 12,
    );
  }

  /// ========== CRITICAL: DEEP LINK INTEGRATION METHODS ==========
  
  /// Check if a URL is a special offer link (used by NativeDeepLinkService for routing)
  static bool isSpecialOfferLink(String url) {
    try {
      final uri = Uri.parse(url);
      
      // Check for special offer query parameters
      final hasOfferId = uri.queryParameters.containsKey('offerId');
      final hasItemIdAndDiscount = uri.queryParameters.containsKey('itemId') && 
                                  uri.queryParameters.containsKey('discount');
      final hasOfferParam = uri.queryParameters.containsKey('offer');
      
      // Check for special offer path segments
      final hasOfferPath = uri.path.contains('specialoffer') ||
                          uri.path.contains('s-offer') ||
                          uri.path.contains('offer');
      
      // Check for special offer custom scheme
      final isSpecialOfferScheme = uri.scheme == 'gagcars' && 
                                  (uri.host == 'special-offer' || uri.host == 'offer');
      
      // Check for special offer domains - ONLY if they have offer parameters
      final isGagCarsSpecialOfferHost = (uri.host == 'gagcars.com' || uri.host == 'www.gagcars.com') &&
                                       (uri.path.contains('specialoffer') || hasOfferId || hasItemIdAndDiscount);
      
      return hasOfferId || hasItemIdAndDiscount || hasOfferPath || isSpecialOfferScheme || isGagCarsSpecialOfferHost || hasOfferParam;
    } catch (e) {
      logger.e("❌ Error checking if URL is special offer link: $e");
      return false;
    }
  }

  /// ========== ENHANCED UTILITY METHODS ==========

  /// Generate all link types for a special offer at once
  static Map<String, String> generateAllSpecialOfferLinkTypes(String offerId, String itemId, String offerName, int discount) {
    return {
      'custom_scheme': generateSpecialOfferDeepLink(offerId, itemId, offerName, discount),
      'universal_link': generateSpecialOfferUniversalLink(offerId, itemId, offerName, discount),
      'shareable_link': generateSpecialOfferShareableLink(offerId, itemId, offerName, discount),
      'short_link': generateSpecialOfferShortLink(offerId, itemId, offerName, discount),
      'path_link': generateSpecialOfferPathLink(offerId, itemId, offerName, discount),
      'promo_link': generateSpecialOfferPromoLink(offerId, itemId, offerName, discount),
    };
  }

  /// Validate if a URL is a valid GAGcars special offer link
  static bool isValidGagCarsSpecialOfferLink(String url) {
    try {
      final uri = Uri.parse(url);
      
      // Check custom scheme
      if (uri.scheme == 'gagcars' && (uri.host == 'special-offer' || uri.host == 'offer')) {
        return uri.queryParameters.containsKey('id') || uri.queryParameters.containsKey('offerId');
      }
      
      // Check HTTP/HTTPS schemes with your domain
      if ((uri.scheme == 'http' || uri.scheme == 'https') && 
          (uri.host == 'gagcars.com' || uri.host == 'www.gagcars.com')) {
        
        // Check special offer route path
        if (uri.path == _specialOfferRoutePath || uri.path == '$_specialOfferRoutePath/') {
          return uri.queryParameters.containsKey('offerId') || uri.queryParameters.containsKey('offer');
        }
        
        // Check path-based special offer routes
        final segments = uri.pathSegments;
        if (segments.isNotEmpty && segments[0] == 'route' && segments.length >= 2 && segments[1] == 'specialoffer') {
          return segments.length >= 3 || uri.queryParameters.containsKey('offerId');
        }
      }
      
      return false;
    } catch (e) {
      return false;
    }
  }

  /// Extract offer ID from any valid GAGcars special offer link
  static String? extractOfferIdFromLink(String url) {
    try {
      final uri = Uri.parse(url);
      
      // From custom scheme
      if (uri.scheme == 'gagcars' && (uri.host == 'special-offer' || uri.host == 'offer')) {
        return uri.queryParameters['id'] ?? uri.queryParameters['offerId'];
      }
      
      // From HTTP/HTTPS schemes
      if ((uri.scheme == 'http' || uri.scheme == 'https') && 
          (uri.host == 'gagcars.com' || uri.host == 'www.gagcars.com')) {
        
        // From query parameters
        if (uri.path == _specialOfferRoutePath || uri.path == '$_specialOfferRoutePath/') {
          return uri.queryParameters['offerId'] ?? uri.queryParameters['offer'];
        }
        
        // From path segments
        final segments = uri.pathSegments;
        if (segments.isNotEmpty && segments[0] == 'route' && segments.length >= 2 && segments[1] == 'specialoffer') {
          if (segments.length >= 3) {
            return segments[2]; // /route/specialoffer/{offerId}
          }
        }
      }
      
      return null;
    } catch (e) {
      return null;
    }
  }

  /// Get discount percentage from special offer link
  static int? extractDiscountFromLink(String url) {
    try {
      final uri = Uri.parse(url);
      final discountParam = uri.queryParameters['discount'] ?? uri.queryParameters['save']?.replaceAll('%', '');
      return discountParam != null ? int.tryParse(discountParam) : null;
    } catch (e) {
      return null;
    }
  }

  /// Generate analytics parameters for special offer links
  static Map<String, String> generateAnalyticsParams(String offerId, String source) {
    return {
      'utm_source': 'gagcars_app',
      'utm_medium': 'deep_link',
      'utm_campaign': 'special_offer',
      'utm_content': offerId,
      'utm_term': source,
    };
  }

  /// Generate special offer link with analytics parameters
  static String generateSpecialOfferLinkWithAnalytics(String offerId, String itemId, String offerName, int discount, String source) {
    final baseLink = generateSpecialOfferShareableLink(offerId, itemId, offerName, discount);
    final analyticsParams = generateAnalyticsParams(offerId, source);
    
    final uri = Uri.parse(baseLink);
    final params = Map<String, String>.from(uri.queryParameters)..addAll(analyticsParams);
    
    return uri.replace(queryParameters: params).toString();
  }
}