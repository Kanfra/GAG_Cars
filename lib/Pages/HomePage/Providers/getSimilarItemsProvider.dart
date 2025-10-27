import 'package:flutter/foundation.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Models/similarItemsModel.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Services/SimilarItemsByCategoryService/similarItemsByCategoryService.dart';

class SimilarItemsProvider with ChangeNotifier {
  final List<SimilarItem> _items = [];
  int _currentPage = 1;
  bool _isLoading = false;
  bool _isLoadingMore = false;
  bool _hasMore = true;
  String? _error;
  int? _currentCategory;
  String? _currentItem;

  List<SimilarItem> get items => _items;
  bool get isLoading => _isLoading;
  bool get isLoadingMore => _isLoadingMore;
  bool get hasMore => _hasMore;
  String? get error => _error;
  int? get currentCategory => _currentCategory;
  String? get currentItem => _currentItem;

  /// Load initial items
  Future<void> loadInitialItems(int category, String item) async {
    if (_isLoading) return;

    _currentPage = 1;
    _items.clear();
    _hasMore = true;
    _error = null;
    _currentCategory = category;
    _currentItem = item;

    _isLoading = true;
    notifyListeners();

    try {
      final response = await SimilarItemsByCategoryService.getSimilarItemsByCategory(
        category: category,
        item: item,
        page: _currentPage,
        limit: 8, // Reduced for better performance
      );

      _items.addAll(response.data);
      _hasMore = (response.links?.next != null) && response.data.isNotEmpty;
      _currentPage++;
    } on NetworkException catch (e) {
      _error = e.message;
    } on DataParsingException catch (e) {
      _error = e.message;
    } on UnknownException catch (e) {
      _error = e.message;
    } catch (e) {
      _error = 'An unexpected error occurred: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  /// Load more items for lazy loading
  Future<void> loadMoreItems() async {
    if (_isLoadingMore || !_hasMore || _currentCategory == null || _currentItem == null) {
      return;
    }

    _isLoadingMore = true;
    notifyListeners();

    try {
      final response = await SimilarItemsByCategoryService.getSimilarItemsByCategory(
        category: _currentCategory!,
        item: _currentItem!,
        page: _currentPage,
        limit: 8, // Reduced for better performance
      );

      if (response.data.isNotEmpty) {
        _items.addAll(response.data);
        _hasMore = (response.links?.next != null);
        _currentPage++;
      } else {
        _hasMore = false;
      }
    } on NetworkException catch (e) {
      _error = e.message;
      _hasMore = false;
    } on DataParsingException catch (e) {
      _error = e.message;
      _hasMore = false;
    } on UnknownException catch (e) {
      _error = e.message;
      _hasMore = false;
    } catch (e) {
      _error = 'An unexpected error occurred: $e';
      _hasMore = false;
    } finally {
      _isLoadingMore = false;
      notifyListeners();
    }
  }

  /// Refresh items
  Future<void> refresh() async {
    if (_currentCategory == null || _currentItem == null) return;
    await loadInitialItems(_currentCategory!, _currentItem!);
  }

  /// Clear all data
  void clear() {
    _items.clear();
    _currentPage = 1;
    _isLoading = false;
    _isLoadingMore = false;
    _hasMore = true;
    _error = null;
    _currentCategory = null;
    _currentItem = null;
    notifyListeners();
  }

  /// Get item by ID
  SimilarItem? getItemById(String id) {
    try {
      return _items.firstWhere((item) => item.id == id);
    } catch (e) {
      return null;
    }
  }
}
