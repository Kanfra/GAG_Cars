import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gag_cars_frontend/Pages/Authentication/Services/authService.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Models/postResponse.dart';
import 'package:gag_cars_frontend/Utils/ApiUtils/apiEnpoints.dart';
import 'package:gag_cars_frontend/Utils/ApiUtils/apiUtils.dart';
import 'package:http/http.dart' as http;
import 'package:logger/Logger.dart';

class BlogPostService {
  final logger = Logger();
  final Duration timeoutDuration = const Duration(seconds: 30);
  // endpoint
  // token
  Future<PostsResponse> getPosts({ int page = 1}) async {
    final uri = Uri.parse('$baseApiUrl${ApiEndpoint.posts}?page=$page');
    try {
      // get token
      final token = await AuthService.getToken();
      final response = await http.get(
        uri,
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        }
      ).timeout(timeoutDuration, onTimeout: (){
        logger.w('Request timed out after ${timeoutDuration.inSeconds} seconds');
        throw Exception('Request timed out after ${timeoutDuration.inSeconds} seconds');
      });

      if(response.statusCode == 200){
        try {
          final Map<String, dynamic> jsonResponse = json.decode(response.body);
          logger.i("Blog Post Response Body: $jsonResponse");
          return PostsResponse.fromJson(jsonResponse);
        } on FormatException {
          logger.e('Failed to parse JSON response');
          throw FormatException('Invalid server response format');
        }
      } else if(response.statusCode == 401 || response.statusCode == 400){
        logger.e('Unauthorized access');
        throw Exception('Authentication failed. Please login again.');
      } else {
        logger.e('Failed to laod post: ${response.statusCode}');
        throw Exception('Failed to load posts. Error: ${response.statusCode}');
      }
    } on SocketException {
      logger.e('No internet connection');
      throw Exception('No internet connection. Please check your network.');
    } on TimeoutException {
      logger.e('Request timed out');
      throw Exception('Request timed out. Please try again.');
    } on HttpException {
      logger.e('HTTP error occurred');
      throw Exception('Network error occurred. Please try again.');
    } on FormatException {
      logger.e('Invalid response format');
      throw Exception('Invalid data received from server.');
    } catch (e) {
      logger.e('Unexpected error: $e');
      throw Exception('An unexpected error occurred: ${e.toString()}');
    }
  }
}