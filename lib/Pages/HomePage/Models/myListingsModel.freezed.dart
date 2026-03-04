// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'myListingsModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MyListing {

@JsonKey(fromJson: _parseString) String get id;@JsonKey(name: 'user_id', fromJson: _parseInt) int get userId;@JsonKey(name: 'country_id', fromJson: _parseInt) int? get countryId;@JsonKey(name: 'brand_model_id', fromJson: _parseInt) int? get brandModelId;@JsonKey(name: 'brand_id', fromJson: _parseInt) int get brandId;@JsonKey(name: 'category_id', fromJson: _parseInt) int get categoryId;@JsonKey(fromJson: _parseString) String get name;@JsonKey(fromJson: _parseString) String get year;@JsonKey(fromJson: _parseString) String get slug;@JsonKey(fromJson: _parseString) String get description; List<String> get images;@JsonKey(fromJson: _parseString) String get location;@JsonKey(name: 'serial_number', fromJson: _parseString) String? get serialNumber;@JsonKey(fromJson: _parseString) String? get condition;@JsonKey(name: 'steer_position', fromJson: _parseString) String? get steerPosition;@JsonKey(name: 'engine_capacity', fromJson: _parseString) String? get engineCapacity;@JsonKey(fromJson: _parseString) String? get transmission;@JsonKey(fromJson: _parseString) String? get color;@JsonKey(name: 'build_type', fromJson: _parseString) String? get buildType;@JsonKey(name: 'number_of_passengers', fromJson: _parseInt) int? get numberOfPassengers; List<dynamic> get features;@JsonKey(fromJson: _parseString) String? get status;@JsonKey(fromJson: _parseString) String get price;// Use custom converter
@JsonKey(fromJson: _parseString) String? get mileage;@JsonKey(fromJson: _parseInt) int? get warranty;@JsonKey(name: 'warranty_expiration', fromJson: _parseString) String? get warrantyExpiration;@JsonKey(name: 'deleted_at', fromJson: _parseString) String? get deletedAt;@JsonKey(name: 'created_at', fromJson: _parseString) String get createdAt;@JsonKey(name: 'updated_at', fromJson: _parseString) String get updatedAt;@JsonKey(fromJson: _parseString) String? get Height;@JsonKey(fromJson: _parseString) String? get VIN; Category? get category;@JsonKey(name: 'is_promoted') bool? get isPromoted;
/// Create a copy of MyListing
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MyListingCopyWith<MyListing> get copyWith => _$MyListingCopyWithImpl<MyListing>(this as MyListing, _$identity);

  /// Serializes this MyListing to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MyListing&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.countryId, countryId) || other.countryId == countryId)&&(identical(other.brandModelId, brandModelId) || other.brandModelId == brandModelId)&&(identical(other.brandId, brandId) || other.brandId == brandId)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.name, name) || other.name == name)&&(identical(other.year, year) || other.year == year)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.images, images)&&(identical(other.location, location) || other.location == location)&&(identical(other.serialNumber, serialNumber) || other.serialNumber == serialNumber)&&(identical(other.condition, condition) || other.condition == condition)&&(identical(other.steerPosition, steerPosition) || other.steerPosition == steerPosition)&&(identical(other.engineCapacity, engineCapacity) || other.engineCapacity == engineCapacity)&&(identical(other.transmission, transmission) || other.transmission == transmission)&&(identical(other.color, color) || other.color == color)&&(identical(other.buildType, buildType) || other.buildType == buildType)&&(identical(other.numberOfPassengers, numberOfPassengers) || other.numberOfPassengers == numberOfPassengers)&&const DeepCollectionEquality().equals(other.features, features)&&(identical(other.status, status) || other.status == status)&&(identical(other.price, price) || other.price == price)&&(identical(other.mileage, mileage) || other.mileage == mileage)&&(identical(other.warranty, warranty) || other.warranty == warranty)&&(identical(other.warrantyExpiration, warrantyExpiration) || other.warrantyExpiration == warrantyExpiration)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.Height, Height) || other.Height == Height)&&(identical(other.VIN, VIN) || other.VIN == VIN)&&(identical(other.category, category) || other.category == category)&&(identical(other.isPromoted, isPromoted) || other.isPromoted == isPromoted));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,userId,countryId,brandModelId,brandId,categoryId,name,year,slug,description,const DeepCollectionEquality().hash(images),location,serialNumber,condition,steerPosition,engineCapacity,transmission,color,buildType,numberOfPassengers,const DeepCollectionEquality().hash(features),status,price,mileage,warranty,warrantyExpiration,deletedAt,createdAt,updatedAt,Height,VIN,category,isPromoted]);

@override
String toString() {
  return 'MyListing(id: $id, userId: $userId, countryId: $countryId, brandModelId: $brandModelId, brandId: $brandId, categoryId: $categoryId, name: $name, year: $year, slug: $slug, description: $description, images: $images, location: $location, serialNumber: $serialNumber, condition: $condition, steerPosition: $steerPosition, engineCapacity: $engineCapacity, transmission: $transmission, color: $color, buildType: $buildType, numberOfPassengers: $numberOfPassengers, features: $features, status: $status, price: $price, mileage: $mileage, warranty: $warranty, warrantyExpiration: $warrantyExpiration, deletedAt: $deletedAt, createdAt: $createdAt, updatedAt: $updatedAt, Height: $Height, VIN: $VIN, category: $category, isPromoted: $isPromoted)';
}


}

/// @nodoc
abstract mixin class $MyListingCopyWith<$Res>  {
  factory $MyListingCopyWith(MyListing value, $Res Function(MyListing) _then) = _$MyListingCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: _parseString) String id,@JsonKey(name: 'user_id', fromJson: _parseInt) int userId,@JsonKey(name: 'country_id', fromJson: _parseInt) int? countryId,@JsonKey(name: 'brand_model_id', fromJson: _parseInt) int? brandModelId,@JsonKey(name: 'brand_id', fromJson: _parseInt) int brandId,@JsonKey(name: 'category_id', fromJson: _parseInt) int categoryId,@JsonKey(fromJson: _parseString) String name,@JsonKey(fromJson: _parseString) String year,@JsonKey(fromJson: _parseString) String slug,@JsonKey(fromJson: _parseString) String description, List<String> images,@JsonKey(fromJson: _parseString) String location,@JsonKey(name: 'serial_number', fromJson: _parseString) String? serialNumber,@JsonKey(fromJson: _parseString) String? condition,@JsonKey(name: 'steer_position', fromJson: _parseString) String? steerPosition,@JsonKey(name: 'engine_capacity', fromJson: _parseString) String? engineCapacity,@JsonKey(fromJson: _parseString) String? transmission,@JsonKey(fromJson: _parseString) String? color,@JsonKey(name: 'build_type', fromJson: _parseString) String? buildType,@JsonKey(name: 'number_of_passengers', fromJson: _parseInt) int? numberOfPassengers, List<dynamic> features,@JsonKey(fromJson: _parseString) String? status,@JsonKey(fromJson: _parseString) String price,@JsonKey(fromJson: _parseString) String? mileage,@JsonKey(fromJson: _parseInt) int? warranty,@JsonKey(name: 'warranty_expiration', fromJson: _parseString) String? warrantyExpiration,@JsonKey(name: 'deleted_at', fromJson: _parseString) String? deletedAt,@JsonKey(name: 'created_at', fromJson: _parseString) String createdAt,@JsonKey(name: 'updated_at', fromJson: _parseString) String updatedAt,@JsonKey(fromJson: _parseString) String? Height,@JsonKey(fromJson: _parseString) String? VIN, Category? category,@JsonKey(name: 'is_promoted') bool? isPromoted
});


$CategoryCopyWith<$Res>? get category;

}
/// @nodoc
class _$MyListingCopyWithImpl<$Res>
    implements $MyListingCopyWith<$Res> {
  _$MyListingCopyWithImpl(this._self, this._then);

  final MyListing _self;
  final $Res Function(MyListing) _then;

/// Create a copy of MyListing
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? countryId = freezed,Object? brandModelId = freezed,Object? brandId = null,Object? categoryId = null,Object? name = null,Object? year = null,Object? slug = null,Object? description = null,Object? images = null,Object? location = null,Object? serialNumber = freezed,Object? condition = freezed,Object? steerPosition = freezed,Object? engineCapacity = freezed,Object? transmission = freezed,Object? color = freezed,Object? buildType = freezed,Object? numberOfPassengers = freezed,Object? features = null,Object? status = freezed,Object? price = null,Object? mileage = freezed,Object? warranty = freezed,Object? warrantyExpiration = freezed,Object? deletedAt = freezed,Object? createdAt = null,Object? updatedAt = null,Object? Height = freezed,Object? VIN = freezed,Object? category = freezed,Object? isPromoted = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,countryId: freezed == countryId ? _self.countryId : countryId // ignore: cast_nullable_to_non_nullable
as int?,brandModelId: freezed == brandModelId ? _self.brandModelId : brandModelId // ignore: cast_nullable_to_non_nullable
as int?,brandId: null == brandId ? _self.brandId : brandId // ignore: cast_nullable_to_non_nullable
as int,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,year: null == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,images: null == images ? _self.images : images // ignore: cast_nullable_to_non_nullable
as List<String>,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,serialNumber: freezed == serialNumber ? _self.serialNumber : serialNumber // ignore: cast_nullable_to_non_nullable
as String?,condition: freezed == condition ? _self.condition : condition // ignore: cast_nullable_to_non_nullable
as String?,steerPosition: freezed == steerPosition ? _self.steerPosition : steerPosition // ignore: cast_nullable_to_non_nullable
as String?,engineCapacity: freezed == engineCapacity ? _self.engineCapacity : engineCapacity // ignore: cast_nullable_to_non_nullable
as String?,transmission: freezed == transmission ? _self.transmission : transmission // ignore: cast_nullable_to_non_nullable
as String?,color: freezed == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String?,buildType: freezed == buildType ? _self.buildType : buildType // ignore: cast_nullable_to_non_nullable
as String?,numberOfPassengers: freezed == numberOfPassengers ? _self.numberOfPassengers : numberOfPassengers // ignore: cast_nullable_to_non_nullable
as int?,features: null == features ? _self.features : features // ignore: cast_nullable_to_non_nullable
as List<dynamic>,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as String,mileage: freezed == mileage ? _self.mileage : mileage // ignore: cast_nullable_to_non_nullable
as String?,warranty: freezed == warranty ? _self.warranty : warranty // ignore: cast_nullable_to_non_nullable
as int?,warrantyExpiration: freezed == warrantyExpiration ? _self.warrantyExpiration : warrantyExpiration // ignore: cast_nullable_to_non_nullable
as String?,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,Height: freezed == Height ? _self.Height : Height // ignore: cast_nullable_to_non_nullable
as String?,VIN: freezed == VIN ? _self.VIN : VIN // ignore: cast_nullable_to_non_nullable
as String?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as Category?,isPromoted: freezed == isPromoted ? _self.isPromoted : isPromoted // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}
/// Create a copy of MyListing
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


/// Adds pattern-matching-related methods to [MyListing].
extension MyListingPatterns on MyListing {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MyListing value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MyListing() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MyListing value)  $default,){
final _that = this;
switch (_that) {
case _MyListing():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MyListing value)?  $default,){
final _that = this;
switch (_that) {
case _MyListing() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _parseString)  String id, @JsonKey(name: 'user_id', fromJson: _parseInt)  int userId, @JsonKey(name: 'country_id', fromJson: _parseInt)  int? countryId, @JsonKey(name: 'brand_model_id', fromJson: _parseInt)  int? brandModelId, @JsonKey(name: 'brand_id', fromJson: _parseInt)  int brandId, @JsonKey(name: 'category_id', fromJson: _parseInt)  int categoryId, @JsonKey(fromJson: _parseString)  String name, @JsonKey(fromJson: _parseString)  String year, @JsonKey(fromJson: _parseString)  String slug, @JsonKey(fromJson: _parseString)  String description,  List<String> images, @JsonKey(fromJson: _parseString)  String location, @JsonKey(name: 'serial_number', fromJson: _parseString)  String? serialNumber, @JsonKey(fromJson: _parseString)  String? condition, @JsonKey(name: 'steer_position', fromJson: _parseString)  String? steerPosition, @JsonKey(name: 'engine_capacity', fromJson: _parseString)  String? engineCapacity, @JsonKey(fromJson: _parseString)  String? transmission, @JsonKey(fromJson: _parseString)  String? color, @JsonKey(name: 'build_type', fromJson: _parseString)  String? buildType, @JsonKey(name: 'number_of_passengers', fromJson: _parseInt)  int? numberOfPassengers,  List<dynamic> features, @JsonKey(fromJson: _parseString)  String? status, @JsonKey(fromJson: _parseString)  String price, @JsonKey(fromJson: _parseString)  String? mileage, @JsonKey(fromJson: _parseInt)  int? warranty, @JsonKey(name: 'warranty_expiration', fromJson: _parseString)  String? warrantyExpiration, @JsonKey(name: 'deleted_at', fromJson: _parseString)  String? deletedAt, @JsonKey(name: 'created_at', fromJson: _parseString)  String createdAt, @JsonKey(name: 'updated_at', fromJson: _parseString)  String updatedAt, @JsonKey(fromJson: _parseString)  String? Height, @JsonKey(fromJson: _parseString)  String? VIN,  Category? category, @JsonKey(name: 'is_promoted')  bool? isPromoted)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MyListing() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _parseString)  String id, @JsonKey(name: 'user_id', fromJson: _parseInt)  int userId, @JsonKey(name: 'country_id', fromJson: _parseInt)  int? countryId, @JsonKey(name: 'brand_model_id', fromJson: _parseInt)  int? brandModelId, @JsonKey(name: 'brand_id', fromJson: _parseInt)  int brandId, @JsonKey(name: 'category_id', fromJson: _parseInt)  int categoryId, @JsonKey(fromJson: _parseString)  String name, @JsonKey(fromJson: _parseString)  String year, @JsonKey(fromJson: _parseString)  String slug, @JsonKey(fromJson: _parseString)  String description,  List<String> images, @JsonKey(fromJson: _parseString)  String location, @JsonKey(name: 'serial_number', fromJson: _parseString)  String? serialNumber, @JsonKey(fromJson: _parseString)  String? condition, @JsonKey(name: 'steer_position', fromJson: _parseString)  String? steerPosition, @JsonKey(name: 'engine_capacity', fromJson: _parseString)  String? engineCapacity, @JsonKey(fromJson: _parseString)  String? transmission, @JsonKey(fromJson: _parseString)  String? color, @JsonKey(name: 'build_type', fromJson: _parseString)  String? buildType, @JsonKey(name: 'number_of_passengers', fromJson: _parseInt)  int? numberOfPassengers,  List<dynamic> features, @JsonKey(fromJson: _parseString)  String? status, @JsonKey(fromJson: _parseString)  String price, @JsonKey(fromJson: _parseString)  String? mileage, @JsonKey(fromJson: _parseInt)  int? warranty, @JsonKey(name: 'warranty_expiration', fromJson: _parseString)  String? warrantyExpiration, @JsonKey(name: 'deleted_at', fromJson: _parseString)  String? deletedAt, @JsonKey(name: 'created_at', fromJson: _parseString)  String createdAt, @JsonKey(name: 'updated_at', fromJson: _parseString)  String updatedAt, @JsonKey(fromJson: _parseString)  String? Height, @JsonKey(fromJson: _parseString)  String? VIN,  Category? category, @JsonKey(name: 'is_promoted')  bool? isPromoted)  $default,) {final _that = this;
switch (_that) {
case _MyListing():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: _parseString)  String id, @JsonKey(name: 'user_id', fromJson: _parseInt)  int userId, @JsonKey(name: 'country_id', fromJson: _parseInt)  int? countryId, @JsonKey(name: 'brand_model_id', fromJson: _parseInt)  int? brandModelId, @JsonKey(name: 'brand_id', fromJson: _parseInt)  int brandId, @JsonKey(name: 'category_id', fromJson: _parseInt)  int categoryId, @JsonKey(fromJson: _parseString)  String name, @JsonKey(fromJson: _parseString)  String year, @JsonKey(fromJson: _parseString)  String slug, @JsonKey(fromJson: _parseString)  String description,  List<String> images, @JsonKey(fromJson: _parseString)  String location, @JsonKey(name: 'serial_number', fromJson: _parseString)  String? serialNumber, @JsonKey(fromJson: _parseString)  String? condition, @JsonKey(name: 'steer_position', fromJson: _parseString)  String? steerPosition, @JsonKey(name: 'engine_capacity', fromJson: _parseString)  String? engineCapacity, @JsonKey(fromJson: _parseString)  String? transmission, @JsonKey(fromJson: _parseString)  String? color, @JsonKey(name: 'build_type', fromJson: _parseString)  String? buildType, @JsonKey(name: 'number_of_passengers', fromJson: _parseInt)  int? numberOfPassengers,  List<dynamic> features, @JsonKey(fromJson: _parseString)  String? status, @JsonKey(fromJson: _parseString)  String price, @JsonKey(fromJson: _parseString)  String? mileage, @JsonKey(fromJson: _parseInt)  int? warranty, @JsonKey(name: 'warranty_expiration', fromJson: _parseString)  String? warrantyExpiration, @JsonKey(name: 'deleted_at', fromJson: _parseString)  String? deletedAt, @JsonKey(name: 'created_at', fromJson: _parseString)  String createdAt, @JsonKey(name: 'updated_at', fromJson: _parseString)  String updatedAt, @JsonKey(fromJson: _parseString)  String? Height, @JsonKey(fromJson: _parseString)  String? VIN,  Category? category, @JsonKey(name: 'is_promoted')  bool? isPromoted)?  $default,) {final _that = this;
switch (_that) {
case _MyListing() when $default != null:
return $default(_that.id,_that.userId,_that.countryId,_that.brandModelId,_that.brandId,_that.categoryId,_that.name,_that.year,_that.slug,_that.description,_that.images,_that.location,_that.serialNumber,_that.condition,_that.steerPosition,_that.engineCapacity,_that.transmission,_that.color,_that.buildType,_that.numberOfPassengers,_that.features,_that.status,_that.price,_that.mileage,_that.warranty,_that.warrantyExpiration,_that.deletedAt,_that.createdAt,_that.updatedAt,_that.Height,_that.VIN,_that.category,_that.isPromoted);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MyListing implements MyListing {
  const _MyListing({@JsonKey(fromJson: _parseString) required this.id, @JsonKey(name: 'user_id', fromJson: _parseInt) required this.userId, @JsonKey(name: 'country_id', fromJson: _parseInt) this.countryId, @JsonKey(name: 'brand_model_id', fromJson: _parseInt) this.brandModelId, @JsonKey(name: 'brand_id', fromJson: _parseInt) required this.brandId, @JsonKey(name: 'category_id', fromJson: _parseInt) required this.categoryId, @JsonKey(fromJson: _parseString) required this.name, @JsonKey(fromJson: _parseString) required this.year, @JsonKey(fromJson: _parseString) required this.slug, @JsonKey(fromJson: _parseString) required this.description, required final  List<String> images, @JsonKey(fromJson: _parseString) required this.location, @JsonKey(name: 'serial_number', fromJson: _parseString) this.serialNumber, @JsonKey(fromJson: _parseString) this.condition, @JsonKey(name: 'steer_position', fromJson: _parseString) this.steerPosition, @JsonKey(name: 'engine_capacity', fromJson: _parseString) this.engineCapacity, @JsonKey(fromJson: _parseString) this.transmission, @JsonKey(fromJson: _parseString) this.color, @JsonKey(name: 'build_type', fromJson: _parseString) this.buildType, @JsonKey(name: 'number_of_passengers', fromJson: _parseInt) this.numberOfPassengers, required final  List<dynamic> features, @JsonKey(fromJson: _parseString) this.status, @JsonKey(fromJson: _parseString) required this.price, @JsonKey(fromJson: _parseString) this.mileage, @JsonKey(fromJson: _parseInt) this.warranty, @JsonKey(name: 'warranty_expiration', fromJson: _parseString) this.warrantyExpiration, @JsonKey(name: 'deleted_at', fromJson: _parseString) this.deletedAt, @JsonKey(name: 'created_at', fromJson: _parseString) required this.createdAt, @JsonKey(name: 'updated_at', fromJson: _parseString) required this.updatedAt, @JsonKey(fromJson: _parseString) this.Height, @JsonKey(fromJson: _parseString) this.VIN, this.category, @JsonKey(name: 'is_promoted') this.isPromoted}): _images = images,_features = features;
  factory _MyListing.fromJson(Map<String, dynamic> json) => _$MyListingFromJson(json);

@override@JsonKey(fromJson: _parseString) final  String id;
@override@JsonKey(name: 'user_id', fromJson: _parseInt) final  int userId;
@override@JsonKey(name: 'country_id', fromJson: _parseInt) final  int? countryId;
@override@JsonKey(name: 'brand_model_id', fromJson: _parseInt) final  int? brandModelId;
@override@JsonKey(name: 'brand_id', fromJson: _parseInt) final  int brandId;
@override@JsonKey(name: 'category_id', fromJson: _parseInt) final  int categoryId;
@override@JsonKey(fromJson: _parseString) final  String name;
@override@JsonKey(fromJson: _parseString) final  String year;
@override@JsonKey(fromJson: _parseString) final  String slug;
@override@JsonKey(fromJson: _parseString) final  String description;
 final  List<String> _images;
@override List<String> get images {
  if (_images is EqualUnmodifiableListView) return _images;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_images);
}

@override@JsonKey(fromJson: _parseString) final  String location;
@override@JsonKey(name: 'serial_number', fromJson: _parseString) final  String? serialNumber;
@override@JsonKey(fromJson: _parseString) final  String? condition;
@override@JsonKey(name: 'steer_position', fromJson: _parseString) final  String? steerPosition;
@override@JsonKey(name: 'engine_capacity', fromJson: _parseString) final  String? engineCapacity;
@override@JsonKey(fromJson: _parseString) final  String? transmission;
@override@JsonKey(fromJson: _parseString) final  String? color;
@override@JsonKey(name: 'build_type', fromJson: _parseString) final  String? buildType;
@override@JsonKey(name: 'number_of_passengers', fromJson: _parseInt) final  int? numberOfPassengers;
 final  List<dynamic> _features;
@override List<dynamic> get features {
  if (_features is EqualUnmodifiableListView) return _features;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_features);
}

@override@JsonKey(fromJson: _parseString) final  String? status;
@override@JsonKey(fromJson: _parseString) final  String price;
// Use custom converter
@override@JsonKey(fromJson: _parseString) final  String? mileage;
@override@JsonKey(fromJson: _parseInt) final  int? warranty;
@override@JsonKey(name: 'warranty_expiration', fromJson: _parseString) final  String? warrantyExpiration;
@override@JsonKey(name: 'deleted_at', fromJson: _parseString) final  String? deletedAt;
@override@JsonKey(name: 'created_at', fromJson: _parseString) final  String createdAt;
@override@JsonKey(name: 'updated_at', fromJson: _parseString) final  String updatedAt;
@override@JsonKey(fromJson: _parseString) final  String? Height;
@override@JsonKey(fromJson: _parseString) final  String? VIN;
@override final  Category? category;
@override@JsonKey(name: 'is_promoted') final  bool? isPromoted;

/// Create a copy of MyListing
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MyListingCopyWith<_MyListing> get copyWith => __$MyListingCopyWithImpl<_MyListing>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MyListingToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MyListing&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.countryId, countryId) || other.countryId == countryId)&&(identical(other.brandModelId, brandModelId) || other.brandModelId == brandModelId)&&(identical(other.brandId, brandId) || other.brandId == brandId)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.name, name) || other.name == name)&&(identical(other.year, year) || other.year == year)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._images, _images)&&(identical(other.location, location) || other.location == location)&&(identical(other.serialNumber, serialNumber) || other.serialNumber == serialNumber)&&(identical(other.condition, condition) || other.condition == condition)&&(identical(other.steerPosition, steerPosition) || other.steerPosition == steerPosition)&&(identical(other.engineCapacity, engineCapacity) || other.engineCapacity == engineCapacity)&&(identical(other.transmission, transmission) || other.transmission == transmission)&&(identical(other.color, color) || other.color == color)&&(identical(other.buildType, buildType) || other.buildType == buildType)&&(identical(other.numberOfPassengers, numberOfPassengers) || other.numberOfPassengers == numberOfPassengers)&&const DeepCollectionEquality().equals(other._features, _features)&&(identical(other.status, status) || other.status == status)&&(identical(other.price, price) || other.price == price)&&(identical(other.mileage, mileage) || other.mileage == mileage)&&(identical(other.warranty, warranty) || other.warranty == warranty)&&(identical(other.warrantyExpiration, warrantyExpiration) || other.warrantyExpiration == warrantyExpiration)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.Height, Height) || other.Height == Height)&&(identical(other.VIN, VIN) || other.VIN == VIN)&&(identical(other.category, category) || other.category == category)&&(identical(other.isPromoted, isPromoted) || other.isPromoted == isPromoted));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,userId,countryId,brandModelId,brandId,categoryId,name,year,slug,description,const DeepCollectionEquality().hash(_images),location,serialNumber,condition,steerPosition,engineCapacity,transmission,color,buildType,numberOfPassengers,const DeepCollectionEquality().hash(_features),status,price,mileage,warranty,warrantyExpiration,deletedAt,createdAt,updatedAt,Height,VIN,category,isPromoted]);

@override
String toString() {
  return 'MyListing(id: $id, userId: $userId, countryId: $countryId, brandModelId: $brandModelId, brandId: $brandId, categoryId: $categoryId, name: $name, year: $year, slug: $slug, description: $description, images: $images, location: $location, serialNumber: $serialNumber, condition: $condition, steerPosition: $steerPosition, engineCapacity: $engineCapacity, transmission: $transmission, color: $color, buildType: $buildType, numberOfPassengers: $numberOfPassengers, features: $features, status: $status, price: $price, mileage: $mileage, warranty: $warranty, warrantyExpiration: $warrantyExpiration, deletedAt: $deletedAt, createdAt: $createdAt, updatedAt: $updatedAt, Height: $Height, VIN: $VIN, category: $category, isPromoted: $isPromoted)';
}


}

/// @nodoc
abstract mixin class _$MyListingCopyWith<$Res> implements $MyListingCopyWith<$Res> {
  factory _$MyListingCopyWith(_MyListing value, $Res Function(_MyListing) _then) = __$MyListingCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: _parseString) String id,@JsonKey(name: 'user_id', fromJson: _parseInt) int userId,@JsonKey(name: 'country_id', fromJson: _parseInt) int? countryId,@JsonKey(name: 'brand_model_id', fromJson: _parseInt) int? brandModelId,@JsonKey(name: 'brand_id', fromJson: _parseInt) int brandId,@JsonKey(name: 'category_id', fromJson: _parseInt) int categoryId,@JsonKey(fromJson: _parseString) String name,@JsonKey(fromJson: _parseString) String year,@JsonKey(fromJson: _parseString) String slug,@JsonKey(fromJson: _parseString) String description, List<String> images,@JsonKey(fromJson: _parseString) String location,@JsonKey(name: 'serial_number', fromJson: _parseString) String? serialNumber,@JsonKey(fromJson: _parseString) String? condition,@JsonKey(name: 'steer_position', fromJson: _parseString) String? steerPosition,@JsonKey(name: 'engine_capacity', fromJson: _parseString) String? engineCapacity,@JsonKey(fromJson: _parseString) String? transmission,@JsonKey(fromJson: _parseString) String? color,@JsonKey(name: 'build_type', fromJson: _parseString) String? buildType,@JsonKey(name: 'number_of_passengers', fromJson: _parseInt) int? numberOfPassengers, List<dynamic> features,@JsonKey(fromJson: _parseString) String? status,@JsonKey(fromJson: _parseString) String price,@JsonKey(fromJson: _parseString) String? mileage,@JsonKey(fromJson: _parseInt) int? warranty,@JsonKey(name: 'warranty_expiration', fromJson: _parseString) String? warrantyExpiration,@JsonKey(name: 'deleted_at', fromJson: _parseString) String? deletedAt,@JsonKey(name: 'created_at', fromJson: _parseString) String createdAt,@JsonKey(name: 'updated_at', fromJson: _parseString) String updatedAt,@JsonKey(fromJson: _parseString) String? Height,@JsonKey(fromJson: _parseString) String? VIN, Category? category,@JsonKey(name: 'is_promoted') bool? isPromoted
});


@override $CategoryCopyWith<$Res>? get category;

}
/// @nodoc
class __$MyListingCopyWithImpl<$Res>
    implements _$MyListingCopyWith<$Res> {
  __$MyListingCopyWithImpl(this._self, this._then);

  final _MyListing _self;
  final $Res Function(_MyListing) _then;

/// Create a copy of MyListing
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? countryId = freezed,Object? brandModelId = freezed,Object? brandId = null,Object? categoryId = null,Object? name = null,Object? year = null,Object? slug = null,Object? description = null,Object? images = null,Object? location = null,Object? serialNumber = freezed,Object? condition = freezed,Object? steerPosition = freezed,Object? engineCapacity = freezed,Object? transmission = freezed,Object? color = freezed,Object? buildType = freezed,Object? numberOfPassengers = freezed,Object? features = null,Object? status = freezed,Object? price = null,Object? mileage = freezed,Object? warranty = freezed,Object? warrantyExpiration = freezed,Object? deletedAt = freezed,Object? createdAt = null,Object? updatedAt = null,Object? Height = freezed,Object? VIN = freezed,Object? category = freezed,Object? isPromoted = freezed,}) {
  return _then(_MyListing(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,countryId: freezed == countryId ? _self.countryId : countryId // ignore: cast_nullable_to_non_nullable
as int?,brandModelId: freezed == brandModelId ? _self.brandModelId : brandModelId // ignore: cast_nullable_to_non_nullable
as int?,brandId: null == brandId ? _self.brandId : brandId // ignore: cast_nullable_to_non_nullable
as int,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,year: null == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,images: null == images ? _self._images : images // ignore: cast_nullable_to_non_nullable
as List<String>,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,serialNumber: freezed == serialNumber ? _self.serialNumber : serialNumber // ignore: cast_nullable_to_non_nullable
as String?,condition: freezed == condition ? _self.condition : condition // ignore: cast_nullable_to_non_nullable
as String?,steerPosition: freezed == steerPosition ? _self.steerPosition : steerPosition // ignore: cast_nullable_to_non_nullable
as String?,engineCapacity: freezed == engineCapacity ? _self.engineCapacity : engineCapacity // ignore: cast_nullable_to_non_nullable
as String?,transmission: freezed == transmission ? _self.transmission : transmission // ignore: cast_nullable_to_non_nullable
as String?,color: freezed == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String?,buildType: freezed == buildType ? _self.buildType : buildType // ignore: cast_nullable_to_non_nullable
as String?,numberOfPassengers: freezed == numberOfPassengers ? _self.numberOfPassengers : numberOfPassengers // ignore: cast_nullable_to_non_nullable
as int?,features: null == features ? _self._features : features // ignore: cast_nullable_to_non_nullable
as List<dynamic>,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as String,mileage: freezed == mileage ? _self.mileage : mileage // ignore: cast_nullable_to_non_nullable
as String?,warranty: freezed == warranty ? _self.warranty : warranty // ignore: cast_nullable_to_non_nullable
as int?,warrantyExpiration: freezed == warrantyExpiration ? _self.warrantyExpiration : warrantyExpiration // ignore: cast_nullable_to_non_nullable
as String?,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,Height: freezed == Height ? _self.Height : Height // ignore: cast_nullable_to_non_nullable
as String?,VIN: freezed == VIN ? _self.VIN : VIN // ignore: cast_nullable_to_non_nullable
as String?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as Category?,isPromoted: freezed == isPromoted ? _self.isPromoted : isPromoted // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

/// Create a copy of MyListing
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
mixin _$Category {

@JsonKey(fromJson: _parseInt) int get id;@JsonKey(name: 'user_id', fromJson: _parseInt) int? get userId;@JsonKey(name: 'parent_id', fromJson: _parseInt) int? get parentId;@JsonKey(fromJson: _parseString) String get name;@JsonKey(fromJson: _parseString) String get slug;@JsonKey(fromJson: _parseString) String get description; List<dynamic> get features;@JsonKey(fromJson: _parseString) String get image;@JsonKey(name: 'created_at', fromJson: _parseString) String get createdAt;@JsonKey(name: 'updated_at', fromJson: _parseString) String get updatedAt;
/// Create a copy of Category
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategoryCopyWith<Category> get copyWith => _$CategoryCopyWithImpl<Category>(this as Category, _$identity);

  /// Serializes this Category to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Category&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.parentId, parentId) || other.parentId == parentId)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.features, features)&&(identical(other.image, image) || other.image == image)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,parentId,name,slug,description,const DeepCollectionEquality().hash(features),image,createdAt,updatedAt);

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
@JsonKey(fromJson: _parseInt) int id,@JsonKey(name: 'user_id', fromJson: _parseInt) int? userId,@JsonKey(name: 'parent_id', fromJson: _parseInt) int? parentId,@JsonKey(fromJson: _parseString) String name,@JsonKey(fromJson: _parseString) String slug,@JsonKey(fromJson: _parseString) String description, List<dynamic> features,@JsonKey(fromJson: _parseString) String image,@JsonKey(name: 'created_at', fromJson: _parseString) String createdAt,@JsonKey(name: 'updated_at', fromJson: _parseString) String updatedAt
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
as int?,parentId: freezed == parentId ? _self.parentId : parentId // ignore: cast_nullable_to_non_nullable
as int?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,features: null == features ? _self.features : features // ignore: cast_nullable_to_non_nullable
as List<dynamic>,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _parseInt)  int id, @JsonKey(name: 'user_id', fromJson: _parseInt)  int? userId, @JsonKey(name: 'parent_id', fromJson: _parseInt)  int? parentId, @JsonKey(fromJson: _parseString)  String name, @JsonKey(fromJson: _parseString)  String slug, @JsonKey(fromJson: _parseString)  String description,  List<dynamic> features, @JsonKey(fromJson: _parseString)  String image, @JsonKey(name: 'created_at', fromJson: _parseString)  String createdAt, @JsonKey(name: 'updated_at', fromJson: _parseString)  String updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _parseInt)  int id, @JsonKey(name: 'user_id', fromJson: _parseInt)  int? userId, @JsonKey(name: 'parent_id', fromJson: _parseInt)  int? parentId, @JsonKey(fromJson: _parseString)  String name, @JsonKey(fromJson: _parseString)  String slug, @JsonKey(fromJson: _parseString)  String description,  List<dynamic> features, @JsonKey(fromJson: _parseString)  String image, @JsonKey(name: 'created_at', fromJson: _parseString)  String createdAt, @JsonKey(name: 'updated_at', fromJson: _parseString)  String updatedAt)  $default,) {final _that = this;
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: _parseInt)  int id, @JsonKey(name: 'user_id', fromJson: _parseInt)  int? userId, @JsonKey(name: 'parent_id', fromJson: _parseInt)  int? parentId, @JsonKey(fromJson: _parseString)  String name, @JsonKey(fromJson: _parseString)  String slug, @JsonKey(fromJson: _parseString)  String description,  List<dynamic> features, @JsonKey(fromJson: _parseString)  String image, @JsonKey(name: 'created_at', fromJson: _parseString)  String createdAt, @JsonKey(name: 'updated_at', fromJson: _parseString)  String updatedAt)?  $default,) {final _that = this;
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
  const _Category({@JsonKey(fromJson: _parseInt) required this.id, @JsonKey(name: 'user_id', fromJson: _parseInt) this.userId, @JsonKey(name: 'parent_id', fromJson: _parseInt) this.parentId, @JsonKey(fromJson: _parseString) required this.name, @JsonKey(fromJson: _parseString) required this.slug, @JsonKey(fromJson: _parseString) required this.description, required final  List<dynamic> features, @JsonKey(fromJson: _parseString) required this.image, @JsonKey(name: 'created_at', fromJson: _parseString) required this.createdAt, @JsonKey(name: 'updated_at', fromJson: _parseString) required this.updatedAt}): _features = features;
  factory _Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);

@override@JsonKey(fromJson: _parseInt) final  int id;
@override@JsonKey(name: 'user_id', fromJson: _parseInt) final  int? userId;
@override@JsonKey(name: 'parent_id', fromJson: _parseInt) final  int? parentId;
@override@JsonKey(fromJson: _parseString) final  String name;
@override@JsonKey(fromJson: _parseString) final  String slug;
@override@JsonKey(fromJson: _parseString) final  String description;
 final  List<dynamic> _features;
@override List<dynamic> get features {
  if (_features is EqualUnmodifiableListView) return _features;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_features);
}

@override@JsonKey(fromJson: _parseString) final  String image;
@override@JsonKey(name: 'created_at', fromJson: _parseString) final  String createdAt;
@override@JsonKey(name: 'updated_at', fromJson: _parseString) final  String updatedAt;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Category&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.parentId, parentId) || other.parentId == parentId)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._features, _features)&&(identical(other.image, image) || other.image == image)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,parentId,name,slug,description,const DeepCollectionEquality().hash(_features),image,createdAt,updatedAt);

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
@JsonKey(fromJson: _parseInt) int id,@JsonKey(name: 'user_id', fromJson: _parseInt) int? userId,@JsonKey(name: 'parent_id', fromJson: _parseInt) int? parentId,@JsonKey(fromJson: _parseString) String name,@JsonKey(fromJson: _parseString) String slug,@JsonKey(fromJson: _parseString) String description, List<dynamic> features,@JsonKey(fromJson: _parseString) String image,@JsonKey(name: 'created_at', fromJson: _parseString) String createdAt,@JsonKey(name: 'updated_at', fromJson: _parseString) String updatedAt
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
as int?,parentId: freezed == parentId ? _self.parentId : parentId // ignore: cast_nullable_to_non_nullable
as int?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,features: null == features ? _self._features : features // ignore: cast_nullable_to_non_nullable
as List<dynamic>,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
