import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:gag_cars_frontend/Pages/Authentication/Services/authService.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Models/categoriesModel.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Models/itemModel.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Models/itemsModel.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Models/specialOfferModel.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Models/trendingMakeModel.dart';
import 'package:gag_cars_frontend/Utils/ApiUtils/apiEnpoints.dart';
import 'package:gag_cars_frontend/Utils/ApiUtils/apiUtils.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
class HomeService {
  // trend makes
   Future<List<TrendingMake>> fetchTrendingMakes() async {
    final response = await fetchApiData<TrendingMakeResponse>(
      endpoint: ApiEndpoint.brands,
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
        return SpecialOfferResponse.fromJson(json);
      },
    );
    return response.data;
  } catch (e) {
    logger.e("Failed to load special offers", error: e);
    return []; // Return empty list on failure
  }
  }

  // speical offer by id
 // speical offer by id
Future<SpecialOffer> fetchSpecialOfferById(String id) async {
  final logger = Logger();
  final uri = Uri.parse("$baseApiUrl${ApiEndpoint.specialOffers}/$id");
  logger.w('base api url: $baseApiUrl');
  logger.w('URI for special offer by id: $uri');
  try{
    // get user token
    final token = await AuthService.getToken();
    if(token  == null) throw Exception("No token available");
    final response = await http.get(
      uri,
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );

    if(response.statusCode == 200){
      final Map<String, dynamic> responseBody = json.decode(response.body);
      logger.i('Raw API response for special offer: $responseBody');
      
      // Check if the response has a nested structure
      final SpecialOffer specialOffer;
      if (responseBody.containsKey('data')) {
        // If response is wrapped in 'data' key
        specialOffer = SpecialOffer.fromJson(responseBody['data']);
        logger.i('Special offer fetched successfully from nested data: ${responseBody['data']['id']}');
      } else {
        // If response is direct
        specialOffer = SpecialOffer.fromJson(responseBody);
        logger.i('Special offer fetched successfully: ${responseBody['id']}');
      }
      
      // ✅ ADDED: Debug logging to check the structure
      logger.i('Parsed special offer: ${specialOffer.toJson()}');
      logger.i('Special offer item: ${specialOffer.item?.toJson()}');
      logger.i('Special offer discount: ${specialOffer.discount}');
      
      return specialOffer;
    }
    else{
      final errorData = jsonDecode(response.body);
      throw Exception("${response.statusCode} error: ${errorData['message'] ?? "Error fetching special offer"}");
    }
  } catch(e, stackTrace){
    logger.e('Error fetching special offer by id: $e');
    logger.e('Stack trace: $stackTrace');
    rethrow;
  }
}

  // recommended
  Future<List<RecommendedItem>> fetchRecommended({
    int page = 1,
    int perPage = 10
    }) async {
    final logger = Logger();
    logger.w("Fetching recommended page $page with $perPage items");
    final response = await fetchApiData(
      endpoint: "${ApiEndpoint.items}?page=$page&per_page=$perPage", 
      fromJson: (json) => RecommendedResponse.fromJson(json),
      );
      logger.w("API response: ${response.data.length} items");
      return response.data;
  }

  // fetch recommended items by id
Future<SingleItem> fetchRecommendedById(String id) async {
  final logger = Logger();
  final uri = Uri.parse("$baseApiUrl${ApiEndpoint.items}/$id");
  logger.w('base api url: $baseApiUrl');
  logger.w('URI for recommended items by id: $uri');
  try{
    // get user token 
    final token = await AuthService.getToken();
    if(token == null) throw Exception("No token available");
    final response = await http.get(
      uri,
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );
    
    // check status code for response
    if(response.statusCode == 200){
      final Map<String, dynamic> responseBody = json.decode(response.body);
      logger.i('Raw API response: $responseBody');
      
      // Check if the response has a nested structure
      final dynamic responseData;
      if (responseBody.containsKey('data')) {
        // If response is wrapped in 'data' key
        responseData = SingleItem.fromJson(responseBody['data']);
        logger.i('Item fetched successfully from nested data: ${responseBody['data']['id']}');
      } else {
        // If response is direct
        responseData = SingleItem.fromJson(responseBody);
        logger.i('Item fetched successfully: ${responseBody['id']}');
      }
      
      return responseData;
    }
    else{
      final errorData = jsonDecode(response.body);
      throw Exception("${response.statusCode} error: ${errorData['message'] ?? "Error fetching item"}");
    }
  } catch(e, stackTrace){
    logger.e('Error fetching item by id: $e');
    logger.e('Stack trace: $stackTrace');
    rethrow;
  }
}

  // category (accessories, motobikes, etc)
  Future<List<Categories>> fetchCategory() async {
    final response = await fetchApiData(
      endpoint: ApiEndpoint.categories, 
      fromJson: (json) => CategoriesResponse.fromJson(json),
      );
      return response.data;
  }
    // get similar items by category

  }