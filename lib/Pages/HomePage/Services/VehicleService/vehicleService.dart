import 'dart:io';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Models/itemsModel.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Services/VehicleService/cloudinaryService.dart';
import 'package:gag_cars_frontend/Utils/ApiUtils/apiEnpoints.dart';
import 'package:gag_cars_frontend/Utils/ApiUtils/apiUtils.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'dart:convert';

import 'package:logger/logger.dart';

class VehicleService {
  static const storage = FlutterSecureStorage();

  static Future<void> uploadVehicle({
    required Map<String?, dynamic> requestBody,
  }) async {
    final logger = Logger();
    try {
      // Get auth token from secure storage
      final token = await storage.read(key: 'auth_token');
      final uri = Uri.parse('$baseApiUrl${ApiEndpoint.items}');
      logger.i("Uri: $uri");
      if (requestBody["images"].isEmpty) {
        logger.e("At least 1 image is required");
        throw Exception('At least 1 image is required');
      }

      final List<File> files = (requestBody["images"] as List<File>);
      
      final uploadedImageUrls = await CloudinaryService.uploadImages(files);

      if (uploadedImageUrls.isEmpty) {
        logger.e("Image upload failed: No URLs returned");
        throw Exception('Image upload failed: No URLs returned');
      }
       logger.i("Successful: $uploadedImageUrls");
      requestBody["images"] = uploadedImageUrls;
      logger.i('Request body structure before api request: $requestBody');
      final response = await http.post(
        uri,
        headers: {
          'Content-Type': 'application/json',
          if (token != null) 'Authorization': 'Bearer $token',
          },
        body: jsonEncode(requestBody),
      );

      // if(response.statusCode == 302){
      //   final redirectUrl = response.headers['location'];
      //   throw Exception(
      //     '''
      //     API redirected to: $redirectUrl
      //     Possible issues: 
      //     1. Incorrect API endpoint
      //     2. Authentication problem
      //     3. Server misconfiguration
      //     '''
      //   );
      // }

      if (response.statusCode != 200 && response.statusCode != 201) {
        throw Exception('Failed to upload vehicle (${response.statusCode}): ${response.body}');
      }
      logger.i("Vehicle uploaded successfully");
    } catch (e) {
      logger.e("❌ Error uploading vehicle: $e");
      rethrow;
    }
  }
}
