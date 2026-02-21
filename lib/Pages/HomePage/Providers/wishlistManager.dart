import 'package:flutter/foundation.dart';

class WishlistManager with ChangeNotifier {
  final Set<String> _likedItemIds = <String>{};
  
  Set<String> get likedItemIds => _likedItemIds;
  
  void addToWishlist(String itemId) {
    _likedItemIds.add(itemId);
    notifyListeners();
  }
  
  void removeFromWishlist(String itemId) {
    _likedItemIds.remove(itemId);
    notifyListeners();
  }
  
  bool isLiked(String itemId) {
    return _likedItemIds.contains(itemId);
  }
  
  void syncWishlist(List<dynamic> wishlistItems) {
    _likedItemIds.clear();
    for (final item in wishlistItems) {
      try {
        final itemId = _extractItemId(item);
        if (itemId != null) {
          _likedItemIds.add(itemId);
        }
      } catch (e) {
        if (kDebugMode) {
          debugPrint('Error syncing wishlist item: $e');
        }
      }
    }
    notifyListeners();
  }
  
  String? _extractItemId(dynamic item) {
    try {
      if (item is Map) {
        return item['id']?.toString() ?? item['item']?['id']?.toString();
      } else {
        return item?.id?.toString() ?? item?.item?.id?.toString();
      }
    } catch (e) {
      return null;
    }
  }
  
  void clear() {
    _likedItemIds.clear();
    notifyListeners();
  }
}