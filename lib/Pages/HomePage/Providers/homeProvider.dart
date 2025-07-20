import 'package:flutter/foundation.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Models/categoriesModel.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Models/recommendedModel.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Models/specialOfferModel.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Models/trendingMakeModel.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Services/HomeService/homeService.dart';
import 'package:logger/logger.dart';

class HomeProvider with ChangeNotifier {
  final HomeService _homeService;

  HomeProvider(this._homeService);

  // State variables
  List<TrendingMake> _trendingMakes = [];
  List<SpecialOffer> _specialOffers = [];
  List<Recommended> _recommendedItems = [];
  List<Categories> _categories = [];
  bool _isLoading = false;
  String _errorMessage = '';
  final logger = Logger();

  // Getters
  List<TrendingMake> get trendingMakes => _trendingMakes;
  List<SpecialOffer> get specialOffers => _specialOffers;
  List<Recommended> get recommendedItems => _recommendedItems;
  List<Categories> get categories => _categories;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  // Fetch all data
  Future<void> fetchAllData() async {
    _isLoading = true;
    _errorMessage = '';
    notifyListeners();

    try {
      // Fetch data in parallel for better performance
      final results = await Future.wait([
        _homeService.fetchTrendingMakes(),
        _homeService.fetchSpecialOffers(),
        _homeService.fetchRecommended(),
        _homeService.fetchCategory(),
      ]);

      _trendingMakes = results[0] as List<TrendingMake>;
      _specialOffers = results[1] as List<SpecialOffer>;
      _recommendedItems = results[2] as List<Recommended>;
      _categories = results[3] as List<Categories>;

      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      _errorMessage = 'Failed to load data: ${e.toString()}';
      logger.e("Failed to load data: ${e.toString()}");
      notifyListeners();
    }
  }

  // Toggle favorite status for recommended items
  // void toggleFavorite(String itemId) {
  //   final index = _recommendedItems.indexWhere((item) => item.id == itemId);
  //   if (index != -1) {
  //     _recommendedItems[index] = _recommendedItems[index].copyWith(
  //       isLiked: !_recommendedItems[index].isLiked,
  //     );
  //     notifyListeners();
  //   }
  // }
}