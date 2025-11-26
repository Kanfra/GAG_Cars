// itemModel.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'itemModel.freezed.dart';
part 'itemModel.g.dart';

// Helper functions for JSON parsing
String _parseDynamicToString(dynamic value) {
  if (value == null) return '';
  if (value is String) return value;
  if (value is int) return value.toString();
  if (value is double) return value.toString();
  return value.toString();
}

int _parseDynamicToInt(dynamic value) {
  if (value == null) return 0;
  if (value is int) return value;
  if (value is String) {
    if (value.isEmpty) return 0;
    return int.tryParse(value) ?? 0;
  }
  if (value is double) return value.toInt();
  return 0;
}

bool _parseDynamicToBool(dynamic value) {
  if (value == null) return false;
  if (value is bool) return value;
  if (value is int) return value == 1;
  if (value is String) {
    return value.toLowerCase() == 'true' || value == '1';
  }
  return false;
}

@freezed
class User with _$User {
  const factory User({
    @JsonKey(fromJson: _parseDynamicToString) required String id,
    required String name,
    required String email,
    String? phone,
    @JsonKey(name: 'email_verified_at') DateTime? emailVerifiedAt,
    @JsonKey(name: 'paid_seller', fromJson: _parseDynamicToInt) int? paidSeller,
    @JsonKey(name: 'deleted_at') DateTime? deletedAt,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    @JsonKey(name: 'country_id', fromJson: _parseDynamicToInt) int? countryId,
    @JsonKey(name: 'state_id', fromJson: _parseDynamicToInt) int? stateId,
    @JsonKey(name: 'profile_photo', fromJson: _parseDynamicToString) String? profilePhoto,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

@freezed
class Brand with _$Brand {
  const factory Brand({
    @JsonKey(fromJson: _parseDynamicToInt) required int id,
    @JsonKey(name: 'user_id', fromJson: _parseDynamicToString) String? userId,
    required String name,
    required String slug,
    @JsonKey(fromJson: _parseDynamicToString) String? image,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _Brand;

  factory Brand.fromJson(Map<String, dynamic> json) => _$BrandFromJson(json);
}

@freezed
class BrandModel with _$BrandModel {
  const factory BrandModel({
    @JsonKey(fromJson: _parseDynamicToInt) required int id,
    @JsonKey(name: 'brand_id', fromJson: _parseDynamicToInt) required int brandId,
    required String name,
    required String slug,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _BrandModel;

  factory BrandModel.fromJson(Map<String, dynamic> json) => 
      _$BrandModelFromJson(json);
}

@freezed
class Category with _$Category {
  const factory Category({
    @JsonKey(fromJson: _parseDynamicToInt) required int id,
    @JsonKey(name: 'user_id', fromJson: _parseDynamicToString) String? userId,
    @JsonKey(name: 'parent_id', fromJson: _parseDynamicToInt) int? parentId,
    required String name,
    required String slug,
    @JsonKey(fromJson: _parseDynamicToString) String? description,
    List<String>? features,
    @JsonKey(fromJson: _parseDynamicToString) String? image,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) => 
      _$CategoryFromJson(json);
}

@freezed
class SingleItem with _$SingleItem {
  const factory SingleItem({
    @JsonKey(fromJson: _parseDynamicToString) required String id,
    @JsonKey(name: 'user_id', fromJson: _parseDynamicToString) String? userId,
    @JsonKey(name: 'country_id', fromJson: _parseDynamicToInt) int? countryId,
    @JsonKey(name: 'brand_model_id', fromJson: _parseDynamicToInt) int? brandModelId,
    @JsonKey(name: 'brand_id', fromJson: _parseDynamicToInt) int? brandId,
    @JsonKey(name: 'category_id', fromJson: _parseDynamicToInt) int? categoryId,
    @JsonKey(fromJson: _parseDynamicToString) String? name,
    @JsonKey(fromJson: _parseDynamicToString) String? year,
    @JsonKey(fromJson: _parseDynamicToString) String? slug,
    @JsonKey(fromJson: _parseDynamicToString) String? description,
    List<String>? images,
    @JsonKey(fromJson: _parseDynamicToString) String? location,
    @JsonKey(name: 'serial_number', fromJson: _parseDynamicToString) String? serialNumber,
    @JsonKey(fromJson: _parseDynamicToString) String? condition,
    @JsonKey(name: 'steer_position', fromJson: _parseDynamicToString) String? steerPosition,
    @JsonKey(name: 'engine_capacity', fromJson: _parseDynamicToString) String? engineCapacity,
    @JsonKey(fromJson: _parseDynamicToString) String? transmission,
    @JsonKey(fromJson: _parseDynamicToString) String? color,
    @JsonKey(name: 'build_type', fromJson: _parseDynamicToString) String? buildType,
    @JsonKey(name: 'number_of_passengers', fromJson: _parseDynamicToInt) int? numberOfPassengers,
    List<String>? features,
    @JsonKey(fromJson: _parseDynamicToString) String? status,
    @JsonKey(fromJson: _parseDynamicToString) String? price,
    @JsonKey(fromJson: _parseDynamicToString) String? mileage,
    @JsonKey(fromJson: _parseDynamicToInt) int? warranty,
    @JsonKey(name: 'warranty_expiration') DateTime? warrantyExpiration,
    @JsonKey(name: 'deleted_at') DateTime? deletedAt,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    @JsonKey(name: 'Height', fromJson: _parseDynamicToString) String? height,
    @JsonKey(name: 'VIN', fromJson: _parseDynamicToString) String? vin,
    Brand? brand,
    Category? category,
    @JsonKey(name: 'brand_model') BrandModel? brandModel,
    User? user,
    @JsonKey(name: 'is_promoted', fromJson: _parseDynamicToBool) bool? isPromoted,
  }) = _SingleItem;

  factory SingleItem.fromJson(Map<String, dynamic> json) => _$SingleItemFromJson(json);
}

@freezed
class SingleItemResponse with _$SingleItemResponse {
  const factory SingleItemResponse({
    required List<SingleItem> data,
    required SingleItemLinks links,
    required SingleItemMeta meta,
  }) = _SingleItemResponse;

  factory SingleItemResponse.fromJson(Map<String, dynamic> json) => 
      _$SingleItemResponseFromJson(json);
}

@freezed
class SingleItemLinks with _$SingleItemLinks {
  const factory SingleItemLinks({
    required String first,
    required String last,
    String? prev,
    String? next,
  }) = _SingleItemLinks;

  factory SingleItemLinks.fromJson(Map<String, dynamic> json) => 
      _$SingleItemLinksFromJson(json);
}

@freezed
class SingleItemMeta with _$SingleItemMeta {
  const factory SingleItemMeta({
    @JsonKey(name: 'current_page', fromJson: _parseDynamicToInt) required int currentPage,
    @JsonKey(fromJson: _parseDynamicToInt) required int? from,
    @JsonKey(name: 'last_page', fromJson: _parseDynamicToInt) required int lastPage,
    required List<SingleItemMetaLink> links,
    required String path,
    @JsonKey(name: 'per_page', fromJson: _parseDynamicToInt) required int perPage,
    @JsonKey(fromJson: _parseDynamicToInt) required int? to,
    @JsonKey(fromJson: _parseDynamicToInt) required int total,
  }) = _SingleItemMeta;

  factory SingleItemMeta.fromJson(Map<String, dynamic> json) => 
      _$SingleItemMetaFromJson(json);
}

@freezed
class SingleItemMetaLink with _$SingleItemMetaLink {
  const factory SingleItemMetaLink({
    @JsonKey(fromJson: _parseDynamicToString) String? url,
    @JsonKey(fromJson: _parseDynamicToString) required String label,
    @JsonKey(fromJson: _parseDynamicToInt) int? page,
    @JsonKey(fromJson: _parseDynamicToBool) required bool active,
  }) = _SingleItemMetaLink;

  factory SingleItemMetaLink.fromJson(Map<String, dynamic> json) => 
      _$SingleItemMetaLinkFromJson(json);
}