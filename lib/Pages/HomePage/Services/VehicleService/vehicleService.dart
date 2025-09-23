import 'dart:io';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gag_cars_frontend/Pages/Authentication/Services/authService.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Models/itemsModel.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Services/VehicleService/cloudinaryService.dart';
import 'package:gag_cars_frontend/Utils/ApiUtils/apiEnpoints.dart';
import 'package:gag_cars_frontend/Utils/ApiUtils/apiUtils.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'dart:convert';

import 'package:logger/logger.dart';

class VehicleService {
  static final logger = Logger();

static Future<void> uploadVehicle({
  required Map<String?, dynamic> requestBody,
}) async {
  try {
    // Get auth token from secure storage
    final token = await AuthService.getToken();
    final uri = Uri.parse('$baseApiUrl${ApiEndpoint.items}');
    logger.i("Uri: $uri");
    
    if (requestBody["images"].isEmpty) {
      logger.e("At least 1 image is required");
      throw Exception('At least 1 image is required');
    }

    final List<File> files = (requestBody["images"] as List<File>);
    
    // Use the same Cloudinary method that updateVehicle will use
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

    if (response.statusCode != 200 && response.statusCode != 201) {
      throw Exception('Failed to upload vehicle (${response.statusCode}): ${response.body}');
    }
    
    logger.i("Vehicle uploaded successfully");
  } catch (e) {
    logger.e("❌ Error uploading vehicle: $e");
    rethrow;
  }
}

  static Future<void> updateVehicle({
  required Map<String?, dynamic> requestBody,
}) async {
  // ✅ FIRST: Extract the ID from the requestBody for the URL
  final dynamic itemId = requestBody['id'];
  if (itemId == null) {
    throw Exception('Item ID is required for update');
  }
  
  final uri = Uri.parse('$baseApiUrl${ApiEndpoint.items}/$itemId');
  
  try {
    final token = await AuthService.getToken();
    if (token == null) {
      throw Exception('Authentication token not found');
    }
    
    // separate new images from existing URLs
    final List<dynamic> allImages = requestBody['images'] ?? [];
    final List<File> newImageFiles = [];
    final List<String> existingImageUrls = [];

    for (final image in allImages) {
      if (image is File) {
        newImageFiles.add(image);
      } else if (image is String && image.startsWith('http')) {
        existingImageUrls.add(image);
      }
    }
    logger.w('newImageFiles: $newImageFiles');

    logger.i('New images to upload: ${newImageFiles.length}, Existing URLs: ${existingImageUrls.length}');

    // upload new images to Cloudinary if any
    List<String> newImageUrls = [];
    if (newImageFiles.isNotEmpty) {
      newImageUrls = await CloudinaryService.uploadImages(newImageFiles);
    }
    logger.w('newImageUrls: $newImageUrls');
    logger.w('existingImageUrls: $existingImageUrls');

    // combine existing and new image URLs
    final List<String> allImageUrls = [...existingImageUrls, ...newImageUrls];
    if (allImageUrls.isEmpty) {
      throw Exception('At least one image is required');
    }

    logger.w('allImageUrls: $allImageUrls');

    // ✅ prepare the final request body - DO NOT INCLUDE ID HERE
    final Map<String, dynamic> finalRequestBody = {
      'category_id': requestBody['category_id'],
      'brand_id': requestBody['brand_id'],
      'brand_model_id': requestBody['brand_model_id'],
      'name': requestBody['name'],
      'slug': requestBody['slug'],
      'location': requestBody['location'],
      'price': requestBody['price'],
      'description': requestBody['description'],
      'features': requestBody['features'] ?? [],
      'images': allImageUrls,
    };

    // ✅ Add dynamic fields from selectedFields - EXCLUDE ID HERE
    requestBody.forEach((key, value) {
      if (key != null && 
          key != 'id' && // ✅ This is CRITICAL - exclude ID from final body
          key != 'category_id' && 
          key != 'brand_id' && 
          key != 'brand_model_id' && 
          key != 'name' && 
          key != 'slug' && 
          key != 'location' && 
          key != 'price' && 
          key != 'description' && 
          key != 'features' && 
          key != 'images') {
        finalRequestBody[key.toString()] = value;
      }
    });

    logger.i('Final Request Body (ID should NOT be here): ${json.encode(finalRequestBody)}');
    logger.i('ID is in URL: $itemId');

    // make the PUT request
    final response = await http.put(
      uri,
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      },
      body: json.encode(finalRequestBody), // ✅ This body should NOT contain ID
    );

    final statusCode = response.statusCode;
    final responseBody = response.body;

    logger.i('Response Status: $statusCode');
    logger.i('Response Body: $responseBody');

    // handle different status codes
    if (statusCode == 200) {
      final responseData = json.decode(responseBody);
      logger.i('Vehicle updated successfully: $responseData');
      return;
    } else if (statusCode == 401) {
      throw Exception('Unauthorized: Please login again');
    } else if (statusCode == 403) {
      throw Exception('Forbidden: You don\'t have permission to update this vehicle');
    } else if (statusCode == 422) {
      final responseData = json.decode(responseBody);
      final errors = responseData['errors'] ?? {};
      final errorMessages = _parseValidationErrors(errors);
      throw Exception('Validation failed: $errorMessages');
    } else {
      throw Exception('Failed to update vehicle. Status code: $statusCode');
    }
  } catch (e) {
    logger.e('Error updating vehicle: $e');
    rethrow;
  }
}

  // helper function
  static String _parseValidationErrors(Map<String, dynamic> errors) {
    final errorMessages = <String>[];
    
    errors.forEach((field, messages) {
      if (messages is List) {
        errorMessages.add('${field.replaceAll('_', ' ')}: ${messages.join(', ')}');
      } else if (messages is String) {
        errorMessages.add('${field.replaceAll('_', ' ')}: $messages');
      }
    });
    
    return errorMessages.join('; ');
  }

  // mark as sold
  static Future<Map<String, dynamic>> markAsSold(String itemId) async {
    final uri = Uri.parse('$baseApiUrl${ApiEndpoint.items}/$itemId');
    try{
      final token = await AuthService.getToken();
      final response = await http.put(
        uri,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: json.encode({
          'status': 'sold',
        }),
      );

      if(response.statusCode == 200){
        final responseData = json.decode(response.body);
        logger.i('Item marked as sold successfully');
        return {
          'success': true,
          'message': responseData['message'] ?? 'Item marked as sold successfully',
          'data': responseData['data'],
        };
      } else {
        final errorData = json.decode(response.body);
        logger.e('Failed to mark item as sold');
        return {
          'success': false,
          'message': errorData['message'] ?? 'Failed to mark item as sold',
          'error': errorData,
        };
      }
    } catch(e){
      return {
        'success': false,
        'message': 'Network error: ${e.toString()}',
      };
    }
  }

}
