// category_model.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'categoriesModel.freezed.dart';
part 'categoriesModel.g.dart';

@freezed
class Categories with _$Categories {
  const factory Categories({
    required int id,
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'parent_id') required int parentId,
    required String name,
    required String slug,
    required String description,
    required List<String?> features, // Handles null values in array
    required String image,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _Categories;

  factory Categories.fromJson(Map<String, dynamic> json) =>
      _$CategoriesFromJson(json);
}

@freezed
class CategoriesResponse with _$CategoriesResponse {
  const factory CategoriesResponse({
    required List<Categories> data,
  }) = _CategoriesResponse;

  factory CategoriesResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoriesResponseFromJson(json);
}