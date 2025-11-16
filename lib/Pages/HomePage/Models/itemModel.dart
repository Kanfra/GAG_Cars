// itemModel.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'itemModel.freezed.dart';
part 'itemModel.g.dart';

@freezed
class User with _$User {
  const factory User({
    required String id,
    required String name,
    required String email,
    String? phone,
    @JsonKey(name: 'email_verified_at') DateTime? emailVerifiedAt,
    @JsonKey(name: 'paid_seller') int? paidSeller,
    @JsonKey(name: 'deleted_at') DateTime? deletedAt,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    @JsonKey(name: 'country_id') int? countryId,
    @JsonKey(name: 'state_id') int? stateId,
    @JsonKey(name: 'profile_photo') String? profilePhoto,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

@freezed
class Brand with _$Brand {
  const factory Brand({
    required int id,
    @JsonKey(name: 'user_id') String? userId,
    required String name,
    required String slug,
    String? image,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
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
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
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
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) => 
      _$CategoryFromJson(json);
}

@freezed
class SingleItem with _$SingleItem {
  const factory SingleItem({
    required String id,
    @JsonKey(name: 'user_id') String? userId,
    @JsonKey(name: 'country_id') int? countryId,
    @JsonKey(name: 'brand_model_id') int? brandModelId,
    @JsonKey(name: 'brand_id') int? brandId,
    @JsonKey(name: 'category_id') int? categoryId,
    String? name,
    String? year,
    String? slug,
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
    String? status,
    String? price,
    String? mileage,
    int? warranty,
    @JsonKey(name: 'warranty_expiration') DateTime? warrantyExpiration,
    @JsonKey(name: 'deleted_at') DateTime? deletedAt,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    @JsonKey(name: 'Height') String? height,
    @JsonKey(name: 'VIN') String? vin,
    Brand? brand,
    Category? category,
    @JsonKey(name: 'brand_model') BrandModel? brandModel,
    User? user,
    @JsonKey(name: 'is_promoted') bool? isPromoted,
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
    @JsonKey(name: 'current_page') required int currentPage,
    required int? from,
    @JsonKey(name: 'last_page') required int lastPage,
    required List<SingleItemMetaLink> links,
    required String path,
    @JsonKey(name: 'per_page') required int perPage,
    required int? to,
    required int total,
  }) = _SingleItemMeta;

  factory SingleItemMeta.fromJson(Map<String, dynamic> json) => 
      _$SingleItemMetaFromJson(json);
}

@freezed
class SingleItemMetaLink with _$SingleItemMetaLink {
  const factory SingleItemMetaLink({
    String? url,
    required String label,
    int? page,
    required bool active,
  }) = _SingleItemMetaLink;

  factory SingleItemMetaLink.fromJson(Map<String, dynamic> json) => 
      _$SingleItemMetaLinkFromJson(json);
}