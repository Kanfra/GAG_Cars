// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'itemsModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$User implements DiagnosticableTreeMixin {

 String get id; String get name; String get email; String? get phone;@JsonKey(name: 'email_verified_at') DateTime? get emailVerifiedAt;@JsonKey(name: 'paid_seller') int? get paidSeller;@JsonKey(name: 'deleted_at') DateTime? get deletedAt;@JsonKey(name: 'created_at') DateTime? get createdAt;@JsonKey(name: 'updated_at') DateTime? get updatedAt;@JsonKey(name: 'country_id') int? get countryId;@JsonKey(name: 'state_id') int? get stateId;@JsonKey(name: 'profile_photo') String? get profilePhoto;
/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserCopyWith<User> get copyWith => _$UserCopyWithImpl<User>(this as User, _$identity);

  /// Serializes this User to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'User'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('name', name))..add(DiagnosticsProperty('email', email))..add(DiagnosticsProperty('phone', phone))..add(DiagnosticsProperty('emailVerifiedAt', emailVerifiedAt))..add(DiagnosticsProperty('paidSeller', paidSeller))..add(DiagnosticsProperty('deletedAt', deletedAt))..add(DiagnosticsProperty('createdAt', createdAt))..add(DiagnosticsProperty('updatedAt', updatedAt))..add(DiagnosticsProperty('countryId', countryId))..add(DiagnosticsProperty('stateId', stateId))..add(DiagnosticsProperty('profilePhoto', profilePhoto));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is User&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.emailVerifiedAt, emailVerifiedAt) || other.emailVerifiedAt == emailVerifiedAt)&&(identical(other.paidSeller, paidSeller) || other.paidSeller == paidSeller)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.countryId, countryId) || other.countryId == countryId)&&(identical(other.stateId, stateId) || other.stateId == stateId)&&(identical(other.profilePhoto, profilePhoto) || other.profilePhoto == profilePhoto));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,email,phone,emailVerifiedAt,paidSeller,deletedAt,createdAt,updatedAt,countryId,stateId,profilePhoto);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'User(id: $id, name: $name, email: $email, phone: $phone, emailVerifiedAt: $emailVerifiedAt, paidSeller: $paidSeller, deletedAt: $deletedAt, createdAt: $createdAt, updatedAt: $updatedAt, countryId: $countryId, stateId: $stateId, profilePhoto: $profilePhoto)';
}


}

/// @nodoc
abstract mixin class $UserCopyWith<$Res>  {
  factory $UserCopyWith(User value, $Res Function(User) _then) = _$UserCopyWithImpl;
@useResult
$Res call({
 String id, String name, String email, String? phone,@JsonKey(name: 'email_verified_at') DateTime? emailVerifiedAt,@JsonKey(name: 'paid_seller') int? paidSeller,@JsonKey(name: 'deleted_at') DateTime? deletedAt,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt,@JsonKey(name: 'country_id') int? countryId,@JsonKey(name: 'state_id') int? stateId,@JsonKey(name: 'profile_photo') String? profilePhoto
});




}
/// @nodoc
class _$UserCopyWithImpl<$Res>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._self, this._then);

  final User _self;
  final $Res Function(User) _then;

/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? email = null,Object? phone = freezed,Object? emailVerifiedAt = freezed,Object? paidSeller = freezed,Object? deletedAt = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? countryId = freezed,Object? stateId = freezed,Object? profilePhoto = freezed,}) {
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
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [User].
extension UserPatterns on User {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _User value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _User() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _User value)  $default,){
final _that = this;
switch (_that) {
case _User():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _User value)?  $default,){
final _that = this;
switch (_that) {
case _User() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String email,  String? phone, @JsonKey(name: 'email_verified_at')  DateTime? emailVerifiedAt, @JsonKey(name: 'paid_seller')  int? paidSeller, @JsonKey(name: 'deleted_at')  DateTime? deletedAt, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt, @JsonKey(name: 'country_id')  int? countryId, @JsonKey(name: 'state_id')  int? stateId, @JsonKey(name: 'profile_photo')  String? profilePhoto)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _User() when $default != null:
return $default(_that.id,_that.name,_that.email,_that.phone,_that.emailVerifiedAt,_that.paidSeller,_that.deletedAt,_that.createdAt,_that.updatedAt,_that.countryId,_that.stateId,_that.profilePhoto);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String email,  String? phone, @JsonKey(name: 'email_verified_at')  DateTime? emailVerifiedAt, @JsonKey(name: 'paid_seller')  int? paidSeller, @JsonKey(name: 'deleted_at')  DateTime? deletedAt, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt, @JsonKey(name: 'country_id')  int? countryId, @JsonKey(name: 'state_id')  int? stateId, @JsonKey(name: 'profile_photo')  String? profilePhoto)  $default,) {final _that = this;
switch (_that) {
case _User():
return $default(_that.id,_that.name,_that.email,_that.phone,_that.emailVerifiedAt,_that.paidSeller,_that.deletedAt,_that.createdAt,_that.updatedAt,_that.countryId,_that.stateId,_that.profilePhoto);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String email,  String? phone, @JsonKey(name: 'email_verified_at')  DateTime? emailVerifiedAt, @JsonKey(name: 'paid_seller')  int? paidSeller, @JsonKey(name: 'deleted_at')  DateTime? deletedAt, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt, @JsonKey(name: 'country_id')  int? countryId, @JsonKey(name: 'state_id')  int? stateId, @JsonKey(name: 'profile_photo')  String? profilePhoto)?  $default,) {final _that = this;
switch (_that) {
case _User() when $default != null:
return $default(_that.id,_that.name,_that.email,_that.phone,_that.emailVerifiedAt,_that.paidSeller,_that.deletedAt,_that.createdAt,_that.updatedAt,_that.countryId,_that.stateId,_that.profilePhoto);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _User with DiagnosticableTreeMixin implements User {
  const _User({required this.id, required this.name, required this.email, this.phone, @JsonKey(name: 'email_verified_at') this.emailVerifiedAt, @JsonKey(name: 'paid_seller') this.paidSeller, @JsonKey(name: 'deleted_at') this.deletedAt, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt, @JsonKey(name: 'country_id') this.countryId, @JsonKey(name: 'state_id') this.stateId, @JsonKey(name: 'profile_photo') this.profilePhoto});
  factory _User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

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

/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserCopyWith<_User> get copyWith => __$UserCopyWithImpl<_User>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'User'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('name', name))..add(DiagnosticsProperty('email', email))..add(DiagnosticsProperty('phone', phone))..add(DiagnosticsProperty('emailVerifiedAt', emailVerifiedAt))..add(DiagnosticsProperty('paidSeller', paidSeller))..add(DiagnosticsProperty('deletedAt', deletedAt))..add(DiagnosticsProperty('createdAt', createdAt))..add(DiagnosticsProperty('updatedAt', updatedAt))..add(DiagnosticsProperty('countryId', countryId))..add(DiagnosticsProperty('stateId', stateId))..add(DiagnosticsProperty('profilePhoto', profilePhoto));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _User&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.emailVerifiedAt, emailVerifiedAt) || other.emailVerifiedAt == emailVerifiedAt)&&(identical(other.paidSeller, paidSeller) || other.paidSeller == paidSeller)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.countryId, countryId) || other.countryId == countryId)&&(identical(other.stateId, stateId) || other.stateId == stateId)&&(identical(other.profilePhoto, profilePhoto) || other.profilePhoto == profilePhoto));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,email,phone,emailVerifiedAt,paidSeller,deletedAt,createdAt,updatedAt,countryId,stateId,profilePhoto);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'User(id: $id, name: $name, email: $email, phone: $phone, emailVerifiedAt: $emailVerifiedAt, paidSeller: $paidSeller, deletedAt: $deletedAt, createdAt: $createdAt, updatedAt: $updatedAt, countryId: $countryId, stateId: $stateId, profilePhoto: $profilePhoto)';
}


}

/// @nodoc
abstract mixin class _$UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$UserCopyWith(_User value, $Res Function(_User) _then) = __$UserCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String email, String? phone,@JsonKey(name: 'email_verified_at') DateTime? emailVerifiedAt,@JsonKey(name: 'paid_seller') int? paidSeller,@JsonKey(name: 'deleted_at') DateTime? deletedAt,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt,@JsonKey(name: 'country_id') int? countryId,@JsonKey(name: 'state_id') int? stateId,@JsonKey(name: 'profile_photo') String? profilePhoto
});




}
/// @nodoc
class __$UserCopyWithImpl<$Res>
    implements _$UserCopyWith<$Res> {
  __$UserCopyWithImpl(this._self, this._then);

  final _User _self;
  final $Res Function(_User) _then;

/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? email = null,Object? phone = freezed,Object? emailVerifiedAt = freezed,Object? paidSeller = freezed,Object? deletedAt = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? countryId = freezed,Object? stateId = freezed,Object? profilePhoto = freezed,}) {
  return _then(_User(
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
as String?,
  ));
}


}


/// @nodoc
mixin _$Brand implements DiagnosticableTreeMixin {

 int get id;@JsonKey(name: 'user_id') String? get userId; String get name; String get slug; String? get image;@JsonKey(name: 'created_at') DateTime? get createdAt;@JsonKey(name: 'updated_at') DateTime? get updatedAt;
/// Create a copy of Brand
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BrandCopyWith<Brand> get copyWith => _$BrandCopyWithImpl<Brand>(this as Brand, _$identity);

  /// Serializes this Brand to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'Brand'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('userId', userId))..add(DiagnosticsProperty('name', name))..add(DiagnosticsProperty('slug', slug))..add(DiagnosticsProperty('image', image))..add(DiagnosticsProperty('createdAt', createdAt))..add(DiagnosticsProperty('updatedAt', updatedAt));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Brand&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.image, image) || other.image == image)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,name,slug,image,createdAt,updatedAt);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'Brand(id: $id, userId: $userId, name: $name, slug: $slug, image: $image, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $BrandCopyWith<$Res>  {
  factory $BrandCopyWith(Brand value, $Res Function(Brand) _then) = _$BrandCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'user_id') String? userId, String name, String slug, String? image,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt
});




}
/// @nodoc
class _$BrandCopyWithImpl<$Res>
    implements $BrandCopyWith<$Res> {
  _$BrandCopyWithImpl(this._self, this._then);

  final Brand _self;
  final $Res Function(Brand) _then;

/// Create a copy of Brand
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = freezed,Object? name = null,Object? slug = null,Object? image = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [Brand].
extension BrandPatterns on Brand {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Brand value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Brand() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Brand value)  $default,){
final _that = this;
switch (_that) {
case _Brand():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Brand value)?  $default,){
final _that = this;
switch (_that) {
case _Brand() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'user_id')  String? userId,  String name,  String slug,  String? image, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Brand() when $default != null:
return $default(_that.id,_that.userId,_that.name,_that.slug,_that.image,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'user_id')  String? userId,  String name,  String slug,  String? image, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _Brand():
return $default(_that.id,_that.userId,_that.name,_that.slug,_that.image,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'user_id')  String? userId,  String name,  String slug,  String? image, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _Brand() when $default != null:
return $default(_that.id,_that.userId,_that.name,_that.slug,_that.image,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Brand with DiagnosticableTreeMixin implements Brand {
  const _Brand({required this.id, @JsonKey(name: 'user_id') this.userId, required this.name, required this.slug, this.image, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt});
  factory _Brand.fromJson(Map<String, dynamic> json) => _$BrandFromJson(json);

@override final  int id;
@override@JsonKey(name: 'user_id') final  String? userId;
@override final  String name;
@override final  String slug;
@override final  String? image;
@override@JsonKey(name: 'created_at') final  DateTime? createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime? updatedAt;

/// Create a copy of Brand
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BrandCopyWith<_Brand> get copyWith => __$BrandCopyWithImpl<_Brand>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BrandToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'Brand'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('userId', userId))..add(DiagnosticsProperty('name', name))..add(DiagnosticsProperty('slug', slug))..add(DiagnosticsProperty('image', image))..add(DiagnosticsProperty('createdAt', createdAt))..add(DiagnosticsProperty('updatedAt', updatedAt));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Brand&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.image, image) || other.image == image)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,name,slug,image,createdAt,updatedAt);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'Brand(id: $id, userId: $userId, name: $name, slug: $slug, image: $image, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$BrandCopyWith<$Res> implements $BrandCopyWith<$Res> {
  factory _$BrandCopyWith(_Brand value, $Res Function(_Brand) _then) = __$BrandCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'user_id') String? userId, String name, String slug, String? image,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt
});




}
/// @nodoc
class __$BrandCopyWithImpl<$Res>
    implements _$BrandCopyWith<$Res> {
  __$BrandCopyWithImpl(this._self, this._then);

  final _Brand _self;
  final $Res Function(_Brand) _then;

/// Create a copy of Brand
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = freezed,Object? name = null,Object? slug = null,Object? image = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_Brand(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$BrandModel implements DiagnosticableTreeMixin {

 int get id;@JsonKey(name: 'brand_id') int get brandId; String get name; String get slug;@JsonKey(name: 'created_at') DateTime? get createdAt;@JsonKey(name: 'updated_at') DateTime? get updatedAt;
/// Create a copy of BrandModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BrandModelCopyWith<BrandModel> get copyWith => _$BrandModelCopyWithImpl<BrandModel>(this as BrandModel, _$identity);

  /// Serializes this BrandModel to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'BrandModel'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('brandId', brandId))..add(DiagnosticsProperty('name', name))..add(DiagnosticsProperty('slug', slug))..add(DiagnosticsProperty('createdAt', createdAt))..add(DiagnosticsProperty('updatedAt', updatedAt));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BrandModel&&(identical(other.id, id) || other.id == id)&&(identical(other.brandId, brandId) || other.brandId == brandId)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,brandId,name,slug,createdAt,updatedAt);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'BrandModel(id: $id, brandId: $brandId, name: $name, slug: $slug, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $BrandModelCopyWith<$Res>  {
  factory $BrandModelCopyWith(BrandModel value, $Res Function(BrandModel) _then) = _$BrandModelCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'brand_id') int brandId, String name, String slug,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt
});




}
/// @nodoc
class _$BrandModelCopyWithImpl<$Res>
    implements $BrandModelCopyWith<$Res> {
  _$BrandModelCopyWithImpl(this._self, this._then);

  final BrandModel _self;
  final $Res Function(BrandModel) _then;

/// Create a copy of BrandModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? brandId = null,Object? name = null,Object? slug = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,brandId: null == brandId ? _self.brandId : brandId // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [BrandModel].
extension BrandModelPatterns on BrandModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BrandModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BrandModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BrandModel value)  $default,){
final _that = this;
switch (_that) {
case _BrandModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BrandModel value)?  $default,){
final _that = this;
switch (_that) {
case _BrandModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'brand_id')  int brandId,  String name,  String slug, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BrandModel() when $default != null:
return $default(_that.id,_that.brandId,_that.name,_that.slug,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'brand_id')  int brandId,  String name,  String slug, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _BrandModel():
return $default(_that.id,_that.brandId,_that.name,_that.slug,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'brand_id')  int brandId,  String name,  String slug, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _BrandModel() when $default != null:
return $default(_that.id,_that.brandId,_that.name,_that.slug,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BrandModel with DiagnosticableTreeMixin implements BrandModel {
  const _BrandModel({required this.id, @JsonKey(name: 'brand_id') required this.brandId, required this.name, required this.slug, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt});
  factory _BrandModel.fromJson(Map<String, dynamic> json) => _$BrandModelFromJson(json);

@override final  int id;
@override@JsonKey(name: 'brand_id') final  int brandId;
@override final  String name;
@override final  String slug;
@override@JsonKey(name: 'created_at') final  DateTime? createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime? updatedAt;

/// Create a copy of BrandModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BrandModelCopyWith<_BrandModel> get copyWith => __$BrandModelCopyWithImpl<_BrandModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BrandModelToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'BrandModel'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('brandId', brandId))..add(DiagnosticsProperty('name', name))..add(DiagnosticsProperty('slug', slug))..add(DiagnosticsProperty('createdAt', createdAt))..add(DiagnosticsProperty('updatedAt', updatedAt));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BrandModel&&(identical(other.id, id) || other.id == id)&&(identical(other.brandId, brandId) || other.brandId == brandId)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,brandId,name,slug,createdAt,updatedAt);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'BrandModel(id: $id, brandId: $brandId, name: $name, slug: $slug, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$BrandModelCopyWith<$Res> implements $BrandModelCopyWith<$Res> {
  factory _$BrandModelCopyWith(_BrandModel value, $Res Function(_BrandModel) _then) = __$BrandModelCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'brand_id') int brandId, String name, String slug,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt
});




}
/// @nodoc
class __$BrandModelCopyWithImpl<$Res>
    implements _$BrandModelCopyWith<$Res> {
  __$BrandModelCopyWithImpl(this._self, this._then);

  final _BrandModel _self;
  final $Res Function(_BrandModel) _then;

/// Create a copy of BrandModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? brandId = null,Object? name = null,Object? slug = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_BrandModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,brandId: null == brandId ? _self.brandId : brandId // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$Category implements DiagnosticableTreeMixin {

 int get id;@JsonKey(name: 'user_id') String? get userId;@JsonKey(name: 'parent_id') int? get parentId; String get name; String get slug; String? get description; List<String>? get features; String? get image;@JsonKey(name: 'created_at') DateTime? get createdAt;@JsonKey(name: 'updated_at') DateTime? get updatedAt;
/// Create a copy of Category
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategoryCopyWith<Category> get copyWith => _$CategoryCopyWithImpl<Category>(this as Category, _$identity);

  /// Serializes this Category to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'Category'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('userId', userId))..add(DiagnosticsProperty('parentId', parentId))..add(DiagnosticsProperty('name', name))..add(DiagnosticsProperty('slug', slug))..add(DiagnosticsProperty('description', description))..add(DiagnosticsProperty('features', features))..add(DiagnosticsProperty('image', image))..add(DiagnosticsProperty('createdAt', createdAt))..add(DiagnosticsProperty('updatedAt', updatedAt));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Category&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.parentId, parentId) || other.parentId == parentId)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.features, features)&&(identical(other.image, image) || other.image == image)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,parentId,name,slug,description,const DeepCollectionEquality().hash(features),image,createdAt,updatedAt);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'Category(id: $id, userId: $userId, parentId: $parentId, name: $name, slug: $slug, description: $description, features: $features, image: $image, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $CategoryCopyWith<$Res>  {
  factory $CategoryCopyWith(Category value, $Res Function(Category) _then) = _$CategoryCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'user_id') String? userId,@JsonKey(name: 'parent_id') int? parentId, String name, String slug, String? description, List<String>? features, String? image,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt
});




}
/// @nodoc
class _$CategoryCopyWithImpl<$Res>
    implements $CategoryCopyWith<$Res> {
  _$CategoryCopyWithImpl(this._self, this._then);

  final Category _self;
  final $Res Function(Category) _then;

/// Create a copy of Category
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = freezed,Object? parentId = freezed,Object? name = null,Object? slug = null,Object? description = freezed,Object? features = freezed,Object? image = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,parentId: freezed == parentId ? _self.parentId : parentId // ignore: cast_nullable_to_non_nullable
as int?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,features: freezed == features ? _self.features : features // ignore: cast_nullable_to_non_nullable
as List<String>?,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [Category].
extension CategoryPatterns on Category {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Category value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Category() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Category value)  $default,){
final _that = this;
switch (_that) {
case _Category():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Category value)?  $default,){
final _that = this;
switch (_that) {
case _Category() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'user_id')  String? userId, @JsonKey(name: 'parent_id')  int? parentId,  String name,  String slug,  String? description,  List<String>? features,  String? image, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Category() when $default != null:
return $default(_that.id,_that.userId,_that.parentId,_that.name,_that.slug,_that.description,_that.features,_that.image,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'user_id')  String? userId, @JsonKey(name: 'parent_id')  int? parentId,  String name,  String slug,  String? description,  List<String>? features,  String? image, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _Category():
return $default(_that.id,_that.userId,_that.parentId,_that.name,_that.slug,_that.description,_that.features,_that.image,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'user_id')  String? userId, @JsonKey(name: 'parent_id')  int? parentId,  String name,  String slug,  String? description,  List<String>? features,  String? image, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _Category() when $default != null:
return $default(_that.id,_that.userId,_that.parentId,_that.name,_that.slug,_that.description,_that.features,_that.image,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Category with DiagnosticableTreeMixin implements Category {
  const _Category({required this.id, @JsonKey(name: 'user_id') this.userId, @JsonKey(name: 'parent_id') this.parentId, required this.name, required this.slug, this.description, final  List<String>? features, this.image, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt}): _features = features;
  factory _Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);

@override final  int id;
@override@JsonKey(name: 'user_id') final  String? userId;
@override@JsonKey(name: 'parent_id') final  int? parentId;
@override final  String name;
@override final  String slug;
@override final  String? description;
 final  List<String>? _features;
@override List<String>? get features {
  final value = _features;
  if (value == null) return null;
  if (_features is EqualUnmodifiableListView) return _features;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  String? image;
@override@JsonKey(name: 'created_at') final  DateTime? createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime? updatedAt;

/// Create a copy of Category
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CategoryCopyWith<_Category> get copyWith => __$CategoryCopyWithImpl<_Category>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CategoryToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'Category'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('userId', userId))..add(DiagnosticsProperty('parentId', parentId))..add(DiagnosticsProperty('name', name))..add(DiagnosticsProperty('slug', slug))..add(DiagnosticsProperty('description', description))..add(DiagnosticsProperty('features', features))..add(DiagnosticsProperty('image', image))..add(DiagnosticsProperty('createdAt', createdAt))..add(DiagnosticsProperty('updatedAt', updatedAt));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Category&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.parentId, parentId) || other.parentId == parentId)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._features, _features)&&(identical(other.image, image) || other.image == image)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,parentId,name,slug,description,const DeepCollectionEquality().hash(_features),image,createdAt,updatedAt);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'Category(id: $id, userId: $userId, parentId: $parentId, name: $name, slug: $slug, description: $description, features: $features, image: $image, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$CategoryCopyWith<$Res> implements $CategoryCopyWith<$Res> {
  factory _$CategoryCopyWith(_Category value, $Res Function(_Category) _then) = __$CategoryCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'user_id') String? userId,@JsonKey(name: 'parent_id') int? parentId, String name, String slug, String? description, List<String>? features, String? image,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt
});




}
/// @nodoc
class __$CategoryCopyWithImpl<$Res>
    implements _$CategoryCopyWith<$Res> {
  __$CategoryCopyWithImpl(this._self, this._then);

  final _Category _self;
  final $Res Function(_Category) _then;

/// Create a copy of Category
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = freezed,Object? parentId = freezed,Object? name = null,Object? slug = null,Object? description = freezed,Object? features = freezed,Object? image = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_Category(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,parentId: freezed == parentId ? _self.parentId : parentId // ignore: cast_nullable_to_non_nullable
as int?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,features: freezed == features ? _self._features : features // ignore: cast_nullable_to_non_nullable
as List<String>?,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$RecommendedItem implements DiagnosticableTreeMixin {

 String get id;@JsonKey(name: 'user_id') String? get userId;@JsonKey(name: 'country_id') int? get countryId;@JsonKey(name: 'brand_model_id') int? get brandModelId;@JsonKey(name: 'brand_id') int? get brandId;@JsonKey(name: 'category_id') int? get categoryId; String? get name; String? get year; String? get slug; String? get description; List<String>? get images; String? get location;@JsonKey(name: 'serial_number') String? get serialNumber; String? get condition;@JsonKey(name: 'steer_position') String? get steerPosition;@JsonKey(name: 'engine_capacity') String? get engineCapacity; String? get transmission; String? get color;@JsonKey(name: 'build_type') String? get buildType;@JsonKey(name: 'number_of_passengers') int? get numberOfPassengers; List<String>? get features; String? get status; String? get price; String? get mileage; int? get warranty;@JsonKey(name: 'warranty_expiration') DateTime? get warrantyExpiration;@JsonKey(name: 'deleted_at') DateTime? get deletedAt;@JsonKey(name: 'created_at') DateTime? get createdAt;@JsonKey(name: 'updated_at') DateTime? get updatedAt;@JsonKey(name: 'Height') String? get height;@JsonKey(name: 'VIN') String? get vin; Brand? get brand; Category? get category;@JsonKey(name: 'brand_model') BrandModel? get brandModel; User? get user;@JsonKey(name: 'is_promoted') bool? get isPromoted;
/// Create a copy of RecommendedItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecommendedItemCopyWith<RecommendedItem> get copyWith => _$RecommendedItemCopyWithImpl<RecommendedItem>(this as RecommendedItem, _$identity);

  /// Serializes this RecommendedItem to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'RecommendedItem'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('userId', userId))..add(DiagnosticsProperty('countryId', countryId))..add(DiagnosticsProperty('brandModelId', brandModelId))..add(DiagnosticsProperty('brandId', brandId))..add(DiagnosticsProperty('categoryId', categoryId))..add(DiagnosticsProperty('name', name))..add(DiagnosticsProperty('year', year))..add(DiagnosticsProperty('slug', slug))..add(DiagnosticsProperty('description', description))..add(DiagnosticsProperty('images', images))..add(DiagnosticsProperty('location', location))..add(DiagnosticsProperty('serialNumber', serialNumber))..add(DiagnosticsProperty('condition', condition))..add(DiagnosticsProperty('steerPosition', steerPosition))..add(DiagnosticsProperty('engineCapacity', engineCapacity))..add(DiagnosticsProperty('transmission', transmission))..add(DiagnosticsProperty('color', color))..add(DiagnosticsProperty('buildType', buildType))..add(DiagnosticsProperty('numberOfPassengers', numberOfPassengers))..add(DiagnosticsProperty('features', features))..add(DiagnosticsProperty('status', status))..add(DiagnosticsProperty('price', price))..add(DiagnosticsProperty('mileage', mileage))..add(DiagnosticsProperty('warranty', warranty))..add(DiagnosticsProperty('warrantyExpiration', warrantyExpiration))..add(DiagnosticsProperty('deletedAt', deletedAt))..add(DiagnosticsProperty('createdAt', createdAt))..add(DiagnosticsProperty('updatedAt', updatedAt))..add(DiagnosticsProperty('height', height))..add(DiagnosticsProperty('vin', vin))..add(DiagnosticsProperty('brand', brand))..add(DiagnosticsProperty('category', category))..add(DiagnosticsProperty('brandModel', brandModel))..add(DiagnosticsProperty('user', user))..add(DiagnosticsProperty('isPromoted', isPromoted));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RecommendedItem&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.countryId, countryId) || other.countryId == countryId)&&(identical(other.brandModelId, brandModelId) || other.brandModelId == brandModelId)&&(identical(other.brandId, brandId) || other.brandId == brandId)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.name, name) || other.name == name)&&(identical(other.year, year) || other.year == year)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.images, images)&&(identical(other.location, location) || other.location == location)&&(identical(other.serialNumber, serialNumber) || other.serialNumber == serialNumber)&&(identical(other.condition, condition) || other.condition == condition)&&(identical(other.steerPosition, steerPosition) || other.steerPosition == steerPosition)&&(identical(other.engineCapacity, engineCapacity) || other.engineCapacity == engineCapacity)&&(identical(other.transmission, transmission) || other.transmission == transmission)&&(identical(other.color, color) || other.color == color)&&(identical(other.buildType, buildType) || other.buildType == buildType)&&(identical(other.numberOfPassengers, numberOfPassengers) || other.numberOfPassengers == numberOfPassengers)&&const DeepCollectionEquality().equals(other.features, features)&&(identical(other.status, status) || other.status == status)&&(identical(other.price, price) || other.price == price)&&(identical(other.mileage, mileage) || other.mileage == mileage)&&(identical(other.warranty, warranty) || other.warranty == warranty)&&(identical(other.warrantyExpiration, warrantyExpiration) || other.warrantyExpiration == warrantyExpiration)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.height, height) || other.height == height)&&(identical(other.vin, vin) || other.vin == vin)&&(identical(other.brand, brand) || other.brand == brand)&&(identical(other.category, category) || other.category == category)&&(identical(other.brandModel, brandModel) || other.brandModel == brandModel)&&(identical(other.user, user) || other.user == user)&&(identical(other.isPromoted, isPromoted) || other.isPromoted == isPromoted));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,userId,countryId,brandModelId,brandId,categoryId,name,year,slug,description,const DeepCollectionEquality().hash(images),location,serialNumber,condition,steerPosition,engineCapacity,transmission,color,buildType,numberOfPassengers,const DeepCollectionEquality().hash(features),status,price,mileage,warranty,warrantyExpiration,deletedAt,createdAt,updatedAt,height,vin,brand,category,brandModel,user,isPromoted]);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'RecommendedItem(id: $id, userId: $userId, countryId: $countryId, brandModelId: $brandModelId, brandId: $brandId, categoryId: $categoryId, name: $name, year: $year, slug: $slug, description: $description, images: $images, location: $location, serialNumber: $serialNumber, condition: $condition, steerPosition: $steerPosition, engineCapacity: $engineCapacity, transmission: $transmission, color: $color, buildType: $buildType, numberOfPassengers: $numberOfPassengers, features: $features, status: $status, price: $price, mileage: $mileage, warranty: $warranty, warrantyExpiration: $warrantyExpiration, deletedAt: $deletedAt, createdAt: $createdAt, updatedAt: $updatedAt, height: $height, vin: $vin, brand: $brand, category: $category, brandModel: $brandModel, user: $user, isPromoted: $isPromoted)';
}


}

/// @nodoc
abstract mixin class $RecommendedItemCopyWith<$Res>  {
  factory $RecommendedItemCopyWith(RecommendedItem value, $Res Function(RecommendedItem) _then) = _$RecommendedItemCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'user_id') String? userId,@JsonKey(name: 'country_id') int? countryId,@JsonKey(name: 'brand_model_id') int? brandModelId,@JsonKey(name: 'brand_id') int? brandId,@JsonKey(name: 'category_id') int? categoryId, String? name, String? year, String? slug, String? description, List<String>? images, String? location,@JsonKey(name: 'serial_number') String? serialNumber, String? condition,@JsonKey(name: 'steer_position') String? steerPosition,@JsonKey(name: 'engine_capacity') String? engineCapacity, String? transmission, String? color,@JsonKey(name: 'build_type') String? buildType,@JsonKey(name: 'number_of_passengers') int? numberOfPassengers, List<String>? features, String? status, String? price, String? mileage, int? warranty,@JsonKey(name: 'warranty_expiration') DateTime? warrantyExpiration,@JsonKey(name: 'deleted_at') DateTime? deletedAt,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt,@JsonKey(name: 'Height') String? height,@JsonKey(name: 'VIN') String? vin, Brand? brand, Category? category,@JsonKey(name: 'brand_model') BrandModel? brandModel, User? user,@JsonKey(name: 'is_promoted') bool? isPromoted
});


$BrandCopyWith<$Res>? get brand;$CategoryCopyWith<$Res>? get category;$BrandModelCopyWith<$Res>? get brandModel;$UserCopyWith<$Res>? get user;

}
/// @nodoc
class _$RecommendedItemCopyWithImpl<$Res>
    implements $RecommendedItemCopyWith<$Res> {
  _$RecommendedItemCopyWithImpl(this._self, this._then);

  final RecommendedItem _self;
  final $Res Function(RecommendedItem) _then;

/// Create a copy of RecommendedItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = freezed,Object? countryId = freezed,Object? brandModelId = freezed,Object? brandId = freezed,Object? categoryId = freezed,Object? name = freezed,Object? year = freezed,Object? slug = freezed,Object? description = freezed,Object? images = freezed,Object? location = freezed,Object? serialNumber = freezed,Object? condition = freezed,Object? steerPosition = freezed,Object? engineCapacity = freezed,Object? transmission = freezed,Object? color = freezed,Object? buildType = freezed,Object? numberOfPassengers = freezed,Object? features = freezed,Object? status = freezed,Object? price = freezed,Object? mileage = freezed,Object? warranty = freezed,Object? warrantyExpiration = freezed,Object? deletedAt = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? height = freezed,Object? vin = freezed,Object? brand = freezed,Object? category = freezed,Object? brandModel = freezed,Object? user = freezed,Object? isPromoted = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,countryId: freezed == countryId ? _self.countryId : countryId // ignore: cast_nullable_to_non_nullable
as int?,brandModelId: freezed == brandModelId ? _self.brandModelId : brandModelId // ignore: cast_nullable_to_non_nullable
as int?,brandId: freezed == brandId ? _self.brandId : brandId // ignore: cast_nullable_to_non_nullable
as int?,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,year: freezed == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as String?,slug: freezed == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,images: freezed == images ? _self.images : images // ignore: cast_nullable_to_non_nullable
as List<String>?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,serialNumber: freezed == serialNumber ? _self.serialNumber : serialNumber // ignore: cast_nullable_to_non_nullable
as String?,condition: freezed == condition ? _self.condition : condition // ignore: cast_nullable_to_non_nullable
as String?,steerPosition: freezed == steerPosition ? _self.steerPosition : steerPosition // ignore: cast_nullable_to_non_nullable
as String?,engineCapacity: freezed == engineCapacity ? _self.engineCapacity : engineCapacity // ignore: cast_nullable_to_non_nullable
as String?,transmission: freezed == transmission ? _self.transmission : transmission // ignore: cast_nullable_to_non_nullable
as String?,color: freezed == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String?,buildType: freezed == buildType ? _self.buildType : buildType // ignore: cast_nullable_to_non_nullable
as String?,numberOfPassengers: freezed == numberOfPassengers ? _self.numberOfPassengers : numberOfPassengers // ignore: cast_nullable_to_non_nullable
as int?,features: freezed == features ? _self.features : features // ignore: cast_nullable_to_non_nullable
as List<String>?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as String?,mileage: freezed == mileage ? _self.mileage : mileage // ignore: cast_nullable_to_non_nullable
as String?,warranty: freezed == warranty ? _self.warranty : warranty // ignore: cast_nullable_to_non_nullable
as int?,warrantyExpiration: freezed == warrantyExpiration ? _self.warrantyExpiration : warrantyExpiration // ignore: cast_nullable_to_non_nullable
as DateTime?,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,height: freezed == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as String?,vin: freezed == vin ? _self.vin : vin // ignore: cast_nullable_to_non_nullable
as String?,brand: freezed == brand ? _self.brand : brand // ignore: cast_nullable_to_non_nullable
as Brand?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as Category?,brandModel: freezed == brandModel ? _self.brandModel : brandModel // ignore: cast_nullable_to_non_nullable
as BrandModel?,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User?,isPromoted: freezed == isPromoted ? _self.isPromoted : isPromoted // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}
/// Create a copy of RecommendedItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BrandCopyWith<$Res>? get brand {
    if (_self.brand == null) {
    return null;
  }

  return $BrandCopyWith<$Res>(_self.brand!, (value) {
    return _then(_self.copyWith(brand: value));
  });
}/// Create a copy of RecommendedItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategoryCopyWith<$Res>? get category {
    if (_self.category == null) {
    return null;
  }

  return $CategoryCopyWith<$Res>(_self.category!, (value) {
    return _then(_self.copyWith(category: value));
  });
}/// Create a copy of RecommendedItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BrandModelCopyWith<$Res>? get brandModel {
    if (_self.brandModel == null) {
    return null;
  }

  return $BrandModelCopyWith<$Res>(_self.brandModel!, (value) {
    return _then(_self.copyWith(brandModel: value));
  });
}/// Create a copy of RecommendedItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $UserCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// Adds pattern-matching-related methods to [RecommendedItem].
extension RecommendedItemPatterns on RecommendedItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RecommendedItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RecommendedItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RecommendedItem value)  $default,){
final _that = this;
switch (_that) {
case _RecommendedItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RecommendedItem value)?  $default,){
final _that = this;
switch (_that) {
case _RecommendedItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'user_id')  String? userId, @JsonKey(name: 'country_id')  int? countryId, @JsonKey(name: 'brand_model_id')  int? brandModelId, @JsonKey(name: 'brand_id')  int? brandId, @JsonKey(name: 'category_id')  int? categoryId,  String? name,  String? year,  String? slug,  String? description,  List<String>? images,  String? location, @JsonKey(name: 'serial_number')  String? serialNumber,  String? condition, @JsonKey(name: 'steer_position')  String? steerPosition, @JsonKey(name: 'engine_capacity')  String? engineCapacity,  String? transmission,  String? color, @JsonKey(name: 'build_type')  String? buildType, @JsonKey(name: 'number_of_passengers')  int? numberOfPassengers,  List<String>? features,  String? status,  String? price,  String? mileage,  int? warranty, @JsonKey(name: 'warranty_expiration')  DateTime? warrantyExpiration, @JsonKey(name: 'deleted_at')  DateTime? deletedAt, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt, @JsonKey(name: 'Height')  String? height, @JsonKey(name: 'VIN')  String? vin,  Brand? brand,  Category? category, @JsonKey(name: 'brand_model')  BrandModel? brandModel,  User? user, @JsonKey(name: 'is_promoted')  bool? isPromoted)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RecommendedItem() when $default != null:
return $default(_that.id,_that.userId,_that.countryId,_that.brandModelId,_that.brandId,_that.categoryId,_that.name,_that.year,_that.slug,_that.description,_that.images,_that.location,_that.serialNumber,_that.condition,_that.steerPosition,_that.engineCapacity,_that.transmission,_that.color,_that.buildType,_that.numberOfPassengers,_that.features,_that.status,_that.price,_that.mileage,_that.warranty,_that.warrantyExpiration,_that.deletedAt,_that.createdAt,_that.updatedAt,_that.height,_that.vin,_that.brand,_that.category,_that.brandModel,_that.user,_that.isPromoted);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'user_id')  String? userId, @JsonKey(name: 'country_id')  int? countryId, @JsonKey(name: 'brand_model_id')  int? brandModelId, @JsonKey(name: 'brand_id')  int? brandId, @JsonKey(name: 'category_id')  int? categoryId,  String? name,  String? year,  String? slug,  String? description,  List<String>? images,  String? location, @JsonKey(name: 'serial_number')  String? serialNumber,  String? condition, @JsonKey(name: 'steer_position')  String? steerPosition, @JsonKey(name: 'engine_capacity')  String? engineCapacity,  String? transmission,  String? color, @JsonKey(name: 'build_type')  String? buildType, @JsonKey(name: 'number_of_passengers')  int? numberOfPassengers,  List<String>? features,  String? status,  String? price,  String? mileage,  int? warranty, @JsonKey(name: 'warranty_expiration')  DateTime? warrantyExpiration, @JsonKey(name: 'deleted_at')  DateTime? deletedAt, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt, @JsonKey(name: 'Height')  String? height, @JsonKey(name: 'VIN')  String? vin,  Brand? brand,  Category? category, @JsonKey(name: 'brand_model')  BrandModel? brandModel,  User? user, @JsonKey(name: 'is_promoted')  bool? isPromoted)  $default,) {final _that = this;
switch (_that) {
case _RecommendedItem():
return $default(_that.id,_that.userId,_that.countryId,_that.brandModelId,_that.brandId,_that.categoryId,_that.name,_that.year,_that.slug,_that.description,_that.images,_that.location,_that.serialNumber,_that.condition,_that.steerPosition,_that.engineCapacity,_that.transmission,_that.color,_that.buildType,_that.numberOfPassengers,_that.features,_that.status,_that.price,_that.mileage,_that.warranty,_that.warrantyExpiration,_that.deletedAt,_that.createdAt,_that.updatedAt,_that.height,_that.vin,_that.brand,_that.category,_that.brandModel,_that.user,_that.isPromoted);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'user_id')  String? userId, @JsonKey(name: 'country_id')  int? countryId, @JsonKey(name: 'brand_model_id')  int? brandModelId, @JsonKey(name: 'brand_id')  int? brandId, @JsonKey(name: 'category_id')  int? categoryId,  String? name,  String? year,  String? slug,  String? description,  List<String>? images,  String? location, @JsonKey(name: 'serial_number')  String? serialNumber,  String? condition, @JsonKey(name: 'steer_position')  String? steerPosition, @JsonKey(name: 'engine_capacity')  String? engineCapacity,  String? transmission,  String? color, @JsonKey(name: 'build_type')  String? buildType, @JsonKey(name: 'number_of_passengers')  int? numberOfPassengers,  List<String>? features,  String? status,  String? price,  String? mileage,  int? warranty, @JsonKey(name: 'warranty_expiration')  DateTime? warrantyExpiration, @JsonKey(name: 'deleted_at')  DateTime? deletedAt, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt, @JsonKey(name: 'Height')  String? height, @JsonKey(name: 'VIN')  String? vin,  Brand? brand,  Category? category, @JsonKey(name: 'brand_model')  BrandModel? brandModel,  User? user, @JsonKey(name: 'is_promoted')  bool? isPromoted)?  $default,) {final _that = this;
switch (_that) {
case _RecommendedItem() when $default != null:
return $default(_that.id,_that.userId,_that.countryId,_that.brandModelId,_that.brandId,_that.categoryId,_that.name,_that.year,_that.slug,_that.description,_that.images,_that.location,_that.serialNumber,_that.condition,_that.steerPosition,_that.engineCapacity,_that.transmission,_that.color,_that.buildType,_that.numberOfPassengers,_that.features,_that.status,_that.price,_that.mileage,_that.warranty,_that.warrantyExpiration,_that.deletedAt,_that.createdAt,_that.updatedAt,_that.height,_that.vin,_that.brand,_that.category,_that.brandModel,_that.user,_that.isPromoted);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RecommendedItem with DiagnosticableTreeMixin implements RecommendedItem {
  const _RecommendedItem({required this.id, @JsonKey(name: 'user_id') this.userId, @JsonKey(name: 'country_id') this.countryId, @JsonKey(name: 'brand_model_id') this.brandModelId, @JsonKey(name: 'brand_id') this.brandId, @JsonKey(name: 'category_id') this.categoryId, this.name, this.year, this.slug, this.description, final  List<String>? images, this.location, @JsonKey(name: 'serial_number') this.serialNumber, this.condition, @JsonKey(name: 'steer_position') this.steerPosition, @JsonKey(name: 'engine_capacity') this.engineCapacity, this.transmission, this.color, @JsonKey(name: 'build_type') this.buildType, @JsonKey(name: 'number_of_passengers') this.numberOfPassengers, final  List<String>? features, this.status, this.price, this.mileage, this.warranty, @JsonKey(name: 'warranty_expiration') this.warrantyExpiration, @JsonKey(name: 'deleted_at') this.deletedAt, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt, @JsonKey(name: 'Height') this.height, @JsonKey(name: 'VIN') this.vin, this.brand, this.category, @JsonKey(name: 'brand_model') this.brandModel, this.user, @JsonKey(name: 'is_promoted') this.isPromoted}): _images = images,_features = features;
  factory _RecommendedItem.fromJson(Map<String, dynamic> json) => _$RecommendedItemFromJson(json);

@override final  String id;
@override@JsonKey(name: 'user_id') final  String? userId;
@override@JsonKey(name: 'country_id') final  int? countryId;
@override@JsonKey(name: 'brand_model_id') final  int? brandModelId;
@override@JsonKey(name: 'brand_id') final  int? brandId;
@override@JsonKey(name: 'category_id') final  int? categoryId;
@override final  String? name;
@override final  String? year;
@override final  String? slug;
@override final  String? description;
 final  List<String>? _images;
@override List<String>? get images {
  final value = _images;
  if (value == null) return null;
  if (_images is EqualUnmodifiableListView) return _images;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  String? location;
@override@JsonKey(name: 'serial_number') final  String? serialNumber;
@override final  String? condition;
@override@JsonKey(name: 'steer_position') final  String? steerPosition;
@override@JsonKey(name: 'engine_capacity') final  String? engineCapacity;
@override final  String? transmission;
@override final  String? color;
@override@JsonKey(name: 'build_type') final  String? buildType;
@override@JsonKey(name: 'number_of_passengers') final  int? numberOfPassengers;
 final  List<String>? _features;
@override List<String>? get features {
  final value = _features;
  if (value == null) return null;
  if (_features is EqualUnmodifiableListView) return _features;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  String? status;
@override final  String? price;
@override final  String? mileage;
@override final  int? warranty;
@override@JsonKey(name: 'warranty_expiration') final  DateTime? warrantyExpiration;
@override@JsonKey(name: 'deleted_at') final  DateTime? deletedAt;
@override@JsonKey(name: 'created_at') final  DateTime? createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime? updatedAt;
@override@JsonKey(name: 'Height') final  String? height;
@override@JsonKey(name: 'VIN') final  String? vin;
@override final  Brand? brand;
@override final  Category? category;
@override@JsonKey(name: 'brand_model') final  BrandModel? brandModel;
@override final  User? user;
@override@JsonKey(name: 'is_promoted') final  bool? isPromoted;

/// Create a copy of RecommendedItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RecommendedItemCopyWith<_RecommendedItem> get copyWith => __$RecommendedItemCopyWithImpl<_RecommendedItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RecommendedItemToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'RecommendedItem'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('userId', userId))..add(DiagnosticsProperty('countryId', countryId))..add(DiagnosticsProperty('brandModelId', brandModelId))..add(DiagnosticsProperty('brandId', brandId))..add(DiagnosticsProperty('categoryId', categoryId))..add(DiagnosticsProperty('name', name))..add(DiagnosticsProperty('year', year))..add(DiagnosticsProperty('slug', slug))..add(DiagnosticsProperty('description', description))..add(DiagnosticsProperty('images', images))..add(DiagnosticsProperty('location', location))..add(DiagnosticsProperty('serialNumber', serialNumber))..add(DiagnosticsProperty('condition', condition))..add(DiagnosticsProperty('steerPosition', steerPosition))..add(DiagnosticsProperty('engineCapacity', engineCapacity))..add(DiagnosticsProperty('transmission', transmission))..add(DiagnosticsProperty('color', color))..add(DiagnosticsProperty('buildType', buildType))..add(DiagnosticsProperty('numberOfPassengers', numberOfPassengers))..add(DiagnosticsProperty('features', features))..add(DiagnosticsProperty('status', status))..add(DiagnosticsProperty('price', price))..add(DiagnosticsProperty('mileage', mileage))..add(DiagnosticsProperty('warranty', warranty))..add(DiagnosticsProperty('warrantyExpiration', warrantyExpiration))..add(DiagnosticsProperty('deletedAt', deletedAt))..add(DiagnosticsProperty('createdAt', createdAt))..add(DiagnosticsProperty('updatedAt', updatedAt))..add(DiagnosticsProperty('height', height))..add(DiagnosticsProperty('vin', vin))..add(DiagnosticsProperty('brand', brand))..add(DiagnosticsProperty('category', category))..add(DiagnosticsProperty('brandModel', brandModel))..add(DiagnosticsProperty('user', user))..add(DiagnosticsProperty('isPromoted', isPromoted));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RecommendedItem&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.countryId, countryId) || other.countryId == countryId)&&(identical(other.brandModelId, brandModelId) || other.brandModelId == brandModelId)&&(identical(other.brandId, brandId) || other.brandId == brandId)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.name, name) || other.name == name)&&(identical(other.year, year) || other.year == year)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._images, _images)&&(identical(other.location, location) || other.location == location)&&(identical(other.serialNumber, serialNumber) || other.serialNumber == serialNumber)&&(identical(other.condition, condition) || other.condition == condition)&&(identical(other.steerPosition, steerPosition) || other.steerPosition == steerPosition)&&(identical(other.engineCapacity, engineCapacity) || other.engineCapacity == engineCapacity)&&(identical(other.transmission, transmission) || other.transmission == transmission)&&(identical(other.color, color) || other.color == color)&&(identical(other.buildType, buildType) || other.buildType == buildType)&&(identical(other.numberOfPassengers, numberOfPassengers) || other.numberOfPassengers == numberOfPassengers)&&const DeepCollectionEquality().equals(other._features, _features)&&(identical(other.status, status) || other.status == status)&&(identical(other.price, price) || other.price == price)&&(identical(other.mileage, mileage) || other.mileage == mileage)&&(identical(other.warranty, warranty) || other.warranty == warranty)&&(identical(other.warrantyExpiration, warrantyExpiration) || other.warrantyExpiration == warrantyExpiration)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.height, height) || other.height == height)&&(identical(other.vin, vin) || other.vin == vin)&&(identical(other.brand, brand) || other.brand == brand)&&(identical(other.category, category) || other.category == category)&&(identical(other.brandModel, brandModel) || other.brandModel == brandModel)&&(identical(other.user, user) || other.user == user)&&(identical(other.isPromoted, isPromoted) || other.isPromoted == isPromoted));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,userId,countryId,brandModelId,brandId,categoryId,name,year,slug,description,const DeepCollectionEquality().hash(_images),location,serialNumber,condition,steerPosition,engineCapacity,transmission,color,buildType,numberOfPassengers,const DeepCollectionEquality().hash(_features),status,price,mileage,warranty,warrantyExpiration,deletedAt,createdAt,updatedAt,height,vin,brand,category,brandModel,user,isPromoted]);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'RecommendedItem(id: $id, userId: $userId, countryId: $countryId, brandModelId: $brandModelId, brandId: $brandId, categoryId: $categoryId, name: $name, year: $year, slug: $slug, description: $description, images: $images, location: $location, serialNumber: $serialNumber, condition: $condition, steerPosition: $steerPosition, engineCapacity: $engineCapacity, transmission: $transmission, color: $color, buildType: $buildType, numberOfPassengers: $numberOfPassengers, features: $features, status: $status, price: $price, mileage: $mileage, warranty: $warranty, warrantyExpiration: $warrantyExpiration, deletedAt: $deletedAt, createdAt: $createdAt, updatedAt: $updatedAt, height: $height, vin: $vin, brand: $brand, category: $category, brandModel: $brandModel, user: $user, isPromoted: $isPromoted)';
}


}

/// @nodoc
abstract mixin class _$RecommendedItemCopyWith<$Res> implements $RecommendedItemCopyWith<$Res> {
  factory _$RecommendedItemCopyWith(_RecommendedItem value, $Res Function(_RecommendedItem) _then) = __$RecommendedItemCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'user_id') String? userId,@JsonKey(name: 'country_id') int? countryId,@JsonKey(name: 'brand_model_id') int? brandModelId,@JsonKey(name: 'brand_id') int? brandId,@JsonKey(name: 'category_id') int? categoryId, String? name, String? year, String? slug, String? description, List<String>? images, String? location,@JsonKey(name: 'serial_number') String? serialNumber, String? condition,@JsonKey(name: 'steer_position') String? steerPosition,@JsonKey(name: 'engine_capacity') String? engineCapacity, String? transmission, String? color,@JsonKey(name: 'build_type') String? buildType,@JsonKey(name: 'number_of_passengers') int? numberOfPassengers, List<String>? features, String? status, String? price, String? mileage, int? warranty,@JsonKey(name: 'warranty_expiration') DateTime? warrantyExpiration,@JsonKey(name: 'deleted_at') DateTime? deletedAt,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt,@JsonKey(name: 'Height') String? height,@JsonKey(name: 'VIN') String? vin, Brand? brand, Category? category,@JsonKey(name: 'brand_model') BrandModel? brandModel, User? user,@JsonKey(name: 'is_promoted') bool? isPromoted
});


@override $BrandCopyWith<$Res>? get brand;@override $CategoryCopyWith<$Res>? get category;@override $BrandModelCopyWith<$Res>? get brandModel;@override $UserCopyWith<$Res>? get user;

}
/// @nodoc
class __$RecommendedItemCopyWithImpl<$Res>
    implements _$RecommendedItemCopyWith<$Res> {
  __$RecommendedItemCopyWithImpl(this._self, this._then);

  final _RecommendedItem _self;
  final $Res Function(_RecommendedItem) _then;

/// Create a copy of RecommendedItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = freezed,Object? countryId = freezed,Object? brandModelId = freezed,Object? brandId = freezed,Object? categoryId = freezed,Object? name = freezed,Object? year = freezed,Object? slug = freezed,Object? description = freezed,Object? images = freezed,Object? location = freezed,Object? serialNumber = freezed,Object? condition = freezed,Object? steerPosition = freezed,Object? engineCapacity = freezed,Object? transmission = freezed,Object? color = freezed,Object? buildType = freezed,Object? numberOfPassengers = freezed,Object? features = freezed,Object? status = freezed,Object? price = freezed,Object? mileage = freezed,Object? warranty = freezed,Object? warrantyExpiration = freezed,Object? deletedAt = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? height = freezed,Object? vin = freezed,Object? brand = freezed,Object? category = freezed,Object? brandModel = freezed,Object? user = freezed,Object? isPromoted = freezed,}) {
  return _then(_RecommendedItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,countryId: freezed == countryId ? _self.countryId : countryId // ignore: cast_nullable_to_non_nullable
as int?,brandModelId: freezed == brandModelId ? _self.brandModelId : brandModelId // ignore: cast_nullable_to_non_nullable
as int?,brandId: freezed == brandId ? _self.brandId : brandId // ignore: cast_nullable_to_non_nullable
as int?,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,year: freezed == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as String?,slug: freezed == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,images: freezed == images ? _self._images : images // ignore: cast_nullable_to_non_nullable
as List<String>?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,serialNumber: freezed == serialNumber ? _self.serialNumber : serialNumber // ignore: cast_nullable_to_non_nullable
as String?,condition: freezed == condition ? _self.condition : condition // ignore: cast_nullable_to_non_nullable
as String?,steerPosition: freezed == steerPosition ? _self.steerPosition : steerPosition // ignore: cast_nullable_to_non_nullable
as String?,engineCapacity: freezed == engineCapacity ? _self.engineCapacity : engineCapacity // ignore: cast_nullable_to_non_nullable
as String?,transmission: freezed == transmission ? _self.transmission : transmission // ignore: cast_nullable_to_non_nullable
as String?,color: freezed == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String?,buildType: freezed == buildType ? _self.buildType : buildType // ignore: cast_nullable_to_non_nullable
as String?,numberOfPassengers: freezed == numberOfPassengers ? _self.numberOfPassengers : numberOfPassengers // ignore: cast_nullable_to_non_nullable
as int?,features: freezed == features ? _self._features : features // ignore: cast_nullable_to_non_nullable
as List<String>?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as String?,mileage: freezed == mileage ? _self.mileage : mileage // ignore: cast_nullable_to_non_nullable
as String?,warranty: freezed == warranty ? _self.warranty : warranty // ignore: cast_nullable_to_non_nullable
as int?,warrantyExpiration: freezed == warrantyExpiration ? _self.warrantyExpiration : warrantyExpiration // ignore: cast_nullable_to_non_nullable
as DateTime?,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,height: freezed == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as String?,vin: freezed == vin ? _self.vin : vin // ignore: cast_nullable_to_non_nullable
as String?,brand: freezed == brand ? _self.brand : brand // ignore: cast_nullable_to_non_nullable
as Brand?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as Category?,brandModel: freezed == brandModel ? _self.brandModel : brandModel // ignore: cast_nullable_to_non_nullable
as BrandModel?,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User?,isPromoted: freezed == isPromoted ? _self.isPromoted : isPromoted // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

/// Create a copy of RecommendedItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BrandCopyWith<$Res>? get brand {
    if (_self.brand == null) {
    return null;
  }

  return $BrandCopyWith<$Res>(_self.brand!, (value) {
    return _then(_self.copyWith(brand: value));
  });
}/// Create a copy of RecommendedItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategoryCopyWith<$Res>? get category {
    if (_self.category == null) {
    return null;
  }

  return $CategoryCopyWith<$Res>(_self.category!, (value) {
    return _then(_self.copyWith(category: value));
  });
}/// Create a copy of RecommendedItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BrandModelCopyWith<$Res>? get brandModel {
    if (_self.brandModel == null) {
    return null;
  }

  return $BrandModelCopyWith<$Res>(_self.brandModel!, (value) {
    return _then(_self.copyWith(brandModel: value));
  });
}/// Create a copy of RecommendedItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $UserCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// @nodoc
mixin _$RecommendedResponse implements DiagnosticableTreeMixin {

 List<RecommendedItem> get data; RecommendedLinks get links; RecommendedMeta get meta;
/// Create a copy of RecommendedResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecommendedResponseCopyWith<RecommendedResponse> get copyWith => _$RecommendedResponseCopyWithImpl<RecommendedResponse>(this as RecommendedResponse, _$identity);

  /// Serializes this RecommendedResponse to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'RecommendedResponse'))
    ..add(DiagnosticsProperty('data', data))..add(DiagnosticsProperty('links', links))..add(DiagnosticsProperty('meta', meta));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RecommendedResponse&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.links, links) || other.links == links)&&(identical(other.meta, meta) || other.meta == meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data),links,meta);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'RecommendedResponse(data: $data, links: $links, meta: $meta)';
}


}

/// @nodoc
abstract mixin class $RecommendedResponseCopyWith<$Res>  {
  factory $RecommendedResponseCopyWith(RecommendedResponse value, $Res Function(RecommendedResponse) _then) = _$RecommendedResponseCopyWithImpl;
@useResult
$Res call({
 List<RecommendedItem> data, RecommendedLinks links, RecommendedMeta meta
});


$RecommendedLinksCopyWith<$Res> get links;$RecommendedMetaCopyWith<$Res> get meta;

}
/// @nodoc
class _$RecommendedResponseCopyWithImpl<$Res>
    implements $RecommendedResponseCopyWith<$Res> {
  _$RecommendedResponseCopyWithImpl(this._self, this._then);

  final RecommendedResponse _self;
  final $Res Function(RecommendedResponse) _then;

/// Create a copy of RecommendedResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = null,Object? links = null,Object? meta = null,}) {
  return _then(_self.copyWith(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<RecommendedItem>,links: null == links ? _self.links : links // ignore: cast_nullable_to_non_nullable
as RecommendedLinks,meta: null == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as RecommendedMeta,
  ));
}
/// Create a copy of RecommendedResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RecommendedLinksCopyWith<$Res> get links {
  
  return $RecommendedLinksCopyWith<$Res>(_self.links, (value) {
    return _then(_self.copyWith(links: value));
  });
}/// Create a copy of RecommendedResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RecommendedMetaCopyWith<$Res> get meta {
  
  return $RecommendedMetaCopyWith<$Res>(_self.meta, (value) {
    return _then(_self.copyWith(meta: value));
  });
}
}


/// Adds pattern-matching-related methods to [RecommendedResponse].
extension RecommendedResponsePatterns on RecommendedResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RecommendedResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RecommendedResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RecommendedResponse value)  $default,){
final _that = this;
switch (_that) {
case _RecommendedResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RecommendedResponse value)?  $default,){
final _that = this;
switch (_that) {
case _RecommendedResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<RecommendedItem> data,  RecommendedLinks links,  RecommendedMeta meta)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RecommendedResponse() when $default != null:
return $default(_that.data,_that.links,_that.meta);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<RecommendedItem> data,  RecommendedLinks links,  RecommendedMeta meta)  $default,) {final _that = this;
switch (_that) {
case _RecommendedResponse():
return $default(_that.data,_that.links,_that.meta);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<RecommendedItem> data,  RecommendedLinks links,  RecommendedMeta meta)?  $default,) {final _that = this;
switch (_that) {
case _RecommendedResponse() when $default != null:
return $default(_that.data,_that.links,_that.meta);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RecommendedResponse with DiagnosticableTreeMixin implements RecommendedResponse {
  const _RecommendedResponse({required final  List<RecommendedItem> data, required this.links, required this.meta}): _data = data;
  factory _RecommendedResponse.fromJson(Map<String, dynamic> json) => _$RecommendedResponseFromJson(json);

 final  List<RecommendedItem> _data;
@override List<RecommendedItem> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}

@override final  RecommendedLinks links;
@override final  RecommendedMeta meta;

/// Create a copy of RecommendedResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RecommendedResponseCopyWith<_RecommendedResponse> get copyWith => __$RecommendedResponseCopyWithImpl<_RecommendedResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RecommendedResponseToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'RecommendedResponse'))
    ..add(DiagnosticsProperty('data', data))..add(DiagnosticsProperty('links', links))..add(DiagnosticsProperty('meta', meta));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RecommendedResponse&&const DeepCollectionEquality().equals(other._data, _data)&&(identical(other.links, links) || other.links == links)&&(identical(other.meta, meta) || other.meta == meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_data),links,meta);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'RecommendedResponse(data: $data, links: $links, meta: $meta)';
}


}

/// @nodoc
abstract mixin class _$RecommendedResponseCopyWith<$Res> implements $RecommendedResponseCopyWith<$Res> {
  factory _$RecommendedResponseCopyWith(_RecommendedResponse value, $Res Function(_RecommendedResponse) _then) = __$RecommendedResponseCopyWithImpl;
@override @useResult
$Res call({
 List<RecommendedItem> data, RecommendedLinks links, RecommendedMeta meta
});


@override $RecommendedLinksCopyWith<$Res> get links;@override $RecommendedMetaCopyWith<$Res> get meta;

}
/// @nodoc
class __$RecommendedResponseCopyWithImpl<$Res>
    implements _$RecommendedResponseCopyWith<$Res> {
  __$RecommendedResponseCopyWithImpl(this._self, this._then);

  final _RecommendedResponse _self;
  final $Res Function(_RecommendedResponse) _then;

/// Create a copy of RecommendedResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,Object? links = null,Object? meta = null,}) {
  return _then(_RecommendedResponse(
data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<RecommendedItem>,links: null == links ? _self.links : links // ignore: cast_nullable_to_non_nullable
as RecommendedLinks,meta: null == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as RecommendedMeta,
  ));
}

/// Create a copy of RecommendedResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RecommendedLinksCopyWith<$Res> get links {
  
  return $RecommendedLinksCopyWith<$Res>(_self.links, (value) {
    return _then(_self.copyWith(links: value));
  });
}/// Create a copy of RecommendedResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RecommendedMetaCopyWith<$Res> get meta {
  
  return $RecommendedMetaCopyWith<$Res>(_self.meta, (value) {
    return _then(_self.copyWith(meta: value));
  });
}
}


/// @nodoc
mixin _$RecommendedLinks implements DiagnosticableTreeMixin {

 String get first; String get last; String? get prev; String? get next;
/// Create a copy of RecommendedLinks
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecommendedLinksCopyWith<RecommendedLinks> get copyWith => _$RecommendedLinksCopyWithImpl<RecommendedLinks>(this as RecommendedLinks, _$identity);

  /// Serializes this RecommendedLinks to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'RecommendedLinks'))
    ..add(DiagnosticsProperty('first', first))..add(DiagnosticsProperty('last', last))..add(DiagnosticsProperty('prev', prev))..add(DiagnosticsProperty('next', next));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RecommendedLinks&&(identical(other.first, first) || other.first == first)&&(identical(other.last, last) || other.last == last)&&(identical(other.prev, prev) || other.prev == prev)&&(identical(other.next, next) || other.next == next));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,first,last,prev,next);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'RecommendedLinks(first: $first, last: $last, prev: $prev, next: $next)';
}


}

/// @nodoc
abstract mixin class $RecommendedLinksCopyWith<$Res>  {
  factory $RecommendedLinksCopyWith(RecommendedLinks value, $Res Function(RecommendedLinks) _then) = _$RecommendedLinksCopyWithImpl;
@useResult
$Res call({
 String first, String last, String? prev, String? next
});




}
/// @nodoc
class _$RecommendedLinksCopyWithImpl<$Res>
    implements $RecommendedLinksCopyWith<$Res> {
  _$RecommendedLinksCopyWithImpl(this._self, this._then);

  final RecommendedLinks _self;
  final $Res Function(RecommendedLinks) _then;

/// Create a copy of RecommendedLinks
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? first = null,Object? last = null,Object? prev = freezed,Object? next = freezed,}) {
  return _then(_self.copyWith(
first: null == first ? _self.first : first // ignore: cast_nullable_to_non_nullable
as String,last: null == last ? _self.last : last // ignore: cast_nullable_to_non_nullable
as String,prev: freezed == prev ? _self.prev : prev // ignore: cast_nullable_to_non_nullable
as String?,next: freezed == next ? _self.next : next // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [RecommendedLinks].
extension RecommendedLinksPatterns on RecommendedLinks {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RecommendedLinks value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RecommendedLinks() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RecommendedLinks value)  $default,){
final _that = this;
switch (_that) {
case _RecommendedLinks():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RecommendedLinks value)?  $default,){
final _that = this;
switch (_that) {
case _RecommendedLinks() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String first,  String last,  String? prev,  String? next)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RecommendedLinks() when $default != null:
return $default(_that.first,_that.last,_that.prev,_that.next);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String first,  String last,  String? prev,  String? next)  $default,) {final _that = this;
switch (_that) {
case _RecommendedLinks():
return $default(_that.first,_that.last,_that.prev,_that.next);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String first,  String last,  String? prev,  String? next)?  $default,) {final _that = this;
switch (_that) {
case _RecommendedLinks() when $default != null:
return $default(_that.first,_that.last,_that.prev,_that.next);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RecommendedLinks with DiagnosticableTreeMixin implements RecommendedLinks {
  const _RecommendedLinks({required this.first, required this.last, this.prev, this.next});
  factory _RecommendedLinks.fromJson(Map<String, dynamic> json) => _$RecommendedLinksFromJson(json);

@override final  String first;
@override final  String last;
@override final  String? prev;
@override final  String? next;

/// Create a copy of RecommendedLinks
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RecommendedLinksCopyWith<_RecommendedLinks> get copyWith => __$RecommendedLinksCopyWithImpl<_RecommendedLinks>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RecommendedLinksToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'RecommendedLinks'))
    ..add(DiagnosticsProperty('first', first))..add(DiagnosticsProperty('last', last))..add(DiagnosticsProperty('prev', prev))..add(DiagnosticsProperty('next', next));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RecommendedLinks&&(identical(other.first, first) || other.first == first)&&(identical(other.last, last) || other.last == last)&&(identical(other.prev, prev) || other.prev == prev)&&(identical(other.next, next) || other.next == next));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,first,last,prev,next);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'RecommendedLinks(first: $first, last: $last, prev: $prev, next: $next)';
}


}

/// @nodoc
abstract mixin class _$RecommendedLinksCopyWith<$Res> implements $RecommendedLinksCopyWith<$Res> {
  factory _$RecommendedLinksCopyWith(_RecommendedLinks value, $Res Function(_RecommendedLinks) _then) = __$RecommendedLinksCopyWithImpl;
@override @useResult
$Res call({
 String first, String last, String? prev, String? next
});




}
/// @nodoc
class __$RecommendedLinksCopyWithImpl<$Res>
    implements _$RecommendedLinksCopyWith<$Res> {
  __$RecommendedLinksCopyWithImpl(this._self, this._then);

  final _RecommendedLinks _self;
  final $Res Function(_RecommendedLinks) _then;

/// Create a copy of RecommendedLinks
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? first = null,Object? last = null,Object? prev = freezed,Object? next = freezed,}) {
  return _then(_RecommendedLinks(
first: null == first ? _self.first : first // ignore: cast_nullable_to_non_nullable
as String,last: null == last ? _self.last : last // ignore: cast_nullable_to_non_nullable
as String,prev: freezed == prev ? _self.prev : prev // ignore: cast_nullable_to_non_nullable
as String?,next: freezed == next ? _self.next : next // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$RecommendedMeta implements DiagnosticableTreeMixin {

@JsonKey(name: 'current_page') int get currentPage; int? get from;// FIXED: Made nullable
@JsonKey(name: 'last_page') int get lastPage; List<RecommendedMetaLink> get links; String get path;@JsonKey(name: 'per_page') int get perPage; int? get to;// FIXED: Made nullable
 int get total;
/// Create a copy of RecommendedMeta
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecommendedMetaCopyWith<RecommendedMeta> get copyWith => _$RecommendedMetaCopyWithImpl<RecommendedMeta>(this as RecommendedMeta, _$identity);

  /// Serializes this RecommendedMeta to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'RecommendedMeta'))
    ..add(DiagnosticsProperty('currentPage', currentPage))..add(DiagnosticsProperty('from', from))..add(DiagnosticsProperty('lastPage', lastPage))..add(DiagnosticsProperty('links', links))..add(DiagnosticsProperty('path', path))..add(DiagnosticsProperty('perPage', perPage))..add(DiagnosticsProperty('to', to))..add(DiagnosticsProperty('total', total));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RecommendedMeta&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.from, from) || other.from == from)&&(identical(other.lastPage, lastPage) || other.lastPage == lastPage)&&const DeepCollectionEquality().equals(other.links, links)&&(identical(other.path, path) || other.path == path)&&(identical(other.perPage, perPage) || other.perPage == perPage)&&(identical(other.to, to) || other.to == to)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,currentPage,from,lastPage,const DeepCollectionEquality().hash(links),path,perPage,to,total);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'RecommendedMeta(currentPage: $currentPage, from: $from, lastPage: $lastPage, links: $links, path: $path, perPage: $perPage, to: $to, total: $total)';
}


}

/// @nodoc
abstract mixin class $RecommendedMetaCopyWith<$Res>  {
  factory $RecommendedMetaCopyWith(RecommendedMeta value, $Res Function(RecommendedMeta) _then) = _$RecommendedMetaCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'current_page') int currentPage, int? from,@JsonKey(name: 'last_page') int lastPage, List<RecommendedMetaLink> links, String path,@JsonKey(name: 'per_page') int perPage, int? to, int total
});




}
/// @nodoc
class _$RecommendedMetaCopyWithImpl<$Res>
    implements $RecommendedMetaCopyWith<$Res> {
  _$RecommendedMetaCopyWithImpl(this._self, this._then);

  final RecommendedMeta _self;
  final $Res Function(RecommendedMeta) _then;

/// Create a copy of RecommendedMeta
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currentPage = null,Object? from = freezed,Object? lastPage = null,Object? links = null,Object? path = null,Object? perPage = null,Object? to = freezed,Object? total = null,}) {
  return _then(_self.copyWith(
currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,from: freezed == from ? _self.from : from // ignore: cast_nullable_to_non_nullable
as int?,lastPage: null == lastPage ? _self.lastPage : lastPage // ignore: cast_nullable_to_non_nullable
as int,links: null == links ? _self.links : links // ignore: cast_nullable_to_non_nullable
as List<RecommendedMetaLink>,path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String,perPage: null == perPage ? _self.perPage : perPage // ignore: cast_nullable_to_non_nullable
as int,to: freezed == to ? _self.to : to // ignore: cast_nullable_to_non_nullable
as int?,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [RecommendedMeta].
extension RecommendedMetaPatterns on RecommendedMeta {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RecommendedMeta value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RecommendedMeta() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RecommendedMeta value)  $default,){
final _that = this;
switch (_that) {
case _RecommendedMeta():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RecommendedMeta value)?  $default,){
final _that = this;
switch (_that) {
case _RecommendedMeta() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'current_page')  int currentPage,  int? from, @JsonKey(name: 'last_page')  int lastPage,  List<RecommendedMetaLink> links,  String path, @JsonKey(name: 'per_page')  int perPage,  int? to,  int total)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RecommendedMeta() when $default != null:
return $default(_that.currentPage,_that.from,_that.lastPage,_that.links,_that.path,_that.perPage,_that.to,_that.total);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'current_page')  int currentPage,  int? from, @JsonKey(name: 'last_page')  int lastPage,  List<RecommendedMetaLink> links,  String path, @JsonKey(name: 'per_page')  int perPage,  int? to,  int total)  $default,) {final _that = this;
switch (_that) {
case _RecommendedMeta():
return $default(_that.currentPage,_that.from,_that.lastPage,_that.links,_that.path,_that.perPage,_that.to,_that.total);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'current_page')  int currentPage,  int? from, @JsonKey(name: 'last_page')  int lastPage,  List<RecommendedMetaLink> links,  String path, @JsonKey(name: 'per_page')  int perPage,  int? to,  int total)?  $default,) {final _that = this;
switch (_that) {
case _RecommendedMeta() when $default != null:
return $default(_that.currentPage,_that.from,_that.lastPage,_that.links,_that.path,_that.perPage,_that.to,_that.total);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RecommendedMeta with DiagnosticableTreeMixin implements RecommendedMeta {
  const _RecommendedMeta({@JsonKey(name: 'current_page') required this.currentPage, required this.from, @JsonKey(name: 'last_page') required this.lastPage, required final  List<RecommendedMetaLink> links, required this.path, @JsonKey(name: 'per_page') required this.perPage, required this.to, required this.total}): _links = links;
  factory _RecommendedMeta.fromJson(Map<String, dynamic> json) => _$RecommendedMetaFromJson(json);

@override@JsonKey(name: 'current_page') final  int currentPage;
@override final  int? from;
// FIXED: Made nullable
@override@JsonKey(name: 'last_page') final  int lastPage;
 final  List<RecommendedMetaLink> _links;
@override List<RecommendedMetaLink> get links {
  if (_links is EqualUnmodifiableListView) return _links;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_links);
}

@override final  String path;
@override@JsonKey(name: 'per_page') final  int perPage;
@override final  int? to;
// FIXED: Made nullable
@override final  int total;

/// Create a copy of RecommendedMeta
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RecommendedMetaCopyWith<_RecommendedMeta> get copyWith => __$RecommendedMetaCopyWithImpl<_RecommendedMeta>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RecommendedMetaToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'RecommendedMeta'))
    ..add(DiagnosticsProperty('currentPage', currentPage))..add(DiagnosticsProperty('from', from))..add(DiagnosticsProperty('lastPage', lastPage))..add(DiagnosticsProperty('links', links))..add(DiagnosticsProperty('path', path))..add(DiagnosticsProperty('perPage', perPage))..add(DiagnosticsProperty('to', to))..add(DiagnosticsProperty('total', total));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RecommendedMeta&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.from, from) || other.from == from)&&(identical(other.lastPage, lastPage) || other.lastPage == lastPage)&&const DeepCollectionEquality().equals(other._links, _links)&&(identical(other.path, path) || other.path == path)&&(identical(other.perPage, perPage) || other.perPage == perPage)&&(identical(other.to, to) || other.to == to)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,currentPage,from,lastPage,const DeepCollectionEquality().hash(_links),path,perPage,to,total);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'RecommendedMeta(currentPage: $currentPage, from: $from, lastPage: $lastPage, links: $links, path: $path, perPage: $perPage, to: $to, total: $total)';
}


}

/// @nodoc
abstract mixin class _$RecommendedMetaCopyWith<$Res> implements $RecommendedMetaCopyWith<$Res> {
  factory _$RecommendedMetaCopyWith(_RecommendedMeta value, $Res Function(_RecommendedMeta) _then) = __$RecommendedMetaCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'current_page') int currentPage, int? from,@JsonKey(name: 'last_page') int lastPage, List<RecommendedMetaLink> links, String path,@JsonKey(name: 'per_page') int perPage, int? to, int total
});




}
/// @nodoc
class __$RecommendedMetaCopyWithImpl<$Res>
    implements _$RecommendedMetaCopyWith<$Res> {
  __$RecommendedMetaCopyWithImpl(this._self, this._then);

  final _RecommendedMeta _self;
  final $Res Function(_RecommendedMeta) _then;

/// Create a copy of RecommendedMeta
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currentPage = null,Object? from = freezed,Object? lastPage = null,Object? links = null,Object? path = null,Object? perPage = null,Object? to = freezed,Object? total = null,}) {
  return _then(_RecommendedMeta(
currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,from: freezed == from ? _self.from : from // ignore: cast_nullable_to_non_nullable
as int?,lastPage: null == lastPage ? _self.lastPage : lastPage // ignore: cast_nullable_to_non_nullable
as int,links: null == links ? _self._links : links // ignore: cast_nullable_to_non_nullable
as List<RecommendedMetaLink>,path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String,perPage: null == perPage ? _self.perPage : perPage // ignore: cast_nullable_to_non_nullable
as int,to: freezed == to ? _self.to : to // ignore: cast_nullable_to_non_nullable
as int?,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$RecommendedMetaLink implements DiagnosticableTreeMixin {

 String? get url; String get label; int? get page; bool get active;
/// Create a copy of RecommendedMetaLink
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecommendedMetaLinkCopyWith<RecommendedMetaLink> get copyWith => _$RecommendedMetaLinkCopyWithImpl<RecommendedMetaLink>(this as RecommendedMetaLink, _$identity);

  /// Serializes this RecommendedMetaLink to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'RecommendedMetaLink'))
    ..add(DiagnosticsProperty('url', url))..add(DiagnosticsProperty('label', label))..add(DiagnosticsProperty('page', page))..add(DiagnosticsProperty('active', active));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RecommendedMetaLink&&(identical(other.url, url) || other.url == url)&&(identical(other.label, label) || other.label == label)&&(identical(other.page, page) || other.page == page)&&(identical(other.active, active) || other.active == active));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,url,label,page,active);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'RecommendedMetaLink(url: $url, label: $label, page: $page, active: $active)';
}


}

/// @nodoc
abstract mixin class $RecommendedMetaLinkCopyWith<$Res>  {
  factory $RecommendedMetaLinkCopyWith(RecommendedMetaLink value, $Res Function(RecommendedMetaLink) _then) = _$RecommendedMetaLinkCopyWithImpl;
@useResult
$Res call({
 String? url, String label, int? page, bool active
});




}
/// @nodoc
class _$RecommendedMetaLinkCopyWithImpl<$Res>
    implements $RecommendedMetaLinkCopyWith<$Res> {
  _$RecommendedMetaLinkCopyWithImpl(this._self, this._then);

  final RecommendedMetaLink _self;
  final $Res Function(RecommendedMetaLink) _then;

/// Create a copy of RecommendedMetaLink
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? url = freezed,Object? label = null,Object? page = freezed,Object? active = null,}) {
  return _then(_self.copyWith(
url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,page: freezed == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int?,active: null == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [RecommendedMetaLink].
extension RecommendedMetaLinkPatterns on RecommendedMetaLink {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RecommendedMetaLink value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RecommendedMetaLink() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RecommendedMetaLink value)  $default,){
final _that = this;
switch (_that) {
case _RecommendedMetaLink():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RecommendedMetaLink value)?  $default,){
final _that = this;
switch (_that) {
case _RecommendedMetaLink() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? url,  String label,  int? page,  bool active)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RecommendedMetaLink() when $default != null:
return $default(_that.url,_that.label,_that.page,_that.active);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? url,  String label,  int? page,  bool active)  $default,) {final _that = this;
switch (_that) {
case _RecommendedMetaLink():
return $default(_that.url,_that.label,_that.page,_that.active);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? url,  String label,  int? page,  bool active)?  $default,) {final _that = this;
switch (_that) {
case _RecommendedMetaLink() when $default != null:
return $default(_that.url,_that.label,_that.page,_that.active);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RecommendedMetaLink with DiagnosticableTreeMixin implements RecommendedMetaLink {
  const _RecommendedMetaLink({this.url, required this.label, this.page, required this.active});
  factory _RecommendedMetaLink.fromJson(Map<String, dynamic> json) => _$RecommendedMetaLinkFromJson(json);

@override final  String? url;
@override final  String label;
@override final  int? page;
@override final  bool active;

/// Create a copy of RecommendedMetaLink
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RecommendedMetaLinkCopyWith<_RecommendedMetaLink> get copyWith => __$RecommendedMetaLinkCopyWithImpl<_RecommendedMetaLink>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RecommendedMetaLinkToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'RecommendedMetaLink'))
    ..add(DiagnosticsProperty('url', url))..add(DiagnosticsProperty('label', label))..add(DiagnosticsProperty('page', page))..add(DiagnosticsProperty('active', active));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RecommendedMetaLink&&(identical(other.url, url) || other.url == url)&&(identical(other.label, label) || other.label == label)&&(identical(other.page, page) || other.page == page)&&(identical(other.active, active) || other.active == active));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,url,label,page,active);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'RecommendedMetaLink(url: $url, label: $label, page: $page, active: $active)';
}


}

/// @nodoc
abstract mixin class _$RecommendedMetaLinkCopyWith<$Res> implements $RecommendedMetaLinkCopyWith<$Res> {
  factory _$RecommendedMetaLinkCopyWith(_RecommendedMetaLink value, $Res Function(_RecommendedMetaLink) _then) = __$RecommendedMetaLinkCopyWithImpl;
@override @useResult
$Res call({
 String? url, String label, int? page, bool active
});




}
/// @nodoc
class __$RecommendedMetaLinkCopyWithImpl<$Res>
    implements _$RecommendedMetaLinkCopyWith<$Res> {
  __$RecommendedMetaLinkCopyWithImpl(this._self, this._then);

  final _RecommendedMetaLink _self;
  final $Res Function(_RecommendedMetaLink) _then;

/// Create a copy of RecommendedMetaLink
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? url = freezed,Object? label = null,Object? page = freezed,Object? active = null,}) {
  return _then(_RecommendedMetaLink(
url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,page: freezed == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int?,active: null == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
