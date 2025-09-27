import 'package:flutter/material.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Providers/wishlistManager.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Services/WishlistService/wishlistService.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

class WishlistFetchProvider with ChangeNotifier {
  final WishlistService _wishlistService = WishlistService();
  final Logger logger = Logger();
  
  // State variables
  List<dynamic> _wishlistItems = [];
  bool _isLoading = false;
  bool _isLoadingMore = false;
  int _currentPage = 1;
  bool _hasMore = true;
  String _errorMessage = '';
  int _totalItems = 0;
  
  // Getters
  List<dynamic> get wishlistItems => _wishlistItems;
  bool get isLoading => _isLoading;
  bool get isLoadingMore => _isLoadingMore;
  bool get hasMore => _hasMore;
  String get errorMessage => _errorMessage;
  int get totalItems => _totalItems;
  int get currentPage => _currentPage;
  
  // Fetch initial wishlist data
  Future<void> fetchWishlist({bool refresh = false, BuildContext? context}) async {
    if (_isLoading) return;
    
    logger.i('🔄 Starting fetchWishlist in provider');
    
    _isLoading = true;
    _errorMessage = '';
    
    if (refresh) {
      _currentPage = 1;
      _wishlistItems.clear();
      _hasMore = true;
      _totalItems = 0;
    }
    
    notifyListeners();
    
    try {
      final response = await _wishlistService.fetchWishlist(
        page: _currentPage,
        perPage: 10,
      );
      
      logger.i('✅ Fetch wishlist service call completed');
      logger.i('📊 Response - Success: ${response['success']}');
      logger.i('📊 Status Code: ${response['statusCode']}');
      
      if (response['success'] == true) {
        // Handle successful response
        final responseData = response['data'];
        
        // Clear any previous errors
        _errorMessage = '';
        
        // Check if responseData is a List or Map
        if (responseData is List) {
          // API returned a list directly
          if (refresh) {
            _wishlistItems = List.from(responseData);
          } else {
            _wishlistItems.addAll(responseData);
          }
          _totalItems = (response['total'] as int?) ?? responseData.length;
          _hasMore = responseData.length >= 10;
        } else if (responseData is Map) {
          // API returned a map with data/items keys
          final newItems = (responseData['data'] as List?) ?? 
                          (responseData['items'] as List?) ?? [];
          if (refresh) {
            _wishlistItems = List.from(newItems);
          } else {
            _wishlistItems.addAll(newItems);
          }
          _totalItems = (responseData['total'] as int?) ?? 
                       (responseData['totalItems'] as int?) ?? 
                       _wishlistItems.length;
          _hasMore = newItems.length >= 10;
        } else {
          // Handle unexpected response format
          _errorMessage = 'Unexpected response format from server';
          logger.e('💥 Unexpected response format: $responseData');
        }
        
        if (_wishlistItems.isNotEmpty) {
          _currentPage++;
        }
        
        // SYNC WITH WISHLIST MANAGER
        _syncWithWishlistManager(context);
        
        logger.i('📦 Loaded ${_wishlistItems.length} items');
        logger.i('📄 Current page: $_currentPage, Has more: $_hasMore');
      } else {
        // Handle error response
        _errorMessage = _extractErrorMessage(response);
        logger.e('💥 Error: $_errorMessage');
        
        if (response['statusCode'] == 401) {
          _errorMessage = 'Please login again';
        }
        
        // Clear items on error if it's a refresh
        if (refresh) {
          _wishlistItems.clear();
          _totalItems = 0;
        }
      }
    } catch (e) {
      _errorMessage = 'Network error: ${e.toString()}';
      logger.e('💥 Exception in fetchWishlist: $e');
      
      // Clear items on error if it's a refresh
      if (refresh) {
        _wishlistItems.clear();
        _totalItems = 0;
      }
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
  
  // Sync wishlist items with global WishlistManager
  void _syncWithWishlistManager(BuildContext? context) {
    if (context == null) return;
    
    try {
      final wishlistManager = Provider.of<WishlistManager>(context, listen: false);
      wishlistManager.syncWishlist(_wishlistItems);
      logger.i('✅ Successfully synced with WishlistManager');
    } catch (e) {
      logger.e('💥 Error syncing with WishlistManager: $e');
    }
  }
  
  // Helper method to extract error message safely
  String _extractErrorMessage(Map<String, dynamic> response) {
    try {
      final dynamic errorData = response['message'] ?? response['error'];
      
      if (errorData is String) {
        return errorData.isNotEmpty ? errorData : 'Failed to load wishlist';
      } else if (errorData is Map) {
        return (errorData['message'] as String?) ?? 'Failed to load wishlist';
      } else if (errorData is List) {
        return errorData.isNotEmpty ? errorData.first.toString() : 'Failed to load wishlist';
      } else {
        return (response['message']?.toString() ?? 
               response['error']?.toString() ?? 
               'Failed to load wishlist');
      }
    } catch (e) {
      return 'Failed to load wishlist';
    }
  }
  
  // Load more items for lazy loading
  Future<void> loadMoreWishlist({BuildContext? context}) async {
    if (_isLoadingMore || !_hasMore) return;
    
    logger.i('🔄 Loading more wishlist items, page: $_currentPage');
    
    _isLoadingMore = true;
    notifyListeners();
    
    try {
      final response = await _wishlistService.fetchWishlist(
        page: _currentPage,
        perPage: 10,
      );
      
      if (response['success'] == true) {
        final responseData = response['data'];
        List<dynamic> newItems = [];
        
        // Clear error on successful load more
        _errorMessage = '';
        
        // Handle both List and Map responses
        if (responseData is List) {
          newItems = responseData;
        } else if (responseData is Map) {
          newItems = (responseData['data'] as List?) ?? 
                    (responseData['items'] as List?) ?? [];
        }
        
        _wishlistItems.addAll(newItems);
        _totalItems = _wishlistItems.length;
        _hasMore = newItems.length >= 10;
        
        if (newItems.isNotEmpty) {
          _currentPage++;
        }
        
        // Sync with WishlistManager after loading more
        _syncWithWishlistManager(context);
        
        logger.i('📦 Loaded ${newItems.length} more items, total: ${_wishlistItems.length}');
      } else {
        _errorMessage = _extractErrorMessage(response);
        logger.e('💥 Load more error: $_errorMessage');
      }
    } catch (e) {
      _errorMessage = 'Network error: ${e.toString()}';
      logger.e('💥 Exception in loadMoreWishlist: $e');
    } finally {
      _isLoadingMore = false;
      notifyListeners();
    }
  }
  
  // Refresh wishlist (pull to refresh)
  Future<void> refreshWishlist({BuildContext? context}) async {
    await fetchWishlist(refresh: true, context: context);
  }
  
  // Remove item from local list after unlike (to sync with toggle)
  void removeItem(String itemId, {BuildContext? context}) {
    final initialLength = _wishlistItems.length;
    
    _wishlistItems.removeWhere((item) {
      try {
        if (item is Map) {
          return item['id'] == itemId || 
                 (item['item'] != null && item['item']['id'] == itemId);
        } else {
          // Handle object types with id property
          final dynamic itemIdValue = item?.id;
          final dynamic nestedItemId = item?.item?.id;
          return itemIdValue == itemId || nestedItemId == itemId;
        }
      } catch (e) {
        return false;
      }
    });
    
    _totalItems = _wishlistItems.length;
    
    if (initialLength != _wishlistItems.length) {
      logger.i('🗑️ Removed item $itemId from wishlist');
      
      // Sync with WishlistManager after removal
      if (context != null) {
        _syncWithWishlistManager(context);
      }
      
      notifyListeners();
    }
  }
  
  // Add item to local list after like (to sync with toggle)
  void addItem(dynamic item, {BuildContext? context}) {
    if (item != null) {
      _wishlistItems.insert(0, item);
      _totalItems = _wishlistItems.length;
      logger.i('➕ Added item to wishlist');
      
      // Sync with WishlistManager after addition
      if (context != null) {
        _syncWithWishlistManager(context);
      }
      
      notifyListeners();
    }
  }
  
  // Clear error message
  void clearError() {
    _errorMessage = '';
    notifyListeners();
  }
  
  // Reset provider state
  void reset({BuildContext? context}) {
    _wishlistItems.clear();
    _currentPage = 1;
    _hasMore = true;
    _errorMessage = '';
    _totalItems = 0;
    
    // Clear WishlistManager as well
    if (context != null) {
      try {
        final wishlistManager = Provider.of<WishlistManager>(context, listen: false);
        wishlistManager.clear();
      } catch (e) {
        logger.e('💥 Error clearing WishlistManager: $e');
      }
    }
    
    notifyListeners();
  }
  
  // Helper method to check if item exists in wishlist
  bool containsItem(String itemId) {
    return _wishlistItems.any((item) {
      try {
        if (item is Map) {
          return item['id'] == itemId || 
                 (item['item'] != null && item['item']['id'] == itemId);
        } else {
          final dynamic itemIdValue = item?.id;
          final dynamic nestedItemId = item?.item?.id;
          return itemIdValue == itemId || nestedItemId == itemId;
        }
      } catch (e) {
        return false;
      }
    });
  }
  
  // Get item by ID
  dynamic getItemById(String itemId) {
    try {
      return _wishlistItems.firstWhere((item) {
        if (item is Map) {
          return item['id'] == itemId || 
                 (item['item'] != null && item['item']['id'] == itemId);
        } else {
          final dynamic itemIdValue = item?.id;
          final dynamic nestedItemId = item?.item?.id;
          return itemIdValue == itemId || nestedItemId == itemId;
        }
      }, orElse: () => null);
    } catch (e) {
      return null;
    }
  }
}