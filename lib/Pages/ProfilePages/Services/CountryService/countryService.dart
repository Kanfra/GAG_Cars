import 'dart:async';
import 'dart:convert';
import 'package:gag_cars_frontend/Pages/ProfilePages/Models/countryModel.dart';
import 'package:gag_cars_frontend/Utils/ApiUtils/apiEnpoints.dart';
import 'package:gag_cars_frontend/Utils/ApiUtils/apiUtils.dart';
import 'package:http/http.dart' as http;
import 'package:logger/Logger.dart';

class CountryService {
  final logger = Logger();

  Future<List<Country>> fetchCountries() async {
    final uri = Uri.parse('$baseApiUrl${ApiEndpoint.countries}');
    try {
      final response = await http.get(
        uri,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ).timeout(const Duration(seconds: 30));

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        logger.i("Countries fetched successfully: ${jsonData.length} countries");
        
        final List<dynamic> countriesJson = jsonData;
        return countriesJson.map((countryJson) => Country.fromJson(countryJson)).toList();
      } else {
        throw ApiException(
          message: 'Failed to load countries: ${response.statusCode}',
          statusCode: response.statusCode,
          code: 'HTTP_ERROR',
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
      logger.e("Unexpected error fetching countries: $e");
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