// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'countryModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Country _$CountryFromJson(Map<String, dynamic> json) {
  return _Country.fromJson(json);
}

/// @nodoc
mixin _$Country {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get iso3 => throw _privateConstructorUsedError;
  String get iso2 => throw _privateConstructorUsedError;
  @JsonKey(name: 'numeric_code')
  String get numericCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'phone_code')
  String get phoneCode => throw _privateConstructorUsedError;
  String get capital => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  @JsonKey(name: 'currency_name')
  String get currencyName => throw _privateConstructorUsedError;
  @JsonKey(name: 'currency_symbol')
  String get currencySymbol => throw _privateConstructorUsedError;
  String get tld => throw _privateConstructorUsedError;
  String? get native => throw _privateConstructorUsedError;
  String? get region => throw _privateConstructorUsedError;
  String? get subregion => throw _privateConstructorUsedError;
  String? get latitude => throw _privateConstructorUsedError;
  String? get longitude => throw _privateConstructorUsedError;
  String? get emoji => throw _privateConstructorUsedError;
  String? get emojiU => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  String get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this Country to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Country
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CountryCopyWith<Country> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CountryCopyWith<$Res> {
  factory $CountryCopyWith(Country value, $Res Function(Country) then) =
      _$CountryCopyWithImpl<$Res, Country>;
  @useResult
  $Res call(
      {int id,
      String name,
      String iso3,
      String iso2,
      @JsonKey(name: 'numeric_code') String numericCode,
      @JsonKey(name: 'phone_code') String phoneCode,
      String capital,
      String currency,
      @JsonKey(name: 'currency_name') String currencyName,
      @JsonKey(name: 'currency_symbol') String currencySymbol,
      String tld,
      String? native,
      String? region,
      String? subregion,
      String? latitude,
      String? longitude,
      String? emoji,
      String? emojiU,
      @JsonKey(name: 'created_at') String createdAt,
      @JsonKey(name: 'updated_at') String updatedAt});
}

/// @nodoc
class _$CountryCopyWithImpl<$Res, $Val extends Country>
    implements $CountryCopyWith<$Res> {
  _$CountryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Country
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? iso3 = null,
    Object? iso2 = null,
    Object? numericCode = null,
    Object? phoneCode = null,
    Object? capital = null,
    Object? currency = null,
    Object? currencyName = null,
    Object? currencySymbol = null,
    Object? tld = null,
    Object? native = freezed,
    Object? region = freezed,
    Object? subregion = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? emoji = freezed,
    Object? emojiU = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      iso3: null == iso3
          ? _value.iso3
          : iso3 // ignore: cast_nullable_to_non_nullable
              as String,
      iso2: null == iso2
          ? _value.iso2
          : iso2 // ignore: cast_nullable_to_non_nullable
              as String,
      numericCode: null == numericCode
          ? _value.numericCode
          : numericCode // ignore: cast_nullable_to_non_nullable
              as String,
      phoneCode: null == phoneCode
          ? _value.phoneCode
          : phoneCode // ignore: cast_nullable_to_non_nullable
              as String,
      capital: null == capital
          ? _value.capital
          : capital // ignore: cast_nullable_to_non_nullable
              as String,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      currencyName: null == currencyName
          ? _value.currencyName
          : currencyName // ignore: cast_nullable_to_non_nullable
              as String,
      currencySymbol: null == currencySymbol
          ? _value.currencySymbol
          : currencySymbol // ignore: cast_nullable_to_non_nullable
              as String,
      tld: null == tld
          ? _value.tld
          : tld // ignore: cast_nullable_to_non_nullable
              as String,
      native: freezed == native
          ? _value.native
          : native // ignore: cast_nullable_to_non_nullable
              as String?,
      region: freezed == region
          ? _value.region
          : region // ignore: cast_nullable_to_non_nullable
              as String?,
      subregion: freezed == subregion
          ? _value.subregion
          : subregion // ignore: cast_nullable_to_non_nullable
              as String?,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as String?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as String?,
      emoji: freezed == emoji
          ? _value.emoji
          : emoji // ignore: cast_nullable_to_non_nullable
              as String?,
      emojiU: freezed == emojiU
          ? _value.emojiU
          : emojiU // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CountryImplCopyWith<$Res> implements $CountryCopyWith<$Res> {
  factory _$$CountryImplCopyWith(
          _$CountryImpl value, $Res Function(_$CountryImpl) then) =
      __$$CountryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String iso3,
      String iso2,
      @JsonKey(name: 'numeric_code') String numericCode,
      @JsonKey(name: 'phone_code') String phoneCode,
      String capital,
      String currency,
      @JsonKey(name: 'currency_name') String currencyName,
      @JsonKey(name: 'currency_symbol') String currencySymbol,
      String tld,
      String? native,
      String? region,
      String? subregion,
      String? latitude,
      String? longitude,
      String? emoji,
      String? emojiU,
      @JsonKey(name: 'created_at') String createdAt,
      @JsonKey(name: 'updated_at') String updatedAt});
}

/// @nodoc
class __$$CountryImplCopyWithImpl<$Res>
    extends _$CountryCopyWithImpl<$Res, _$CountryImpl>
    implements _$$CountryImplCopyWith<$Res> {
  __$$CountryImplCopyWithImpl(
      _$CountryImpl _value, $Res Function(_$CountryImpl) _then)
      : super(_value, _then);

  /// Create a copy of Country
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? iso3 = null,
    Object? iso2 = null,
    Object? numericCode = null,
    Object? phoneCode = null,
    Object? capital = null,
    Object? currency = null,
    Object? currencyName = null,
    Object? currencySymbol = null,
    Object? tld = null,
    Object? native = freezed,
    Object? region = freezed,
    Object? subregion = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? emoji = freezed,
    Object? emojiU = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$CountryImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      iso3: null == iso3
          ? _value.iso3
          : iso3 // ignore: cast_nullable_to_non_nullable
              as String,
      iso2: null == iso2
          ? _value.iso2
          : iso2 // ignore: cast_nullable_to_non_nullable
              as String,
      numericCode: null == numericCode
          ? _value.numericCode
          : numericCode // ignore: cast_nullable_to_non_nullable
              as String,
      phoneCode: null == phoneCode
          ? _value.phoneCode
          : phoneCode // ignore: cast_nullable_to_non_nullable
              as String,
      capital: null == capital
          ? _value.capital
          : capital // ignore: cast_nullable_to_non_nullable
              as String,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      currencyName: null == currencyName
          ? _value.currencyName
          : currencyName // ignore: cast_nullable_to_non_nullable
              as String,
      currencySymbol: null == currencySymbol
          ? _value.currencySymbol
          : currencySymbol // ignore: cast_nullable_to_non_nullable
              as String,
      tld: null == tld
          ? _value.tld
          : tld // ignore: cast_nullable_to_non_nullable
              as String,
      native: freezed == native
          ? _value.native
          : native // ignore: cast_nullable_to_non_nullable
              as String?,
      region: freezed == region
          ? _value.region
          : region // ignore: cast_nullable_to_non_nullable
              as String?,
      subregion: freezed == subregion
          ? _value.subregion
          : subregion // ignore: cast_nullable_to_non_nullable
              as String?,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as String?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as String?,
      emoji: freezed == emoji
          ? _value.emoji
          : emoji // ignore: cast_nullable_to_non_nullable
              as String?,
      emojiU: freezed == emojiU
          ? _value.emojiU
          : emojiU // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CountryImpl implements _Country {
  const _$CountryImpl(
      {required this.id,
      required this.name,
      required this.iso3,
      required this.iso2,
      @JsonKey(name: 'numeric_code') required this.numericCode,
      @JsonKey(name: 'phone_code') required this.phoneCode,
      required this.capital,
      required this.currency,
      @JsonKey(name: 'currency_name') required this.currencyName,
      @JsonKey(name: 'currency_symbol') required this.currencySymbol,
      required this.tld,
      this.native,
      this.region,
      this.subregion,
      this.latitude,
      this.longitude,
      this.emoji,
      this.emojiU,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') required this.updatedAt});

  factory _$CountryImpl.fromJson(Map<String, dynamic> json) =>
      _$$CountryImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String iso3;
  @override
  final String iso2;
  @override
  @JsonKey(name: 'numeric_code')
  final String numericCode;
  @override
  @JsonKey(name: 'phone_code')
  final String phoneCode;
  @override
  final String capital;
  @override
  final String currency;
  @override
  @JsonKey(name: 'currency_name')
  final String currencyName;
  @override
  @JsonKey(name: 'currency_symbol')
  final String currencySymbol;
  @override
  final String tld;
  @override
  final String? native;
  @override
  final String? region;
  @override
  final String? subregion;
  @override
  final String? latitude;
  @override
  final String? longitude;
  @override
  final String? emoji;
  @override
  final String? emojiU;
  @override
  @JsonKey(name: 'created_at')
  final String createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final String updatedAt;

  @override
  String toString() {
    return 'Country(id: $id, name: $name, iso3: $iso3, iso2: $iso2, numericCode: $numericCode, phoneCode: $phoneCode, capital: $capital, currency: $currency, currencyName: $currencyName, currencySymbol: $currencySymbol, tld: $tld, native: $native, region: $region, subregion: $subregion, latitude: $latitude, longitude: $longitude, emoji: $emoji, emojiU: $emojiU, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CountryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.iso3, iso3) || other.iso3 == iso3) &&
            (identical(other.iso2, iso2) || other.iso2 == iso2) &&
            (identical(other.numericCode, numericCode) ||
                other.numericCode == numericCode) &&
            (identical(other.phoneCode, phoneCode) ||
                other.phoneCode == phoneCode) &&
            (identical(other.capital, capital) || other.capital == capital) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.currencyName, currencyName) ||
                other.currencyName == currencyName) &&
            (identical(other.currencySymbol, currencySymbol) ||
                other.currencySymbol == currencySymbol) &&
            (identical(other.tld, tld) || other.tld == tld) &&
            (identical(other.native, native) || other.native == native) &&
            (identical(other.region, region) || other.region == region) &&
            (identical(other.subregion, subregion) ||
                other.subregion == subregion) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.emoji, emoji) || other.emoji == emoji) &&
            (identical(other.emojiU, emojiU) || other.emojiU == emojiU) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        name,
        iso3,
        iso2,
        numericCode,
        phoneCode,
        capital,
        currency,
        currencyName,
        currencySymbol,
        tld,
        native,
        region,
        subregion,
        latitude,
        longitude,
        emoji,
        emojiU,
        createdAt,
        updatedAt
      ]);

  /// Create a copy of Country
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CountryImplCopyWith<_$CountryImpl> get copyWith =>
      __$$CountryImplCopyWithImpl<_$CountryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CountryImplToJson(
      this,
    );
  }
}

abstract class _Country implements Country {
  const factory _Country(
      {required final int id,
      required final String name,
      required final String iso3,
      required final String iso2,
      @JsonKey(name: 'numeric_code') required final String numericCode,
      @JsonKey(name: 'phone_code') required final String phoneCode,
      required final String capital,
      required final String currency,
      @JsonKey(name: 'currency_name') required final String currencyName,
      @JsonKey(name: 'currency_symbol') required final String currencySymbol,
      required final String tld,
      final String? native,
      final String? region,
      final String? subregion,
      final String? latitude,
      final String? longitude,
      final String? emoji,
      final String? emojiU,
      @JsonKey(name: 'created_at') required final String createdAt,
      @JsonKey(name: 'updated_at')
      required final String updatedAt}) = _$CountryImpl;

  factory _Country.fromJson(Map<String, dynamic> json) = _$CountryImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get iso3;
  @override
  String get iso2;
  @override
  @JsonKey(name: 'numeric_code')
  String get numericCode;
  @override
  @JsonKey(name: 'phone_code')
  String get phoneCode;
  @override
  String get capital;
  @override
  String get currency;
  @override
  @JsonKey(name: 'currency_name')
  String get currencyName;
  @override
  @JsonKey(name: 'currency_symbol')
  String get currencySymbol;
  @override
  String get tld;
  @override
  String? get native;
  @override
  String? get region;
  @override
  String? get subregion;
  @override
  String? get latitude;
  @override
  String? get longitude;
  @override
  String? get emoji;
  @override
  String? get emojiU;
  @override
  @JsonKey(name: 'created_at')
  String get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  String get updatedAt;

  /// Create a copy of Country
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CountryImplCopyWith<_$CountryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
