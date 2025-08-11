import 'package:flutter/material.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Services/WishlistService/wishlistService.dart';

class WishlistToggleProvider with ChangeNotifier{
  final WishlistService _wishlistService = WishlistService();
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  // check if an item is liked
  Future<bool> toggleWishlistItem({
    required String itemId,
  }) async {
    _isLoading = true;
    notifyListeners();
    try{
      final success = await _wishlistService.toggleWishlistItem(
        itemId: itemId
        );
        _isLoading = false;
        notifyListeners();
        return success;
    } catch(e){
      _isLoading = false;
      notifyListeners();
      rethrow;
    }
  }

}