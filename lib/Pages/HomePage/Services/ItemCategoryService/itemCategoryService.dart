import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Models/itemCategoryModel.dart';
import 'package:gag_cars_frontend/Utils/ApiUtils/apiEnpoints.dart';
import 'package:gag_cars_frontend/Utils/ApiUtils/apiUtils.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class ItemCategoryService {
  // Fetch all categories (used)
  Future<ItemCategoryResponse> getAllCategories({
    int page = 1,
    int perPage = 15,
  }) async {
    final endpoint = '${ApiEndpoint.categories}?page=$page&per_page=$perPage';
    
    return fetchApiData<ItemCategoryResponse>(
      endpoint: endpoint,
      fromJson: (json) => ItemCategoryResponse.fromJson(json),
    );
  }

  // Fetch a single category by ID
  Future<ItemCategory> getCategoryById(int id) async {
    final endpoint = '${ApiEndpoint.categories}/$id';
    
    return fetchApiData<ItemCategory>(
      endpoint: endpoint,
      fromJson: (json) => ItemCategory.fromJson(json['data']),
    );
  }

  // Create a new category
  Future<ItemCategory> createCategory({
    required String name,
    required String description,
    int? parentId,
    List<String>? features,
    String? imagePath,
  }) async {
    final endpoint = ApiEndpoint.categories;
    final body = {
      'name': name,
      'description': description,
      if (parentId != null) 'parent_id': parentId,
      if (features != null && features.isNotEmpty) 'features': features,
      if (imagePath != null) 'image': imagePath,
    };

    return postApiData<ItemCategory>(
      endpoint: endpoint,
      body: body,
      fromJson: (json) => ItemCategory.fromJson(json['data']),
    );
  }

  // Update an existing category
  Future<ItemCategory> updateCategory({
    required int id,
    String? name,
    String? description,
    int? parentId,
    List<String>? features,
    String? imagePath,
  }) async {
    final endpoint = '${ApiEndpoint.categories}/$id';
    final body = {
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (parentId != null) 'parent_id': parentId,
      if (features != null) 'features': features,
      if (imagePath != null) 'image': imagePath,
    };

    return postApiData<ItemCategory>(
      endpoint: endpoint,
      body: body,
      fromJson: (json) => ItemCategory.fromJson(json['data']),
    );
  }

  // Delete a category
  Future<void> deleteCategory(int id) async {
    final endpoint = '${ApiEndpoint.categories}/$id';
    final uri = Uri.parse('$baseApiUrl$endpoint');
    const storage = FlutterSecureStorage();
    final logger = Logger();

    try {
      final token = await storage.read(key: 'auth_token');
      logger.i("Your secured token: $token");
      
      final response = await http.delete(
        uri,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          if (token != null) 'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode >= 200 && response.statusCode < 300) {
        logger.i("Successfully deleted category $id");
        return;
      } else {
        logger.e("Failed to delete category: ${response.statusCode} - $uri");
        throw ApiRequestException(
          'Failed to delete category',
          response.statusCode,
          uri: uri,
          responseBody: response.body,
        );
      }
    } on http.ClientException catch (e) {
      logger.e("Network error: ${e.message}");
      throw NetworkException(e.message);
    } catch (e, stackTrace) {
      logger.e("Unexpected error deleting category", error: e, stackTrace: stackTrace);
      throw ApiException('Failed to delete category: $e');
    }
  }

  // Get image URL for a category
  String getCategoryImageUrl(String? imagePath, String? defaultImagePath) {
    return getImageUrl(imagePath, defaultImagePath);
  }
}
