import 'dart:convert';
import 'package:gag_cars_frontend/Pages/Authentication/Services/authService.dart';
import 'package:gag_cars_frontend/Pages/PaymentPage/Models/packageModel.dart';
import 'package:gag_cars_frontend/Utils/ApiUtils/apiEnpoints.dart';
import 'package:gag_cars_frontend/Utils/ApiUtils/apiUtils.dart';
import 'package:http/http.dart' as http;
import 'package:logger/Logger.dart';

class PackageService {
  final logger = Logger();
  
  Future<List<Package>> getPackages({
    required int categoryId
  }) async {
    final uri = Uri.parse('$baseApiUrl${ApiEndpoint.packagesByCategory}/$categoryId');
    
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
      logger.i("📦 Response Body: ${response.body}"); // ADDED: Log the actual response

      if (response.statusCode == 200) {
        logger.i("✅ Success: Received 200 OK");
        
        try {
          final jsonResponse = json.decode(response.body);
          logger.i("✅ JSON decoded successfully");
          logger.i("📊 Response Type: ${jsonResponse.runtimeType}");
          
          // ✅ Direct array parsing - no wrapper object
          if (jsonResponse is List) {
            logger.i("🔄 Processing ${jsonResponse.length} packages");
            
            final packages = <Package>[];
            for (var i = 0; i < jsonResponse.length; i++) {
              try {
                final item = jsonResponse[i] as Map<String, dynamic>;
                logger.i("📦 Package $i: ${item.keys}");
                
                // Check if country exists in response
                if (!item.containsKey('country')) {
                  logger.w("⚠️ Package $i missing 'country' object, only has country_id: ${item['country_id']}");
                }
                
                final package = Package.fromJson(item);
                packages.add(package);
              } catch (e) {
                logger.e("❌ Error parsing package $i: $e");
                rethrow;
              }
            }
            
            logger.i("✅ Successfully parsed ${packages.length} packages");
            return packages;
          } else {
            logger.e("❌ Expected List but got: ${jsonResponse.runtimeType}");
            throw Exception('Invalid response format: Expected array');
          }
          
        } catch (jsonError) {
          logger.e("❌ JSON Decoding Error: $jsonError");
          logger.e("❌ Response body that caused error: ${response.body}");
          throw Exception('JSON parsing error: $jsonError');
        }
        
      } else {
        logger.e("❌ HTTP Error: ${response.statusCode}");
        logger.e("❌ Response body: ${response.body}");
        throw Exception('Failed to load packages: HTTP ${response.statusCode}');
      }
      
    } catch (e) {
      logger.e("❌ Unexpected error: $e");
      throw Exception('Network error: $e');
    }
  }
}