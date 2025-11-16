import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Providers/homeProvider.dart';
import 'package:gag_cars_frontend/Utils/ApiUtils/apiEnpoints.dart';
import 'package:get/get.dart';
import 'package:gag_cars_frontend/Routes/routeClass.dart';
import 'package:http/http.dart' as http;
import 'package:logger/Logger.dart';
import 'package:provider/provider.dart';

class SimpleDeepLinkHandler {
  static final logger = Logger();
  static bool _isInitialized = false;

  static Future<void> initDeepLinking() async {
    if (_isInitialized) return;
    _isInitialized = true;
    logger.i("🔗 SimpleDeepLinkHandler initialized");
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
    // Handle universal links (including Netlify)
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
    
    // Handle Netlify redirect URLs: https://radiant-sable-70d147.netlify.app/?id=123&name=Test
    if (uri.host == 'radiant-sable-70d147.netlify.app') {
      final itemId = uri.queryParameters['id'];
      final itemName = uri.queryParameters['name'];
      
      logger.i("🔍 [NETLIFY_REDIRECT] Item ID: $itemId, Name: $itemName");
      if (itemId != null && itemId.isNotEmpty) {
        _navigateToDetailPage(itemId, itemName, 'netlify_redirect');
        return;
      }
    }
    
    // Handle your actual domain URLs (for future use)
    else if ((uri.host == 'gagcars.com' || uri.host == 'www.gagcars.com')) {
      // Handle listing URLs: https://gagcars.com/listing/{itemId}
      if (pathSegments.isNotEmpty && pathSegments[0] == 'listing' && pathSegments.length >= 2) {
        final itemId = pathSegments[1];
        final itemName = uri.queryParameters['name'];
        
        logger.i("🔍 [UNIVERSAL_LINK] Extracted - Item ID: $itemId, Name: $itemName");
        _navigateToDetailPage(itemId, itemName, 'universal_link');
        return;
      }
      
      // Handle redirect URLs: https://gagcars.com/listing.html?id=123&name=Test
      if (uri.path == '/listing.html' || uri.path == '/listing.php') {
        final itemId = uri.queryParameters['id'];
        final itemName = uri.queryParameters['name'];
        
        logger.i("🔍 [WEBSITE_REDIRECT] Item ID: $itemId, Name: $itemName");
        if (itemId != null && itemId.isNotEmpty) {
          _navigateToDetailPage(itemId, itemName, 'website_redirect');
          return;
        }
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

  /// Generate deep link for a specific item
  static String generateItemDeepLink(String itemId, String itemName) {
    final String encodedItemName = Uri.encodeComponent(itemName);
    return 'gagcars://item?id=$itemId&name=$encodedItemName';
  }

  /// Generate universal link for a specific item
  static String generateUniversalLink(String itemId, String itemName) {
    final String encodedItemName = Uri.encodeComponent(itemName);
    
    // Use your Netlify URL for maximum compatibility
    return 'https://radiant-sable-70d147.netlify.app/?id=$itemId&name=$encodedItemName';
  }

  /// Generate shareable link that works across all platforms
  static String generateShareableLink(String itemId, String itemName) {
    final String encodedItemName = Uri.encodeComponent(itemName);
    
    // Use your Netlify URL for maximum compatibility
    return 'https://radiant-sable-70d147.netlify.app/?id=$itemId&name=$encodedItemName';
  }

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
}