import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'categoriesModel.freezed.dart';
part 'categoriesModel.g.dart';

@freezed
class Categories with _$Categories {
  const factory Categories({
    required int id,
    @JsonKey(name: 'user_id') String? userId, // Changed to nullable
    @JsonKey(name: 'parent_id') int? parentId, // Changed to nullable
    required String name,
    @Default('') String slug, // Added default value
    @Default('') String description, // Added default value
    @Default([]) List<String> features, // Removed nullable items
    @Default('assets/images/category_placeholder.png') String image, // Added default
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _Categories;

  factory Categories.fromJson(Map<String, dynamic> json) =>
      _$CategoriesFromJson(json);
}

@freezed
class CategoriesResponse with _$CategoriesResponse {
  const factory CategoriesResponse({
    @Default([]) List<Categories> data, // Added default empty list
  }) = _CategoriesResponse;

  factory CategoriesResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoriesResponseFromJson(json);
}