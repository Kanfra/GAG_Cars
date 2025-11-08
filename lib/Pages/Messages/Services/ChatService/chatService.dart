import 'dart:convert';
import 'dart:io';
import 'package:gag_cars_frontend/Pages/Authentication/Services/authService.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Services/VehicleService/cloudinaryService.dart';
import 'package:gag_cars_frontend/Pages/Messages/Models/chatContactModel.dart';
import 'package:gag_cars_frontend/Pages/Messages/Models/chatMessagesModel.dart';
import 'package:gag_cars_frontend/Utils/ApiUtils/apiEnpoints.dart';
import 'package:gag_cars_frontend/Utils/ApiUtils/apiUtils.dart';
import 'package:http/http.dart' as http;
import 'package:logger/Logger.dart';

class ChatService {
  static final Logger _logger = Logger();
  
  // Headers with authentication
  static Map<String, String> _getHeaders(String token) {
    return {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
  }

  // Handle API response - FIXED NULL SAFETY
  static dynamic _handleResponse(http.Response response) {
    _logger.i('API Response: ${response.statusCode} - Body length: ${response.body.length}');
    
    // Check if response body is null or empty
    if (response.body.isEmpty) {
      _logger.w('Empty response body received');
      return <String, dynamic>{}; // Return empty map instead of null
    }
    
    try {
      final jsonData = jsonDecode(response.body);
      _logger.d('Successfully decoded JSON response');
      return jsonData;
    } catch (e) {
      _logger.e('Error decoding JSON: $e');
      _logger.e('Raw response body: "${response.body}"');
      return <String, dynamic>{}; // Return empty map on decode error
    }
  }

  // Get chat contacts - Returns typed response
  static Future<ChatContactResponse> getContacts() async {
    try {
      final token = await AuthService.getToken();
      _logger.i('Fetching chat contacts...');
      
      final response = await http.get(
        Uri.parse('$baseApiUrl${ApiEndpoint.getContacts}'),
        headers: _getHeaders(token!),
      );

      _logger.i("Success: ${response.statusCode} - ${response.body}");
      final jsonResponse = _handleResponse(response);
      return ChatContactResponse.fromJson(jsonResponse);
      
    } catch (e) {
      _logger.e('Error fetching contacts: $e');
      rethrow;
    }
  }

  // Fetch messages for a specific conversation with pagination - Returns typed response
  static Future<ChatMessageResponse> fetchMessages({
    required String contactId,
    int page = 1,
    int perPage = 20,
  }) async {
    try {
      final token = await AuthService.getToken();
      if (token == null) {
        throw Exception('No authentication token found');
      }
      
      _logger.i('Fetching messages for contact: $contactId - Page: $page, Per Page: $perPage');
      
      // Build request body with contact ID and pagination
      final Map<String, dynamic> requestBody = {
        'contact_id': contactId,
        'page': page,
        'per_page': perPage,
      };

      _logger.i('Fetching messages with body: $requestBody');
      
      final response = await http.post(
        Uri.parse('$baseApiUrl${ApiEndpoint.fetchMessages}'),
        headers: _getHeaders(token),
        body: jsonEncode(requestBody),
      );

      _logger.i("Response status: ${response.statusCode}");
      _logger.d("Response body length: ${response.body.length}");
      
      // Use the safe handling method
      final jsonResponse = _handleResponse(response);
      
      _logger.d('JSON response type: ${jsonResponse.runtimeType}');
      _logger.d('JSON response keys: ${jsonResponse is Map ? jsonResponse.keys : 'Not a map'}');
      
      // Handle empty response
      if (jsonResponse is Map && jsonResponse.isEmpty) {
        _logger.w('Empty response received, returning default ChatMessageResponse');
        return ChatMessageResponse(
          total: 0,
          lastPage: 1,
          lastMessageId: '',
          messages: [],
        );
      }
      
      return ChatMessageResponse.fromJson(jsonResponse);
      
    } catch (e) {
      _logger.e('Error fetching messages for contact $contactId, page $page: $e', error: e);
      
      // Return empty response on error instead of throwing
      _logger.w('Returning empty ChatMessageResponse due to error');
      return ChatMessageResponse(
        total: 0,
        lastPage: 1,
        lastMessageId: '',
        messages: [],
      );
    }
  }

  // Ultra-safe method that never throws
  static Future<ChatMessageResponse> fetchMessagesUltraSafe({
    required String contactId,
    int page = 1,
    int perPage = 20,
  }) async {
    try {
      final token = await AuthService.getToken();
      if (token == null) {
        _logger.w('No token, returning empty response');
        return _getEmptyChatMessageResponse();
      }
      
      final Map<String, dynamic> requestBody = {
        'contact_id': contactId,
        'page': page,
        'per_page': perPage,
      };

      final response = await http.post(
        Uri.parse('$baseApiUrl${ApiEndpoint.fetchMessages}'),
        headers: _getHeaders(token),
        body: jsonEncode(requestBody),
      );

      // Ultra-safe JSON decoding
      dynamic jsonResponse;
      try {
        jsonResponse = response.body.isNotEmpty ? jsonDecode(response.body) : <String, dynamic>{};
      } catch (e) {
        _logger.w('JSON decode failed, using empty map');
        jsonResponse = <String, dynamic>{};
      }

      // Ultra-safe parsing
      try {
        return ChatMessageResponse.fromJson(jsonResponse);
      } catch (e) {
        _logger.w('ChatMessageResponse.fromJson failed, returning empty response');
        return _getEmptyChatMessageResponse();
      }
      
    } catch (e) {
      _logger.w('Complete failure in fetchMessagesUltraSafe, returning empty response: $e');
      return _getEmptyChatMessageResponse();
    }
  }

  // Helper method for empty response
  static ChatMessageResponse _getEmptyChatMessageResponse() {
    return ChatMessageResponse(
      total: 0,
      lastPage: 1,
      lastMessageId: '',
      messages: [],
    );
  }

  // Send message to a contact - UPDATED to handle both text and image
  static Future<void> sendMessage({
    required String toId,
    required String message,
    required String temporaryMsgId,
    File? imageFile, // Optional image file parameter
  }) async {
    try {
      final token = await AuthService.getToken();
      _logger.i('Sending message to: $toId, Temporary ID: $temporaryMsgId');
      
      String finalMessage = message;
      
      // If image file is provided, upload to Cloudinary and use the URL as message
      if (imageFile != null) {
        _logger.i('Image file detected, uploading to Cloudinary...');
        try {
          // Upload single image to Cloudinary
          final imageUrl = await CloudinaryService.uploadImage(
            imageFile, 
            folderName: 'chat_images'
          );
          _logger.i('Image uploaded successfully: $imageUrl');
          finalMessage = imageUrl; // Use the image URL as the message content
        } catch (e) {
          _logger.e('Failed to upload image to Cloudinary: $e');
          throw Exception('Failed to upload image: $e');
        }
      }
      
      final Map<String, dynamic> requestBody = {
        'to_id': toId,
        'message': finalMessage,
        'temporaryMsgId': temporaryMsgId,
      };

      _logger.i('Sending request body: $requestBody');
      
      final response = await http.post(
        Uri.parse('$baseApiUrl${ApiEndpoint.sendMessage}'),
        headers: _getHeaders(token!),
        body: jsonEncode(requestBody),
      );

      _logger.i("Send message response: ${response.statusCode}");
      
      switch (response.statusCode) {
        case 200:
          _logger.i('Message sent successfully');
          return;
        case 401:
          throw Exception('Unauthorized - Please login again');
        case 422:
          final errorData = _handleResponse(response);
          final errorMessage = (errorData['message'] as String?) ?? 'Validation failed';
          throw Exception(errorMessage);
        case 500:
          throw Exception('Server error - Please try again later');
        default:
          throw Exception('Failed to send message. Status: ${response.statusCode}');
      }
      
    } catch (e) {
      _logger.e('Error sending message: $e');
      rethrow;
    }
  }

  // Helper method to check if a message is an image URL
  static bool isImageMessage(String message) {
    if (message.isEmpty) return false;
    
    // Check if the message is a URL and points to an image
    final uri = Uri.tryParse(message);
    if (uri != null && uri.host.isNotEmpty) {
      final path = uri.path.toLowerCase();
      return path.endsWith('.jpg') || 
             path.endsWith('.jpeg') || 
             path.endsWith('.png') || 
             path.endsWith('.gif') || 
             path.endsWith('.webp') ||
             path.endsWith('.bmp');
    }
    
    return false;
  }

  // Alternative method if your API uses query parameters instead of request body
  static Future<ChatMessageResponse> fetchMessagesWithQueryParams({
    required String contactId,
    int page = 1,
    int perPage = 20,
  }) async {
    try {
      final token = await AuthService.getToken();
      _logger.i('Fetching messages for contact: $contactId - Page: $page, Per Page: $perPage');
      
      final Map<String, String> queryParams = {
        'contact_id': contactId,
        'page': page.toString(),
        'per_page': perPage.toString(),
      };

      final uri = Uri.parse('$baseApiUrl${ApiEndpoint.fetchMessages}').replace(
        queryParameters: queryParams,
      );

      final response = await http.post(
        uri,
        headers: _getHeaders(token!),
      );

      final jsonResponse = _handleResponse(response);
      return ChatMessageResponse.fromJson(jsonResponse);
      
    } catch (e) {
      _logger.e('Error fetching messages for contact $contactId, page $page: $e');
      return _getEmptyChatMessageResponse();
    }
  }
}