// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vehicleModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VehicleModel {

 String get user_id; String get vehicle_id; String get vehicleName; String get vehicleType; String get condition; int get year; int? get make;// well change here back to string again
 String get model; VehicleLocation get location; String get price; String get steerPosition; String get engineCapacity; String get transmission; VehicleColor get color; String get buildType; String get mileage; int get numberOfPassengers; List<String> get features; String get description; List<String> get images;
/// Create a copy of VehicleModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VehicleModelCopyWith<VehicleModel> get copyWith => _$VehicleModelCopyWithImpl<VehicleModel>(this as VehicleModel, _$identity);

  /// Serializes this VehicleModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VehicleModel&&(identical(other.user_id, user_id) || other.user_id == user_id)&&(identical(other.vehicle_id, vehicle_id) || other.vehicle_id == vehicle_id)&&(identical(other.vehicleName, vehicleName) || other.vehicleName == vehicleName)&&(identical(other.vehicleType, vehicleType) || other.vehicleType == vehicleType)&&(identical(other.condition, condition) || other.condition == condition)&&(identical(other.year, year) || other.year == year)&&(identical(other.make, make) || other.make == make)&&(identical(other.model, model) || other.model == model)&&(identical(other.location, location) || other.location == location)&&(identical(other.price, price) || other.price == price)&&(identical(other.steerPosition, steerPosition) || other.steerPosition == steerPosition)&&(identical(other.engineCapacity, engineCapacity) || other.engineCapacity == engineCapacity)&&(identical(other.transmission, transmission) || other.transmission == transmission)&&(identical(other.color, color) || other.color == color)&&(identical(other.buildType, buildType) || other.buildType == buildType)&&(identical(other.mileage, mileage) || other.mileage == mileage)&&(identical(other.numberOfPassengers, numberOfPassengers) || other.numberOfPassengers == numberOfPassengers)&&const DeepCollectionEquality().equals(other.features, features)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.images, images));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,user_id,vehicle_id,vehicleName,vehicleType,condition,year,make,model,location,price,steerPosition,engineCapacity,transmission,color,buildType,mileage,numberOfPassengers,const DeepCollectionEquality().hash(features),description,const DeepCollectionEquality().hash(images)]);

@override
String toString() {
  return 'VehicleModel(user_id: $user_id, vehicle_id: $vehicle_id, vehicleName: $vehicleName, vehicleType: $vehicleType, condition: $condition, year: $year, make: $make, model: $model, location: $location, price: $price, steerPosition: $steerPosition, engineCapacity: $engineCapacity, transmission: $transmission, color: $color, buildType: $buildType, mileage: $mileage, numberOfPassengers: $numberOfPassengers, features: $features, description: $description, images: $images)';
}


}

/// @nodoc
abstract mixin class $VehicleModelCopyWith<$Res>  {
  factory $VehicleModelCopyWith(VehicleModel value, $Res Function(VehicleModel) _then) = _$VehicleModelCopyWithImpl;
@useResult
$Res call({
 String user_id, String vehicle_id, String vehicleName, String vehicleType, String condition, int year, int? make, String model, VehicleLocation location, String price, String steerPosition, String engineCapacity, String transmission, VehicleColor color, String buildType, String mileage, int numberOfPassengers, List<String> features, String description, List<String> images
});


$VehicleLocationCopyWith<$Res> get location;$VehicleColorCopyWith<$Res> get color;

}
/// @nodoc
class _$VehicleModelCopyWithImpl<$Res>
    implements $VehicleModelCopyWith<$Res> {
  _$VehicleModelCopyWithImpl(this._self, this._then);

  final VehicleModel _self;
  final $Res Function(VehicleModel) _then;

/// Create a copy of VehicleModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? user_id = null,Object? vehicle_id = null,Object? vehicleName = null,Object? vehicleType = null,Object? condition = null,Object? year = null,Object? make = freezed,Object? model = null,Object? location = null,Object? price = null,Object? steerPosition = null,Object? engineCapacity = null,Object? transmission = null,Object? color = null,Object? buildType = null,Object? mileage = null,Object? numberOfPassengers = null,Object? features = null,Object? description = null,Object? images = null,}) {
  return _then(_self.copyWith(
user_id: null == user_id ? _self.user_id : user_id // ignore: cast_nullable_to_non_nullable
as String,vehicle_id: null == vehicle_id ? _self.vehicle_id : vehicle_id // ignore: cast_nullable_to_non_nullable
as String,vehicleName: null == vehicleName ? _self.vehicleName : vehicleName // ignore: cast_nullable_to_non_nullable
as String,vehicleType: null == vehicleType ? _self.vehicleType : vehicleType // ignore: cast_nullable_to_non_nullable
as String,condition: null == condition ? _self.condition : condition // ignore: cast_nullable_to_non_nullable
as String,year: null == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as int,make: freezed == make ? _self.make : make // ignore: cast_nullable_to_non_nullable
as int?,model: null == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as VehicleLocation,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as String,steerPosition: null == steerPosition ? _self.steerPosition : steerPosition // ignore: cast_nullable_to_non_nullable
as String,engineCapacity: null == engineCapacity ? _self.engineCapacity : engineCapacity // ignore: cast_nullable_to_non_nullable
as String,transmission: null == transmission ? _self.transmission : transmission // ignore: cast_nullable_to_non_nullable
as String,color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as VehicleColor,buildType: null == buildType ? _self.buildType : buildType // ignore: cast_nullable_to_non_nullable
as String,mileage: null == mileage ? _self.mileage : mileage // ignore: cast_nullable_to_non_nullable
as String,numberOfPassengers: null == numberOfPassengers ? _self.numberOfPassengers : numberOfPassengers // ignore: cast_nullable_to_non_nullable
as int,features: null == features ? _self.features : features // ignore: cast_nullable_to_non_nullable
as List<String>,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,images: null == images ? _self.images : images // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}
/// Create a copy of VehicleModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VehicleLocationCopyWith<$Res> get location {
  
  return $VehicleLocationCopyWith<$Res>(_self.location, (value) {
    return _then(_self.copyWith(location: value));
  });
}/// Create a copy of VehicleModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VehicleColorCopyWith<$Res> get color {
  
  return $VehicleColorCopyWith<$Res>(_self.color, (value) {
    return _then(_self.copyWith(color: value));
  });
}
}


/// Adds pattern-matching-related methods to [VehicleModel].
extension VehicleModelPatterns on VehicleModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VehicleModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VehicleModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VehicleModel value)  $default,){
final _that = this;
switch (_that) {
case _VehicleModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VehicleModel value)?  $default,){
final _that = this;
switch (_that) {
case _VehicleModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String user_id,  String vehicle_id,  String vehicleName,  String vehicleType,  String condition,  int year,  int? make,  String model,  VehicleLocation location,  String price,  String steerPosition,  String engineCapacity,  String transmission,  VehicleColor color,  String buildType,  String mileage,  int numberOfPassengers,  List<String> features,  String description,  List<String> images)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VehicleModel() when $default != null:
return $default(_that.user_id,_that.vehicle_id,_that.vehicleName,_that.vehicleType,_that.condition,_that.year,_that.make,_that.model,_that.location,_that.price,_that.steerPosition,_that.engineCapacity,_that.transmission,_that.color,_that.buildType,_that.mileage,_that.numberOfPassengers,_that.features,_that.description,_that.images);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String user_id,  String vehicle_id,  String vehicleName,  String vehicleType,  String condition,  int year,  int? make,  String model,  VehicleLocation location,  String price,  String steerPosition,  String engineCapacity,  String transmission,  VehicleColor color,  String buildType,  String mileage,  int numberOfPassengers,  List<String> features,  String description,  List<String> images)  $default,) {final _that = this;
switch (_that) {
case _VehicleModel():
return $default(_that.user_id,_that.vehicle_id,_that.vehicleName,_that.vehicleType,_that.condition,_that.year,_that.make,_that.model,_that.location,_that.price,_that.steerPosition,_that.engineCapacity,_that.transmission,_that.color,_that.buildType,_that.mileage,_that.numberOfPassengers,_that.features,_that.description,_that.images);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String user_id,  String vehicle_id,  String vehicleName,  String vehicleType,  String condition,  int year,  int? make,  String model,  VehicleLocation location,  String price,  String steerPosition,  String engineCapacity,  String transmission,  VehicleColor color,  String buildType,  String mileage,  int numberOfPassengers,  List<String> features,  String description,  List<String> images)?  $default,) {final _that = this;
switch (_that) {
case _VehicleModel() when $default != null:
return $default(_that.user_id,_that.vehicle_id,_that.vehicleName,_that.vehicleType,_that.condition,_that.year,_that.make,_that.model,_that.location,_that.price,_that.steerPosition,_that.engineCapacity,_that.transmission,_that.color,_that.buildType,_that.mileage,_that.numberOfPassengers,_that.features,_that.description,_that.images);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _VehicleModel implements VehicleModel {
  const _VehicleModel({required this.user_id, required this.vehicle_id, required this.vehicleName, required this.vehicleType, required this.condition, required this.year, required this.make, required this.model, required this.location, required this.price, required this.steerPosition, required this.engineCapacity, required this.transmission, required this.color, required this.buildType, required this.mileage, required this.numberOfPassengers, final  List<String> features = const [], required this.description, final  List<String> images = const []}): _features = features,_images = images;
  factory _VehicleModel.fromJson(Map<String, dynamic> json) => _$VehicleModelFromJson(json);

@override final  String user_id;
@override final  String vehicle_id;
@override final  String vehicleName;
@override final  String vehicleType;
@override final  String condition;
@override final  int year;
@override final  int? make;
// well change here back to string again
@override final  String model;
@override final  VehicleLocation location;
@override final  String price;
@override final  String steerPosition;
@override final  String engineCapacity;
@override final  String transmission;
@override final  VehicleColor color;
@override final  String buildType;
@override final  String mileage;
@override final  int numberOfPassengers;
 final  List<String> _features;
@override@JsonKey() List<String> get features {
  if (_features is EqualUnmodifiableListView) return _features;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_features);
}

@override final  String description;
 final  List<String> _images;
@override@JsonKey() List<String> get images {
  if (_images is EqualUnmodifiableListView) return _images;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_images);
}


/// Create a copy of VehicleModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VehicleModelCopyWith<_VehicleModel> get copyWith => __$VehicleModelCopyWithImpl<_VehicleModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VehicleModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VehicleModel&&(identical(other.user_id, user_id) || other.user_id == user_id)&&(identical(other.vehicle_id, vehicle_id) || other.vehicle_id == vehicle_id)&&(identical(other.vehicleName, vehicleName) || other.vehicleName == vehicleName)&&(identical(other.vehicleType, vehicleType) || other.vehicleType == vehicleType)&&(identical(other.condition, condition) || other.condition == condition)&&(identical(other.year, year) || other.year == year)&&(identical(other.make, make) || other.make == make)&&(identical(other.model, model) || other.model == model)&&(identical(other.location, location) || other.location == location)&&(identical(other.price, price) || other.price == price)&&(identical(other.steerPosition, steerPosition) || other.steerPosition == steerPosition)&&(identical(other.engineCapacity, engineCapacity) || other.engineCapacity == engineCapacity)&&(identical(other.transmission, transmission) || other.transmission == transmission)&&(identical(other.color, color) || other.color == color)&&(identical(other.buildType, buildType) || other.buildType == buildType)&&(identical(other.mileage, mileage) || other.mileage == mileage)&&(identical(other.numberOfPassengers, numberOfPassengers) || other.numberOfPassengers == numberOfPassengers)&&const DeepCollectionEquality().equals(other._features, _features)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._images, _images));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,user_id,vehicle_id,vehicleName,vehicleType,condition,year,make,model,location,price,steerPosition,engineCapacity,transmission,color,buildType,mileage,numberOfPassengers,const DeepCollectionEquality().hash(_features),description,const DeepCollectionEquality().hash(_images)]);

@override
String toString() {
  return 'VehicleModel(user_id: $user_id, vehicle_id: $vehicle_id, vehicleName: $vehicleName, vehicleType: $vehicleType, condition: $condition, year: $year, make: $make, model: $model, location: $location, price: $price, steerPosition: $steerPosition, engineCapacity: $engineCapacity, transmission: $transmission, color: $color, buildType: $buildType, mileage: $mileage, numberOfPassengers: $numberOfPassengers, features: $features, description: $description, images: $images)';
}


}

/// @nodoc
abstract mixin class _$VehicleModelCopyWith<$Res> implements $VehicleModelCopyWith<$Res> {
  factory _$VehicleModelCopyWith(_VehicleModel value, $Res Function(_VehicleModel) _then) = __$VehicleModelCopyWithImpl;
@override @useResult
$Res call({
 String user_id, String vehicle_id, String vehicleName, String vehicleType, String condition, int year, int? make, String model, VehicleLocation location, String price, String steerPosition, String engineCapacity, String transmission, VehicleColor color, String buildType, String mileage, int numberOfPassengers, List<String> features, String description, List<String> images
});


@override $VehicleLocationCopyWith<$Res> get location;@override $VehicleColorCopyWith<$Res> get color;

}
/// @nodoc
class __$VehicleModelCopyWithImpl<$Res>
    implements _$VehicleModelCopyWith<$Res> {
  __$VehicleModelCopyWithImpl(this._self, this._then);

  final _VehicleModel _self;
  final $Res Function(_VehicleModel) _then;

/// Create a copy of VehicleModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? user_id = null,Object? vehicle_id = null,Object? vehicleName = null,Object? vehicleType = null,Object? condition = null,Object? year = null,Object? make = freezed,Object? model = null,Object? location = null,Object? price = null,Object? steerPosition = null,Object? engineCapacity = null,Object? transmission = null,Object? color = null,Object? buildType = null,Object? mileage = null,Object? numberOfPassengers = null,Object? features = null,Object? description = null,Object? images = null,}) {
  return _then(_VehicleModel(
user_id: null == user_id ? _self.user_id : user_id // ignore: cast_nullable_to_non_nullable
as String,vehicle_id: null == vehicle_id ? _self.vehicle_id : vehicle_id // ignore: cast_nullable_to_non_nullable
as String,vehicleName: null == vehicleName ? _self.vehicleName : vehicleName // ignore: cast_nullable_to_non_nullable
as String,vehicleType: null == vehicleType ? _self.vehicleType : vehicleType // ignore: cast_nullable_to_non_nullable
as String,condition: null == condition ? _self.condition : condition // ignore: cast_nullable_to_non_nullable
as String,year: null == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as int,make: freezed == make ? _self.make : make // ignore: cast_nullable_to_non_nullable
as int?,model: null == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as VehicleLocation,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as String,steerPosition: null == steerPosition ? _self.steerPosition : steerPosition // ignore: cast_nullable_to_non_nullable
as String,engineCapacity: null == engineCapacity ? _self.engineCapacity : engineCapacity // ignore: cast_nullable_to_non_nullable
as String,transmission: null == transmission ? _self.transmission : transmission // ignore: cast_nullable_to_non_nullable
as String,color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as VehicleColor,buildType: null == buildType ? _self.buildType : buildType // ignore: cast_nullable_to_non_nullable
as String,mileage: null == mileage ? _self.mileage : mileage // ignore: cast_nullable_to_non_nullable
as String,numberOfPassengers: null == numberOfPassengers ? _self.numberOfPassengers : numberOfPassengers // ignore: cast_nullable_to_non_nullable
as int,features: null == features ? _self._features : features // ignore: cast_nullable_to_non_nullable
as List<String>,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,images: null == images ? _self._images : images // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

/// Create a copy of VehicleModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VehicleLocationCopyWith<$Res> get location {
  
  return $VehicleLocationCopyWith<$Res>(_self.location, (value) {
    return _then(_self.copyWith(location: value));
  });
}/// Create a copy of VehicleModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VehicleColorCopyWith<$Res> get color {
  
  return $VehicleColorCopyWith<$Res>(_self.color, (value) {
    return _then(_self.copyWith(color: value));
  });
}
}


/// @nodoc
mixin _$VehicleLocation {

 double get latitude; double get longitude; String? get address;
/// Create a copy of VehicleLocation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VehicleLocationCopyWith<VehicleLocation> get copyWith => _$VehicleLocationCopyWithImpl<VehicleLocation>(this as VehicleLocation, _$identity);

  /// Serializes this VehicleLocation to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VehicleLocation&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.address, address) || other.address == address));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,latitude,longitude,address);

@override
String toString() {
  return 'VehicleLocation(latitude: $latitude, longitude: $longitude, address: $address)';
}


}

/// @nodoc
abstract mixin class $VehicleLocationCopyWith<$Res>  {
  factory $VehicleLocationCopyWith(VehicleLocation value, $Res Function(VehicleLocation) _then) = _$VehicleLocationCopyWithImpl;
@useResult
$Res call({
 double latitude, double longitude, String? address
});




}
/// @nodoc
class _$VehicleLocationCopyWithImpl<$Res>
    implements $VehicleLocationCopyWith<$Res> {
  _$VehicleLocationCopyWithImpl(this._self, this._then);

  final VehicleLocation _self;
  final $Res Function(VehicleLocation) _then;

/// Create a copy of VehicleLocation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? latitude = null,Object? longitude = null,Object? address = freezed,}) {
  return _then(_self.copyWith(
latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [VehicleLocation].
extension VehicleLocationPatterns on VehicleLocation {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VehicleLocation value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VehicleLocation() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VehicleLocation value)  $default,){
final _that = this;
switch (_that) {
case _VehicleLocation():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VehicleLocation value)?  $default,){
final _that = this;
switch (_that) {
case _VehicleLocation() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double latitude,  double longitude,  String? address)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VehicleLocation() when $default != null:
return $default(_that.latitude,_that.longitude,_that.address);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double latitude,  double longitude,  String? address)  $default,) {final _that = this;
switch (_that) {
case _VehicleLocation():
return $default(_that.latitude,_that.longitude,_that.address);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double latitude,  double longitude,  String? address)?  $default,) {final _that = this;
switch (_that) {
case _VehicleLocation() when $default != null:
return $default(_that.latitude,_that.longitude,_that.address);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VehicleLocation implements VehicleLocation {
  const _VehicleLocation({required this.latitude, required this.longitude, this.address});
  factory _VehicleLocation.fromJson(Map<String, dynamic> json) => _$VehicleLocationFromJson(json);

@override final  double latitude;
@override final  double longitude;
@override final  String? address;

/// Create a copy of VehicleLocation
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VehicleLocationCopyWith<_VehicleLocation> get copyWith => __$VehicleLocationCopyWithImpl<_VehicleLocation>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VehicleLocationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VehicleLocation&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.address, address) || other.address == address));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,latitude,longitude,address);

@override
String toString() {
  return 'VehicleLocation(latitude: $latitude, longitude: $longitude, address: $address)';
}


}

/// @nodoc
abstract mixin class _$VehicleLocationCopyWith<$Res> implements $VehicleLocationCopyWith<$Res> {
  factory _$VehicleLocationCopyWith(_VehicleLocation value, $Res Function(_VehicleLocation) _then) = __$VehicleLocationCopyWithImpl;
@override @useResult
$Res call({
 double latitude, double longitude, String? address
});




}
/// @nodoc
class __$VehicleLocationCopyWithImpl<$Res>
    implements _$VehicleLocationCopyWith<$Res> {
  __$VehicleLocationCopyWithImpl(this._self, this._then);

  final _VehicleLocation _self;
  final $Res Function(_VehicleLocation) _then;

/// Create a copy of VehicleLocation
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? latitude = null,Object? longitude = null,Object? address = freezed,}) {
  return _then(_VehicleLocation(
latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$VehicleColor {

 String get hex; String get name;
/// Create a copy of VehicleColor
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VehicleColorCopyWith<VehicleColor> get copyWith => _$VehicleColorCopyWithImpl<VehicleColor>(this as VehicleColor, _$identity);

  /// Serializes this VehicleColor to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VehicleColor&&(identical(other.hex, hex) || other.hex == hex)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,hex,name);

@override
String toString() {
  return 'VehicleColor(hex: $hex, name: $name)';
}


}

/// @nodoc
abstract mixin class $VehicleColorCopyWith<$Res>  {
  factory $VehicleColorCopyWith(VehicleColor value, $Res Function(VehicleColor) _then) = _$VehicleColorCopyWithImpl;
@useResult
$Res call({
 String hex, String name
});




}
/// @nodoc
class _$VehicleColorCopyWithImpl<$Res>
    implements $VehicleColorCopyWith<$Res> {
  _$VehicleColorCopyWithImpl(this._self, this._then);

  final VehicleColor _self;
  final $Res Function(VehicleColor) _then;

/// Create a copy of VehicleColor
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? hex = null,Object? name = null,}) {
  return _then(_self.copyWith(
hex: null == hex ? _self.hex : hex // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [VehicleColor].
extension VehicleColorPatterns on VehicleColor {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VehicleColor value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VehicleColor() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VehicleColor value)  $default,){
final _that = this;
switch (_that) {
case _VehicleColor():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VehicleColor value)?  $default,){
final _that = this;
switch (_that) {
case _VehicleColor() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String hex,  String name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VehicleColor() when $default != null:
return $default(_that.hex,_that.name);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String hex,  String name)  $default,) {final _that = this;
switch (_that) {
case _VehicleColor():
return $default(_that.hex,_that.name);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String hex,  String name)?  $default,) {final _that = this;
switch (_that) {
case _VehicleColor() when $default != null:
return $default(_that.hex,_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VehicleColor implements VehicleColor {
  const _VehicleColor({required this.hex, required this.name});
  factory _VehicleColor.fromJson(Map<String, dynamic> json) => _$VehicleColorFromJson(json);

@override final  String hex;
@override final  String name;

/// Create a copy of VehicleColor
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VehicleColorCopyWith<_VehicleColor> get copyWith => __$VehicleColorCopyWithImpl<_VehicleColor>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VehicleColorToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VehicleColor&&(identical(other.hex, hex) || other.hex == hex)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,hex,name);

@override
String toString() {
  return 'VehicleColor(hex: $hex, name: $name)';
}


}

/// @nodoc
abstract mixin class _$VehicleColorCopyWith<$Res> implements $VehicleColorCopyWith<$Res> {
  factory _$VehicleColorCopyWith(_VehicleColor value, $Res Function(_VehicleColor) _then) = __$VehicleColorCopyWithImpl;
@override @useResult
$Res call({
 String hex, String name
});




}
/// @nodoc
class __$VehicleColorCopyWithImpl<$Res>
    implements _$VehicleColorCopyWith<$Res> {
  __$VehicleColorCopyWithImpl(this._self, this._then);

  final _VehicleColor _self;
  final $Res Function(_VehicleColor) _then;

/// Create a copy of VehicleColor
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? hex = null,Object? name = null,}) {
  return _then(_VehicleColor(
hex: null == hex ? _self.hex : hex // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
