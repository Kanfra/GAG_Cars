import 'package:flutter/foundation.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Models/categoriesModel.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Models/itemsModel.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Models/specialOfferModel.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Models/trendingMakeModel.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Services/HomeService/homeService.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class HomeProvider with ChangeNotifier {
  final HomeService _homeService;
  // for terminal logs
  final Logger logger = Logger();

  int _recommendedPage = 1;
  bool _isLoadingMore = false;
  bool _hasMoreRecommended = true;

  bool get isLoadingMore => _isLoadingMore;
  bool get hasMoreRecommended => _hasMoreRecommended;

  // load more recommended items
  Future<void> loadMoreRecommended() async {
    if (_isLoadingMore || !_hasMoreRecommended) return;

    logger.w("Loading more items... Page: ${_recommendedPage + 1}");
    _isLoadingMore = true;
    notifyListeners();

    try {
      final newItems = await _homeService.fetchRecommended(page: _recommendedPage + 1);
      logger.w("Received ${newItems.length} new items");
      
      if (newItems.isEmpty) {
        logger.w("No more items available");
        _hasMoreRecommended = false;
      } else {
        logger.w("Adding ${newItems.length} items to existing ${_recommendedItems.length}");
        
        // FIX: Create a new modifiable list instead of using addAll on unmodifiable list
        _recommendedItems = [..._recommendedItems, ...newItems];
        
        _recommendedPage++;
        logger.w("Total items now: ${_recommendedItems.length}");
      }
    } catch (e) {
      logger.e("Failed to load more recommended, error: $e");
    } finally {
      _isLoadingMore = false;
      notifyListeners();
    }
  } 

  // State variables
  List<TrendingMake> _trendingMakes = [];
  List<SpecialOffer> _specialOffers = [];
  List<RecommendedItem> _recommendedItems = [];
  List<Categories> _categories = [];
  bool _isLoading = false;
  String _errorMessage = '';
  bool _hasError = false;

  // Getters
  List<TrendingMake> get trendingMakes => _trendingMakes;
  List<SpecialOffer> get specialOffers => _specialOffers;
  List<RecommendedItem> get recommendedItems => _recommendedItems;
  List<Categories> get categories => _categories;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;
  bool get hasError => _hasError;

  HomeProvider(this._homeService);

  Future<void> fetchAllData() async {
    _recommendedPage = 1;
    _hasMoreRecommended = true;

    _isLoading = true;
    _errorMessage = '';
    _hasError = false;
    notifyListeners();

    try {
      final results = await Future.wait([
        _homeService.fetchTrendingMakes(),
        _homeService.fetchSpecialOffers(),
        _homeService.fetchRecommended(),
        _homeService.fetchCategory(),
      ]);

      _trendingMakes = results[0] as List<TrendingMake>;
      _specialOffers = results[1] as List<SpecialOffer>;
      
      // FIX: Ensure recommendedItems is a modifiable list
      _recommendedItems = List<RecommendedItem>.from(results[2] as List<RecommendedItem>);
      
      _categories = results[3] as List<Categories>;

    } on FormatException catch (e, stackTrace) {
      _handleError('Data format error. Please try again later.', e, stackTrace);
    } on http.ClientException catch (e, stackTrace) {
      if (e.message?.contains('500') ?? false) {
        _handleError('Server is currently unavailable.', e, stackTrace);
      } else {
        _handleError('Network connection failed.', e, stackTrace);
      }
    } catch (e, stackTrace) {
      _handleError('An unexpected error occurred.', e, stackTrace);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void _handleError(String message, dynamic error, StackTrace stackTrace) {
    _errorMessage = message;
    _hasError = true;
    logger.e(
      'Data loading failed',
      error: error,
      stackTrace: stackTrace,
    );
    
    // Preserve existing data if we have it
    if (_trendingMakes.isEmpty &&
        _specialOffers.isEmpty &&
        _recommendedItems.isEmpty &&
        _categories.isEmpty) {
      // Clear all data if this was the first load
      _trendingMakes = [];
      _specialOffers = [];
      _recommendedItems = [];
      _categories = [];
    }
  }

  Future<void> retryFailedRequest() async {
    if (!_hasError) return;
    await fetchAllData(); 
  }

  void clearError() {
    _hasError = false;
    _errorMessage = '';
    notifyListeners();
  }
}
