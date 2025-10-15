import 'dart:convert';
import 'package:gag_cars_frontend/Pages/Authentication/Services/authService.dart';
import 'package:gag_cars_frontend/Pages/PaymentPage/Models/packageModel.dart';
import 'package:gag_cars_frontend/Utils/ApiUtils/apiEnpoints.dart';
import 'package:gag_cars_frontend/Utils/ApiUtils/apiUtils.dart';
import 'package:http/http.dart' as http;
import 'package:logger/Logger.dart';

class PackageService {
  final logger = Logger();
  
  Future<PackageResponse> getPackages() async {
    final uri = Uri.parse('$baseApiUrl${ApiEndpoint.packages}');
    
    logger.i("🔄 Starting package fetch from: $uri");
    
    try {
      final token = await AuthService.getToken();
      logger.i("📝 Token retrieved: ${token != null ? 'Yes' : 'No'}");
      
      final response = await http.get(
        uri,
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );

      logger.i("📡 HTTP Response Status: ${response.statusCode}");

      if (response.statusCode == 200) {
        logger.i("✅ Success: Received 200 OK");
        
        try {
          final jsonResponse = json.decode(response.body);
          logger.i("✅ JSON decoded successfully");
          
          // ✅ CRITICAL: Use the original JSON response directly
          // DO NOT convert prices - let the freezed model handle the String prices
          logger.i("🔄 Parsing response with freezed models...");
          final packageResponse = PackageResponse.fromJson(jsonResponse);
          
          logger.i("✅ Successfully parsed ${packageResponse.data.length} packages");
          return packageResponse;
          
        } catch (jsonError) {
          logger.e("❌ JSON Decoding Error: $jsonError");
          throw Exception('JSON parsing error: $jsonError');
        }
        
      } else {
        logger.e("❌ HTTP Error: ${response.statusCode}");
        throw Exception('Failed to load packages: HTTP ${response.statusCode}');
      }
      
    } catch (e) {
      logger.e("❌ Unexpected error: $e");
      throw Exception('Network error: $e');
    }
  }

  // ✅ REMOVED: All price conversion methods (_convertPriceStringsToDoubles, _convertPackagePrices)
}