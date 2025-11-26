import 'package:flutter/foundation.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Models/categoriesModel.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Models/itemsModel.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Models/itemModel.dart'; // NEW: Import for single item model
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

  // State variables
  List<TrendingMake> _trendingMakes = [];
  List<SpecialOffer> _specialOffers = [];
  List<RecommendedItem> _recommendedItems = [];
  List<Categories> _categories = [];
  bool _isLoading = false;
  String _errorMessage = '';
  bool _hasError = false;
  
  // For single recommended item by ID - CHANGED: Using Item instead of RecommendedItem
  SingleItem? _selectedItem;
  bool _isLoadingSingleItem = false;
  String _singleItemErrorMessage = '';
  bool _hasSingleItemError = false;

  // For single special offer by ID - NEW: Added special offer state
  SpecialOffer? _selectedSpecialOffer;
  bool _isLoadingSingleSpecialOffer = false;
  String _singleSpecialOfferErrorMessage = '';
  bool _hasSingleSpecialOfferError = false;

  // Getters
  List<TrendingMake> get trendingMakes => _trendingMakes;
  List<SpecialOffer> get specialOffers => _specialOffers;
  List<RecommendedItem> get recommendedItems => _recommendedItems;
  List<Categories> get categories => _categories;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;
  bool get hasError => _hasError;
  
  // Single item getters - CHANGED: Using Item instead of RecommendedItem
  SingleItem? get selectedItem => _selectedItem;
  bool get isLoadingSingleItem => _isLoadingSingleItem;
  String get singleItemErrorMessage => _singleItemErrorMessage;
  bool get hasSingleItemError => _hasSingleItemError;

  // Single special offer getters - NEW: Added special offer getters
  SpecialOffer? get selectedSpecialOffer => _selectedSpecialOffer;
  bool get isLoadingSingleSpecialOffer => _isLoadingSingleSpecialOffer;
  String get singleSpecialOfferErrorMessage => _singleSpecialOfferErrorMessage;
  bool get hasSingleSpecialOfferError => _hasSingleSpecialOfferError;

  HomeProvider(this._homeService);

  // Fetch recommended item by ID - CHANGED: Using Item instead of RecommendedItem
  Future<void> fetchRecommendedById(String id) async {
    _isLoadingSingleItem = true;
    _hasSingleItemError = false;
    _singleItemErrorMessage = '';
    notifyListeners();

    try {
      final item = await _homeService.fetchRecommendedById(id);
      _selectedItem = item;
      logger.i('✅ [HOME_PROVIDER] Successfully fetched item by id: $id');
      logger.i('   - Item Name: ${item.name}');
      logger.i('   - Item Brand: ${item.brand?.name}');
      logger.i('   - Item Price: ${item.price}');
    } catch (e, stackTrace) {
      _selectedItem = null;
      _hasSingleItemError = true;
      _singleItemErrorMessage = 'Failed to load item details. Please try again.';
      logger.e(
        '❌ [HOME_PROVIDER] Error fetching item by id: $id',
        error: e,
        stackTrace: stackTrace,
      );
    } finally {
      _isLoadingSingleItem = false;
      notifyListeners();
    }
  }

  // Fetch special offer by ID - NEW: Added special offer fetch method
  Future<void> fetchSpecialOfferById(String id) async {
    _isLoadingSingleSpecialOffer = true;
    _hasSingleSpecialOfferError = false;
    _singleSpecialOfferErrorMessage = '';
    notifyListeners();

    try {
      logger.i('🔄 [HOME_PROVIDER] Fetching special offer by ID: $id');
      
      final specialOffer = await _homeService.fetchSpecialOfferById(id);
      _selectedSpecialOffer = specialOffer;
      
      logger.i('✅ [HOME_PROVIDER] Special offer fetched successfully: ${specialOffer.id}');
      logger.i('   - Item: ${specialOffer.item?.name}');
      logger.i('   - Discount: ${specialOffer.discount}%');
      logger.i('   - Start Date: ${specialOffer.startAt}');
      logger.i('   - End Date: ${specialOffer.endAt}');
      
    } catch (e, stackTrace) {
      _selectedSpecialOffer = null;
      _hasSingleSpecialOfferError = true;
      _singleSpecialOfferErrorMessage = 'Failed to load special offer details. Please try again.';
      logger.e(
        '❌ [HOME_PROVIDER] Error fetching special offer by ID: $id',
        error: e,
        stackTrace: stackTrace,
      );
    } finally {
      _isLoadingSingleSpecialOffer = false;
      notifyListeners();
    }
  }

  // Clear single item state - CHANGED: Using _selectedItem instead of _selectedRecommendedItem
  void clearSelectedItem() {
    _selectedItem = null;
    _hasSingleItemError = false;
    _singleItemErrorMessage = '';
    notifyListeners();
  }

  // Clear single special offer state - NEW: Added special offer clear method
  void clearSelectedSpecialOffer() {
    _selectedSpecialOffer = null;
    _hasSingleSpecialOfferError = false;
    _singleSpecialOfferErrorMessage = '';
    notifyListeners();
  }

  // Retry single item fetch
  Future<void> retrySingleItemFetch(String id) async {
    if (!_hasSingleItemError) return;
    await fetchRecommendedById(id);
  }

  // Retry single special offer fetch - NEW: Added special offer retry method
  Future<void> retrySingleSpecialOfferFetch(String id) async {
    if (!_hasSingleSpecialOfferError) return;
    await fetchSpecialOfferById(id);
  }

  // load more recommended items
  Future<void> loadMoreRecommended() async {
    if (_isLoadingMore || !_hasMoreRecommended) return;

    logger.w("🔄 [HOME_PROVIDER] Loading more items... Page: ${_recommendedPage + 1}");
    _isLoadingMore = true;
    notifyListeners();

    try {
      final newItems = await _homeService.fetchRecommended(page: _recommendedPage + 1);
      logger.w("📦 [HOME_PROVIDER] Received ${newItems.length} new items");
      
      if (newItems.isEmpty) {
        logger.w("⚠️ [HOME_PROVIDER] No more items available");
        _hasMoreRecommended = false;
      } else {
        logger.w("➕ [HOME_PROVIDER] Adding ${newItems.length} items to existing ${_recommendedItems.length}");
        
        // FIX: Create a new modifiable list instead of using addAll on unmodifiable list
        _recommendedItems = [..._recommendedItems, ...newItems];
        
        _recommendedPage++;
        logger.w("📊 [HOME_PROVIDER] Total items now: ${_recommendedItems.length}");
      }
    } catch (e) {
      logger.e("❌ [HOME_PROVIDER] Failed to load more recommended, error: $e");
    } finally {
      _isLoadingMore = false;
      notifyListeners();
    }
  } 

  Future<void> fetchAllData() async {
    _recommendedPage = 1;
    _hasMoreRecommended = true;

    _isLoading = true;
    _errorMessage = '';
    _hasError = false;
    notifyListeners();

    try {
      logger.i("🔄 [HOME_PROVIDER] Fetching all home data...");
      
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

      logger.i("✅ [HOME_PROVIDER] All data fetched successfully");
      logger.i("   - Trending Makes: ${_trendingMakes.length}");
      logger.i("   - Special Offers: ${_specialOffers.length}");
      logger.i("   - Recommended Items: ${_recommendedItems.length}");
      logger.i("   - Categories: ${_categories.length}");

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
      '❌ [HOME_PROVIDER] Data loading failed',
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