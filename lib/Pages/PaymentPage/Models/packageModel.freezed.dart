// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'packageModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Package {

 String get id;@JsonKey(name: 'country_id') int get countryId; String get name; String? get description; String get price;@JsonKey(name: 'number_of_listings') int? get numberOfListings;@JsonKey(name: 'created_at') String get createdAt;@JsonKey(name: 'updated_at') String get updatedAt;@JsonKey(name: 'category_id') int? get categoryId;@JsonKey(name: 'package_type') String get packageType;@JsonKey(name: 'promotion_days') int? get promotionDays; Country? get country;
/// Create a copy of Package
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PackageCopyWith<Package> get copyWith => _$PackageCopyWithImpl<Package>(this as Package, _$identity);

  /// Serializes this Package to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Package&&(identical(other.id, id) || other.id == id)&&(identical(other.countryId, countryId) || other.countryId == countryId)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.price, price) || other.price == price)&&(identical(other.numberOfListings, numberOfListings) || other.numberOfListings == numberOfListings)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.packageType, packageType) || other.packageType == packageType)&&(identical(other.promotionDays, promotionDays) || other.promotionDays == promotionDays)&&(identical(other.country, country) || other.country == country));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,countryId,name,description,price,numberOfListings,createdAt,updatedAt,categoryId,packageType,promotionDays,country);

@override
String toString() {
  return 'Package(id: $id, countryId: $countryId, name: $name, description: $description, price: $price, numberOfListings: $numberOfListings, createdAt: $createdAt, updatedAt: $updatedAt, categoryId: $categoryId, packageType: $packageType, promotionDays: $promotionDays, country: $country)';
}


}

/// @nodoc
abstract mixin class $PackageCopyWith<$Res>  {
  factory $PackageCopyWith(Package value, $Res Function(Package) _then) = _$PackageCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'country_id') int countryId, String name, String? description, String price,@JsonKey(name: 'number_of_listings') int? numberOfListings,@JsonKey(name: 'created_at') String createdAt,@JsonKey(name: 'updated_at') String updatedAt,@JsonKey(name: 'category_id') int? categoryId,@JsonKey(name: 'package_type') String packageType,@JsonKey(name: 'promotion_days') int? promotionDays, Country? country
});


$CountryCopyWith<$Res>? get country;

}
/// @nodoc
class _$PackageCopyWithImpl<$Res>
    implements $PackageCopyWith<$Res> {
  _$PackageCopyWithImpl(this._self, this._then);

  final Package _self;
  final $Res Function(Package) _then;

/// Create a copy of Package
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? countryId = null,Object? name = null,Object? description = freezed,Object? price = null,Object? numberOfListings = freezed,Object? createdAt = null,Object? updatedAt = null,Object? categoryId = freezed,Object? packageType = null,Object? promotionDays = freezed,Object? country = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,countryId: null == countryId ? _self.countryId : countryId // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as String,numberOfListings: freezed == numberOfListings ? _self.numberOfListings : numberOfListings // ignore: cast_nullable_to_non_nullable
as int?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int?,packageType: null == packageType ? _self.packageType : packageType // ignore: cast_nullable_to_non_nullable
as String,promotionDays: freezed == promotionDays ? _self.promotionDays : promotionDays // ignore: cast_nullable_to_non_nullable
as int?,country: freezed == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as Country?,
  ));
}
/// Create a copy of Package
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CountryCopyWith<$Res>? get country {
    if (_self.country == null) {
    return null;
  }

  return $CountryCopyWith<$Res>(_self.country!, (value) {
    return _then(_self.copyWith(country: value));
  });
}
}


/// Adds pattern-matching-related methods to [Package].
extension PackagePatterns on Package {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Package value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Package() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Package value)  $default,){
final _that = this;
switch (_that) {
case _Package():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Package value)?  $default,){
final _that = this;
switch (_that) {
case _Package() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'country_id')  int countryId,  String name,  String? description,  String price, @JsonKey(name: 'number_of_listings')  int? numberOfListings, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'updated_at')  String updatedAt, @JsonKey(name: 'category_id')  int? categoryId, @JsonKey(name: 'package_type')  String packageType, @JsonKey(name: 'promotion_days')  int? promotionDays,  Country? country)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Package() when $default != null:
return $default(_that.id,_that.countryId,_that.name,_that.description,_that.price,_that.numberOfListings,_that.createdAt,_that.updatedAt,_that.categoryId,_that.packageType,_that.promotionDays,_that.country);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'country_id')  int countryId,  String name,  String? description,  String price, @JsonKey(name: 'number_of_listings')  int? numberOfListings, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'updated_at')  String updatedAt, @JsonKey(name: 'category_id')  int? categoryId, @JsonKey(name: 'package_type')  String packageType, @JsonKey(name: 'promotion_days')  int? promotionDays,  Country? country)  $default,) {final _that = this;
switch (_that) {
case _Package():
return $default(_that.id,_that.countryId,_that.name,_that.description,_that.price,_that.numberOfListings,_that.createdAt,_that.updatedAt,_that.categoryId,_that.packageType,_that.promotionDays,_that.country);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'country_id')  int countryId,  String name,  String? description,  String price, @JsonKey(name: 'number_of_listings')  int? numberOfListings, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'updated_at')  String updatedAt, @JsonKey(name: 'category_id')  int? categoryId, @JsonKey(name: 'package_type')  String packageType, @JsonKey(name: 'promotion_days')  int? promotionDays,  Country? country)?  $default,) {final _that = this;
switch (_that) {
case _Package() when $default != null:
return $default(_that.id,_that.countryId,_that.name,_that.description,_that.price,_that.numberOfListings,_that.createdAt,_that.updatedAt,_that.categoryId,_that.packageType,_that.promotionDays,_that.country);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Package implements Package {
  const _Package({required this.id, @JsonKey(name: 'country_id') required this.countryId, required this.name, required this.description, required this.price, @JsonKey(name: 'number_of_listings') required this.numberOfListings, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'updated_at') required this.updatedAt, @JsonKey(name: 'category_id') required this.categoryId, @JsonKey(name: 'package_type') required this.packageType, @JsonKey(name: 'promotion_days') required this.promotionDays, this.country});
  factory _Package.fromJson(Map<String, dynamic> json) => _$PackageFromJson(json);

@override final  String id;
@override@JsonKey(name: 'country_id') final  int countryId;
@override final  String name;
@override final  String? description;
@override final  String price;
@override@JsonKey(name: 'number_of_listings') final  int? numberOfListings;
@override@JsonKey(name: 'created_at') final  String createdAt;
@override@JsonKey(name: 'updated_at') final  String updatedAt;
@override@JsonKey(name: 'category_id') final  int? categoryId;
@override@JsonKey(name: 'package_type') final  String packageType;
@override@JsonKey(name: 'promotion_days') final  int? promotionDays;
@override final  Country? country;

/// Create a copy of Package
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PackageCopyWith<_Package> get copyWith => __$PackageCopyWithImpl<_Package>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PackageToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Package&&(identical(other.id, id) || other.id == id)&&(identical(other.countryId, countryId) || other.countryId == countryId)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.price, price) || other.price == price)&&(identical(other.numberOfListings, numberOfListings) || other.numberOfListings == numberOfListings)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.packageType, packageType) || other.packageType == packageType)&&(identical(other.promotionDays, promotionDays) || other.promotionDays == promotionDays)&&(identical(other.country, country) || other.country == country));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,countryId,name,description,price,numberOfListings,createdAt,updatedAt,categoryId,packageType,promotionDays,country);

@override
String toString() {
  return 'Package(id: $id, countryId: $countryId, name: $name, description: $description, price: $price, numberOfListings: $numberOfListings, createdAt: $createdAt, updatedAt: $updatedAt, categoryId: $categoryId, packageType: $packageType, promotionDays: $promotionDays, country: $country)';
}


}

/// @nodoc
abstract mixin class _$PackageCopyWith<$Res> implements $PackageCopyWith<$Res> {
  factory _$PackageCopyWith(_Package value, $Res Function(_Package) _then) = __$PackageCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'country_id') int countryId, String name, String? description, String price,@JsonKey(name: 'number_of_listings') int? numberOfListings,@JsonKey(name: 'created_at') String createdAt,@JsonKey(name: 'updated_at') String updatedAt,@JsonKey(name: 'category_id') int? categoryId,@JsonKey(name: 'package_type') String packageType,@JsonKey(name: 'promotion_days') int? promotionDays, Country? country
});


@override $CountryCopyWith<$Res>? get country;

}
/// @nodoc
class __$PackageCopyWithImpl<$Res>
    implements _$PackageCopyWith<$Res> {
  __$PackageCopyWithImpl(this._self, this._then);

  final _Package _self;
  final $Res Function(_Package) _then;

/// Create a copy of Package
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? countryId = null,Object? name = null,Object? description = freezed,Object? price = null,Object? numberOfListings = freezed,Object? createdAt = null,Object? updatedAt = null,Object? categoryId = freezed,Object? packageType = null,Object? promotionDays = freezed,Object? country = freezed,}) {
  return _then(_Package(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,countryId: null == countryId ? _self.countryId : countryId // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as String,numberOfListings: freezed == numberOfListings ? _self.numberOfListings : numberOfListings // ignore: cast_nullable_to_non_nullable
as int?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int?,packageType: null == packageType ? _self.packageType : packageType // ignore: cast_nullable_to_non_nullable
as String,promotionDays: freezed == promotionDays ? _self.promotionDays : promotionDays // ignore: cast_nullable_to_non_nullable
as int?,country: freezed == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as Country?,
  ));
}

/// Create a copy of Package
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CountryCopyWith<$Res>? get country {
    if (_self.country == null) {
    return null;
  }

  return $CountryCopyWith<$Res>(_self.country!, (value) {
    return _then(_self.copyWith(country: value));
  });
}
}


/// @nodoc
mixin _$Country {

 int get id; String get name; String get iso3; String get iso2;@JsonKey(name: 'numeric_code') String get numericCode;@JsonKey(name: 'phone_code') String get phoneCode; String get capital; String get currency;@JsonKey(name: 'currency_name') String get currencyName;@JsonKey(name: 'currency_symbol') String get currencySymbol; String get tld; String get native; String get region; String get subregion; String get latitude; String get longitude; String get emoji;@JsonKey(name: 'emojiU') String get emojiU;@JsonKey(name: 'created_at') String get createdAt;@JsonKey(name: 'updated_at') String get updatedAt;
/// Create a copy of Country
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CountryCopyWith<Country> get copyWith => _$CountryCopyWithImpl<Country>(this as Country, _$identity);

  /// Serializes this Country to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Country&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.iso3, iso3) || other.iso3 == iso3)&&(identical(other.iso2, iso2) || other.iso2 == iso2)&&(identical(other.numericCode, numericCode) || other.numericCode == numericCode)&&(identical(other.phoneCode, phoneCode) || other.phoneCode == phoneCode)&&(identical(other.capital, capital) || other.capital == capital)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.currencyName, currencyName) || other.currencyName == currencyName)&&(identical(other.currencySymbol, currencySymbol) || other.currencySymbol == currencySymbol)&&(identical(other.tld, tld) || other.tld == tld)&&(identical(other.native, native) || other.native == native)&&(identical(other.region, region) || other.region == region)&&(identical(other.subregion, subregion) || other.subregion == subregion)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.emoji, emoji) || other.emoji == emoji)&&(identical(other.emojiU, emojiU) || other.emojiU == emojiU)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,name,iso3,iso2,numericCode,phoneCode,capital,currency,currencyName,currencySymbol,tld,native,region,subregion,latitude,longitude,emoji,emojiU,createdAt,updatedAt]);

@override
String toString() {
  return 'Country(id: $id, name: $name, iso3: $iso3, iso2: $iso2, numericCode: $numericCode, phoneCode: $phoneCode, capital: $capital, currency: $currency, currencyName: $currencyName, currencySymbol: $currencySymbol, tld: $tld, native: $native, region: $region, subregion: $subregion, latitude: $latitude, longitude: $longitude, emoji: $emoji, emojiU: $emojiU, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $CountryCopyWith<$Res>  {
  factory $CountryCopyWith(Country value, $Res Function(Country) _then) = _$CountryCopyWithImpl;
@useResult
$Res call({
 int id, String name, String iso3, String iso2,@JsonKey(name: 'numeric_code') String numericCode,@JsonKey(name: 'phone_code') String phoneCode, String capital, String currency,@JsonKey(name: 'currency_name') String currencyName,@JsonKey(name: 'currency_symbol') String currencySymbol, String tld, String native, String region, String subregion, String latitude, String longitude, String emoji,@JsonKey(name: 'emojiU') String emojiU,@JsonKey(name: 'created_at') String createdAt,@JsonKey(name: 'updated_at') String updatedAt
});




}
/// @nodoc
class _$CountryCopyWithImpl<$Res>
    implements $CountryCopyWith<$Res> {
  _$CountryCopyWithImpl(this._self, this._then);

  final Country _self;
  final $Res Function(Country) _then;

/// Create a copy of Country
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? iso3 = null,Object? iso2 = null,Object? numericCode = null,Object? phoneCode = null,Object? capital = null,Object? currency = null,Object? currencyName = null,Object? currencySymbol = null,Object? tld = null,Object? native = null,Object? region = null,Object? subregion = null,Object? latitude = null,Object? longitude = null,Object? emoji = null,Object? emojiU = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,iso3: null == iso3 ? _self.iso3 : iso3 // ignore: cast_nullable_to_non_nullable
as String,iso2: null == iso2 ? _self.iso2 : iso2 // ignore: cast_nullable_to_non_nullable
as String,numericCode: null == numericCode ? _self.numericCode : numericCode // ignore: cast_nullable_to_non_nullable
as String,phoneCode: null == phoneCode ? _self.phoneCode : phoneCode // ignore: cast_nullable_to_non_nullable
as String,capital: null == capital ? _self.capital : capital // ignore: cast_nullable_to_non_nullable
as String,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,currencyName: null == currencyName ? _self.currencyName : currencyName // ignore: cast_nullable_to_non_nullable
as String,currencySymbol: null == currencySymbol ? _self.currencySymbol : currencySymbol // ignore: cast_nullable_to_non_nullable
as String,tld: null == tld ? _self.tld : tld // ignore: cast_nullable_to_non_nullable
as String,native: null == native ? _self.native : native // ignore: cast_nullable_to_non_nullable
as String,region: null == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as String,subregion: null == subregion ? _self.subregion : subregion // ignore: cast_nullable_to_non_nullable
as String,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as String,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as String,emoji: null == emoji ? _self.emoji : emoji // ignore: cast_nullable_to_non_nullable
as String,emojiU: null == emojiU ? _self.emojiU : emojiU // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Country].
extension CountryPatterns on Country {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Country value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Country() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Country value)  $default,){
final _that = this;
switch (_that) {
case _Country():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Country value)?  $default,){
final _that = this;
switch (_that) {
case _Country() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String iso3,  String iso2, @JsonKey(name: 'numeric_code')  String numericCode, @JsonKey(name: 'phone_code')  String phoneCode,  String capital,  String currency, @JsonKey(name: 'currency_name')  String currencyName, @JsonKey(name: 'currency_symbol')  String currencySymbol,  String tld,  String native,  String region,  String subregion,  String latitude,  String longitude,  String emoji, @JsonKey(name: 'emojiU')  String emojiU, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'updated_at')  String updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Country() when $default != null:
return $default(_that.id,_that.name,_that.iso3,_that.iso2,_that.numericCode,_that.phoneCode,_that.capital,_that.currency,_that.currencyName,_that.currencySymbol,_that.tld,_that.native,_that.region,_that.subregion,_that.latitude,_that.longitude,_that.emoji,_that.emojiU,_that.createdAt,_that.updatedAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String iso3,  String iso2, @JsonKey(name: 'numeric_code')  String numericCode, @JsonKey(name: 'phone_code')  String phoneCode,  String capital,  String currency, @JsonKey(name: 'currency_name')  String currencyName, @JsonKey(name: 'currency_symbol')  String currencySymbol,  String tld,  String native,  String region,  String subregion,  String latitude,  String longitude,  String emoji, @JsonKey(name: 'emojiU')  String emojiU, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'updated_at')  String updatedAt)  $default,) {final _that = this;
switch (_that) {
case _Country():
return $default(_that.id,_that.name,_that.iso3,_that.iso2,_that.numericCode,_that.phoneCode,_that.capital,_that.currency,_that.currencyName,_that.currencySymbol,_that.tld,_that.native,_that.region,_that.subregion,_that.latitude,_that.longitude,_that.emoji,_that.emojiU,_that.createdAt,_that.updatedAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String iso3,  String iso2, @JsonKey(name: 'numeric_code')  String numericCode, @JsonKey(name: 'phone_code')  String phoneCode,  String capital,  String currency, @JsonKey(name: 'currency_name')  String currencyName, @JsonKey(name: 'currency_symbol')  String currencySymbol,  String tld,  String native,  String region,  String subregion,  String latitude,  String longitude,  String emoji, @JsonKey(name: 'emojiU')  String emojiU, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'updated_at')  String updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _Country() when $default != null:
return $default(_that.id,_that.name,_that.iso3,_that.iso2,_that.numericCode,_that.phoneCode,_that.capital,_that.currency,_that.currencyName,_that.currencySymbol,_that.tld,_that.native,_that.region,_that.subregion,_that.latitude,_that.longitude,_that.emoji,_that.emojiU,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Country implements Country {
  const _Country({required this.id, required this.name, required this.iso3, required this.iso2, @JsonKey(name: 'numeric_code') required this.numericCode, @JsonKey(name: 'phone_code') required this.phoneCode, required this.capital, required this.currency, @JsonKey(name: 'currency_name') required this.currencyName, @JsonKey(name: 'currency_symbol') required this.currencySymbol, required this.tld, required this.native, required this.region, required this.subregion, required this.latitude, required this.longitude, required this.emoji, @JsonKey(name: 'emojiU') required this.emojiU, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'updated_at') required this.updatedAt});
  factory _Country.fromJson(Map<String, dynamic> json) => _$CountryFromJson(json);

@override final  int id;
@override final  String name;
@override final  String iso3;
@override final  String iso2;
@override@JsonKey(name: 'numeric_code') final  String numericCode;
@override@JsonKey(name: 'phone_code') final  String phoneCode;
@override final  String capital;
@override final  String currency;
@override@JsonKey(name: 'currency_name') final  String currencyName;
@override@JsonKey(name: 'currency_symbol') final  String currencySymbol;
@override final  String tld;
@override final  String native;
@override final  String region;
@override final  String subregion;
@override final  String latitude;
@override final  String longitude;
@override final  String emoji;
@override@JsonKey(name: 'emojiU') final  String emojiU;
@override@JsonKey(name: 'created_at') final  String createdAt;
@override@JsonKey(name: 'updated_at') final  String updatedAt;

/// Create a copy of Country
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CountryCopyWith<_Country> get copyWith => __$CountryCopyWithImpl<_Country>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CountryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Country&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.iso3, iso3) || other.iso3 == iso3)&&(identical(other.iso2, iso2) || other.iso2 == iso2)&&(identical(other.numericCode, numericCode) || other.numericCode == numericCode)&&(identical(other.phoneCode, phoneCode) || other.phoneCode == phoneCode)&&(identical(other.capital, capital) || other.capital == capital)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.currencyName, currencyName) || other.currencyName == currencyName)&&(identical(other.currencySymbol, currencySymbol) || other.currencySymbol == currencySymbol)&&(identical(other.tld, tld) || other.tld == tld)&&(identical(other.native, native) || other.native == native)&&(identical(other.region, region) || other.region == region)&&(identical(other.subregion, subregion) || other.subregion == subregion)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.emoji, emoji) || other.emoji == emoji)&&(identical(other.emojiU, emojiU) || other.emojiU == emojiU)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,name,iso3,iso2,numericCode,phoneCode,capital,currency,currencyName,currencySymbol,tld,native,region,subregion,latitude,longitude,emoji,emojiU,createdAt,updatedAt]);

@override
String toString() {
  return 'Country(id: $id, name: $name, iso3: $iso3, iso2: $iso2, numericCode: $numericCode, phoneCode: $phoneCode, capital: $capital, currency: $currency, currencyName: $currencyName, currencySymbol: $currencySymbol, tld: $tld, native: $native, region: $region, subregion: $subregion, latitude: $latitude, longitude: $longitude, emoji: $emoji, emojiU: $emojiU, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$CountryCopyWith<$Res> implements $CountryCopyWith<$Res> {
  factory _$CountryCopyWith(_Country value, $Res Function(_Country) _then) = __$CountryCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String iso3, String iso2,@JsonKey(name: 'numeric_code') String numericCode,@JsonKey(name: 'phone_code') String phoneCode, String capital, String currency,@JsonKey(name: 'currency_name') String currencyName,@JsonKey(name: 'currency_symbol') String currencySymbol, String tld, String native, String region, String subregion, String latitude, String longitude, String emoji,@JsonKey(name: 'emojiU') String emojiU,@JsonKey(name: 'created_at') String createdAt,@JsonKey(name: 'updated_at') String updatedAt
});




}
/// @nodoc
class __$CountryCopyWithImpl<$Res>
    implements _$CountryCopyWith<$Res> {
  __$CountryCopyWithImpl(this._self, this._then);

  final _Country _self;
  final $Res Function(_Country) _then;

/// Create a copy of Country
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? iso3 = null,Object? iso2 = null,Object? numericCode = null,Object? phoneCode = null,Object? capital = null,Object? currency = null,Object? currencyName = null,Object? currencySymbol = null,Object? tld = null,Object? native = null,Object? region = null,Object? subregion = null,Object? latitude = null,Object? longitude = null,Object? emoji = null,Object? emojiU = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_Country(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,iso3: null == iso3 ? _self.iso3 : iso3 // ignore: cast_nullable_to_non_nullable
as String,iso2: null == iso2 ? _self.iso2 : iso2 // ignore: cast_nullable_to_non_nullable
as String,numericCode: null == numericCode ? _self.numericCode : numericCode // ignore: cast_nullable_to_non_nullable
as String,phoneCode: null == phoneCode ? _self.phoneCode : phoneCode // ignore: cast_nullable_to_non_nullable
as String,capital: null == capital ? _self.capital : capital // ignore: cast_nullable_to_non_nullable
as String,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,currencyName: null == currencyName ? _self.currencyName : currencyName // ignore: cast_nullable_to_non_nullable
as String,currencySymbol: null == currencySymbol ? _self.currencySymbol : currencySymbol // ignore: cast_nullable_to_non_nullable
as String,tld: null == tld ? _self.tld : tld // ignore: cast_nullable_to_non_nullable
as String,native: null == native ? _self.native : native // ignore: cast_nullable_to_non_nullable
as String,region: null == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as String,subregion: null == subregion ? _self.subregion : subregion // ignore: cast_nullable_to_non_nullable
as String,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as String,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as String,emoji: null == emoji ? _self.emoji : emoji // ignore: cast_nullable_to_non_nullable
as String,emojiU: null == emojiU ? _self.emojiU : emojiU // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
