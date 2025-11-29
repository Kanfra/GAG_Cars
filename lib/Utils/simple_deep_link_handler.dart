
import 'package:flutter/material.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Providers/homeProvider.dart';
import 'package:get/get.dart';
import 'package:gag_cars_frontend/Routes/routeClass.dart';
import 'package:logger/Logger.dart';
import 'package:provider/provider.dart';

class SimpleDeepLinkHandler {
  static final logger = Logger();
  static bool _isInitialized = false;

  // Your actual domain for regular items
  static const String _domainBaseUrl = 'https://gagcars.com';
  static const String _routePath = '/route';

  static Future<void> initDeepLinking() async {
    if (_isInitialized) return;
    _isInitialized = true;
    logger.i("🔗 SimpleDeepLinkHandler initialized with domain: $_domainBaseUrl");
  }

  static void handleIncomingLink(String link) {
    logger.i("🎯 Handling incoming link: $link");
    
    try {
      final uri = Uri.parse(link);
      _processDeepLink(uri);
    } catch (e) {
      logger.e("❌ Error parsing deep link: $e");
    }
  }

  static void _processDeepLink(Uri uri) {
    logger.i("🎯 Processing deep link: $uri");
    
    // Handle custom scheme deep links
    if (uri.scheme == 'gagcars') {
      _handleCustomScheme(uri);
    }
    // Handle universal links (including your actual domain)
    else if (uri.scheme.startsWith('http')) {
      _handleUniversalLink(uri);
    }
    else {
      logger.w("⚠️ Unhandled deep link: $uri");
    }
  }

  static void _handleCustomScheme(Uri uri) {
    switch (uri.host) {
      case 'item':
        _handleItemDeepLink(uri);
        break;
      case 'paystack':
        _handlePaystackCallback(uri);
        break;
      default:
        logger.w("⚠️ Unhandled custom scheme: ${uri.host}");
    }
  }

  static void _handleItemDeepLink(Uri uri) {
    final itemId = uri.queryParameters['id'];
    final itemName = uri.queryParameters['name'];
    
    logger.i("🔍 [DEEP_LINK] Custom Scheme - Item ID: $itemId, Name: $itemName");
    
    if (itemId != null && itemId.isNotEmpty) {
      _navigateToDetailPage(itemId, itemName, 'deep_link');
    } else {
      logger.e("❌ Invalid deep link: missing item ID");
      _showErrorSnackbar("Invalid link: Missing item ID");
    }
  }

  static void _handleUniversalLink(Uri uri) {
    final pathSegments = uri.pathSegments;
    
    logger.i("🔍 [UNIVERSAL_LINK] Host: ${uri.host}, Path: ${uri.path}, Query: ${uri.query}");
    
    // Handle your actual domain URLs: https://gagcars.com/route?id=123&name=Test
    if ((uri.host == 'gagcars.com' || uri.host == 'www.gagcars.com')) {
      // Handle route path: https://gagcars.com/route?id=123&name=Test
      if (uri.path == _routePath || uri.path == '$_routePath/') {
        final itemId = uri.queryParameters['id'];
        final itemName = uri.queryParameters['name'];
        
        logger.i("🔍 [GAGCARS_ROUTE_REDIRECT] Item ID: $itemId, Name: $itemName");
        if (itemId != null && itemId.isNotEmpty) {
          _navigateToDetailPage(itemId, itemName, 'gagcars_route_redirect');
          return;
        }
      }
      
      // Handle alternative route formats for backward compatibility
      if (uri.path == '/listing.html' || uri.path == '/listing.php') {
        final itemId = uri.queryParameters['id'];
        final itemName = uri.queryParameters['name'];
        
        logger.i("🔍 [LEGACY_WEBSITE_REDIRECT] Item ID: $itemId, Name: $itemName");
        if (itemId != null && itemId.isNotEmpty) {
          _navigateToDetailPage(itemId, itemName, 'legacy_website_redirect');
          return;
        }
      }
      
      // Handle path-based routes: https://gagcars.com/route/listing/123
      if (pathSegments.isNotEmpty && pathSegments[0] == 'route' && pathSegments.length >= 3 && pathSegments[1] == 'listing') {
        final itemId = pathSegments[2];
        final itemName = uri.queryParameters['name'];
        
        logger.i("🔍 [PATH_BASED_ROUTE] Extracted - Item ID: $itemId, Name: $itemName");
        _navigateToDetailPage(itemId, itemName, 'path_based_route');
        return;
      }
    }
    
    // Handle old Netlify domains for backward compatibility
    else if (uri.host == 'radiant-sable-70d147.netlify.app') {
      final itemId = uri.queryParameters['id'];
      final itemName = uri.queryParameters['name'];
      
      logger.i("🔍 [NETLIFY_LEGACY_REDIRECT] Item ID: $itemId, Name: $itemName");
      if (itemId != null && itemId.isNotEmpty) {
        _navigateToDetailPage(itemId, itemName, 'netlify_legacy_redirect');
        return;
      }
    }
    
    logger.w("⚠️ Unhandled universal link: $uri");
  }

  static Future<void> _navigateToDetailPage(String itemId, String? itemName, String linkType) async {
    try {
      logger.i("🔍 [DEEP_LINK] Preparing to navigate to DetailPage with ID: $itemId");
      logger.i("🔍 [DEEP_LINK] Link type: $linkType");
      
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

      // Access HomeProvider through Provider package (not GetX)
      final homeProvider = Provider.of<HomeProvider>(context, listen: false);
      
      // Fetch the complete item data using HomeProvider with string ID
      logger.i("🔍 [DEEP_LINK] Fetching item data for ID: $itemId");
      await homeProvider.fetchRecommendedById(itemId);
      
      // CHANGED: Using selectedItem instead of selectedRecommendedItem
      final item = homeProvider.selectedItem;
      
      if (item != null) {
        // Create the SAME data structure as HomePage
        final allJson = {
          'product': item.toJson(),
          'item': item.toJson(),
          'type': 'details', // Use same type as HomePage for consistency
        };

        logger.i("🚀 [NAVIGATION] Successfully fetched item data, navigating to DetailPage");
        logger.i("   - Item ID: $itemId");
        logger.i("   - Item Name: ${item.name}");
        logger.i("   - Item Brand: ${item.brand?.name}");
        logger.i("   - Item Price: ${item.price}");
        logger.i("   - Data Structure: Complete (matching HomePage)");

        // Close loading dialog
        if (Get.isDialogOpen == true) {
          Get.back();
        }

        // Navigate with complete data structure
        Get.offAllNamed(
          RouteClass.getDetailPage(),
          arguments: allJson,
        );
        
        logger.i("✅ [NAVIGATION] Navigation completed successfully");
        
      } else {
        // Close loading dialog
        if (Get.isDialogOpen == true) {
          Get.back();
        }
        
        logger.e("❌ [NAVIGATION] Failed to fetch item data or item not found");
        logger.e("❌ [NAVIGATION] Item ID: $itemId");
        logger.e("❌ [NAVIGATION] Provider state - hasError: ${homeProvider.hasSingleItemError}, error: ${homeProvider.singleItemErrorMessage}");
        
        _showErrorSnackbar("Item not found or failed to load details");
        
        // Navigate to fallback
        _navigateToFallback();
      }
      
    } catch (e, stackTrace) {
      // Close loading dialog if still open
      if (Get.isDialogOpen == true) {
        Get.back();
      }
      
      logger.e("❌ [NAVIGATION] Error navigating to detail page: $e");
      logger.e("❌ [NAVIGATION] Stack trace: $stackTrace");
      _showErrorSnackbar("Failed to load vehicle details: ${e.toString()}");
      
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
                valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF8B4513)),
              ),
              const SizedBox(height: 16),
              Text(
                'Loading Vehicle Details',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[800],
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Please wait while we fetch the item information',
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
      logger.i("🔄 [FALLBACK] Navigating to fallback page");
      // Navigate to main bottom navigation as fallback
      Get.offAllNamed(RouteClass.getMainBottomNavigationPage());
    } catch (e) {
      logger.e("❌ [FALLBACK] Error navigating to fallback: $e");
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

  /// Generate deep link for a specific item (custom scheme)
  static String generateItemDeepLink(String itemId, String itemName) {
    final String encodedItemName = Uri.encodeComponent(itemName);
    return 'gagcars://item?id=$itemId&name=$encodedItemName';
  }

  /// Generate universal link for a specific item (using your actual domain)
  static String generateUniversalLink(String itemId, String itemName) {
    final String encodedItemName = Uri.encodeComponent(itemName);
    
    // Use your actual domain with /route path
    return '$_domainBaseUrl$_routePath?id=$itemId&name=$encodedItemName';
  }

  /// Generate shareable link that works across all platforms
  static String generateShareableLink(String itemId, String itemName) {
    final String encodedItemName = Uri.encodeComponent(itemName);
    
    // Use your actual domain for maximum compatibility and branding
    return '$_domainBaseUrl$_routePath?id=$itemId&name=$encodedItemName';
  }

  /// Generate alternative path-based link: https://gagcars.com/route/listing/{itemId}
  static String generatePathBasedLink(String itemId, String itemName) {
    final String encodedItemName = Uri.encodeComponent(itemName);
    
    // Path-based format for better SEO and readability
    return '$_domainBaseUrl$_routePath/listing/$itemId?name=$encodedItemName';
  }

  /// Generate short link for easy sharing
  static String generateShortLink(String itemId, String itemName) {
    final String encodedItemName = Uri.encodeComponent(itemName);
    
    // Short URL format using your domain
    return '$_domainBaseUrl/route/$itemId?name=$encodedItemName';
  }

  /// ========== HELPER METHODS ==========

  /// Show error snackbar
  static void _showErrorSnackbar(String message) {
    Get.snackbar(
      'Error',
      message,
      backgroundColor: Colors.red,
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
      'Success',
      message,
      backgroundColor: Colors.green,
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.all(16),
      borderRadius: 12,
    );
  }

  /// ========== BULK LINK GENERATION FOR MULTIPLE ITEMS ==========

  /// Generate links for multiple items at once
  static Map<String, String> generateAllLinkTypes(String itemId, String itemName) {
    return {
      'custom_scheme': generateItemDeepLink(itemId, itemName),
      'universal_link': generateUniversalLink(itemId, itemName),
      'shareable_link': generateShareableLink(itemId, itemName),
      'path_based_link': generatePathBasedLink(itemId, itemName),
      'short_link': generateShortLink(itemId, itemName),
    };
  }

  /// Validate if a URL is a valid GAGcars item link
  static bool isValidGagCarsItemLink(String url) {
    try {
      final uri = Uri.parse(url);
      
      // Check custom scheme
      if (uri.scheme == 'gagcars' && uri.host == 'item') {
        return uri.queryParameters.containsKey('id');
      }
      
      // Check HTTP/HTTPS schemes with your domain
      if ((uri.scheme == 'http' || uri.scheme == 'https') && 
          (uri.host == 'gagcars.com' || uri.host == 'www.gagcars.com')) {
        
        // Check route path with query parameters
        if (uri.path == _routePath || uri.path == '$_routePath/') {
          return uri.queryParameters.containsKey('id');
        }
        
        // Check path-based routes
        final segments = uri.pathSegments;
        if (segments.isNotEmpty && segments[0] == 'route') {
          return segments.length >= 2; // At least /route/{id}
        }
      }
      
      return false;
    } catch (e) {
      return false;
    }
  }

  /// Extract item ID from any valid GAGcars link
  static String? extractItemIdFromLink(String url) {
    try {
      final uri = Uri.parse(url);
      
      // From custom scheme
      if (uri.scheme == 'gagcars' && uri.host == 'item') {
        return uri.queryParameters['id'];
      }
      
      // From HTTP/HTTPS schemes
      if ((uri.scheme == 'http' || uri.scheme == 'https') && 
          (uri.host == 'gagcars.com' || uri.host == 'www.gagcars.com')) {
        
        // From query parameters
        if (uri.path == _routePath || uri.path == '$_routePath/') {
          return uri.queryParameters['id'];
        }
        
        // From path segments
        final segments = uri.pathSegments;
        if (segments.isNotEmpty && segments[0] == 'route') {
          if (segments.length >= 3 && segments[1] == 'listing') {
            return segments[2]; // /route/listing/{id}
          } else if (segments.length >= 2) {
            return segments[1]; // /route/{id}
          }
        }
      }
      
      return null;
    } catch (e) {
      return null;
    }
  }
}