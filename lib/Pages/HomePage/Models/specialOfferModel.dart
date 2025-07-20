import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'specialOfferModel.freezed.dart';
part 'specialOfferModel.g.dart';

@freezed
class SpecialOfferResponse with _$SpecialOfferResponse {
  const factory SpecialOfferResponse({
    required List<SpecialOffer> data,
    required PaginationLinks links,
    required PaginationMeta meta,
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
    required String description,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'updated_at') required String updatedAt,
    required Item? item,
  }) = _SpecialOffer;

  factory SpecialOffer.fromJson(Map<String, dynamic> json) =>
      _$SpecialOfferFromJson(json);
}

@freezed
class Item with _$Item {
  const factory Item({
    required String id,
    @JsonKey(name: 'user_id') String? userId,
    @JsonKey(name: 'country_id') required int countryId,
    @JsonKey(name: 'brand_model_id') required int brandModelId,
    @JsonKey(name: 'brand_id') required int brandId,
    @JsonKey(name: 'category_id') required int categoryId,
    required String name,
    required String year,
    required String slug,
    required String description,
    required List<String> images,
    required String location,
    @JsonKey(name: 'serial_number') String? serialNumber,
    required String condition,
    @JsonKey(name: 'steer_position') String? steerPosition,
    @JsonKey(name: 'engine_capacity') required String engineCapacity,
    String? transmission,
    required String color,
    @JsonKey(name: 'build_type') String? buildType,
    @JsonKey(name: 'number_of_passengers') required int numberOfPassengers,
    required List<String> features,
    required String status,
    required String price,
    required String mileage,
    required int warranty,
    @JsonKey(name: 'warranty_expiration') String? warrantyExpiration,
    @JsonKey(name: 'deleted_at') String? deletedAt,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'updated_at') required String updatedAt,
    required Brand? brand,
    required Category? category,
    @JsonKey(name: 'brand_model') required BrandModel? brandModel,
    @JsonKey(name: 'BrandModel') BrandModel? brandModelAlt,
    required dynamic user, // Can be null or object in response
  }) = _Item;

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
}

@freezed
class Brand with _$Brand {
  const factory Brand({
    required int id,
    @JsonKey(name: 'user_id') String? userId,
    required String name,
    required String slug,
    required String image,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'updated_at') required String updatedAt,
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
    required String slug,
    required String description,
    required List<String> features,
    required String image,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'updated_at') required String updatedAt,
  }) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
}

@freezed
class BrandModel with _$BrandModel {
  const factory BrandModel({
    required int id,
    @JsonKey(name: 'brand_id') required int brandId,
    required String name,
    required String slug,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'updated_at') required String updatedAt,
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
    required int from,
    @JsonKey(name: 'last_page') required int lastPage,
    required List<PaginationMetaLink> links,
    required String path,
    @JsonKey(name: 'per_page') required int perPage,
    required int to,
    required int total,
  }) = _PaginationMeta;

  factory PaginationMeta.fromJson(Map<String, dynamic> json) =>
      _$PaginationMetaFromJson(json);
}

@freezed
class PaginationMetaLink with _$PaginationMetaLink {
  const factory PaginationMetaLink({
    String? url,
    required String label,
    required bool active,
  }) = _PaginationMetaLink;

  factory PaginationMetaLink.fromJson(Map<String, dynamic> json) =>
      _$PaginationMetaLinkFromJson(json);
}