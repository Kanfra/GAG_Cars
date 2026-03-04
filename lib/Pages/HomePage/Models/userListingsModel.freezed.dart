// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'userListingsModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Category {

@JsonKey(fromJson: _parseInt) int get id;@JsonKey(name: 'user_id') dynamic get userId;@JsonKey(name: 'parent_id') dynamic get parentId;@JsonKey(fromJson: _parseString) String get name;@JsonKey(fromJson: _parseString) String get slug;@JsonKey(fromJson: _parseString) String get description;@JsonKey(fromJson: _parseStringList) List<String> get features;@JsonKey(fromJson: _parseString) String get image;@JsonKey(name: 'created_at') DateTime get createdAt;@JsonKey(name: 'updated_at') DateTime get updatedAt;
/// Create a copy of Category
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategoryCopyWith<Category> get copyWith => _$CategoryCopyWithImpl<Category>(this as Category, _$identity);

  /// Serializes this Category to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Category&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other.userId, userId)&&const DeepCollectionEquality().equals(other.parentId, parentId)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.features, features)&&(identical(other.image, image) || other.image == image)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(userId),const DeepCollectionEquality().hash(parentId),name,slug,description,const DeepCollectionEquality().hash(features),image,createdAt,updatedAt);

@override
String toString() {
  return 'Category(id: $id, userId: $userId, parentId: $parentId, name: $name, slug: $slug, description: $description, features: $features, image: $image, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $CategoryCopyWith<$Res>  {
  factory $CategoryCopyWith(Category value, $Res Function(Category) _then) = _$CategoryCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: _parseInt) int id,@JsonKey(name: 'user_id') dynamic userId,@JsonKey(name: 'parent_id') dynamic parentId,@JsonKey(fromJson: _parseString) String name,@JsonKey(fromJson: _parseString) String slug,@JsonKey(fromJson: _parseString) String description,@JsonKey(fromJson: _parseStringList) List<String> features,@JsonKey(fromJson: _parseString) String image,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = freezed,Object? parentId = freezed,Object? name = null,Object? slug = null,Object? description = null,Object? features = null,Object? image = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as dynamic,parentId: freezed == parentId ? _self.parentId : parentId // ignore: cast_nullable_to_non_nullable
as dynamic,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,features: null == features ? _self.features : features // ignore: cast_nullable_to_non_nullable
as List<String>,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _parseInt)  int id, @JsonKey(name: 'user_id')  dynamic userId, @JsonKey(name: 'parent_id')  dynamic parentId, @JsonKey(fromJson: _parseString)  String name, @JsonKey(fromJson: _parseString)  String slug, @JsonKey(fromJson: _parseString)  String description, @JsonKey(fromJson: _parseStringList)  List<String> features, @JsonKey(fromJson: _parseString)  String image, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _parseInt)  int id, @JsonKey(name: 'user_id')  dynamic userId, @JsonKey(name: 'parent_id')  dynamic parentId, @JsonKey(fromJson: _parseString)  String name, @JsonKey(fromJson: _parseString)  String slug, @JsonKey(fromJson: _parseString)  String description, @JsonKey(fromJson: _parseStringList)  List<String> features, @JsonKey(fromJson: _parseString)  String image, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt)  $default,) {final _that = this;
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: _parseInt)  int id, @JsonKey(name: 'user_id')  dynamic userId, @JsonKey(name: 'parent_id')  dynamic parentId, @JsonKey(fromJson: _parseString)  String name, @JsonKey(fromJson: _parseString)  String slug, @JsonKey(fromJson: _parseString)  String description, @JsonKey(fromJson: _parseStringList)  List<String> features, @JsonKey(fromJson: _parseString)  String image, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _Category() when $default != null:
return $default(_that.id,_that.userId,_that.parentId,_that.name,_that.slug,_that.description,_that.features,_that.image,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Category implements Category {
  const _Category({@JsonKey(fromJson: _parseInt) required this.id, @JsonKey(name: 'user_id') this.userId, @JsonKey(name: 'parent_id') this.parentId, @JsonKey(fromJson: _parseString) required this.name, @JsonKey(fromJson: _parseString) required this.slug, @JsonKey(fromJson: _parseString) required this.description, @JsonKey(fromJson: _parseStringList) required final  List<String> features, @JsonKey(fromJson: _parseString) required this.image, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'updated_at') required this.updatedAt}): _features = features;
  factory _Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);

@override@JsonKey(fromJson: _parseInt) final  int id;
@override@JsonKey(name: 'user_id') final  dynamic userId;
@override@JsonKey(name: 'parent_id') final  dynamic parentId;
@override@JsonKey(fromJson: _parseString) final  String name;
@override@JsonKey(fromJson: _parseString) final  String slug;
@override@JsonKey(fromJson: _parseString) final  String description;
 final  List<String> _features;
@override@JsonKey(fromJson: _parseStringList) List<String> get features {
  if (_features is EqualUnmodifiableListView) return _features;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_features);
}

@override@JsonKey(fromJson: _parseString) final  String image;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime updatedAt;

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
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Category&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other.userId, userId)&&const DeepCollectionEquality().equals(other.parentId, parentId)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._features, _features)&&(identical(other.image, image) || other.image == image)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(userId),const DeepCollectionEquality().hash(parentId),name,slug,description,const DeepCollectionEquality().hash(_features),image,createdAt,updatedAt);

@override
String toString() {
  return 'Category(id: $id, userId: $userId, parentId: $parentId, name: $name, slug: $slug, description: $description, features: $features, image: $image, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$CategoryCopyWith<$Res> implements $CategoryCopyWith<$Res> {
  factory _$CategoryCopyWith(_Category value, $Res Function(_Category) _then) = __$CategoryCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: _parseInt) int id,@JsonKey(name: 'user_id') dynamic userId,@JsonKey(name: 'parent_id') dynamic parentId,@JsonKey(fromJson: _parseString) String name,@JsonKey(fromJson: _parseString) String slug,@JsonKey(fromJson: _parseString) String description,@JsonKey(fromJson: _parseStringList) List<String> features,@JsonKey(fromJson: _parseString) String image,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = freezed,Object? parentId = freezed,Object? name = null,Object? slug = null,Object? description = null,Object? features = null,Object? image = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_Category(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as dynamic,parentId: freezed == parentId ? _self.parentId : parentId // ignore: cast_nullable_to_non_nullable
as dynamic,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,features: null == features ? _self._features : features // ignore: cast_nullable_to_non_nullable
as List<String>,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}


/// @nodoc
mixin _$Listing {

@JsonKey(fromJson: _parseNullableString) String? get id;@JsonKey(name: 'user_id', fromJson: _parseNullableString) String? get userId;@JsonKey(name: 'country_id') dynamic get countryId;@JsonKey(name: 'brand_model_id', fromJson: _parseNullableInt) int? get brandModelId;@JsonKey(name: 'brand_id', fromJson: _parseNullableInt) int? get brandId;@JsonKey(name: 'category_id', fromJson: _parseNullableInt) int? get categoryId;@JsonKey(fromJson: _parseNullableString) String? get name;@JsonKey(fromJson: _parseNullableString) String? get year;@JsonKey(fromJson: _parseNullableString) String? get slug;@JsonKey(fromJson: _parseNullableString) String? get description;@JsonKey(fromJson: _parseStringList) List<String>? get images;@JsonKey(fromJson: _parseNullableString) String? get location;@JsonKey(name: 'serial_number') dynamic get serialNumber; dynamic get condition;@JsonKey(name: 'steer_position', fromJson: _parseNullableString) String? get steerPosition;@JsonKey(name: 'engine_capacity') dynamic get engineCapacity; dynamic get transmission; dynamic get color;@JsonKey(name: 'build_type') dynamic get buildType;@JsonKey(name: 'number_of_passengers') dynamic get numberOfPassengers; List<dynamic>? get features; dynamic get status;@JsonKey(fromJson: _parseNullableString) String? get price; dynamic get mileage; dynamic get warranty;@JsonKey(name: 'warranty_expiration') dynamic get warrantyExpiration;@JsonKey(name: 'deleted_at') dynamic get deletedAt;@JsonKey(name: 'created_at') DateTime? get createdAt;@JsonKey(name: 'updated_at') DateTime? get updatedAt; dynamic get Height; dynamic get VIN; Category? get category;@JsonKey(name: 'is_promoted') bool? get isPromoted;
/// Create a copy of Listing
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListingCopyWith<Listing> get copyWith => _$ListingCopyWithImpl<Listing>(this as Listing, _$identity);

  /// Serializes this Listing to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Listing&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&const DeepCollectionEquality().equals(other.countryId, countryId)&&(identical(other.brandModelId, brandModelId) || other.brandModelId == brandModelId)&&(identical(other.brandId, brandId) || other.brandId == brandId)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.name, name) || other.name == name)&&(identical(other.year, year) || other.year == year)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.images, images)&&(identical(other.location, location) || other.location == location)&&const DeepCollectionEquality().equals(other.serialNumber, serialNumber)&&const DeepCollectionEquality().equals(other.condition, condition)&&(identical(other.steerPosition, steerPosition) || other.steerPosition == steerPosition)&&const DeepCollectionEquality().equals(other.engineCapacity, engineCapacity)&&const DeepCollectionEquality().equals(other.transmission, transmission)&&const DeepCollectionEquality().equals(other.color, color)&&const DeepCollectionEquality().equals(other.buildType, buildType)&&const DeepCollectionEquality().equals(other.numberOfPassengers, numberOfPassengers)&&const DeepCollectionEquality().equals(other.features, features)&&const DeepCollectionEquality().equals(other.status, status)&&(identical(other.price, price) || other.price == price)&&const DeepCollectionEquality().equals(other.mileage, mileage)&&const DeepCollectionEquality().equals(other.warranty, warranty)&&const DeepCollectionEquality().equals(other.warrantyExpiration, warrantyExpiration)&&const DeepCollectionEquality().equals(other.deletedAt, deletedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other.Height, Height)&&const DeepCollectionEquality().equals(other.VIN, VIN)&&(identical(other.category, category) || other.category == category)&&(identical(other.isPromoted, isPromoted) || other.isPromoted == isPromoted));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,userId,const DeepCollectionEquality().hash(countryId),brandModelId,brandId,categoryId,name,year,slug,description,const DeepCollectionEquality().hash(images),location,const DeepCollectionEquality().hash(serialNumber),const DeepCollectionEquality().hash(condition),steerPosition,const DeepCollectionEquality().hash(engineCapacity),const DeepCollectionEquality().hash(transmission),const DeepCollectionEquality().hash(color),const DeepCollectionEquality().hash(buildType),const DeepCollectionEquality().hash(numberOfPassengers),const DeepCollectionEquality().hash(features),const DeepCollectionEquality().hash(status),price,const DeepCollectionEquality().hash(mileage),const DeepCollectionEquality().hash(warranty),const DeepCollectionEquality().hash(warrantyExpiration),const DeepCollectionEquality().hash(deletedAt),createdAt,updatedAt,const DeepCollectionEquality().hash(Height),const DeepCollectionEquality().hash(VIN),category,isPromoted]);

@override
String toString() {
  return 'Listing(id: $id, userId: $userId, countryId: $countryId, brandModelId: $brandModelId, brandId: $brandId, categoryId: $categoryId, name: $name, year: $year, slug: $slug, description: $description, images: $images, location: $location, serialNumber: $serialNumber, condition: $condition, steerPosition: $steerPosition, engineCapacity: $engineCapacity, transmission: $transmission, color: $color, buildType: $buildType, numberOfPassengers: $numberOfPassengers, features: $features, status: $status, price: $price, mileage: $mileage, warranty: $warranty, warrantyExpiration: $warrantyExpiration, deletedAt: $deletedAt, createdAt: $createdAt, updatedAt: $updatedAt, Height: $Height, VIN: $VIN, category: $category, isPromoted: $isPromoted)';
}


}

/// @nodoc
abstract mixin class $ListingCopyWith<$Res>  {
  factory $ListingCopyWith(Listing value, $Res Function(Listing) _then) = _$ListingCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: _parseNullableString) String? id,@JsonKey(name: 'user_id', fromJson: _parseNullableString) String? userId,@JsonKey(name: 'country_id') dynamic countryId,@JsonKey(name: 'brand_model_id', fromJson: _parseNullableInt) int? brandModelId,@JsonKey(name: 'brand_id', fromJson: _parseNullableInt) int? brandId,@JsonKey(name: 'category_id', fromJson: _parseNullableInt) int? categoryId,@JsonKey(fromJson: _parseNullableString) String? name,@JsonKey(fromJson: _parseNullableString) String? year,@JsonKey(fromJson: _parseNullableString) String? slug,@JsonKey(fromJson: _parseNullableString) String? description,@JsonKey(fromJson: _parseStringList) List<String>? images,@JsonKey(fromJson: _parseNullableString) String? location,@JsonKey(name: 'serial_number') dynamic serialNumber, dynamic condition,@JsonKey(name: 'steer_position', fromJson: _parseNullableString) String? steerPosition,@JsonKey(name: 'engine_capacity') dynamic engineCapacity, dynamic transmission, dynamic color,@JsonKey(name: 'build_type') dynamic buildType,@JsonKey(name: 'number_of_passengers') dynamic numberOfPassengers, List<dynamic>? features, dynamic status,@JsonKey(fromJson: _parseNullableString) String? price, dynamic mileage, dynamic warranty,@JsonKey(name: 'warranty_expiration') dynamic warrantyExpiration,@JsonKey(name: 'deleted_at') dynamic deletedAt,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt, dynamic Height, dynamic VIN, Category? category,@JsonKey(name: 'is_promoted') bool? isPromoted
});


$CategoryCopyWith<$Res>? get category;

}
/// @nodoc
class _$ListingCopyWithImpl<$Res>
    implements $ListingCopyWith<$Res> {
  _$ListingCopyWithImpl(this._self, this._then);

  final Listing _self;
  final $Res Function(Listing) _then;

/// Create a copy of Listing
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? userId = freezed,Object? countryId = freezed,Object? brandModelId = freezed,Object? brandId = freezed,Object? categoryId = freezed,Object? name = freezed,Object? year = freezed,Object? slug = freezed,Object? description = freezed,Object? images = freezed,Object? location = freezed,Object? serialNumber = freezed,Object? condition = freezed,Object? steerPosition = freezed,Object? engineCapacity = freezed,Object? transmission = freezed,Object? color = freezed,Object? buildType = freezed,Object? numberOfPassengers = freezed,Object? features = freezed,Object? status = freezed,Object? price = freezed,Object? mileage = freezed,Object? warranty = freezed,Object? warrantyExpiration = freezed,Object? deletedAt = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? Height = freezed,Object? VIN = freezed,Object? category = freezed,Object? isPromoted = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,countryId: freezed == countryId ? _self.countryId : countryId // ignore: cast_nullable_to_non_nullable
as dynamic,brandModelId: freezed == brandModelId ? _self.brandModelId : brandModelId // ignore: cast_nullable_to_non_nullable
as int?,brandId: freezed == brandId ? _self.brandId : brandId // ignore: cast_nullable_to_non_nullable
as int?,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,year: freezed == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as String?,slug: freezed == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,images: freezed == images ? _self.images : images // ignore: cast_nullable_to_non_nullable
as List<String>?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,serialNumber: freezed == serialNumber ? _self.serialNumber : serialNumber // ignore: cast_nullable_to_non_nullable
as dynamic,condition: freezed == condition ? _self.condition : condition // ignore: cast_nullable_to_non_nullable
as dynamic,steerPosition: freezed == steerPosition ? _self.steerPosition : steerPosition // ignore: cast_nullable_to_non_nullable
as String?,engineCapacity: freezed == engineCapacity ? _self.engineCapacity : engineCapacity // ignore: cast_nullable_to_non_nullable
as dynamic,transmission: freezed == transmission ? _self.transmission : transmission // ignore: cast_nullable_to_non_nullable
as dynamic,color: freezed == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as dynamic,buildType: freezed == buildType ? _self.buildType : buildType // ignore: cast_nullable_to_non_nullable
as dynamic,numberOfPassengers: freezed == numberOfPassengers ? _self.numberOfPassengers : numberOfPassengers // ignore: cast_nullable_to_non_nullable
as dynamic,features: freezed == features ? _self.features : features // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as dynamic,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as String?,mileage: freezed == mileage ? _self.mileage : mileage // ignore: cast_nullable_to_non_nullable
as dynamic,warranty: freezed == warranty ? _self.warranty : warranty // ignore: cast_nullable_to_non_nullable
as dynamic,warrantyExpiration: freezed == warrantyExpiration ? _self.warrantyExpiration : warrantyExpiration // ignore: cast_nullable_to_non_nullable
as dynamic,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as dynamic,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,Height: freezed == Height ? _self.Height : Height // ignore: cast_nullable_to_non_nullable
as dynamic,VIN: freezed == VIN ? _self.VIN : VIN // ignore: cast_nullable_to_non_nullable
as dynamic,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as Category?,isPromoted: freezed == isPromoted ? _self.isPromoted : isPromoted // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}
/// Create a copy of Listing
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
}
}


/// Adds pattern-matching-related methods to [Listing].
extension ListingPatterns on Listing {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Listing value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Listing() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Listing value)  $default,){
final _that = this;
switch (_that) {
case _Listing():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Listing value)?  $default,){
final _that = this;
switch (_that) {
case _Listing() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _parseNullableString)  String? id, @JsonKey(name: 'user_id', fromJson: _parseNullableString)  String? userId, @JsonKey(name: 'country_id')  dynamic countryId, @JsonKey(name: 'brand_model_id', fromJson: _parseNullableInt)  int? brandModelId, @JsonKey(name: 'brand_id', fromJson: _parseNullableInt)  int? brandId, @JsonKey(name: 'category_id', fromJson: _parseNullableInt)  int? categoryId, @JsonKey(fromJson: _parseNullableString)  String? name, @JsonKey(fromJson: _parseNullableString)  String? year, @JsonKey(fromJson: _parseNullableString)  String? slug, @JsonKey(fromJson: _parseNullableString)  String? description, @JsonKey(fromJson: _parseStringList)  List<String>? images, @JsonKey(fromJson: _parseNullableString)  String? location, @JsonKey(name: 'serial_number')  dynamic serialNumber,  dynamic condition, @JsonKey(name: 'steer_position', fromJson: _parseNullableString)  String? steerPosition, @JsonKey(name: 'engine_capacity')  dynamic engineCapacity,  dynamic transmission,  dynamic color, @JsonKey(name: 'build_type')  dynamic buildType, @JsonKey(name: 'number_of_passengers')  dynamic numberOfPassengers,  List<dynamic>? features,  dynamic status, @JsonKey(fromJson: _parseNullableString)  String? price,  dynamic mileage,  dynamic warranty, @JsonKey(name: 'warranty_expiration')  dynamic warrantyExpiration, @JsonKey(name: 'deleted_at')  dynamic deletedAt, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt,  dynamic Height,  dynamic VIN,  Category? category, @JsonKey(name: 'is_promoted')  bool? isPromoted)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Listing() when $default != null:
return $default(_that.id,_that.userId,_that.countryId,_that.brandModelId,_that.brandId,_that.categoryId,_that.name,_that.year,_that.slug,_that.description,_that.images,_that.location,_that.serialNumber,_that.condition,_that.steerPosition,_that.engineCapacity,_that.transmission,_that.color,_that.buildType,_that.numberOfPassengers,_that.features,_that.status,_that.price,_that.mileage,_that.warranty,_that.warrantyExpiration,_that.deletedAt,_that.createdAt,_that.updatedAt,_that.Height,_that.VIN,_that.category,_that.isPromoted);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _parseNullableString)  String? id, @JsonKey(name: 'user_id', fromJson: _parseNullableString)  String? userId, @JsonKey(name: 'country_id')  dynamic countryId, @JsonKey(name: 'brand_model_id', fromJson: _parseNullableInt)  int? brandModelId, @JsonKey(name: 'brand_id', fromJson: _parseNullableInt)  int? brandId, @JsonKey(name: 'category_id', fromJson: _parseNullableInt)  int? categoryId, @JsonKey(fromJson: _parseNullableString)  String? name, @JsonKey(fromJson: _parseNullableString)  String? year, @JsonKey(fromJson: _parseNullableString)  String? slug, @JsonKey(fromJson: _parseNullableString)  String? description, @JsonKey(fromJson: _parseStringList)  List<String>? images, @JsonKey(fromJson: _parseNullableString)  String? location, @JsonKey(name: 'serial_number')  dynamic serialNumber,  dynamic condition, @JsonKey(name: 'steer_position', fromJson: _parseNullableString)  String? steerPosition, @JsonKey(name: 'engine_capacity')  dynamic engineCapacity,  dynamic transmission,  dynamic color, @JsonKey(name: 'build_type')  dynamic buildType, @JsonKey(name: 'number_of_passengers')  dynamic numberOfPassengers,  List<dynamic>? features,  dynamic status, @JsonKey(fromJson: _parseNullableString)  String? price,  dynamic mileage,  dynamic warranty, @JsonKey(name: 'warranty_expiration')  dynamic warrantyExpiration, @JsonKey(name: 'deleted_at')  dynamic deletedAt, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt,  dynamic Height,  dynamic VIN,  Category? category, @JsonKey(name: 'is_promoted')  bool? isPromoted)  $default,) {final _that = this;
switch (_that) {
case _Listing():
return $default(_that.id,_that.userId,_that.countryId,_that.brandModelId,_that.brandId,_that.categoryId,_that.name,_that.year,_that.slug,_that.description,_that.images,_that.location,_that.serialNumber,_that.condition,_that.steerPosition,_that.engineCapacity,_that.transmission,_that.color,_that.buildType,_that.numberOfPassengers,_that.features,_that.status,_that.price,_that.mileage,_that.warranty,_that.warrantyExpiration,_that.deletedAt,_that.createdAt,_that.updatedAt,_that.Height,_that.VIN,_that.category,_that.isPromoted);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: _parseNullableString)  String? id, @JsonKey(name: 'user_id', fromJson: _parseNullableString)  String? userId, @JsonKey(name: 'country_id')  dynamic countryId, @JsonKey(name: 'brand_model_id', fromJson: _parseNullableInt)  int? brandModelId, @JsonKey(name: 'brand_id', fromJson: _parseNullableInt)  int? brandId, @JsonKey(name: 'category_id', fromJson: _parseNullableInt)  int? categoryId, @JsonKey(fromJson: _parseNullableString)  String? name, @JsonKey(fromJson: _parseNullableString)  String? year, @JsonKey(fromJson: _parseNullableString)  String? slug, @JsonKey(fromJson: _parseNullableString)  String? description, @JsonKey(fromJson: _parseStringList)  List<String>? images, @JsonKey(fromJson: _parseNullableString)  String? location, @JsonKey(name: 'serial_number')  dynamic serialNumber,  dynamic condition, @JsonKey(name: 'steer_position', fromJson: _parseNullableString)  String? steerPosition, @JsonKey(name: 'engine_capacity')  dynamic engineCapacity,  dynamic transmission,  dynamic color, @JsonKey(name: 'build_type')  dynamic buildType, @JsonKey(name: 'number_of_passengers')  dynamic numberOfPassengers,  List<dynamic>? features,  dynamic status, @JsonKey(fromJson: _parseNullableString)  String? price,  dynamic mileage,  dynamic warranty, @JsonKey(name: 'warranty_expiration')  dynamic warrantyExpiration, @JsonKey(name: 'deleted_at')  dynamic deletedAt, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt,  dynamic Height,  dynamic VIN,  Category? category, @JsonKey(name: 'is_promoted')  bool? isPromoted)?  $default,) {final _that = this;
switch (_that) {
case _Listing() when $default != null:
return $default(_that.id,_that.userId,_that.countryId,_that.brandModelId,_that.brandId,_that.categoryId,_that.name,_that.year,_that.slug,_that.description,_that.images,_that.location,_that.serialNumber,_that.condition,_that.steerPosition,_that.engineCapacity,_that.transmission,_that.color,_that.buildType,_that.numberOfPassengers,_that.features,_that.status,_that.price,_that.mileage,_that.warranty,_that.warrantyExpiration,_that.deletedAt,_that.createdAt,_that.updatedAt,_that.Height,_that.VIN,_that.category,_that.isPromoted);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Listing implements Listing {
  const _Listing({@JsonKey(fromJson: _parseNullableString) this.id, @JsonKey(name: 'user_id', fromJson: _parseNullableString) this.userId, @JsonKey(name: 'country_id') this.countryId, @JsonKey(name: 'brand_model_id', fromJson: _parseNullableInt) this.brandModelId, @JsonKey(name: 'brand_id', fromJson: _parseNullableInt) this.brandId, @JsonKey(name: 'category_id', fromJson: _parseNullableInt) this.categoryId, @JsonKey(fromJson: _parseNullableString) this.name, @JsonKey(fromJson: _parseNullableString) this.year, @JsonKey(fromJson: _parseNullableString) this.slug, @JsonKey(fromJson: _parseNullableString) this.description, @JsonKey(fromJson: _parseStringList) final  List<String>? images, @JsonKey(fromJson: _parseNullableString) this.location, @JsonKey(name: 'serial_number') this.serialNumber, this.condition, @JsonKey(name: 'steer_position', fromJson: _parseNullableString) this.steerPosition, @JsonKey(name: 'engine_capacity') this.engineCapacity, this.transmission, this.color, @JsonKey(name: 'build_type') this.buildType, @JsonKey(name: 'number_of_passengers') this.numberOfPassengers, final  List<dynamic>? features, this.status, @JsonKey(fromJson: _parseNullableString) this.price, this.mileage, this.warranty, @JsonKey(name: 'warranty_expiration') this.warrantyExpiration, @JsonKey(name: 'deleted_at') this.deletedAt, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt, this.Height, this.VIN, this.category, @JsonKey(name: 'is_promoted') this.isPromoted}): _images = images,_features = features;
  factory _Listing.fromJson(Map<String, dynamic> json) => _$ListingFromJson(json);

@override@JsonKey(fromJson: _parseNullableString) final  String? id;
@override@JsonKey(name: 'user_id', fromJson: _parseNullableString) final  String? userId;
@override@JsonKey(name: 'country_id') final  dynamic countryId;
@override@JsonKey(name: 'brand_model_id', fromJson: _parseNullableInt) final  int? brandModelId;
@override@JsonKey(name: 'brand_id', fromJson: _parseNullableInt) final  int? brandId;
@override@JsonKey(name: 'category_id', fromJson: _parseNullableInt) final  int? categoryId;
@override@JsonKey(fromJson: _parseNullableString) final  String? name;
@override@JsonKey(fromJson: _parseNullableString) final  String? year;
@override@JsonKey(fromJson: _parseNullableString) final  String? slug;
@override@JsonKey(fromJson: _parseNullableString) final  String? description;
 final  List<String>? _images;
@override@JsonKey(fromJson: _parseStringList) List<String>? get images {
  final value = _images;
  if (value == null) return null;
  if (_images is EqualUnmodifiableListView) return _images;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey(fromJson: _parseNullableString) final  String? location;
@override@JsonKey(name: 'serial_number') final  dynamic serialNumber;
@override final  dynamic condition;
@override@JsonKey(name: 'steer_position', fromJson: _parseNullableString) final  String? steerPosition;
@override@JsonKey(name: 'engine_capacity') final  dynamic engineCapacity;
@override final  dynamic transmission;
@override final  dynamic color;
@override@JsonKey(name: 'build_type') final  dynamic buildType;
@override@JsonKey(name: 'number_of_passengers') final  dynamic numberOfPassengers;
 final  List<dynamic>? _features;
@override List<dynamic>? get features {
  final value = _features;
  if (value == null) return null;
  if (_features is EqualUnmodifiableListView) return _features;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  dynamic status;
@override@JsonKey(fromJson: _parseNullableString) final  String? price;
@override final  dynamic mileage;
@override final  dynamic warranty;
@override@JsonKey(name: 'warranty_expiration') final  dynamic warrantyExpiration;
@override@JsonKey(name: 'deleted_at') final  dynamic deletedAt;
@override@JsonKey(name: 'created_at') final  DateTime? createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime? updatedAt;
@override final  dynamic Height;
@override final  dynamic VIN;
@override final  Category? category;
@override@JsonKey(name: 'is_promoted') final  bool? isPromoted;

/// Create a copy of Listing
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ListingCopyWith<_Listing> get copyWith => __$ListingCopyWithImpl<_Listing>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ListingToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Listing&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&const DeepCollectionEquality().equals(other.countryId, countryId)&&(identical(other.brandModelId, brandModelId) || other.brandModelId == brandModelId)&&(identical(other.brandId, brandId) || other.brandId == brandId)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.name, name) || other.name == name)&&(identical(other.year, year) || other.year == year)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._images, _images)&&(identical(other.location, location) || other.location == location)&&const DeepCollectionEquality().equals(other.serialNumber, serialNumber)&&const DeepCollectionEquality().equals(other.condition, condition)&&(identical(other.steerPosition, steerPosition) || other.steerPosition == steerPosition)&&const DeepCollectionEquality().equals(other.engineCapacity, engineCapacity)&&const DeepCollectionEquality().equals(other.transmission, transmission)&&const DeepCollectionEquality().equals(other.color, color)&&const DeepCollectionEquality().equals(other.buildType, buildType)&&const DeepCollectionEquality().equals(other.numberOfPassengers, numberOfPassengers)&&const DeepCollectionEquality().equals(other._features, _features)&&const DeepCollectionEquality().equals(other.status, status)&&(identical(other.price, price) || other.price == price)&&const DeepCollectionEquality().equals(other.mileage, mileage)&&const DeepCollectionEquality().equals(other.warranty, warranty)&&const DeepCollectionEquality().equals(other.warrantyExpiration, warrantyExpiration)&&const DeepCollectionEquality().equals(other.deletedAt, deletedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other.Height, Height)&&const DeepCollectionEquality().equals(other.VIN, VIN)&&(identical(other.category, category) || other.category == category)&&(identical(other.isPromoted, isPromoted) || other.isPromoted == isPromoted));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,userId,const DeepCollectionEquality().hash(countryId),brandModelId,brandId,categoryId,name,year,slug,description,const DeepCollectionEquality().hash(_images),location,const DeepCollectionEquality().hash(serialNumber),const DeepCollectionEquality().hash(condition),steerPosition,const DeepCollectionEquality().hash(engineCapacity),const DeepCollectionEquality().hash(transmission),const DeepCollectionEquality().hash(color),const DeepCollectionEquality().hash(buildType),const DeepCollectionEquality().hash(numberOfPassengers),const DeepCollectionEquality().hash(_features),const DeepCollectionEquality().hash(status),price,const DeepCollectionEquality().hash(mileage),const DeepCollectionEquality().hash(warranty),const DeepCollectionEquality().hash(warrantyExpiration),const DeepCollectionEquality().hash(deletedAt),createdAt,updatedAt,const DeepCollectionEquality().hash(Height),const DeepCollectionEquality().hash(VIN),category,isPromoted]);

@override
String toString() {
  return 'Listing(id: $id, userId: $userId, countryId: $countryId, brandModelId: $brandModelId, brandId: $brandId, categoryId: $categoryId, name: $name, year: $year, slug: $slug, description: $description, images: $images, location: $location, serialNumber: $serialNumber, condition: $condition, steerPosition: $steerPosition, engineCapacity: $engineCapacity, transmission: $transmission, color: $color, buildType: $buildType, numberOfPassengers: $numberOfPassengers, features: $features, status: $status, price: $price, mileage: $mileage, warranty: $warranty, warrantyExpiration: $warrantyExpiration, deletedAt: $deletedAt, createdAt: $createdAt, updatedAt: $updatedAt, Height: $Height, VIN: $VIN, category: $category, isPromoted: $isPromoted)';
}


}

/// @nodoc
abstract mixin class _$ListingCopyWith<$Res> implements $ListingCopyWith<$Res> {
  factory _$ListingCopyWith(_Listing value, $Res Function(_Listing) _then) = __$ListingCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: _parseNullableString) String? id,@JsonKey(name: 'user_id', fromJson: _parseNullableString) String? userId,@JsonKey(name: 'country_id') dynamic countryId,@JsonKey(name: 'brand_model_id', fromJson: _parseNullableInt) int? brandModelId,@JsonKey(name: 'brand_id', fromJson: _parseNullableInt) int? brandId,@JsonKey(name: 'category_id', fromJson: _parseNullableInt) int? categoryId,@JsonKey(fromJson: _parseNullableString) String? name,@JsonKey(fromJson: _parseNullableString) String? year,@JsonKey(fromJson: _parseNullableString) String? slug,@JsonKey(fromJson: _parseNullableString) String? description,@JsonKey(fromJson: _parseStringList) List<String>? images,@JsonKey(fromJson: _parseNullableString) String? location,@JsonKey(name: 'serial_number') dynamic serialNumber, dynamic condition,@JsonKey(name: 'steer_position', fromJson: _parseNullableString) String? steerPosition,@JsonKey(name: 'engine_capacity') dynamic engineCapacity, dynamic transmission, dynamic color,@JsonKey(name: 'build_type') dynamic buildType,@JsonKey(name: 'number_of_passengers') dynamic numberOfPassengers, List<dynamic>? features, dynamic status,@JsonKey(fromJson: _parseNullableString) String? price, dynamic mileage, dynamic warranty,@JsonKey(name: 'warranty_expiration') dynamic warrantyExpiration,@JsonKey(name: 'deleted_at') dynamic deletedAt,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt, dynamic Height, dynamic VIN, Category? category,@JsonKey(name: 'is_promoted') bool? isPromoted
});


@override $CategoryCopyWith<$Res>? get category;

}
/// @nodoc
class __$ListingCopyWithImpl<$Res>
    implements _$ListingCopyWith<$Res> {
  __$ListingCopyWithImpl(this._self, this._then);

  final _Listing _self;
  final $Res Function(_Listing) _then;

/// Create a copy of Listing
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? userId = freezed,Object? countryId = freezed,Object? brandModelId = freezed,Object? brandId = freezed,Object? categoryId = freezed,Object? name = freezed,Object? year = freezed,Object? slug = freezed,Object? description = freezed,Object? images = freezed,Object? location = freezed,Object? serialNumber = freezed,Object? condition = freezed,Object? steerPosition = freezed,Object? engineCapacity = freezed,Object? transmission = freezed,Object? color = freezed,Object? buildType = freezed,Object? numberOfPassengers = freezed,Object? features = freezed,Object? status = freezed,Object? price = freezed,Object? mileage = freezed,Object? warranty = freezed,Object? warrantyExpiration = freezed,Object? deletedAt = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? Height = freezed,Object? VIN = freezed,Object? category = freezed,Object? isPromoted = freezed,}) {
  return _then(_Listing(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,countryId: freezed == countryId ? _self.countryId : countryId // ignore: cast_nullable_to_non_nullable
as dynamic,brandModelId: freezed == brandModelId ? _self.brandModelId : brandModelId // ignore: cast_nullable_to_non_nullable
as int?,brandId: freezed == brandId ? _self.brandId : brandId // ignore: cast_nullable_to_non_nullable
as int?,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,year: freezed == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as String?,slug: freezed == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,images: freezed == images ? _self._images : images // ignore: cast_nullable_to_non_nullable
as List<String>?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,serialNumber: freezed == serialNumber ? _self.serialNumber : serialNumber // ignore: cast_nullable_to_non_nullable
as dynamic,condition: freezed == condition ? _self.condition : condition // ignore: cast_nullable_to_non_nullable
as dynamic,steerPosition: freezed == steerPosition ? _self.steerPosition : steerPosition // ignore: cast_nullable_to_non_nullable
as String?,engineCapacity: freezed == engineCapacity ? _self.engineCapacity : engineCapacity // ignore: cast_nullable_to_non_nullable
as dynamic,transmission: freezed == transmission ? _self.transmission : transmission // ignore: cast_nullable_to_non_nullable
as dynamic,color: freezed == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as dynamic,buildType: freezed == buildType ? _self.buildType : buildType // ignore: cast_nullable_to_non_nullable
as dynamic,numberOfPassengers: freezed == numberOfPassengers ? _self.numberOfPassengers : numberOfPassengers // ignore: cast_nullable_to_non_nullable
as dynamic,features: freezed == features ? _self._features : features // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as dynamic,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as String?,mileage: freezed == mileage ? _self.mileage : mileage // ignore: cast_nullable_to_non_nullable
as dynamic,warranty: freezed == warranty ? _self.warranty : warranty // ignore: cast_nullable_to_non_nullable
as dynamic,warrantyExpiration: freezed == warrantyExpiration ? _self.warrantyExpiration : warrantyExpiration // ignore: cast_nullable_to_non_nullable
as dynamic,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as dynamic,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,Height: freezed == Height ? _self.Height : Height // ignore: cast_nullable_to_non_nullable
as dynamic,VIN: freezed == VIN ? _self.VIN : VIN // ignore: cast_nullable_to_non_nullable
as dynamic,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as Category?,isPromoted: freezed == isPromoted ? _self.isPromoted : isPromoted // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

/// Create a copy of Listing
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
}
}


/// @nodoc
mixin _$ListingResponse {

 List<Listing> get data;
/// Create a copy of ListingResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListingResponseCopyWith<ListingResponse> get copyWith => _$ListingResponseCopyWithImpl<ListingResponse>(this as ListingResponse, _$identity);

  /// Serializes this ListingResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListingResponse&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'ListingResponse(data: $data)';
}


}

/// @nodoc
abstract mixin class $ListingResponseCopyWith<$Res>  {
  factory $ListingResponseCopyWith(ListingResponse value, $Res Function(ListingResponse) _then) = _$ListingResponseCopyWithImpl;
@useResult
$Res call({
 List<Listing> data
});




}
/// @nodoc
class _$ListingResponseCopyWithImpl<$Res>
    implements $ListingResponseCopyWith<$Res> {
  _$ListingResponseCopyWithImpl(this._self, this._then);

  final ListingResponse _self;
  final $Res Function(ListingResponse) _then;

/// Create a copy of ListingResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = null,}) {
  return _then(_self.copyWith(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<Listing>,
  ));
}

}


/// Adds pattern-matching-related methods to [ListingResponse].
extension ListingResponsePatterns on ListingResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ListingResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ListingResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ListingResponse value)  $default,){
final _that = this;
switch (_that) {
case _ListingResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ListingResponse value)?  $default,){
final _that = this;
switch (_that) {
case _ListingResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Listing> data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ListingResponse() when $default != null:
return $default(_that.data);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Listing> data)  $default,) {final _that = this;
switch (_that) {
case _ListingResponse():
return $default(_that.data);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Listing> data)?  $default,) {final _that = this;
switch (_that) {
case _ListingResponse() when $default != null:
return $default(_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ListingResponse implements ListingResponse {
  const _ListingResponse({required final  List<Listing> data}): _data = data;
  factory _ListingResponse.fromJson(Map<String, dynamic> json) => _$ListingResponseFromJson(json);

 final  List<Listing> _data;
@override List<Listing> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}


/// Create a copy of ListingResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ListingResponseCopyWith<_ListingResponse> get copyWith => __$ListingResponseCopyWithImpl<_ListingResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ListingResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ListingResponse&&const DeepCollectionEquality().equals(other._data, _data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'ListingResponse(data: $data)';
}


}

/// @nodoc
abstract mixin class _$ListingResponseCopyWith<$Res> implements $ListingResponseCopyWith<$Res> {
  factory _$ListingResponseCopyWith(_ListingResponse value, $Res Function(_ListingResponse) _then) = __$ListingResponseCopyWithImpl;
@override @useResult
$Res call({
 List<Listing> data
});




}
/// @nodoc
class __$ListingResponseCopyWithImpl<$Res>
    implements _$ListingResponseCopyWith<$Res> {
  __$ListingResponseCopyWithImpl(this._self, this._then);

  final _ListingResponse _self;
  final $Res Function(_ListingResponse) _then;

/// Create a copy of ListingResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(_ListingResponse(
data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<Listing>,
  ));
}


}


/// @nodoc
mixin _$ErrorResponse {

@JsonKey(fromJson: _parseNullableString) String? get message;@JsonKey(fromJson: _parseNullableString) String? get error;@JsonKey(name: 'error_description', fromJson: _parseNullableString) String? get errorDescription;
/// Create a copy of ErrorResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorResponseCopyWith<ErrorResponse> get copyWith => _$ErrorResponseCopyWithImpl<ErrorResponse>(this as ErrorResponse, _$identity);

  /// Serializes this ErrorResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ErrorResponse&&(identical(other.message, message) || other.message == message)&&(identical(other.error, error) || other.error == error)&&(identical(other.errorDescription, errorDescription) || other.errorDescription == errorDescription));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,message,error,errorDescription);

@override
String toString() {
  return 'ErrorResponse(message: $message, error: $error, errorDescription: $errorDescription)';
}


}

/// @nodoc
abstract mixin class $ErrorResponseCopyWith<$Res>  {
  factory $ErrorResponseCopyWith(ErrorResponse value, $Res Function(ErrorResponse) _then) = _$ErrorResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: _parseNullableString) String? message,@JsonKey(fromJson: _parseNullableString) String? error,@JsonKey(name: 'error_description', fromJson: _parseNullableString) String? errorDescription
});




}
/// @nodoc
class _$ErrorResponseCopyWithImpl<$Res>
    implements $ErrorResponseCopyWith<$Res> {
  _$ErrorResponseCopyWithImpl(this._self, this._then);

  final ErrorResponse _self;
  final $Res Function(ErrorResponse) _then;

/// Create a copy of ErrorResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? message = freezed,Object? error = freezed,Object? errorDescription = freezed,}) {
  return _then(_self.copyWith(
message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,errorDescription: freezed == errorDescription ? _self.errorDescription : errorDescription // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ErrorResponse].
extension ErrorResponsePatterns on ErrorResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ErrorResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ErrorResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ErrorResponse value)  $default,){
final _that = this;
switch (_that) {
case _ErrorResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ErrorResponse value)?  $default,){
final _that = this;
switch (_that) {
case _ErrorResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _parseNullableString)  String? message, @JsonKey(fromJson: _parseNullableString)  String? error, @JsonKey(name: 'error_description', fromJson: _parseNullableString)  String? errorDescription)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ErrorResponse() when $default != null:
return $default(_that.message,_that.error,_that.errorDescription);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _parseNullableString)  String? message, @JsonKey(fromJson: _parseNullableString)  String? error, @JsonKey(name: 'error_description', fromJson: _parseNullableString)  String? errorDescription)  $default,) {final _that = this;
switch (_that) {
case _ErrorResponse():
return $default(_that.message,_that.error,_that.errorDescription);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: _parseNullableString)  String? message, @JsonKey(fromJson: _parseNullableString)  String? error, @JsonKey(name: 'error_description', fromJson: _parseNullableString)  String? errorDescription)?  $default,) {final _that = this;
switch (_that) {
case _ErrorResponse() when $default != null:
return $default(_that.message,_that.error,_that.errorDescription);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ErrorResponse implements ErrorResponse {
  const _ErrorResponse({@JsonKey(fromJson: _parseNullableString) this.message, @JsonKey(fromJson: _parseNullableString) this.error, @JsonKey(name: 'error_description', fromJson: _parseNullableString) this.errorDescription});
  factory _ErrorResponse.fromJson(Map<String, dynamic> json) => _$ErrorResponseFromJson(json);

@override@JsonKey(fromJson: _parseNullableString) final  String? message;
@override@JsonKey(fromJson: _parseNullableString) final  String? error;
@override@JsonKey(name: 'error_description', fromJson: _parseNullableString) final  String? errorDescription;

/// Create a copy of ErrorResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorResponseCopyWith<_ErrorResponse> get copyWith => __$ErrorResponseCopyWithImpl<_ErrorResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ErrorResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ErrorResponse&&(identical(other.message, message) || other.message == message)&&(identical(other.error, error) || other.error == error)&&(identical(other.errorDescription, errorDescription) || other.errorDescription == errorDescription));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,message,error,errorDescription);

@override
String toString() {
  return 'ErrorResponse(message: $message, error: $error, errorDescription: $errorDescription)';
}


}

/// @nodoc
abstract mixin class _$ErrorResponseCopyWith<$Res> implements $ErrorResponseCopyWith<$Res> {
  factory _$ErrorResponseCopyWith(_ErrorResponse value, $Res Function(_ErrorResponse) _then) = __$ErrorResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: _parseNullableString) String? message,@JsonKey(fromJson: _parseNullableString) String? error,@JsonKey(name: 'error_description', fromJson: _parseNullableString) String? errorDescription
});




}
/// @nodoc
class __$ErrorResponseCopyWithImpl<$Res>
    implements _$ErrorResponseCopyWith<$Res> {
  __$ErrorResponseCopyWithImpl(this._self, this._then);

  final _ErrorResponse _self;
  final $Res Function(_ErrorResponse) _then;

/// Create a copy of ErrorResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = freezed,Object? error = freezed,Object? errorDescription = freezed,}) {
  return _then(_ErrorResponse(
message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,errorDescription: freezed == errorDescription ? _self.errorDescription : errorDescription // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$ApiResponse<T> {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApiResponse<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ApiResponse<$T>()';
}


}

/// @nodoc
class $ApiResponseCopyWith<T,$Res>  {
$ApiResponseCopyWith(ApiResponse<T> _, $Res Function(ApiResponse<T>) __);
}


/// Adds pattern-matching-related methods to [ApiResponse].
extension ApiResponsePatterns<T> on ApiResponse<T> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Success<T> value)?  success,TResult Function( Unauthorized<T> value)?  unauthorized,TResult Function( NotFound<T> value)?  notFound,TResult Function( Error<T> value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Success() when success != null:
return success(_that);case Unauthorized() when unauthorized != null:
return unauthorized(_that);case NotFound() when notFound != null:
return notFound(_that);case Error() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Success<T> value)  success,required TResult Function( Unauthorized<T> value)  unauthorized,required TResult Function( NotFound<T> value)  notFound,required TResult Function( Error<T> value)  error,}){
final _that = this;
switch (_that) {
case Success():
return success(_that);case Unauthorized():
return unauthorized(_that);case NotFound():
return notFound(_that);case Error():
return error(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Success<T> value)?  success,TResult? Function( Unauthorized<T> value)?  unauthorized,TResult? Function( NotFound<T> value)?  notFound,TResult? Function( Error<T> value)?  error,}){
final _that = this;
switch (_that) {
case Success() when success != null:
return success(_that);case Unauthorized() when unauthorized != null:
return unauthorized(_that);case NotFound() when notFound != null:
return notFound(_that);case Error() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( T data)?  success,TResult Function( String message)?  unauthorized,TResult Function( String message)?  notFound,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Success() when success != null:
return success(_that.data);case Unauthorized() when unauthorized != null:
return unauthorized(_that.message);case NotFound() when notFound != null:
return notFound(_that.message);case Error() when error != null:
return error(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( T data)  success,required TResult Function( String message)  unauthorized,required TResult Function( String message)  notFound,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case Success():
return success(_that.data);case Unauthorized():
return unauthorized(_that.message);case NotFound():
return notFound(_that.message);case Error():
return error(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( T data)?  success,TResult? Function( String message)?  unauthorized,TResult? Function( String message)?  notFound,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case Success() when success != null:
return success(_that.data);case Unauthorized() when unauthorized != null:
return unauthorized(_that.message);case NotFound() when notFound != null:
return notFound(_that.message);case Error() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class Success<T> implements ApiResponse<T> {
  const Success(this.data);
  

 final  T data;

/// Create a copy of ApiResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SuccessCopyWith<T, Success<T>> get copyWith => _$SuccessCopyWithImpl<T, Success<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Success<T>&&const DeepCollectionEquality().equals(other.data, data));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'ApiResponse<$T>.success(data: $data)';
}


}

/// @nodoc
abstract mixin class $SuccessCopyWith<T,$Res> implements $ApiResponseCopyWith<T, $Res> {
  factory $SuccessCopyWith(Success<T> value, $Res Function(Success<T>) _then) = _$SuccessCopyWithImpl;
@useResult
$Res call({
 T data
});




}
/// @nodoc
class _$SuccessCopyWithImpl<T,$Res>
    implements $SuccessCopyWith<T, $Res> {
  _$SuccessCopyWithImpl(this._self, this._then);

  final Success<T> _self;
  final $Res Function(Success<T>) _then;

/// Create a copy of ApiResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = freezed,}) {
  return _then(Success<T>(
freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as T,
  ));
}


}

/// @nodoc


class Unauthorized<T> implements ApiResponse<T> {
  const Unauthorized(this.message);
  

 final  String message;

/// Create a copy of ApiResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UnauthorizedCopyWith<T, Unauthorized<T>> get copyWith => _$UnauthorizedCopyWithImpl<T, Unauthorized<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Unauthorized<T>&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ApiResponse<$T>.unauthorized(message: $message)';
}


}

/// @nodoc
abstract mixin class $UnauthorizedCopyWith<T,$Res> implements $ApiResponseCopyWith<T, $Res> {
  factory $UnauthorizedCopyWith(Unauthorized<T> value, $Res Function(Unauthorized<T>) _then) = _$UnauthorizedCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$UnauthorizedCopyWithImpl<T,$Res>
    implements $UnauthorizedCopyWith<T, $Res> {
  _$UnauthorizedCopyWithImpl(this._self, this._then);

  final Unauthorized<T> _self;
  final $Res Function(Unauthorized<T>) _then;

/// Create a copy of ApiResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(Unauthorized<T>(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class NotFound<T> implements ApiResponse<T> {
  const NotFound(this.message);
  

 final  String message;

/// Create a copy of ApiResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotFoundCopyWith<T, NotFound<T>> get copyWith => _$NotFoundCopyWithImpl<T, NotFound<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotFound<T>&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ApiResponse<$T>.notFound(message: $message)';
}


}

/// @nodoc
abstract mixin class $NotFoundCopyWith<T,$Res> implements $ApiResponseCopyWith<T, $Res> {
  factory $NotFoundCopyWith(NotFound<T> value, $Res Function(NotFound<T>) _then) = _$NotFoundCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$NotFoundCopyWithImpl<T,$Res>
    implements $NotFoundCopyWith<T, $Res> {
  _$NotFoundCopyWithImpl(this._self, this._then);

  final NotFound<T> _self;
  final $Res Function(NotFound<T>) _then;

/// Create a copy of ApiResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(NotFound<T>(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class Error<T> implements ApiResponse<T> {
  const Error(this.message);
  

 final  String message;

/// Create a copy of ApiResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorCopyWith<T, Error<T>> get copyWith => _$ErrorCopyWithImpl<T, Error<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Error<T>&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ApiResponse<$T>.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $ErrorCopyWith<T,$Res> implements $ApiResponseCopyWith<T, $Res> {
  factory $ErrorCopyWith(Error<T> value, $Res Function(Error<T>) _then) = _$ErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ErrorCopyWithImpl<T,$Res>
    implements $ErrorCopyWith<T, $Res> {
  _$ErrorCopyWithImpl(this._self, this._then);

  final Error<T> _self;
  final $Res Function(Error<T>) _then;

/// Create a copy of ApiResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(Error<T>(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
