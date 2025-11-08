import 'dart:convert';
import 'package:gag_cars_frontend/Pages/Authentication/Services/authService.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Models/userListingsModel.dart';
import 'package:gag_cars_frontend/Utils/ApiUtils/apiUtils.dart';
import 'package:http/http.dart' as http;
import 'package:logger/Logger.dart';

class UserListingsService {
  final logger = Logger();
  
  // Get user listings with optional limit and offset for lazy loading
  Future<ApiResponse<ListingResponse>> getUserListings(
    String userId, {
    int? limit,
    int? offset,
  }) async {
    try {
      // Build URL with optional limit and offset parameters
      final baseUrl = '$baseApiUrl/user/$userId/listings';
      final params = <String>[];
      
      if (limit != null) {
        params.add('limit=$limit');
      }
      if (offset != null) {
        params.add('offset=$offset');
      }
      
      final urlString = params.isEmpty ? baseUrl : '$baseUrl?${params.join('&')}';
      final url = Uri.parse(urlString);
      
      logger.w('🔗 URL: $url');
      final token = await AuthService.getToken();
      logger.w('🔑 Token: $token');
      
      final response = await http.get(
        url,
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );

      logger.w('📡 Response received, status: ${response.statusCode}');
      return _handleResponse(response);
    } catch (e) {
      logger.e('💥 Network error: $e');
      return ApiResponse.error('Network error: $e');
    }
  }

  /// Handles the HTTP response and converts it to ApiResponse
  ApiResponse<ListingResponse> _handleResponse(http.Response response) {
    logger.w('📊 Response Status: ${response.statusCode}');
    
    switch (response.statusCode) {
      case 200:
        try {
          final jsonData = jsonDecode(response.body);
          logger.w('✅ Full API Response received successfully');
          logger.w('📦 Response structure keys: ${jsonData.keys.toList()}');
          
          // Check if data field exists and is a list
          if (jsonData['data'] is! List) {
            logger.e('❌ Data field is not a list. Actual type: ${jsonData['data']?.runtimeType}');
            logger.e('📋 Data content: ${jsonData['data']}');
            return ApiResponse.error('Invalid response format: data is not a list');
          }
          
          final listingsData = jsonData['data'] as List;
          logger.w('📊 Total listings in response: ${listingsData.length}');
          
          if (listingsData.isEmpty) {
            logger.w('ℹ️ No listings found in response');
            final listingResponse = ListingResponse(data: []);
            return ApiResponse.success(listingResponse);
          }
          
          // Debug each listing individually to find the problematic one
          List<Listing> parsedListings = [];
          
          for (int i = 0; i < listingsData.length; i++) {
            try {
              logger.w('🔄 Processing listing $i/${listingsData.length}');
              
              if (listingsData[i] is! Map<String, dynamic>) {
                logger.e('❌ Listing $i is not a Map, it\'s: ${listingsData[i].runtimeType}');
                continue;
              }
              
              final listingJson = listingsData[i] as Map<String, dynamic>;
              
              // Log key fields to identify the listing
              logger.w('   📝 Listing $i - ID: ${listingJson['id']}');
              logger.w('   📝 Listing $i - Name: ${listingJson['name']}');
              
              // Debug the listing fields before parsing
              _debugListingFields(listingJson, i);
              
              // Try to parse the listing - this will throw on the problematic field
              final listing = Listing.fromJson(listingJson);
              parsedListings.add(listing);
              logger.w('   ✅ Listing $i parsed successfully');
              
            } catch (e, stackTrace) {
              logger.e('❌ ERROR parsing listing $i: $e');
              logger.e('📋 Problematic listing data: ${listingsData[i]}');
              logger.e('🔍 Stack trace: $stackTrace');
              
              // Let's check each field individually to find the null one
              _debugAllListingFields(listingsData[i] as Map<String, dynamic>, i);
              
              return ApiResponse.error('Failed to parse listing $i. Field is null but required. Error: $e');
            }
          }
          
          // If we get here, all listings parsed successfully
          final listingResponse = ListingResponse(data: parsedListings);
          logger.i('🎉 Success - ${listingResponse.data.length} listings parsed successfully');
          return ApiResponse.success(listingResponse);
          
        } catch (e, stackTrace) {
          logger.e('💥 Failed to parse response: $e');
          logger.e('📋 Full error details: $stackTrace');
          logger.e('🔍 Response body: ${response.body}');
          return ApiResponse.error('Failed to parse response: $e');
        }

      case 401:
        // Unauthorized - try to parse error message
        try {
          final jsonData = jsonDecode(response.body);
          final errorResponse = ErrorResponse.fromJson(jsonData);
          final message = errorResponse.message ?? 
                         errorResponse.errorDescription ?? 
                         'Unauthorized access';
          logger.e('🔐 Unauthorized access: $message');
          return ApiResponse.unauthorized(message);
        } catch (e) {
          logger.e('🔐 Unauthorized access parsing error: $e');
          return ApiResponse.unauthorized('Unauthorized access');
        }

      case 404:
        // Not Found - try to parse error message
        try {
          final jsonData = jsonDecode(response.body);
          final errorResponse = ErrorResponse.fromJson(jsonData);
          final message = errorResponse.message ?? 'User listings not found';
          logger.e('🔍 User listings not found: $message');
          return ApiResponse.notFound(message);
        } catch (e) {
          logger.e('🔍 User listings not found parsing error: $e');
          return ApiResponse.notFound('User listings not found');
        }

      default:
        // Other error responses
        try {
          final jsonData = jsonDecode(response.body);
          final errorResponse = ErrorResponse.fromJson(jsonData);
          final message = errorResponse.message ?? 
                         'Request failed with status: ${response.statusCode}';
          logger.e('❌ Request failed with status: ${response.statusCode}');
          return ApiResponse.error(message);
        } catch (e) {
          logger.e('❌ Request failed with status: ${response.statusCode}');
          return ApiResponse.error('Request failed with status: ${response.statusCode}');
        }
    }
  }

  /// Helper method to debug key fields in a listing
  void _debugListingFields(Map<String, dynamic> listingJson, int index) {
    logger.w('   🔍 Debugging key fields for listing $index:');
    
    // Check all fields that are commonly problematic
    final keyFields = [
      'id', 'user_id', 'name', 'year', 'slug', 'description',
      'images', 'location', 'steer_position', 'price',
      'category', 'created_at', 'updated_at', 'is_promoted'
    ];
    
    for (var field in keyFields) {
      final value = listingJson[field];
      final isNull = value == null;
      logger.w('      $field: $value ${isNull ? '❌ NULL!' : '✅'} (type: ${value?.runtimeType})');
    }
  }

  /// Helper method to debug ALL fields in a listing
  void _debugAllListingFields(Map<String, dynamic> listingJson, int index) {
    logger.e('   🚨 COMPLETE FIELD ANALYSIS for listing $index:');
    logger.e('   ==========================================');
    
    listingJson.forEach((key, value) {
      final isNull = value == null;
      logger.e('      $key: $value ${isNull ? '❌ NULL!' : '✅'} (type: ${value?.runtimeType})');
    });
    
    logger.e('   ==========================================');
    
    // Specifically check for missing required fields
    final requiredFields = ['id', 'name', 'price', 'location'];
    for (var field in requiredFields) {
      if (!listingJson.containsKey(field) || listingJson[field] == null) {
        logger.e('   🚨 MISSING REQUIRED FIELD: $field');
      }
    }
  }
}