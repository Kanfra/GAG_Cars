// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'myListingsModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MyListing _$MyListingFromJson(Map<String, dynamic> json) {
  return _MyListing.fromJson(json);
}

/// @nodoc
mixin _$MyListing {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  String get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'country_id')
  dynamic get countryId => throw _privateConstructorUsedError;
  @JsonKey(name: 'brand_model_id')
  int? get brandModelId => throw _privateConstructorUsedError;
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
  dynamic get serialNumber => throw _privateConstructorUsedError;
  dynamic get condition => throw _privateConstructorUsedError;
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
  List<dynamic> get features => throw _privateConstructorUsedError;
  dynamic get status => throw _privateConstructorUsedError;
  String get price => throw _privateConstructorUsedError;
  String? get mileage => throw _privateConstructorUsedError;
  dynamic get warranty => throw _privateConstructorUsedError;
  @JsonKey(name: 'warranty_expiration')
  dynamic get warrantyExpiration => throw _privateConstructorUsedError;
  @JsonKey(name: 'deleted_at')
  dynamic get deletedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  String get updatedAt => throw _privateConstructorUsedError;
  dynamic get Height => throw _privateConstructorUsedError;
  dynamic get VIN => throw _privateConstructorUsedError;
  Category? get category => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_promoted')
  bool? get isPromoted => throw _privateConstructorUsedError;

  /// Serializes this MyListing to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MyListing
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MyListingCopyWith<MyListing> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyListingCopyWith<$Res> {
  factory $MyListingCopyWith(MyListing value, $Res Function(MyListing) then) =
      _$MyListingCopyWithImpl<$Res, MyListing>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'user_id') String userId,
      @JsonKey(name: 'country_id') dynamic countryId,
      @JsonKey(name: 'brand_model_id') int? brandModelId,
      @JsonKey(name: 'brand_id') int brandId,
      @JsonKey(name: 'category_id') int categoryId,
      String name,
      String year,
      String slug,
      String description,
      List<String> images,
      String location,
      @JsonKey(name: 'serial_number') dynamic serialNumber,
      dynamic condition,
      @JsonKey(name: 'steer_position') String? steerPosition,
      @JsonKey(name: 'engine_capacity') String? engineCapacity,
      String? transmission,
      String? color,
      @JsonKey(name: 'build_type') String? buildType,
      @JsonKey(name: 'number_of_passengers') int? numberOfPassengers,
      List<dynamic> features,
      dynamic status,
      String price,
      String? mileage,
      dynamic warranty,
      @JsonKey(name: 'warranty_expiration') dynamic warrantyExpiration,
      @JsonKey(name: 'deleted_at') dynamic deletedAt,
      @JsonKey(name: 'created_at') String createdAt,
      @JsonKey(name: 'updated_at') String updatedAt,
      dynamic Height,
      dynamic VIN,
      Category? category,
      @JsonKey(name: 'is_promoted') bool? isPromoted});

  $CategoryCopyWith<$Res>? get category;
}

/// @nodoc
class _$MyListingCopyWithImpl<$Res, $Val extends MyListing>
    implements $MyListingCopyWith<$Res> {
  _$MyListingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MyListing
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? countryId = freezed,
    Object? brandModelId = freezed,
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
    Object? Height = freezed,
    Object? VIN = freezed,
    Object? category = freezed,
    Object? isPromoted = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      countryId: freezed == countryId
          ? _value.countryId
          : countryId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      brandModelId: freezed == brandModelId
          ? _value.brandModelId
          : brandModelId // ignore: cast_nullable_to_non_nullable
              as int?,
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
              as dynamic,
      condition: freezed == condition
          ? _value.condition
          : condition // ignore: cast_nullable_to_non_nullable
              as dynamic,
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
              as List<dynamic>,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as dynamic,
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
              as dynamic,
      warrantyExpiration: freezed == warrantyExpiration
          ? _value.warrantyExpiration
          : warrantyExpiration // ignore: cast_nullable_to_non_nullable
              as dynamic,
      deletedAt: freezed == deletedAt
          ? _value.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      Height: freezed == Height
          ? _value.Height
          : Height // ignore: cast_nullable_to_non_nullable
              as dynamic,
      VIN: freezed == VIN
          ? _value.VIN
          : VIN // ignore: cast_nullable_to_non_nullable
              as dynamic,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as Category?,
      isPromoted: freezed == isPromoted
          ? _value.isPromoted
          : isPromoted // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }

  /// Create a copy of MyListing
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CategoryCopyWith<$Res>? get category {
    if (_value.category == null) {
      return null;
    }

    return $CategoryCopyWith<$Res>(_value.category!, (value) {
      return _then(_value.copyWith(category: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MyListingImplCopyWith<$Res>
    implements $MyListingCopyWith<$Res> {
  factory _$$MyListingImplCopyWith(
          _$MyListingImpl value, $Res Function(_$MyListingImpl) then) =
      __$$MyListingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'user_id') String userId,
      @JsonKey(name: 'country_id') dynamic countryId,
      @JsonKey(name: 'brand_model_id') int? brandModelId,
      @JsonKey(name: 'brand_id') int brandId,
      @JsonKey(name: 'category_id') int categoryId,
      String name,
      String year,
      String slug,
      String description,
      List<String> images,
      String location,
      @JsonKey(name: 'serial_number') dynamic serialNumber,
      dynamic condition,
      @JsonKey(name: 'steer_position') String? steerPosition,
      @JsonKey(name: 'engine_capacity') String? engineCapacity,
      String? transmission,
      String? color,
      @JsonKey(name: 'build_type') String? buildType,
      @JsonKey(name: 'number_of_passengers') int? numberOfPassengers,
      List<dynamic> features,
      dynamic status,
      String price,
      String? mileage,
      dynamic warranty,
      @JsonKey(name: 'warranty_expiration') dynamic warrantyExpiration,
      @JsonKey(name: 'deleted_at') dynamic deletedAt,
      @JsonKey(name: 'created_at') String createdAt,
      @JsonKey(name: 'updated_at') String updatedAt,
      dynamic Height,
      dynamic VIN,
      Category? category,
      @JsonKey(name: 'is_promoted') bool? isPromoted});

  @override
  $CategoryCopyWith<$Res>? get category;
}

/// @nodoc
class __$$MyListingImplCopyWithImpl<$Res>
    extends _$MyListingCopyWithImpl<$Res, _$MyListingImpl>
    implements _$$MyListingImplCopyWith<$Res> {
  __$$MyListingImplCopyWithImpl(
      _$MyListingImpl _value, $Res Function(_$MyListingImpl) _then)
      : super(_value, _then);

  /// Create a copy of MyListing
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? countryId = freezed,
    Object? brandModelId = freezed,
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
    Object? Height = freezed,
    Object? VIN = freezed,
    Object? category = freezed,
    Object? isPromoted = freezed,
  }) {
    return _then(_$MyListingImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      countryId: freezed == countryId
          ? _value.countryId
          : countryId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      brandModelId: freezed == brandModelId
          ? _value.brandModelId
          : brandModelId // ignore: cast_nullable_to_non_nullable
              as int?,
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
              as dynamic,
      condition: freezed == condition
          ? _value.condition
          : condition // ignore: cast_nullable_to_non_nullable
              as dynamic,
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
              as List<dynamic>,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as dynamic,
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
              as dynamic,
      warrantyExpiration: freezed == warrantyExpiration
          ? _value.warrantyExpiration
          : warrantyExpiration // ignore: cast_nullable_to_non_nullable
              as dynamic,
      deletedAt: freezed == deletedAt
          ? _value.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      Height: freezed == Height
          ? _value.Height
          : Height // ignore: cast_nullable_to_non_nullable
              as dynamic,
      VIN: freezed == VIN
          ? _value.VIN
          : VIN // ignore: cast_nullable_to_non_nullable
              as dynamic,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as Category?,
      isPromoted: freezed == isPromoted
          ? _value.isPromoted
          : isPromoted // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MyListingImpl implements _MyListing {
  const _$MyListingImpl(
      {required this.id,
      @JsonKey(name: 'user_id') required this.userId,
      @JsonKey(name: 'country_id') this.countryId,
      @JsonKey(name: 'brand_model_id') this.brandModelId,
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
      required final List<dynamic> features,
      this.status,
      required this.price,
      this.mileage,
      this.warranty,
      @JsonKey(name: 'warranty_expiration') this.warrantyExpiration,
      @JsonKey(name: 'deleted_at') this.deletedAt,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') required this.updatedAt,
      this.Height,
      this.VIN,
      this.category,
      @JsonKey(name: 'is_promoted') this.isPromoted})
      : _images = images,
        _features = features;

  factory _$MyListingImpl.fromJson(Map<String, dynamic> json) =>
      _$$MyListingImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'user_id')
  final String userId;
  @override
  @JsonKey(name: 'country_id')
  final dynamic countryId;
  @override
  @JsonKey(name: 'brand_model_id')
  final int? brandModelId;
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
  final dynamic serialNumber;
  @override
  final dynamic condition;
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
  final List<dynamic> _features;
  @override
  List<dynamic> get features {
    if (_features is EqualUnmodifiableListView) return _features;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_features);
  }

  @override
  final dynamic status;
  @override
  final String price;
  @override
  final String? mileage;
  @override
  final dynamic warranty;
  @override
  @JsonKey(name: 'warranty_expiration')
  final dynamic warrantyExpiration;
  @override
  @JsonKey(name: 'deleted_at')
  final dynamic deletedAt;
  @override
  @JsonKey(name: 'created_at')
  final String createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final String updatedAt;
  @override
  final dynamic Height;
  @override
  final dynamic VIN;
  @override
  final Category? category;
  @override
  @JsonKey(name: 'is_promoted')
  final bool? isPromoted;

  @override
  String toString() {
    return 'MyListing(id: $id, userId: $userId, countryId: $countryId, brandModelId: $brandModelId, brandId: $brandId, categoryId: $categoryId, name: $name, year: $year, slug: $slug, description: $description, images: $images, location: $location, serialNumber: $serialNumber, condition: $condition, steerPosition: $steerPosition, engineCapacity: $engineCapacity, transmission: $transmission, color: $color, buildType: $buildType, numberOfPassengers: $numberOfPassengers, features: $features, status: $status, price: $price, mileage: $mileage, warranty: $warranty, warrantyExpiration: $warrantyExpiration, deletedAt: $deletedAt, createdAt: $createdAt, updatedAt: $updatedAt, Height: $Height, VIN: $VIN, category: $category, isPromoted: $isPromoted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MyListingImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            const DeepCollectionEquality().equals(other.countryId, countryId) &&
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
            const DeepCollectionEquality()
                .equals(other.serialNumber, serialNumber) &&
            const DeepCollectionEquality().equals(other.condition, condition) &&
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
            const DeepCollectionEquality().equals(other.status, status) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.mileage, mileage) || other.mileage == mileage) &&
            const DeepCollectionEquality().equals(other.warranty, warranty) &&
            const DeepCollectionEquality()
                .equals(other.warrantyExpiration, warrantyExpiration) &&
            const DeepCollectionEquality().equals(other.deletedAt, deletedAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            const DeepCollectionEquality().equals(other.Height, Height) &&
            const DeepCollectionEquality().equals(other.VIN, VIN) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.isPromoted, isPromoted) ||
                other.isPromoted == isPromoted));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        userId,
        const DeepCollectionEquality().hash(countryId),
        brandModelId,
        brandId,
        categoryId,
        name,
        year,
        slug,
        description,
        const DeepCollectionEquality().hash(_images),
        location,
        const DeepCollectionEquality().hash(serialNumber),
        const DeepCollectionEquality().hash(condition),
        steerPosition,
        engineCapacity,
        transmission,
        color,
        buildType,
        numberOfPassengers,
        const DeepCollectionEquality().hash(_features),
        const DeepCollectionEquality().hash(status),
        price,
        mileage,
        const DeepCollectionEquality().hash(warranty),
        const DeepCollectionEquality().hash(warrantyExpiration),
        const DeepCollectionEquality().hash(deletedAt),
        createdAt,
        updatedAt,
        const DeepCollectionEquality().hash(Height),
        const DeepCollectionEquality().hash(VIN),
        category,
        isPromoted
      ]);

  /// Create a copy of MyListing
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MyListingImplCopyWith<_$MyListingImpl> get copyWith =>
      __$$MyListingImplCopyWithImpl<_$MyListingImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MyListingImplToJson(
      this,
    );
  }
}

abstract class _MyListing implements MyListing {
  const factory _MyListing(
      {required final String id,
      @JsonKey(name: 'user_id') required final String userId,
      @JsonKey(name: 'country_id') final dynamic countryId,
      @JsonKey(name: 'brand_model_id') final int? brandModelId,
      @JsonKey(name: 'brand_id') required final int brandId,
      @JsonKey(name: 'category_id') required final int categoryId,
      required final String name,
      required final String year,
      required final String slug,
      required final String description,
      required final List<String> images,
      required final String location,
      @JsonKey(name: 'serial_number') final dynamic serialNumber,
      final dynamic condition,
      @JsonKey(name: 'steer_position') final String? steerPosition,
      @JsonKey(name: 'engine_capacity') final String? engineCapacity,
      final String? transmission,
      final String? color,
      @JsonKey(name: 'build_type') final String? buildType,
      @JsonKey(name: 'number_of_passengers') final int? numberOfPassengers,
      required final List<dynamic> features,
      final dynamic status,
      required final String price,
      final String? mileage,
      final dynamic warranty,
      @JsonKey(name: 'warranty_expiration') final dynamic warrantyExpiration,
      @JsonKey(name: 'deleted_at') final dynamic deletedAt,
      @JsonKey(name: 'created_at') required final String createdAt,
      @JsonKey(name: 'updated_at') required final String updatedAt,
      final dynamic Height,
      final dynamic VIN,
      final Category? category,
      @JsonKey(name: 'is_promoted') final bool? isPromoted}) = _$MyListingImpl;

  factory _MyListing.fromJson(Map<String, dynamic> json) =
      _$MyListingImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'user_id')
  String get userId;
  @override
  @JsonKey(name: 'country_id')
  dynamic get countryId;
  @override
  @JsonKey(name: 'brand_model_id')
  int? get brandModelId;
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
  dynamic get serialNumber;
  @override
  dynamic get condition;
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
  List<dynamic> get features;
  @override
  dynamic get status;
  @override
  String get price;
  @override
  String? get mileage;
  @override
  dynamic get warranty;
  @override
  @JsonKey(name: 'warranty_expiration')
  dynamic get warrantyExpiration;
  @override
  @JsonKey(name: 'deleted_at')
  dynamic get deletedAt;
  @override
  @JsonKey(name: 'created_at')
  String get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  String get updatedAt;
  @override
  dynamic get Height;
  @override
  dynamic get VIN;
  @override
  Category? get category;
  @override
  @JsonKey(name: 'is_promoted')
  bool? get isPromoted;

  /// Create a copy of MyListing
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MyListingImplCopyWith<_$MyListingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Category _$CategoryFromJson(Map<String, dynamic> json) {
  return _Category.fromJson(json);
}

/// @nodoc
mixin _$Category {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  dynamic get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'parent_id')
  dynamic get parentId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get slug => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  List<dynamic> get features => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  String get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this Category to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Category
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CategoryCopyWith<Category> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryCopyWith<$Res> {
  factory $CategoryCopyWith(Category value, $Res Function(Category) then) =
      _$CategoryCopyWithImpl<$Res, Category>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'user_id') dynamic userId,
      @JsonKey(name: 'parent_id') dynamic parentId,
      String name,
      String slug,
      String description,
      List<dynamic> features,
      String image,
      @JsonKey(name: 'created_at') String createdAt,
      @JsonKey(name: 'updated_at') String updatedAt});
}

/// @nodoc
class _$CategoryCopyWithImpl<$Res, $Val extends Category>
    implements $CategoryCopyWith<$Res> {
  _$CategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Category
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = freezed,
    Object? parentId = freezed,
    Object? name = null,
    Object? slug = null,
    Object? description = null,
    Object? features = null,
    Object? image = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      parentId: freezed == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      slug: null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      features: null == features
          ? _value.features
          : features // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CategoryImplCopyWith<$Res>
    implements $CategoryCopyWith<$Res> {
  factory _$$CategoryImplCopyWith(
          _$CategoryImpl value, $Res Function(_$CategoryImpl) then) =
      __$$CategoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'user_id') dynamic userId,
      @JsonKey(name: 'parent_id') dynamic parentId,
      String name,
      String slug,
      String description,
      List<dynamic> features,
      String image,
      @JsonKey(name: 'created_at') String createdAt,
      @JsonKey(name: 'updated_at') String updatedAt});
}

/// @nodoc
class __$$CategoryImplCopyWithImpl<$Res>
    extends _$CategoryCopyWithImpl<$Res, _$CategoryImpl>
    implements _$$CategoryImplCopyWith<$Res> {
  __$$CategoryImplCopyWithImpl(
      _$CategoryImpl _value, $Res Function(_$CategoryImpl) _then)
      : super(_value, _then);

  /// Create a copy of Category
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = freezed,
    Object? parentId = freezed,
    Object? name = null,
    Object? slug = null,
    Object? description = null,
    Object? features = null,
    Object? image = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$CategoryImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      parentId: freezed == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      slug: null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      features: null == features
          ? _value._features
          : features // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CategoryImpl implements _Category {
  const _$CategoryImpl(
      {required this.id,
      @JsonKey(name: 'user_id') this.userId,
      @JsonKey(name: 'parent_id') this.parentId,
      required this.name,
      required this.slug,
      required this.description,
      required final List<dynamic> features,
      required this.image,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') required this.updatedAt})
      : _features = features;

  factory _$CategoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoryImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'user_id')
  final dynamic userId;
  @override
  @JsonKey(name: 'parent_id')
  final dynamic parentId;
  @override
  final String name;
  @override
  final String slug;
  @override
  final String description;
  final List<dynamic> _features;
  @override
  List<dynamic> get features {
    if (_features is EqualUnmodifiableListView) return _features;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_features);
  }

  @override
  final String image;
  @override
  @JsonKey(name: 'created_at')
  final String createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final String updatedAt;

  @override
  String toString() {
    return 'Category(id: $id, userId: $userId, parentId: $parentId, name: $name, slug: $slug, description: $description, features: $features, image: $image, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryImpl &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other.userId, userId) &&
            const DeepCollectionEquality().equals(other.parentId, parentId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._features, _features) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      const DeepCollectionEquality().hash(userId),
      const DeepCollectionEquality().hash(parentId),
      name,
      slug,
      description,
      const DeepCollectionEquality().hash(_features),
      image,
      createdAt,
      updatedAt);

  /// Create a copy of Category
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryImplCopyWith<_$CategoryImpl> get copyWith =>
      __$$CategoryImplCopyWithImpl<_$CategoryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CategoryImplToJson(
      this,
    );
  }
}

abstract class _Category implements Category {
  const factory _Category(
          {required final int id,
          @JsonKey(name: 'user_id') final dynamic userId,
          @JsonKey(name: 'parent_id') final dynamic parentId,
          required final String name,
          required final String slug,
          required final String description,
          required final List<dynamic> features,
          required final String image,
          @JsonKey(name: 'created_at') required final String createdAt,
          @JsonKey(name: 'updated_at') required final String updatedAt}) =
      _$CategoryImpl;

  factory _Category.fromJson(Map<String, dynamic> json) =
      _$CategoryImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'user_id')
  dynamic get userId;
  @override
  @JsonKey(name: 'parent_id')
  dynamic get parentId;
  @override
  String get name;
  @override
  String get slug;
  @override
  String get description;
  @override
  List<dynamic> get features;
  @override
  String get image;
  @override
  @JsonKey(name: 'created_at')
  String get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  String get updatedAt;

  /// Create a copy of Category
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CategoryImplCopyWith<_$CategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
