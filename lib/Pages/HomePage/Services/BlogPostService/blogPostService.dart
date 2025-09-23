import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gag_cars_frontend/Pages/Authentication/Services/authService.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Models/postResponse.dart';
import 'package:gag_cars_frontend/Utils/ApiUtils/apiEnpoints.dart';
import 'package:gag_cars_frontend/Utils/ApiUtils/apiUtils.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class BlogPostService {
  static final Logger _logger = Logger();
  static const Duration _timeoutDuration = Duration(seconds: 30);
  static const Map<String, String> _defaultHeaders = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  // Singleton instance
  static final BlogPostService _instance = BlogPostService._internal();
  factory BlogPostService() => _instance;
  BlogPostService._internal();

  // UPDATED: Accept query parameters for flexible filtering
  Future<PostsResponse> getPosts({Map<String, dynamic>? queryParams}) async {
    // Default parameters
    final defaultParams = {
      'page': '1',
      'per_page': '15',
    };

    // Merge default params with provided params
    final mergedParams = {...defaultParams, ...?queryParams};

    final uri = Uri.parse('$baseApiUrl${ApiEndpoint.posts}')
        .replace(queryParameters: mergedParams);

    _logger.i('Fetching posts - Query: $mergedParams');

    try {
      final token = await AuthService.getToken();
      
      if (token == null || token.isEmpty) {
        _logger.w('No authentication token available');
        throw Exception('Authentication required. Please login again.');
      }

      final headers = {
        ..._defaultHeaders,
        'Authorization': 'Bearer $token',
      };

      final response = await http.get(uri, headers: headers)
          .timeout(_timeoutDuration);

      return _handleResponse(response);

    } on SocketException {
      _logger.e('No internet connection');
      throw Exception('No internet connection. Please check your network and try again.');
    } on TimeoutException {
      _logger.e('Request timed out after ${_timeoutDuration.inSeconds} seconds');
      throw Exception('Request timed out. Please check your connection and try again.');
    } on HttpException catch (e) {
      _logger.e('HTTP error: ${e.message}');
      throw Exception('Network error: ${e.message}');
    } on FormatException catch (e) {
      _logger.e('JSON parsing error: ${e.message}');
      throw Exception('Invalid data format received from server.');
    } catch (e) {
      _logger.e('Unexpected error: $e');
      throw Exception('An unexpected error occurred. Please try again.');
    }
  }

  // Convenience method for backward compatibility
  Future<PostsResponse> getPostsWithPage({int page = 1, int perPage = 15}) async {
    return getPosts(queryParams: {
      'page': page.toString(),
      'per_page': perPage.toString(),
    });
  }

  // Method for getting posts by category name
  Future<PostsResponse> getPostsByCategoryName(String categoryName, {int page = 1}) async {
    return getPosts(queryParams: {
      'page': page.toString(),
      'category': categoryName.toLowerCase(),
    });
  }

  // Method for getting posts by category ID
  Future<PostsResponse> getPostsByCategoryId(int categoryId, {int page = 1}) async {
    return getPosts(queryParams: {
      'page': page.toString(),
      'category_id': categoryId.toString(),
    });
  }

  PostsResponse _handleResponse(http.Response response) {
    _logger.d('Response status: ${response.statusCode}');
    
    switch (response.statusCode) {
      case 200:
        return _parseResponse(response.body);
      
      case 400:
        _logger.e('Bad request: ${response.body}');
        throw Exception('Invalid request. Please try again.');
      
      case 401:
      case 403:
        _logger.w('Authentication failed - Status: ${response.statusCode}');
        throw Exception('Authentication failed. Please login again.');
      
      case 404:
        _logger.e('Resource not found');
        throw Exception('Requested resource not found.');
      
      case 500:
      case 502:
      case 503:
        _logger.e('Server error: ${response.statusCode}');
        throw Exception('Server is temporarily unavailable. Please try again later.');
      
      default:
        _logger.e('Unexpected status code: ${response.statusCode}');
        throw Exception('Server returned an unexpected error: ${response.statusCode}');
    }
  }

  PostsResponse _parseResponse(String responseBody) {
    try {
      final Map<String, dynamic> jsonResponse = json.decode(responseBody);
      _logger.i('Successfully parsed ${jsonResponse['data']?.length ?? 0} posts');
      return PostsResponse.fromJson(jsonResponse);
    } on FormatException catch (e) {
      _logger.e('JSON decoding failed: ${e.message}');
      _logger.e('Response body: $responseBody');
      throw FormatException('Failed to parse server response: ${e.message}');
    } on CheckedFromJsonException catch (e) {
      _logger.e('Model parsing failed: ${e.message}');
      throw Exception('Data format error. Please contact support.');
    }
  }

  // Method for getting single post by ID
  Future<Post> getPostById(String postId) async {
    final uri = Uri.parse('$baseApiUrl${ApiEndpoint.posts}/$postId');
    _logger.i('Fetching post with ID: $postId');

    try {
      final token = await AuthService.getToken();
      final headers = {
        ..._defaultHeaders,
        'Authorization': 'Bearer $token',
      };

      final response = await http.get(uri, headers: headers)
          .timeout(_timeoutDuration);

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = json.decode(response.body);
        return Post.fromJson(jsonResponse['data'] ?? jsonResponse);
      } else {
        throw Exception('Failed to fetch post: ${response.statusCode}');
      }
    } catch (e) {
      _logger.e('Error fetching post $postId: $e');
      rethrow;
    }
  }
}