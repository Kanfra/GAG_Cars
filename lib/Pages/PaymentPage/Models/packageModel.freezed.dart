// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'packageModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Package _$PackageFromJson(Map<String, dynamic> json) {
  return _Package.fromJson(json);
}

/// @nodoc
mixin _$Package {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'country_id')
  int get countryId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String get price => throw _privateConstructorUsedError;
  @JsonKey(name: 'number_of_listings')
  int? get numberOfListings => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  String get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'category_id')
  int? get categoryId => throw _privateConstructorUsedError;
  @JsonKey(name: 'package_type')
  String get packageType => throw _privateConstructorUsedError;
  @JsonKey(name: 'promotion_days')
  int? get promotionDays => throw _privateConstructorUsedError;
  Country? get country => throw _privateConstructorUsedError;

  /// Serializes this Package to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Package
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PackageCopyWith<Package> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PackageCopyWith<$Res> {
  factory $PackageCopyWith(Package value, $Res Function(Package) then) =
      _$PackageCopyWithImpl<$Res, Package>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'country_id') int countryId,
      String name,
      String? description,
      String price,
      @JsonKey(name: 'number_of_listings') int? numberOfListings,
      @JsonKey(name: 'created_at') String createdAt,
      @JsonKey(name: 'updated_at') String updatedAt,
      @JsonKey(name: 'category_id') int? categoryId,
      @JsonKey(name: 'package_type') String packageType,
      @JsonKey(name: 'promotion_days') int? promotionDays,
      Country? country});

  $CountryCopyWith<$Res>? get country;
}

/// @nodoc
class _$PackageCopyWithImpl<$Res, $Val extends Package>
    implements $PackageCopyWith<$Res> {
  _$PackageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Package
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? countryId = null,
    Object? name = null,
    Object? description = freezed,
    Object? price = null,
    Object? numberOfListings = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? categoryId = freezed,
    Object? packageType = null,
    Object? promotionDays = freezed,
    Object? country = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      countryId: null == countryId
          ? _value.countryId
          : countryId // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      numberOfListings: freezed == numberOfListings
          ? _value.numberOfListings
          : numberOfListings // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      packageType: null == packageType
          ? _value.packageType
          : packageType // ignore: cast_nullable_to_non_nullable
              as String,
      promotionDays: freezed == promotionDays
          ? _value.promotionDays
          : promotionDays // ignore: cast_nullable_to_non_nullable
              as int?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as Country?,
    ) as $Val);
  }

  /// Create a copy of Package
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CountryCopyWith<$Res>? get country {
    if (_value.country == null) {
      return null;
    }

    return $CountryCopyWith<$Res>(_value.country!, (value) {
      return _then(_value.copyWith(country: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PackageImplCopyWith<$Res> implements $PackageCopyWith<$Res> {
  factory _$$PackageImplCopyWith(
          _$PackageImpl value, $Res Function(_$PackageImpl) then) =
      __$$PackageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'country_id') int countryId,
      String name,
      String? description,
      String price,
      @JsonKey(name: 'number_of_listings') int? numberOfListings,
      @JsonKey(name: 'created_at') String createdAt,
      @JsonKey(name: 'updated_at') String updatedAt,
      @JsonKey(name: 'category_id') int? categoryId,
      @JsonKey(name: 'package_type') String packageType,
      @JsonKey(name: 'promotion_days') int? promotionDays,
      Country? country});

  @override
  $CountryCopyWith<$Res>? get country;
}

/// @nodoc
class __$$PackageImplCopyWithImpl<$Res>
    extends _$PackageCopyWithImpl<$Res, _$PackageImpl>
    implements _$$PackageImplCopyWith<$Res> {
  __$$PackageImplCopyWithImpl(
      _$PackageImpl _value, $Res Function(_$PackageImpl) _then)
      : super(_value, _then);

  /// Create a copy of Package
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? countryId = null,
    Object? name = null,
    Object? description = freezed,
    Object? price = null,
    Object? numberOfListings = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? categoryId = freezed,
    Object? packageType = null,
    Object? promotionDays = freezed,
    Object? country = freezed,
  }) {
    return _then(_$PackageImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      countryId: null == countryId
          ? _value.countryId
          : countryId // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      numberOfListings: freezed == numberOfListings
          ? _value.numberOfListings
          : numberOfListings // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      packageType: null == packageType
          ? _value.packageType
          : packageType // ignore: cast_nullable_to_non_nullable
              as String,
      promotionDays: freezed == promotionDays
          ? _value.promotionDays
          : promotionDays // ignore: cast_nullable_to_non_nullable
              as int?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as Country?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PackageImpl implements _Package {
  const _$PackageImpl(
      {required this.id,
      @JsonKey(name: 'country_id') required this.countryId,
      required this.name,
      required this.description,
      required this.price,
      @JsonKey(name: 'number_of_listings') required this.numberOfListings,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') required this.updatedAt,
      @JsonKey(name: 'category_id') required this.categoryId,
      @JsonKey(name: 'package_type') required this.packageType,
      @JsonKey(name: 'promotion_days') required this.promotionDays,
      this.country});

  factory _$PackageImpl.fromJson(Map<String, dynamic> json) =>
      _$$PackageImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'country_id')
  final int countryId;
  @override
  final String name;
  @override
  final String? description;
  @override
  final String price;
  @override
  @JsonKey(name: 'number_of_listings')
  final int? numberOfListings;
  @override
  @JsonKey(name: 'created_at')
  final String createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final String updatedAt;
  @override
  @JsonKey(name: 'category_id')
  final int? categoryId;
  @override
  @JsonKey(name: 'package_type')
  final String packageType;
  @override
  @JsonKey(name: 'promotion_days')
  final int? promotionDays;
  @override
  final Country? country;

  @override
  String toString() {
    return 'Package(id: $id, countryId: $countryId, name: $name, description: $description, price: $price, numberOfListings: $numberOfListings, createdAt: $createdAt, updatedAt: $updatedAt, categoryId: $categoryId, packageType: $packageType, promotionDays: $promotionDays, country: $country)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PackageImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.countryId, countryId) ||
                other.countryId == countryId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.numberOfListings, numberOfListings) ||
                other.numberOfListings == numberOfListings) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.packageType, packageType) ||
                other.packageType == packageType) &&
            (identical(other.promotionDays, promotionDays) ||
                other.promotionDays == promotionDays) &&
            (identical(other.country, country) || other.country == country));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      countryId,
      name,
      description,
      price,
      numberOfListings,
      createdAt,
      updatedAt,
      categoryId,
      packageType,
      promotionDays,
      country);

  /// Create a copy of Package
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PackageImplCopyWith<_$PackageImpl> get copyWith =>
      __$$PackageImplCopyWithImpl<_$PackageImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PackageImplToJson(
      this,
    );
  }
}

abstract class _Package implements Package {
  const factory _Package(
      {required final String id,
      @JsonKey(name: 'country_id') required final int countryId,
      required final String name,
      required final String? description,
      required final String price,
      @JsonKey(name: 'number_of_listings') required final int? numberOfListings,
      @JsonKey(name: 'created_at') required final String createdAt,
      @JsonKey(name: 'updated_at') required final String updatedAt,
      @JsonKey(name: 'category_id') required final int? categoryId,
      @JsonKey(name: 'package_type') required final String packageType,
      @JsonKey(name: 'promotion_days') required final int? promotionDays,
      final Country? country}) = _$PackageImpl;

  factory _Package.fromJson(Map<String, dynamic> json) = _$PackageImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'country_id')
  int get countryId;
  @override
  String get name;
  @override
  String? get description;
  @override
  String get price;
  @override
  @JsonKey(name: 'number_of_listings')
  int? get numberOfListings;
  @override
  @JsonKey(name: 'created_at')
  String get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  String get updatedAt;
  @override
  @JsonKey(name: 'category_id')
  int? get categoryId;
  @override
  @JsonKey(name: 'package_type')
  String get packageType;
  @override
  @JsonKey(name: 'promotion_days')
  int? get promotionDays;
  @override
  Country? get country;

  /// Create a copy of Package
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PackageImplCopyWith<_$PackageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

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
  String get native => throw _privateConstructorUsedError;
  String get region => throw _privateConstructorUsedError;
  String get subregion => throw _privateConstructorUsedError;
  String get latitude => throw _privateConstructorUsedError;
  String get longitude => throw _privateConstructorUsedError;
  String get emoji => throw _privateConstructorUsedError;
  @JsonKey(name: 'emojiU')
  String get emojiU => throw _privateConstructorUsedError;
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
      String native,
      String region,
      String subregion,
      String latitude,
      String longitude,
      String emoji,
      @JsonKey(name: 'emojiU') String emojiU,
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
    Object? native = null,
    Object? region = null,
    Object? subregion = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? emoji = null,
    Object? emojiU = null,
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
      native: null == native
          ? _value.native
          : native // ignore: cast_nullable_to_non_nullable
              as String,
      region: null == region
          ? _value.region
          : region // ignore: cast_nullable_to_non_nullable
              as String,
      subregion: null == subregion
          ? _value.subregion
          : subregion // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as String,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as String,
      emoji: null == emoji
          ? _value.emoji
          : emoji // ignore: cast_nullable_to_non_nullable
              as String,
      emojiU: null == emojiU
          ? _value.emojiU
          : emojiU // ignore: cast_nullable_to_non_nullable
              as String,
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
      String native,
      String region,
      String subregion,
      String latitude,
      String longitude,
      String emoji,
      @JsonKey(name: 'emojiU') String emojiU,
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
    Object? native = null,
    Object? region = null,
    Object? subregion = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? emoji = null,
    Object? emojiU = null,
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
      native: null == native
          ? _value.native
          : native // ignore: cast_nullable_to_non_nullable
              as String,
      region: null == region
          ? _value.region
          : region // ignore: cast_nullable_to_non_nullable
              as String,
      subregion: null == subregion
          ? _value.subregion
          : subregion // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as String,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as String,
      emoji: null == emoji
          ? _value.emoji
          : emoji // ignore: cast_nullable_to_non_nullable
              as String,
      emojiU: null == emojiU
          ? _value.emojiU
          : emojiU // ignore: cast_nullable_to_non_nullable
              as String,
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
      required this.native,
      required this.region,
      required this.subregion,
      required this.latitude,
      required this.longitude,
      required this.emoji,
      @JsonKey(name: 'emojiU') required this.emojiU,
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
  final String native;
  @override
  final String region;
  @override
  final String subregion;
  @override
  final String latitude;
  @override
  final String longitude;
  @override
  final String emoji;
  @override
  @JsonKey(name: 'emojiU')
  final String emojiU;
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
      required final String native,
      required final String region,
      required final String subregion,
      required final String latitude,
      required final String longitude,
      required final String emoji,
      @JsonKey(name: 'emojiU') required final String emojiU,
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
  String get native;
  @override
  String get region;
  @override
  String get subregion;
  @override
  String get latitude;
  @override
  String get longitude;
  @override
  String get emoji;
  @override
  @JsonKey(name: 'emojiU')
  String get emojiU;
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
