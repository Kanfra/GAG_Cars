// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'searchItemModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$User {

 String get id; String get name; String get email; String? get phone;@JsonKey(name: 'email_verified_at') DateTime? get emailVerifiedAt;@JsonKey(name: 'paid_seller') int? get paidSeller;@JsonKey(name: 'deleted_at') DateTime? get deletedAt;@JsonKey(name: 'created_at') DateTime? get createdAt;@JsonKey(name: 'updated_at') DateTime? get updatedAt;@JsonKey(name: 'country_id') int? get countryId;@JsonKey(name: 'state_id') int? get stateId;@JsonKey(name: 'profile_photo') String? get profilePhoto;
/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserCopyWith<User> get copyWith => _$UserCopyWithImpl<User>(this as User, _$identity);

  /// Serializes this User to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is User&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.emailVerifiedAt, emailVerifiedAt) || other.emailVerifiedAt == emailVerifiedAt)&&(identical(other.paidSeller, paidSeller) || other.paidSeller == paidSeller)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.countryId, countryId) || other.countryId == countryId)&&(identical(other.stateId, stateId) || other.stateId == stateId)&&(identical(other.profilePhoto, profilePhoto) || other.profilePhoto == profilePhoto));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,email,phone,emailVerifiedAt,paidSeller,deletedAt,createdAt,updatedAt,countryId,stateId,profilePhoto);

@override
String toString() {
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

class _User implements User {
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
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _User&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.emailVerifiedAt, emailVerifiedAt) || other.emailVerifiedAt == emailVerifiedAt)&&(identical(other.paidSeller, paidSeller) || other.paidSeller == paidSeller)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.countryId, countryId) || other.countryId == countryId)&&(identical(other.stateId, stateId) || other.stateId == stateId)&&(identical(other.profilePhoto, profilePhoto) || other.profilePhoto == profilePhoto));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,email,phone,emailVerifiedAt,paidSeller,deletedAt,createdAt,updatedAt,countryId,stateId,profilePhoto);

@override
String toString() {
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
mixin _$SearchItem {

 String get id;@JsonKey(name: 'user_id') String? get userId;@JsonKey(name: 'country_id') int? get countryId;@JsonKey(name: 'brand_model_id') int? get brandModelId;@JsonKey(name: 'brand_id') int? get brandId;@JsonKey(name: 'category_id') int? get categoryId; String? get name; String? get year; String? get slug; String? get description; List<String>? get images; String? get location;@JsonKey(name: 'serial_number') String? get serialNumber; String? get condition;@JsonKey(name: 'steer_position') String? get steerPosition;@JsonKey(name: 'engine_capacity') String? get engineCapacity; String? get transmission; String? get color;@JsonKey(name: 'build_type') String? get buildType;@JsonKey(name: 'number_of_passengers') int? get numberOfPassengers; List<String>? get features; String? get status; String? get price; String? get mileage; User? get user; int? get warranty;@JsonKey(name: 'warranty_expiration') String? get warrantyExpiration;@JsonKey(name: 'deleted_at') String? get deletedAt;@JsonKey(name: 'created_at') String? get createdAt;@JsonKey(name: 'updated_at') String? get updatedAt; String? get Height; String? get VIN;
/// Create a copy of SearchItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchItemCopyWith<SearchItem> get copyWith => _$SearchItemCopyWithImpl<SearchItem>(this as SearchItem, _$identity);

  /// Serializes this SearchItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchItem&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.countryId, countryId) || other.countryId == countryId)&&(identical(other.brandModelId, brandModelId) || other.brandModelId == brandModelId)&&(identical(other.brandId, brandId) || other.brandId == brandId)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.name, name) || other.name == name)&&(identical(other.year, year) || other.year == year)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.images, images)&&(identical(other.location, location) || other.location == location)&&(identical(other.serialNumber, serialNumber) || other.serialNumber == serialNumber)&&(identical(other.condition, condition) || other.condition == condition)&&(identical(other.steerPosition, steerPosition) || other.steerPosition == steerPosition)&&(identical(other.engineCapacity, engineCapacity) || other.engineCapacity == engineCapacity)&&(identical(other.transmission, transmission) || other.transmission == transmission)&&(identical(other.color, color) || other.color == color)&&(identical(other.buildType, buildType) || other.buildType == buildType)&&(identical(other.numberOfPassengers, numberOfPassengers) || other.numberOfPassengers == numberOfPassengers)&&const DeepCollectionEquality().equals(other.features, features)&&(identical(other.status, status) || other.status == status)&&(identical(other.price, price) || other.price == price)&&(identical(other.mileage, mileage) || other.mileage == mileage)&&(identical(other.user, user) || other.user == user)&&(identical(other.warranty, warranty) || other.warranty == warranty)&&(identical(other.warrantyExpiration, warrantyExpiration) || other.warrantyExpiration == warrantyExpiration)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.Height, Height) || other.Height == Height)&&(identical(other.VIN, VIN) || other.VIN == VIN));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,userId,countryId,brandModelId,brandId,categoryId,name,year,slug,description,const DeepCollectionEquality().hash(images),location,serialNumber,condition,steerPosition,engineCapacity,transmission,color,buildType,numberOfPassengers,const DeepCollectionEquality().hash(features),status,price,mileage,user,warranty,warrantyExpiration,deletedAt,createdAt,updatedAt,Height,VIN]);

@override
String toString() {
  return 'SearchItem(id: $id, userId: $userId, countryId: $countryId, brandModelId: $brandModelId, brandId: $brandId, categoryId: $categoryId, name: $name, year: $year, slug: $slug, description: $description, images: $images, location: $location, serialNumber: $serialNumber, condition: $condition, steerPosition: $steerPosition, engineCapacity: $engineCapacity, transmission: $transmission, color: $color, buildType: $buildType, numberOfPassengers: $numberOfPassengers, features: $features, status: $status, price: $price, mileage: $mileage, user: $user, warranty: $warranty, warrantyExpiration: $warrantyExpiration, deletedAt: $deletedAt, createdAt: $createdAt, updatedAt: $updatedAt, Height: $Height, VIN: $VIN)';
}


}

/// @nodoc
abstract mixin class $SearchItemCopyWith<$Res>  {
  factory $SearchItemCopyWith(SearchItem value, $Res Function(SearchItem) _then) = _$SearchItemCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'user_id') String? userId,@JsonKey(name: 'country_id') int? countryId,@JsonKey(name: 'brand_model_id') int? brandModelId,@JsonKey(name: 'brand_id') int? brandId,@JsonKey(name: 'category_id') int? categoryId, String? name, String? year, String? slug, String? description, List<String>? images, String? location,@JsonKey(name: 'serial_number') String? serialNumber, String? condition,@JsonKey(name: 'steer_position') String? steerPosition,@JsonKey(name: 'engine_capacity') String? engineCapacity, String? transmission, String? color,@JsonKey(name: 'build_type') String? buildType,@JsonKey(name: 'number_of_passengers') int? numberOfPassengers, List<String>? features, String? status, String? price, String? mileage, User? user, int? warranty,@JsonKey(name: 'warranty_expiration') String? warrantyExpiration,@JsonKey(name: 'deleted_at') String? deletedAt,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'updated_at') String? updatedAt, String? Height, String? VIN
});


$UserCopyWith<$Res>? get user;

}
/// @nodoc
class _$SearchItemCopyWithImpl<$Res>
    implements $SearchItemCopyWith<$Res> {
  _$SearchItemCopyWithImpl(this._self, this._then);

  final SearchItem _self;
  final $Res Function(SearchItem) _then;

/// Create a copy of SearchItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = freezed,Object? countryId = freezed,Object? brandModelId = freezed,Object? brandId = freezed,Object? categoryId = freezed,Object? name = freezed,Object? year = freezed,Object? slug = freezed,Object? description = freezed,Object? images = freezed,Object? location = freezed,Object? serialNumber = freezed,Object? condition = freezed,Object? steerPosition = freezed,Object? engineCapacity = freezed,Object? transmission = freezed,Object? color = freezed,Object? buildType = freezed,Object? numberOfPassengers = freezed,Object? features = freezed,Object? status = freezed,Object? price = freezed,Object? mileage = freezed,Object? user = freezed,Object? warranty = freezed,Object? warrantyExpiration = freezed,Object? deletedAt = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? Height = freezed,Object? VIN = freezed,}) {
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
as String?,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User?,warranty: freezed == warranty ? _self.warranty : warranty // ignore: cast_nullable_to_non_nullable
as int?,warrantyExpiration: freezed == warrantyExpiration ? _self.warrantyExpiration : warrantyExpiration // ignore: cast_nullable_to_non_nullable
as String?,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,Height: freezed == Height ? _self.Height : Height // ignore: cast_nullable_to_non_nullable
as String?,VIN: freezed == VIN ? _self.VIN : VIN // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of SearchItem
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


/// Adds pattern-matching-related methods to [SearchItem].
extension SearchItemPatterns on SearchItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SearchItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SearchItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SearchItem value)  $default,){
final _that = this;
switch (_that) {
case _SearchItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SearchItem value)?  $default,){
final _that = this;
switch (_that) {
case _SearchItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'user_id')  String? userId, @JsonKey(name: 'country_id')  int? countryId, @JsonKey(name: 'brand_model_id')  int? brandModelId, @JsonKey(name: 'brand_id')  int? brandId, @JsonKey(name: 'category_id')  int? categoryId,  String? name,  String? year,  String? slug,  String? description,  List<String>? images,  String? location, @JsonKey(name: 'serial_number')  String? serialNumber,  String? condition, @JsonKey(name: 'steer_position')  String? steerPosition, @JsonKey(name: 'engine_capacity')  String? engineCapacity,  String? transmission,  String? color, @JsonKey(name: 'build_type')  String? buildType, @JsonKey(name: 'number_of_passengers')  int? numberOfPassengers,  List<String>? features,  String? status,  String? price,  String? mileage,  User? user,  int? warranty, @JsonKey(name: 'warranty_expiration')  String? warrantyExpiration, @JsonKey(name: 'deleted_at')  String? deletedAt, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt,  String? Height,  String? VIN)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchItem() when $default != null:
return $default(_that.id,_that.userId,_that.countryId,_that.brandModelId,_that.brandId,_that.categoryId,_that.name,_that.year,_that.slug,_that.description,_that.images,_that.location,_that.serialNumber,_that.condition,_that.steerPosition,_that.engineCapacity,_that.transmission,_that.color,_that.buildType,_that.numberOfPassengers,_that.features,_that.status,_that.price,_that.mileage,_that.user,_that.warranty,_that.warrantyExpiration,_that.deletedAt,_that.createdAt,_that.updatedAt,_that.Height,_that.VIN);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'user_id')  String? userId, @JsonKey(name: 'country_id')  int? countryId, @JsonKey(name: 'brand_model_id')  int? brandModelId, @JsonKey(name: 'brand_id')  int? brandId, @JsonKey(name: 'category_id')  int? categoryId,  String? name,  String? year,  String? slug,  String? description,  List<String>? images,  String? location, @JsonKey(name: 'serial_number')  String? serialNumber,  String? condition, @JsonKey(name: 'steer_position')  String? steerPosition, @JsonKey(name: 'engine_capacity')  String? engineCapacity,  String? transmission,  String? color, @JsonKey(name: 'build_type')  String? buildType, @JsonKey(name: 'number_of_passengers')  int? numberOfPassengers,  List<String>? features,  String? status,  String? price,  String? mileage,  User? user,  int? warranty, @JsonKey(name: 'warranty_expiration')  String? warrantyExpiration, @JsonKey(name: 'deleted_at')  String? deletedAt, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt,  String? Height,  String? VIN)  $default,) {final _that = this;
switch (_that) {
case _SearchItem():
return $default(_that.id,_that.userId,_that.countryId,_that.brandModelId,_that.brandId,_that.categoryId,_that.name,_that.year,_that.slug,_that.description,_that.images,_that.location,_that.serialNumber,_that.condition,_that.steerPosition,_that.engineCapacity,_that.transmission,_that.color,_that.buildType,_that.numberOfPassengers,_that.features,_that.status,_that.price,_that.mileage,_that.user,_that.warranty,_that.warrantyExpiration,_that.deletedAt,_that.createdAt,_that.updatedAt,_that.Height,_that.VIN);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'user_id')  String? userId, @JsonKey(name: 'country_id')  int? countryId, @JsonKey(name: 'brand_model_id')  int? brandModelId, @JsonKey(name: 'brand_id')  int? brandId, @JsonKey(name: 'category_id')  int? categoryId,  String? name,  String? year,  String? slug,  String? description,  List<String>? images,  String? location, @JsonKey(name: 'serial_number')  String? serialNumber,  String? condition, @JsonKey(name: 'steer_position')  String? steerPosition, @JsonKey(name: 'engine_capacity')  String? engineCapacity,  String? transmission,  String? color, @JsonKey(name: 'build_type')  String? buildType, @JsonKey(name: 'number_of_passengers')  int? numberOfPassengers,  List<String>? features,  String? status,  String? price,  String? mileage,  User? user,  int? warranty, @JsonKey(name: 'warranty_expiration')  String? warrantyExpiration, @JsonKey(name: 'deleted_at')  String? deletedAt, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt,  String? Height,  String? VIN)?  $default,) {final _that = this;
switch (_that) {
case _SearchItem() when $default != null:
return $default(_that.id,_that.userId,_that.countryId,_that.brandModelId,_that.brandId,_that.categoryId,_that.name,_that.year,_that.slug,_that.description,_that.images,_that.location,_that.serialNumber,_that.condition,_that.steerPosition,_that.engineCapacity,_that.transmission,_that.color,_that.buildType,_that.numberOfPassengers,_that.features,_that.status,_that.price,_that.mileage,_that.user,_that.warranty,_that.warrantyExpiration,_that.deletedAt,_that.createdAt,_that.updatedAt,_that.Height,_that.VIN);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SearchItem implements SearchItem {
  const _SearchItem({required this.id, @JsonKey(name: 'user_id') this.userId, @JsonKey(name: 'country_id') this.countryId, @JsonKey(name: 'brand_model_id') this.brandModelId, @JsonKey(name: 'brand_id') this.brandId, @JsonKey(name: 'category_id') this.categoryId, this.name, this.year, this.slug, this.description, final  List<String>? images, this.location, @JsonKey(name: 'serial_number') this.serialNumber, this.condition, @JsonKey(name: 'steer_position') this.steerPosition, @JsonKey(name: 'engine_capacity') this.engineCapacity, this.transmission, this.color, @JsonKey(name: 'build_type') this.buildType, @JsonKey(name: 'number_of_passengers') this.numberOfPassengers, final  List<String>? features, this.status, this.price, this.mileage, this.user, this.warranty, @JsonKey(name: 'warranty_expiration') this.warrantyExpiration, @JsonKey(name: 'deleted_at') this.deletedAt, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt, this.Height, this.VIN}): _images = images,_features = features;
  factory _SearchItem.fromJson(Map<String, dynamic> json) => _$SearchItemFromJson(json);

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
@override final  User? user;
@override final  int? warranty;
@override@JsonKey(name: 'warranty_expiration') final  String? warrantyExpiration;
@override@JsonKey(name: 'deleted_at') final  String? deletedAt;
@override@JsonKey(name: 'created_at') final  String? createdAt;
@override@JsonKey(name: 'updated_at') final  String? updatedAt;
@override final  String? Height;
@override final  String? VIN;

/// Create a copy of SearchItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchItemCopyWith<_SearchItem> get copyWith => __$SearchItemCopyWithImpl<_SearchItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SearchItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchItem&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.countryId, countryId) || other.countryId == countryId)&&(identical(other.brandModelId, brandModelId) || other.brandModelId == brandModelId)&&(identical(other.brandId, brandId) || other.brandId == brandId)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.name, name) || other.name == name)&&(identical(other.year, year) || other.year == year)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._images, _images)&&(identical(other.location, location) || other.location == location)&&(identical(other.serialNumber, serialNumber) || other.serialNumber == serialNumber)&&(identical(other.condition, condition) || other.condition == condition)&&(identical(other.steerPosition, steerPosition) || other.steerPosition == steerPosition)&&(identical(other.engineCapacity, engineCapacity) || other.engineCapacity == engineCapacity)&&(identical(other.transmission, transmission) || other.transmission == transmission)&&(identical(other.color, color) || other.color == color)&&(identical(other.buildType, buildType) || other.buildType == buildType)&&(identical(other.numberOfPassengers, numberOfPassengers) || other.numberOfPassengers == numberOfPassengers)&&const DeepCollectionEquality().equals(other._features, _features)&&(identical(other.status, status) || other.status == status)&&(identical(other.price, price) || other.price == price)&&(identical(other.mileage, mileage) || other.mileage == mileage)&&(identical(other.user, user) || other.user == user)&&(identical(other.warranty, warranty) || other.warranty == warranty)&&(identical(other.warrantyExpiration, warrantyExpiration) || other.warrantyExpiration == warrantyExpiration)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.Height, Height) || other.Height == Height)&&(identical(other.VIN, VIN) || other.VIN == VIN));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,userId,countryId,brandModelId,brandId,categoryId,name,year,slug,description,const DeepCollectionEquality().hash(_images),location,serialNumber,condition,steerPosition,engineCapacity,transmission,color,buildType,numberOfPassengers,const DeepCollectionEquality().hash(_features),status,price,mileage,user,warranty,warrantyExpiration,deletedAt,createdAt,updatedAt,Height,VIN]);

@override
String toString() {
  return 'SearchItem(id: $id, userId: $userId, countryId: $countryId, brandModelId: $brandModelId, brandId: $brandId, categoryId: $categoryId, name: $name, year: $year, slug: $slug, description: $description, images: $images, location: $location, serialNumber: $serialNumber, condition: $condition, steerPosition: $steerPosition, engineCapacity: $engineCapacity, transmission: $transmission, color: $color, buildType: $buildType, numberOfPassengers: $numberOfPassengers, features: $features, status: $status, price: $price, mileage: $mileage, user: $user, warranty: $warranty, warrantyExpiration: $warrantyExpiration, deletedAt: $deletedAt, createdAt: $createdAt, updatedAt: $updatedAt, Height: $Height, VIN: $VIN)';
}


}

/// @nodoc
abstract mixin class _$SearchItemCopyWith<$Res> implements $SearchItemCopyWith<$Res> {
  factory _$SearchItemCopyWith(_SearchItem value, $Res Function(_SearchItem) _then) = __$SearchItemCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'user_id') String? userId,@JsonKey(name: 'country_id') int? countryId,@JsonKey(name: 'brand_model_id') int? brandModelId,@JsonKey(name: 'brand_id') int? brandId,@JsonKey(name: 'category_id') int? categoryId, String? name, String? year, String? slug, String? description, List<String>? images, String? location,@JsonKey(name: 'serial_number') String? serialNumber, String? condition,@JsonKey(name: 'steer_position') String? steerPosition,@JsonKey(name: 'engine_capacity') String? engineCapacity, String? transmission, String? color,@JsonKey(name: 'build_type') String? buildType,@JsonKey(name: 'number_of_passengers') int? numberOfPassengers, List<String>? features, String? status, String? price, String? mileage, User? user, int? warranty,@JsonKey(name: 'warranty_expiration') String? warrantyExpiration,@JsonKey(name: 'deleted_at') String? deletedAt,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'updated_at') String? updatedAt, String? Height, String? VIN
});


@override $UserCopyWith<$Res>? get user;

}
/// @nodoc
class __$SearchItemCopyWithImpl<$Res>
    implements _$SearchItemCopyWith<$Res> {
  __$SearchItemCopyWithImpl(this._self, this._then);

  final _SearchItem _self;
  final $Res Function(_SearchItem) _then;

/// Create a copy of SearchItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = freezed,Object? countryId = freezed,Object? brandModelId = freezed,Object? brandId = freezed,Object? categoryId = freezed,Object? name = freezed,Object? year = freezed,Object? slug = freezed,Object? description = freezed,Object? images = freezed,Object? location = freezed,Object? serialNumber = freezed,Object? condition = freezed,Object? steerPosition = freezed,Object? engineCapacity = freezed,Object? transmission = freezed,Object? color = freezed,Object? buildType = freezed,Object? numberOfPassengers = freezed,Object? features = freezed,Object? status = freezed,Object? price = freezed,Object? mileage = freezed,Object? user = freezed,Object? warranty = freezed,Object? warrantyExpiration = freezed,Object? deletedAt = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? Height = freezed,Object? VIN = freezed,}) {
  return _then(_SearchItem(
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
as String?,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User?,warranty: freezed == warranty ? _self.warranty : warranty // ignore: cast_nullable_to_non_nullable
as int?,warrantyExpiration: freezed == warrantyExpiration ? _self.warrantyExpiration : warrantyExpiration // ignore: cast_nullable_to_non_nullable
as String?,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,Height: freezed == Height ? _self.Height : Height // ignore: cast_nullable_to_non_nullable
as String?,VIN: freezed == VIN ? _self.VIN : VIN // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of SearchItem
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

// dart format on
