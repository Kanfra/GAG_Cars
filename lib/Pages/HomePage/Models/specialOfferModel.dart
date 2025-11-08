import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'specialOfferModel.freezed.dart';
part 'specialOfferModel.g.dart';

@freezed
class SpecialOfferResponse with _$SpecialOfferResponse {
  const factory SpecialOfferResponse({
    @Default([]) List<SpecialOffer> data,
    PaginationLinks? links,
    PaginationMeta? meta,
  }) = _SpecialOfferResponse;

  factory SpecialOfferResponse.fromJson(Map<String, dynamic> json) =>
      _$SpecialOfferResponseFromJson(json);
}

@freezed
class SpecialOffer with _$SpecialOffer {
  const factory SpecialOffer({
    @JsonKey(fromJson: _parseInt) required int id,
    @JsonKey(name: 'user_id') String? userId,
    @JsonKey(name: 'item_id', fromJson: _parseString) required String itemId,
    @JsonKey(name: 'start_at', fromJson: _parseString) required String startAt,
    @JsonKey(name: 'end_at', fromJson: _parseString) required String endAt,
    @JsonKey(fromJson: _parseString) required String status,
    @JsonKey(fromJson: _parseInt) required int discount,
    @JsonKey(name: 'discount_type', fromJson: _parseString) required String discountType,
    String? description,
    @JsonKey(name: 'created_at', fromJson: _parseString) required String createdAt,
    @JsonKey(name: 'updated_at', fromJson: _parseString) required String updatedAt,
    Item? item,
  }) = _SpecialOffer;

  factory SpecialOffer.fromJson(Map<String, dynamic> json) =>
      _$SpecialOfferFromJson(json);
}

@freezed
class Item with _$Item {
  const factory Item({
    @JsonKey(fromJson: _parseString) required String id,
    @JsonKey(name: 'user_id') String? userId,
    @JsonKey(name: 'country_id', fromJson: _parseInt) int? countryId,
    @JsonKey(name: 'brand_model_id', fromJson: _parseInt) int? brandModelId,
    @JsonKey(name: 'brand_id', fromJson: _parseInt) int? brandId,
    @JsonKey(name: 'category_id', fromJson: _parseInt) int? categoryId,
    @JsonKey(fromJson: _parseString) required String name,
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
    @JsonKey(name: 'number_of_passengers', fromJson: _parseInt) int? numberOfPassengers,
    List<String>? features,
    String? status,
    String? price,
    String? mileage,
    @JsonKey(fromJson: _parseInt) int? warranty,
    @JsonKey(name: 'warranty_expiration') String? warrantyExpiration,
    @JsonKey(name: 'deleted_at') String? deletedAt,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
    // New fields from response
    String? Height,
    String? VIN,
    Brand? brand,
    Category? category,
    @JsonKey(name: 'brand_model') BrandModel? brandModel,
    User? user,
  }) = _Item;

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
}

@freezed
class User with _$User {
  const factory User({
    @JsonKey(fromJson: _parseString) required String id,
    @JsonKey(fromJson: _parseString) required String name,
    @JsonKey(fromJson: _parseString) required String email,
    String? phone,
    @JsonKey(name: 'email_verified_at') String? emailVerifiedAt,
    @JsonKey(name: 'paid_seller', fromJson: _parseInt) int? paidSeller,
    @JsonKey(name: 'deleted_at') String? deletedAt,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
    @JsonKey(name: 'country_id', fromJson: _parseInt) int? countryId,
    @JsonKey(name: 'state_id', fromJson: _parseInt) int? stateId,
    @JsonKey(name: 'profile_photo') String? profilePhoto,
    @JsonKey(name: 'uploads_left', fromJson: _parseInt) int? uploadsLeft,
    @JsonKey(name: 'active_status', fromJson: _parseInt) int? activeStatus,
    String? avatar,
    @JsonKey(name: 'dark_mode', fromJson: _parseInt) int? darkMode,
    @JsonKey(name: 'messenger_color') String? messengerColor,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

@freezed
class Brand with _$Brand {
  const factory Brand({
    @JsonKey(fromJson: _parseInt) required int id,
    @JsonKey(name: 'user_id') String? userId,
    @JsonKey(fromJson: _parseString) required String name,
    String? slug,
    String? image,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
  }) = _Brand;

  factory Brand.fromJson(Map<String, dynamic> json) => _$BrandFromJson(json);
}

@freezed
class Category with _$Category {
  const factory Category({
    @JsonKey(fromJson: _parseInt) required int id,
    @JsonKey(name: 'user_id') String? userId,
    @JsonKey(name: 'parent_id', fromJson: _parseString) String? parentId,
    @JsonKey(fromJson: _parseString) required String name,
    String? slug,
    String? description,
    List<String>? features,
    String? image,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
  }) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
}

@freezed
class BrandModel with _$BrandModel {
  const factory BrandModel({
    @JsonKey(fromJson: _parseInt) required int id,
    @JsonKey(name: 'brand_id', fromJson: _parseInt) int? brandId,
    @JsonKey(fromJson: _parseString) required String name,
    String? slug,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
  }) = _BrandModel;

  factory BrandModel.fromJson(Map<String, dynamic> json) =>
      _$BrandModelFromJson(json);
}

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

@freezed
class PaginationMeta with _$PaginationMeta {
  const factory PaginationMeta({
    @JsonKey(name: 'current_page', fromJson: _parseInt) required int currentPage,
    @JsonKey(fromJson: _parseInt) int? from,
    @JsonKey(name: 'last_page', fromJson: _parseInt) int? lastPage,
    List<PaginationMetaLink>? links,
    String? path,
    @JsonKey(name: 'per_page', fromJson: _parseInt) int? perPage,
    @JsonKey(fromJson: _parseInt) int? to,
    @JsonKey(fromJson: _parseInt) int? total,
  }) = _PaginationMeta;

  factory PaginationMeta.fromJson(Map<String, dynamic> json) =>
      _$PaginationMetaFromJson(json);
}

@freezed
class PaginationMetaLink with _$PaginationMetaLink {
  const factory PaginationMetaLink({
    String? url,
    String? label,
    bool? active,
  }) = _PaginationMetaLink;

  factory PaginationMetaLink.fromJson(Map<String, dynamic> json) =>
      _$PaginationMetaLinkFromJson(json);
}

// Helper functions
int _parseInt(dynamic value) {
  if (value == null) return 0;
  if (value is int) return value;
  if (value is String) return int.tryParse(value) ?? 0;
  return 0;
}

String _parseString(dynamic value) {
  if (value == null) return '';
  if (value is String) return value;
  return value.toString();
}

double _parseDouble(dynamic value) {
  if (value == null) return 0.0;
  if (value is double) return value;
  if (value is int) return value.toDouble();
  if (value is String) return double.tryParse(value) ?? 0.0;
  return 0.0;
}