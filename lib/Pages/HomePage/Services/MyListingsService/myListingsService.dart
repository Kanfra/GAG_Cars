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
    final token = await AuthService.getToken();
    final response = await http.get(
      uri,
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ).timeout(const Duration(seconds: 30));

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      
      // Extract listings from 'data' field
      final List<dynamic> jsonData;
      if (responseData is Map<String, dynamic> && responseData.containsKey('data')) {
        jsonData = responseData['data'] as List<dynamic>;
      } else if (responseData is List<dynamic>) {
        jsonData = responseData;
      } else {
        jsonData = [];
      }
      
      final listings = jsonData
          .map((item) => MyListing.fromJson(item as Map<String, dynamic>))
          .toList();

      // DEBUG: Print the entire response to see the actual structure
      logger.i('API Response: ${response.body}');
      
      // SIMPLIFIED PAGINATION - This is the fix!
      bool hasMore;
      int totalCount = 0;

      // Method 1: Check if we got a full page (most reliable)
      hasMore = listings.length == _perPage;
      
      // Method 2: If we're on page > 1 and got empty, definitely no more
      if (page > 1 && listings.isEmpty) {
        hasMore = false;
      }
      
      // Method 3: Try to extract from common pagination structures
      if (responseData is Map<String, dynamic>) {
        // Laravel-style pagination
        if (responseData.containsKey('meta')) {
          final meta = responseData['meta'];
          if (meta is Map<String, dynamic>) {
            totalCount = meta['total']?.toInt() ?? 0;
            final currentPage = meta['current_page']?.toInt() ?? page;
            final lastPage = meta['last_page']?.toInt() ?? 0;
            hasMore = currentPage < lastPage;
          }
        }
        // Direct pagination fields
        else if (responseData.containsKey('total')) {
          totalCount = responseData['total']?.toInt() ?? 0;
          final currentPage = responseData['current_page']?.toInt() ?? page;
          final lastPage = responseData['last_page']?.toInt() ?? 0;
          hasMore = currentPage < lastPage;
        }
        // Simple next_page_url check
        else if (responseData.containsKey('next_page_url')) {
          hasMore = responseData['next_page_url'] != null;
        }
      }

      logger.i('Page: $page, Items: ${listings.length}, HasMore: $hasMore, TotalCount: $totalCount');
      return (listings: listings, hasMore: hasMore, totalCount: totalCount);
    
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