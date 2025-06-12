// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vehicleModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

VehicleModel _$VehicleModelFromJson(Map<String, dynamic> json) {
  return _VehicleModel.fromJson(json);
}

/// @nodoc
mixin _$VehicleModel {
  String get user_id => throw _privateConstructorUsedError;
  String get vehicle_id => throw _privateConstructorUsedError;
  String get vehicleName => throw _privateConstructorUsedError;
  String get vehicleType => throw _privateConstructorUsedError;
  String get condition => throw _privateConstructorUsedError;
  int get year => throw _privateConstructorUsedError;
  String get make => throw _privateConstructorUsedError;
  String get model => throw _privateConstructorUsedError;
  VehicleLocation get location => throw _privateConstructorUsedError;
  String get price => throw _privateConstructorUsedError;
  String get steerPosition => throw _privateConstructorUsedError;
  String get engineCapacity => throw _privateConstructorUsedError;
  String get transmission => throw _privateConstructorUsedError;
  VehicleColor get color => throw _privateConstructorUsedError;
  String get buildType => throw _privateConstructorUsedError;
  String get mileage => throw _privateConstructorUsedError;
  int get numberOfPassengers => throw _privateConstructorUsedError;
  List<String> get features => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  List<String> get images => throw _privateConstructorUsedError;

  /// Serializes this VehicleModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VehicleModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VehicleModelCopyWith<VehicleModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VehicleModelCopyWith<$Res> {
  factory $VehicleModelCopyWith(
          VehicleModel value, $Res Function(VehicleModel) then) =
      _$VehicleModelCopyWithImpl<$Res, VehicleModel>;
  @useResult
  $Res call(
      {String user_id,
      String vehicle_id,
      String vehicleName,
      String vehicleType,
      String condition,
      int year,
      String make,
      String model,
      VehicleLocation location,
      String price,
      String steerPosition,
      String engineCapacity,
      String transmission,
      VehicleColor color,
      String buildType,
      String mileage,
      int numberOfPassengers,
      List<String> features,
      String description,
      List<String> images});

  $VehicleLocationCopyWith<$Res> get location;
  $VehicleColorCopyWith<$Res> get color;
}

/// @nodoc
class _$VehicleModelCopyWithImpl<$Res, $Val extends VehicleModel>
    implements $VehicleModelCopyWith<$Res> {
  _$VehicleModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VehicleModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user_id = null,
    Object? vehicle_id = null,
    Object? vehicleName = null,
    Object? vehicleType = null,
    Object? condition = null,
    Object? year = null,
    Object? make = null,
    Object? model = null,
    Object? location = null,
    Object? price = null,
    Object? steerPosition = null,
    Object? engineCapacity = null,
    Object? transmission = null,
    Object? color = null,
    Object? buildType = null,
    Object? mileage = null,
    Object? numberOfPassengers = null,
    Object? features = null,
    Object? description = null,
    Object? images = null,
  }) {
    return _then(_value.copyWith(
      user_id: null == user_id
          ? _value.user_id
          : user_id // ignore: cast_nullable_to_non_nullable
              as String,
      vehicle_id: null == vehicle_id
          ? _value.vehicle_id
          : vehicle_id // ignore: cast_nullable_to_non_nullable
              as String,
      vehicleName: null == vehicleName
          ? _value.vehicleName
          : vehicleName // ignore: cast_nullable_to_non_nullable
              as String,
      vehicleType: null == vehicleType
          ? _value.vehicleType
          : vehicleType // ignore: cast_nullable_to_non_nullable
              as String,
      condition: null == condition
          ? _value.condition
          : condition // ignore: cast_nullable_to_non_nullable
              as String,
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      make: null == make
          ? _value.make
          : make // ignore: cast_nullable_to_non_nullable
              as String,
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as VehicleLocation,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      steerPosition: null == steerPosition
          ? _value.steerPosition
          : steerPosition // ignore: cast_nullable_to_non_nullable
              as String,
      engineCapacity: null == engineCapacity
          ? _value.engineCapacity
          : engineCapacity // ignore: cast_nullable_to_non_nullable
              as String,
      transmission: null == transmission
          ? _value.transmission
          : transmission // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as VehicleColor,
      buildType: null == buildType
          ? _value.buildType
          : buildType // ignore: cast_nullable_to_non_nullable
              as String,
      mileage: null == mileage
          ? _value.mileage
          : mileage // ignore: cast_nullable_to_non_nullable
              as String,
      numberOfPassengers: null == numberOfPassengers
          ? _value.numberOfPassengers
          : numberOfPassengers // ignore: cast_nullable_to_non_nullable
              as int,
      features: null == features
          ? _value.features
          : features // ignore: cast_nullable_to_non_nullable
              as List<String>,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }

  /// Create a copy of VehicleModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VehicleLocationCopyWith<$Res> get location {
    return $VehicleLocationCopyWith<$Res>(_value.location, (value) {
      return _then(_value.copyWith(location: value) as $Val);
    });
  }

  /// Create a copy of VehicleModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VehicleColorCopyWith<$Res> get color {
    return $VehicleColorCopyWith<$Res>(_value.color, (value) {
      return _then(_value.copyWith(color: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$VehicleModelImplCopyWith<$Res>
    implements $VehicleModelCopyWith<$Res> {
  factory _$$VehicleModelImplCopyWith(
          _$VehicleModelImpl value, $Res Function(_$VehicleModelImpl) then) =
      __$$VehicleModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String user_id,
      String vehicle_id,
      String vehicleName,
      String vehicleType,
      String condition,
      int year,
      String make,
      String model,
      VehicleLocation location,
      String price,
      String steerPosition,
      String engineCapacity,
      String transmission,
      VehicleColor color,
      String buildType,
      String mileage,
      int numberOfPassengers,
      List<String> features,
      String description,
      List<String> images});

  @override
  $VehicleLocationCopyWith<$Res> get location;
  @override
  $VehicleColorCopyWith<$Res> get color;
}

/// @nodoc
class __$$VehicleModelImplCopyWithImpl<$Res>
    extends _$VehicleModelCopyWithImpl<$Res, _$VehicleModelImpl>
    implements _$$VehicleModelImplCopyWith<$Res> {
  __$$VehicleModelImplCopyWithImpl(
      _$VehicleModelImpl _value, $Res Function(_$VehicleModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of VehicleModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user_id = null,
    Object? vehicle_id = null,
    Object? vehicleName = null,
    Object? vehicleType = null,
    Object? condition = null,
    Object? year = null,
    Object? make = null,
    Object? model = null,
    Object? location = null,
    Object? price = null,
    Object? steerPosition = null,
    Object? engineCapacity = null,
    Object? transmission = null,
    Object? color = null,
    Object? buildType = null,
    Object? mileage = null,
    Object? numberOfPassengers = null,
    Object? features = null,
    Object? description = null,
    Object? images = null,
  }) {
    return _then(_$VehicleModelImpl(
      user_id: null == user_id
          ? _value.user_id
          : user_id // ignore: cast_nullable_to_non_nullable
              as String,
      vehicle_id: null == vehicle_id
          ? _value.vehicle_id
          : vehicle_id // ignore: cast_nullable_to_non_nullable
              as String,
      vehicleName: null == vehicleName
          ? _value.vehicleName
          : vehicleName // ignore: cast_nullable_to_non_nullable
              as String,
      vehicleType: null == vehicleType
          ? _value.vehicleType
          : vehicleType // ignore: cast_nullable_to_non_nullable
              as String,
      condition: null == condition
          ? _value.condition
          : condition // ignore: cast_nullable_to_non_nullable
              as String,
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      make: null == make
          ? _value.make
          : make // ignore: cast_nullable_to_non_nullable
              as String,
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as VehicleLocation,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      steerPosition: null == steerPosition
          ? _value.steerPosition
          : steerPosition // ignore: cast_nullable_to_non_nullable
              as String,
      engineCapacity: null == engineCapacity
          ? _value.engineCapacity
          : engineCapacity // ignore: cast_nullable_to_non_nullable
              as String,
      transmission: null == transmission
          ? _value.transmission
          : transmission // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as VehicleColor,
      buildType: null == buildType
          ? _value.buildType
          : buildType // ignore: cast_nullable_to_non_nullable
              as String,
      mileage: null == mileage
          ? _value.mileage
          : mileage // ignore: cast_nullable_to_non_nullable
              as String,
      numberOfPassengers: null == numberOfPassengers
          ? _value.numberOfPassengers
          : numberOfPassengers // ignore: cast_nullable_to_non_nullable
              as int,
      features: null == features
          ? _value._features
          : features // ignore: cast_nullable_to_non_nullable
              as List<String>,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      images: null == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$VehicleModelImpl implements _VehicleModel {
  const _$VehicleModelImpl(
      {required this.user_id,
      required this.vehicle_id,
      required this.vehicleName,
      required this.vehicleType,
      required this.condition,
      required this.year,
      required this.make,
      required this.model,
      required this.location,
      required this.price,
      required this.steerPosition,
      required this.engineCapacity,
      required this.transmission,
      required this.color,
      required this.buildType,
      required this.mileage,
      required this.numberOfPassengers,
      final List<String> features = const [],
      required this.description,
      final List<String> images = const []})
      : _features = features,
        _images = images;

  factory _$VehicleModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$VehicleModelImplFromJson(json);

  @override
  final String user_id;
  @override
  final String vehicle_id;
  @override
  final String vehicleName;
  @override
  final String vehicleType;
  @override
  final String condition;
  @override
  final int year;
  @override
  final String make;
  @override
  final String model;
  @override
  final VehicleLocation location;
  @override
  final String price;
  @override
  final String steerPosition;
  @override
  final String engineCapacity;
  @override
  final String transmission;
  @override
  final VehicleColor color;
  @override
  final String buildType;
  @override
  final String mileage;
  @override
  final int numberOfPassengers;
  final List<String> _features;
  @override
  @JsonKey()
  List<String> get features {
    if (_features is EqualUnmodifiableListView) return _features;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_features);
  }

  @override
  final String description;
  final List<String> _images;
  @override
  @JsonKey()
  List<String> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  @override
  String toString() {
    return 'VehicleModel(user_id: $user_id, vehicle_id: $vehicle_id, vehicleName: $vehicleName, vehicleType: $vehicleType, condition: $condition, year: $year, make: $make, model: $model, location: $location, price: $price, steerPosition: $steerPosition, engineCapacity: $engineCapacity, transmission: $transmission, color: $color, buildType: $buildType, mileage: $mileage, numberOfPassengers: $numberOfPassengers, features: $features, description: $description, images: $images)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VehicleModelImpl &&
            (identical(other.user_id, user_id) || other.user_id == user_id) &&
            (identical(other.vehicle_id, vehicle_id) ||
                other.vehicle_id == vehicle_id) &&
            (identical(other.vehicleName, vehicleName) ||
                other.vehicleName == vehicleName) &&
            (identical(other.vehicleType, vehicleType) ||
                other.vehicleType == vehicleType) &&
            (identical(other.condition, condition) ||
                other.condition == condition) &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.make, make) || other.make == make) &&
            (identical(other.model, model) || other.model == model) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.steerPosition, steerPosition) ||
                other.steerPosition == steerPosition) &&
            (identical(other.engineCapacity, engineCapacity) ||
                other.engineCapacity == engineCapacity) &&
            (identical(other.transmission, transmission) ||
                other.transmission == transmission) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.buildType, buildType) ||
                other.buildType == buildType) &&
            (identical(other.mileage, mileage) || other.mileage == mileage) &&
            (identical(other.numberOfPassengers, numberOfPassengers) ||
                other.numberOfPassengers == numberOfPassengers) &&
            const DeepCollectionEquality().equals(other._features, _features) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._images, _images));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        user_id,
        vehicle_id,
        vehicleName,
        vehicleType,
        condition,
        year,
        make,
        model,
        location,
        price,
        steerPosition,
        engineCapacity,
        transmission,
        color,
        buildType,
        mileage,
        numberOfPassengers,
        const DeepCollectionEquality().hash(_features),
        description,
        const DeepCollectionEquality().hash(_images)
      ]);

  /// Create a copy of VehicleModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VehicleModelImplCopyWith<_$VehicleModelImpl> get copyWith =>
      __$$VehicleModelImplCopyWithImpl<_$VehicleModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VehicleModelImplToJson(
      this,
    );
  }
}

abstract class _VehicleModel implements VehicleModel {
  const factory _VehicleModel(
      {required final String user_id,
      required final String vehicle_id,
      required final String vehicleName,
      required final String vehicleType,
      required final String condition,
      required final int year,
      required final String make,
      required final String model,
      required final VehicleLocation location,
      required final String price,
      required final String steerPosition,
      required final String engineCapacity,
      required final String transmission,
      required final VehicleColor color,
      required final String buildType,
      required final String mileage,
      required final int numberOfPassengers,
      final List<String> features,
      required final String description,
      final List<String> images}) = _$VehicleModelImpl;

  factory _VehicleModel.fromJson(Map<String, dynamic> json) =
      _$VehicleModelImpl.fromJson;

  @override
  String get user_id;
  @override
  String get vehicle_id;
  @override
  String get vehicleName;
  @override
  String get vehicleType;
  @override
  String get condition;
  @override
  int get year;
  @override
  String get make;
  @override
  String get model;
  @override
  VehicleLocation get location;
  @override
  String get price;
  @override
  String get steerPosition;
  @override
  String get engineCapacity;
  @override
  String get transmission;
  @override
  VehicleColor get color;
  @override
  String get buildType;
  @override
  String get mileage;
  @override
  int get numberOfPassengers;
  @override
  List<String> get features;
  @override
  String get description;
  @override
  List<String> get images;

  /// Create a copy of VehicleModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VehicleModelImplCopyWith<_$VehicleModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

VehicleLocation _$VehicleLocationFromJson(Map<String, dynamic> json) {
  return _VehicleLocation.fromJson(json);
}

/// @nodoc
mixin _$VehicleLocation {
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;

  /// Serializes this VehicleLocation to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VehicleLocation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VehicleLocationCopyWith<VehicleLocation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VehicleLocationCopyWith<$Res> {
  factory $VehicleLocationCopyWith(
          VehicleLocation value, $Res Function(VehicleLocation) then) =
      _$VehicleLocationCopyWithImpl<$Res, VehicleLocation>;
  @useResult
  $Res call({double latitude, double longitude, String? address});
}

/// @nodoc
class _$VehicleLocationCopyWithImpl<$Res, $Val extends VehicleLocation>
    implements $VehicleLocationCopyWith<$Res> {
  _$VehicleLocationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VehicleLocation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
    Object? address = freezed,
  }) {
    return _then(_value.copyWith(
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VehicleLocationImplCopyWith<$Res>
    implements $VehicleLocationCopyWith<$Res> {
  factory _$$VehicleLocationImplCopyWith(_$VehicleLocationImpl value,
          $Res Function(_$VehicleLocationImpl) then) =
      __$$VehicleLocationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double latitude, double longitude, String? address});
}

/// @nodoc
class __$$VehicleLocationImplCopyWithImpl<$Res>
    extends _$VehicleLocationCopyWithImpl<$Res, _$VehicleLocationImpl>
    implements _$$VehicleLocationImplCopyWith<$Res> {
  __$$VehicleLocationImplCopyWithImpl(
      _$VehicleLocationImpl _value, $Res Function(_$VehicleLocationImpl) _then)
      : super(_value, _then);

  /// Create a copy of VehicleLocation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
    Object? address = freezed,
  }) {
    return _then(_$VehicleLocationImpl(
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VehicleLocationImpl implements _VehicleLocation {
  const _$VehicleLocationImpl(
      {required this.latitude, required this.longitude, this.address});

  factory _$VehicleLocationImpl.fromJson(Map<String, dynamic> json) =>
      _$$VehicleLocationImplFromJson(json);

  @override
  final double latitude;
  @override
  final double longitude;
  @override
  final String? address;

  @override
  String toString() {
    return 'VehicleLocation(latitude: $latitude, longitude: $longitude, address: $address)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VehicleLocationImpl &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.address, address) || other.address == address));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, latitude, longitude, address);

  /// Create a copy of VehicleLocation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VehicleLocationImplCopyWith<_$VehicleLocationImpl> get copyWith =>
      __$$VehicleLocationImplCopyWithImpl<_$VehicleLocationImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VehicleLocationImplToJson(
      this,
    );
  }
}

abstract class _VehicleLocation implements VehicleLocation {
  const factory _VehicleLocation(
      {required final double latitude,
      required final double longitude,
      final String? address}) = _$VehicleLocationImpl;

  factory _VehicleLocation.fromJson(Map<String, dynamic> json) =
      _$VehicleLocationImpl.fromJson;

  @override
  double get latitude;
  @override
  double get longitude;
  @override
  String? get address;

  /// Create a copy of VehicleLocation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VehicleLocationImplCopyWith<_$VehicleLocationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

VehicleColor _$VehicleColorFromJson(Map<String, dynamic> json) {
  return _VehicleColor.fromJson(json);
}

/// @nodoc
mixin _$VehicleColor {
  String get hex => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  /// Serializes this VehicleColor to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VehicleColor
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VehicleColorCopyWith<VehicleColor> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VehicleColorCopyWith<$Res> {
  factory $VehicleColorCopyWith(
          VehicleColor value, $Res Function(VehicleColor) then) =
      _$VehicleColorCopyWithImpl<$Res, VehicleColor>;
  @useResult
  $Res call({String hex, String name});
}

/// @nodoc
class _$VehicleColorCopyWithImpl<$Res, $Val extends VehicleColor>
    implements $VehicleColorCopyWith<$Res> {
  _$VehicleColorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VehicleColor
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hex = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      hex: null == hex
          ? _value.hex
          : hex // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VehicleColorImplCopyWith<$Res>
    implements $VehicleColorCopyWith<$Res> {
  factory _$$VehicleColorImplCopyWith(
          _$VehicleColorImpl value, $Res Function(_$VehicleColorImpl) then) =
      __$$VehicleColorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String hex, String name});
}

/// @nodoc
class __$$VehicleColorImplCopyWithImpl<$Res>
    extends _$VehicleColorCopyWithImpl<$Res, _$VehicleColorImpl>
    implements _$$VehicleColorImplCopyWith<$Res> {
  __$$VehicleColorImplCopyWithImpl(
      _$VehicleColorImpl _value, $Res Function(_$VehicleColorImpl) _then)
      : super(_value, _then);

  /// Create a copy of VehicleColor
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hex = null,
    Object? name = null,
  }) {
    return _then(_$VehicleColorImpl(
      hex: null == hex
          ? _value.hex
          : hex // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VehicleColorImpl implements _VehicleColor {
  const _$VehicleColorImpl({required this.hex, required this.name});

  factory _$VehicleColorImpl.fromJson(Map<String, dynamic> json) =>
      _$$VehicleColorImplFromJson(json);

  @override
  final String hex;
  @override
  final String name;

  @override
  String toString() {
    return 'VehicleColor(hex: $hex, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VehicleColorImpl &&
            (identical(other.hex, hex) || other.hex == hex) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, hex, name);

  /// Create a copy of VehicleColor
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VehicleColorImplCopyWith<_$VehicleColorImpl> get copyWith =>
      __$$VehicleColorImplCopyWithImpl<_$VehicleColorImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VehicleColorImplToJson(
      this,
    );
  }
}

abstract class _VehicleColor implements VehicleColor {
  const factory _VehicleColor(
      {required final String hex,
      required final String name}) = _$VehicleColorImpl;

  factory _VehicleColor.fromJson(Map<String, dynamic> json) =
      _$VehicleColorImpl.fromJson;

  @override
  String get hex;
  @override
  String get name;

  /// Create a copy of VehicleColor
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VehicleColorImplCopyWith<_$VehicleColorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
