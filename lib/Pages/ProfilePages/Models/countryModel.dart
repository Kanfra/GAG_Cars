import 'package:freezed_annotation/freezed_annotation.dart';

part 'countryModel.freezed.dart';
part 'countryModel.g.dart';

@freezed
class CountriesResponse with _$CountriesResponse {
  const factory CountriesResponse({
    required List<Country> data,
    required PaginationLinks links,
    required Meta meta,
  }) = _CountriesResponse;

  factory CountriesResponse.fromJson(Map<String, dynamic> json) =>
      _$CountriesResponseFromJson(json);
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
    String? slug,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'updated_at') required String updatedAt,
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
class Meta with _$Meta {
  const factory Meta({
    @JsonKey(name: 'current_page') required int currentPage,
    required int from,
    @JsonKey(name: 'last_page') required int lastPage,
    required List<MetaLink> links,
    required String path,
    @JsonKey(name: 'per_page') required int perPage,
    required int to,
    required int total,
  }) = _Meta;

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);
}

@freezed
class MetaLink with _$MetaLink {
  const factory MetaLink({
    required String? url,
    required String label,
    required int? page,
    required bool active,
  }) = _MetaLink;

  factory MetaLink.fromJson(Map<String, dynamic> json) =>
      _$MetaLinkFromJson(json);
}