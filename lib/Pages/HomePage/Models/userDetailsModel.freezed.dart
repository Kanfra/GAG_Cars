// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'userDetailsModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserDetails implements DiagnosticableTreeMixin {

 String get id; String get name; String get email; String? get phone;@JsonKey(name: 'email_verified_at') DateTime? get emailVerifiedAt;@JsonKey(name: 'paid_seller') int? get paidSeller;@JsonKey(name: 'deleted_at') DateTime? get deletedAt;@JsonKey(name: 'created_at') DateTime? get createdAt;@JsonKey(name: 'updated_at') DateTime? get updatedAt;@JsonKey(name: 'country_id') int? get countryId;@JsonKey(name: 'state_id') int? get stateId;@JsonKey(name: 'profile_photo') String? get profilePhoto;@JsonKey(name: 'uploads_left') int? get uploadsLeft;@JsonKey(name: 'active_status') int? get activeStatus; String? get avatar;@JsonKey(name: 'dark_mode') int? get darkMode;@JsonKey(name: 'messenger_color') String? get messengerColor;// ADD THIS FIELD:
@JsonKey(name: 'items_count') int? get itemsCount;
/// Create a copy of UserDetails
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserDetailsCopyWith<UserDetails> get copyWith => _$UserDetailsCopyWithImpl<UserDetails>(this as UserDetails, _$identity);

  /// Serializes this UserDetails to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'UserDetails'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('name', name))..add(DiagnosticsProperty('email', email))..add(DiagnosticsProperty('phone', phone))..add(DiagnosticsProperty('emailVerifiedAt', emailVerifiedAt))..add(DiagnosticsProperty('paidSeller', paidSeller))..add(DiagnosticsProperty('deletedAt', deletedAt))..add(DiagnosticsProperty('createdAt', createdAt))..add(DiagnosticsProperty('updatedAt', updatedAt))..add(DiagnosticsProperty('countryId', countryId))..add(DiagnosticsProperty('stateId', stateId))..add(DiagnosticsProperty('profilePhoto', profilePhoto))..add(DiagnosticsProperty('uploadsLeft', uploadsLeft))..add(DiagnosticsProperty('activeStatus', activeStatus))..add(DiagnosticsProperty('avatar', avatar))..add(DiagnosticsProperty('darkMode', darkMode))..add(DiagnosticsProperty('messengerColor', messengerColor))..add(DiagnosticsProperty('itemsCount', itemsCount));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserDetails&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.emailVerifiedAt, emailVerifiedAt) || other.emailVerifiedAt == emailVerifiedAt)&&(identical(other.paidSeller, paidSeller) || other.paidSeller == paidSeller)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.countryId, countryId) || other.countryId == countryId)&&(identical(other.stateId, stateId) || other.stateId == stateId)&&(identical(other.profilePhoto, profilePhoto) || other.profilePhoto == profilePhoto)&&(identical(other.uploadsLeft, uploadsLeft) || other.uploadsLeft == uploadsLeft)&&(identical(other.activeStatus, activeStatus) || other.activeStatus == activeStatus)&&(identical(other.avatar, avatar) || other.avatar == avatar)&&(identical(other.darkMode, darkMode) || other.darkMode == darkMode)&&(identical(other.messengerColor, messengerColor) || other.messengerColor == messengerColor)&&(identical(other.itemsCount, itemsCount) || other.itemsCount == itemsCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,email,phone,emailVerifiedAt,paidSeller,deletedAt,createdAt,updatedAt,countryId,stateId,profilePhoto,uploadsLeft,activeStatus,avatar,darkMode,messengerColor,itemsCount);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'UserDetails(id: $id, name: $name, email: $email, phone: $phone, emailVerifiedAt: $emailVerifiedAt, paidSeller: $paidSeller, deletedAt: $deletedAt, createdAt: $createdAt, updatedAt: $updatedAt, countryId: $countryId, stateId: $stateId, profilePhoto: $profilePhoto, uploadsLeft: $uploadsLeft, activeStatus: $activeStatus, avatar: $avatar, darkMode: $darkMode, messengerColor: $messengerColor, itemsCount: $itemsCount)';
}


}

/// @nodoc
abstract mixin class $UserDetailsCopyWith<$Res>  {
  factory $UserDetailsCopyWith(UserDetails value, $Res Function(UserDetails) _then) = _$UserDetailsCopyWithImpl;
@useResult
$Res call({
 String id, String name, String email, String? phone,@JsonKey(name: 'email_verified_at') DateTime? emailVerifiedAt,@JsonKey(name: 'paid_seller') int? paidSeller,@JsonKey(name: 'deleted_at') DateTime? deletedAt,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt,@JsonKey(name: 'country_id') int? countryId,@JsonKey(name: 'state_id') int? stateId,@JsonKey(name: 'profile_photo') String? profilePhoto,@JsonKey(name: 'uploads_left') int? uploadsLeft,@JsonKey(name: 'active_status') int? activeStatus, String? avatar,@JsonKey(name: 'dark_mode') int? darkMode,@JsonKey(name: 'messenger_color') String? messengerColor,@JsonKey(name: 'items_count') int? itemsCount
});




}
/// @nodoc
class _$UserDetailsCopyWithImpl<$Res>
    implements $UserDetailsCopyWith<$Res> {
  _$UserDetailsCopyWithImpl(this._self, this._then);

  final UserDetails _self;
  final $Res Function(UserDetails) _then;

/// Create a copy of UserDetails
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? email = null,Object? phone = freezed,Object? emailVerifiedAt = freezed,Object? paidSeller = freezed,Object? deletedAt = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? countryId = freezed,Object? stateId = freezed,Object? profilePhoto = freezed,Object? uploadsLeft = freezed,Object? activeStatus = freezed,Object? avatar = freezed,Object? darkMode = freezed,Object? messengerColor = freezed,Object? itemsCount = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,emailVerifiedAt: freezed == emailVerifiedAt ? _self.emailVerifiedAt : emailVerifiedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,paidSeller: freezed == paidSeller ? _self.paidSeller : paidSeller // ignore: cast_nullable_to_non_nullable
as int?,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,countryId: freezed == countryId ? _self.countryId : countryId // ignore: cast_nullable_to_non_nullable
as int?,stateId: freezed == stateId ? _self.stateId : stateId // ignore: cast_nullable_to_non_nullable
as int?,profilePhoto: freezed == profilePhoto ? _self.profilePhoto : profilePhoto // ignore: cast_nullable_to_non_nullable
as String?,uploadsLeft: freezed == uploadsLeft ? _self.uploadsLeft : uploadsLeft // ignore: cast_nullable_to_non_nullable
as int?,activeStatus: freezed == activeStatus ? _self.activeStatus : activeStatus // ignore: cast_nullable_to_non_nullable
as int?,avatar: freezed == avatar ? _self.avatar : avatar // ignore: cast_nullable_to_non_nullable
as String?,darkMode: freezed == darkMode ? _self.darkMode : darkMode // ignore: cast_nullable_to_non_nullable
as int?,messengerColor: freezed == messengerColor ? _self.messengerColor : messengerColor // ignore: cast_nullable_to_non_nullable
as String?,itemsCount: freezed == itemsCount ? _self.itemsCount : itemsCount // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [UserDetails].
extension UserDetailsPatterns on UserDetails {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserDetails value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserDetails() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserDetails value)  $default,){
final _that = this;
switch (_that) {
case _UserDetails():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserDetails value)?  $default,){
final _that = this;
switch (_that) {
case _UserDetails() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String email,  String? phone, @JsonKey(name: 'email_verified_at')  DateTime? emailVerifiedAt, @JsonKey(name: 'paid_seller')  int? paidSeller, @JsonKey(name: 'deleted_at')  DateTime? deletedAt, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt, @JsonKey(name: 'country_id')  int? countryId, @JsonKey(name: 'state_id')  int? stateId, @JsonKey(name: 'profile_photo')  String? profilePhoto, @JsonKey(name: 'uploads_left')  int? uploadsLeft, @JsonKey(name: 'active_status')  int? activeStatus,  String? avatar, @JsonKey(name: 'dark_mode')  int? darkMode, @JsonKey(name: 'messenger_color')  String? messengerColor, @JsonKey(name: 'items_count')  int? itemsCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserDetails() when $default != null:
return $default(_that.id,_that.name,_that.email,_that.phone,_that.emailVerifiedAt,_that.paidSeller,_that.deletedAt,_that.createdAt,_that.updatedAt,_that.countryId,_that.stateId,_that.profilePhoto,_that.uploadsLeft,_that.activeStatus,_that.avatar,_that.darkMode,_that.messengerColor,_that.itemsCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String email,  String? phone, @JsonKey(name: 'email_verified_at')  DateTime? emailVerifiedAt, @JsonKey(name: 'paid_seller')  int? paidSeller, @JsonKey(name: 'deleted_at')  DateTime? deletedAt, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt, @JsonKey(name: 'country_id')  int? countryId, @JsonKey(name: 'state_id')  int? stateId, @JsonKey(name: 'profile_photo')  String? profilePhoto, @JsonKey(name: 'uploads_left')  int? uploadsLeft, @JsonKey(name: 'active_status')  int? activeStatus,  String? avatar, @JsonKey(name: 'dark_mode')  int? darkMode, @JsonKey(name: 'messenger_color')  String? messengerColor, @JsonKey(name: 'items_count')  int? itemsCount)  $default,) {final _that = this;
switch (_that) {
case _UserDetails():
return $default(_that.id,_that.name,_that.email,_that.phone,_that.emailVerifiedAt,_that.paidSeller,_that.deletedAt,_that.createdAt,_that.updatedAt,_that.countryId,_that.stateId,_that.profilePhoto,_that.uploadsLeft,_that.activeStatus,_that.avatar,_that.darkMode,_that.messengerColor,_that.itemsCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String email,  String? phone, @JsonKey(name: 'email_verified_at')  DateTime? emailVerifiedAt, @JsonKey(name: 'paid_seller')  int? paidSeller, @JsonKey(name: 'deleted_at')  DateTime? deletedAt, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt, @JsonKey(name: 'country_id')  int? countryId, @JsonKey(name: 'state_id')  int? stateId, @JsonKey(name: 'profile_photo')  String? profilePhoto, @JsonKey(name: 'uploads_left')  int? uploadsLeft, @JsonKey(name: 'active_status')  int? activeStatus,  String? avatar, @JsonKey(name: 'dark_mode')  int? darkMode, @JsonKey(name: 'messenger_color')  String? messengerColor, @JsonKey(name: 'items_count')  int? itemsCount)?  $default,) {final _that = this;
switch (_that) {
case _UserDetails() when $default != null:
return $default(_that.id,_that.name,_that.email,_that.phone,_that.emailVerifiedAt,_that.paidSeller,_that.deletedAt,_that.createdAt,_that.updatedAt,_that.countryId,_that.stateId,_that.profilePhoto,_that.uploadsLeft,_that.activeStatus,_that.avatar,_that.darkMode,_that.messengerColor,_that.itemsCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserDetails with DiagnosticableTreeMixin implements UserDetails {
  const _UserDetails({required this.id, required this.name, required this.email, this.phone, @JsonKey(name: 'email_verified_at') this.emailVerifiedAt, @JsonKey(name: 'paid_seller') this.paidSeller, @JsonKey(name: 'deleted_at') this.deletedAt, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt, @JsonKey(name: 'country_id') this.countryId, @JsonKey(name: 'state_id') this.stateId, @JsonKey(name: 'profile_photo') this.profilePhoto, @JsonKey(name: 'uploads_left') this.uploadsLeft, @JsonKey(name: 'active_status') this.activeStatus, this.avatar, @JsonKey(name: 'dark_mode') this.darkMode, @JsonKey(name: 'messenger_color') this.messengerColor, @JsonKey(name: 'items_count') this.itemsCount});
  factory _UserDetails.fromJson(Map<String, dynamic> json) => _$UserDetailsFromJson(json);

@override final  String id;
@override final  String name;
@override final  String email;
@override final  String? phone;
@override@JsonKey(name: 'email_verified_at') final  DateTime? emailVerifiedAt;
@override@JsonKey(name: 'paid_seller') final  int? paidSeller;
@override@JsonKey(name: 'deleted_at') final  DateTime? deletedAt;
@override@JsonKey(name: 'created_at') final  DateTime? createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime? updatedAt;
@override@JsonKey(name: 'country_id') final  int? countryId;
@override@JsonKey(name: 'state_id') final  int? stateId;
@override@JsonKey(name: 'profile_photo') final  String? profilePhoto;
@override@JsonKey(name: 'uploads_left') final  int? uploadsLeft;
@override@JsonKey(name: 'active_status') final  int? activeStatus;
@override final  String? avatar;
@override@JsonKey(name: 'dark_mode') final  int? darkMode;
@override@JsonKey(name: 'messenger_color') final  String? messengerColor;
// ADD THIS FIELD:
@override@JsonKey(name: 'items_count') final  int? itemsCount;

/// Create a copy of UserDetails
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserDetailsCopyWith<_UserDetails> get copyWith => __$UserDetailsCopyWithImpl<_UserDetails>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserDetailsToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'UserDetails'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('name', name))..add(DiagnosticsProperty('email', email))..add(DiagnosticsProperty('phone', phone))..add(DiagnosticsProperty('emailVerifiedAt', emailVerifiedAt))..add(DiagnosticsProperty('paidSeller', paidSeller))..add(DiagnosticsProperty('deletedAt', deletedAt))..add(DiagnosticsProperty('createdAt', createdAt))..add(DiagnosticsProperty('updatedAt', updatedAt))..add(DiagnosticsProperty('countryId', countryId))..add(DiagnosticsProperty('stateId', stateId))..add(DiagnosticsProperty('profilePhoto', profilePhoto))..add(DiagnosticsProperty('uploadsLeft', uploadsLeft))..add(DiagnosticsProperty('activeStatus', activeStatus))..add(DiagnosticsProperty('avatar', avatar))..add(DiagnosticsProperty('darkMode', darkMode))..add(DiagnosticsProperty('messengerColor', messengerColor))..add(DiagnosticsProperty('itemsCount', itemsCount));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserDetails&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.emailVerifiedAt, emailVerifiedAt) || other.emailVerifiedAt == emailVerifiedAt)&&(identical(other.paidSeller, paidSeller) || other.paidSeller == paidSeller)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.countryId, countryId) || other.countryId == countryId)&&(identical(other.stateId, stateId) || other.stateId == stateId)&&(identical(other.profilePhoto, profilePhoto) || other.profilePhoto == profilePhoto)&&(identical(other.uploadsLeft, uploadsLeft) || other.uploadsLeft == uploadsLeft)&&(identical(other.activeStatus, activeStatus) || other.activeStatus == activeStatus)&&(identical(other.avatar, avatar) || other.avatar == avatar)&&(identical(other.darkMode, darkMode) || other.darkMode == darkMode)&&(identical(other.messengerColor, messengerColor) || other.messengerColor == messengerColor)&&(identical(other.itemsCount, itemsCount) || other.itemsCount == itemsCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,email,phone,emailVerifiedAt,paidSeller,deletedAt,createdAt,updatedAt,countryId,stateId,profilePhoto,uploadsLeft,activeStatus,avatar,darkMode,messengerColor,itemsCount);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'UserDetails(id: $id, name: $name, email: $email, phone: $phone, emailVerifiedAt: $emailVerifiedAt, paidSeller: $paidSeller, deletedAt: $deletedAt, createdAt: $createdAt, updatedAt: $updatedAt, countryId: $countryId, stateId: $stateId, profilePhoto: $profilePhoto, uploadsLeft: $uploadsLeft, activeStatus: $activeStatus, avatar: $avatar, darkMode: $darkMode, messengerColor: $messengerColor, itemsCount: $itemsCount)';
}


}

/// @nodoc
abstract mixin class _$UserDetailsCopyWith<$Res> implements $UserDetailsCopyWith<$Res> {
  factory _$UserDetailsCopyWith(_UserDetails value, $Res Function(_UserDetails) _then) = __$UserDetailsCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String email, String? phone,@JsonKey(name: 'email_verified_at') DateTime? emailVerifiedAt,@JsonKey(name: 'paid_seller') int? paidSeller,@JsonKey(name: 'deleted_at') DateTime? deletedAt,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt,@JsonKey(name: 'country_id') int? countryId,@JsonKey(name: 'state_id') int? stateId,@JsonKey(name: 'profile_photo') String? profilePhoto,@JsonKey(name: 'uploads_left') int? uploadsLeft,@JsonKey(name: 'active_status') int? activeStatus, String? avatar,@JsonKey(name: 'dark_mode') int? darkMode,@JsonKey(name: 'messenger_color') String? messengerColor,@JsonKey(name: 'items_count') int? itemsCount
});




}
/// @nodoc
class __$UserDetailsCopyWithImpl<$Res>
    implements _$UserDetailsCopyWith<$Res> {
  __$UserDetailsCopyWithImpl(this._self, this._then);

  final _UserDetails _self;
  final $Res Function(_UserDetails) _then;

/// Create a copy of UserDetails
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? email = null,Object? phone = freezed,Object? emailVerifiedAt = freezed,Object? paidSeller = freezed,Object? deletedAt = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? countryId = freezed,Object? stateId = freezed,Object? profilePhoto = freezed,Object? uploadsLeft = freezed,Object? activeStatus = freezed,Object? avatar = freezed,Object? darkMode = freezed,Object? messengerColor = freezed,Object? itemsCount = freezed,}) {
  return _then(_UserDetails(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,emailVerifiedAt: freezed == emailVerifiedAt ? _self.emailVerifiedAt : emailVerifiedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,paidSeller: freezed == paidSeller ? _self.paidSeller : paidSeller // ignore: cast_nullable_to_non_nullable
as int?,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,countryId: freezed == countryId ? _self.countryId : countryId // ignore: cast_nullable_to_non_nullable
as int?,stateId: freezed == stateId ? _self.stateId : stateId // ignore: cast_nullable_to_non_nullable
as int?,profilePhoto: freezed == profilePhoto ? _self.profilePhoto : profilePhoto // ignore: cast_nullable_to_non_nullable
as String?,uploadsLeft: freezed == uploadsLeft ? _self.uploadsLeft : uploadsLeft // ignore: cast_nullable_to_non_nullable
as int?,activeStatus: freezed == activeStatus ? _self.activeStatus : activeStatus // ignore: cast_nullable_to_non_nullable
as int?,avatar: freezed == avatar ? _self.avatar : avatar // ignore: cast_nullable_to_non_nullable
as String?,darkMode: freezed == darkMode ? _self.darkMode : darkMode // ignore: cast_nullable_to_non_nullable
as int?,messengerColor: freezed == messengerColor ? _self.messengerColor : messengerColor // ignore: cast_nullable_to_non_nullable
as String?,itemsCount: freezed == itemsCount ? _self.itemsCount : itemsCount // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
