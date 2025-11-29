import 'dart:async';
import 'dart:convert';

import 'package:gag_cars_frontend/Pages/Authentication/Services/authService.dart';
import 'package:gag_cars_frontend/Utils/ApiUtils/apiEnpoints.dart';
import 'package:gag_cars_frontend/Utils/ApiUtils/apiUtils.dart';
import 'package:http/http.dart' as http;
import 'package:logger/Logger.dart';

class WishlistService{
  final logger = Logger();
  
  Future<WishlistResponse> toggleLike({required String itemId}) async {
    final uri = Uri.parse('$baseApiUrl${ApiEndpoint.myWishlist}/$itemId');
    
    logger.i('🚀 Starting toggleLike operation');
    logger.i('📝 Item ID: $itemId');
    logger.i('🔗 API Endpoint: $uri');
    
    try {
      // Get authentication token
      final token = await AuthService.getToken();
      
      if (token == null || token.isEmpty) {
        logger.e('❌ Authentication token is null or empty');
        return WishlistResponse(
          success: false,
          message: 'Authentication token not found. Please login again.',
          data: null,
        );
      }
      
      logger.i('✅ Token obtained successfully');
      logger.i('🔐 Token length: ${token.length} characters');
      logger.i('📤 Making POST request...');
      
      final response = await http.post(
        uri,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        }
      ).timeout(const Duration(seconds: 30));
      
      logger.i('📥 Response received');
      logger.i('📊 Status Code: ${response.statusCode}');
      logger.i('📄 Response Headers: ${response.headers}');
      logger.i('📋 Response Body: ${response.body}');
      
      return _handleResponse(response);
      
    } on http.ClientException catch (e) {
      logger.e('❌ HTTP Client Exception: $e');
      return WishlistResponse(
        success: false,
        message: 'Network error: ${e.message}',
        data: null,
      );
    } on TimeoutException catch (e) {
      logger.e('⏰ Request timeout: $e');
      return WishlistResponse(
        success: false,
        message: 'Request timeout. Please check your internet connection.',
        data: null,
      );
    } on FormatException catch (e) {
      logger.e('📖 Response format error: $e');
      return WishlistResponse(
        success: false,
        message: 'Invalid response format from server.',
        data: null,
      );
    } catch (e) {
      logger.e('💥 Unexpected error: $e');
      logger.e('📞 Stack trace: ${StackTrace.current}');
      return WishlistResponse(
        success: false,
        message: 'Unexpected error: ${e.toString()}',
        data: null,
      );
    }
  }

  /// Handle the API response based on status code
  WishlistResponse _handleResponse(http.Response response) {
    logger.i('🔄 Processing response in _handleResponse');
    
    try {
      final Map<String, dynamic> responseBody = json.decode(response.body);
      logger.i('✅ JSON decoded successfully');
      logger.i('📋 Response keys: ${responseBody.keys}');
      
      switch (response.statusCode) {
        case 200:
          logger.i('🎉 Success 200 - Operation completed');
          return WishlistResponse.fromJson(responseBody);
          
        case 201:
          logger.i('🎉 Success 201 - Item added to wishlist');
          return WishlistResponse.fromJson(responseBody);
          
        case 400:
          logger.w('⚠️ Bad Request 400');
          logger.w('📝 Message: ${responseBody['message']}');
          return WishlistResponse(
            success: false,
            message: responseBody['message'] ?? 'Bad request. Please check your input.',
            data: null,
          );
          
        case 401:
          logger.w('🔐 Unauthorized 401');
          logger.w('📝 Message: ${responseBody['message']}');
          return WishlistResponse(
            success: false,
            message: responseBody['message'] ?? 'Unauthorized access. Please login again.',
            data: null,
          );
          
        case 403:
          logger.w('🚫 Forbidden 403');
          logger.w('📝 Message: ${responseBody['message']}');
          return WishlistResponse(
            success: false,
            message: responseBody['message'] ?? 'Access forbidden.',
            data: null,
          );
          
        case 404:
          logger.w('🔍 Not Found 404');
          logger.w('📝 Message: ${responseBody['message']}');
          return WishlistResponse(
            success: false,
            message: responseBody['message'] ?? 'Item not found.',
            data: null,
          );
          
        case 422:
          logger.w('📋 Validation Error 422');
          logger.w('📝 Message: ${responseBody['message']}');
          logger.w('📋 Errors: ${responseBody['errors']}');
          return WishlistResponse(
            success: false,
            message: responseBody['message'] ?? 'Validation error occurred.',
            data: null,
          );
          
        case 500:
          logger.e('💥 Server Error 500');
          logger.e('📝 Message: ${responseBody['message']}');
          return WishlistResponse(
            success: false,
            message: responseBody['message'] ?? 'Internal server error. Please try again later.',
            data: null,
          );
          
        default:
          logger.w('❓ Unexpected status code: ${response.statusCode}');
          logger.w('📝 Message: ${responseBody['message']}');
          return WishlistResponse(
            success: false,
            message: responseBody['message'] ?? 'Unexpected error occurred (Status: ${response.statusCode})',
            data: null,
          );
      }
    } catch (e) {
      logger.e('💥 Error parsing JSON response: $e');
      logger.e('📄 Raw response body: ${response.body}');
      
      return WishlistResponse(
        success: false,
        message: 'Failed to parse server response: ${e.toString()}',
        data: null,
      );
    }
  }

  Future<Map<String, dynamic>> fetchWishlist({
    required int page, 
    int perPage = 10,
  }) async {
    final uri = Uri.parse(
      '$baseApiUrl${ApiEndpoint.myWishlist}?page=$page&perPage=$perPage',
    );
    
    logger.i('🔄 Starting fetchWishlist operation');
    logger.i('📄 Page: $page, Per Page: $perPage');
    logger.i('🔗 API Endpoint: $uri');
    
    try {
      final token = await AuthService.getToken();
      
      if (token == null || token.isEmpty) {
        logger.e('❌ Authentication token is null or empty');
        return {
          'success': false,
          'error': 'Authentication token not found',
          'page': page,
          'perPage': perPage,
          'statusCode': 401,
        };
      }
      
      logger.i('✅ Token obtained successfully');
      
      final response = await http.get(
        uri,
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        }
      ).timeout(const Duration(seconds: 30));
      
      logger.i('📥 Response received - Status: ${response.statusCode}');
      logger.i('📋 Response Body: ${response.body}');
      
      // FIX: Safely handle JSON parsing for different response formats
      dynamic responseBody;
      try {
        responseBody = json.decode(response.body);
        logger.i('✅ JSON parsed successfully - Type: ${responseBody.runtimeType}');
      } catch (e) {
        logger.e('💥 JSON parsing error: $e');
        return {
          'success': false,
          'error': 'Invalid JSON response: ${e.toString()}',
          'page': page,
          'perPage': perPage,
          'statusCode': response.statusCode,
        };
      }
      
      // Handle different status codes
      switch (response.statusCode) {
        case 200:
          logger.i('🎉 Success 200 - Processing wishlist data');
          
          // FIX: Handle both List and Map responses
          if (responseBody is List) {
            logger.i('📊 API returned List with ${responseBody.length} items');
            return {
              'success': true,
              'data': responseBody, // Direct list of wishlist items
              'page': page,
              'perPage': perPage,
              'statusCode': 200,
              'total': responseBody.length,
            };
          } else if (responseBody is Map) {
            logger.i('📊 API returned Map with keys: ${responseBody.keys}');
            
            // Extract data from different possible key names
            final data = responseBody['data'] ?? responseBody['items'] ?? responseBody['wishlist'];
            final total = responseBody['total'] ?? responseBody['totalItems'] ?? responseBody['count'];
            
            return {
              'success': true,
              'data': data ?? [], // Use extracted data or empty list
              'page': page,
              'perPage': perPage,
              'statusCode': 200,
              'total': total ?? (data is List ? data.length : 0),
            };
          } else {
            logger.e('💥 Unexpected response format: ${responseBody.runtimeType}');
            return {
              'success': false,
              'error': 'Unexpected response format from server',
              'page': page,
              'perPage': perPage,
              'statusCode': response.statusCode,
            };
          }
          
        case 401:
          logger.w('🔐 Unauthorized 401');
          final errorMessage = _extractErrorMessage(responseBody);
          return {
            'success': false,
            'error': errorMessage,
            'page': page,
            'perPage': perPage,
            'statusCode': 401,
          };
          
        case 400:
        case 403:
        case 404:
        case 422:
          logger.w('⚠️ Client Error ${response.statusCode}');
          final errorMessage = _extractErrorMessage(responseBody);
          return {
            'success': false,
            'error': errorMessage,
            'page': page,
            'perPage': perPage,
            'statusCode': response.statusCode,
          };
          
        case 500:
        case 502:
        case 503:
          logger.e('💥 Server Error ${response.statusCode}');
          final errorMessage = _extractErrorMessage(responseBody);
          return {
            'success': false,
            'error': errorMessage,
            'page': page,
            'perPage': perPage,
            'statusCode': response.statusCode,
          };
          
        default:
          logger.w('❓ Unexpected status code: ${response.statusCode}');
          final errorMessage = _extractErrorMessage(responseBody);
          return {
            'success': false,
            'error': errorMessage,
            'page': page,
            'perPage': perPage,
            'statusCode': response.statusCode,
          };
      }
      
    } on http.ClientException catch (e) {
      logger.e('❌ HTTP Client Exception: $e');
      return {
        'success': false,
        'error': 'Network error: ${e.message}',
        'page': page,
        'perPage': perPage,
        'statusCode': 0,
      };
    } on TimeoutException catch (e) {
      logger.e('⏰ Request timeout: $e');
      return {
        'success': false,
        'error': 'Request timeout. Please check your internet connection.',
        'page': page,
        'perPage': perPage,
        'statusCode': 0,
      };
    } catch (e) {
      logger.e('💥 Unexpected error in fetchWishlist: $e');
      return {
        'success': false,
        'error': 'Unexpected error: ${e.toString()}',
        'page': page,
        'perPage': perPage,
        'statusCode': 0,
      };
    }
  }
  
  /// Helper method to extract error message from different response formats
  String _extractErrorMessage(dynamic responseBody) {
    try {
      if (responseBody is String) {
        return responseBody;
      } else if (responseBody is Map) {
        return responseBody['message'] ?? 
               responseBody['error'] ?? 
               responseBody['detail'] ?? 
               'An error occurred';
      } else if (responseBody is List) {
        return responseBody.isNotEmpty ? responseBody.first.toString() : 'An error occurred';
      } else {
        return responseBody?.toString() ?? 'An error occurred';
      }
    } catch (e) {
      return 'Failed to extract error message';
    }
  }
}

/// Response model for wishlist operations
class WishlistResponse {
  final bool success;
  final String message;
  final dynamic data;
  
  WishlistResponse({
    required this.success,
    required this.message,
    required this.data,
  });
  
  factory WishlistResponse.fromJson(Map<String, dynamic> json) {
    return WishlistResponse(
      success: json['success'] ?? false,
      message: json['message'] ?? '',
      data: json['data'],
    );
  }
  
  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
      'data': data,
    };
  }
  
  @override
  String toString() {
    return 'WishlistResponse(success: $success, message: $message, data: $data)';
  }
}