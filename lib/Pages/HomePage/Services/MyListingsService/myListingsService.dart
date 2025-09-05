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
        // Try to get pagination info from headers (common API patterns)
        final totalCountHeader = response.headers['x-total-count'];
        final totalPagesHeader = response.headers['x-total-pages'];
        final currentPageHeader = response.headers['x-current-page'];
        
        final jsonData = json.decode(response.body) as List;
        
        final listings = jsonData
            .map((item) => MyListing.fromJson(item as Map<String, dynamic>))
            .toList();

        // Enhanced pagination logic
        bool hasMore;
        int totalCount = 0;

        if (totalCountHeader != null) {
          // If API provides total count in headers
          totalCount = int.tryParse(totalCountHeader) ?? 0;
          hasMore = (page * _perPage) < totalCount;
        } else if (totalPagesHeader != null) {
          // If API provides total pages in headers
          final totalPages = int.tryParse(totalPagesHeader) ?? 0;
          hasMore = page < totalPages;
        } else if (currentPageHeader != null) {
          // If API provides current page in headers
          final currentPage = int.tryParse(currentPageHeader) ?? page;
          hasMore = listings.length == _perPage;
        } else {
          // Fallback: check if we got a full page of results
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