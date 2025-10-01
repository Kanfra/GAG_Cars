import 'dart:convert';
import 'package:gag_cars_frontend/Pages/Authentication/Services/authService.dart';
import 'package:gag_cars_frontend/Utils/ApiUtils/apiEnpoints.dart';
import 'package:gag_cars_frontend/Utils/ApiUtils/apiUtils.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class CanUploadItemService {
  final logger = Logger();
  Future<Map<String, dynamic>> checkCanUpload({required String categorySlug}) async {
    final uri = Uri.parse("$baseApiUrl${ApiEndpoint.canUpload}");
    try {
      final token = await AuthService.getToken();
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

      if (response.statusCode == 200) {
        logger.i("Success: ${response.body}");
        // Success - return the response data
        return jsonDecode(response.body);
      } else if (response.statusCode == 401) {
        // Unauthorized - throw specific exception
        throw Exception('Unauthorized: Invalid or expired token');
      } else {
        // Handle any unexpected status codes
        throw Exception('Unexpected error: ${response.statusCode}');
      }
    } catch (e) {
      logger.e("Upload check failed: $e");
      // Re-throw the exception with more context
      throw Exception('Upload check failed: $e');
    }
  }
}