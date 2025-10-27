import 'package:flutter/foundation.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Models/myListingsModel.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Services/MyListingsService/myListingsService.dart';

class MyListingsProvider with ChangeNotifier {
  final MyListingsService _service = MyListingsService();
  
  List<MyListing> _listings = [];
  int _currentPage = 1;
  bool _isLoading = false;
  bool _hasMore = true;
  String? _error;
  bool _isInitialLoad = true;
  int _totalCount = 0;

  List<MyListing> get listings => _listings;
  bool get isLoading => _isLoading;
  bool get hasMore => _hasMore;
  String? get error => _error;
  bool get isInitialLoad => _isInitialLoad;
  int get totalCount => _totalCount;
  int get loadedCount => _listings.length;

  /// Load initial listings (first page)
  Future<void> loadInitialListings() async {
    if (_isLoading) return;
    
    _isLoading = true;
    _error = null;
    _isInitialLoad = true;
    notifyListeners();

    try {
      final result = await _service.fetchListings(1);
      
      _listings = result.listings;
      _hasMore = result.hasMore;
      _totalCount = result.totalCount;
      _currentPage = 2; // Next page to load
      _error = null;
      
      if (kDebugMode) {
        print('Initial load complete: ${_listings.length} items, hasMore: $_hasMore');
      }
      
    } catch (e) {
      _error = e.toString();
      if (kDebugMode) {
        print('Initial load error: $_error');
      }
    } finally {
      _isLoading = false;
      _isInitialLoad = false;
      notifyListeners();
    }
  }

  /// Load more listings when user scrolls to bottom
  Future<void> loadMoreListings() async {
    if (_isLoading || !_hasMore) return;
    
    _isLoading = true;
    notifyListeners();

    try {
      final result = await _service.fetchListings(_currentPage);
      
      // Prevent duplicates by checking if items already exist
      final newListings = result.listings.where(
        (newListing) => !_listings.any((existingListing) => existingListing.id == newListing.id)
      ).toList();
      
      if (newListings.isNotEmpty) {
        _listings.addAll(newListings);
        if (kDebugMode) {
          print('Added ${newListings.length} new listings');
        }
      } else {
        if (kDebugMode) {
          print('No new listings found on page $_currentPage - possible duplicates');
        }
      }
      
      _hasMore = result.hasMore;
      _currentPage++;
      _error = null;
      
      if (kDebugMode) {
        print('Load more complete: total ${_listings.length} items, hasMore: $_hasMore');
      }
      
    } catch (e) {
      _error = e.toString();
      if (kDebugMode) {
        print('Load more error: $_error');
      }
      // For load more, we might not want to show the error as prominently
      // since it doesn't break the existing data
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  /// Refresh all listings (pull-to-refresh)
  Future<void> refreshListings() async {
    if (kDebugMode) {
      print('Refreshing listings...');
    }
    
    // Save current state for potential restoration
    final previousListings = List<MyListing>.from(_listings);
    final previousPage = _currentPage;
    final previousHasMore = _hasMore;
    
    _currentPage = 1;
    _hasMore = true;
    _error = null;
    
    try {
      await loadInitialListings();
    } catch (e) {
      // Restore previous state if refresh fails
      _listings = previousListings;
      _currentPage = previousPage;
      _hasMore = previousHasMore;
      _error = e.toString();
      notifyListeners();
      rethrow;
    }
  }

  /// Clear error state
  void clearError() {
    _error = null;
    notifyListeners();
  }

  /// Clear all data
  void clear() {
    _listings.clear();
    _currentPage = 1;
    _isLoading = false;
    _hasMore = true;
    _error = null;
    _isInitialLoad = true;
    _totalCount = 0;
    notifyListeners();
  }

  /// Get a specific listing by ID - FIXED NULL ISSUE
  MyListing? getListingById(String id) {
    try {
      return _listings.firstWhere(
        (listing) => listing.id == id,
        orElse: () => throw Exception('Listing not found'),
      );
    } catch (e) {
      return null;
    }
  }

  /// Alternative method using try-catch for getting listing by ID
  MyListing? getListingByIdAlternative(String id) {
    final index = _listings.indexWhere((listing) => listing.id == id);
    return index != -1 ? _listings[index] : null;
  }

  /// Another alternative using where and firstOrNull pattern
  MyListing? getListingByIdSimple(String id) {
    final results = _listings.where((listing) => listing.id == id);
    return results.isNotEmpty ? results.first : null;
  }

  /// Update a specific listing
  void updateListing(MyListing updatedListing) {
    final index = _listings.indexWhere((listing) => listing.id == updatedListing.id);
    if (index != -1) {
      _listings[index] = updatedListing;
      notifyListeners();
    }
  }

  /// Remove a listing
  void removeListing(String id) {
    _listings.removeWhere((listing) => listing.id == id);
    notifyListeners();
  }

  /// Check if listing exists
  bool hasListing(String id) {
    return _listings.any((listing) => listing.id == id);
  }

  /// Get listings by category
  List<MyListing> getListingsByCategory(int categoryId) {
    return _listings.where((listing) => listing.categoryId == categoryId).toList();
  }

  /// Get listings with filter
  List<MyListing> filterListings(bool Function(MyListing) predicate) {
    return _listings.where(predicate).toList();
  }
}