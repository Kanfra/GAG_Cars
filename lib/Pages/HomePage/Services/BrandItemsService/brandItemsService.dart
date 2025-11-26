import 'dart:async';
import 'dart:convert';
import 'package:gag_cars_frontend/Pages/Authentication/Services/authService.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Models/brandItemsModel.dart';
import 'package:gag_cars_frontend/Utils/ApiUtils/apiEnpoints.dart';
import 'package:gag_cars_frontend/Utils/ApiUtils/apiUtils.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class BrandItemsService {
  static final Logger _logger = Logger();

  /// Fetches items by brand ID
  static Future<List<BrandItem>> getItemsByBrand({
    required int brandId,
  }) async {
    _logger.i('🚀 [SERVICE] Starting API call - brandId: $brandId');
    
    try {
      _logger.w("Brand id: $brandId");
      
      // Get token
      final token = await AuthService.getToken();
      _logger.i('🔐 [SERVICE] Token obtained: ${token != null ? "YES" : "NO"}');

      // Construct URL
      final endpointPath = '${ApiEndpoint.brandItems}/$brandId';
      final fullUrl = '$baseApiUrl$endpointPath';
      final uri = Uri.parse(fullUrl);

      _logger.i('🔗 [SERVICE] Full URL: $fullUrl');

      // Make HTTP request
      _logger.i('📤 [SERVICE] Making GET request...');
      final response = await http.get(
        uri,
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ).timeout(const Duration(seconds: 30));

      _logger.i('📥 [SERVICE] Response status: ${response.statusCode}');
      _logger.i('📦 [SERVICE] Response body length: ${response.body.length}');

      // Handle response
      if (response.statusCode == 200) {
        _logger.i('✅ [SERVICE] Request successful (200)');
        
        // First, let's see what we're actually getting
        final dynamic jsonData = json.decode(response.body);
        _logger.i('🔍 [SERVICE] Response type: ${jsonData.runtimeType}');
        
        if (jsonData is Map<String, dynamic>) {
          _logger.i('🔍 [SERVICE] Response keys: ${jsonData.keys.join(', ')}');
        }
        
        return _parseResponse(jsonData);
      } else {
        _logger.e('❌ [SERVICE] HTTP Error ${response.statusCode}');
        final errorMessage = _handleError(response.statusCode, response.body);
        _logger.e('💥 [SERVICE] Error message: $errorMessage');
        throw errorMessage;
      }
    } on http.ClientException catch (e) {
      _logger.e('🌐 [SERVICE] Network/Client exception: ${e.message}');
      throw NetworkException('Network error: ${e.message}');
    } on FormatException catch (e) {
      _logger.e('📝 [SERVICE] Format exception: ${e.message}');
      throw DataParsingException('Invalid response format: ${e.message}');
    } on TimeoutException catch (e) {
      _logger.e('⏰ [SERVICE] Timeout exception: ${e.message}');
      throw NetworkException('Request timeout: ${e.message}');
    } catch (e) {
      _logger.e('💥 [SERVICE] Unexpected error: $e');
      _logger.e('📋 [SERVICE] Error type: ${e.runtimeType}');
      throw UnknownException('An unexpected error occurred: $e');
    }
  }

  /// Parse the API response and extract BrandItems
  static List<BrandItem> _parseResponse(dynamic jsonData) {
    try {
      // Case 1: Direct array of items
      if (jsonData is List) {
        _logger.i('📋 [SERVICE] API returned direct array with ${jsonData.length} items');
        return _parseItemsList(jsonData);
      }
      
      // Case 2: Paginated response with data key
      if (jsonData is Map<String, dynamic>) {
        // Try common pagination keys
        final List<dynamic>? itemsList = _extractItemsFromMap(jsonData);
        
        if (itemsList != null) {
          _logger.i('📋 [SERVICE] Found items list with ${itemsList.length} items');
          return _parseItemsList(itemsList);
        }
        
        // If no items found in common keys, check if it's a single item
        _logger.i('🔍 [SERVICE] No items list found in response. Checking if single item...');
        try {
          // Use the converter for single item too
          final singleItem = _parseSingleItem(jsonData);
          _logger.i('✅ [SERVICE] Successfully parsed single item');
          return [singleItem];
        } catch (e) {
          _logger.e('❌ [SERVICE] Failed to parse as single item: $e');
          // Log the actual data that failed to parse
          _logger.e('📄 [SERVICE] Problematic data: $jsonData');
          throw DataParsingException('Could not parse API response. Expected array of items or single item.');
        }
      }
      
      // Case 3: Unexpected format
      _logger.e('❌ [SERVICE] Unexpected response format: ${jsonData.runtimeType}');
      throw DataParsingException('Unexpected API response format: ${jsonData.runtimeType}');
      
    } catch (e) {
      _logger.e('💥 [SERVICE] Error in _parseResponse: $e');
      rethrow;
    }
  }

  /// Parse a single item with enhanced error handling
  static BrandItem _parseSingleItem(Map<String, dynamic> itemData) {
    try {
      _logger.d('🔍 [SERVICE] Parsing single item with keys: ${itemData.keys.join(', ')}');
      
      // Debug each field before parsing
      _debugFields(itemData);
      
      // Use the converter
      return BrandItemConverter.fromJson(itemData);
    } catch (e, stackTrace) {
      _logger.e('❌ [SERVICE] Failed to parse single item: $e');
      _logger.e('📋 [SERVICE] Stack trace: $stackTrace');
      _logger.e('📄 [SERVICE] Problematic item data: $itemData');
      rethrow;
    }
  }

  /// Debug all fields to identify type mismatches
  static void _debugFields(Map<String, dynamic> itemData) {
    _logger.d('🔍 [SERVICE] Field-by-field inspection:');
    
    // Check all fields that might cause type issues
    const criticalFields = [
      'id', 'user_id', 'country_id', 'brand_model_id', 'brand_id', 
      'category_id', 'year', 'engine_capacity', 'number_of_passengers',
      'warranty', 'paid_seller', 'active_status', 'dark_mode'
    ];
    
    for (final field in criticalFields) {
      if (itemData.containsKey(field)) {
        final value = itemData[field];
        _logger.d('  $field: $value (type: ${value?.runtimeType})');
      }
    }
  }

  /// Extract items list from various possible map structures
  static List<dynamic>? _extractItemsFromMap(Map<String, dynamic> jsonData) {
    // Try common keys that might contain the items array
    const possibleItemKeys = ['data', 'items', 'vehicles', 'cars', 'results', 'content'];
    
    for (final key in possibleItemKeys) {
      if (jsonData.containsKey(key) && jsonData[key] is List) {
        _logger.i('✅ [SERVICE] Found items using key: "$key"');
        return jsonData[key] as List<dynamic>;
      }
    }
    
    // Also check if any key contains a list that might be our items
    for (final key in jsonData.keys) {
      if (jsonData[key] is List) {
        final list = jsonData[key] as List;
        if (list.isNotEmpty && list.first is Map<String, dynamic>) {
          // Check if the first item has expected vehicle fields
          final firstItem = list.first as Map<String, dynamic>;
          if (firstItem.containsKey('name') && firstItem.containsKey('price')) {
            _logger.i('✅ [SERVICE] Found items in key: "$key" (detected by content)');
            return list;
          }
        }
      }
    }
    
    return null;
  }

  /// Parse a list of items into BrandItem objects with enhanced error handling
  static List<BrandItem> _parseItemsList(List<dynamic> itemsList) {
    final List<BrandItem> items = [];
    int successCount = 0;
    int failureCount = 0;
    
    for (int i = 0; i < itemsList.length; i++) {
      try {
        final itemData = itemsList[i];
        
        if (itemData is Map<String, dynamic>) {
          // Debug the first item to see what we're working with
          if (i == 0) {
            _logger.d('🔍 [SERVICE] First item structure - keys: ${itemData.keys.join(', ')}');
            _debugFields(itemData);
          }
          
          // Use the converter for proper type handling
          final brandItem = BrandItemConverter.fromJson(itemData);
          items.add(brandItem);
          successCount++;
        } else {
          _logger.w('⚠️ [SERVICE] Item at index $i is not a Map: ${itemData.runtimeType}');
          failureCount++;
        }
      } catch (e, stackTrace) {
        _logger.e('❌ [SERVICE] Failed to parse item at index $i: $e');
        _logger.e('📋 [SERVICE] Stack trace: $stackTrace');
        _logger.e('📄 [SERVICE] Problematic item data: ${itemsList[i]}');
        failureCount++;
        // Continue with other items instead of failing completely
        continue;
      }
    }
    
    _logger.i('✅ [SERVICE] Successfully parsed $successCount out of ${itemsList.length} items. Failures: $failureCount');
    return items;
  }

  /// Alternative method that takes brand ID as string for flexibility
  static Future<List<BrandItem>> getItemsByBrandId({
    required String brandId,
  }) async {
    _logger.i('🚀 [SERVICE] Starting API call with string brandId: $brandId');
    
    try {
      final parsedBrandId = int.tryParse(brandId);
      if (parsedBrandId == null) {
        throw InvalidArgumentException('Invalid brand ID: $brandId');
      }
      
      return await getItemsByBrand(brandId: parsedBrandId);
    } on InvalidArgumentException {
      rethrow;
    } catch (e) {
      _logger.e('💥 [SERVICE] Error in getItemsByBrandId: $e');
      rethrow;
    }
  }
  
  /// Handles different HTTP status codes
  static String _handleError(int statusCode, String responseBody) {
    _logger.e('🔍 [SERVICE] Handling error - Status: $statusCode, Body: $responseBody');
    
    try {
      final jsonResponse = json.decode(responseBody);
      final message = jsonResponse['message']?.toString() ?? 
                     jsonResponse['error']?.toString() ?? 
                     responseBody;
      
      switch (statusCode) {
        case 400:
          return 'Bad request: $message';
        case 401:
          return 'Unauthorized - Please login again';
        case 403:
          return 'Forbidden - Access denied';
        case 404:
          return 'No vehicles found for this brand';
        case 422:
          return 'Validation error: $message';
        case 500:
          return 'Internal server error: $message';
        case 502:
          return 'Bad gateway - Please try again later';
        case 503:
          return 'Service unavailable';
        default:
          return 'HTTP error $statusCode: $message';
      }
    } catch (e) {
      // Fallback if response body is not JSON
      switch (statusCode) {
        case 400:
          return 'Bad request: $responseBody';
        case 401:
          return 'Unauthorized - Invalid token';
        case 403:
          return 'Forbidden - Access denied';
        case 404:
          return 'Brand not found or no vehicles available';
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
}

/// Custom exception classes
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

class InvalidArgumentException implements Exception {
  final String message;
  InvalidArgumentException(this.message);
  
  @override
  String toString() => 'InvalidArgumentException: $message';
}