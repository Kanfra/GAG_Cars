import 'dart:convert';
import 'package:gag_cars_frontend/Pages/Authentication/Services/authService.dart';
import 'package:gag_cars_frontend/Pages/ProfilePages/Models/faqModel.dart';
import 'package:gag_cars_frontend/Utils/ApiUtils/apiEnpoints.dart';
import 'package:gag_cars_frontend/Utils/ApiUtils/apiUtils.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class FaqService {
  final logger = Logger();
  Future<FaqResponse> getFaqs() async {
    try {
      // Get token from AuthService
      final token = await AuthService.getToken();
      
      final response = await http.get(
        Uri.parse('$baseApiUrl${ApiEndpoint.faqs}'),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        logger.i("Faqs sent successfully: $responseData");
        return FaqResponse.fromJson(responseData);
      } else if (response.statusCode == 401) {
        throw Exception('Unauthorized: Invalid or expired token');
      } else {
        throw Exception('Failed to load FAQs. Status: ${response.statusCode}');
      }
    } catch (e) {
      logger.e("Failed to fetch FAQs: $e");
      throw Exception('Failed to fetch FAQs: $e');
    }
  }
}