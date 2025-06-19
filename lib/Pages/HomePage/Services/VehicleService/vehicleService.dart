import 'dart:io';
import 'package:gag_cars_frontend/Pages/HomePage/Models/vehicleModel.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Services/VehicleService/cloudinaryService.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'dart:convert';

import 'package:logger/logger.dart';

class VehicleService {
  // token needed
  static const String baseUrl = 'https://your-backend-api.com/vehicles';

  static Future<void> uploadVehicle({
    required VehicleModel vehicle,
    required List<XFile> imageFiles,
  }) async {
    try {
      final logger = Logger();
      if (imageFiles.isEmpty) {
        logger.e("At least 1 image is required");
        throw Exception('At least 1 image is required');
      }

      final files = imageFiles.map((xFile) => File(xFile.path)).toList();

      final uploadedImageUrls = await CloudinaryService.uploadImages(files);

      if (uploadedImageUrls.isEmpty) {
        logger.e("Image upload failed: No URLs returned");
        throw Exception('Image upload failed: No URLs returned');
      }
       logger.i("Successful: $uploadedImageUrls");
      // final updatedVehicle = vehicle.copyWith(images: uploadedImageUrls);

      // final response = await http.post(
      //   Uri.parse(baseUrl),
      //   headers: {'Content-Type': 'application/json'},
      //   body: jsonEncode(updatedVehicle.toJson()),
      // );

      // if (response.statusCode != 200 && response.statusCode != 201) {
      //   throw Exception('Failed to upload vehicle (${response.statusCode}): ${response.body}');
      // }

      // print('✅ Vehicle uploaded successfully!');
    } catch (e) {
      print('❌ Error uploading vehicle: $e');
      rethrow;
    }
  }
}
