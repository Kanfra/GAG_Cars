import 'package:cloudinary/cloudinary.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'dart:io';

class CloudinaryService {
  static late final Cloudinary _cloudinary;

  static Future<void> init() async {
    await dotenv.load();
    _cloudinary = Cloudinary.signedConfig(
      apiKey: dotenv.env['CLOUDINARY_API_KEY']!,
      apiSecret: dotenv.env['CLOUDINARY_API_SECRET']!,
      cloudName: dotenv.env['CLOUDINARY_CLOUD_NAME']!,
    );
  }

  static Future<List<String>> uploadImages(List<File> files) async {
    final urls = <String>[];
    for (final file in files) {
      try {
        final response = await _cloudinary.upload(
          file: file.path,
          folder: 'vehicle_uploads', // ✅ Keep this
        );
        urls.add(response.secureUrl!);
      } catch (e) {
        throw Exception('Failed to upload ${file.path}: $e');
      }
    }
    return urls;
  }
}
