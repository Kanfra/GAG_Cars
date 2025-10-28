import 'package:freezed_annotation/freezed_annotation.dart';

part 'packageModel.freezed.dart';
part 'packageModel.g.dart';

typedef PackageList = List<Package>;

@freezed
class Package with _$Package {
  const factory Package({
    required String id,
    @JsonKey(name: 'country_id') required int countryId,
    required String name,
    required String? description,
    required String price,
    @JsonKey(name: 'number_of_listings') required int? numberOfListings,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'updated_at') required String updatedAt,
    @JsonKey(name: 'category_id') required int? categoryId,
    @JsonKey(name: 'package_type') required String packageType,
    @JsonKey(name: 'promotion_days') required int? promotionDays,
    Country? country, // Optional country object
  }) = _Package;

  factory Package.fromJson(Map<String, dynamic> json) =>
      _$PackageFromJson(json);
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
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'updated_at') required String updatedAt,
  }) = _Country;

  factory Country.fromJson(Map<String, dynamic> json) =>
      _$CountryFromJson(json);
}

// Helper class for price conversion
class PackageHelper {
  static double parsePrice(Package package) {
    return double.tryParse(package.price) ?? 0.0;
  }
  
  // Helper to get currency symbol with fallback
  static String getCurrencySymbol(Package package) {
    return package.country?.currencySymbol ?? 'GH₵';
  }
}