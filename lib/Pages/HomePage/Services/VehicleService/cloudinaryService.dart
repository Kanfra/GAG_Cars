import 'package:cloudinary/cloudinary.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
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


  static Future<String> uploadImage(File imageFile, {String? oldImageUrl}) async {
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
      folder: "profile_images", // specific folder for profile pictures
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
    throw Exception('Failed to upload profile image: $e');
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
}


