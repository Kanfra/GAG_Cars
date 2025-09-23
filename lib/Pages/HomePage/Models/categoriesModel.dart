import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'categoriesModel.freezed.dart';
part 'categoriesModel.g.dart';

// Your existing Categories model (keeping it as is)
@freezed
class Categories with _$Categories {
  const factory Categories({
    required int id,
    @JsonKey(name: 'user_id') String? userId,
    @JsonKey(name: 'parent_id') int? parentId,
    required String name,
    @Default('') String slug,
    @Default('') String description,
    @Default([]) List<String> features,
    @Default('assets/images/category_placeholder.png') String image,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _Categories;

  factory Categories.fromJson(Map<String, dynamic> json) =>
      _$CategoriesFromJson(json);
}

// New extended model for detailed category with fields
@freezed
class ItemField with _$ItemField {
  const factory ItemField({
    required int id,
    required String name,
    required String label,
    required String type,
    @JsonKey(name: 'required') required int isRequired,
    required int unique,
    required int nullable,
    dynamic options,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
    Map<String, dynamic>? pivot,
    @JsonKey(name: 'options_keys') List<String>? optionsKeys,
  }) = _ItemField;

  factory ItemField.fromJson(Map<String, dynamic> json) => _$ItemFieldFromJson(json);
}

@freezed
class DetailedCategory with _$DetailedCategory {
  const factory DetailedCategory({
    required int id,
    @JsonKey(name: 'user_id') String? userId,
    @JsonKey(name: 'parent_id') int? parentId,
    required String name,
    @Default('') String slug,
    @Default('') String description,
    @Default([]) List<String> features,
    @Default('assets/images/category_placeholder.png') String image,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
    @JsonKey(name: 'item_fields') @Default([]) List<ItemField> itemFields,
    @JsonKey(name: 'highlighted_fields') @Default([]) List<ItemField> highlightedFields,
  }) = _DetailedCategory;

  factory DetailedCategory.fromJson(Map<String, dynamic> json) => _$DetailedCategoryFromJson(json);
}

@freezed
class CategoriesResponse with _$CategoriesResponse {
  const factory CategoriesResponse({
    @Default([]) List<Categories> data,
  }) = _CategoriesResponse;

  factory CategoriesResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoriesResponseFromJson(json);
}

@freezed
class DetailedCategoryResponse with _$DetailedCategoryResponse {
  const factory DetailedCategoryResponse({
    required DetailedCategory data,
  }) = _DetailedCategoryResponse;

  factory DetailedCategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$DetailedCategoryResponseFromJson(json);
}