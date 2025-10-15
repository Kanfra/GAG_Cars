import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:gag_cars_frontend/Pages/Authentication/Services/authService.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Models/searchItemModel.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Services/SearchService/searchService.dart';
import 'package:logger/Logger.dart';

class SearchProvider with ChangeNotifier {
  List<SearchItem> _searchResults = [];
  bool _isLoading = false;
  String _errorMessage = '';
  String _currentQuery = '';
  Timer? _debounceTimer;
  final Logger _logger = Logger();

  // Getters
  List<SearchItem> get searchResults => _searchResults;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;
  String get currentQuery => _currentQuery;
  bool get hasError => _errorMessage.isNotEmpty;
  bool get hasResults => _searchResults.isNotEmpty;

  // Search with debouncing (waits 500ms after user stops typing)
  void searchWithDebounce(String query) {
    _debounceTimer?.cancel();
    
    if (query.isEmpty) {
      clearSearch();
      return;
    }

    // Add minimum character limit to avoid too many API calls
    if (query.length < 2) {
      return;
    }

    _debounceTimer = Timer(const Duration(milliseconds: 500), () {
      _performSearch(query);
    });
  }

  // Actual search implementation
  Future<void> _performSearch(String query) async {
    _logger.i("🎯 STARTING SEARCH - Query: '$query'");
  _logger.i("🎯 Current token: ${await AuthService.getToken()}");
    _isLoading = true;
    _errorMessage = '';
    _currentQuery = query;
    notifyListeners();

    _logger.i("🔍 Starting search for: '$query'");

    try {
      final results = await SearchService.searchItems(query);
      _logger.i("📊 Search completed. Found ${results.length} results");
      
      _searchResults = results;
      _errorMessage = '';
      
      if (results.isEmpty) {
        _logger.i("ℹ️ No results found for query: '$query'");
      }
    } catch (e) {
      _logger.e("❌ Search error: $e");
      _searchResults = [];
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Clear search results
  void clearSearch() {
    _debounceTimer?.cancel();
    _searchResults.clear();
    _errorMessage = '';
    _currentQuery = '';
    notifyListeners();
  }

  // Retry last search
  Future<void> retrySearch() async {
    if (_currentQuery.isNotEmpty) {
      await _performSearch(_currentQuery);
    }
  }

  @override
  void dispose() {
    _debounceTimer?.cancel();
    super.dispose();
  }
}