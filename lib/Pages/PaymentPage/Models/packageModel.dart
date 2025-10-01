import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'packageModel.freezed.dart';
part 'packageModel.g.dart';

@freezed
class PackageResponse with _$PackageResponse {
  const factory PackageResponse({
    required List<Package> data,
    required PaginationLinks links,
    required PaginationMeta meta,
  }) = _PackageResponse;

  factory PackageResponse.fromJson(Map<String, dynamic> json) =>
      _$PackageResponseFromJson(json);
}

@freezed
class Package with _$Package {
  const factory Package({
    required String id,
    @JsonKey(name: 'country_id') required int countryId,
    required String name,
    required String? description,
    required String price,
    @JsonKey(name: 'number_of_listings') required int numberOfListings,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
    @JsonKey(name: 'category_id') required int? categoryId,
    @JsonKey(name: 'package_type') required String packageType,
    @JsonKey(name: 'promotion_days') required int? promotionDays,
    required Category? category,
    required Country country,
  }) = _Package;

  factory Package.fromJson(Map<String, dynamic> json) =>
      _$PackageFromJson(json);
}

@freezed
class Category with _$Category {
  const factory Category({
    required int id,
    @JsonKey(name: 'user_id') required int? userId,
    @JsonKey(name: 'parent_id') required int? parentId,
    required String name,
    required String slug,
    required String? description,
    required List<String> features,
    required String? image,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
}

@freezed
class Country with _$Country {
  const factory Country({
    required int id,
    required String name,
    required String iso3,
    required String iso2,
    @JsonKey(name: 'numeric_code') required String numericCode,
    @JsonKey(name: 'phone_code') required String phoneCode,
    required String capital,
    required String currency,
    @JsonKey(name: 'currency_name') required String currencyName,
    @JsonKey(name: 'currency_symbol') required String currencySymbol,
    required String tld,
    required String native,
    required String region,
    required String subregion,
    required String latitude,
    required String longitude,
    required String emoji,
    @JsonKey(name: 'emojiU') required String emojiU,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _Country;

  factory Country.fromJson(Map<String, dynamic> json) =>
      _$CountryFromJson(json);
}

@freezed
class PaginationLinks with _$PaginationLinks {
  const factory PaginationLinks({
    required String first,
    required String last,
    required String? prev,
    required String? next,
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
    required List<PaginationLink> links,
    required String path,
    @JsonKey(name: 'per_page') required int perPage,
    required int to,
    required int total,
  }) = _PaginationMeta;

  factory PaginationMeta.fromJson(Map<String, dynamic> json) =>
      _$PaginationMetaFromJson(json);
}

@freezed
class PaginationLink with _$PaginationLink {
  const factory PaginationLink({
    required String? url,
    required String label,
    required int? page,
    required bool active,
  }) = _PaginationLink;

  factory PaginationLink.fromJson(Map<String, dynamic> json) =>
      _$PaginationLinkFromJson(json);
}