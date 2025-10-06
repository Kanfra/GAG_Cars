// lib/Services/change_password_service.dart

import 'dart:convert';
import 'package:gag_cars_frontend/Pages/Authentication/Services/authService.dart';
import 'package:gag_cars_frontend/Utils/ApiUtils/apiEnpoints.dart';
import 'package:gag_cars_frontend/Utils/ApiUtils/apiUtils.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class ChangePasswordService {
  
  static Future<Map<String, dynamic>> changePassword({
    required String oldPassword,
    required String newPassword,
  }) async {
    final logger = Logger();
    final uri =  Uri.parse('$baseApiUrl${ApiEndpoint.changePassword}');
    try {
      final token = await AuthService.getToken();
      final response = await http.post(
        uri,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
        },
        body: json.encode({
          'old_password': oldPassword,
          'new_password': newPassword,
        }),
      );

      logger.w('Response status: ${response.statusCode}');
      logger.w('Response body: ${response.body}');

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        logger.i("Success: ${responseData['message'] ?? "Password changed successfully"}");
        return {
          'success': true,
          'message': responseData['message'] ?? 'Password changed successfully',
        };
      } else {
        final errorData = json.decode(response.body);
        logger.e("Failed: ${errorData['message'] ?? "Failed to change password. Please try again."}");
        return {
          'success': false,
          'message': errorData['message'] ?? 'Failed to change password. Please try again.',
        };
      }
    } catch (e) {
      print('Error changing password: $e');
      return {
        'success': false,
        'message': 'Network error. Please check your connection and try again.',
      };
    }
  }
}