import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const UserModel._();

  @JsonSerializable(explicitToJson: true)
  const factory UserModel({
    String? id,
    required String name,
    required String email,
    String? password,
    @JsonKey(name: 'phone') String? phoneNumber,
    @JsonKey(name: 'paid_seller') int? paidSeller,
    @JsonKey(name: 'email_verified_at') DateTime? emailVerifiedAt,
    @JsonKey(name: 'country_id') int? countryId,
    @JsonKey(name: 'state_id') int? stateId,
    @JsonKey(name: 'profile_photo') String? profileImage,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    @JsonKey(name: 'deleted_at') DateTime? deletedAt,
    @JsonKey(name: 'uploads_left') int? uploadsLeft,
    @JsonKey(name: 'active_status') int? activeStatus,
    @JsonKey(name: 'avatar') String? avatar,
    @JsonKey(name: 'dark_mode') int? darkMode,
    @JsonKey(name: 'messenger_color') String? messengerColor,
    // Add this to handle nested country data
    CountryModel? country,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  bool get isPaidSeller => (paidSeller ?? 0) == 1;
  bool get isActive => (activeStatus ?? 0) == 1;
  bool get hasDarkMode => (darkMode ?? 0) == 1;
  
  // Helper getters for easy access
  String? get countryName => country?.name;
  String? get countryCode => country?.iso2;
  String? get countryFlag => country?.emoji;
}

// Add this new model in the same file or separate
@freezed
class CountryModel with _$CountryModel {
  const factory CountryModel({
    int? id,
    String? name,
    String? iso3,
    String? iso2,
    @JsonKey(name: 'numeric_code') String? numericCode,
    @JsonKey(name: 'phone_code') String? phoneCode,
    String? capital,
    String? currency,
    @JsonKey(name: 'currency_name') String? currencyName,
    @JsonKey(name: 'currency_symbol') String? currencySymbol,
    String? tld,
    String? native,
    String? region,
    String? subregion,
    String? latitude,
    String? longitude,
    String? emoji,
  }) = _CountryModel;

  factory CountryModel.fromJson(Map<String, dynamic> json) =>
      _$CountryModelFromJson(json);
}