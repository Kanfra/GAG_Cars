
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

  // Your Netlify URL for special offers
  static const String _netlifyBaseUrl = 'https://cerulean-syrniki-7ccb7a.netlify.app';

  static Future<void> initDeepLinking() async {
    if (_isInitialized) return;
    _isInitialized = true;
    logger.i("🔗 SpecialOfferDeepLinkHandler initialized with Netlify URL: $_netlifyBaseUrl");
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
    // Handle universal links (including Netlify)
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
    
    // Handle Netlify redirect URLs: https://cerulean-syrniki-7ccb7a.netlify.app/?offerId=123&itemId=456&name=Test&discount=20
    if (uri.host == 'cerulean-syrniki-7ccb7a.netlify.app') {
      final offerId = uri.queryParameters['offerId'];
      final itemId = uri.queryParameters['itemId'];
      final offerName = uri.queryParameters['name'];
      final discount = uri.queryParameters['discount'];
      
      logger.i("🔍 [SPECIAL_OFFER_NETLIFY_REDIRECT] Offer ID: $offerId, Item ID: $itemId, Name: $offerName, Discount: $discount");
      
      final idToUse = offerId ?? itemId;
      if (idToUse != null && idToUse.isNotEmpty) {
        _navigateToSpecialOfferDetailPage(idToUse, offerName, discount, 'special_offer_netlify_redirect');
        return;
      }
    }
    
    // Handle your actual domain URLs (for future use)
    else if ((uri.host == 'gagcars.com' || uri.host == 'www.gagcars.com')) {
      // Handle special offer URLs: https://gagcars.com/special-offer/{offerId}
      if (pathSegments.isNotEmpty && pathSegments[0] == 'special-offer' && pathSegments.length >= 2) {
        final offerId = pathSegments[1];
        final offerName = uri.queryParameters['name'];
        final discount = uri.queryParameters['discount'];
        
        logger.i("🔍 [SPECIAL_OFFER_UNIVERSAL_LINK] Extracted - Offer ID: $offerId, Name: $offerName, Discount: $discount");
        _navigateToSpecialOfferDetailPage(offerId, offerName, discount, 'special_offer_universal_link');
        return;
      }
      
      // Handle redirect URLs: https://gagcars.com/special-offer.html?offerId=123&itemId=456&name=Test&discount=20
      if (uri.path == '/special-offer.html' || uri.path == '/offer.html') {
        final offerId = uri.queryParameters['offerId'];
        final itemId = uri.queryParameters['itemId'];
        final offerName = uri.queryParameters['name'];
        final discount = uri.queryParameters['discount'];
        
        logger.i("🔍 [SPECIAL_OFFER_WEBSITE_REDIRECT] Offer ID: $offerId, Item ID: $itemId, Name: $offerName, Discount: $discount");
        
        final idToUse = offerId ?? itemId;
        if (idToUse != null && idToUse.isNotEmpty) {
          _navigateToSpecialOfferDetailPage(idToUse, offerName, discount, 'special_offer_website_redirect');
          return;
        }
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
                color: Colors.black.withOpacity(0.1),
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

  /// ========== LINK GENERATION METHODS WITH NETLIFY URL ==========

  /// Generate deep link for a specific special offer (custom scheme)
  static String generateSpecialOfferDeepLink(String offerId, String itemId, String offerName, int discount) {
    final String encodedOfferName = Uri.encodeComponent(offerName);
    return 'gagcars://special-offer?id=$offerId&itemId=$itemId&name=$encodedOfferName&discount=$discount';
  }

  /// Generate universal link for a specific special offer (using your Netlify URL)
  static String generateSpecialOfferUniversalLink(String offerId, String itemId, String offerName, int discount) {
    final String encodedOfferName = Uri.encodeComponent(offerName);
    
    // Use your Netlify URL for special offer routing
    return '$_netlifyBaseUrl/special-offer?offerId=$offerId&itemId=$itemId&name=$encodedOfferName&discount=$discount';
  }

  /// Generate shareable link for special offers that works across all platforms
  static String generateSpecialOfferShareableLink(String offerId, String itemId, String offerName, int discount) {
    final String encodedOfferName = Uri.encodeComponent(offerName);
    
    // Use your Netlify URL for maximum compatibility
    return '$_netlifyBaseUrl/?offerId=$offerId&itemId=$itemId&name=$encodedOfferName&discount=$discount';
  }

  /// Generate short link for special offers (easy to share)
  static String generateSpecialOfferShortLink(String offerId, String itemId, String offerName, int discount) {
    final String encodedOfferName = Uri.encodeComponent(offerName);
    
    // Short URL format using your Netlify domain
    return '$_netlifyBaseUrl/s-offer/$offerId?name=$encodedOfferName&discount=$discount';
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

  /// Validate if a URL is a special offer link
  static bool isSpecialOfferLink(String url) {
    try {
      final uri = Uri.parse(url);
      return uri.host == 'cerulean-syrniki-7ccb7a.netlify.app' && 
             (uri.queryParameters.containsKey('offerId') || 
              uri.queryParameters.containsKey('itemId') ||
              uri.path.contains('special-offer') ||
              uri.path.contains('s-offer'));
    } catch (e) {
      return false;
    }
  }

  /// Extract special offer parameters from any URL
  static Map<String, String>? extractSpecialOfferParameters(String url) {
    try {
      final uri = Uri.parse(url);
      final params = <String, String>{};
      
      // Extract from query parameters
      if (uri.queryParameters.containsKey('offerId')) {
        params['offerId'] = uri.queryParameters['offerId']!;
      }
      if (uri.queryParameters.containsKey('itemId')) {
        params['itemId'] = uri.queryParameters['itemId']!;
      }
      if (uri.queryParameters.containsKey('name')) {
        params['name'] = uri.queryParameters['name']!;
      }
      if (uri.queryParameters.containsKey('discount')) {
        params['discount'] = uri.queryParameters['discount']!;
      }
      
      // Extract from path segments (for short URLs)
      if (uri.pathSegments.isNotEmpty) {
        if (uri.pathSegments[0] == 's-offer' && uri.pathSegments.length >= 2) {
          params['offerId'] = uri.pathSegments[1];
        } else if (uri.pathSegments[0] == 'special-offer' && uri.pathSegments.length >= 2) {
          params['offerId'] = uri.pathSegments[1];
        }
      }
      
      return params.isNotEmpty ? params : null;
    } catch (e) {
      return null;
    }
  }
}

// this file not to be used