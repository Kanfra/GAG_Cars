import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gag_cars_frontend/GlobalVariables/imageStringGlobalVariables.dart';
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

// FIXED: Completely rewritten getImageUrl with proper storage path
String getImageUrl(String? imagePath, String? defaultImagePath) {
  // Handle null or empty string cases
  if (imagePath == null || imagePath.isEmpty || imagePath == "null") {
    return defaultImagePath ?? "${ImageStringGlobalVariables.imagePath}car_placeholder.png";
  }

  // Handle already complete URLs - return as is
  if (imagePath.startsWith("http")) {
    return imagePath;
  }

  // Handle relative paths - CORRECTED: Use proper storage path
  try {
    // Get base URL without /api endpoint
    String baseUrl = dotenv.env['BASE_IMAGE_URL'] ?? 
                    baseApiUrl.replaceAll('/api', '');
    
    // Clean up base URL
    baseUrl = baseUrl.endsWith('/') 
        ? baseUrl.substring(0, baseUrl.length - 1) 
        : baseUrl;

    // Handle image path - ensure it points to storage
    String cleanImagePath;
    
    // If image path already contains storage, use it as is
    if (imagePath.contains('storage/')) {
      cleanImagePath = imagePath.startsWith('/') ? imagePath : '/$imagePath';
    } else {
      // Otherwise, prepend /storage/ to the path
      cleanImagePath = imagePath.startsWith('/') 
          ? '/storage$imagePath'
          : '/storage/$imagePath';
    }

    final fullUrl = '$baseUrl$cleanImagePath';
    return fullUrl;
    
  } catch (e) {
    print('❌ Error constructing image URL for "$imagePath": $e');
    return defaultImagePath ?? "${ImageStringGlobalVariables.imagePath}car_placeholder.png";
  }
}

// Enhanced version with multiple fallback strategies
String getImageUrlWithFallback(String? imagePath, String? defaultImagePath) {
  if (imagePath == null || imagePath.isEmpty || imagePath == "null") {
    return defaultImagePath ?? "${ImageStringGlobalVariables.imagePath}car_placeholder.png";
  }

  // If it's already a full URL, return it
  if (imagePath.startsWith("http")) {
    return imagePath;
  }

  // Get base URL
  String baseUrl = dotenv.env['BASE_IMAGE_URL'] ?? 
                  baseApiUrl.replaceAll('/api', '');
  baseUrl = baseUrl.endsWith('/') ? baseUrl.substring(0, baseUrl.length - 1) : baseUrl;

  // Try multiple possible URL combinations
  final List<String> possibleUrls = [];
  
  // Option 1: Direct path (if image already has full path)
  if (imagePath.startsWith('/')) {
    possibleUrls.add('$baseUrl$imagePath');
  }
  
  // Option 2: With storage prefix (most common)
  possibleUrls.add('$baseUrl/storage/$imagePath');
  
  // Option 3: Direct without storage (some APIs might work this way)
  possibleUrls.add('$baseUrl/$imagePath');
  
  // Option 4: Handle if image path already contains storage
  if (imagePath.contains('storage/')) {
    final cleanPath = imagePath.startsWith('/') ? imagePath : '/$imagePath';
    possibleUrls.add('$baseUrl$cleanPath');
  }

  // Return the first valid-looking URL
  for (final url in possibleUrls) {
    if (url.startsWith('http')) {
      return url;
    }
  }
  
  // Final fallback
  return defaultImagePath ?? "${ImageStringGlobalVariables.imagePath}car_placeholder.png";
}

// Optimized version for similar items
String getSimilarItemImageUrl(String? imagePath) {
  return getImageUrlWithFallback(imagePath, "${ImageStringGlobalVariables.imagePath}car_placeholder.png");
}

// Status code response handler
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

// POST API data method
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
          // Handle both bool and normal responses
          if(T == bool){
            logger.i("Status code: ${response.statusCode}");
            return true as T;
          }
          logger.i("Success response from $uri, and status code: ${response.statusCode}");
          return fromJson(responseData as Map<String, dynamic>);
        } catch (e) {
          logger.e('Failed to parse success response from $uri: $e');
          throw FormatException('Failed to parse response: $e');
        }
      },
      successFunction201: () {
        try {
          if(T == bool){
            logger.i("Status code: ${response.statusCode}");
            return false as T;
          }
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

// GET API data method
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
    logger.i("Response status: ${response.statusCode}");
    logger.i("Response body: ${response.body}");
    
    if (response.statusCode >= 200 && response.statusCode < 300) {
      try {
        final responseBody = response.body;
        if (responseBody.isEmpty) {
          throw FormatException('Empty response body');
        }

        final decodedJson = json.decode(responseBody);
        
        // Handle different response formats properly
        Map<String, dynamic> jsonData;
        
        if (decodedJson is Map<String, dynamic>) {
          jsonData = decodedJson;
        } else if (decodedJson is List) {
          jsonData = {'data': decodedJson};
        } else {
          throw FormatException('Unexpected response format: ${decodedJson.runtimeType}');
        }

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
  
  @override
  String toString() => 'ApiException: $message';
}

class ApiParsingException extends ApiException {
  ApiParsingException(super.message);
  
  @override
  String toString() => 'ApiParsingException: $message';
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
  
  @override
  String toString() => 'ApiRequestException: $message (Status: $statusCode)';
}

class ServerException extends ApiRequestException {
  ServerException(super.message, super.statusCode);
  
  @override
  String toString() => 'ServerException: $message (Status: $statusCode)';
}

class NetworkException extends ApiException {
  NetworkException(super.message);
  
  @override
  String toString() => 'NetworkException: $message';
}

// Image URL debug utility
void debugImageUrl(String? imagePath, {String tag = 'DEBUG'}) {
  if (imagePath == null) {
    print('$tag: Image path is null');
    return;
  }
  
  final url = getImageUrlWithFallback(imagePath, null);
  print('$tag: "$imagePath" -> "$url"');
}