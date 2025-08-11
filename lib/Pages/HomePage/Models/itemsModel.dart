// recommended_model.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'itemsModel.freezed.dart';
part 'itemsModel.g.dart';

@freezed
class Brand with _$Brand {
  const factory Brand({
    required int id,
    @JsonKey(name: 'user_id') String? userId,
    required String name,
    required String slug,
    String? image,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _Brand;

  factory Brand.fromJson(Map<String, dynamic> json) => _$BrandFromJson(json);
}

@freezed
class BrandModel with _$BrandModel {
  const factory BrandModel({
    required int id,
    @JsonKey(name: 'brand_id') required int brandId,
    required String name,
    required String slug,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _BrandModel;

  factory BrandModel.fromJson(Map<String, dynamic> json) => 
      _$BrandModelFromJson(json);
}

@freezed
class Category with _$Category {
  const factory Category({
    required int id,
    @JsonKey(name: 'user_id') String? userId,
    @JsonKey(name: 'parent_id') int? parentId,
    required String name,
    required String slug,
    String? description,
    List<String>? features,
    String? image,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) => 
      _$CategoryFromJson(json);
}

@freezed
class RecommendedItem with _$RecommendedItem {
  const factory RecommendedItem({
    required String id, // Keep required if truly mandatory
    @JsonKey(name: 'user_id') String? userId,
    @JsonKey(name: 'country_id') int? countryId,
    @JsonKey(name: 'brand_model_id') int? brandModelId,
    @JsonKey(name: 'brand_id') int? brandId,
    @JsonKey(name: 'category_id') int? categoryId,
    String? name, // Make nullable
    String? year, // Make nullable
    String? slug, // Make nullable
    String? description,
    List<String>? images,
    String? location,
    @JsonKey(name: 'serial_number') String? serialNumber,
    String? condition,
    @JsonKey(name: 'steer_position') String? steerPosition,
    @JsonKey(name: 'engine_capacity') String? engineCapacity,
    String? transmission,
    String? color,
    @JsonKey(name: 'build_type') String? buildType,
    @JsonKey(name: 'number_of_passengers') int? numberOfPassengers,
    List<String>? features,
    String? status, // Make nullable
    String? price, // Make nullable
    String? mileage,
    int? warranty, // Make nullable
    @JsonKey(name: 'warranty_expiration') String? warrantyExpiration,
    @JsonKey(name: 'deleted_at') String? deletedAt,
    @JsonKey(name: 'created_at') DateTime? createdAt, // Make nullable
    @JsonKey(name: 'updated_at') DateTime? updatedAt, // Make nullable
    Brand? brand,
    Category? category,
    @JsonKey(name: 'brand_model') BrandModel? brandModel,
    @JsonKey(name: 'brandModel') BrandModel? brandModelAlt,
  }) = _RecommendedItem;

  factory RecommendedItem.fromJson(Map<String, dynamic> json) => 
      _$RecommendedItemFromJson(json);
}

@freezed
class RecommendedResponse with _$RecommendedResponse {
  const factory RecommendedResponse({
    required List<RecommendedItem> data,
    required RecommendedLinks links,
    required RecommendedMeta meta,
  }) = _RecommendedResponse;

  factory RecommendedResponse.fromJson(Map<String, dynamic> json) => 
      _$RecommendedResponseFromJson(json);
}

@freezed
class RecommendedLinks with _$RecommendedLinks {
  const factory RecommendedLinks({
    required String first,
    required String last,
    String? prev,
    String? next,
  }) = _RecommendedLinks;

  factory RecommendedLinks.fromJson(Map<String, dynamic> json) => 
      _$RecommendedLinksFromJson(json);
}

@freezed
class RecommendedMeta with _$RecommendedMeta {
  const factory RecommendedMeta({
    @JsonKey(name: 'current_page') required int currentPage,
    required int from,
    @JsonKey(name: 'last_page') required int lastPage,
    required List<RecommendedMetaLink> links,
    required String path,
    @JsonKey(name: 'per_page') required int perPage,
    required int to,
    required int total,
  }) = _RecommendedMeta;

  factory RecommendedMeta.fromJson(Map<String, dynamic> json) => 
      _$RecommendedMetaFromJson(json);
}

@freezed
class RecommendedMetaLink with _$RecommendedMetaLink {
  const factory RecommendedMetaLink({
    String? url,
    required String label,
    required bool active,
  }) = _RecommendedMetaLink;

  factory RecommendedMetaLink.fromJson(Map<String, dynamic> json) => 
      _$RecommendedMetaLinkFromJson(json);
}