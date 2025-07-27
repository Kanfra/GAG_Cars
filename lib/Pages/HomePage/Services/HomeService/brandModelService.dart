import 'package:flutter/material.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Models/brandModelModel.dart';
import 'package:gag_cars_frontend/Utils/ApiUtils/apiEnpoints.dart';
import 'package:gag_cars_frontend/Utils/ApiUtils/apiUtils.dart';
import 'package:logger/logger.dart';

class BrandModelService with ChangeNotifier {
  final Logger logger = Logger();
  List<BrandModel> _brandModels = [];
  bool _isLoading = false;
  String? _error;

  List<BrandModel> get brandModels => _brandModels;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<List<BrandModel>> fetchBrandModels({
    required int brandId,  // Changed to int to match API
    int page = 1,
    int perPage = 15,
  }) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      logger.d('Fetching models for brand $brandId (page $page)');
      
      final response = await fetchApiData<BrandModelResponse>(
        endpoint: '${ApiEndpoint.brandModel}/$brandId?page=$page&per_page=$perPage',
        fromJson: (json) => json == null 
          ? _emptyBrandModelResponse()
          : BrandModelResponse.fromJson(json),
      );
      
      _brandModels = response.data;
      logger.d('Successfully fetched ${_brandModels.length} models');
      return _brandModels;
    } catch(e) {
      _error = 'Failed to load models: ${e.toString()}';
      logger.e("Failed to load brand models", 
               error: e, 
               stackTrace: StackTrace.current);
      return [];
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  BrandModelResponse _emptyBrandModelResponse() => BrandModelResponse(
    data: [], 
    links: PaginationLinks(first: '', last: '', prev: null, next: null), 
    meta: PaginationMeta(
      currentPage: 1, 
      from: 1, 
      lastPage: 1, 
      links: [], 
      path: '', 
      perPage: 15, 
      to: 1, 
      total: 0
    ),
  );

  void clearModels() {
    _brandModels = [];
    notifyListeners();
  }
}