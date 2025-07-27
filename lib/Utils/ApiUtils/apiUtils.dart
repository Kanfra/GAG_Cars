// apiUtils.dart
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gag_cars_frontend/GlobalVariables/imageStringGlobalVariables.dart';
import 'package:gag_cars_frontend/Utils/ApiUtils/apiEnpoints.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

// Synchronous getter for base URL
String get baseApiUrl {
  final url = dotenv.env['BASE_API_URL'];
  if (url == null || url.isEmpty) {
    throw Exception('BASE_API_URL not found in .env file');
  }
  return url;
}

// getImageUrl
String getImageUrl(String? imagePath){
  if(imagePath == null || imagePath.isEmpty){
    return "${ImageStringGlobalVariables.imagePath}car_placeholder.png";
  }
  return '${ApiEndpoint.baseImageUrl}$imagePath';
}

dynamic statusCodeResponse<T>({
  required http.Response response,
  required T Function() successFunction200,
  required T Function() successFunction201,
  String Function()? function400,
  String Function()? function401,
  String Function()? function404,
  String Function()? function500,
  String Function(int statusCode)? fallbackFunction,
}) {
  switch(response.statusCode) {
    case 200:
      return successFunction200();
    case 201:
      return successFunction201();
    case 400:
      return function400?.call() ?? 'Bad Request (400)';
    case 401:
      return function401?.call() ?? 'Unauthorized (401)';
    case 404:
      return function404?.call() ?? 'Not Found (404)';
    case 500:
      return function500?.call() ?? 'Internal Server Error (500)';
    default:
      return fallbackFunction?.call(response.statusCode) ?? 
             'Unexpected status code: ${response.statusCode}';
  }
}

// generic POST method
Future<T> postApiData<T>({
  required String endpoint,
  required Map<String, dynamic> body,
  Map<String, String>? headers,
  required T Function(Map<String, dynamic>) fromJson,
  Duration timeout = const Duration(seconds: 10),
}) async {
  final logger = Logger();
  final uri = Uri.parse('$baseApiUrl$endpoint');
  
  try {
    logger.i('Sending POST request to $uri');
    logger.t('Request body: $body');

    final response = await http.post(
      uri,
      headers: {
        'Content-Type': 'application/json',
        ...?headers,
      },
      body: jsonEncode(body),
    ).timeout(timeout);

    logger.i('Response status: ${response.statusCode}');
    logger.t('Response body: ${response.body}');

    final responseData = jsonDecode(response.body);
    
    final result = statusCodeResponse<T>(
      response: response,
      successFunction200: () {
        try {
          return fromJson(responseData as Map<String, dynamic>);
        } catch (e) {
          logger.e('Failed to parse success response from $uri: $e');
          throw FormatException('Failed to parse response: $e');
        }
      },
      successFunction201: () {
        try {
          return fromJson(responseData as Map<String, dynamic>);
        } catch (e) {
          logger.e('Failed to parse success response from $uri: $e');
          throw FormatException('Failed to parse response: $e');
        }
      },
      function400: () => throw http.ClientException(
        (responseData is Map ? responseData['message'] : null) ?? 'Bad Request', 
        uri
      ),
      function401: () => throw http.ClientException(
        (responseData is Map ? responseData['message'] : null) ?? 'Unauthorized', 
        uri
      ),
      function404: () => throw http.ClientException(
        (responseData is Map ? responseData['message'] : null) ?? 'Not Found', 
        uri
      ),
      function500: () => throw http.ClientException(
        (responseData is Map ? responseData['message'] : null) ?? 'Server Error', 
        uri
      ),
      fallbackFunction: (code) => throw http.ClientException(
        (responseData is Map ? responseData['message'] : null) ?? 'Request failed with status: $code', 
        uri
      ),
    );

    if (result is T) {
      return result;
    } else {
      // This should never happen for success cases as we throw exceptions for errors
      throw http.ClientException(result.toString(), uri);
    }
  } on http.ClientException {
    rethrow;
  } on FormatException {
    rethrow;
  } catch (e) {
    logger.e('Unexpected error in API call to $uri: $e');
    throw Exception('Failed to complete API request: $e');
  }
}


// Future<T> postApiData<T>({
//   required String endpoint,
//   required Map<String, dynamic> body,
//   int successStatusCode = 200,
//   Map<String, String>? headers,
//   required T Function(Map<String, dynamic>) fromJson,
//   Duration timeout = const Duration(seconds: 10),
// }) async {
//   final logger = Logger();
//   final uri = Uri.parse('$baseApiUrl$endpoint');
//   try{
//     logger.i('Sending POST request to $uri');
//     logger.t('Request body: $body');

//     final response = await http.post(
//       uri,
//       headers: {
//         'Content-Type': 'application/json',
//         ...?headers,
//       },
//       body: jsonEncode(body),
//     ).timeout(timeout);

//     logger.i('Response status: ${response.statusCode}');
//     logger.t('Response body: ${response.body}');

//     if(response.statusCode == successStatusCode){
//       try{
//         final responseData = jsonDecode(response.body) as Map<String, dynamic>;
//         return fromJson(responseData);
//       } catch(e){
//         logger.e('Failed to parse response from $uri: $e');
//         throw FormatException('Failed to parse response: $e');
//       }
//     } else{
//       logger.e('API request failed: ${response.statusCode} - $uri');
//       final errorData = jsonDecode(response.body);
//       throw http.ClientException(
//         errorData['message'] ?? 'Request failed with status: ${response.statusCode}',
//         uri,
//       );
//     }
//   } on http.ClientException {
//     rethrow;
//   } on FormatException{
//     rethrow;
//   } catch(e){
//     logger.e('Unexpected error in API call to $uri: $e');
//     throw Exception('Failed to complete API request: $e');
//   }
// }


Future<T> fetchApiData<T>({
  required String endpoint,
  int successStatusCode = 200,
  Map<String, String>? headers,
  required T Function(Map<String, dynamic>) fromJson,
}) async {
  final logger = Logger();
  final uri = Uri.parse('$baseApiUrl$endpoint');
  const storage = FlutterSecureStorage();

  try {
    // Get auth token from secure storage
    final token = await storage.read(key: 'auth_token');
    logger.i("Your secured token: $token");
    
    final requestHeaders = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      if (token != null) 'Authorization': 'Bearer $token',
      ...?headers,
    };

    final response = await http.get(uri, headers: requestHeaders);

    if (response.statusCode >= 200 && response.statusCode < 300) {
      try {
        final responseBody = response.body;
        if (responseBody.isEmpty) {
          throw FormatException('Empty response body');
        }

        final decodedJson = json.decode(responseBody);
        
        // Handle both Map and List responses
        final jsonData = decodedJson is Map<String, dynamic>
            ? decodedJson
            : {'data': decodedJson};

        logger.i("Successfully parsed response from $uri");
        return fromJson(jsonData);
      } catch (e, stackTrace) {
        logger.e("Failed to parse response from $uri", error: e, stackTrace: stackTrace);
        throw ApiParsingException('Failed to parse response: $e');
      }
    } else {
      logger.e("API request failed: ${response.statusCode} - $uri\nBody: ${response.body}");
      
      if (response.statusCode >= 500) {
        throw ServerException('Server error occurred', response.statusCode);
      } else {
        throw ApiRequestException(
          'Request failed with status: ${response.statusCode}',
          response.statusCode,
          uri: uri,
          responseBody: response.body,
        );
      }
    }
  } on http.ClientException catch (e) {
    logger.e("Network error: ${e.message}");
    throw NetworkException(e.message);
  } catch (e, stackTrace) {
    logger.e("Unexpected error in API call to $uri", error: e, stackTrace: stackTrace);
    throw ApiException('Failed to complete API request: $e');
  }
}

// Custom Exception Classes
class ApiException implements Exception {
  final String message;
  ApiException(this.message);
}

class ApiParsingException extends ApiException {
  ApiParsingException(super.message);
}

class ApiRequestException extends ApiException {
  final int statusCode;
  final Uri? uri;
  final String? responseBody;
  
  ApiRequestException(
    super.message,
    this.statusCode, {
    this.uri,
    this.responseBody,
  });
}

class ServerException extends ApiRequestException {
  ServerException(super.message, super.statusCode);
}

class NetworkException extends ApiException {
  NetworkException(super.message);
}
