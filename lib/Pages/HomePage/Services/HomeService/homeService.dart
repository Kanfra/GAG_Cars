

import 'package:flutter/foundation.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Models/categoriesModel.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Models/recommendedModel.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Models/specialOfferModel.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Models/trendingMakeModel.dart';
import 'package:gag_cars_frontend/Utils/ApiUtils/apiEnpoints.dart';
import 'package:gag_cars_frontend/Utils/ApiUtils/apiUtils.dart';
import 'package:logger/logger.dart';
class HomeService {
  // trend makes
   Future<List<TrendingMake>> fetchTrendingMakes() async {
    final response = await fetchApiData<TrendingMakeResponse>(
      endpoint: ApiEndpoint.makes,
      fromJson: (json) => TrendingMakeResponse.fromJson(json),
    );
    return response.data;
  }

  // special offers
  Future<List<SpecialOffer>> fetchSpecialOffers() async {
    final logger = Logger();
     try {
    final response = await fetchApiData(
      endpoint: ApiEndpoint.specialOffers,
      fromJson: (json) {
        // Handle case where response doesn't match expected format
        if (json == null) return SpecialOfferResponse(data: [], links: null, meta: null);
        return SpecialOfferResponse.fromJson(json);
      },
    );
    return response.data;
  } catch (e) {
    logger.e("Failed to load special offers", error: e);
    return []; // Return empty list on failure
  }
  }

  // recommended
  Future<List<RecommendedItem>> fetchRecommended({
    int page = 1,
    int perPage = 10
    }) async {
    final response = await fetchApiData(
      endpoint: "${ApiEndpoint.recommended}?page=$page&per_page=$perPage", 
      fromJson: (json) => RecommendedResponse.fromJson(json),
      );
      return response.data;
  }

  // category (accessories, motobikes, etc)
  Future<List<Categories>> fetchCategory() async {
    final response = await fetchApiData(
      endpoint: ApiEndpoint.category, 
      fromJson: (json) => CategoriesResponse.fromJson(json),
      );
      return response.data;
  }
  }