// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserModel {

 String? get id; String get name; String get email; String? get password;@JsonKey(name: 'phone') String? get phoneNumber;@JsonKey(name: 'paid_seller') int? get paidSeller;@JsonKey(name: 'email_verified_at') DateTime? get emailVerifiedAt;@JsonKey(name: 'country_id') int? get countryId;@JsonKey(name: 'state_id') int? get stateId;@JsonKey(name: 'profile_photo') String? get profileImage;@JsonKey(name: 'created_at') DateTime? get createdAt;@JsonKey(name: 'updated_at') DateTime? get updatedAt;@JsonKey(name: 'deleted_at') DateTime? get deletedAt;@JsonKey(name: 'uploads_left') int? get uploadsLeft;@JsonKey(name: 'active_status') int? get activeStatus;@JsonKey(name: 'avatar') String? get avatar;@JsonKey(name: 'dark_mode') int? get darkMode;@JsonKey(name: 'messenger_color') String? get messengerColor;// Add this to handle nested country data
 CountryModel? get country;
/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserModelCopyWith<UserModel> get copyWith => _$UserModelCopyWithImpl<UserModel>(this as UserModel, _$identity);

  /// Serializes this UserModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.paidSeller, paidSeller) || other.paidSeller == paidSeller)&&(identical(other.emailVerifiedAt, emailVerifiedAt) || other.emailVerifiedAt == emailVerifiedAt)&&(identical(other.countryId, countryId) || other.countryId == countryId)&&(identical(other.stateId, stateId) || other.stateId == stateId)&&(identical(other.profileImage, profileImage) || other.profileImage == profileImage)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&(identical(other.uploadsLeft, uploadsLeft) || other.uploadsLeft == uploadsLeft)&&(identical(other.activeStatus, activeStatus) || other.activeStatus == activeStatus)&&(identical(other.avatar, avatar) || other.avatar == avatar)&&(identical(other.darkMode, darkMode) || other.darkMode == darkMode)&&(identical(other.messengerColor, messengerColor) || other.messengerColor == messengerColor)&&(identical(other.country, country) || other.country == country));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,name,email,password,phoneNumber,paidSeller,emailVerifiedAt,countryId,stateId,profileImage,createdAt,updatedAt,deletedAt,uploadsLeft,activeStatus,avatar,darkMode,messengerColor,country]);

@override
String toString() {
  return 'UserModel(id: $id, name: $name, email: $email, password: $password, phoneNumber: $phoneNumber, paidSeller: $paidSeller, emailVerifiedAt: $emailVerifiedAt, countryId: $countryId, stateId: $stateId, profileImage: $profileImage, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt, uploadsLeft: $uploadsLeft, activeStatus: $activeStatus, avatar: $avatar, darkMode: $darkMode, messengerColor: $messengerColor, country: $country)';
}


}

/// @nodoc
abstract mixin class $UserModelCopyWith<$Res>  {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) _then) = _$UserModelCopyWithImpl;
@useResult
$Res call({
 String? id, String name, String email, String? password,@JsonKey(name: 'phone') String? phoneNumber,@JsonKey(name: 'paid_seller') int? paidSeller,@JsonKey(name: 'email_verified_at') DateTime? emailVerifiedAt,@JsonKey(name: 'country_id') int? countryId,@JsonKey(name: 'state_id') int? stateId,@JsonKey(name: 'profile_photo') String? profileImage,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt,@JsonKey(name: 'deleted_at') DateTime? deletedAt,@JsonKey(name: 'uploads_left') int? uploadsLeft,@JsonKey(name: 'active_status') int? activeStatus,@JsonKey(name: 'avatar') String? avatar,@JsonKey(name: 'dark_mode') int? darkMode,@JsonKey(name: 'messenger_color') String? messengerColor, CountryModel? country
});


$CountryModelCopyWith<$Res>? get country;

}
/// @nodoc
class _$UserModelCopyWithImpl<$Res>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._self, this._then);

  final UserModel _self;
  final $Res Function(UserModel) _then;

/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = null,Object? email = null,Object? password = freezed,Object? phoneNumber = freezed,Object? paidSeller = freezed,Object? emailVerifiedAt = freezed,Object? countryId = freezed,Object? stateId = freezed,Object? profileImage = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? deletedAt = freezed,Object? uploadsLeft = freezed,Object? activeStatus = freezed,Object? avatar = freezed,Object? darkMode = freezed,Object? messengerColor = freezed,Object? country = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: freezed == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String?,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String?,paidSeller: freezed == paidSeller ? _self.paidSeller : paidSeller // ignore: cast_nullable_to_non_nullable
as int?,emailVerifiedAt: freezed == emailVerifiedAt ? _self.emailVerifiedAt : emailVerifiedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,countryId: freezed == countryId ? _self.countryId : countryId // ignore: cast_nullable_to_non_nullable
as int?,stateId: freezed == stateId ? _self.stateId : stateId // ignore: cast_nullable_to_non_nullable
as int?,profileImage: freezed == profileImage ? _self.profileImage : profileImage // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,uploadsLeft: freezed == uploadsLeft ? _self.uploadsLeft : uploadsLeft // ignore: cast_nullable_to_non_nullable
as int?,activeStatus: freezed == activeStatus ? _self.activeStatus : activeStatus // ignore: cast_nullable_to_non_nullable
as int?,avatar: freezed == avatar ? _self.avatar : avatar // ignore: cast_nullable_to_non_nullable
as String?,darkMode: freezed == darkMode ? _self.darkMode : darkMode // ignore: cast_nullable_to_non_nullable
as int?,messengerColor: freezed == messengerColor ? _self.messengerColor : messengerColor // ignore: cast_nullable_to_non_nullable
as String?,country: freezed == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as CountryModel?,
  ));
}
/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CountryModelCopyWith<$Res>? get country {
    if (_self.country == null) {
    return null;
  }

  return $CountryModelCopyWith<$Res>(_self.country!, (value) {
    return _then(_self.copyWith(country: value));
  });
}
}


/// Adds pattern-matching-related methods to [UserModel].
extension UserModelPatterns on UserModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserModel value)  $default,){
final _that = this;
switch (_that) {
case _UserModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserModel value)?  $default,){
final _that = this;
switch (_that) {
case _UserModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String name,  String email,  String? password, @JsonKey(name: 'phone')  String? phoneNumber, @JsonKey(name: 'paid_seller')  int? paidSeller, @JsonKey(name: 'email_verified_at')  DateTime? emailVerifiedAt, @JsonKey(name: 'country_id')  int? countryId, @JsonKey(name: 'state_id')  int? stateId, @JsonKey(name: 'profile_photo')  String? profileImage, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt, @JsonKey(name: 'deleted_at')  DateTime? deletedAt, @JsonKey(name: 'uploads_left')  int? uploadsLeft, @JsonKey(name: 'active_status')  int? activeStatus, @JsonKey(name: 'avatar')  String? avatar, @JsonKey(name: 'dark_mode')  int? darkMode, @JsonKey(name: 'messenger_color')  String? messengerColor,  CountryModel? country)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserModel() when $default != null:
return $default(_that.id,_that.name,_that.email,_that.password,_that.phoneNumber,_that.paidSeller,_that.emailVerifiedAt,_that.countryId,_that.stateId,_that.profileImage,_that.createdAt,_that.updatedAt,_that.deletedAt,_that.uploadsLeft,_that.activeStatus,_that.avatar,_that.darkMode,_that.messengerColor,_that.country);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String name,  String email,  String? password, @JsonKey(name: 'phone')  String? phoneNumber, @JsonKey(name: 'paid_seller')  int? paidSeller, @JsonKey(name: 'email_verified_at')  DateTime? emailVerifiedAt, @JsonKey(name: 'country_id')  int? countryId, @JsonKey(name: 'state_id')  int? stateId, @JsonKey(name: 'profile_photo')  String? profileImage, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt, @JsonKey(name: 'deleted_at')  DateTime? deletedAt, @JsonKey(name: 'uploads_left')  int? uploadsLeft, @JsonKey(name: 'active_status')  int? activeStatus, @JsonKey(name: 'avatar')  String? avatar, @JsonKey(name: 'dark_mode')  int? darkMode, @JsonKey(name: 'messenger_color')  String? messengerColor,  CountryModel? country)  $default,) {final _that = this;
switch (_that) {
case _UserModel():
return $default(_that.id,_that.name,_that.email,_that.password,_that.phoneNumber,_that.paidSeller,_that.emailVerifiedAt,_that.countryId,_that.stateId,_that.profileImage,_that.createdAt,_that.updatedAt,_that.deletedAt,_that.uploadsLeft,_that.activeStatus,_that.avatar,_that.darkMode,_that.messengerColor,_that.country);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String name,  String email,  String? password, @JsonKey(name: 'phone')  String? phoneNumber, @JsonKey(name: 'paid_seller')  int? paidSeller, @JsonKey(name: 'email_verified_at')  DateTime? emailVerifiedAt, @JsonKey(name: 'country_id')  int? countryId, @JsonKey(name: 'state_id')  int? stateId, @JsonKey(name: 'profile_photo')  String? profileImage, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt, @JsonKey(name: 'deleted_at')  DateTime? deletedAt, @JsonKey(name: 'uploads_left')  int? uploadsLeft, @JsonKey(name: 'active_status')  int? activeStatus, @JsonKey(name: 'avatar')  String? avatar, @JsonKey(name: 'dark_mode')  int? darkMode, @JsonKey(name: 'messenger_color')  String? messengerColor,  CountryModel? country)?  $default,) {final _that = this;
switch (_that) {
case _UserModel() when $default != null:
return $default(_that.id,_that.name,_that.email,_that.password,_that.phoneNumber,_that.paidSeller,_that.emailVerifiedAt,_that.countryId,_that.stateId,_that.profileImage,_that.createdAt,_that.updatedAt,_that.deletedAt,_that.uploadsLeft,_that.activeStatus,_that.avatar,_that.darkMode,_that.messengerColor,_that.country);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _UserModel extends UserModel {
  const _UserModel({this.id, required this.name, required this.email, this.password, @JsonKey(name: 'phone') this.phoneNumber, @JsonKey(name: 'paid_seller') this.paidSeller, @JsonKey(name: 'email_verified_at') this.emailVerifiedAt, @JsonKey(name: 'country_id') this.countryId, @JsonKey(name: 'state_id') this.stateId, @JsonKey(name: 'profile_photo') this.profileImage, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt, @JsonKey(name: 'deleted_at') this.deletedAt, @JsonKey(name: 'uploads_left') this.uploadsLeft, @JsonKey(name: 'active_status') this.activeStatus, @JsonKey(name: 'avatar') this.avatar, @JsonKey(name: 'dark_mode') this.darkMode, @JsonKey(name: 'messenger_color') this.messengerColor, this.country}): super._();
  factory _UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

@override final  String? id;
@override final  String name;
@override final  String email;
@override final  String? password;
@override@JsonKey(name: 'phone') final  String? phoneNumber;
@override@JsonKey(name: 'paid_seller') final  int? paidSeller;
@override@JsonKey(name: 'email_verified_at') final  DateTime? emailVerifiedAt;
@override@JsonKey(name: 'country_id') final  int? countryId;
@override@JsonKey(name: 'state_id') final  int? stateId;
@override@JsonKey(name: 'profile_photo') final  String? profileImage;
@override@JsonKey(name: 'created_at') final  DateTime? createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime? updatedAt;
@override@JsonKey(name: 'deleted_at') final  DateTime? deletedAt;
@override@JsonKey(name: 'uploads_left') final  int? uploadsLeft;
@override@JsonKey(name: 'active_status') final  int? activeStatus;
@override@JsonKey(name: 'avatar') final  String? avatar;
@override@JsonKey(name: 'dark_mode') final  int? darkMode;
@override@JsonKey(name: 'messenger_color') final  String? messengerColor;
// Add this to handle nested country data
@override final  CountryModel? country;

/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserModelCopyWith<_UserModel> get copyWith => __$UserModelCopyWithImpl<_UserModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.paidSeller, paidSeller) || other.paidSeller == paidSeller)&&(identical(other.emailVerifiedAt, emailVerifiedAt) || other.emailVerifiedAt == emailVerifiedAt)&&(identical(other.countryId, countryId) || other.countryId == countryId)&&(identical(other.stateId, stateId) || other.stateId == stateId)&&(identical(other.profileImage, profileImage) || other.profileImage == profileImage)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&(identical(other.uploadsLeft, uploadsLeft) || other.uploadsLeft == uploadsLeft)&&(identical(other.activeStatus, activeStatus) || other.activeStatus == activeStatus)&&(identical(other.avatar, avatar) || other.avatar == avatar)&&(identical(other.darkMode, darkMode) || other.darkMode == darkMode)&&(identical(other.messengerColor, messengerColor) || other.messengerColor == messengerColor)&&(identical(other.country, country) || other.country == country));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,name,email,password,phoneNumber,paidSeller,emailVerifiedAt,countryId,stateId,profileImage,createdAt,updatedAt,deletedAt,uploadsLeft,activeStatus,avatar,darkMode,messengerColor,country]);

@override
String toString() {
  return 'UserModel(id: $id, name: $name, email: $email, password: $password, phoneNumber: $phoneNumber, paidSeller: $paidSeller, emailVerifiedAt: $emailVerifiedAt, countryId: $countryId, stateId: $stateId, profileImage: $profileImage, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt, uploadsLeft: $uploadsLeft, activeStatus: $activeStatus, avatar: $avatar, darkMode: $darkMode, messengerColor: $messengerColor, country: $country)';
}


}

/// @nodoc
abstract mixin class _$UserModelCopyWith<$Res> implements $UserModelCopyWith<$Res> {
  factory _$UserModelCopyWith(_UserModel value, $Res Function(_UserModel) _then) = __$UserModelCopyWithImpl;
@override @useResult
$Res call({
 String? id, String name, String email, String? password,@JsonKey(name: 'phone') String? phoneNumber,@JsonKey(name: 'paid_seller') int? paidSeller,@JsonKey(name: 'email_verified_at') DateTime? emailVerifiedAt,@JsonKey(name: 'country_id') int? countryId,@JsonKey(name: 'state_id') int? stateId,@JsonKey(name: 'profile_photo') String? profileImage,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt,@JsonKey(name: 'deleted_at') DateTime? deletedAt,@JsonKey(name: 'uploads_left') int? uploadsLeft,@JsonKey(name: 'active_status') int? activeStatus,@JsonKey(name: 'avatar') String? avatar,@JsonKey(name: 'dark_mode') int? darkMode,@JsonKey(name: 'messenger_color') String? messengerColor, CountryModel? country
});


@override $CountryModelCopyWith<$Res>? get country;

}
/// @nodoc
class __$UserModelCopyWithImpl<$Res>
    implements _$UserModelCopyWith<$Res> {
  __$UserModelCopyWithImpl(this._self, this._then);

  final _UserModel _self;
  final $Res Function(_UserModel) _then;

/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = null,Object? email = null,Object? password = freezed,Object? phoneNumber = freezed,Object? paidSeller = freezed,Object? emailVerifiedAt = freezed,Object? countryId = freezed,Object? stateId = freezed,Object? profileImage = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? deletedAt = freezed,Object? uploadsLeft = freezed,Object? activeStatus = freezed,Object? avatar = freezed,Object? darkMode = freezed,Object? messengerColor = freezed,Object? country = freezed,}) {
  return _then(_UserModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: freezed == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String?,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String?,paidSeller: freezed == paidSeller ? _self.paidSeller : paidSeller // ignore: cast_nullable_to_non_nullable
as int?,emailVerifiedAt: freezed == emailVerifiedAt ? _self.emailVerifiedAt : emailVerifiedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,countryId: freezed == countryId ? _self.countryId : countryId // ignore: cast_nullable_to_non_nullable
as int?,stateId: freezed == stateId ? _self.stateId : stateId // ignore: cast_nullable_to_non_nullable
as int?,profileImage: freezed == profileImage ? _self.profileImage : profileImage // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,uploadsLeft: freezed == uploadsLeft ? _self.uploadsLeft : uploadsLeft // ignore: cast_nullable_to_non_nullable
as int?,activeStatus: freezed == activeStatus ? _self.activeStatus : activeStatus // ignore: cast_nullable_to_non_nullable
as int?,avatar: freezed == avatar ? _self.avatar : avatar // ignore: cast_nullable_to_non_nullable
as String?,darkMode: freezed == darkMode ? _self.darkMode : darkMode // ignore: cast_nullable_to_non_nullable
as int?,messengerColor: freezed == messengerColor ? _self.messengerColor : messengerColor // ignore: cast_nullable_to_non_nullable
as String?,country: freezed == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as CountryModel?,
  ));
}

/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CountryModelCopyWith<$Res>? get country {
    if (_self.country == null) {
    return null;
  }

  return $CountryModelCopyWith<$Res>(_self.country!, (value) {
    return _then(_self.copyWith(country: value));
  });
}
}


/// @nodoc
mixin _$CountryModel {

 int? get id; String? get name; String? get iso3; String? get iso2;@JsonKey(name: 'numeric_code') String? get numericCode;@JsonKey(name: 'phone_code') String? get phoneCode; String? get capital; String? get currency;@JsonKey(name: 'currency_name') String? get currencyName;@JsonKey(name: 'currency_symbol') String? get currencySymbol; String? get tld; String? get native; String? get region; String? get subregion; String? get latitude; String? get longitude; String? get emoji;
/// Create a copy of CountryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CountryModelCopyWith<CountryModel> get copyWith => _$CountryModelCopyWithImpl<CountryModel>(this as CountryModel, _$identity);

  /// Serializes this CountryModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CountryModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.iso3, iso3) || other.iso3 == iso3)&&(identical(other.iso2, iso2) || other.iso2 == iso2)&&(identical(other.numericCode, numericCode) || other.numericCode == numericCode)&&(identical(other.phoneCode, phoneCode) || other.phoneCode == phoneCode)&&(identical(other.capital, capital) || other.capital == capital)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.currencyName, currencyName) || other.currencyName == currencyName)&&(identical(other.currencySymbol, currencySymbol) || other.currencySymbol == currencySymbol)&&(identical(other.tld, tld) || other.tld == tld)&&(identical(other.native, native) || other.native == native)&&(identical(other.region, region) || other.region == region)&&(identical(other.subregion, subregion) || other.subregion == subregion)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.emoji, emoji) || other.emoji == emoji));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,iso3,iso2,numericCode,phoneCode,capital,currency,currencyName,currencySymbol,tld,native,region,subregion,latitude,longitude,emoji);

@override
String toString() {
  return 'CountryModel(id: $id, name: $name, iso3: $iso3, iso2: $iso2, numericCode: $numericCode, phoneCode: $phoneCode, capital: $capital, currency: $currency, currencyName: $currencyName, currencySymbol: $currencySymbol, tld: $tld, native: $native, region: $region, subregion: $subregion, latitude: $latitude, longitude: $longitude, emoji: $emoji)';
}


}

/// @nodoc
abstract mixin class $CountryModelCopyWith<$Res>  {
  factory $CountryModelCopyWith(CountryModel value, $Res Function(CountryModel) _then) = _$CountryModelCopyWithImpl;
@useResult
$Res call({
 int? id, String? name, String? iso3, String? iso2,@JsonKey(name: 'numeric_code') String? numericCode,@JsonKey(name: 'phone_code') String? phoneCode, String? capital, String? currency,@JsonKey(name: 'currency_name') String? currencyName,@JsonKey(name: 'currency_symbol') String? currencySymbol, String? tld, String? native, String? region, String? subregion, String? latitude, String? longitude, String? emoji
});




}
/// @nodoc
class _$CountryModelCopyWithImpl<$Res>
    implements $CountryModelCopyWith<$Res> {
  _$CountryModelCopyWithImpl(this._self, this._then);

  final CountryModel _self;
  final $Res Function(CountryModel) _then;

/// Create a copy of CountryModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = freezed,Object? iso3 = freezed,Object? iso2 = freezed,Object? numericCode = freezed,Object? phoneCode = freezed,Object? capital = freezed,Object? currency = freezed,Object? currencyName = freezed,Object? currencySymbol = freezed,Object? tld = freezed,Object? native = freezed,Object? region = freezed,Object? subregion = freezed,Object? latitude = freezed,Object? longitude = freezed,Object? emoji = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,iso3: freezed == iso3 ? _self.iso3 : iso3 // ignore: cast_nullable_to_non_nullable
as String?,iso2: freezed == iso2 ? _self.iso2 : iso2 // ignore: cast_nullable_to_non_nullable
as String?,numericCode: freezed == numericCode ? _self.numericCode : numericCode // ignore: cast_nullable_to_non_nullable
as String?,phoneCode: freezed == phoneCode ? _self.phoneCode : phoneCode // ignore: cast_nullable_to_non_nullable
as String?,capital: freezed == capital ? _self.capital : capital // ignore: cast_nullable_to_non_nullable
as String?,currency: freezed == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String?,currencyName: freezed == currencyName ? _self.currencyName : currencyName // ignore: cast_nullable_to_non_nullable
as String?,currencySymbol: freezed == currencySymbol ? _self.currencySymbol : currencySymbol // ignore: cast_nullable_to_non_nullable
as String?,tld: freezed == tld ? _self.tld : tld // ignore: cast_nullable_to_non_nullable
as String?,native: freezed == native ? _self.native : native // ignore: cast_nullable_to_non_nullable
as String?,region: freezed == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as String?,subregion: freezed == subregion ? _self.subregion : subregion // ignore: cast_nullable_to_non_nullable
as String?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as String?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as String?,emoji: freezed == emoji ? _self.emoji : emoji // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CountryModel].
extension CountryModelPatterns on CountryModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CountryModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CountryModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CountryModel value)  $default,){
final _that = this;
switch (_that) {
case _CountryModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CountryModel value)?  $default,){
final _that = this;
switch (_that) {
case _CountryModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String? name,  String? iso3,  String? iso2, @JsonKey(name: 'numeric_code')  String? numericCode, @JsonKey(name: 'phone_code')  String? phoneCode,  String? capital,  String? currency, @JsonKey(name: 'currency_name')  String? currencyName, @JsonKey(name: 'currency_symbol')  String? currencySymbol,  String? tld,  String? native,  String? region,  String? subregion,  String? latitude,  String? longitude,  String? emoji)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CountryModel() when $default != null:
return $default(_that.id,_that.name,_that.iso3,_that.iso2,_that.numericCode,_that.phoneCode,_that.capital,_that.currency,_that.currencyName,_that.currencySymbol,_that.tld,_that.native,_that.region,_that.subregion,_that.latitude,_that.longitude,_that.emoji);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String? name,  String? iso3,  String? iso2, @JsonKey(name: 'numeric_code')  String? numericCode, @JsonKey(name: 'phone_code')  String? phoneCode,  String? capital,  String? currency, @JsonKey(name: 'currency_name')  String? currencyName, @JsonKey(name: 'currency_symbol')  String? currencySymbol,  String? tld,  String? native,  String? region,  String? subregion,  String? latitude,  String? longitude,  String? emoji)  $default,) {final _that = this;
switch (_that) {
case _CountryModel():
return $default(_that.id,_that.name,_that.iso3,_that.iso2,_that.numericCode,_that.phoneCode,_that.capital,_that.currency,_that.currencyName,_that.currencySymbol,_that.tld,_that.native,_that.region,_that.subregion,_that.latitude,_that.longitude,_that.emoji);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String? name,  String? iso3,  String? iso2, @JsonKey(name: 'numeric_code')  String? numericCode, @JsonKey(name: 'phone_code')  String? phoneCode,  String? capital,  String? currency, @JsonKey(name: 'currency_name')  String? currencyName, @JsonKey(name: 'currency_symbol')  String? currencySymbol,  String? tld,  String? native,  String? region,  String? subregion,  String? latitude,  String? longitude,  String? emoji)?  $default,) {final _that = this;
switch (_that) {
case _CountryModel() when $default != null:
return $default(_that.id,_that.name,_that.iso3,_that.iso2,_that.numericCode,_that.phoneCode,_that.capital,_that.currency,_that.currencyName,_that.currencySymbol,_that.tld,_that.native,_that.region,_that.subregion,_that.latitude,_that.longitude,_that.emoji);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CountryModel implements CountryModel {
  const _CountryModel({this.id, this.name, this.iso3, this.iso2, @JsonKey(name: 'numeric_code') this.numericCode, @JsonKey(name: 'phone_code') this.phoneCode, this.capital, this.currency, @JsonKey(name: 'currency_name') this.currencyName, @JsonKey(name: 'currency_symbol') this.currencySymbol, this.tld, this.native, this.region, this.subregion, this.latitude, this.longitude, this.emoji});
  factory _CountryModel.fromJson(Map<String, dynamic> json) => _$CountryModelFromJson(json);

@override final  int? id;
@override final  String? name;
@override final  String? iso3;
@override final  String? iso2;
@override@JsonKey(name: 'numeric_code') final  String? numericCode;
@override@JsonKey(name: 'phone_code') final  String? phoneCode;
@override final  String? capital;
@override final  String? currency;
@override@JsonKey(name: 'currency_name') final  String? currencyName;
@override@JsonKey(name: 'currency_symbol') final  String? currencySymbol;
@override final  String? tld;
@override final  String? native;
@override final  String? region;
@override final  String? subregion;
@override final  String? latitude;
@override final  String? longitude;
@override final  String? emoji;

/// Create a copy of CountryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CountryModelCopyWith<_CountryModel> get copyWith => __$CountryModelCopyWithImpl<_CountryModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CountryModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CountryModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.iso3, iso3) || other.iso3 == iso3)&&(identical(other.iso2, iso2) || other.iso2 == iso2)&&(identical(other.numericCode, numericCode) || other.numericCode == numericCode)&&(identical(other.phoneCode, phoneCode) || other.phoneCode == phoneCode)&&(identical(other.capital, capital) || other.capital == capital)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.currencyName, currencyName) || other.currencyName == currencyName)&&(identical(other.currencySymbol, currencySymbol) || other.currencySymbol == currencySymbol)&&(identical(other.tld, tld) || other.tld == tld)&&(identical(other.native, native) || other.native == native)&&(identical(other.region, region) || other.region == region)&&(identical(other.subregion, subregion) || other.subregion == subregion)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.emoji, emoji) || other.emoji == emoji));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,iso3,iso2,numericCode,phoneCode,capital,currency,currencyName,currencySymbol,tld,native,region,subregion,latitude,longitude,emoji);

@override
String toString() {
  return 'CountryModel(id: $id, name: $name, iso3: $iso3, iso2: $iso2, numericCode: $numericCode, phoneCode: $phoneCode, capital: $capital, currency: $currency, currencyName: $currencyName, currencySymbol: $currencySymbol, tld: $tld, native: $native, region: $region, subregion: $subregion, latitude: $latitude, longitude: $longitude, emoji: $emoji)';
}


}

/// @nodoc
abstract mixin class _$CountryModelCopyWith<$Res> implements $CountryModelCopyWith<$Res> {
  factory _$CountryModelCopyWith(_CountryModel value, $Res Function(_CountryModel) _then) = __$CountryModelCopyWithImpl;
@override @useResult
$Res call({
 int? id, String? name, String? iso3, String? iso2,@JsonKey(name: 'numeric_code') String? numericCode,@JsonKey(name: 'phone_code') String? phoneCode, String? capital, String? currency,@JsonKey(name: 'currency_name') String? currencyName,@JsonKey(name: 'currency_symbol') String? currencySymbol, String? tld, String? native, String? region, String? subregion, String? latitude, String? longitude, String? emoji
});




}
/// @nodoc
class __$CountryModelCopyWithImpl<$Res>
    implements _$CountryModelCopyWith<$Res> {
  __$CountryModelCopyWithImpl(this._self, this._then);

  final _CountryModel _self;
  final $Res Function(_CountryModel) _then;

/// Create a copy of CountryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = freezed,Object? iso3 = freezed,Object? iso2 = freezed,Object? numericCode = freezed,Object? phoneCode = freezed,Object? capital = freezed,Object? currency = freezed,Object? currencyName = freezed,Object? currencySymbol = freezed,Object? tld = freezed,Object? native = freezed,Object? region = freezed,Object? subregion = freezed,Object? latitude = freezed,Object? longitude = freezed,Object? emoji = freezed,}) {
  return _then(_CountryModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,iso3: freezed == iso3 ? _self.iso3 : iso3 // ignore: cast_nullable_to_non_nullable
as String?,iso2: freezed == iso2 ? _self.iso2 : iso2 // ignore: cast_nullable_to_non_nullable
as String?,numericCode: freezed == numericCode ? _self.numericCode : numericCode // ignore: cast_nullable_to_non_nullable
as String?,phoneCode: freezed == phoneCode ? _self.phoneCode : phoneCode // ignore: cast_nullable_to_non_nullable
as String?,capital: freezed == capital ? _self.capital : capital // ignore: cast_nullable_to_non_nullable
as String?,currency: freezed == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String?,currencyName: freezed == currencyName ? _self.currencyName : currencyName // ignore: cast_nullable_to_non_nullable
as String?,currencySymbol: freezed == currencySymbol ? _self.currencySymbol : currencySymbol // ignore: cast_nullable_to_non_nullable
as String?,tld: freezed == tld ? _self.tld : tld // ignore: cast_nullable_to_non_nullable
as String?,native: freezed == native ? _self.native : native // ignore: cast_nullable_to_non_nullable
as String?,region: freezed == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as String?,subregion: freezed == subregion ? _self.subregion : subregion // ignore: cast_nullable_to_non_nullable
as String?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as String?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as String?,emoji: freezed == emoji ? _self.emoji : emoji // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
