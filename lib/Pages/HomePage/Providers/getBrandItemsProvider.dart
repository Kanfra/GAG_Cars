import 'package:flutter/foundation.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Models/brandItemsModel.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Services/BrandItemsService/brandItemsService.dart';

class BrandItemsProvider with ChangeNotifier {
  final List<BrandItem> _items = [];
  bool _isLoading = false;
  bool _isLoadingMore = false;
  bool _hasMore = true;
  String? _error;
  int? _currentBrandId;
  int _currentPage = 1;
  final int _perPage = 20;
  int _totalItems = 0;
  DateTime? _lastUpdated;
  String? _searchQuery;
  String? _sortBy;
  bool _sortAscending = true;
  
  // Getters
  List<BrandItem> get items => _items;
  bool get isLoading => _isLoading;
  bool get isLoadingMore => _isLoadingMore;
  bool get hasMore => _hasMore;
  String? get error => _error;
  int? get currentBrandId => _currentBrandId;
  int get currentPage => _currentPage;
  int get totalItems => _totalItems;
  int get perPage => _perPage;
  DateTime? get lastUpdated => _lastUpdated;
  String? get searchQuery => _searchQuery;
  String? get sortBy => _sortBy;
  bool get sortAscending => _sortAscending;
  
  /// Check if we can load more items
  bool get canLoadMore => !_isLoadingMore && _hasMore && _currentBrandId != null;
  
  /// Check if we have any items
  bool get hasItems => _items.isNotEmpty;
  
  /// Check if we're in error state
  bool get hasError => _error != null;
  
  /// Check if we're in empty state
  bool get isEmpty => !_isLoading && _items.isEmpty && _error == null;

  /// Load initial items for a brand
  Future<void> loadInitialItems(int brandId, {String? searchQuery, String? sortBy, bool sortAscending = true}) async {
    if (_isLoading) return;
    
    print('🔄 [PROVIDER] Loading initial items for brand: $brandId');
    
    _items.clear();
    _hasMore = true;
    _error = null;
    _currentBrandId = brandId;
    _currentPage = 1;
    _totalItems = 0;
    _searchQuery = searchQuery;
    _sortBy = sortBy;
    _sortAscending = sortAscending;
    
    _isLoading = true;
    notifyListeners();
    
    try {
      final newItems = await BrandItemsService.getItemsByBrand(brandId: brandId);
      _items.addAll(newItems);
      _totalItems = newItems.length;
      
      // For now, set hasMore to false since we don't have real pagination
      // When API supports pagination, change to: _hasMore = newItems.length >= _perPage;
      _hasMore = false;
      
      _lastUpdated = DateTime.now();
      print('✅ [PROVIDER] Loaded ${newItems.length} items. Has more: $_hasMore');
      
    } catch (e) {
      _error = e.toString();
      print('❌ [PROVIDER] Error loading initial items: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  /// Load more items for lazy loading
  Future<void> loadMoreItems() async {
    if (!canLoadMore) {
      print('⏸️ [PROVIDER] Cannot load more - Loading: $_isLoadingMore, HasMore: $_hasMore, BrandId: $_currentBrandId');
      return;
    }
    
    print('🔄 [PROVIDER] Loading more items - Page: ${_currentPage + 1}');
    
    _isLoadingMore = true;
    _error = null;
    notifyListeners();
    
    try {
      // Simulate API call delay
      await Future.delayed(const Duration(milliseconds: 800));
      
      // For now, we'll simulate loading more items by duplicating existing ones
      // In real implementation, you would call:
      // final newItems = await BrandItemsService.getItemsByBrand(
      //   brandId: _currentBrandId!,
      //   page: _currentPage + 1,
      //   perPage: _perPage,
      // );
      
      if (_items.isNotEmpty) {
        // Simulate getting new items (in real app, this would come from API)
        final simulatedNewItems = _items.take(4).toList(); // Take first 4 as new items
        
        // Update IDs to make them unique for simulation
        for (int i = 0; i < simulatedNewItems.length; i++) {
          final item = simulatedNewItems[i];
          final simulatedItem = BrandItem(
            id: '${item.id}_page${_currentPage + 1}_$i',
            brandModelId: item.brandModelId,
            brandId: item.brandId,
            categoryId: item.categoryId,
            name: '${item.name} (Page ${_currentPage + 1})',
            year: item.year, // ✅ CORRECT - year is already int
            slug: '${item.slug}-page-${_currentPage + 1}',
            description: item.description,
            images: item.images,
            location: item.location,
            features: item.features,
            price: item.price,
            createdAt: item.createdAt,
            updatedAt: item.updatedAt,
            // Optional fields
            userId: item.userId,
            countryId: item.countryId,
            serialNumber: item.serialNumber,
            condition: item.condition,
            steerPosition: item.steerPosition,
            engineCapacity: item.engineCapacity,
            transmission: item.transmission,
            color: item.color,
            buildType: item.buildType,
            numberOfPassengers: item.numberOfPassengers,
            status: item.status,
            mileage: item.mileage,
            warranty: item.warranty,
            warrantyExpiration: item.warrantyExpiration,
            deletedAt: item.deletedAt,
            height: item.height,
            vin: item.vin,
          );
          _items.add(simulatedItem);
        }
        
        _currentPage++;
        _totalItems = _items.length;
        
        // Simulate reaching the end after 3 pages
        _hasMore = _currentPage < 3;
        
        _lastUpdated = DateTime.now();
        print('✅ [PROVIDER] Loaded ${simulatedNewItems.length} more items. Total: $_totalItems, Has more: $_hasMore');
      } else {
        _hasMore = false;
        print('⚠️ [PROVIDER] No items to simulate loading more');
      }
      
    } catch (e) {
      _error = 'Failed to load more items: $e';
      print('❌ [PROVIDER] Error loading more items: $e');
    } finally {
      _isLoadingMore = false;
      notifyListeners();
    }
  }

  /// Refresh items (pull to refresh)
  Future<void> refresh() async {
    print('🔄 [PROVIDER] Refreshing items');
    if (_currentBrandId == null) {
      print('⚠️ [PROVIDER] Cannot refresh - no current brandId');
      return;
    }
    await loadInitialItems(
      _currentBrandId!,
      searchQuery: _searchQuery,
      sortBy: _sortBy,
      sortAscending: _sortAscending,
    );
  }

  /// Clear all data
  void clear() {
    print('🧹 [PROVIDER] Clearing all data');
    _items.clear();
    _isLoading = false;
    _isLoadingMore = false;
    _hasMore = true;
    _error = null;
    _currentBrandId = null;
    _currentPage = 1;
    _totalItems = 0;
    _lastUpdated = null;
    _searchQuery = null;
    _sortBy = null;
    _sortAscending = true;
    notifyListeners();
  }

  /// Get item by ID
  BrandItem? getItemById(String id) {
    try {
      return _items.firstWhere((item) => item.id == id);
    } catch (e) {
      return null;
    }
  }

  /// Check if an item exists in the list
  bool containsItem(String id) {
    return _items.any((item) => item.id == id);
  }

  /// Update a single item
  void updateItem(BrandItem updatedItem) {
    final index = _items.indexWhere((item) => item.id == updatedItem.id);
    if (index != -1) {
      _items[index] = updatedItem;
      _lastUpdated = DateTime.now();
      notifyListeners();
      print('✅ [PROVIDER] Updated item: ${updatedItem.id}');
    }
  }

  /// Remove an item from the list
  void removeItem(String itemId) {
    final initialLength = _items.length;
    _items.removeWhere((item) => item.id == itemId);
    if (_items.length != initialLength) {
      _totalItems = _items.length;
      _lastUpdated = DateTime.now();
      notifyListeners();
      print('🗑️ [PROVIDER] Removed item: $itemId');
    }
  }

  /// Filter items by condition
  List<BrandItem> filterByCondition(String condition) {
    return _items.where((item) => item.condition == condition).toList();
  }

  /// Filter items by price range
  List<BrandItem> filterByPriceRange(double minPrice, double maxPrice) {
    return _items.where((item) {
      final price = double.tryParse(item.price) ?? 0;
      return price >= minPrice && price <= maxPrice;
    }).toList();
  }

  /// Sort items by various criteria
  void sortItems({required String sortBy, bool ascending = true}) {
    _sortBy = sortBy;
    _sortAscending = ascending;
    
    switch (sortBy) {
      case 'price':
        _items.sort((a, b) {
          final priceA = double.tryParse(a.price) ?? 0;
          final priceB = double.tryParse(b.price) ?? 0;
          return ascending ? priceA.compareTo(priceB) : priceB.compareTo(priceA);
        });
        break;
      case 'year':
        _items.sort((a, b) {
          // ✅ FIXED: No parsing needed - year is already int
          return ascending ? a.year.compareTo(b.year) : b.year.compareTo(a.year);
        });
        break;
      case 'name':
        _items.sort((a, b) {
          return ascending ? a.name.compareTo(b.name) : b.name.compareTo(a.name);
        });
        break;
      case 'mileage':
        _items.sort((a, b) {
          final mileageA = int.tryParse(a.mileage ?? '0') ?? 0;
          final mileageB = int.tryParse(b.mileage ?? '0') ?? 0;
          return ascending ? mileageA.compareTo(mileageB) : mileageB.compareTo(mileageA);
        });
        break;
    }
    
    _lastUpdated = DateTime.now();
    notifyListeners();
    print('✅ [PROVIDER] Sorted items by $sortBy (${ascending ? 'asc' : 'desc'})');
  }

  /// Get unique conditions from items
  List<String> getUniqueConditions() {
    final conditions = _items
        .where((item) => item.condition != null)
        .map((item) => item.condition!)
        .toSet()
        .toList();
    return conditions..sort();
  }

  /// Get price range statistics
  Map<String, double> getPriceRange() {
    if (_items.isEmpty) return {'min': 0, 'max': 0};
    
    final prices = _items.map((item) => double.tryParse(item.price) ?? 0).toList();
    prices.sort();
    
    return {
      'min': prices.first,
      'max': prices.last,
      'average': prices.reduce((a, b) => a + b) / prices.length,
    };
  }

  /// Get year range statistics
  Map<String, int> getYearRange() {
    if (_items.isEmpty) return {'min': 0, 'max': 0};
    
    // ✅ FIXED: No parsing needed - year is already int
    final years = _items.map((item) => item.year).toList();
    years.sort();
    
    return {
      'min': years.first,
      'max': years.last,
    };
  }

  /// Search items by name or description
  List<BrandItem> searchItems(String query) {
    if (query.isEmpty) return _items;
    
    final lowercaseQuery = query.toLowerCase();
    return _items.where((item) {
      return item.name.toLowerCase().contains(lowercaseQuery) ||
          (item.description.toLowerCase().contains(lowercaseQuery) ?? false);
    }).toList();
  }

  /// Get items by transmission type
  List<BrandItem> getItemsByTransmission(String transmission) {
    return _items.where((item) => item.transmission == transmission).toList();
  }

  /// Get items by fuel type (engine capacity)
  List<BrandItem> getItemsByEngineCapacity(String engineCapacity) {
    return _items.where((item) => item.engineCapacity == engineCapacity).toList();
  }

  /// Reset filters and sorting
  void resetFilters() {
    _searchQuery = null;
    _sortBy = null;
    _sortAscending = true;
    notifyListeners();
    print('🔄 [PROVIDER] Reset all filters');
  }

  /// Get statistics about the items
  Map<String, dynamic> getStatistics() {
    return {
      'totalItems': _totalItems,
      'totalPages': _currentPage,
      'hasMore': _hasMore,
      'lastUpdated': _lastUpdated,
      'priceRange': getPriceRange(),
      'yearRange': getYearRange(),
      'uniqueConditions': getUniqueConditions(),
      'transmissionTypes': _items.map((e) => e.transmission).whereType<String>().toSet().toList(),
      'engineCapacities': _items.map((e) => e.engineCapacity).whereType<String>().toSet().toList(),
    };
  }

  /// Check if data is stale (older than 5 minutes)
  bool get isDataStale {
    if (_lastUpdated == null) return true;
    return DateTime.now().difference(_lastUpdated!).inMinutes > 5;
  }

  /// Force refresh if data is stale
  Future<void> refreshIfStale() async {
    if (isDataStale && _currentBrandId != null) {
      print('🔄 [PROVIDER] Data is stale, refreshing...');
      await refresh();
    }
  }
}