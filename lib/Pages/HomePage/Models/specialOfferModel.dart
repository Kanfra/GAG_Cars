import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'specialOfferModel.freezed.dart';
part 'specialOfferModel.g.dart';

@freezed
class SpecialOfferResponse with _$SpecialOfferResponse {
  const factory SpecialOfferResponse({
    required List<SpecialOffer> data,
    required PaginationLinks? links,
    required PaginationMeta? meta,
  }) = _SpecialOfferResponse;

  factory SpecialOfferResponse.fromJson(Map<String, dynamic> json) =>
      _$SpecialOfferResponseFromJson(json);
}

@freezed
class SpecialOffer with _$SpecialOffer {
  const factory SpecialOffer({
    required int id,
    @JsonKey(name: 'user_id') String? userId,
    @JsonKey(name: 'item_id') required String itemId,
    @JsonKey(name: 'start_at') required String startAt,
    @JsonKey(name: 'end_at') required String endAt,
    required String status,
    required int discount,
    @JsonKey(name: 'discount_type') required String discountType,
    String? description, // Changed from required
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'updated_at') required String updatedAt,
    Item? item, // Changed from required
  }) = _SpecialOffer;

  factory SpecialOffer.fromJson(Map<String, dynamic> json) =>
      _$SpecialOfferFromJson(json);
}

@freezed
class Item with _$Item {
  const factory Item({
    required String id,
    @JsonKey(name: 'user_id') String? userId,
    @JsonKey(name: 'country_id') int? countryId, // Changed from required
    @JsonKey(name: 'brand_model_id') int? brandModelId, // Changed from required
    @JsonKey(name: 'brand_id') int? brandId, // Changed from required
    @JsonKey(name: 'category_id') int? categoryId, // Changed from required
    required String name,
    String? year, // Changed from required
    String? slug, // Changed from required
    String? description, // Changed from required
    List<String>? images, // Changed from required
    String? location, // Changed from required
    @JsonKey(name: 'serial_number') String? serialNumber,
    String? condition, // Changed from required
    @JsonKey(name: 'steer_position') String? steerPosition,
    @JsonKey(name: 'engine_capacity') String? engineCapacity, // Changed from required
    String? transmission,
    String? color, // Changed from required
    @JsonKey(name: 'build_type') String? buildType,
    @JsonKey(name: 'number_of_passengers') int? numberOfPassengers, // Changed from required
    List<String>? features, // Changed from required
    String? status, // Changed from required
    String? price, // Changed from required
    String? mileage, // Changed from required
    int? warranty, // Changed from required
    @JsonKey(name: 'warranty_expiration') String? warrantyExpiration,
    @JsonKey(name: 'deleted_at') String? deletedAt,
    @JsonKey(name: 'created_at') String? createdAt, // Changed from required
    @JsonKey(name: 'updated_at') String? updatedAt, // Changed from required
    Brand? brand, // Changed from required
    Category? category, // Changed from required
    @JsonKey(name: 'brand_model') BrandModel? brandModel,
    // Removed duplicate BrandModel field
    @Default(null) Map<String, dynamic>? user, // Replaced dynamic
  }) = _Item;

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
}

@freezed
class Brand with _$Brand {
  const factory Brand({
    required int id,
    @JsonKey(name: 'user_id') String? userId,
    required String name,
    String? slug, // Changed from required
    String? image, // Changed from required
    @JsonKey(name: 'created_at') String? createdAt, // Changed from required
    @JsonKey(name: 'updated_at') String? updatedAt, // Changed from required
  }) = _Brand;

  factory Brand.fromJson(Map<String, dynamic> json) => _$BrandFromJson(json);
}

@freezed
class Category with _$Category {
  const factory Category({
    required int id,
    @JsonKey(name: 'user_id') String? userId,
    @JsonKey(name: 'parent_id') String? parentId,
    required String name,
    String? slug, // Changed from required
    String? description, // Changed from required
    List<String>? features, // Changed from required
    String? image, // Changed from required
    @JsonKey(name: 'created_at') String? createdAt, // Changed from required
    @JsonKey(name: 'updated_at') String? updatedAt, // Changed from required
  }) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
}

@freezed
class BrandModel with _$BrandModel {
  const factory BrandModel({
    required int id,
    @JsonKey(name: 'brand_id') int? brandId, // Changed from required
    required String name,
    String? slug, // Changed from required
    @JsonKey(name: 'created_at') String? createdAt, // Changed from required
    @JsonKey(name: 'updated_at') String? updatedAt, // Changed from required
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
    @JsonKey(name: 'current_page') required int currentPage,
    int? from, // Changed from required
    @JsonKey(name: 'last_page') int? lastPage, // Changed from required
    List<PaginationMetaLink>? links, // Changed from required
    String? path, // Changed from required
    @JsonKey(name: 'per_page') int? perPage, // Changed from required
    int? to, // Changed from required
    int? total, // Changed from required
  }) = _PaginationMeta;

  factory PaginationMeta.fromJson(Map<String, dynamic> json) =>
      _$PaginationMetaFromJson(json);
}

@freezed
class PaginationMetaLink with _$PaginationMetaLink {
  const factory PaginationMetaLink({
    String? url,
    String? label, // Changed from required
    bool? active, // Changed from required
  }) = _PaginationMetaLink;

  factory PaginationMetaLink.fromJson(Map<String, dynamic> json) =>
      _$PaginationMetaLinkFromJson(json);
}