import 'dart:async';
import 'dart:convert';
import 'package:gag_cars_frontend/Pages/Authentication/Services/authService.dart';
import 'package:gag_cars_frontend/Pages/ProfilePages/Models/countryModel.dart';
import 'package:gag_cars_frontend/Utils/ApiUtils/apiEnpoints.dart';
import 'package:gag_cars_frontend/Utils/ApiUtils/apiUtils.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class CountryService {
  final logger = Logger();

  Future<CountriesResponse> fetchCountries() async {
    final uri = Uri.parse('$baseApiUrl${ApiEndpoint.countries}');
    try {
      final token = await AuthService.getToken();
      final response = await http.get(
        uri,
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ).timeout(const Duration(seconds: 30));

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        logger.i("Success: $jsonData");
        return CountriesResponse.fromJson(jsonData);
      } else if (response.statusCode == 401) {
        throw ApiException(
          message: 'Unauthorized - Invalid or expired token',
          statusCode: 401,
          code: 'UNAUTHORIZED',
        );
      } else {
        throw ApiException(
          message: 'Unexpected error occurred',
          statusCode: response.statusCode,
          code: 'UNEXPECTED_ERROR',
        );
      }
    } on http.ClientException catch (e) {
      throw ApiException(
        message: 'Network error: ${e.message}',
        statusCode: 0,
        code: 'NETWORK_ERROR',
      );
    } on FormatException catch (e) {
      throw ApiException(
        message: 'Invalid response format: ${e.message}',
        statusCode: 0,
        code: 'INVALID_FORMAT',
      );
    } on TimeoutException catch (e) {
      throw ApiException(
        message: 'Request timeout: ${e.message}',
        statusCode: 0,
        code: 'TIMEOUT',
      );
    } on ApiException {
      rethrow;
    } catch (e) {
      logger.e("Unexpected error: $e");
      throw ApiException(
        message: 'Unexpected error: $e',
        statusCode: 0,
        code: 'UNKNOWN_ERROR',
      );
    }
  }
}

// Custom Exception Class for API Errors
class ApiException implements Exception {
  final String message;
  final int statusCode;
  final String code;

  ApiException({
    required this.message,
    required this.statusCode,
    required this.code,
  });

  @override
  String toString() {
    return 'ApiException: $message (Code: $code, Status: $statusCode)';
  }
}