import 'dart:async';
import 'dart:convert';
import 'package:gag_cars_frontend/Pages/Authentication/Services/authService.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Models/similarItemsModel.dart';
import 'package:gag_cars_frontend/Utils/ApiUtils/apiEnpoints.dart';
import 'package:gag_cars_frontend/Utils/ApiUtils/apiUtils.dart';
import 'package:http/http.dart' as http;
import 'package:logger/Logger.dart';

class SimilarItemsByCategoryService {
  
  /// Fetches similar items with lazy loading support
  static Future<SimilarItemsResponse> getSimilarItemsByCategory({
    required int category,
    required String item,
    int page = 1,
    int limit = 10,
  }) async {
    final logger = Logger();
    
    try {
      logger.w('🚀 START: getSimilarItemsByCategory');
      logger.w('📋 Parameters - category: $category, item: $item, page: $page, limit: $limit');

      // Step 1: Get token
      logger.w('🔐 Getting auth token...');
      final token = await AuthService.getToken();
      logger.w('✅ Token obtained: ${token != null ? "Yes" : "No"}');

      // Step 2: Construct URL - FIXED THE EXTRA SLASH ISSUE
      logger.w('🔗 Constructing URL...');
      
      // Log the base URL and endpoint separately
      logger.w('🏠 baseApiUrl: $baseApiUrl');
      logger.w('📎 ApiEndpoint.similarItemsByCategory: ${ApiEndpoint.similarItemsByCategory}');
      
      // FIX: Remove the extra slash before $category
      final endpointPath = '${ApiEndpoint.similarItemsByCategory}/$category/$item';
      logger.w('🛣️ Full endpoint path: $endpointPath');
      
      final fullUrl = '$baseApiUrl$endpointPath';
      logger.w('🌐 Full URL before query params: $fullUrl');

      final uri = Uri.parse(fullUrl).replace(queryParameters: {
        'page': page.toString(),
        'limit': limit.toString(),
      });

      logger.w('🎯 Final URI: ${uri.toString()}');
      logger.w('🔍 Query parameters: page=$page, limit=$limit');

      // Step 3: Make HTTP request
      logger.w('📤 Making GET request...');
      logger.w('📋 Request headers:');
      logger.w('   - Authorization: Bearer ${token != null ? "***" : "null"}');
      logger.w('   - Content-Type: application/json');
      logger.w('   - Accept: application/json');

      final stopwatch = Stopwatch()..start();
      final response = await http.get(
        uri,
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ).timeout(const Duration(seconds: 30));
      stopwatch.stop();

      logger.w('⏱️ Request completed in ${stopwatch.elapsedMilliseconds}ms');
      logger.w('📥 Response status code: ${response.statusCode}');
      logger.w('📦 Response body length: ${response.body.length} characters');

      // Step 4: Handle response
      if (response.statusCode == 200) {
        logger.w('✅ Request successful (200)');
        
        try {
          logger.w('📝 Parsing response body...');
          final jsonData = json.decode(response.body);
          logger.w('📊 Response data type: ${jsonData.runtimeType}');
          
          if (jsonData is List) {
            logger.w('📋 Number of items: ${jsonData.length}');
            if (jsonData.isNotEmpty) {
              logger.w('📋 First item keys: ${(jsonData.first as Map).keys.join(", ")}');
            }
          } else if (jsonData is Map) {
            logger.w('📋 Response keys: ${jsonData.keys.join(", ")}');
          }
          
          logger.w('🔄 Converting to SimilarItemsResponse...');
          final similarItemsResponse = SimilarItemsResponse.fromJson(jsonData);
          logger.w('✅ Successfully parsed ${similarItemsResponse.data.length} items');
          
          return similarItemsResponse;
        } catch (e, stackTrace) {
          logger.e('❌ JSON parsing error: $e');
          logger.e('📋 First 500 chars of response body: ${response.body.length > 500 ? response.body.substring(0, 500) + "..." : response.body}');
          logger.e('🔍 Stack trace: $stackTrace');
          throw DataParsingException('Failed to parse response: $e');
        }
      } else {
        // Handle error responses
        logger.e('❌ Request failed with status: ${response.statusCode}');
        logger.e('📋 Response body: ${response.body}');
        logger.e('🔗 Request URL: ${uri.toString()}');
        
        final errorMessage = _handleError(response.statusCode, response.body);
        logger.e('💥 Error message: $errorMessage');
        
        throw errorMessage;
      }
    } on http.ClientException catch (e) {
      logger.e('🌐 Network/Client exception: ${e.message}');
      logger.e('🔗 This could be due to:');
      logger.e('   - Invalid URL format');
      logger.e('   - Network connectivity issues');
      logger.e('   - DNS resolution failure');
      throw NetworkException('Network error: ${e.message}');
    } on FormatException catch (e) {
      logger.e('📝 Format exception: ${e.message}');
      logger.e('🔍 This usually means:');
      logger.e('   - Invalid JSON response from server');
      logger.e('   - HTML error page instead of JSON');
      throw DataParsingException('Invalid response format: ${e.message}');
    } on TimeoutException catch (e) {
      logger.e('⏰ Timeout exception: ${e.message}');
      logger.e('🔍 Server took too long to respond');
      throw NetworkException('Request timeout: ${e.message}');
    } catch (e, stackTrace) {
      logger.e('💥 Unexpected error: $e');
      logger.e('📋 Error type: ${e.runtimeType}');
      logger.e('🔍 Stack trace: $stackTrace');
      throw UnknownException('An unexpected error occurred: $e');
    } finally {
      logger.w('🏁 END: getSimilarItemsByCategory');
    }
  }
  
  /// Handles different HTTP status codes
  static String _handleError(int statusCode, String responseBody) {
    final logger = Logger();
    logger.w('🔄 Handling error - Status: $statusCode');
    
    switch (statusCode) {
      case 400:
        return 'Bad request: $responseBody';
      case 401:
        return 'Unauthorized - Invalid token';
      case 403:
        return 'Forbidden - Access denied';
      case 404:
        // Enhanced 404 error message
        return 'Resource not found (404). Possible reasons:\n'
               '- Endpoint does not exist\n'
               '- Category or item ID is invalid\n'
               '- URL format is incorrect\n'
               'Response: $responseBody';
      case 500:
        return 'Internal server error: $responseBody';
      case 502:
        return 'Bad gateway';
      case 503:
        return 'Service unavailable';
      default:
        return 'HTTP error $statusCode: $responseBody';
    }
  }
}

/// Custom exception classes for better error handling
class NetworkException implements Exception {
  final String message;
  NetworkException(this.message);
  
  @override
  String toString() => 'NetworkException: $message';
}

class DataParsingException implements Exception {
  final String message;
  DataParsingException(this.message);
  
  @override
  String toString() => 'DataParsingException: $message';
}

class UnknownException implements Exception {
  final String message;
  UnknownException(this.message);
  
  @override
  String toString() => 'UnknownException: $message';
}