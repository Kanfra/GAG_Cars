import 'package:flutter/material.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Providers/wishlistManager.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Services/WishlistService/wishlistService.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

class WishlistToggleProvider with ChangeNotifier{
  final WishlistService _wishlistService = WishlistService();
  final Logger logger = Logger();
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<bool> toggleWishlistItem({
    required String itemId,
    required BuildContext context, // Add context as required parameter
  }) async {
    logger.i('🔄 Starting toggleWishlistItem in provider');
    logger.i('📝 Item ID: $itemId');
    
    _isLoading = true;
    notifyListeners();
    
    try{
      final response = await _wishlistService.toggleLike(itemId: itemId);
      
      logger.i('✅ Service call completed');
      logger.i('📊 Response - Success: ${response.success}');
      logger.i('📝 Response - Message: ${response.message}');
      
      _isLoading = false;
      notifyListeners();
      
      if (response.success) {
        // Sync with WishlistManager using the provided context
        try {
          final wishlistManager = Provider.of<WishlistManager>(context, listen: false);
          if (response.message.toLowerCase().contains('added') == true) {
            wishlistManager.addToWishlist(itemId);
            logger.i('✅ Added item $itemId to WishlistManager');
          } else if (response.message.toLowerCase().contains('removed') == true) {
            wishlistManager.removeFromWishlist(itemId);
            logger.i('✅ Removed item $itemId from WishlistManager');
          } else {
            // If message doesn't indicate action, toggle based on current state
            final isCurrentlyLiked = wishlistManager.isLiked(itemId);
            if (isCurrentlyLiked) {
              wishlistManager.removeFromWishlist(itemId);
            } else {
              wishlistManager.addToWishlist(itemId);
            }
            logger.i('✅ Toggled item $itemId in WishlistManager');
          }
        } catch (e) {
          logger.e('💥 Error syncing with WishlistManager: $e');
        }
      }
      
      return response.success;
    } catch(e){
      logger.e('💥 Error in toggleWishlistItem: $e');
      _isLoading = false;
      notifyListeners();
      rethrow;
    }
  }
}