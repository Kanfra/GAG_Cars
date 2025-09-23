import 'dart:async';
import 'dart:convert';
import 'package:gag_cars_frontend/Pages/Authentication/Services/authService.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Models/myListingsModel.dart';
import 'package:gag_cars_frontend/Utils/ApiUtils/apiEnpoints.dart';
import 'package:gag_cars_frontend/Utils/ApiUtils/apiUtils.dart';
import 'package:http/http.dart' as http;
import 'package:logger/Logger.dart';

class MyListingsService {
  static const int _perPage = 10;
  final logger = Logger();

  /// Fetches listings with pagination support using simple HTTP methods
Future<({List<MyListing> listings, bool hasMore, int totalCount})> fetchListings(int page) async {
  final uri = Uri.parse('$baseApiUrl${ApiEndpoint.myListings}?page=$page&per_page=$_perPage');
  
  try {
    // getToken
    final token = await AuthService.getToken();
    
    // Make the HTTP GET request directly
    final response = await http.get(
      uri,
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ).timeout(const Duration(seconds: 30));

    if (response.statusCode == 200) {
      // DECODE THE RESPONSE PROPERLY - THIS IS THE FIX
      final responseData = json.decode(response.body);
      
      // Extract the actual listings array from the 'data' field
      final List<dynamic> jsonData;
      if (responseData is Map<String, dynamic> && responseData.containsKey('data')) {
        jsonData = responseData['data'] as List<dynamic>;
      } else if (responseData is List<dynamic>) {
        // Fallback: if API directly returns array (backward compatibility)
        jsonData = responseData;
      } else {
        jsonData = [];
      }
      
      final listings = jsonData
          .map((item) => MyListing.fromJson(item as Map<String, dynamic>))
          .toList();

      // Enhanced pagination logic - ALSO UPDATE THIS TO EXTRACT FROM RESPONSE
      bool hasMore;
      int totalCount = 0;

      // Try to get pagination info from the response body (common in JSON APIs)
      if (responseData is Map<String, dynamic>) {
        // Check for common pagination fields in the response
        totalCount = responseData['total']?.toInt() ?? 
                    responseData['meta']?['total']?.toInt() ?? 
                    int.tryParse(response.headers['x-total-count'] ?? '') ?? 
                    0;
        
        final totalPages = responseData['last_page']?.toInt() ?? 
                          responseData['meta']?['last_page']?.toInt() ?? 
                          int.tryParse(response.headers['x-total-pages'] ?? '') ?? 
                          0;
        
        final currentPage = responseData['current_page']?.toInt() ?? 
                           responseData['meta']?['current_page']?.toInt() ?? 
                           int.tryParse(response.headers['x-current-page'] ?? '') ?? 
                           page;

        if (totalCount > 0) {
          hasMore = (currentPage * _perPage) < totalCount;
        } else if (totalPages > 0) {
          hasMore = currentPage < totalPages;
        } else {
          // Fallback: check if we got a full page of results
          hasMore = listings.length == _perPage;
        }
      } else {
        // Fallback for array responses without pagination info
        hasMore = listings.length == _perPage;
        
        // Additional safety: if page > 1 and we get 0 items, assume no more
        if (page > 1 && listings.isEmpty) {
          hasMore = false;
        }
      }

      logger.i('Page: $page, Items: ${listings.length}, HasMore: $hasMore, TotalCount: $totalCount');
      return (listings: listings, hasMore: hasMore, totalCount: totalCount);
    
    } else if (response.statusCode == 401) {
      logger.e('Authentication failed. Please login again');
      throw Exception('Authentication failed. Please login again.');
    
    } else if (response.statusCode >= 500) {
      logger.e('Server error. Please try again later');
      throw Exception('Server error. Please try again later.');
    
    } else {
      logger.e('Failed to load listings. Status code: ${response.statusCode}');
      throw Exception('Failed to load listings. Status code: ${response.statusCode}');
    }
  
  } on http.ClientException {
    logger.e('Network error. Please check your internet connection');
    throw Exception('Network error. Please check your internet connection.');
  
  } on TimeoutException {
    logger.e('Request timeout. Please try again');
    throw Exception('Request timeout. Please try again.');
  
  } catch (e) {
    logger.e('Failed to load listings: ${e.toString()}');
    throw Exception('Failed to load listings: ${e.toString()}');
  }
}

  // delete item by id
  static Future<Map<String, dynamic>> deleteListing(String itemId) async {
    final uri = Uri.parse('$baseApiUrl${ApiEndpoint.items}/$itemId');
    try{
      // getToken
      final token = await AuthService.getToken();
      final response = await http.delete(
        uri,
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        }
      );

      // handle response based on status code
      if(response.statusCode == 200){
        // successful deletion
        return {
          'success': true,
          'message': 'Item deleted successfully',
          'data': json.decode(response.body),
        };
      } else if(response.statusCode == 401){
        // unauthorized - token invalid or expired
        return {
          'success': false,
          'message': 'Unauthorized: Please login again',
          'error': 'Authentication failed',
        };
      } else {
         return {
          'success': false,
          'message': 'Failed to delete item',
          'error': 'Unexpected error occurred',
          'statusCode': response.statusCode,
        };
      }
    } catch(e){
      // handle network or other exception
      return {
        'success': false,
        'message': 'Network error occured',
        'error': e.toString(),
      };
    }
  }
}
