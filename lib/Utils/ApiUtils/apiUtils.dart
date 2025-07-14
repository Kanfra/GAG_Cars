// apiUtils.dart
import 'dart:convert';
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

// generic POST method
Future<T> postApiData<T>({
  required String endpoint,
  required Map<String, dynamic> body,
  int successStatusCode = 200,
  Map<String, String>? headers,
  required T Function(Map<String, dynamic>) fromJson,
  Duration timeout = const Duration(seconds: 10),
}) async {
  final logger = Logger();
  final uri = Uri.parse('$baseApiUrl$endpoint');
  try{
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

    if(response.statusCode == successStatusCode){
      try{
        final responseData = jsonDecode(response.body) as Map<String, dynamic>;
        return fromJson(responseData);
      } catch(e){
        logger.e('Failed to parse response from $uri: $e');
        throw FormatException('Failed to parse response: $e');
      }
    } else{
      logger.e('API request failed: ${response.statusCode} - $uri');
      final errorData = jsonDecode(response.body);
      throw http.ClientException(
        errorData['message'] ?? 'Request failed with status: ${response.statusCode}',
        uri,
      );
    }
  } on http.ClientException {
    rethrow;
  } on FormatException{
    rethrow;
  } catch(e){
    logger.e('Unexpected error in API call to $uri: $e');
    throw Exception('Failed to complete API request: $e');
  }
}

Future<T> fetchApiData<T>({
  required String endpoint,
  int successStatusCode = 200,
  Map<String, String>? headers,
  required T Function(Map<String, dynamic>) fromJson,
}) async {
  final logger = Logger();
  final uri = Uri.parse('$baseApiUrl$endpoint');

  try {
    final response = await http.get(uri, headers: headers ?? {});
    
    if (response.statusCode == successStatusCode) {
      try {
        logger.i("Successfully parsed response from $uri");
        return fromJson(json.decode(response.body) as Map<String, dynamic>);
      } catch (e) {
        logger.e("Failed to parse response from $uri: $e");
        throw FormatException('Failed to parse response: $e');
      }
    } else {
      logger.e("API request failed: ${response.statusCode} - $uri");
      throw http.ClientException(
        'Request failed with status: ${response.statusCode}',
        uri,
      );
    }
  } on http.ClientException {
    rethrow;
  } catch (e) {
    logger.e("Unexpected error in API call to $uri: $e");
    throw Exception('Failed to complete API request: $e');
  }
}