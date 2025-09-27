import 'dart:convert';
import 'dart:io';

import 'package:gag_cars_frontend/Pages/Authentication/Services/authService.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Services/VehicleService/cloudinaryService.dart';
import 'package:gag_cars_frontend/Pages/ProfilePages/Models/verifyDealerModel.dart';
import 'package:gag_cars_frontend/Utils/ApiUtils/apiEnpoints.dart';
import 'package:gag_cars_frontend/Utils/ApiUtils/apiUtils.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class VerificationService {
  final logger = Logger();
  /// Uploads files to Cloudinary and submits verification request
  Future<VerificationResponse> submitVerification({
    required String dealerName,
    required String location,
    required File selfie,
    required File nationalIdFront,
    required File nationalIdBack,
    File? companyRegistrationDoc,
  }) async {
    final uri = Uri.parse('$baseApiUrl${ApiEndpoint.verifications}');

    try {
      final token = await AuthService.getToken();

      // 🔹 Upload all required files to Cloudinary
      final selfieUrl = await CloudinaryService.uploadImage(selfie);
      final frontUrl = await CloudinaryService.uploadImage(nationalIdFront);
      final backUrl = await CloudinaryService.uploadImage(nationalIdBack);
      String? companyDocUrl;
      logger.w("selfieUrl: $selfieUrl, DocumentFront: $frontUrl, DocumentBack: $backUrl");
      if (companyRegistrationDoc != null) {
        companyDocUrl = await CloudinaryService.uploadImage(companyRegistrationDoc);
      }

      // 🔹 Build request model with uploaded URLs (temporarily commenting out optional fields)
      final request = VerificationRequest(
        // dealer_name: dealerName,  // Temporarily commented out
        // location: location,       // Temporarily commented out
        selfie: selfieUrl,
        document_front: frontUrl,
        document_back: backUrl,
        status: "pending",
        // company_registration_document: companyDocUrl,  // Temporarily commented out
      );

      // 🔹 Send request to backend
      final response = await http.post(
        uri,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(request.toJson()),
      );
      logger.i('Successful verification: $response');
      return _handleResponse(response);
    } catch (e) {
      logger.e("Error: $e");
      return VerificationResponse(
        success: false,
        message: 'Network error: $e',
      );
    }
  }

  VerificationResponse _handleResponse(http.Response response) {
    try {
      final Map<String, dynamic> responseBody = jsonDecode(response.body);

      switch (response.statusCode) {
        case 200:
          // Success - Handle potential null success field
          return VerificationResponse(
            success: responseBody['success'] ?? true, // Default to true if null
            message: responseBody['message'],
            data: responseBody['data'] != null 
                ? VerificationData.fromJson(responseBody['data'])
                : null,
          );

        case 401:
          // Unauthorized
          return VerificationResponse(
            success: false,
            message: responseBody['message'] ?? 'Unauthorized access',
          );

        case 403:
          // Forbidden
          return VerificationResponse(
            success: false,
            message: responseBody['message'] ?? 'Access forbidden',
          );

        case 422:
          // Validation errors
          final errors = _parseValidationErrors(responseBody['errors']);
          return VerificationResponse(
            success: false,
            message: responseBody['message'] ?? 'Validation failed',
            error: errors,
          );

        default:
          // Other errors
          return VerificationResponse(
            success: false,
            message: responseBody['message'] ??
                'Unexpected error occurred (Status: ${response.statusCode})',
          );
      }
    } catch (e) {
      // Handle JSON parsing errors
      return VerificationResponse(
        success: false,
        message: 'Failed to parse response: $e',
      );
    }
  }

  String _parseValidationErrors(dynamic errors) {
    if (errors == null) return 'Validation error';

    if (errors is Map<String, dynamic>) {
      final errorList = <String>[];
      errors.forEach((key, value) {
        if (value is List) {
          errorList.add('$key: ${value.join(', ')}');
        } else {
          errorList.add('$key: $value');
        }
      });
      return errorList.join('; ');
    }

    return errors.toString();
  }
}