import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'categoriesModel.freezed.dart';
part 'categoriesModel.g.dart';

// Pagination Links Model
@freezed
class PaginationLinks with _$PaginationLinks {
  const factory PaginationLinks({
    String? first,
    String? last,
    String? prev,
    String? next,
  }) = _PaginationLinks;

  factory PaginationLinks.fromJson(Map<String, dynamic> json) =>
      _$PaginationLinksFromJson(json);
}

// Pagination Meta Model
@freezed
class PaginationMeta with _$PaginationMeta {
  const factory PaginationMeta({
    required int current_page,
    required int from,
    required int last_page,
    required String path,
    required int per_page,
    required int to,
    required int total,
    @Default([]) List<dynamic> links,
  }) = _PaginationMeta;

  factory PaginationMeta.fromJson(Map<String, dynamic> json) =>
      _$PaginationMetaFromJson(json);
}

// Link Model for Meta
@freezed
class MetaLink with _$MetaLink {
  const factory MetaLink({
    String? url,
    required String label,
    int? page,
    required bool active,
  }) = _MetaLink;

  factory MetaLink.fromJson(Map<String, dynamic> json) =>
      _$MetaLinkFromJson(json);
}

// Item Field Model
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
    dynamic options, // Can be List, Map, or null
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
    Map<String, dynamic>? pivot,
    @JsonKey(name: 'options_keys') List<String>? optionsKeys,
  }) = _ItemField;

  factory ItemField.fromJson(Map<String, dynamic> json) =>
      _$ItemFieldFromJson(json);
}

// Main Category Model (Updated with missing fields)
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
    // Added missing fields from API response
    @JsonKey(name: 'item_fields') @Default([]) List<ItemField> itemFields,
    @JsonKey(name: 'highlighted_fields') @Default([]) List<ItemField> highlightedFields,
  }) = _Categories;

  factory Categories.fromJson(Map<String, dynamic> json) =>
      _$CategoriesFromJson(json);
}

// Categories Response Model (Updated with pagination)
@freezed
class CategoriesResponse with _$CategoriesResponse {
  const factory CategoriesResponse({
    @Default([]) List<Categories> data,
    required PaginationLinks links,
    required PaginationMeta meta,
  }) = _CategoriesResponse;

  factory CategoriesResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoriesResponseFromJson(json);
}

// Detailed Category Model
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

  factory DetailedCategory.fromJson(Map<String, dynamic> json) =>
      _$DetailedCategoryFromJson(json);
}

// Detailed Category Response Model
@freezed
class DetailedCategoryResponse with _$DetailedCategoryResponse {
  const factory DetailedCategoryResponse({
    required DetailedCategory data,
  }) = _DetailedCategoryResponse;

  factory DetailedCategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$DetailedCategoryResponseFromJson(json);
}