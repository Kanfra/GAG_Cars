import 'dart:convert';
import 'dart:math';
import 'package:gag_cars_frontend/Pages/Authentication/Services/authService.dart';
import 'package:gag_cars_frontend/Utils/ApiUtils/apiEnpoints.dart';
import 'package:gag_cars_frontend/Utils/ApiUtils/apiUtils.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class CanUploadItemService {
  final logger = Logger();
  
  Future<Map<String, dynamic>> checkCanUpload({required String categorySlug}) async {
    logger.i("🟡 [CAN_UPLOAD_SERVICE] ===== STARTING UPLOAD CHECK =====");
    logger.i("🟡 [CAN_UPLOAD_SERVICE] Category: $categorySlug");
    
    final uri = Uri.parse("$baseApiUrl${ApiEndpoint.canUpload}");
    logger.i("🟡 [CAN_UPLOAD_SERVICE] API Endpoint: $uri");
    
    try {
      final token = await AuthService.getToken();
      
      if (token == null || token.isEmpty) {
        logger.e("🔴 [CAN_UPLOAD_SERVICE] No authentication token found");
        throw Exception('No authentication token found');
      }
      
      logger.i("🟡 [CAN_UPLOAD_SERVICE] Token validated, making API request...");
      
      final response = await http.post(
        uri,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({
          'category_slug': categorySlug,
        }),
      );

      logger.i("🟡 [CAN_UPLOAD_SERVICE] Response Status: ${response.statusCode}");
      // logger.i("🟡 [CAN_UPLOAD_SERVICE] Response Body: ${response.body}");
      
      // Check for HTML responses
      if (_isHtmlResponse(response.body)) {
        // logger.e("🔴 [CAN_UPLOAD_SERVICE] ⚠️ HTML ERROR PAGE RECEIVED ⚠️");
        // logger.e("🔴 [CAN_UPLOAD_SERVICE] HTML Preview: ${response.body.substring(0, min(200, response.body.length))}");
        throw Exception('Server returned HTML error page. Status: ${response.statusCode}');
      }
      
      logger.i("🟡 [CAN_UPLOAD_SERVICE] Response appears to be JSON, parsing...");

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        logger.i("🟡 [CAN_UPLOAD_SERVICE] Raw JSON Response: $responseData");
        
        // Validate response structure
        if (responseData is! Map) {
          // logger.e("🔴 [CAN_UPLOAD_SERVICE] ❌ Response is not a Map: ${responseData.runtimeType}");
          throw Exception('Invalid response format: expected Map');
        }
        
        // Convert to String keys for consistency
        final Map<String, dynamic> resultMap = {};
        responseData.forEach((key, value) {
          resultMap[key.toString()] = value;
        });
        
        logger.i("🟡 [CAN_UPLOAD_SERVICE] Response Keys: ${resultMap.keys.toList()}");
        
        // Check for required can_upload field
        if (!resultMap.containsKey('can_upload')) {
          logger.e("🔴 [CAN_UPLOAD_SERVICE] ❌ Missing 'can_upload' field in response");
          throw Exception('Invalid response: missing can_upload field');
        }
        
        // Parse can_upload value with type safety
        final dynamic canUploadValue = resultMap['can_upload'];
        final bool canUpload = _parseBoolean(canUploadValue);
        final String reason = resultMap['reason']?.toString() ?? 'No reason provided';
        
        logger.i("🟢 [CAN_UPLOAD_SERVICE] ✅ SUCCESS - Can Upload: $canUpload, Reason: $reason");
        
        return {
          'can_upload': canUpload,
          'reason': reason,
          'raw_response': resultMap
        };
        
      } else if (response.statusCode == 401) {
        // logger.e("🔴 [CAN_UPLOAD_SERVICE] Unauthorized (401) - Token may be expired");
        throw Exception('Unauthorized: Please login again');
        
      } else if (response.statusCode >= 400 && response.statusCode < 500) {
        // logger.e("🔴 [CAN_UPLOAD_SERVICE] Client Error (${response.statusCode})");
        try {
          final errorBody = jsonDecode(response.body);
          final errorMessage = errorBody is Map ? errorBody['message']?.toString() : errorBody.toString();
          throw Exception(errorMessage ?? 'Client error: ${response.statusCode}');
        } catch (e) {
          throw Exception('Client error: ${response.statusCode}');
        }
        
      } else if (response.statusCode >= 500) {
        // logger.e("🔴 [CAN_UPLOAD_SERVICE] Server Error (${response.statusCode})");
        throw Exception('Server error: ${response.statusCode}');
        
      } else {
        // logger.w("🟡 [CAN_UPLOAD_SERVICE] Unexpected Status: ${response.statusCode}");
        throw Exception('Unexpected response: ${response.statusCode}');
      }
      
    } on http.ClientException catch (e) {
      // logger.e("🔴 [CAN_UPLOAD_SERVICE] Network Error: $e");
      throw Exception('Network error: Please check your connection');
    } on FormatException catch (e) {
      // logger.e("🔴 [CAN_UPLOAD_SERVICE] JSON Parse Error: $e");
      throw Exception('Invalid response format from server');
    } catch (e) {
      // logger.e("🔴 [CAN_UPLOAD_SERVICE] Unexpected Error: $e");
      rethrow;
    } finally {
      // logger.i("🟡 [CAN_UPLOAD_SERVICE] ===== UPLOAD CHECK COMPLETED =====");
    }
  }
  
  bool _parseBoolean(dynamic value) {
    if (value is bool) return value;
    if (value is String) return value.toLowerCase() == 'true';
    if (value is int) return value == 1;
    if (value is num) return value != 0;
    
    // logger.e("🔴 [CAN_UPLOAD_SERVICE] ❌ Cannot parse boolean from: $value (${value.runtimeType})");
    return false;
  }
  
  bool _isHtmlResponse(String body) {
    final trimmedBody = body.trim().toLowerCase();
    return trimmedBody.startsWith('<!doctype html') ||
           trimmedBody.startsWith('<html') ||
           trimmedBody.contains('x-data') ||
           trimmedBody.contains('x-cloak') ||
           trimmedBody.contains('alpine.js') ||
           trimmedBody.contains('laravel') ||
           (trimmedBody.contains('<') && trimmedBody.contains('>') && body.length > 1000);
  }
}