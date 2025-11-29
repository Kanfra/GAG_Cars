import 'dart:convert';
import 'package:gag_cars_frontend/Pages/Authentication/Services/authService.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Models/userDetailsModel.dart';
import 'package:gag_cars_frontend/Utils/ApiUtils/apiUtils.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class UserDetailsService {
  final logger = Logger();
  
  /// Fetches user details by user ID
  /// Returns a map with:
  /// - 'user': UserDetails object (if status 200)
  /// - 'verified': bool (if status 200)
  /// - 'verified_dealer': bool (if status 200)
  /// - 'message': String (for error messages)
  /// - 'success': bool (indicating if request was successful)
  Future<Map<String, dynamic>> getUserDetails(String userId) async {
    final uri = Uri.parse('$baseApiUrl/user/$userId/details');
    logger.w('🔍 [SERVICE START] Fetching user details for: $userId');
    
    try {
      final token = await AuthService.getToken();
      logger.i('Token: $token');
      
      final response = await http.get(
        uri,
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ).timeout(const Duration(seconds: 30));

      logger.i('Response status: ${response.statusCode}');
      logger.i('Response body: ${response.body}');

      // Handle different status codes
      switch (response.statusCode) {
        case 200:
          final jsonResponse = json.decode(response.body);
          logger.i('📦 [SERVICE] Full JSON Response: $jsonResponse');
          
          // FIXED: Check if 'user' exists and is not null (not 'data')
          if (jsonResponse['user'] == null) {
            logger.e('❌ [SERVICE] User field is null in response');
            return {
              'message': 'User data not found in response',
              'success': false,
            };
          }

          // FIXED: Use 'user' key instead of 'data'
          try {
            final userJson = jsonResponse['user'] as Map<String, dynamic>;
            
            // 🔍 COMPREHENSIVE DEBUGGING: Check raw JSON data
            logger.w('🔍 [SERVICE DEBUG] Raw user JSON: $userJson');
            logger.w('🔍 [SERVICE DEBUG] items_count from raw JSON: ${userJson['items_count']}');
            logger.w('🔍 [SERVICE DEBUG] Type of items_count: ${userJson['items_count']?.runtimeType}');
            logger.w('🔍 [SERVICE DEBUG] Has items_count key: ${userJson.containsKey('items_count')}');
            
            // Check all keys in user JSON for reference
            logger.w('🔍 [SERVICE DEBUG] All user JSON keys: ${userJson.keys.toList()}');
            
            final userDetails = UserDetails.fromJson(userJson);
            
            // 🔍 COMPREHENSIVE DEBUGGING: Check parsed result
            logger.w('🔍 [SERVICE DEBUG] Parsed UserDetails object: $userDetails');
            logger.w('🔍 [SERVICE DEBUG] Parsed itemsCount: ${userDetails.itemsCount}');
            logger.w('🔍 [SERVICE DEBUG] Parsed itemsCount type: ${userDetails.itemsCount?.runtimeType}');
            logger.w('🔍 [SERVICE DEBUG] Parsed user ID: ${userDetails.id}');
            
            // Extract verification status
            final verified = jsonResponse['verified'] ?? false;
            final verifiedDealer = jsonResponse['verified_dealer'] ?? false;
            
            logger.w('✅ [SERVICE SUCCESS] User details parsed successfully');
            logger.w('🔍 [SERVICE DEBUG] Verification - verified: $verified, verified_dealer: $verifiedDealer');
            logger.w('🔍 [SERVICE DEBUG] Final itemsCount being returned: ${userDetails.itemsCount}');

            return {
              'user': userDetails,
              'verified': verified,
              'verified_dealer': verifiedDealer,
              'success': true,
            };
          } catch (e) {
            logger.e('❌ [SERVICE ERROR] Error parsing user details: $e');
            logger.e('❌ [SERVICE ERROR] Stack trace: ${e.toString()}');
            return {
              'message': 'Failed to parse user data: $e',
              'success': false,
            };
          }

        case 401:
          try {
            final errorResponse = json.decode(response.body);
            logger.e('❌ [SERVICE] 401 Error: ${errorResponse['message']}');
            return {
              'message': errorResponse['message'] ?? 'Unauthorized access',
              'success': false,
            };
          } catch (e) {
            logger.e('❌ [SERVICE] 401 Error parsing failed: $e');
            return {
              'message': 'Unauthorized access',
              'success': false,
            };
          }

        case 404:
          try {
            final errorResponse = json.decode(response.body);
            logger.e('❌ [SERVICE] 404 Error: ${errorResponse['message']}');
            return {
              'message': errorResponse['message'] ?? 'User not found',
              'success': false,
            };
          } catch (e) {
            logger.e('❌ [SERVICE] 404 Error parsing failed: $e');
            return {
              'message': 'User not found',
              'success': false,
            };
          }

        default:
          logger.e('❌ [SERVICE] Unexpected status code: ${response.statusCode}');
          return {
            'message': 'Unexpected error occurred. Status code: ${response.statusCode}',
            'success': false,
          };
      }
    } on http.ClientException catch (e) {
      logger.e('❌ [SERVICE] Network error: ${e.message}');
      return {
        'message': 'Network error: ${e.message}',
        'success': false,
      };
    } on FormatException catch (e) {
      logger.e('❌ [SERVICE] Data parsing error: ${e.message}');
      return {
        'message': 'Data parsing error: ${e.message}',
        'success': false,
      };
    } catch (e) {
      logger.e('❌ [SERVICE] An unexpected error occurred: $e');
      return {
        'message': 'An unexpected error occurred: $e',
        'success': false,
      };
    } finally {
      logger.w('🔍 [SERVICE END] getUserDetails completed for: $userId');
    }
  }
}