// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'brandItemsModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BrandItem _$BrandItemFromJson(Map<String, dynamic> json) {
  return _BrandItem.fromJson(json);
}

/// @nodoc
mixin _$BrandItem {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  String? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'country_id')
  int? get countryId => throw _privateConstructorUsedError;
  @JsonKey(name: 'brand_model_id')
  int get brandModelId => throw _privateConstructorUsedError;
  @JsonKey(name: 'brand_id')
  int get brandId => throw _privateConstructorUsedError;
  @JsonKey(name: 'category_id')
  int get categoryId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get year => throw _privateConstructorUsedError;
  String get slug => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  List<String> get images => throw _privateConstructorUsedError;
  String get location => throw _privateConstructorUsedError;
  @JsonKey(name: 'serial_number')
  String? get serialNumber => throw _privateConstructorUsedError;
  String? get condition => throw _privateConstructorUsedError;
  @JsonKey(name: 'steer_position')
  String? get steerPosition => throw _privateConstructorUsedError;
  @JsonKey(name: 'engine_capacity')
  String? get engineCapacity => throw _privateConstructorUsedError;
  String? get transmission => throw _privateConstructorUsedError;
  String? get color => throw _privateConstructorUsedError;
  @JsonKey(name: 'build_type')
  String? get buildType => throw _privateConstructorUsedError;
  @JsonKey(name: 'number_of_passengers')
  int? get numberOfPassengers => throw _privateConstructorUsedError;
  List<String> get features => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String get price => throw _privateConstructorUsedError;
  String? get mileage => throw _privateConstructorUsedError;
  int? get warranty => throw _privateConstructorUsedError;
  @JsonKey(name: 'warranty_expiration')
  String? get warrantyExpiration => throw _privateConstructorUsedError;
  @JsonKey(name: 'deleted_at')
  String? get deletedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  String get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'Height')
  String? get height => throw _privateConstructorUsedError;
  @JsonKey(name: 'VIN')
  String? get vin => throw _privateConstructorUsedError;

  /// Serializes this BrandItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BrandItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BrandItemCopyWith<BrandItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BrandItemCopyWith<$Res> {
  factory $BrandItemCopyWith(BrandItem value, $Res Function(BrandItem) then) =
      _$BrandItemCopyWithImpl<$Res, BrandItem>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'user_id') String? userId,
      @JsonKey(name: 'country_id') int? countryId,
      @JsonKey(name: 'brand_model_id') int brandModelId,
      @JsonKey(name: 'brand_id') int brandId,
      @JsonKey(name: 'category_id') int categoryId,
      String name,
      String year,
      String slug,
      String description,
      List<String> images,
      String location,
      @JsonKey(name: 'serial_number') String? serialNumber,
      String? condition,
      @JsonKey(name: 'steer_position') String? steerPosition,
      @JsonKey(name: 'engine_capacity') String? engineCapacity,
      String? transmission,
      String? color,
      @JsonKey(name: 'build_type') String? buildType,
      @JsonKey(name: 'number_of_passengers') int? numberOfPassengers,
      List<String> features,
      String? status,
      String price,
      String? mileage,
      int? warranty,
      @JsonKey(name: 'warranty_expiration') String? warrantyExpiration,
      @JsonKey(name: 'deleted_at') String? deletedAt,
      @JsonKey(name: 'created_at') String createdAt,
      @JsonKey(name: 'updated_at') String updatedAt,
      @JsonKey(name: 'Height') String? height,
      @JsonKey(name: 'VIN') String? vin});
}

/// @nodoc
class _$BrandItemCopyWithImpl<$Res, $Val extends BrandItem>
    implements $BrandItemCopyWith<$Res> {
  _$BrandItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BrandItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = freezed,
    Object? countryId = freezed,
    Object? brandModelId = null,
    Object? brandId = null,
    Object? categoryId = null,
    Object? name = null,
    Object? year = null,
    Object? slug = null,
    Object? description = null,
    Object? images = null,
    Object? location = null,
    Object? serialNumber = freezed,
    Object? condition = freezed,
    Object? steerPosition = freezed,
    Object? engineCapacity = freezed,
    Object? transmission = freezed,
    Object? color = freezed,
    Object? buildType = freezed,
    Object? numberOfPassengers = freezed,
    Object? features = null,
    Object? status = freezed,
    Object? price = null,
    Object? mileage = freezed,
    Object? warranty = freezed,
    Object? warrantyExpiration = freezed,
    Object? deletedAt = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? height = freezed,
    Object? vin = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      countryId: freezed == countryId
          ? _value.countryId
          : countryId // ignore: cast_nullable_to_non_nullable
              as int?,
      brandModelId: null == brandModelId
          ? _value.brandModelId
          : brandModelId // ignore: cast_nullable_to_non_nullable
              as int,
      brandId: null == brandId
          ? _value.brandId
          : brandId // ignore: cast_nullable_to_non_nullable
              as int,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as String,
      slug: null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      serialNumber: freezed == serialNumber
          ? _value.serialNumber
          : serialNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      condition: freezed == condition
          ? _value.condition
          : condition // ignore: cast_nullable_to_non_nullable
              as String?,
      steerPosition: freezed == steerPosition
          ? _value.steerPosition
          : steerPosition // ignore: cast_nullable_to_non_nullable
              as String?,
      engineCapacity: freezed == engineCapacity
          ? _value.engineCapacity
          : engineCapacity // ignore: cast_nullable_to_non_nullable
              as String?,
      transmission: freezed == transmission
          ? _value.transmission
          : transmission // ignore: cast_nullable_to_non_nullable
              as String?,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
      buildType: freezed == buildType
          ? _value.buildType
          : buildType // ignore: cast_nullable_to_non_nullable
              as String?,
      numberOfPassengers: freezed == numberOfPassengers
          ? _value.numberOfPassengers
          : numberOfPassengers // ignore: cast_nullable_to_non_nullable
              as int?,
      features: null == features
          ? _value.features
          : features // ignore: cast_nullable_to_non_nullable
              as List<String>,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      mileage: freezed == mileage
          ? _value.mileage
          : mileage // ignore: cast_nullable_to_non_nullable
              as String?,
      warranty: freezed == warranty
          ? _value.warranty
          : warranty // ignore: cast_nullable_to_non_nullable
              as int?,
      warrantyExpiration: freezed == warrantyExpiration
          ? _value.warrantyExpiration
          : warrantyExpiration // ignore: cast_nullable_to_non_nullable
              as String?,
      deletedAt: freezed == deletedAt
          ? _value.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      height: freezed == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as String?,
      vin: freezed == vin
          ? _value.vin
          : vin // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BrandItemImplCopyWith<$Res>
    implements $BrandItemCopyWith<$Res> {
  factory _$$BrandItemImplCopyWith(
          _$BrandItemImpl value, $Res Function(_$BrandItemImpl) then) =
      __$$BrandItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'user_id') String? userId,
      @JsonKey(name: 'country_id') int? countryId,
      @JsonKey(name: 'brand_model_id') int brandModelId,
      @JsonKey(name: 'brand_id') int brandId,
      @JsonKey(name: 'category_id') int categoryId,
      String name,
      String year,
      String slug,
      String description,
      List<String> images,
      String location,
      @JsonKey(name: 'serial_number') String? serialNumber,
      String? condition,
      @JsonKey(name: 'steer_position') String? steerPosition,
      @JsonKey(name: 'engine_capacity') String? engineCapacity,
      String? transmission,
      String? color,
      @JsonKey(name: 'build_type') String? buildType,
      @JsonKey(name: 'number_of_passengers') int? numberOfPassengers,
      List<String> features,
      String? status,
      String price,
      String? mileage,
      int? warranty,
      @JsonKey(name: 'warranty_expiration') String? warrantyExpiration,
      @JsonKey(name: 'deleted_at') String? deletedAt,
      @JsonKey(name: 'created_at') String createdAt,
      @JsonKey(name: 'updated_at') String updatedAt,
      @JsonKey(name: 'Height') String? height,
      @JsonKey(name: 'VIN') String? vin});
}

/// @nodoc
class __$$BrandItemImplCopyWithImpl<$Res>
    extends _$BrandItemCopyWithImpl<$Res, _$BrandItemImpl>
    implements _$$BrandItemImplCopyWith<$Res> {
  __$$BrandItemImplCopyWithImpl(
      _$BrandItemImpl _value, $Res Function(_$BrandItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of BrandItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = freezed,
    Object? countryId = freezed,
    Object? brandModelId = null,
    Object? brandId = null,
    Object? categoryId = null,
    Object? name = null,
    Object? year = null,
    Object? slug = null,
    Object? description = null,
    Object? images = null,
    Object? location = null,
    Object? serialNumber = freezed,
    Object? condition = freezed,
    Object? steerPosition = freezed,
    Object? engineCapacity = freezed,
    Object? transmission = freezed,
    Object? color = freezed,
    Object? buildType = freezed,
    Object? numberOfPassengers = freezed,
    Object? features = null,
    Object? status = freezed,
    Object? price = null,
    Object? mileage = freezed,
    Object? warranty = freezed,
    Object? warrantyExpiration = freezed,
    Object? deletedAt = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? height = freezed,
    Object? vin = freezed,
  }) {
    return _then(_$BrandItemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      countryId: freezed == countryId
          ? _value.countryId
          : countryId // ignore: cast_nullable_to_non_nullable
              as int?,
      brandModelId: null == brandModelId
          ? _value.brandModelId
          : brandModelId // ignore: cast_nullable_to_non_nullable
              as int,
      brandId: null == brandId
          ? _value.brandId
          : brandId // ignore: cast_nullable_to_non_nullable
              as int,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as String,
      slug: null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      images: null == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      serialNumber: freezed == serialNumber
          ? _value.serialNumber
          : serialNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      condition: freezed == condition
          ? _value.condition
          : condition // ignore: cast_nullable_to_non_nullable
              as String?,
      steerPosition: freezed == steerPosition
          ? _value.steerPosition
          : steerPosition // ignore: cast_nullable_to_non_nullable
              as String?,
      engineCapacity: freezed == engineCapacity
          ? _value.engineCapacity
          : engineCapacity // ignore: cast_nullable_to_non_nullable
              as String?,
      transmission: freezed == transmission
          ? _value.transmission
          : transmission // ignore: cast_nullable_to_non_nullable
              as String?,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
      buildType: freezed == buildType
          ? _value.buildType
          : buildType // ignore: cast_nullable_to_non_nullable
              as String?,
      numberOfPassengers: freezed == numberOfPassengers
          ? _value.numberOfPassengers
          : numberOfPassengers // ignore: cast_nullable_to_non_nullable
              as int?,
      features: null == features
          ? _value._features
          : features // ignore: cast_nullable_to_non_nullable
              as List<String>,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      mileage: freezed == mileage
          ? _value.mileage
          : mileage // ignore: cast_nullable_to_non_nullable
              as String?,
      warranty: freezed == warranty
          ? _value.warranty
          : warranty // ignore: cast_nullable_to_non_nullable
              as int?,
      warrantyExpiration: freezed == warrantyExpiration
          ? _value.warrantyExpiration
          : warrantyExpiration // ignore: cast_nullable_to_non_nullable
              as String?,
      deletedAt: freezed == deletedAt
          ? _value.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      height: freezed == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as String?,
      vin: freezed == vin
          ? _value.vin
          : vin // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BrandItemImpl implements _BrandItem {
  const _$BrandItemImpl(
      {required this.id,
      @JsonKey(name: 'user_id') this.userId,
      @JsonKey(name: 'country_id') this.countryId,
      @JsonKey(name: 'brand_model_id') required this.brandModelId,
      @JsonKey(name: 'brand_id') required this.brandId,
      @JsonKey(name: 'category_id') required this.categoryId,
      required this.name,
      required this.year,
      required this.slug,
      required this.description,
      required final List<String> images,
      required this.location,
      @JsonKey(name: 'serial_number') this.serialNumber,
      this.condition,
      @JsonKey(name: 'steer_position') this.steerPosition,
      @JsonKey(name: 'engine_capacity') this.engineCapacity,
      this.transmission,
      this.color,
      @JsonKey(name: 'build_type') this.buildType,
      @JsonKey(name: 'number_of_passengers') this.numberOfPassengers,
      required final List<String> features,
      this.status,
      required this.price,
      this.mileage,
      this.warranty,
      @JsonKey(name: 'warranty_expiration') this.warrantyExpiration,
      @JsonKey(name: 'deleted_at') this.deletedAt,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') required this.updatedAt,
      @JsonKey(name: 'Height') this.height,
      @JsonKey(name: 'VIN') this.vin})
      : _images = images,
        _features = features;

  factory _$BrandItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$BrandItemImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'user_id')
  final String? userId;
  @override
  @JsonKey(name: 'country_id')
  final int? countryId;
  @override
  @JsonKey(name: 'brand_model_id')
  final int brandModelId;
  @override
  @JsonKey(name: 'brand_id')
  final int brandId;
  @override
  @JsonKey(name: 'category_id')
  final int categoryId;
  @override
  final String name;
  @override
  final String year;
  @override
  final String slug;
  @override
  final String description;
  final List<String> _images;
  @override
  List<String> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  @override
  final String location;
  @override
  @JsonKey(name: 'serial_number')
  final String? serialNumber;
  @override
  final String? condition;
  @override
  @JsonKey(name: 'steer_position')
  final String? steerPosition;
  @override
  @JsonKey(name: 'engine_capacity')
  final String? engineCapacity;
  @override
  final String? transmission;
  @override
  final String? color;
  @override
  @JsonKey(name: 'build_type')
  final String? buildType;
  @override
  @JsonKey(name: 'number_of_passengers')
  final int? numberOfPassengers;
  final List<String> _features;
  @override
  List<String> get features {
    if (_features is EqualUnmodifiableListView) return _features;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_features);
  }

  @override
  final String? status;
  @override
  final String price;
  @override
  final String? mileage;
  @override
  final int? warranty;
  @override
  @JsonKey(name: 'warranty_expiration')
  final String? warrantyExpiration;
  @override
  @JsonKey(name: 'deleted_at')
  final String? deletedAt;
  @override
  @JsonKey(name: 'created_at')
  final String createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final String updatedAt;
  @override
  @JsonKey(name: 'Height')
  final String? height;
  @override
  @JsonKey(name: 'VIN')
  final String? vin;

  @override
  String toString() {
    return 'BrandItem(id: $id, userId: $userId, countryId: $countryId, brandModelId: $brandModelId, brandId: $brandId, categoryId: $categoryId, name: $name, year: $year, slug: $slug, description: $description, images: $images, location: $location, serialNumber: $serialNumber, condition: $condition, steerPosition: $steerPosition, engineCapacity: $engineCapacity, transmission: $transmission, color: $color, buildType: $buildType, numberOfPassengers: $numberOfPassengers, features: $features, status: $status, price: $price, mileage: $mileage, warranty: $warranty, warrantyExpiration: $warrantyExpiration, deletedAt: $deletedAt, createdAt: $createdAt, updatedAt: $updatedAt, height: $height, vin: $vin)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BrandItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.countryId, countryId) ||
                other.countryId == countryId) &&
            (identical(other.brandModelId, brandModelId) ||
                other.brandModelId == brandModelId) &&
            (identical(other.brandId, brandId) || other.brandId == brandId) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.serialNumber, serialNumber) ||
                other.serialNumber == serialNumber) &&
            (identical(other.condition, condition) ||
                other.condition == condition) &&
            (identical(other.steerPosition, steerPosition) ||
                other.steerPosition == steerPosition) &&
            (identical(other.engineCapacity, engineCapacity) ||
                other.engineCapacity == engineCapacity) &&
            (identical(other.transmission, transmission) ||
                other.transmission == transmission) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.buildType, buildType) ||
                other.buildType == buildType) &&
            (identical(other.numberOfPassengers, numberOfPassengers) ||
                other.numberOfPassengers == numberOfPassengers) &&
            const DeepCollectionEquality().equals(other._features, _features) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.mileage, mileage) || other.mileage == mileage) &&
            (identical(other.warranty, warranty) ||
                other.warranty == warranty) &&
            (identical(other.warrantyExpiration, warrantyExpiration) ||
                other.warrantyExpiration == warrantyExpiration) &&
            (identical(other.deletedAt, deletedAt) ||
                other.deletedAt == deletedAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.vin, vin) || other.vin == vin));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        userId,
        countryId,
        brandModelId,
        brandId,
        categoryId,
        name,
        year,
        slug,
        description,
        const DeepCollectionEquality().hash(_images),
        location,
        serialNumber,
        condition,
        steerPosition,
        engineCapacity,
        transmission,
        color,
        buildType,
        numberOfPassengers,
        const DeepCollectionEquality().hash(_features),
        status,
        price,
        mileage,
        warranty,
        warrantyExpiration,
        deletedAt,
        createdAt,
        updatedAt,
        height,
        vin
      ]);

  /// Create a copy of BrandItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BrandItemImplCopyWith<_$BrandItemImpl> get copyWith =>
      __$$BrandItemImplCopyWithImpl<_$BrandItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BrandItemImplToJson(
      this,
    );
  }
}

abstract class _BrandItem implements BrandItem {
  const factory _BrandItem(
      {required final String id,
      @JsonKey(name: 'user_id') final String? userId,
      @JsonKey(name: 'country_id') final int? countryId,
      @JsonKey(name: 'brand_model_id') required final int brandModelId,
      @JsonKey(name: 'brand_id') required final int brandId,
      @JsonKey(name: 'category_id') required final int categoryId,
      required final String name,
      required final String year,
      required final String slug,
      required final String description,
      required final List<String> images,
      required final String location,
      @JsonKey(name: 'serial_number') final String? serialNumber,
      final String? condition,
      @JsonKey(name: 'steer_position') final String? steerPosition,
      @JsonKey(name: 'engine_capacity') final String? engineCapacity,
      final String? transmission,
      final String? color,
      @JsonKey(name: 'build_type') final String? buildType,
      @JsonKey(name: 'number_of_passengers') final int? numberOfPassengers,
      required final List<String> features,
      final String? status,
      required final String price,
      final String? mileage,
      final int? warranty,
      @JsonKey(name: 'warranty_expiration') final String? warrantyExpiration,
      @JsonKey(name: 'deleted_at') final String? deletedAt,
      @JsonKey(name: 'created_at') required final String createdAt,
      @JsonKey(name: 'updated_at') required final String updatedAt,
      @JsonKey(name: 'Height') final String? height,
      @JsonKey(name: 'VIN') final String? vin}) = _$BrandItemImpl;

  factory _BrandItem.fromJson(Map<String, dynamic> json) =
      _$BrandItemImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'user_id')
  String? get userId;
  @override
  @JsonKey(name: 'country_id')
  int? get countryId;
  @override
  @JsonKey(name: 'brand_model_id')
  int get brandModelId;
  @override
  @JsonKey(name: 'brand_id')
  int get brandId;
  @override
  @JsonKey(name: 'category_id')
  int get categoryId;
  @override
  String get name;
  @override
  String get year;
  @override
  String get slug;
  @override
  String get description;
  @override
  List<String> get images;
  @override
  String get location;
  @override
  @JsonKey(name: 'serial_number')
  String? get serialNumber;
  @override
  String? get condition;
  @override
  @JsonKey(name: 'steer_position')
  String? get steerPosition;
  @override
  @JsonKey(name: 'engine_capacity')
  String? get engineCapacity;
  @override
  String? get transmission;
  @override
  String? get color;
  @override
  @JsonKey(name: 'build_type')
  String? get buildType;
  @override
  @JsonKey(name: 'number_of_passengers')
  int? get numberOfPassengers;
  @override
  List<String> get features;
  @override
  String? get status;
  @override
  String get price;
  @override
  String? get mileage;
  @override
  int? get warranty;
  @override
  @JsonKey(name: 'warranty_expiration')
  String? get warrantyExpiration;
  @override
  @JsonKey(name: 'deleted_at')
  String? get deletedAt;
  @override
  @JsonKey(name: 'created_at')
  String get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  String get updatedAt;
  @override
  @JsonKey(name: 'Height')
  String? get height;
  @override
  @JsonKey(name: 'VIN')
  String? get vin;

  /// Create a copy of BrandItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BrandItemImplCopyWith<_$BrandItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
