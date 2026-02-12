import 'dart:convert';
import 'package:gag_cars_frontend/Pages/Authentication/Services/authService.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Models/broadcastModel.dart';
import 'package:gag_cars_frontend/Utils/ApiUtils/apiEnpoints.dart';
import 'package:gag_cars_frontend/Utils/ApiUtils/apiUtils.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class BroadcastService {
  static final Logger logger = Logger();

  // Get all broadcasts with pagination
  Future<BroadcastResponseModel> getBroadcasts({int page = 1}) async {
    try {
      // Get token
      final token = await AuthService.getToken();
      
      if (token == null) {
        logger.e("Token not found");
        throw Exception('Authentication token not found');
      }

      // Prepare headers with authentication token
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
        'Accept': 'application/json'
      };

      final endpoint = ApiEndpoint.broadcasts;
      final fullUrl = "$baseApiUrl$endpoint";
      final uri = Uri.parse(fullUrl);

      logger.w("Full URL: $fullUrl");
      logger.w("Headers: $headers");

      final response = await http.get(
        uri,
        headers: headers
      ).timeout(const Duration(seconds: 10));

      logger.i('Response status: ${response.statusCode}');
      logger.i('Response body length: ${response.body.length}');

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        return BroadcastResponseModel.fromJson(responseData);
      } else {
        throw Exception('Failed to load broadcasts: ${response.statusCode}');
      }
    } catch (e) {
      logger.e('Error fetching broadcasts: $e');
      throw Exception('Error fetching broadcasts: $e');
    }
  }
}
