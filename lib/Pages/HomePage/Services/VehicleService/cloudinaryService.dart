import 'package:cloudinary/cloudinary.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:logger/logger.dart';

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


  static Future<String> uploadImage(File imageFile, {String? oldImageUrl, String? folderName}) async {
  final logger = Logger();
  try{
    // validate that cloudinary is initialized
    // if(_cloudinary == null){
    //   await init();
    // }

    String? publicId;

    // extract public id  from old image url for replacement
    if(oldImageUrl != null && oldImageUrl.isNotEmpty){
      publicId = _extractPublicId(oldImageUrl);
    }

    // prepare transformation parameters for profile image optimization
    final optParams = {
      'transformation': 'w_500,h_500,c_fill,g_face,q_auto'
    };

    // upload the image
    final response = await _cloudinary.upload(
      file: imageFile.path,
      folder: folderName ?? "profile_images", // specific folder for profile pictures
      publicId: publicId, // this will replace the existing image if provided
      resourceType: CloudinaryResourceType.image,
      optParams: optParams, // pass transformation parameters here
    );

    // add debug logging to see what's returned
    logger.w('Cloudinary response: ${response.toJson()}');

    if(response.secureUrl == null){
      throw Exception('Upload succeeded but no URL returned');
    }
    return response.secureUrl!;

  } catch(e){
    logger.e('Cloudinary upload error: $e');
    throw Exception('Failed to upload ${folderName ?? 'profile image'}: $e');
  }
}

// helper method to extract public id from cloudinary url
static String? _extractPublicId(String imageUrl){
  try{
    final uri = Uri.parse(imageUrl);
    final pathSegments = uri.pathSegments;

    // look for the segment after upload
    final uploadIndex = pathSegments.indexOf('upload');
    if(uploadIndex != -1 && uploadIndex + 1 < pathSegments.length){
      // get the public id (remove file extension if present)
      String publicId = pathSegments[uploadIndex + 1];
      if(publicId.contains('.')){
        publicId = publicId.substring(0, publicId.lastIndexOf('.'));
      }
      return publicId;
    }
    return null;
  } catch(e){
    return null;
  }
}

// delete a profile image
static Future<void> deleteProfileImage(String imageUrl) async {
  final logger = Logger();
  try {
    // use optparams to pass the type parameter
    final publicId = _extractPublicId(imageUrl);
    if(publicId != null){
      final response = await _cloudinary.destroy(
        publicId,
        resourceType: CloudinaryResourceType.image,
        invalidate: true,
        optParams: {
          'type': 'upload', // this is how you pass type in your version
        }
        );
        if(response.isSuccessful){
          logger.i("Successfully deleted image: $publicId");
        } else {
          logger.e('Falied to delete image: ${response.error}');
          throw Exception('Failed to delete image: ${response.error}');
        }
    }
  } catch(e){
    logger.e("Failed to delete profile image: $e");
    throw Exception('Failed to delete profile image: $e');
  }
}


// Add this method to your existing CloudinaryService class
static Future<List<String>> uploadVehicleImages(List<File> imageFiles, {List<String>? oldImageUrls}) async {
  final logger = Logger();
  final List<String> uploadedUrls = [];
  
  try {
    logger.i('Starting vehicle image upload. Files: ${imageFiles.length}, Old URLs: ${oldImageUrls?.length ?? 0}');

    // Upload new images
    for (final file in imageFiles) {
      try {
        final response = await _cloudinary.upload(
          file: file.path,
          folder: 'vehicle_uploads', // Using the same folder as your existing method
          resourceType: CloudinaryResourceType.image,
          optParams: {
            'transformation': 'w_800,h_600,c_fill,q_auto' // Optimize for vehicle images
          },
        );

        if (response.secureUrl != null) {
          uploadedUrls.add(response.secureUrl!);
          logger.i('Successfully uploaded vehicle image: ${response.secureUrl}');
        } else {
          logger.e('Upload succeeded but no URL returned for file: ${file.path}');
          throw Exception('Failed to get URL for uploaded image');
        }
      } catch (e) {
        logger.e('Error uploading file ${file.path}: $e');
        throw Exception('Failed to upload image ${file.path}: $e');
      }
    }

    logger.i('Vehicle image upload completed. Total URLs: ${uploadedUrls.length}');
    return uploadedUrls;

  } catch (e) {
    logger.e('Vehicle image upload failed: $e');
    rethrow;
  }
}

// Helper method to check if an XFile is a new file (not already uploaded)
static bool isNewImage(XFile xFile) {
  return !xFile.path.startsWith('http');
}

// Helper method to extract public ID from vehicle image URL (if needed for replacement)
static String? _extractVehiclePublicId(String imageUrl) {
  try {
    final uri = Uri.parse(imageUrl);
    final pathSegments = uri.pathSegments;
    
    // Cloudinary URL format: https://res.cloudinary.com/cloudname/image/upload/v1234567/folder/filename.jpg
    final uploadIndex = pathSegments.indexOf('upload');
    if (uploadIndex != -1 && uploadIndex + 2 < pathSegments.length) {
      // The public ID is everything after 'upload' segment
      final publicIdParts = pathSegments.sublist(uploadIndex + 1);
      String publicId = publicIdParts.join('/');
      
      // Remove file extension if present
      if (publicId.contains('.')) {
        publicId = publicId.substring(0, publicId.lastIndexOf('.'));
      }
      
      return publicId;
    }
    return null;
  } catch (e) {
    return null;
  }
}
}


