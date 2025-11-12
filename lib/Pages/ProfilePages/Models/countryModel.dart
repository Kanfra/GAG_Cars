import 'package:freezed_annotation/freezed_annotation.dart';

part 'countryModel.freezed.dart';
part 'countryModel.g.dart';

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
    String? native,
    String? region,
    String? subregion,
    String? latitude,
    String? longitude,
    String? emoji,
    String? emojiU,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'updated_at') required String updatedAt,
  }) = _Country;

  factory Country.fromJson(Map<String, dynamic> json) =>
      _$CountryFromJson(json);
}

// If you want to keep the original structure for other endpoints that use pagination,
// you can create a simple list wrapper:
typedef CountriesList = List<Country>;