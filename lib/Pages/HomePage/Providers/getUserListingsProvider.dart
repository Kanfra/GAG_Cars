import 'package:flutter/foundation.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Models/userListingsModel.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Services/UserListingsService/userListingsService.dart';
import 'package:logger/Logger.dart';

class UserListingsProvider with ChangeNotifier {
  final UserListingsService _userListingsService = UserListingsService();
  final logger = Logger();
  
  // State variables
  List<Listing> _allListings = [];
  List<Listing> _displayedListings = [];
  bool _isLoading = false;
  bool _isLoadingMore = false;
  bool _hasError = false;
  String _errorMessage = '';
  bool _isRefreshing = false;
  
  // Lazy loading state
  final int _pageSize = 10; // Number of items to load per "page"
  int _currentDisplayCount = 0;
  bool _hasMore = true;

  // Getters
  List<Listing> get listings => _displayedListings;
  List<Listing> get allListings => _allListings;
  bool get isLoading => _isLoading;
  bool get isLoadingMore => _isLoadingMore;
  bool get hasError => _hasError;
  String get errorMessage => _errorMessage;
  bool get isRefreshing => _isRefreshing;
  bool get hasListings => _displayedListings.isNotEmpty;
  bool get hasMore => _hasMore;
  int get displayedCount => _displayedListings.length;
  int get totalCount => _allListings.length;
  
  // FIXED: Added null check for isPromoted
  List<Listing> get promotedListings {
    return _allListings.where((listing) => listing.isPromoted == true).toList();
  }

  // Clear all state
  void _clearState() {
    _hasError = false;
    _errorMessage = '';
  }

  // Reset lazy loading state
  void _resetLazyLoading() {
    _currentDisplayCount = 0;
    _displayedListings.clear();
    _hasMore = true;
  }

  // Set loading state
  void _setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  // Set loading more state
  void _setLoadingMore(bool loading) {
    _isLoadingMore = loading;
    notifyListeners();
  }

  // Set refreshing state
  void _setRefreshing(bool refreshing) {
    _isRefreshing = refreshing;
    notifyListeners();
  }

  // Set error state
  void _setError(String message) {
    _hasError = true;
    _errorMessage = message;
    _isLoading = false;
    _isLoadingMore = false;
    _isRefreshing = false;
    notifyListeners();
  }

  // Clear error state
  void clearError() {
    _hasError = false;
    _errorMessage = '';
    notifyListeners();
  }

  // Fetch ALL user listings at once (initial load)
  Future<void> fetchAllUserListings(String userId) async {
    if (_isLoading) return;
    
    _clearState();
    _setLoading(true);

    final response = await _userListingsService.getUserListings(userId);

    _handleInitialResponse(response);
  }

  // Load initial batch for lazy loading
  Future<void> loadInitialListings(String userId) async {
    if (_isLoading) return;
    
    _clearState();
    _resetLazyLoading();
    _setLoading(true);

    final response = await _userListingsService.getUserListings(userId);

    _handleInitialResponse(response);
  }

  // FIXED: Load more listings for lazy loading (client-side pagination)
  Future<void> loadMoreListings() async {
    if (_isLoadingMore || !_hasMore || _allListings.isEmpty) return;
    
    _setLoadingMore(true);

    // Simulate loading delay for better UX
    await Future.delayed(const Duration(milliseconds: 500));
    
    final nextIndex = _currentDisplayCount;
    final endIndex = (_currentDisplayCount + _pageSize).clamp(0, _allListings.length);
    
    if (nextIndex >= _allListings.length) {
      _hasMore = false;
      _setLoadingMore(false);
      return;
    }

    // Add next batch of listings to displayed list
    final newListings = _allListings.sublist(nextIndex, endIndex);
    _displayedListings.addAll(newListings);
    _currentDisplayCount = _displayedListings.length;
    
    // Check if we have more to load
    _hasMore = _currentDisplayCount < _allListings.length;
    
    _setLoadingMore(false);
    logger.i('Loaded ${newListings.length} more listings. Total displayed: $_currentDisplayCount, Has more: $_hasMore');
  }

  // Refresh user listings (pull to refresh)
  Future<void> refreshUserListings(String userId) async {
    if (_isRefreshing) return;
    
    _clearState();
    _setRefreshing(true);

    final response = await _userListingsService.getUserListings(userId);

    _handleInitialResponse(response);
  }

  // Handle initial API response
  void _handleInitialResponse(ApiResponse<ListingResponse> response) {
    response.when(
      success: (listingResponse) {
        _allListings = listingResponse.data;
        
        // For lazy loading: only show first page initially
        final initialListings = _allListings.take(_pageSize).toList();
        _displayedListings = initialListings;
        _currentDisplayCount = initialListings.length;
        _hasMore = _allListings.length > _pageSize;
        
        _hasError = false;
        _errorMessage = '';
        _isLoading = false;
        _isRefreshing = false;
        
        logger.i('Initial load: ${_allListings.length} total listings, ${_displayedListings.length} displayed, hasMore: $_hasMore');
        notifyListeners();
      },
      unauthorized: (message) {
        _setError('Unauthorized: $message');
      },
      notFound: (message) {
        _setError('Not Found: $message');
      },
      error: (message) {
        _setError('Error: $message');
      },
    );
  }

  // Check if should load more based on scroll position
  bool shouldLoadMore(int index) {
    // Load more when we're 3 items from the end of currently displayed items
    return index >= _displayedListings.length - 3 && 
           !_isLoadingMore && 
           _hasMore && 
           !_hasError;
  }

  // Show all listings (disable lazy loading)
  void showAllListings() {
    _displayedListings = List.from(_allListings);
    _currentDisplayCount = _displayedListings.length;
    _hasMore = false;
    notifyListeners();
  }

  // Reset to lazy loading mode
  void resetToLazyLoading() {
    final initialListings = _allListings.take(_pageSize).toList();
    _displayedListings = initialListings;
    _currentDisplayCount = initialListings.length;
    _hasMore = _allListings.length > _pageSize;
    notifyListeners();
  }

  // Get listing by ID
  Listing? getListingById(String listingId) {
    try {
      return _allListings.firstWhere((listing) => listing.id == listingId);
    } catch (e) {
      return null;
    }
  }

  // FIXED: Filter listings by category with null safety
  List<Listing> getListingsByCategory(String categoryName) {
    return _allListings.where((listing) => listing.category?.name == categoryName).toList();
  }

  // FIXED: Filter listings by price range with null safety
  List<Listing> getListingsByPriceRange(double minPrice, double maxPrice) {
    return _allListings.where((listing) {
      final priceString = listing.price ?? '0';
      final price = double.tryParse(priceString) ?? 0;
      return price >= minPrice && price <= maxPrice;
    }).toList();
  }

  // FIXED: Search all listings with null safety
  List<Listing> searchListings(String query) {
    if (query.isEmpty) return _allListings;
    
    final lowercaseQuery = query.toLowerCase();
    return _allListings.where((listing) {
      return (listing.name?.toLowerCase().contains(lowercaseQuery) ?? false) ||
             (listing.description?.toLowerCase().contains(lowercaseQuery) ?? false) ||
             (listing.location?.toLowerCase().contains(lowercaseQuery) ?? false) ||
             (listing.category?.name?.toLowerCase().contains(lowercaseQuery) ?? false);
    }).toList();
  }

  // FIXED: Search displayed listings only with null safety
  List<Listing> searchDisplayedListings(String query) {
    if (query.isEmpty) return _displayedListings;
    
    final lowercaseQuery = query.toLowerCase();
    return _displayedListings.where((listing) {
      return (listing.name?.toLowerCase().contains(lowercaseQuery) ?? false) ||
             (listing.description?.toLowerCase().contains(lowercaseQuery) ?? false) ||
             (listing.location?.toLowerCase().contains(lowercaseQuery) ?? false) ||
             (listing.category?.name?.toLowerCase().contains(lowercaseQuery) ?? false);
    }).toList();
  }

  // Clear all listings
  void clearListings() {
    _allListings.clear();
    _displayedListings.clear();
    _hasError = false;
    _errorMessage = '';
    _isLoading = false;
    _isLoadingMore = false;
    _isRefreshing = false;
    _resetLazyLoading();
    notifyListeners();
  }

  // Update a single listing
  void updateListing(Listing updatedListing) {
    final allIndex = _allListings.indexWhere((listing) => listing.id == updatedListing.id);
    final displayedIndex = _displayedListings.indexWhere((listing) => listing.id == updatedListing.id);
    
    if (allIndex != -1) {
      _allListings[allIndex] = updatedListing;
    }
    if (displayedIndex != -1) {
      _displayedListings[displayedIndex] = updatedListing;
    }
    
    if (allIndex != -1 || displayedIndex != -1) {
      notifyListeners();
    }
  }

  // FIXED: Remove a listing with null safety
  void removeListing(String? listingId) {
    if (listingId == null) return;
    
    _allListings.removeWhere((listing) => listing.id == listingId);
    _displayedListings.removeWhere((listing) => listing.id == listingId);
    _currentDisplayCount = _displayedListings.length;
    _hasMore = _displayedListings.length < _allListings.length;
    notifyListeners();
  }

  // Add a new listing
  void addListing(Listing newListing) {
    _allListings.insert(0, newListing);
    _displayedListings.insert(0, newListing);
    _currentDisplayCount = _displayedListings.length;
    notifyListeners();
  }
}