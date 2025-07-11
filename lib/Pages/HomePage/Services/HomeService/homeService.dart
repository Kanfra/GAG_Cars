

import 'package:flutter/foundation.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Models/categoriesModel.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Models/recommendedModel.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Models/specialOfferModel.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Models/trendingMakeModel.dart';
import 'package:gag_cars_frontend/Utils/ApiUtils/apiEnpoints.dart';
import 'package:gag_cars_frontend/Utils/ApiUtils/apiUtils.dart';
class Homeservice {
  // trend makes
   Future<List<TrendingMake>> fetchTrendingMakes() async {
    final response = await fetchApiData<TrendingMakeResponse>(
      endpoint: ApiEndpoint.trendingMakes,
      fromJson: (json) => TrendingMakeResponse.fromJson(json),
    );
    return response.data;
  }

  // special offers
  Future<List<SpecialOffer>> fetchSpecialOffers() async {
    final response = await fetchApiData(
      endpoint: ApiEndpoint.specialOffers, 
      fromJson: (json) => SpecialOfferResponse.fromJson(json),
      );
      return response.data;
  }

  // recommended
  Future<List<Recommended>> fetchRecommended() async {
    final response = await fetchApiData(
      endpoint: ApiEndpoint.recommended, 
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