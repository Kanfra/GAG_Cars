// services/chat_service.dart
import 'dart:convert';
import 'package:gag_cars_frontend/Pages/Authentication/Services/authService.dart';
import 'package:gag_cars_frontend/Utils/ApiUtils/apiEnpoints.dart';
import 'package:gag_cars_frontend/Utils/ApiUtils/apiUtils.dart';
import 'package:http/http.dart' as http;

class ChatService {
  static const String baseUrl = 'https://dashboard.gagcars.com/api';
  
  // Fetch chat conversations/list
  static Future<Map<String, dynamic>> fetchChats({
    required String token,
    int perPage = 20,
    int? lastMessageId,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/chat/fetchMessages'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: json.encode({
          'per_page': perPage,
          'last_message_id': lastMessageId,
        }),
      );

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to fetch chats: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to fetch chats: $e');
    }
  }

  // Send a message
  static Future<Map<String, dynamic>> sendMessage({
    required String token,
    required String recipientId,
    required String message,
    String? chatId,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/chat/sendMessage'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: json.encode({
          'recipient_id': recipientId,
          'message': message,
          'chat_id': chatId,
        }),
      );

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to send message: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to send message: $e');
    }
  }

  // Fetch messages for a specific chat
  static Future<Map<String, dynamic>> fetchChatMessages({
    required String chatId,
    int perPage = 50,
    int? lastMessageId,
  }) async {
    final uri = Uri.parse('$baseApiUrl${ApiEndpoint.fetchMessages}');
    try {
      final token = await AuthService.getToken();
      final response = await http.post(
        uri,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: json.encode({
          'chat_id': chatId,
          'per_page': perPage,
          'last_message_id': lastMessageId,
        }),
      );

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to fetch messages: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to fetch messages: $e');
    }
  }
}