import 'dart:convert';
import 'package:gag_cars_frontend/Pages/Authentication/Services/authService.dart';
import 'package:gag_cars_frontend/Pages/PaymentPage/Models/packageModel.dart';
import 'package:gag_cars_frontend/Utils/ApiUtils/apiEnpoints.dart';
import 'package:gag_cars_frontend/Utils/ApiUtils/apiUtils.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class PackageService {
  final logger = Logger();
  Future<PackageResponse> getPackages() async {
    final uri = Uri.parse('$baseApiUrl${ApiEndpoint.packages}');
    try {
      final token = await AuthService.getToken();
      final response = await http.get(
        uri,
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        logger.i("Success: $jsonResponse");
        return PackageResponse.fromJson(jsonResponse);
      } else if (response.statusCode == 401) {
        throw Exception('Unauthorized: Invalid token');
      } else {
        throw Exception('Failed to load packages: ${response.statusCode}');
      }
    } catch (e) {
      logger.e("Network error: $e");
      throw Exception('Network error: $e');
    }
  }
}