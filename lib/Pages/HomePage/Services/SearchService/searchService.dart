import 'dart:convert';
import 'package:gag_cars_frontend/Pages/Authentication/Services/authService.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Models/searchItemModel.dart';
import 'package:gag_cars_frontend/Utils/ApiUtils/apiEnpoints.dart';
import 'package:gag_cars_frontend/Utils/ApiUtils/apiUtils.dart';
import 'package:http/http.dart' as http;
import 'package:logger/Logger.dart';

class SearchService {
  static Future<List<SearchItem>> searchItems(String query) async {
    final logger = Logger();
    try {
      final token = await AuthService.getToken();
      if (token == null || token.isEmpty) {
        logger.e("❌ No token found");
        throw Exception('Please login to search');
      }

      logger.i("🎯 ========== SEARCH REQUEST START ==========");
      logger.i("🔍 SEARCH QUERY: '$query'");
      
      // POST request with query parameters in URL (not in body)
      final uri = Uri.parse('$baseApiUrl${ApiEndpoint.searchItems}').replace(
        queryParameters: {'query': query},
      );
      
      logger.i("📡 FULL URL: $uri");
      logger.i("🎯 METHOD: POST with query parameters");
      logger.i("🔑 TOKEN: ${token.substring(0, 20)}...");

      final stopwatch = Stopwatch()..start();
      final response = await http.post(
        uri, // URL with query parameters
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        // Empty body since we're using query parameters
        body: jsonEncode({}),
      );
      stopwatch.stop();

      logger.i("⏱️  REQUEST TOOK: ${stopwatch.elapsedMilliseconds}ms");
      logger.i("📡 RESPONSE STATUS: ${response.statusCode}");

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        
        // Log the exact response structure
        logger.i("📊 RESPONSE TYPE: ${responseData.runtimeType}");
        if (responseData is Map) {
          logger.i("🗂️  RESPONSE KEYS: ${responseData.keys.join(', ')}");
        }
        
        // Handle both array and object responses
        List<dynamic> data;
        if (responseData is List) {
          data = responseData;
          logger.i("✅ RESPONSE: List with ${data.length} items");
        } else if (responseData is Map && responseData.containsKey('data')) {
          data = responseData['data'];
          logger.i("✅ RESPONSE: Map with 'data' key containing ${data.length} items");
        } else if (responseData is Map && responseData.containsKey('items')) {
          data = responseData['items'];
          logger.i("✅ RESPONSE: Map with 'items' key containing ${data.length} items");
        } else {
          data = [];
          logger.w("⚠️ UNEXPECTED RESPONSE FORMAT");
        }
        
        // CRITICAL: Log what we actually received vs what was searched
        logger.i("🎯 SEARCH ANALYSIS:");
        logger.i("   🔍 Searched for: '$query'");
        logger.i("   📦 Received: ${data.length} items");
        
        if (data.isNotEmpty) {
          // Check if the first item actually matches the search
          final firstItem = data.first;
          if (firstItem is Map) {
            final itemName = firstItem['name']?.toString() ?? 'No name';
            final itemId = firstItem['id']?.toString() ?? 'No ID';
            logger.i("   📋 First item: '$itemName' (ID: $itemId)");
            
            // Check if the search term appears in the first item
            final containsQuery = itemName.toLowerCase().contains(query.toLowerCase());
            logger.i("   ❓ Does first item contain '$query'? $containsQuery");
          }
        } else {
          logger.i("   ✅ No items found - search is working correctly!");
        }
        
        logger.i("========== SEARCH REQUEST END ==========");
        
        return _parseSearchItemsSafely(data, logger);
      }
      else {
        logger.e("❌ HTTP ERROR: ${response.statusCode}");
        logger.e("❌ RESPONSE BODY: ${response.body}");
        logger.i("========== SEARCH REQUEST END ==========");
        throw Exception('Search failed with status: ${response.statusCode}');
      }
    } catch (e) {
      logger.e('❌ SEARCH FAILED: $e');
      logger.i("========== SEARCH REQUEST END ==========");
      rethrow;
    }
  }

  // ... keep all the parsing helper methods the same as before
  static List<SearchItem> _parseSearchItemsSafely(List<dynamic> data, Logger logger) {
    final List<SearchItem> items = [];
    
    for (var item in data) {
      try {
        if (item is Map<String, dynamic>) {
          final parsedItem = _parseSingleItemSafely(item);
          items.add(parsedItem);
        }
      } catch (e) {
        logger.e('❌ Failed to parse search item: $e');
      }
    }
    
    return items;
  }

  static SearchItem _parseSingleItemSafely(Map<String, dynamic> json) {
    final safeJson = Map<String, dynamic>.from(json);
    
    _convertFieldToInt(safeJson, 'country_id');
    _convertFieldToInt(safeJson, 'brand_model_id');
    _convertFieldToInt(safeJson, 'brand_id');
    _convertFieldToInt(safeJson, 'category_id');
    _convertFieldToInt(safeJson, 'number_of_passengers');
    _convertFieldToInt(safeJson, 'warranty');
    
    _convertToList(safeJson, 'images');
    _convertToList(safeJson, 'features');
    
    _convertFieldToString(safeJson, 'user_id');
    _convertFieldToString(safeJson, 'name');
    _convertFieldToString(safeJson, 'year');
    _convertFieldToString(safeJson, 'slug');
    _convertFieldToString(safeJson, 'description');
    _convertFieldToString(safeJson, 'location');
    _convertFieldToString(safeJson, 'serial_number');
    _convertFieldToString(safeJson, 'condition');
    _convertFieldToString(safeJson, 'steer_position');
    _convertFieldToString(safeJson, 'engine_capacity');
    _convertFieldToString(safeJson, 'transmission');
    _convertFieldToString(safeJson, 'color');
    _convertFieldToString(safeJson, 'build_type');
    _convertFieldToString(safeJson, 'status');
    _convertFieldToString(safeJson, 'price');
    _convertFieldToString(safeJson, 'mileage');
    _convertFieldToString(safeJson, 'warranty_expiration');
    _convertFieldToString(safeJson, 'deleted_at');
    _convertFieldToString(safeJson, 'created_at');
    _convertFieldToString(safeJson, 'updated_at');
    _convertFieldToString(safeJson, 'Height');
    _convertFieldToString(safeJson, 'VIN');
    
    return SearchItem.fromJson(safeJson);
  }

  static void _convertFieldToInt(Map<String, dynamic> json, String fieldName) {
    if (json.containsKey(fieldName) && json[fieldName] != null) {
      try {
        if (json[fieldName] is String) {
          json[fieldName] = int.tryParse(json[fieldName]);
        } else if (json[fieldName] is num) {
          json[fieldName] = (json[fieldName] as num).toInt();
        }
      } catch (e) {
        json[fieldName] = null;
      }
    }
  }

  static void _convertFieldToString(Map<String, dynamic> json, String fieldName) {
    if (json.containsKey(fieldName) && json[fieldName] != null) {
      try {
        json[fieldName] = json[fieldName].toString();
      } catch (e) {
        json[fieldName] = null;
      }
    }
  }

  static void _convertToList(Map<String, dynamic> json, String fieldName) {
    if (json.containsKey(fieldName) && json[fieldName] != null) {
      try {
        if (json[fieldName] is String) {
          final parsed = jsonDecode(json[fieldName]);
          if (parsed is List) {
            json[fieldName] = List<String>.from(parsed.map((e) => e.toString()));
          } else {
            json[fieldName] = [json[fieldName].toString()];
          }
        } else if (json[fieldName] is List) {
          json[fieldName] = List<String>.from(
            (json[fieldName] as List).map((e) => e.toString())
          );
        }
      } catch (e) {
        if (json[fieldName] is String) {
          json[fieldName] = [json[fieldName].toString()];
        } else {
          json[fieldName] = [];
        }
      }
    } else {
      json[fieldName] = [];
    }
  }
}