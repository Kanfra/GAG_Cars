// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'similarItemsModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SimilarItemsResponse {

@JsonKey(name: 'data') List<SimilarItem> get data;@JsonKey(name: 'links') PaginationLinks? get links;@JsonKey(name: 'meta') PaginationMeta? get meta;
/// Create a copy of SimilarItemsResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SimilarItemsResponseCopyWith<SimilarItemsResponse> get copyWith => _$SimilarItemsResponseCopyWithImpl<SimilarItemsResponse>(this as SimilarItemsResponse, _$identity);

  /// Serializes this SimilarItemsResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SimilarItemsResponse&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.links, links) || other.links == links)&&(identical(other.meta, meta) || other.meta == meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data),links,meta);

@override
String toString() {
  return 'SimilarItemsResponse(data: $data, links: $links, meta: $meta)';
}


}

/// @nodoc
abstract mixin class $SimilarItemsResponseCopyWith<$Res>  {
  factory $SimilarItemsResponseCopyWith(SimilarItemsResponse value, $Res Function(SimilarItemsResponse) _then) = _$SimilarItemsResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'data') List<SimilarItem> data,@JsonKey(name: 'links') PaginationLinks? links,@JsonKey(name: 'meta') PaginationMeta? meta
});


$PaginationLinksCopyWith<$Res>? get links;$PaginationMetaCopyWith<$Res>? get meta;

}
/// @nodoc
class _$SimilarItemsResponseCopyWithImpl<$Res>
    implements $SimilarItemsResponseCopyWith<$Res> {
  _$SimilarItemsResponseCopyWithImpl(this._self, this._then);

  final SimilarItemsResponse _self;
  final $Res Function(SimilarItemsResponse) _then;

/// Create a copy of SimilarItemsResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = null,Object? links = freezed,Object? meta = freezed,}) {
  return _then(_self.copyWith(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<SimilarItem>,links: freezed == links ? _self.links : links // ignore: cast_nullable_to_non_nullable
as PaginationLinks?,meta: freezed == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as PaginationMeta?,
  ));
}
/// Create a copy of SimilarItemsResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaginationLinksCopyWith<$Res>? get links {
    if (_self.links == null) {
    return null;
  }

  return $PaginationLinksCopyWith<$Res>(_self.links!, (value) {
    return _then(_self.copyWith(links: value));
  });
}/// Create a copy of SimilarItemsResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaginationMetaCopyWith<$Res>? get meta {
    if (_self.meta == null) {
    return null;
  }

  return $PaginationMetaCopyWith<$Res>(_self.meta!, (value) {
    return _then(_self.copyWith(meta: value));
  });
}
}


/// Adds pattern-matching-related methods to [SimilarItemsResponse].
extension SimilarItemsResponsePatterns on SimilarItemsResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SimilarItemsResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SimilarItemsResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SimilarItemsResponse value)  $default,){
final _that = this;
switch (_that) {
case _SimilarItemsResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SimilarItemsResponse value)?  $default,){
final _that = this;
switch (_that) {
case _SimilarItemsResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'data')  List<SimilarItem> data, @JsonKey(name: 'links')  PaginationLinks? links, @JsonKey(name: 'meta')  PaginationMeta? meta)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SimilarItemsResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'data')  List<SimilarItem> data, @JsonKey(name: 'links')  PaginationLinks? links, @JsonKey(name: 'meta')  PaginationMeta? meta)  $default,) {final _that = this;
switch (_that) {
case _SimilarItemsResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'data')  List<SimilarItem> data, @JsonKey(name: 'links')  PaginationLinks? links, @JsonKey(name: 'meta')  PaginationMeta? meta)?  $default,) {final _that = this;
switch (_that) {
case _SimilarItemsResponse() when $default != null:
return $default(_that.data,_that.links,_that.meta);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SimilarItemsResponse implements SimilarItemsResponse {
  const _SimilarItemsResponse({@JsonKey(name: 'data') required final  List<SimilarItem> data, @JsonKey(name: 'links') this.links, @JsonKey(name: 'meta') this.meta}): _data = data;
  factory _SimilarItemsResponse.fromJson(Map<String, dynamic> json) => _$SimilarItemsResponseFromJson(json);

 final  List<SimilarItem> _data;
@override@JsonKey(name: 'data') List<SimilarItem> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}

@override@JsonKey(name: 'links') final  PaginationLinks? links;
@override@JsonKey(name: 'meta') final  PaginationMeta? meta;

/// Create a copy of SimilarItemsResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SimilarItemsResponseCopyWith<_SimilarItemsResponse> get copyWith => __$SimilarItemsResponseCopyWithImpl<_SimilarItemsResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SimilarItemsResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SimilarItemsResponse&&const DeepCollectionEquality().equals(other._data, _data)&&(identical(other.links, links) || other.links == links)&&(identical(other.meta, meta) || other.meta == meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_data),links,meta);

@override
String toString() {
  return 'SimilarItemsResponse(data: $data, links: $links, meta: $meta)';
}


}

/// @nodoc
abstract mixin class _$SimilarItemsResponseCopyWith<$Res> implements $SimilarItemsResponseCopyWith<$Res> {
  factory _$SimilarItemsResponseCopyWith(_SimilarItemsResponse value, $Res Function(_SimilarItemsResponse) _then) = __$SimilarItemsResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'data') List<SimilarItem> data,@JsonKey(name: 'links') PaginationLinks? links,@JsonKey(name: 'meta') PaginationMeta? meta
});


@override $PaginationLinksCopyWith<$Res>? get links;@override $PaginationMetaCopyWith<$Res>? get meta;

}
/// @nodoc
class __$SimilarItemsResponseCopyWithImpl<$Res>
    implements _$SimilarItemsResponseCopyWith<$Res> {
  __$SimilarItemsResponseCopyWithImpl(this._self, this._then);

  final _SimilarItemsResponse _self;
  final $Res Function(_SimilarItemsResponse) _then;

/// Create a copy of SimilarItemsResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,Object? links = freezed,Object? meta = freezed,}) {
  return _then(_SimilarItemsResponse(
data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<SimilarItem>,links: freezed == links ? _self.links : links // ignore: cast_nullable_to_non_nullable
as PaginationLinks?,meta: freezed == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as PaginationMeta?,
  ));
}

/// Create a copy of SimilarItemsResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaginationLinksCopyWith<$Res>? get links {
    if (_self.links == null) {
    return null;
  }

  return $PaginationLinksCopyWith<$Res>(_self.links!, (value) {
    return _then(_self.copyWith(links: value));
  });
}/// Create a copy of SimilarItemsResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaginationMetaCopyWith<$Res>? get meta {
    if (_self.meta == null) {
    return null;
  }

  return $PaginationMetaCopyWith<$Res>(_self.meta!, (value) {
    return _then(_self.copyWith(meta: value));
  });
}
}


/// @nodoc
mixin _$SimilarItem {

@JsonKey(name: 'id') String get id;@JsonKey(name: 'user_id') String? get userId;@JsonKey(name: 'country_id', fromJson: _parseNullableInt) int? get countryId;@JsonKey(name: 'brand_model_id', fromJson: _parseNullableInt) int? get brandModelId;@JsonKey(name: 'brand_id', fromJson: _parseNullableInt) int? get brandId;@JsonKey(name: 'category_id', fromJson: _parseNullableInt) int? get categoryId;@JsonKey(name: 'name') String? get name;@JsonKey(name: 'year') String? get year;@JsonKey(name: 'slug') String? get slug;@JsonKey(name: 'description') String? get description;@JsonKey(name: 'images', fromJson: _parseStringList) List<String>? get images;@JsonKey(name: 'location') String? get location;@JsonKey(name: 'serial_number') String? get serialNumber;@JsonKey(name: 'Condition') String? get condition;// ✅ FIXED: Capital 'C' to match JSON
@JsonKey(name: 'steer_position') String? get steerPosition;@JsonKey(name: 'engine_capacity', fromJson: _parseNullableString) String? get engineCapacity;// ✅ FIXED: Handle both int and string
@JsonKey(name: 'transmission') String? get transmission;@JsonKey(name: 'color') String? get color;@JsonKey(name: 'build_type') String? get buildType;@JsonKey(name: 'number_of_passengers', fromJson: _parseNullableInt) int? get numberOfPassengers;@JsonKey(name: 'features', fromJson: _parseStringList) List<String>? get features;@JsonKey(name: 'status') String? get status;@JsonKey(name: 'price', fromJson: _parseNullableString) String? get price;// ✅ FIXED: Handle both int and string
@JsonKey(name: 'mileage', fromJson: _parseNullableString) String? get mileage;// ✅ FIXED: Handle both int and string
@JsonKey(name: 'warranty', fromJson: _parseNullableInt) int? get warranty;@JsonKey(name: 'warranty_expiration') String? get warrantyExpiration;@JsonKey(name: 'deleted_at') String? get deletedAt;@JsonKey(name: 'created_at') String? get createdAt;@JsonKey(name: 'updated_at') String? get updatedAt;@JsonKey(name: 'Height', fromJson: _parseNullableString) String? get height;// ✅ FIXED: Handle both int and string
@JsonKey(name: 'VIN') String? get vin;// Added nested objects
@JsonKey(name: 'brand') Brand? get brand;@JsonKey(name: 'category') Category? get category;@JsonKey(name: 'brand_model') BrandModel? get brandModel;@JsonKey(name: 'user') User? get user;
/// Create a copy of SimilarItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SimilarItemCopyWith<SimilarItem> get copyWith => _$SimilarItemCopyWithImpl<SimilarItem>(this as SimilarItem, _$identity);

  /// Serializes this SimilarItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SimilarItem&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.countryId, countryId) || other.countryId == countryId)&&(identical(other.brandModelId, brandModelId) || other.brandModelId == brandModelId)&&(identical(other.brandId, brandId) || other.brandId == brandId)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.name, name) || other.name == name)&&(identical(other.year, year) || other.year == year)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.images, images)&&(identical(other.location, location) || other.location == location)&&(identical(other.serialNumber, serialNumber) || other.serialNumber == serialNumber)&&(identical(other.condition, condition) || other.condition == condition)&&(identical(other.steerPosition, steerPosition) || other.steerPosition == steerPosition)&&(identical(other.engineCapacity, engineCapacity) || other.engineCapacity == engineCapacity)&&(identical(other.transmission, transmission) || other.transmission == transmission)&&(identical(other.color, color) || other.color == color)&&(identical(other.buildType, buildType) || other.buildType == buildType)&&(identical(other.numberOfPassengers, numberOfPassengers) || other.numberOfPassengers == numberOfPassengers)&&const DeepCollectionEquality().equals(other.features, features)&&(identical(other.status, status) || other.status == status)&&(identical(other.price, price) || other.price == price)&&(identical(other.mileage, mileage) || other.mileage == mileage)&&(identical(other.warranty, warranty) || other.warranty == warranty)&&(identical(other.warrantyExpiration, warrantyExpiration) || other.warrantyExpiration == warrantyExpiration)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.height, height) || other.height == height)&&(identical(other.vin, vin) || other.vin == vin)&&(identical(other.brand, brand) || other.brand == brand)&&(identical(other.category, category) || other.category == category)&&(identical(other.brandModel, brandModel) || other.brandModel == brandModel)&&(identical(other.user, user) || other.user == user));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,userId,countryId,brandModelId,brandId,categoryId,name,year,slug,description,const DeepCollectionEquality().hash(images),location,serialNumber,condition,steerPosition,engineCapacity,transmission,color,buildType,numberOfPassengers,const DeepCollectionEquality().hash(features),status,price,mileage,warranty,warrantyExpiration,deletedAt,createdAt,updatedAt,height,vin,brand,category,brandModel,user]);

@override
String toString() {
  return 'SimilarItem(id: $id, userId: $userId, countryId: $countryId, brandModelId: $brandModelId, brandId: $brandId, categoryId: $categoryId, name: $name, year: $year, slug: $slug, description: $description, images: $images, location: $location, serialNumber: $serialNumber, condition: $condition, steerPosition: $steerPosition, engineCapacity: $engineCapacity, transmission: $transmission, color: $color, buildType: $buildType, numberOfPassengers: $numberOfPassengers, features: $features, status: $status, price: $price, mileage: $mileage, warranty: $warranty, warrantyExpiration: $warrantyExpiration, deletedAt: $deletedAt, createdAt: $createdAt, updatedAt: $updatedAt, height: $height, vin: $vin, brand: $brand, category: $category, brandModel: $brandModel, user: $user)';
}


}

/// @nodoc
abstract mixin class $SimilarItemCopyWith<$Res>  {
  factory $SimilarItemCopyWith(SimilarItem value, $Res Function(SimilarItem) _then) = _$SimilarItemCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id') String id,@JsonKey(name: 'user_id') String? userId,@JsonKey(name: 'country_id', fromJson: _parseNullableInt) int? countryId,@JsonKey(name: 'brand_model_id', fromJson: _parseNullableInt) int? brandModelId,@JsonKey(name: 'brand_id', fromJson: _parseNullableInt) int? brandId,@JsonKey(name: 'category_id', fromJson: _parseNullableInt) int? categoryId,@JsonKey(name: 'name') String? name,@JsonKey(name: 'year') String? year,@JsonKey(name: 'slug') String? slug,@JsonKey(name: 'description') String? description,@JsonKey(name: 'images', fromJson: _parseStringList) List<String>? images,@JsonKey(name: 'location') String? location,@JsonKey(name: 'serial_number') String? serialNumber,@JsonKey(name: 'Condition') String? condition,@JsonKey(name: 'steer_position') String? steerPosition,@JsonKey(name: 'engine_capacity', fromJson: _parseNullableString) String? engineCapacity,@JsonKey(name: 'transmission') String? transmission,@JsonKey(name: 'color') String? color,@JsonKey(name: 'build_type') String? buildType,@JsonKey(name: 'number_of_passengers', fromJson: _parseNullableInt) int? numberOfPassengers,@JsonKey(name: 'features', fromJson: _parseStringList) List<String>? features,@JsonKey(name: 'status') String? status,@JsonKey(name: 'price', fromJson: _parseNullableString) String? price,@JsonKey(name: 'mileage', fromJson: _parseNullableString) String? mileage,@JsonKey(name: 'warranty', fromJson: _parseNullableInt) int? warranty,@JsonKey(name: 'warranty_expiration') String? warrantyExpiration,@JsonKey(name: 'deleted_at') String? deletedAt,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'updated_at') String? updatedAt,@JsonKey(name: 'Height', fromJson: _parseNullableString) String? height,@JsonKey(name: 'VIN') String? vin,@JsonKey(name: 'brand') Brand? brand,@JsonKey(name: 'category') Category? category,@JsonKey(name: 'brand_model') BrandModel? brandModel,@JsonKey(name: 'user') User? user
});


$BrandCopyWith<$Res>? get brand;$CategoryCopyWith<$Res>? get category;$BrandModelCopyWith<$Res>? get brandModel;$UserCopyWith<$Res>? get user;

}
/// @nodoc
class _$SimilarItemCopyWithImpl<$Res>
    implements $SimilarItemCopyWith<$Res> {
  _$SimilarItemCopyWithImpl(this._self, this._then);

  final SimilarItem _self;
  final $Res Function(SimilarItem) _then;

/// Create a copy of SimilarItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = freezed,Object? countryId = freezed,Object? brandModelId = freezed,Object? brandId = freezed,Object? categoryId = freezed,Object? name = freezed,Object? year = freezed,Object? slug = freezed,Object? description = freezed,Object? images = freezed,Object? location = freezed,Object? serialNumber = freezed,Object? condition = freezed,Object? steerPosition = freezed,Object? engineCapacity = freezed,Object? transmission = freezed,Object? color = freezed,Object? buildType = freezed,Object? numberOfPassengers = freezed,Object? features = freezed,Object? status = freezed,Object? price = freezed,Object? mileage = freezed,Object? warranty = freezed,Object? warrantyExpiration = freezed,Object? deletedAt = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? height = freezed,Object? vin = freezed,Object? brand = freezed,Object? category = freezed,Object? brandModel = freezed,Object? user = freezed,}) {
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
as String?,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,height: freezed == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as String?,vin: freezed == vin ? _self.vin : vin // ignore: cast_nullable_to_non_nullable
as String?,brand: freezed == brand ? _self.brand : brand // ignore: cast_nullable_to_non_nullable
as Brand?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as Category?,brandModel: freezed == brandModel ? _self.brandModel : brandModel // ignore: cast_nullable_to_non_nullable
as BrandModel?,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User?,
  ));
}
/// Create a copy of SimilarItem
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
}/// Create a copy of SimilarItem
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
}/// Create a copy of SimilarItem
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
}/// Create a copy of SimilarItem
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


/// Adds pattern-matching-related methods to [SimilarItem].
extension SimilarItemPatterns on SimilarItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SimilarItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SimilarItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SimilarItem value)  $default,){
final _that = this;
switch (_that) {
case _SimilarItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SimilarItem value)?  $default,){
final _that = this;
switch (_that) {
case _SimilarItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  String id, @JsonKey(name: 'user_id')  String? userId, @JsonKey(name: 'country_id', fromJson: _parseNullableInt)  int? countryId, @JsonKey(name: 'brand_model_id', fromJson: _parseNullableInt)  int? brandModelId, @JsonKey(name: 'brand_id', fromJson: _parseNullableInt)  int? brandId, @JsonKey(name: 'category_id', fromJson: _parseNullableInt)  int? categoryId, @JsonKey(name: 'name')  String? name, @JsonKey(name: 'year')  String? year, @JsonKey(name: 'slug')  String? slug, @JsonKey(name: 'description')  String? description, @JsonKey(name: 'images', fromJson: _parseStringList)  List<String>? images, @JsonKey(name: 'location')  String? location, @JsonKey(name: 'serial_number')  String? serialNumber, @JsonKey(name: 'Condition')  String? condition, @JsonKey(name: 'steer_position')  String? steerPosition, @JsonKey(name: 'engine_capacity', fromJson: _parseNullableString)  String? engineCapacity, @JsonKey(name: 'transmission')  String? transmission, @JsonKey(name: 'color')  String? color, @JsonKey(name: 'build_type')  String? buildType, @JsonKey(name: 'number_of_passengers', fromJson: _parseNullableInt)  int? numberOfPassengers, @JsonKey(name: 'features', fromJson: _parseStringList)  List<String>? features, @JsonKey(name: 'status')  String? status, @JsonKey(name: 'price', fromJson: _parseNullableString)  String? price, @JsonKey(name: 'mileage', fromJson: _parseNullableString)  String? mileage, @JsonKey(name: 'warranty', fromJson: _parseNullableInt)  int? warranty, @JsonKey(name: 'warranty_expiration')  String? warrantyExpiration, @JsonKey(name: 'deleted_at')  String? deletedAt, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt, @JsonKey(name: 'Height', fromJson: _parseNullableString)  String? height, @JsonKey(name: 'VIN')  String? vin, @JsonKey(name: 'brand')  Brand? brand, @JsonKey(name: 'category')  Category? category, @JsonKey(name: 'brand_model')  BrandModel? brandModel, @JsonKey(name: 'user')  User? user)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SimilarItem() when $default != null:
return $default(_that.id,_that.userId,_that.countryId,_that.brandModelId,_that.brandId,_that.categoryId,_that.name,_that.year,_that.slug,_that.description,_that.images,_that.location,_that.serialNumber,_that.condition,_that.steerPosition,_that.engineCapacity,_that.transmission,_that.color,_that.buildType,_that.numberOfPassengers,_that.features,_that.status,_that.price,_that.mileage,_that.warranty,_that.warrantyExpiration,_that.deletedAt,_that.createdAt,_that.updatedAt,_that.height,_that.vin,_that.brand,_that.category,_that.brandModel,_that.user);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  String id, @JsonKey(name: 'user_id')  String? userId, @JsonKey(name: 'country_id', fromJson: _parseNullableInt)  int? countryId, @JsonKey(name: 'brand_model_id', fromJson: _parseNullableInt)  int? brandModelId, @JsonKey(name: 'brand_id', fromJson: _parseNullableInt)  int? brandId, @JsonKey(name: 'category_id', fromJson: _parseNullableInt)  int? categoryId, @JsonKey(name: 'name')  String? name, @JsonKey(name: 'year')  String? year, @JsonKey(name: 'slug')  String? slug, @JsonKey(name: 'description')  String? description, @JsonKey(name: 'images', fromJson: _parseStringList)  List<String>? images, @JsonKey(name: 'location')  String? location, @JsonKey(name: 'serial_number')  String? serialNumber, @JsonKey(name: 'Condition')  String? condition, @JsonKey(name: 'steer_position')  String? steerPosition, @JsonKey(name: 'engine_capacity', fromJson: _parseNullableString)  String? engineCapacity, @JsonKey(name: 'transmission')  String? transmission, @JsonKey(name: 'color')  String? color, @JsonKey(name: 'build_type')  String? buildType, @JsonKey(name: 'number_of_passengers', fromJson: _parseNullableInt)  int? numberOfPassengers, @JsonKey(name: 'features', fromJson: _parseStringList)  List<String>? features, @JsonKey(name: 'status')  String? status, @JsonKey(name: 'price', fromJson: _parseNullableString)  String? price, @JsonKey(name: 'mileage', fromJson: _parseNullableString)  String? mileage, @JsonKey(name: 'warranty', fromJson: _parseNullableInt)  int? warranty, @JsonKey(name: 'warranty_expiration')  String? warrantyExpiration, @JsonKey(name: 'deleted_at')  String? deletedAt, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt, @JsonKey(name: 'Height', fromJson: _parseNullableString)  String? height, @JsonKey(name: 'VIN')  String? vin, @JsonKey(name: 'brand')  Brand? brand, @JsonKey(name: 'category')  Category? category, @JsonKey(name: 'brand_model')  BrandModel? brandModel, @JsonKey(name: 'user')  User? user)  $default,) {final _that = this;
switch (_that) {
case _SimilarItem():
return $default(_that.id,_that.userId,_that.countryId,_that.brandModelId,_that.brandId,_that.categoryId,_that.name,_that.year,_that.slug,_that.description,_that.images,_that.location,_that.serialNumber,_that.condition,_that.steerPosition,_that.engineCapacity,_that.transmission,_that.color,_that.buildType,_that.numberOfPassengers,_that.features,_that.status,_that.price,_that.mileage,_that.warranty,_that.warrantyExpiration,_that.deletedAt,_that.createdAt,_that.updatedAt,_that.height,_that.vin,_that.brand,_that.category,_that.brandModel,_that.user);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id')  String id, @JsonKey(name: 'user_id')  String? userId, @JsonKey(name: 'country_id', fromJson: _parseNullableInt)  int? countryId, @JsonKey(name: 'brand_model_id', fromJson: _parseNullableInt)  int? brandModelId, @JsonKey(name: 'brand_id', fromJson: _parseNullableInt)  int? brandId, @JsonKey(name: 'category_id', fromJson: _parseNullableInt)  int? categoryId, @JsonKey(name: 'name')  String? name, @JsonKey(name: 'year')  String? year, @JsonKey(name: 'slug')  String? slug, @JsonKey(name: 'description')  String? description, @JsonKey(name: 'images', fromJson: _parseStringList)  List<String>? images, @JsonKey(name: 'location')  String? location, @JsonKey(name: 'serial_number')  String? serialNumber, @JsonKey(name: 'Condition')  String? condition, @JsonKey(name: 'steer_position')  String? steerPosition, @JsonKey(name: 'engine_capacity', fromJson: _parseNullableString)  String? engineCapacity, @JsonKey(name: 'transmission')  String? transmission, @JsonKey(name: 'color')  String? color, @JsonKey(name: 'build_type')  String? buildType, @JsonKey(name: 'number_of_passengers', fromJson: _parseNullableInt)  int? numberOfPassengers, @JsonKey(name: 'features', fromJson: _parseStringList)  List<String>? features, @JsonKey(name: 'status')  String? status, @JsonKey(name: 'price', fromJson: _parseNullableString)  String? price, @JsonKey(name: 'mileage', fromJson: _parseNullableString)  String? mileage, @JsonKey(name: 'warranty', fromJson: _parseNullableInt)  int? warranty, @JsonKey(name: 'warranty_expiration')  String? warrantyExpiration, @JsonKey(name: 'deleted_at')  String? deletedAt, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt, @JsonKey(name: 'Height', fromJson: _parseNullableString)  String? height, @JsonKey(name: 'VIN')  String? vin, @JsonKey(name: 'brand')  Brand? brand, @JsonKey(name: 'category')  Category? category, @JsonKey(name: 'brand_model')  BrandModel? brandModel, @JsonKey(name: 'user')  User? user)?  $default,) {final _that = this;
switch (_that) {
case _SimilarItem() when $default != null:
return $default(_that.id,_that.userId,_that.countryId,_that.brandModelId,_that.brandId,_that.categoryId,_that.name,_that.year,_that.slug,_that.description,_that.images,_that.location,_that.serialNumber,_that.condition,_that.steerPosition,_that.engineCapacity,_that.transmission,_that.color,_that.buildType,_that.numberOfPassengers,_that.features,_that.status,_that.price,_that.mileage,_that.warranty,_that.warrantyExpiration,_that.deletedAt,_that.createdAt,_that.updatedAt,_that.height,_that.vin,_that.brand,_that.category,_that.brandModel,_that.user);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SimilarItem extends SimilarItem {
  const _SimilarItem({@JsonKey(name: 'id') required this.id, @JsonKey(name: 'user_id') this.userId, @JsonKey(name: 'country_id', fromJson: _parseNullableInt) this.countryId, @JsonKey(name: 'brand_model_id', fromJson: _parseNullableInt) this.brandModelId, @JsonKey(name: 'brand_id', fromJson: _parseNullableInt) this.brandId, @JsonKey(name: 'category_id', fromJson: _parseNullableInt) this.categoryId, @JsonKey(name: 'name') this.name, @JsonKey(name: 'year') this.year, @JsonKey(name: 'slug') this.slug, @JsonKey(name: 'description') this.description, @JsonKey(name: 'images', fromJson: _parseStringList) final  List<String>? images, @JsonKey(name: 'location') this.location, @JsonKey(name: 'serial_number') this.serialNumber, @JsonKey(name: 'Condition') this.condition, @JsonKey(name: 'steer_position') this.steerPosition, @JsonKey(name: 'engine_capacity', fromJson: _parseNullableString) this.engineCapacity, @JsonKey(name: 'transmission') this.transmission, @JsonKey(name: 'color') this.color, @JsonKey(name: 'build_type') this.buildType, @JsonKey(name: 'number_of_passengers', fromJson: _parseNullableInt) this.numberOfPassengers, @JsonKey(name: 'features', fromJson: _parseStringList) final  List<String>? features, @JsonKey(name: 'status') this.status, @JsonKey(name: 'price', fromJson: _parseNullableString) this.price, @JsonKey(name: 'mileage', fromJson: _parseNullableString) this.mileage, @JsonKey(name: 'warranty', fromJson: _parseNullableInt) this.warranty, @JsonKey(name: 'warranty_expiration') this.warrantyExpiration, @JsonKey(name: 'deleted_at') this.deletedAt, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt, @JsonKey(name: 'Height', fromJson: _parseNullableString) this.height, @JsonKey(name: 'VIN') this.vin, @JsonKey(name: 'brand') this.brand, @JsonKey(name: 'category') this.category, @JsonKey(name: 'brand_model') this.brandModel, @JsonKey(name: 'user') this.user}): _images = images,_features = features,super._();
  factory _SimilarItem.fromJson(Map<String, dynamic> json) => _$SimilarItemFromJson(json);

@override@JsonKey(name: 'id') final  String id;
@override@JsonKey(name: 'user_id') final  String? userId;
@override@JsonKey(name: 'country_id', fromJson: _parseNullableInt) final  int? countryId;
@override@JsonKey(name: 'brand_model_id', fromJson: _parseNullableInt) final  int? brandModelId;
@override@JsonKey(name: 'brand_id', fromJson: _parseNullableInt) final  int? brandId;
@override@JsonKey(name: 'category_id', fromJson: _parseNullableInt) final  int? categoryId;
@override@JsonKey(name: 'name') final  String? name;
@override@JsonKey(name: 'year') final  String? year;
@override@JsonKey(name: 'slug') final  String? slug;
@override@JsonKey(name: 'description') final  String? description;
 final  List<String>? _images;
@override@JsonKey(name: 'images', fromJson: _parseStringList) List<String>? get images {
  final value = _images;
  if (value == null) return null;
  if (_images is EqualUnmodifiableListView) return _images;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey(name: 'location') final  String? location;
@override@JsonKey(name: 'serial_number') final  String? serialNumber;
@override@JsonKey(name: 'Condition') final  String? condition;
// ✅ FIXED: Capital 'C' to match JSON
@override@JsonKey(name: 'steer_position') final  String? steerPosition;
@override@JsonKey(name: 'engine_capacity', fromJson: _parseNullableString) final  String? engineCapacity;
// ✅ FIXED: Handle both int and string
@override@JsonKey(name: 'transmission') final  String? transmission;
@override@JsonKey(name: 'color') final  String? color;
@override@JsonKey(name: 'build_type') final  String? buildType;
@override@JsonKey(name: 'number_of_passengers', fromJson: _parseNullableInt) final  int? numberOfPassengers;
 final  List<String>? _features;
@override@JsonKey(name: 'features', fromJson: _parseStringList) List<String>? get features {
  final value = _features;
  if (value == null) return null;
  if (_features is EqualUnmodifiableListView) return _features;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey(name: 'status') final  String? status;
@override@JsonKey(name: 'price', fromJson: _parseNullableString) final  String? price;
// ✅ FIXED: Handle both int and string
@override@JsonKey(name: 'mileage', fromJson: _parseNullableString) final  String? mileage;
// ✅ FIXED: Handle both int and string
@override@JsonKey(name: 'warranty', fromJson: _parseNullableInt) final  int? warranty;
@override@JsonKey(name: 'warranty_expiration') final  String? warrantyExpiration;
@override@JsonKey(name: 'deleted_at') final  String? deletedAt;
@override@JsonKey(name: 'created_at') final  String? createdAt;
@override@JsonKey(name: 'updated_at') final  String? updatedAt;
@override@JsonKey(name: 'Height', fromJson: _parseNullableString) final  String? height;
// ✅ FIXED: Handle both int and string
@override@JsonKey(name: 'VIN') final  String? vin;
// Added nested objects
@override@JsonKey(name: 'brand') final  Brand? brand;
@override@JsonKey(name: 'category') final  Category? category;
@override@JsonKey(name: 'brand_model') final  BrandModel? brandModel;
@override@JsonKey(name: 'user') final  User? user;

/// Create a copy of SimilarItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SimilarItemCopyWith<_SimilarItem> get copyWith => __$SimilarItemCopyWithImpl<_SimilarItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SimilarItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SimilarItem&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.countryId, countryId) || other.countryId == countryId)&&(identical(other.brandModelId, brandModelId) || other.brandModelId == brandModelId)&&(identical(other.brandId, brandId) || other.brandId == brandId)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.name, name) || other.name == name)&&(identical(other.year, year) || other.year == year)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._images, _images)&&(identical(other.location, location) || other.location == location)&&(identical(other.serialNumber, serialNumber) || other.serialNumber == serialNumber)&&(identical(other.condition, condition) || other.condition == condition)&&(identical(other.steerPosition, steerPosition) || other.steerPosition == steerPosition)&&(identical(other.engineCapacity, engineCapacity) || other.engineCapacity == engineCapacity)&&(identical(other.transmission, transmission) || other.transmission == transmission)&&(identical(other.color, color) || other.color == color)&&(identical(other.buildType, buildType) || other.buildType == buildType)&&(identical(other.numberOfPassengers, numberOfPassengers) || other.numberOfPassengers == numberOfPassengers)&&const DeepCollectionEquality().equals(other._features, _features)&&(identical(other.status, status) || other.status == status)&&(identical(other.price, price) || other.price == price)&&(identical(other.mileage, mileage) || other.mileage == mileage)&&(identical(other.warranty, warranty) || other.warranty == warranty)&&(identical(other.warrantyExpiration, warrantyExpiration) || other.warrantyExpiration == warrantyExpiration)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.height, height) || other.height == height)&&(identical(other.vin, vin) || other.vin == vin)&&(identical(other.brand, brand) || other.brand == brand)&&(identical(other.category, category) || other.category == category)&&(identical(other.brandModel, brandModel) || other.brandModel == brandModel)&&(identical(other.user, user) || other.user == user));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,userId,countryId,brandModelId,brandId,categoryId,name,year,slug,description,const DeepCollectionEquality().hash(_images),location,serialNumber,condition,steerPosition,engineCapacity,transmission,color,buildType,numberOfPassengers,const DeepCollectionEquality().hash(_features),status,price,mileage,warranty,warrantyExpiration,deletedAt,createdAt,updatedAt,height,vin,brand,category,brandModel,user]);

@override
String toString() {
  return 'SimilarItem(id: $id, userId: $userId, countryId: $countryId, brandModelId: $brandModelId, brandId: $brandId, categoryId: $categoryId, name: $name, year: $year, slug: $slug, description: $description, images: $images, location: $location, serialNumber: $serialNumber, condition: $condition, steerPosition: $steerPosition, engineCapacity: $engineCapacity, transmission: $transmission, color: $color, buildType: $buildType, numberOfPassengers: $numberOfPassengers, features: $features, status: $status, price: $price, mileage: $mileage, warranty: $warranty, warrantyExpiration: $warrantyExpiration, deletedAt: $deletedAt, createdAt: $createdAt, updatedAt: $updatedAt, height: $height, vin: $vin, brand: $brand, category: $category, brandModel: $brandModel, user: $user)';
}


}

/// @nodoc
abstract mixin class _$SimilarItemCopyWith<$Res> implements $SimilarItemCopyWith<$Res> {
  factory _$SimilarItemCopyWith(_SimilarItem value, $Res Function(_SimilarItem) _then) = __$SimilarItemCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id') String id,@JsonKey(name: 'user_id') String? userId,@JsonKey(name: 'country_id', fromJson: _parseNullableInt) int? countryId,@JsonKey(name: 'brand_model_id', fromJson: _parseNullableInt) int? brandModelId,@JsonKey(name: 'brand_id', fromJson: _parseNullableInt) int? brandId,@JsonKey(name: 'category_id', fromJson: _parseNullableInt) int? categoryId,@JsonKey(name: 'name') String? name,@JsonKey(name: 'year') String? year,@JsonKey(name: 'slug') String? slug,@JsonKey(name: 'description') String? description,@JsonKey(name: 'images', fromJson: _parseStringList) List<String>? images,@JsonKey(name: 'location') String? location,@JsonKey(name: 'serial_number') String? serialNumber,@JsonKey(name: 'Condition') String? condition,@JsonKey(name: 'steer_position') String? steerPosition,@JsonKey(name: 'engine_capacity', fromJson: _parseNullableString) String? engineCapacity,@JsonKey(name: 'transmission') String? transmission,@JsonKey(name: 'color') String? color,@JsonKey(name: 'build_type') String? buildType,@JsonKey(name: 'number_of_passengers', fromJson: _parseNullableInt) int? numberOfPassengers,@JsonKey(name: 'features', fromJson: _parseStringList) List<String>? features,@JsonKey(name: 'status') String? status,@JsonKey(name: 'price', fromJson: _parseNullableString) String? price,@JsonKey(name: 'mileage', fromJson: _parseNullableString) String? mileage,@JsonKey(name: 'warranty', fromJson: _parseNullableInt) int? warranty,@JsonKey(name: 'warranty_expiration') String? warrantyExpiration,@JsonKey(name: 'deleted_at') String? deletedAt,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'updated_at') String? updatedAt,@JsonKey(name: 'Height', fromJson: _parseNullableString) String? height,@JsonKey(name: 'VIN') String? vin,@JsonKey(name: 'brand') Brand? brand,@JsonKey(name: 'category') Category? category,@JsonKey(name: 'brand_model') BrandModel? brandModel,@JsonKey(name: 'user') User? user
});


@override $BrandCopyWith<$Res>? get brand;@override $CategoryCopyWith<$Res>? get category;@override $BrandModelCopyWith<$Res>? get brandModel;@override $UserCopyWith<$Res>? get user;

}
/// @nodoc
class __$SimilarItemCopyWithImpl<$Res>
    implements _$SimilarItemCopyWith<$Res> {
  __$SimilarItemCopyWithImpl(this._self, this._then);

  final _SimilarItem _self;
  final $Res Function(_SimilarItem) _then;

/// Create a copy of SimilarItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = freezed,Object? countryId = freezed,Object? brandModelId = freezed,Object? brandId = freezed,Object? categoryId = freezed,Object? name = freezed,Object? year = freezed,Object? slug = freezed,Object? description = freezed,Object? images = freezed,Object? location = freezed,Object? serialNumber = freezed,Object? condition = freezed,Object? steerPosition = freezed,Object? engineCapacity = freezed,Object? transmission = freezed,Object? color = freezed,Object? buildType = freezed,Object? numberOfPassengers = freezed,Object? features = freezed,Object? status = freezed,Object? price = freezed,Object? mileage = freezed,Object? warranty = freezed,Object? warrantyExpiration = freezed,Object? deletedAt = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? height = freezed,Object? vin = freezed,Object? brand = freezed,Object? category = freezed,Object? brandModel = freezed,Object? user = freezed,}) {
  return _then(_SimilarItem(
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
as String?,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,height: freezed == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as String?,vin: freezed == vin ? _self.vin : vin // ignore: cast_nullable_to_non_nullable
as String?,brand: freezed == brand ? _self.brand : brand // ignore: cast_nullable_to_non_nullable
as Brand?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as Category?,brandModel: freezed == brandModel ? _self.brandModel : brandModel // ignore: cast_nullable_to_non_nullable
as BrandModel?,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User?,
  ));
}

/// Create a copy of SimilarItem
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
}/// Create a copy of SimilarItem
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
}/// Create a copy of SimilarItem
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
}/// Create a copy of SimilarItem
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
mixin _$Brand {

@JsonKey(name: 'id', fromJson: _parseInt) int get id;// ✅ FIXED: Ensure int parsing
@JsonKey(name: 'user_id', fromJson: _parseNullableInt) int? get userId;@JsonKey(name: 'name') String? get name;@JsonKey(name: 'slug') String? get slug;@JsonKey(name: 'image') String? get image;@JsonKey(name: 'created_at') String? get createdAt;@JsonKey(name: 'updated_at') String? get updatedAt;
/// Create a copy of Brand
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BrandCopyWith<Brand> get copyWith => _$BrandCopyWithImpl<Brand>(this as Brand, _$identity);

  /// Serializes this Brand to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Brand&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.image, image) || other.image == image)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,name,slug,image,createdAt,updatedAt);

@override
String toString() {
  return 'Brand(id: $id, userId: $userId, name: $name, slug: $slug, image: $image, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $BrandCopyWith<$Res>  {
  factory $BrandCopyWith(Brand value, $Res Function(Brand) _then) = _$BrandCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id', fromJson: _parseInt) int id,@JsonKey(name: 'user_id', fromJson: _parseNullableInt) int? userId,@JsonKey(name: 'name') String? name,@JsonKey(name: 'slug') String? slug,@JsonKey(name: 'image') String? image,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'updated_at') String? updatedAt
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = freezed,Object? name = freezed,Object? slug = freezed,Object? image = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,slug: freezed == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String?,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id', fromJson: _parseInt)  int id, @JsonKey(name: 'user_id', fromJson: _parseNullableInt)  int? userId, @JsonKey(name: 'name')  String? name, @JsonKey(name: 'slug')  String? slug, @JsonKey(name: 'image')  String? image, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id', fromJson: _parseInt)  int id, @JsonKey(name: 'user_id', fromJson: _parseNullableInt)  int? userId, @JsonKey(name: 'name')  String? name, @JsonKey(name: 'slug')  String? slug, @JsonKey(name: 'image')  String? image, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt)  $default,) {final _that = this;
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id', fromJson: _parseInt)  int id, @JsonKey(name: 'user_id', fromJson: _parseNullableInt)  int? userId, @JsonKey(name: 'name')  String? name, @JsonKey(name: 'slug')  String? slug, @JsonKey(name: 'image')  String? image, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _Brand() when $default != null:
return $default(_that.id,_that.userId,_that.name,_that.slug,_that.image,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Brand implements Brand {
  const _Brand({@JsonKey(name: 'id', fromJson: _parseInt) required this.id, @JsonKey(name: 'user_id', fromJson: _parseNullableInt) this.userId, @JsonKey(name: 'name') this.name, @JsonKey(name: 'slug') this.slug, @JsonKey(name: 'image') this.image, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt});
  factory _Brand.fromJson(Map<String, dynamic> json) => _$BrandFromJson(json);

@override@JsonKey(name: 'id', fromJson: _parseInt) final  int id;
// ✅ FIXED: Ensure int parsing
@override@JsonKey(name: 'user_id', fromJson: _parseNullableInt) final  int? userId;
@override@JsonKey(name: 'name') final  String? name;
@override@JsonKey(name: 'slug') final  String? slug;
@override@JsonKey(name: 'image') final  String? image;
@override@JsonKey(name: 'created_at') final  String? createdAt;
@override@JsonKey(name: 'updated_at') final  String? updatedAt;

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
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Brand&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.image, image) || other.image == image)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,name,slug,image,createdAt,updatedAt);

@override
String toString() {
  return 'Brand(id: $id, userId: $userId, name: $name, slug: $slug, image: $image, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$BrandCopyWith<$Res> implements $BrandCopyWith<$Res> {
  factory _$BrandCopyWith(_Brand value, $Res Function(_Brand) _then) = __$BrandCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id', fromJson: _parseInt) int id,@JsonKey(name: 'user_id', fromJson: _parseNullableInt) int? userId,@JsonKey(name: 'name') String? name,@JsonKey(name: 'slug') String? slug,@JsonKey(name: 'image') String? image,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'updated_at') String? updatedAt
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = freezed,Object? name = freezed,Object? slug = freezed,Object? image = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_Brand(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,slug: freezed == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String?,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$Category {

@JsonKey(name: 'id', fromJson: _parseInt) int get id;// ✅ FIXED: Ensure int parsing
@JsonKey(name: 'user_id', fromJson: _parseNullableInt) int? get userId;@JsonKey(name: 'parent_id', fromJson: _parseNullableInt) int? get parentId;@JsonKey(name: 'name') String? get name;@JsonKey(name: 'slug') String? get slug;@JsonKey(name: 'description') String? get description;@JsonKey(name: 'features', fromJson: _parseStringList) List<String>? get features;@JsonKey(name: 'image') String? get image;@JsonKey(name: 'created_at') String? get createdAt;@JsonKey(name: 'updated_at') String? get updatedAt;
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
@JsonKey(name: 'id', fromJson: _parseInt) int id,@JsonKey(name: 'user_id', fromJson: _parseNullableInt) int? userId,@JsonKey(name: 'parent_id', fromJson: _parseNullableInt) int? parentId,@JsonKey(name: 'name') String? name,@JsonKey(name: 'slug') String? slug,@JsonKey(name: 'description') String? description,@JsonKey(name: 'features', fromJson: _parseStringList) List<String>? features,@JsonKey(name: 'image') String? image,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'updated_at') String? updatedAt
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = freezed,Object? parentId = freezed,Object? name = freezed,Object? slug = freezed,Object? description = freezed,Object? features = freezed,Object? image = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int?,parentId: freezed == parentId ? _self.parentId : parentId // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,slug: freezed == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,features: freezed == features ? _self.features : features // ignore: cast_nullable_to_non_nullable
as List<String>?,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id', fromJson: _parseInt)  int id, @JsonKey(name: 'user_id', fromJson: _parseNullableInt)  int? userId, @JsonKey(name: 'parent_id', fromJson: _parseNullableInt)  int? parentId, @JsonKey(name: 'name')  String? name, @JsonKey(name: 'slug')  String? slug, @JsonKey(name: 'description')  String? description, @JsonKey(name: 'features', fromJson: _parseStringList)  List<String>? features, @JsonKey(name: 'image')  String? image, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id', fromJson: _parseInt)  int id, @JsonKey(name: 'user_id', fromJson: _parseNullableInt)  int? userId, @JsonKey(name: 'parent_id', fromJson: _parseNullableInt)  int? parentId, @JsonKey(name: 'name')  String? name, @JsonKey(name: 'slug')  String? slug, @JsonKey(name: 'description')  String? description, @JsonKey(name: 'features', fromJson: _parseStringList)  List<String>? features, @JsonKey(name: 'image')  String? image, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt)  $default,) {final _that = this;
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id', fromJson: _parseInt)  int id, @JsonKey(name: 'user_id', fromJson: _parseNullableInt)  int? userId, @JsonKey(name: 'parent_id', fromJson: _parseNullableInt)  int? parentId, @JsonKey(name: 'name')  String? name, @JsonKey(name: 'slug')  String? slug, @JsonKey(name: 'description')  String? description, @JsonKey(name: 'features', fromJson: _parseStringList)  List<String>? features, @JsonKey(name: 'image')  String? image, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt)?  $default,) {final _that = this;
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
  const _Category({@JsonKey(name: 'id', fromJson: _parseInt) required this.id, @JsonKey(name: 'user_id', fromJson: _parseNullableInt) this.userId, @JsonKey(name: 'parent_id', fromJson: _parseNullableInt) this.parentId, @JsonKey(name: 'name') this.name, @JsonKey(name: 'slug') this.slug, @JsonKey(name: 'description') this.description, @JsonKey(name: 'features', fromJson: _parseStringList) final  List<String>? features, @JsonKey(name: 'image') this.image, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt}): _features = features;
  factory _Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);

@override@JsonKey(name: 'id', fromJson: _parseInt) final  int id;
// ✅ FIXED: Ensure int parsing
@override@JsonKey(name: 'user_id', fromJson: _parseNullableInt) final  int? userId;
@override@JsonKey(name: 'parent_id', fromJson: _parseNullableInt) final  int? parentId;
@override@JsonKey(name: 'name') final  String? name;
@override@JsonKey(name: 'slug') final  String? slug;
@override@JsonKey(name: 'description') final  String? description;
 final  List<String>? _features;
@override@JsonKey(name: 'features', fromJson: _parseStringList) List<String>? get features {
  final value = _features;
  if (value == null) return null;
  if (_features is EqualUnmodifiableListView) return _features;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey(name: 'image') final  String? image;
@override@JsonKey(name: 'created_at') final  String? createdAt;
@override@JsonKey(name: 'updated_at') final  String? updatedAt;

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
@JsonKey(name: 'id', fromJson: _parseInt) int id,@JsonKey(name: 'user_id', fromJson: _parseNullableInt) int? userId,@JsonKey(name: 'parent_id', fromJson: _parseNullableInt) int? parentId,@JsonKey(name: 'name') String? name,@JsonKey(name: 'slug') String? slug,@JsonKey(name: 'description') String? description,@JsonKey(name: 'features', fromJson: _parseStringList) List<String>? features,@JsonKey(name: 'image') String? image,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'updated_at') String? updatedAt
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = freezed,Object? parentId = freezed,Object? name = freezed,Object? slug = freezed,Object? description = freezed,Object? features = freezed,Object? image = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_Category(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int?,parentId: freezed == parentId ? _self.parentId : parentId // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,slug: freezed == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,features: freezed == features ? _self._features : features // ignore: cast_nullable_to_non_nullable
as List<String>?,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$BrandModel {

@JsonKey(name: 'id', fromJson: _parseInt) int get id;// ✅ FIXED: Ensure int parsing
@JsonKey(name: 'brand_id', fromJson: _parseNullableInt) int? get brandId;@JsonKey(name: 'name') String? get name;@JsonKey(name: 'slug') String? get slug;@JsonKey(name: 'created_at') String? get createdAt;@JsonKey(name: 'updated_at') String? get updatedAt;
/// Create a copy of BrandModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BrandModelCopyWith<BrandModel> get copyWith => _$BrandModelCopyWithImpl<BrandModel>(this as BrandModel, _$identity);

  /// Serializes this BrandModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BrandModel&&(identical(other.id, id) || other.id == id)&&(identical(other.brandId, brandId) || other.brandId == brandId)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,brandId,name,slug,createdAt,updatedAt);

@override
String toString() {
  return 'BrandModel(id: $id, brandId: $brandId, name: $name, slug: $slug, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $BrandModelCopyWith<$Res>  {
  factory $BrandModelCopyWith(BrandModel value, $Res Function(BrandModel) _then) = _$BrandModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id', fromJson: _parseInt) int id,@JsonKey(name: 'brand_id', fromJson: _parseNullableInt) int? brandId,@JsonKey(name: 'name') String? name,@JsonKey(name: 'slug') String? slug,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'updated_at') String? updatedAt
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? brandId = freezed,Object? name = freezed,Object? slug = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,brandId: freezed == brandId ? _self.brandId : brandId // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,slug: freezed == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id', fromJson: _parseInt)  int id, @JsonKey(name: 'brand_id', fromJson: _parseNullableInt)  int? brandId, @JsonKey(name: 'name')  String? name, @JsonKey(name: 'slug')  String? slug, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id', fromJson: _parseInt)  int id, @JsonKey(name: 'brand_id', fromJson: _parseNullableInt)  int? brandId, @JsonKey(name: 'name')  String? name, @JsonKey(name: 'slug')  String? slug, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt)  $default,) {final _that = this;
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id', fromJson: _parseInt)  int id, @JsonKey(name: 'brand_id', fromJson: _parseNullableInt)  int? brandId, @JsonKey(name: 'name')  String? name, @JsonKey(name: 'slug')  String? slug, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _BrandModel() when $default != null:
return $default(_that.id,_that.brandId,_that.name,_that.slug,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BrandModel implements BrandModel {
  const _BrandModel({@JsonKey(name: 'id', fromJson: _parseInt) required this.id, @JsonKey(name: 'brand_id', fromJson: _parseNullableInt) this.brandId, @JsonKey(name: 'name') this.name, @JsonKey(name: 'slug') this.slug, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt});
  factory _BrandModel.fromJson(Map<String, dynamic> json) => _$BrandModelFromJson(json);

@override@JsonKey(name: 'id', fromJson: _parseInt) final  int id;
// ✅ FIXED: Ensure int parsing
@override@JsonKey(name: 'brand_id', fromJson: _parseNullableInt) final  int? brandId;
@override@JsonKey(name: 'name') final  String? name;
@override@JsonKey(name: 'slug') final  String? slug;
@override@JsonKey(name: 'created_at') final  String? createdAt;
@override@JsonKey(name: 'updated_at') final  String? updatedAt;

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
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BrandModel&&(identical(other.id, id) || other.id == id)&&(identical(other.brandId, brandId) || other.brandId == brandId)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,brandId,name,slug,createdAt,updatedAt);

@override
String toString() {
  return 'BrandModel(id: $id, brandId: $brandId, name: $name, slug: $slug, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$BrandModelCopyWith<$Res> implements $BrandModelCopyWith<$Res> {
  factory _$BrandModelCopyWith(_BrandModel value, $Res Function(_BrandModel) _then) = __$BrandModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id', fromJson: _parseInt) int id,@JsonKey(name: 'brand_id', fromJson: _parseNullableInt) int? brandId,@JsonKey(name: 'name') String? name,@JsonKey(name: 'slug') String? slug,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'updated_at') String? updatedAt
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? brandId = freezed,Object? name = freezed,Object? slug = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_BrandModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,brandId: freezed == brandId ? _self.brandId : brandId // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,slug: freezed == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$User {

@JsonKey(name: 'id') String get id;@JsonKey(name: 'name') String? get name;@JsonKey(name: 'email') String? get email;@JsonKey(name: 'phone') String? get phone;@JsonKey(name: 'email_verified_at') String? get emailVerifiedAt;@JsonKey(name: 'paid_seller', fromJson: _parseNullableInt) int? get paidSeller;@JsonKey(name: 'deleted_at') String? get deletedAt;@JsonKey(name: 'created_at') String? get createdAt;@JsonKey(name: 'updated_at') String? get updatedAt;@JsonKey(name: 'country_id', fromJson: _parseNullableInt) int? get countryId;@JsonKey(name: 'state_id', fromJson: _parseNullableInt) int? get stateId;@JsonKey(name: 'profile_photo') String? get profilePhoto;@JsonKey(name: 'uploads_left', fromJson: _parseNullableInt) int? get uploadsLeft;@JsonKey(name: 'active_status', fromJson: _parseNullableInt) int? get activeStatus;@JsonKey(name: 'avatar') String? get avatar;@JsonKey(name: 'dark_mode', fromJson: _parseNullableInt) int? get darkMode;@JsonKey(name: 'messenger_color') String? get messengerColor;
/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserCopyWith<User> get copyWith => _$UserCopyWithImpl<User>(this as User, _$identity);

  /// Serializes this User to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is User&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.emailVerifiedAt, emailVerifiedAt) || other.emailVerifiedAt == emailVerifiedAt)&&(identical(other.paidSeller, paidSeller) || other.paidSeller == paidSeller)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.countryId, countryId) || other.countryId == countryId)&&(identical(other.stateId, stateId) || other.stateId == stateId)&&(identical(other.profilePhoto, profilePhoto) || other.profilePhoto == profilePhoto)&&(identical(other.uploadsLeft, uploadsLeft) || other.uploadsLeft == uploadsLeft)&&(identical(other.activeStatus, activeStatus) || other.activeStatus == activeStatus)&&(identical(other.avatar, avatar) || other.avatar == avatar)&&(identical(other.darkMode, darkMode) || other.darkMode == darkMode)&&(identical(other.messengerColor, messengerColor) || other.messengerColor == messengerColor));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,email,phone,emailVerifiedAt,paidSeller,deletedAt,createdAt,updatedAt,countryId,stateId,profilePhoto,uploadsLeft,activeStatus,avatar,darkMode,messengerColor);

@override
String toString() {
  return 'User(id: $id, name: $name, email: $email, phone: $phone, emailVerifiedAt: $emailVerifiedAt, paidSeller: $paidSeller, deletedAt: $deletedAt, createdAt: $createdAt, updatedAt: $updatedAt, countryId: $countryId, stateId: $stateId, profilePhoto: $profilePhoto, uploadsLeft: $uploadsLeft, activeStatus: $activeStatus, avatar: $avatar, darkMode: $darkMode, messengerColor: $messengerColor)';
}


}

/// @nodoc
abstract mixin class $UserCopyWith<$Res>  {
  factory $UserCopyWith(User value, $Res Function(User) _then) = _$UserCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id') String id,@JsonKey(name: 'name') String? name,@JsonKey(name: 'email') String? email,@JsonKey(name: 'phone') String? phone,@JsonKey(name: 'email_verified_at') String? emailVerifiedAt,@JsonKey(name: 'paid_seller', fromJson: _parseNullableInt) int? paidSeller,@JsonKey(name: 'deleted_at') String? deletedAt,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'updated_at') String? updatedAt,@JsonKey(name: 'country_id', fromJson: _parseNullableInt) int? countryId,@JsonKey(name: 'state_id', fromJson: _parseNullableInt) int? stateId,@JsonKey(name: 'profile_photo') String? profilePhoto,@JsonKey(name: 'uploads_left', fromJson: _parseNullableInt) int? uploadsLeft,@JsonKey(name: 'active_status', fromJson: _parseNullableInt) int? activeStatus,@JsonKey(name: 'avatar') String? avatar,@JsonKey(name: 'dark_mode', fromJson: _parseNullableInt) int? darkMode,@JsonKey(name: 'messenger_color') String? messengerColor
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = freezed,Object? email = freezed,Object? phone = freezed,Object? emailVerifiedAt = freezed,Object? paidSeller = freezed,Object? deletedAt = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? countryId = freezed,Object? stateId = freezed,Object? profilePhoto = freezed,Object? uploadsLeft = freezed,Object? activeStatus = freezed,Object? avatar = freezed,Object? darkMode = freezed,Object? messengerColor = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,emailVerifiedAt: freezed == emailVerifiedAt ? _self.emailVerifiedAt : emailVerifiedAt // ignore: cast_nullable_to_non_nullable
as String?,paidSeller: freezed == paidSeller ? _self.paidSeller : paidSeller // ignore: cast_nullable_to_non_nullable
as int?,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,countryId: freezed == countryId ? _self.countryId : countryId // ignore: cast_nullable_to_non_nullable
as int?,stateId: freezed == stateId ? _self.stateId : stateId // ignore: cast_nullable_to_non_nullable
as int?,profilePhoto: freezed == profilePhoto ? _self.profilePhoto : profilePhoto // ignore: cast_nullable_to_non_nullable
as String?,uploadsLeft: freezed == uploadsLeft ? _self.uploadsLeft : uploadsLeft // ignore: cast_nullable_to_non_nullable
as int?,activeStatus: freezed == activeStatus ? _self.activeStatus : activeStatus // ignore: cast_nullable_to_non_nullable
as int?,avatar: freezed == avatar ? _self.avatar : avatar // ignore: cast_nullable_to_non_nullable
as String?,darkMode: freezed == darkMode ? _self.darkMode : darkMode // ignore: cast_nullable_to_non_nullable
as int?,messengerColor: freezed == messengerColor ? _self.messengerColor : messengerColor // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  String id, @JsonKey(name: 'name')  String? name, @JsonKey(name: 'email')  String? email, @JsonKey(name: 'phone')  String? phone, @JsonKey(name: 'email_verified_at')  String? emailVerifiedAt, @JsonKey(name: 'paid_seller', fromJson: _parseNullableInt)  int? paidSeller, @JsonKey(name: 'deleted_at')  String? deletedAt, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt, @JsonKey(name: 'country_id', fromJson: _parseNullableInt)  int? countryId, @JsonKey(name: 'state_id', fromJson: _parseNullableInt)  int? stateId, @JsonKey(name: 'profile_photo')  String? profilePhoto, @JsonKey(name: 'uploads_left', fromJson: _parseNullableInt)  int? uploadsLeft, @JsonKey(name: 'active_status', fromJson: _parseNullableInt)  int? activeStatus, @JsonKey(name: 'avatar')  String? avatar, @JsonKey(name: 'dark_mode', fromJson: _parseNullableInt)  int? darkMode, @JsonKey(name: 'messenger_color')  String? messengerColor)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _User() when $default != null:
return $default(_that.id,_that.name,_that.email,_that.phone,_that.emailVerifiedAt,_that.paidSeller,_that.deletedAt,_that.createdAt,_that.updatedAt,_that.countryId,_that.stateId,_that.profilePhoto,_that.uploadsLeft,_that.activeStatus,_that.avatar,_that.darkMode,_that.messengerColor);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  String id, @JsonKey(name: 'name')  String? name, @JsonKey(name: 'email')  String? email, @JsonKey(name: 'phone')  String? phone, @JsonKey(name: 'email_verified_at')  String? emailVerifiedAt, @JsonKey(name: 'paid_seller', fromJson: _parseNullableInt)  int? paidSeller, @JsonKey(name: 'deleted_at')  String? deletedAt, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt, @JsonKey(name: 'country_id', fromJson: _parseNullableInt)  int? countryId, @JsonKey(name: 'state_id', fromJson: _parseNullableInt)  int? stateId, @JsonKey(name: 'profile_photo')  String? profilePhoto, @JsonKey(name: 'uploads_left', fromJson: _parseNullableInt)  int? uploadsLeft, @JsonKey(name: 'active_status', fromJson: _parseNullableInt)  int? activeStatus, @JsonKey(name: 'avatar')  String? avatar, @JsonKey(name: 'dark_mode', fromJson: _parseNullableInt)  int? darkMode, @JsonKey(name: 'messenger_color')  String? messengerColor)  $default,) {final _that = this;
switch (_that) {
case _User():
return $default(_that.id,_that.name,_that.email,_that.phone,_that.emailVerifiedAt,_that.paidSeller,_that.deletedAt,_that.createdAt,_that.updatedAt,_that.countryId,_that.stateId,_that.profilePhoto,_that.uploadsLeft,_that.activeStatus,_that.avatar,_that.darkMode,_that.messengerColor);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id')  String id, @JsonKey(name: 'name')  String? name, @JsonKey(name: 'email')  String? email, @JsonKey(name: 'phone')  String? phone, @JsonKey(name: 'email_verified_at')  String? emailVerifiedAt, @JsonKey(name: 'paid_seller', fromJson: _parseNullableInt)  int? paidSeller, @JsonKey(name: 'deleted_at')  String? deletedAt, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt, @JsonKey(name: 'country_id', fromJson: _parseNullableInt)  int? countryId, @JsonKey(name: 'state_id', fromJson: _parseNullableInt)  int? stateId, @JsonKey(name: 'profile_photo')  String? profilePhoto, @JsonKey(name: 'uploads_left', fromJson: _parseNullableInt)  int? uploadsLeft, @JsonKey(name: 'active_status', fromJson: _parseNullableInt)  int? activeStatus, @JsonKey(name: 'avatar')  String? avatar, @JsonKey(name: 'dark_mode', fromJson: _parseNullableInt)  int? darkMode, @JsonKey(name: 'messenger_color')  String? messengerColor)?  $default,) {final _that = this;
switch (_that) {
case _User() when $default != null:
return $default(_that.id,_that.name,_that.email,_that.phone,_that.emailVerifiedAt,_that.paidSeller,_that.deletedAt,_that.createdAt,_that.updatedAt,_that.countryId,_that.stateId,_that.profilePhoto,_that.uploadsLeft,_that.activeStatus,_that.avatar,_that.darkMode,_that.messengerColor);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _User implements User {
  const _User({@JsonKey(name: 'id') required this.id, @JsonKey(name: 'name') this.name, @JsonKey(name: 'email') this.email, @JsonKey(name: 'phone') this.phone, @JsonKey(name: 'email_verified_at') this.emailVerifiedAt, @JsonKey(name: 'paid_seller', fromJson: _parseNullableInt) this.paidSeller, @JsonKey(name: 'deleted_at') this.deletedAt, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt, @JsonKey(name: 'country_id', fromJson: _parseNullableInt) this.countryId, @JsonKey(name: 'state_id', fromJson: _parseNullableInt) this.stateId, @JsonKey(name: 'profile_photo') this.profilePhoto, @JsonKey(name: 'uploads_left', fromJson: _parseNullableInt) this.uploadsLeft, @JsonKey(name: 'active_status', fromJson: _parseNullableInt) this.activeStatus, @JsonKey(name: 'avatar') this.avatar, @JsonKey(name: 'dark_mode', fromJson: _parseNullableInt) this.darkMode, @JsonKey(name: 'messenger_color') this.messengerColor});
  factory _User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

@override@JsonKey(name: 'id') final  String id;
@override@JsonKey(name: 'name') final  String? name;
@override@JsonKey(name: 'email') final  String? email;
@override@JsonKey(name: 'phone') final  String? phone;
@override@JsonKey(name: 'email_verified_at') final  String? emailVerifiedAt;
@override@JsonKey(name: 'paid_seller', fromJson: _parseNullableInt) final  int? paidSeller;
@override@JsonKey(name: 'deleted_at') final  String? deletedAt;
@override@JsonKey(name: 'created_at') final  String? createdAt;
@override@JsonKey(name: 'updated_at') final  String? updatedAt;
@override@JsonKey(name: 'country_id', fromJson: _parseNullableInt) final  int? countryId;
@override@JsonKey(name: 'state_id', fromJson: _parseNullableInt) final  int? stateId;
@override@JsonKey(name: 'profile_photo') final  String? profilePhoto;
@override@JsonKey(name: 'uploads_left', fromJson: _parseNullableInt) final  int? uploadsLeft;
@override@JsonKey(name: 'active_status', fromJson: _parseNullableInt) final  int? activeStatus;
@override@JsonKey(name: 'avatar') final  String? avatar;
@override@JsonKey(name: 'dark_mode', fromJson: _parseNullableInt) final  int? darkMode;
@override@JsonKey(name: 'messenger_color') final  String? messengerColor;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _User&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.emailVerifiedAt, emailVerifiedAt) || other.emailVerifiedAt == emailVerifiedAt)&&(identical(other.paidSeller, paidSeller) || other.paidSeller == paidSeller)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.countryId, countryId) || other.countryId == countryId)&&(identical(other.stateId, stateId) || other.stateId == stateId)&&(identical(other.profilePhoto, profilePhoto) || other.profilePhoto == profilePhoto)&&(identical(other.uploadsLeft, uploadsLeft) || other.uploadsLeft == uploadsLeft)&&(identical(other.activeStatus, activeStatus) || other.activeStatus == activeStatus)&&(identical(other.avatar, avatar) || other.avatar == avatar)&&(identical(other.darkMode, darkMode) || other.darkMode == darkMode)&&(identical(other.messengerColor, messengerColor) || other.messengerColor == messengerColor));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,email,phone,emailVerifiedAt,paidSeller,deletedAt,createdAt,updatedAt,countryId,stateId,profilePhoto,uploadsLeft,activeStatus,avatar,darkMode,messengerColor);

@override
String toString() {
  return 'User(id: $id, name: $name, email: $email, phone: $phone, emailVerifiedAt: $emailVerifiedAt, paidSeller: $paidSeller, deletedAt: $deletedAt, createdAt: $createdAt, updatedAt: $updatedAt, countryId: $countryId, stateId: $stateId, profilePhoto: $profilePhoto, uploadsLeft: $uploadsLeft, activeStatus: $activeStatus, avatar: $avatar, darkMode: $darkMode, messengerColor: $messengerColor)';
}


}

/// @nodoc
abstract mixin class _$UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$UserCopyWith(_User value, $Res Function(_User) _then) = __$UserCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id') String id,@JsonKey(name: 'name') String? name,@JsonKey(name: 'email') String? email,@JsonKey(name: 'phone') String? phone,@JsonKey(name: 'email_verified_at') String? emailVerifiedAt,@JsonKey(name: 'paid_seller', fromJson: _parseNullableInt) int? paidSeller,@JsonKey(name: 'deleted_at') String? deletedAt,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'updated_at') String? updatedAt,@JsonKey(name: 'country_id', fromJson: _parseNullableInt) int? countryId,@JsonKey(name: 'state_id', fromJson: _parseNullableInt) int? stateId,@JsonKey(name: 'profile_photo') String? profilePhoto,@JsonKey(name: 'uploads_left', fromJson: _parseNullableInt) int? uploadsLeft,@JsonKey(name: 'active_status', fromJson: _parseNullableInt) int? activeStatus,@JsonKey(name: 'avatar') String? avatar,@JsonKey(name: 'dark_mode', fromJson: _parseNullableInt) int? darkMode,@JsonKey(name: 'messenger_color') String? messengerColor
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = freezed,Object? email = freezed,Object? phone = freezed,Object? emailVerifiedAt = freezed,Object? paidSeller = freezed,Object? deletedAt = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? countryId = freezed,Object? stateId = freezed,Object? profilePhoto = freezed,Object? uploadsLeft = freezed,Object? activeStatus = freezed,Object? avatar = freezed,Object? darkMode = freezed,Object? messengerColor = freezed,}) {
  return _then(_User(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,emailVerifiedAt: freezed == emailVerifiedAt ? _self.emailVerifiedAt : emailVerifiedAt // ignore: cast_nullable_to_non_nullable
as String?,paidSeller: freezed == paidSeller ? _self.paidSeller : paidSeller // ignore: cast_nullable_to_non_nullable
as int?,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,countryId: freezed == countryId ? _self.countryId : countryId // ignore: cast_nullable_to_non_nullable
as int?,stateId: freezed == stateId ? _self.stateId : stateId // ignore: cast_nullable_to_non_nullable
as int?,profilePhoto: freezed == profilePhoto ? _self.profilePhoto : profilePhoto // ignore: cast_nullable_to_non_nullable
as String?,uploadsLeft: freezed == uploadsLeft ? _self.uploadsLeft : uploadsLeft // ignore: cast_nullable_to_non_nullable
as int?,activeStatus: freezed == activeStatus ? _self.activeStatus : activeStatus // ignore: cast_nullable_to_non_nullable
as int?,avatar: freezed == avatar ? _self.avatar : avatar // ignore: cast_nullable_to_non_nullable
as String?,darkMode: freezed == darkMode ? _self.darkMode : darkMode // ignore: cast_nullable_to_non_nullable
as int?,messengerColor: freezed == messengerColor ? _self.messengerColor : messengerColor // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$PaginationLinks {

@JsonKey(name: 'first') String? get first;@JsonKey(name: 'last') String? get last;@JsonKey(name: 'prev') String? get prev;@JsonKey(name: 'next') String? get next;
/// Create a copy of PaginationLinks
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaginationLinksCopyWith<PaginationLinks> get copyWith => _$PaginationLinksCopyWithImpl<PaginationLinks>(this as PaginationLinks, _$identity);

  /// Serializes this PaginationLinks to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaginationLinks&&(identical(other.first, first) || other.first == first)&&(identical(other.last, last) || other.last == last)&&(identical(other.prev, prev) || other.prev == prev)&&(identical(other.next, next) || other.next == next));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,first,last,prev,next);

@override
String toString() {
  return 'PaginationLinks(first: $first, last: $last, prev: $prev, next: $next)';
}


}

/// @nodoc
abstract mixin class $PaginationLinksCopyWith<$Res>  {
  factory $PaginationLinksCopyWith(PaginationLinks value, $Res Function(PaginationLinks) _then) = _$PaginationLinksCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'first') String? first,@JsonKey(name: 'last') String? last,@JsonKey(name: 'prev') String? prev,@JsonKey(name: 'next') String? next
});




}
/// @nodoc
class _$PaginationLinksCopyWithImpl<$Res>
    implements $PaginationLinksCopyWith<$Res> {
  _$PaginationLinksCopyWithImpl(this._self, this._then);

  final PaginationLinks _self;
  final $Res Function(PaginationLinks) _then;

/// Create a copy of PaginationLinks
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? first = freezed,Object? last = freezed,Object? prev = freezed,Object? next = freezed,}) {
  return _then(_self.copyWith(
first: freezed == first ? _self.first : first // ignore: cast_nullable_to_non_nullable
as String?,last: freezed == last ? _self.last : last // ignore: cast_nullable_to_non_nullable
as String?,prev: freezed == prev ? _self.prev : prev // ignore: cast_nullable_to_non_nullable
as String?,next: freezed == next ? _self.next : next // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PaginationLinks].
extension PaginationLinksPatterns on PaginationLinks {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaginationLinks value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaginationLinks() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaginationLinks value)  $default,){
final _that = this;
switch (_that) {
case _PaginationLinks():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaginationLinks value)?  $default,){
final _that = this;
switch (_that) {
case _PaginationLinks() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'first')  String? first, @JsonKey(name: 'last')  String? last, @JsonKey(name: 'prev')  String? prev, @JsonKey(name: 'next')  String? next)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaginationLinks() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'first')  String? first, @JsonKey(name: 'last')  String? last, @JsonKey(name: 'prev')  String? prev, @JsonKey(name: 'next')  String? next)  $default,) {final _that = this;
switch (_that) {
case _PaginationLinks():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'first')  String? first, @JsonKey(name: 'last')  String? last, @JsonKey(name: 'prev')  String? prev, @JsonKey(name: 'next')  String? next)?  $default,) {final _that = this;
switch (_that) {
case _PaginationLinks() when $default != null:
return $default(_that.first,_that.last,_that.prev,_that.next);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PaginationLinks implements PaginationLinks {
  const _PaginationLinks({@JsonKey(name: 'first') this.first, @JsonKey(name: 'last') this.last, @JsonKey(name: 'prev') this.prev, @JsonKey(name: 'next') this.next});
  factory _PaginationLinks.fromJson(Map<String, dynamic> json) => _$PaginationLinksFromJson(json);

@override@JsonKey(name: 'first') final  String? first;
@override@JsonKey(name: 'last') final  String? last;
@override@JsonKey(name: 'prev') final  String? prev;
@override@JsonKey(name: 'next') final  String? next;

/// Create a copy of PaginationLinks
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaginationLinksCopyWith<_PaginationLinks> get copyWith => __$PaginationLinksCopyWithImpl<_PaginationLinks>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaginationLinksToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaginationLinks&&(identical(other.first, first) || other.first == first)&&(identical(other.last, last) || other.last == last)&&(identical(other.prev, prev) || other.prev == prev)&&(identical(other.next, next) || other.next == next));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,first,last,prev,next);

@override
String toString() {
  return 'PaginationLinks(first: $first, last: $last, prev: $prev, next: $next)';
}


}

/// @nodoc
abstract mixin class _$PaginationLinksCopyWith<$Res> implements $PaginationLinksCopyWith<$Res> {
  factory _$PaginationLinksCopyWith(_PaginationLinks value, $Res Function(_PaginationLinks) _then) = __$PaginationLinksCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'first') String? first,@JsonKey(name: 'last') String? last,@JsonKey(name: 'prev') String? prev,@JsonKey(name: 'next') String? next
});




}
/// @nodoc
class __$PaginationLinksCopyWithImpl<$Res>
    implements _$PaginationLinksCopyWith<$Res> {
  __$PaginationLinksCopyWithImpl(this._self, this._then);

  final _PaginationLinks _self;
  final $Res Function(_PaginationLinks) _then;

/// Create a copy of PaginationLinks
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? first = freezed,Object? last = freezed,Object? prev = freezed,Object? next = freezed,}) {
  return _then(_PaginationLinks(
first: freezed == first ? _self.first : first // ignore: cast_nullable_to_non_nullable
as String?,last: freezed == last ? _self.last : last // ignore: cast_nullable_to_non_nullable
as String?,prev: freezed == prev ? _self.prev : prev // ignore: cast_nullable_to_non_nullable
as String?,next: freezed == next ? _self.next : next // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$PaginationMeta {

@JsonKey(name: 'current_page', fromJson: _parseNullableInt) int? get currentPage;@JsonKey(name: 'from', fromJson: _parseNullableInt) int? get from;@JsonKey(name: 'last_page', fromJson: _parseNullableInt) int? get lastPage;@JsonKey(name: 'links') List<PaginationLink>? get links;@JsonKey(name: 'path') String? get path;@JsonKey(name: 'per_page', fromJson: _parseNullableInt) int? get perPage;@JsonKey(name: 'to', fromJson: _parseNullableInt) int? get to;@JsonKey(name: 'total', fromJson: _parseNullableInt) int? get total;
/// Create a copy of PaginationMeta
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaginationMetaCopyWith<PaginationMeta> get copyWith => _$PaginationMetaCopyWithImpl<PaginationMeta>(this as PaginationMeta, _$identity);

  /// Serializes this PaginationMeta to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaginationMeta&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.from, from) || other.from == from)&&(identical(other.lastPage, lastPage) || other.lastPage == lastPage)&&const DeepCollectionEquality().equals(other.links, links)&&(identical(other.path, path) || other.path == path)&&(identical(other.perPage, perPage) || other.perPage == perPage)&&(identical(other.to, to) || other.to == to)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,currentPage,from,lastPage,const DeepCollectionEquality().hash(links),path,perPage,to,total);

@override
String toString() {
  return 'PaginationMeta(currentPage: $currentPage, from: $from, lastPage: $lastPage, links: $links, path: $path, perPage: $perPage, to: $to, total: $total)';
}


}

/// @nodoc
abstract mixin class $PaginationMetaCopyWith<$Res>  {
  factory $PaginationMetaCopyWith(PaginationMeta value, $Res Function(PaginationMeta) _then) = _$PaginationMetaCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'current_page', fromJson: _parseNullableInt) int? currentPage,@JsonKey(name: 'from', fromJson: _parseNullableInt) int? from,@JsonKey(name: 'last_page', fromJson: _parseNullableInt) int? lastPage,@JsonKey(name: 'links') List<PaginationLink>? links,@JsonKey(name: 'path') String? path,@JsonKey(name: 'per_page', fromJson: _parseNullableInt) int? perPage,@JsonKey(name: 'to', fromJson: _parseNullableInt) int? to,@JsonKey(name: 'total', fromJson: _parseNullableInt) int? total
});




}
/// @nodoc
class _$PaginationMetaCopyWithImpl<$Res>
    implements $PaginationMetaCopyWith<$Res> {
  _$PaginationMetaCopyWithImpl(this._self, this._then);

  final PaginationMeta _self;
  final $Res Function(PaginationMeta) _then;

/// Create a copy of PaginationMeta
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currentPage = freezed,Object? from = freezed,Object? lastPage = freezed,Object? links = freezed,Object? path = freezed,Object? perPage = freezed,Object? to = freezed,Object? total = freezed,}) {
  return _then(_self.copyWith(
currentPage: freezed == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int?,from: freezed == from ? _self.from : from // ignore: cast_nullable_to_non_nullable
as int?,lastPage: freezed == lastPage ? _self.lastPage : lastPage // ignore: cast_nullable_to_non_nullable
as int?,links: freezed == links ? _self.links : links // ignore: cast_nullable_to_non_nullable
as List<PaginationLink>?,path: freezed == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String?,perPage: freezed == perPage ? _self.perPage : perPage // ignore: cast_nullable_to_non_nullable
as int?,to: freezed == to ? _self.to : to // ignore: cast_nullable_to_non_nullable
as int?,total: freezed == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [PaginationMeta].
extension PaginationMetaPatterns on PaginationMeta {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaginationMeta value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaginationMeta() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaginationMeta value)  $default,){
final _that = this;
switch (_that) {
case _PaginationMeta():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaginationMeta value)?  $default,){
final _that = this;
switch (_that) {
case _PaginationMeta() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'current_page', fromJson: _parseNullableInt)  int? currentPage, @JsonKey(name: 'from', fromJson: _parseNullableInt)  int? from, @JsonKey(name: 'last_page', fromJson: _parseNullableInt)  int? lastPage, @JsonKey(name: 'links')  List<PaginationLink>? links, @JsonKey(name: 'path')  String? path, @JsonKey(name: 'per_page', fromJson: _parseNullableInt)  int? perPage, @JsonKey(name: 'to', fromJson: _parseNullableInt)  int? to, @JsonKey(name: 'total', fromJson: _parseNullableInt)  int? total)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaginationMeta() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'current_page', fromJson: _parseNullableInt)  int? currentPage, @JsonKey(name: 'from', fromJson: _parseNullableInt)  int? from, @JsonKey(name: 'last_page', fromJson: _parseNullableInt)  int? lastPage, @JsonKey(name: 'links')  List<PaginationLink>? links, @JsonKey(name: 'path')  String? path, @JsonKey(name: 'per_page', fromJson: _parseNullableInt)  int? perPage, @JsonKey(name: 'to', fromJson: _parseNullableInt)  int? to, @JsonKey(name: 'total', fromJson: _parseNullableInt)  int? total)  $default,) {final _that = this;
switch (_that) {
case _PaginationMeta():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'current_page', fromJson: _parseNullableInt)  int? currentPage, @JsonKey(name: 'from', fromJson: _parseNullableInt)  int? from, @JsonKey(name: 'last_page', fromJson: _parseNullableInt)  int? lastPage, @JsonKey(name: 'links')  List<PaginationLink>? links, @JsonKey(name: 'path')  String? path, @JsonKey(name: 'per_page', fromJson: _parseNullableInt)  int? perPage, @JsonKey(name: 'to', fromJson: _parseNullableInt)  int? to, @JsonKey(name: 'total', fromJson: _parseNullableInt)  int? total)?  $default,) {final _that = this;
switch (_that) {
case _PaginationMeta() when $default != null:
return $default(_that.currentPage,_that.from,_that.lastPage,_that.links,_that.path,_that.perPage,_that.to,_that.total);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PaginationMeta implements PaginationMeta {
  const _PaginationMeta({@JsonKey(name: 'current_page', fromJson: _parseNullableInt) this.currentPage, @JsonKey(name: 'from', fromJson: _parseNullableInt) this.from, @JsonKey(name: 'last_page', fromJson: _parseNullableInt) this.lastPage, @JsonKey(name: 'links') final  List<PaginationLink>? links, @JsonKey(name: 'path') this.path, @JsonKey(name: 'per_page', fromJson: _parseNullableInt) this.perPage, @JsonKey(name: 'to', fromJson: _parseNullableInt) this.to, @JsonKey(name: 'total', fromJson: _parseNullableInt) this.total}): _links = links;
  factory _PaginationMeta.fromJson(Map<String, dynamic> json) => _$PaginationMetaFromJson(json);

@override@JsonKey(name: 'current_page', fromJson: _parseNullableInt) final  int? currentPage;
@override@JsonKey(name: 'from', fromJson: _parseNullableInt) final  int? from;
@override@JsonKey(name: 'last_page', fromJson: _parseNullableInt) final  int? lastPage;
 final  List<PaginationLink>? _links;
@override@JsonKey(name: 'links') List<PaginationLink>? get links {
  final value = _links;
  if (value == null) return null;
  if (_links is EqualUnmodifiableListView) return _links;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey(name: 'path') final  String? path;
@override@JsonKey(name: 'per_page', fromJson: _parseNullableInt) final  int? perPage;
@override@JsonKey(name: 'to', fromJson: _parseNullableInt) final  int? to;
@override@JsonKey(name: 'total', fromJson: _parseNullableInt) final  int? total;

/// Create a copy of PaginationMeta
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaginationMetaCopyWith<_PaginationMeta> get copyWith => __$PaginationMetaCopyWithImpl<_PaginationMeta>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaginationMetaToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaginationMeta&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.from, from) || other.from == from)&&(identical(other.lastPage, lastPage) || other.lastPage == lastPage)&&const DeepCollectionEquality().equals(other._links, _links)&&(identical(other.path, path) || other.path == path)&&(identical(other.perPage, perPage) || other.perPage == perPage)&&(identical(other.to, to) || other.to == to)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,currentPage,from,lastPage,const DeepCollectionEquality().hash(_links),path,perPage,to,total);

@override
String toString() {
  return 'PaginationMeta(currentPage: $currentPage, from: $from, lastPage: $lastPage, links: $links, path: $path, perPage: $perPage, to: $to, total: $total)';
}


}

/// @nodoc
abstract mixin class _$PaginationMetaCopyWith<$Res> implements $PaginationMetaCopyWith<$Res> {
  factory _$PaginationMetaCopyWith(_PaginationMeta value, $Res Function(_PaginationMeta) _then) = __$PaginationMetaCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'current_page', fromJson: _parseNullableInt) int? currentPage,@JsonKey(name: 'from', fromJson: _parseNullableInt) int? from,@JsonKey(name: 'last_page', fromJson: _parseNullableInt) int? lastPage,@JsonKey(name: 'links') List<PaginationLink>? links,@JsonKey(name: 'path') String? path,@JsonKey(name: 'per_page', fromJson: _parseNullableInt) int? perPage,@JsonKey(name: 'to', fromJson: _parseNullableInt) int? to,@JsonKey(name: 'total', fromJson: _parseNullableInt) int? total
});




}
/// @nodoc
class __$PaginationMetaCopyWithImpl<$Res>
    implements _$PaginationMetaCopyWith<$Res> {
  __$PaginationMetaCopyWithImpl(this._self, this._then);

  final _PaginationMeta _self;
  final $Res Function(_PaginationMeta) _then;

/// Create a copy of PaginationMeta
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currentPage = freezed,Object? from = freezed,Object? lastPage = freezed,Object? links = freezed,Object? path = freezed,Object? perPage = freezed,Object? to = freezed,Object? total = freezed,}) {
  return _then(_PaginationMeta(
currentPage: freezed == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int?,from: freezed == from ? _self.from : from // ignore: cast_nullable_to_non_nullable
as int?,lastPage: freezed == lastPage ? _self.lastPage : lastPage // ignore: cast_nullable_to_non_nullable
as int?,links: freezed == links ? _self._links : links // ignore: cast_nullable_to_non_nullable
as List<PaginationLink>?,path: freezed == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String?,perPage: freezed == perPage ? _self.perPage : perPage // ignore: cast_nullable_to_non_nullable
as int?,to: freezed == to ? _self.to : to // ignore: cast_nullable_to_non_nullable
as int?,total: freezed == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$PaginationLink {

@JsonKey(name: 'url') String? get url;@JsonKey(name: 'label') String? get label;@JsonKey(name: 'active') bool? get active;
/// Create a copy of PaginationLink
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaginationLinkCopyWith<PaginationLink> get copyWith => _$PaginationLinkCopyWithImpl<PaginationLink>(this as PaginationLink, _$identity);

  /// Serializes this PaginationLink to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaginationLink&&(identical(other.url, url) || other.url == url)&&(identical(other.label, label) || other.label == label)&&(identical(other.active, active) || other.active == active));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,url,label,active);

@override
String toString() {
  return 'PaginationLink(url: $url, label: $label, active: $active)';
}


}

/// @nodoc
abstract mixin class $PaginationLinkCopyWith<$Res>  {
  factory $PaginationLinkCopyWith(PaginationLink value, $Res Function(PaginationLink) _then) = _$PaginationLinkCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'url') String? url,@JsonKey(name: 'label') String? label,@JsonKey(name: 'active') bool? active
});




}
/// @nodoc
class _$PaginationLinkCopyWithImpl<$Res>
    implements $PaginationLinkCopyWith<$Res> {
  _$PaginationLinkCopyWithImpl(this._self, this._then);

  final PaginationLink _self;
  final $Res Function(PaginationLink) _then;

/// Create a copy of PaginationLink
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? url = freezed,Object? label = freezed,Object? active = freezed,}) {
  return _then(_self.copyWith(
url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,label: freezed == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String?,active: freezed == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [PaginationLink].
extension PaginationLinkPatterns on PaginationLink {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaginationLink value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaginationLink() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaginationLink value)  $default,){
final _that = this;
switch (_that) {
case _PaginationLink():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaginationLink value)?  $default,){
final _that = this;
switch (_that) {
case _PaginationLink() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'url')  String? url, @JsonKey(name: 'label')  String? label, @JsonKey(name: 'active')  bool? active)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaginationLink() when $default != null:
return $default(_that.url,_that.label,_that.active);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'url')  String? url, @JsonKey(name: 'label')  String? label, @JsonKey(name: 'active')  bool? active)  $default,) {final _that = this;
switch (_that) {
case _PaginationLink():
return $default(_that.url,_that.label,_that.active);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'url')  String? url, @JsonKey(name: 'label')  String? label, @JsonKey(name: 'active')  bool? active)?  $default,) {final _that = this;
switch (_that) {
case _PaginationLink() when $default != null:
return $default(_that.url,_that.label,_that.active);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PaginationLink implements PaginationLink {
  const _PaginationLink({@JsonKey(name: 'url') this.url, @JsonKey(name: 'label') this.label, @JsonKey(name: 'active') this.active});
  factory _PaginationLink.fromJson(Map<String, dynamic> json) => _$PaginationLinkFromJson(json);

@override@JsonKey(name: 'url') final  String? url;
@override@JsonKey(name: 'label') final  String? label;
@override@JsonKey(name: 'active') final  bool? active;

/// Create a copy of PaginationLink
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaginationLinkCopyWith<_PaginationLink> get copyWith => __$PaginationLinkCopyWithImpl<_PaginationLink>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaginationLinkToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaginationLink&&(identical(other.url, url) || other.url == url)&&(identical(other.label, label) || other.label == label)&&(identical(other.active, active) || other.active == active));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,url,label,active);

@override
String toString() {
  return 'PaginationLink(url: $url, label: $label, active: $active)';
}


}

/// @nodoc
abstract mixin class _$PaginationLinkCopyWith<$Res> implements $PaginationLinkCopyWith<$Res> {
  factory _$PaginationLinkCopyWith(_PaginationLink value, $Res Function(_PaginationLink) _then) = __$PaginationLinkCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'url') String? url,@JsonKey(name: 'label') String? label,@JsonKey(name: 'active') bool? active
});




}
/// @nodoc
class __$PaginationLinkCopyWithImpl<$Res>
    implements _$PaginationLinkCopyWith<$Res> {
  __$PaginationLinkCopyWithImpl(this._self, this._then);

  final _PaginationLink _self;
  final $Res Function(_PaginationLink) _then;

/// Create a copy of PaginationLink
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? url = freezed,Object? label = freezed,Object? active = freezed,}) {
  return _then(_PaginationLink(
url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,label: freezed == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String?,active: freezed == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

// dart format on
