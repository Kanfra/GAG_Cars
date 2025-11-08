// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'userListingsModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

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
  List<String> get features => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt => throw _privateConstructorUsedError;

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
      List<String> features,
      String image,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt});
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
              as List<String>,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
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
      List<String> features,
      String image,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt});
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
              as List<String>,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
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
      required final List<String> features,
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
  final List<String> _features;
  @override
  List<String> get features {
    if (_features is EqualUnmodifiableListView) return _features;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_features);
  }

  @override
  final String image;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

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
          required final List<String> features,
          required final String image,
          @JsonKey(name: 'created_at') required final DateTime createdAt,
          @JsonKey(name: 'updated_at') required final DateTime updatedAt}) =
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
  List<String> get features;
  @override
  String get image;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt;

  /// Create a copy of Category
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CategoryImplCopyWith<_$CategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Listing _$ListingFromJson(Map<String, dynamic> json) {
  return _Listing.fromJson(json);
}

/// @nodoc
mixin _$Listing {
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  String? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'country_id')
  dynamic get countryId => throw _privateConstructorUsedError;
  @JsonKey(name: 'brand_model_id')
  int? get brandModelId => throw _privateConstructorUsedError;
  @JsonKey(name: 'brand_id')
  int? get brandId => throw _privateConstructorUsedError;
  @JsonKey(name: 'category_id')
  int? get categoryId => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get year => throw _privateConstructorUsedError;
  String? get slug => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  List<String>? get images => throw _privateConstructorUsedError;
  String? get location => throw _privateConstructorUsedError;
  @JsonKey(name: 'serial_number')
  dynamic get serialNumber => throw _privateConstructorUsedError;
  dynamic get condition => throw _privateConstructorUsedError;
  @JsonKey(name: 'steer_position')
  String? get steerPosition => throw _privateConstructorUsedError;
  @JsonKey(name: 'engine_capacity')
  dynamic get engineCapacity => throw _privateConstructorUsedError;
  dynamic get transmission => throw _privateConstructorUsedError;
  dynamic get color => throw _privateConstructorUsedError;
  @JsonKey(name: 'build_type')
  dynamic get buildType => throw _privateConstructorUsedError;
  @JsonKey(name: 'number_of_passengers')
  dynamic get numberOfPassengers => throw _privateConstructorUsedError;
  List<dynamic>? get features => throw _privateConstructorUsedError;
  dynamic get status => throw _privateConstructorUsedError;
  String? get price => throw _privateConstructorUsedError;
  dynamic get mileage => throw _privateConstructorUsedError;
  dynamic get warranty => throw _privateConstructorUsedError;
  @JsonKey(name: 'warranty_expiration')
  dynamic get warrantyExpiration => throw _privateConstructorUsedError;
  @JsonKey(name: 'deleted_at')
  dynamic get deletedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  dynamic get Height => throw _privateConstructorUsedError;
  dynamic get VIN => throw _privateConstructorUsedError;
  Category? get category => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_promoted')
  bool? get isPromoted => throw _privateConstructorUsedError;

  /// Serializes this Listing to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Listing
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ListingCopyWith<Listing> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListingCopyWith<$Res> {
  factory $ListingCopyWith(Listing value, $Res Function(Listing) then) =
      _$ListingCopyWithImpl<$Res, Listing>;
  @useResult
  $Res call(
      {String? id,
      @JsonKey(name: 'user_id') String? userId,
      @JsonKey(name: 'country_id') dynamic countryId,
      @JsonKey(name: 'brand_model_id') int? brandModelId,
      @JsonKey(name: 'brand_id') int? brandId,
      @JsonKey(name: 'category_id') int? categoryId,
      String? name,
      String? year,
      String? slug,
      String? description,
      List<String>? images,
      String? location,
      @JsonKey(name: 'serial_number') dynamic serialNumber,
      dynamic condition,
      @JsonKey(name: 'steer_position') String? steerPosition,
      @JsonKey(name: 'engine_capacity') dynamic engineCapacity,
      dynamic transmission,
      dynamic color,
      @JsonKey(name: 'build_type') dynamic buildType,
      @JsonKey(name: 'number_of_passengers') dynamic numberOfPassengers,
      List<dynamic>? features,
      dynamic status,
      String? price,
      dynamic mileage,
      dynamic warranty,
      @JsonKey(name: 'warranty_expiration') dynamic warrantyExpiration,
      @JsonKey(name: 'deleted_at') dynamic deletedAt,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt,
      dynamic Height,
      dynamic VIN,
      Category? category,
      @JsonKey(name: 'is_promoted') bool? isPromoted});

  $CategoryCopyWith<$Res>? get category;
}

/// @nodoc
class _$ListingCopyWithImpl<$Res, $Val extends Listing>
    implements $ListingCopyWith<$Res> {
  _$ListingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Listing
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? countryId = freezed,
    Object? brandModelId = freezed,
    Object? brandId = freezed,
    Object? categoryId = freezed,
    Object? name = freezed,
    Object? year = freezed,
    Object? slug = freezed,
    Object? description = freezed,
    Object? images = freezed,
    Object? location = freezed,
    Object? serialNumber = freezed,
    Object? condition = freezed,
    Object? steerPosition = freezed,
    Object? engineCapacity = freezed,
    Object? transmission = freezed,
    Object? color = freezed,
    Object? buildType = freezed,
    Object? numberOfPassengers = freezed,
    Object? features = freezed,
    Object? status = freezed,
    Object? price = freezed,
    Object? mileage = freezed,
    Object? warranty = freezed,
    Object? warrantyExpiration = freezed,
    Object? deletedAt = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? Height = freezed,
    Object? VIN = freezed,
    Object? category = freezed,
    Object? isPromoted = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      countryId: freezed == countryId
          ? _value.countryId
          : countryId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      brandModelId: freezed == brandModelId
          ? _value.brandModelId
          : brandModelId // ignore: cast_nullable_to_non_nullable
              as int?,
      brandId: freezed == brandId
          ? _value.brandId
          : brandId // ignore: cast_nullable_to_non_nullable
              as int?,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      year: freezed == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as String?,
      slug: freezed == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      images: freezed == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
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
              as dynamic,
      transmission: freezed == transmission
          ? _value.transmission
          : transmission // ignore: cast_nullable_to_non_nullable
              as dynamic,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as dynamic,
      buildType: freezed == buildType
          ? _value.buildType
          : buildType // ignore: cast_nullable_to_non_nullable
              as dynamic,
      numberOfPassengers: freezed == numberOfPassengers
          ? _value.numberOfPassengers
          : numberOfPassengers // ignore: cast_nullable_to_non_nullable
              as dynamic,
      features: freezed == features
          ? _value.features
          : features // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as dynamic,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String?,
      mileage: freezed == mileage
          ? _value.mileage
          : mileage // ignore: cast_nullable_to_non_nullable
              as dynamic,
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
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
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

  /// Create a copy of Listing
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
abstract class _$$ListingImplCopyWith<$Res> implements $ListingCopyWith<$Res> {
  factory _$$ListingImplCopyWith(
          _$ListingImpl value, $Res Function(_$ListingImpl) then) =
      __$$ListingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      @JsonKey(name: 'user_id') String? userId,
      @JsonKey(name: 'country_id') dynamic countryId,
      @JsonKey(name: 'brand_model_id') int? brandModelId,
      @JsonKey(name: 'brand_id') int? brandId,
      @JsonKey(name: 'category_id') int? categoryId,
      String? name,
      String? year,
      String? slug,
      String? description,
      List<String>? images,
      String? location,
      @JsonKey(name: 'serial_number') dynamic serialNumber,
      dynamic condition,
      @JsonKey(name: 'steer_position') String? steerPosition,
      @JsonKey(name: 'engine_capacity') dynamic engineCapacity,
      dynamic transmission,
      dynamic color,
      @JsonKey(name: 'build_type') dynamic buildType,
      @JsonKey(name: 'number_of_passengers') dynamic numberOfPassengers,
      List<dynamic>? features,
      dynamic status,
      String? price,
      dynamic mileage,
      dynamic warranty,
      @JsonKey(name: 'warranty_expiration') dynamic warrantyExpiration,
      @JsonKey(name: 'deleted_at') dynamic deletedAt,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt,
      dynamic Height,
      dynamic VIN,
      Category? category,
      @JsonKey(name: 'is_promoted') bool? isPromoted});

  @override
  $CategoryCopyWith<$Res>? get category;
}

/// @nodoc
class __$$ListingImplCopyWithImpl<$Res>
    extends _$ListingCopyWithImpl<$Res, _$ListingImpl>
    implements _$$ListingImplCopyWith<$Res> {
  __$$ListingImplCopyWithImpl(
      _$ListingImpl _value, $Res Function(_$ListingImpl) _then)
      : super(_value, _then);

  /// Create a copy of Listing
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? countryId = freezed,
    Object? brandModelId = freezed,
    Object? brandId = freezed,
    Object? categoryId = freezed,
    Object? name = freezed,
    Object? year = freezed,
    Object? slug = freezed,
    Object? description = freezed,
    Object? images = freezed,
    Object? location = freezed,
    Object? serialNumber = freezed,
    Object? condition = freezed,
    Object? steerPosition = freezed,
    Object? engineCapacity = freezed,
    Object? transmission = freezed,
    Object? color = freezed,
    Object? buildType = freezed,
    Object? numberOfPassengers = freezed,
    Object? features = freezed,
    Object? status = freezed,
    Object? price = freezed,
    Object? mileage = freezed,
    Object? warranty = freezed,
    Object? warrantyExpiration = freezed,
    Object? deletedAt = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? Height = freezed,
    Object? VIN = freezed,
    Object? category = freezed,
    Object? isPromoted = freezed,
  }) {
    return _then(_$ListingImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      countryId: freezed == countryId
          ? _value.countryId
          : countryId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      brandModelId: freezed == brandModelId
          ? _value.brandModelId
          : brandModelId // ignore: cast_nullable_to_non_nullable
              as int?,
      brandId: freezed == brandId
          ? _value.brandId
          : brandId // ignore: cast_nullable_to_non_nullable
              as int?,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      year: freezed == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as String?,
      slug: freezed == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      images: freezed == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
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
              as dynamic,
      transmission: freezed == transmission
          ? _value.transmission
          : transmission // ignore: cast_nullable_to_non_nullable
              as dynamic,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as dynamic,
      buildType: freezed == buildType
          ? _value.buildType
          : buildType // ignore: cast_nullable_to_non_nullable
              as dynamic,
      numberOfPassengers: freezed == numberOfPassengers
          ? _value.numberOfPassengers
          : numberOfPassengers // ignore: cast_nullable_to_non_nullable
              as dynamic,
      features: freezed == features
          ? _value._features
          : features // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as dynamic,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String?,
      mileage: freezed == mileage
          ? _value.mileage
          : mileage // ignore: cast_nullable_to_non_nullable
              as dynamic,
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
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
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
class _$ListingImpl implements _Listing {
  const _$ListingImpl(
      {this.id,
      @JsonKey(name: 'user_id') this.userId,
      @JsonKey(name: 'country_id') this.countryId,
      @JsonKey(name: 'brand_model_id') this.brandModelId,
      @JsonKey(name: 'brand_id') this.brandId,
      @JsonKey(name: 'category_id') this.categoryId,
      this.name,
      this.year,
      this.slug,
      this.description,
      final List<String>? images,
      this.location,
      @JsonKey(name: 'serial_number') this.serialNumber,
      this.condition,
      @JsonKey(name: 'steer_position') this.steerPosition,
      @JsonKey(name: 'engine_capacity') this.engineCapacity,
      this.transmission,
      this.color,
      @JsonKey(name: 'build_type') this.buildType,
      @JsonKey(name: 'number_of_passengers') this.numberOfPassengers,
      final List<dynamic>? features,
      this.status,
      this.price,
      this.mileage,
      this.warranty,
      @JsonKey(name: 'warranty_expiration') this.warrantyExpiration,
      @JsonKey(name: 'deleted_at') this.deletedAt,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt,
      this.Height,
      this.VIN,
      this.category,
      @JsonKey(name: 'is_promoted') this.isPromoted})
      : _images = images,
        _features = features;

  factory _$ListingImpl.fromJson(Map<String, dynamic> json) =>
      _$$ListingImplFromJson(json);

  @override
  final String? id;
  @override
  @JsonKey(name: 'user_id')
  final String? userId;
  @override
  @JsonKey(name: 'country_id')
  final dynamic countryId;
  @override
  @JsonKey(name: 'brand_model_id')
  final int? brandModelId;
  @override
  @JsonKey(name: 'brand_id')
  final int? brandId;
  @override
  @JsonKey(name: 'category_id')
  final int? categoryId;
  @override
  final String? name;
  @override
  final String? year;
  @override
  final String? slug;
  @override
  final String? description;
  final List<String>? _images;
  @override
  List<String>? get images {
    final value = _images;
    if (value == null) return null;
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? location;
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
  final dynamic engineCapacity;
  @override
  final dynamic transmission;
  @override
  final dynamic color;
  @override
  @JsonKey(name: 'build_type')
  final dynamic buildType;
  @override
  @JsonKey(name: 'number_of_passengers')
  final dynamic numberOfPassengers;
  final List<dynamic>? _features;
  @override
  List<dynamic>? get features {
    final value = _features;
    if (value == null) return null;
    if (_features is EqualUnmodifiableListView) return _features;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final dynamic status;
  @override
  final String? price;
  @override
  final dynamic mileage;
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
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;
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
    return 'Listing(id: $id, userId: $userId, countryId: $countryId, brandModelId: $brandModelId, brandId: $brandId, categoryId: $categoryId, name: $name, year: $year, slug: $slug, description: $description, images: $images, location: $location, serialNumber: $serialNumber, condition: $condition, steerPosition: $steerPosition, engineCapacity: $engineCapacity, transmission: $transmission, color: $color, buildType: $buildType, numberOfPassengers: $numberOfPassengers, features: $features, status: $status, price: $price, mileage: $mileage, warranty: $warranty, warrantyExpiration: $warrantyExpiration, deletedAt: $deletedAt, createdAt: $createdAt, updatedAt: $updatedAt, Height: $Height, VIN: $VIN, category: $category, isPromoted: $isPromoted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ListingImpl &&
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
            const DeepCollectionEquality()
                .equals(other.engineCapacity, engineCapacity) &&
            const DeepCollectionEquality()
                .equals(other.transmission, transmission) &&
            const DeepCollectionEquality().equals(other.color, color) &&
            const DeepCollectionEquality().equals(other.buildType, buildType) &&
            const DeepCollectionEquality()
                .equals(other.numberOfPassengers, numberOfPassengers) &&
            const DeepCollectionEquality().equals(other._features, _features) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            (identical(other.price, price) || other.price == price) &&
            const DeepCollectionEquality().equals(other.mileage, mileage) &&
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
        const DeepCollectionEquality().hash(engineCapacity),
        const DeepCollectionEquality().hash(transmission),
        const DeepCollectionEquality().hash(color),
        const DeepCollectionEquality().hash(buildType),
        const DeepCollectionEquality().hash(numberOfPassengers),
        const DeepCollectionEquality().hash(_features),
        const DeepCollectionEquality().hash(status),
        price,
        const DeepCollectionEquality().hash(mileage),
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

  /// Create a copy of Listing
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ListingImplCopyWith<_$ListingImpl> get copyWith =>
      __$$ListingImplCopyWithImpl<_$ListingImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ListingImplToJson(
      this,
    );
  }
}

abstract class _Listing implements Listing {
  const factory _Listing(
      {final String? id,
      @JsonKey(name: 'user_id') final String? userId,
      @JsonKey(name: 'country_id') final dynamic countryId,
      @JsonKey(name: 'brand_model_id') final int? brandModelId,
      @JsonKey(name: 'brand_id') final int? brandId,
      @JsonKey(name: 'category_id') final int? categoryId,
      final String? name,
      final String? year,
      final String? slug,
      final String? description,
      final List<String>? images,
      final String? location,
      @JsonKey(name: 'serial_number') final dynamic serialNumber,
      final dynamic condition,
      @JsonKey(name: 'steer_position') final String? steerPosition,
      @JsonKey(name: 'engine_capacity') final dynamic engineCapacity,
      final dynamic transmission,
      final dynamic color,
      @JsonKey(name: 'build_type') final dynamic buildType,
      @JsonKey(name: 'number_of_passengers') final dynamic numberOfPassengers,
      final List<dynamic>? features,
      final dynamic status,
      final String? price,
      final dynamic mileage,
      final dynamic warranty,
      @JsonKey(name: 'warranty_expiration') final dynamic warrantyExpiration,
      @JsonKey(name: 'deleted_at') final dynamic deletedAt,
      @JsonKey(name: 'created_at') final DateTime? createdAt,
      @JsonKey(name: 'updated_at') final DateTime? updatedAt,
      final dynamic Height,
      final dynamic VIN,
      final Category? category,
      @JsonKey(name: 'is_promoted') final bool? isPromoted}) = _$ListingImpl;

  factory _Listing.fromJson(Map<String, dynamic> json) = _$ListingImpl.fromJson;

  @override
  String? get id;
  @override
  @JsonKey(name: 'user_id')
  String? get userId;
  @override
  @JsonKey(name: 'country_id')
  dynamic get countryId;
  @override
  @JsonKey(name: 'brand_model_id')
  int? get brandModelId;
  @override
  @JsonKey(name: 'brand_id')
  int? get brandId;
  @override
  @JsonKey(name: 'category_id')
  int? get categoryId;
  @override
  String? get name;
  @override
  String? get year;
  @override
  String? get slug;
  @override
  String? get description;
  @override
  List<String>? get images;
  @override
  String? get location;
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
  dynamic get engineCapacity;
  @override
  dynamic get transmission;
  @override
  dynamic get color;
  @override
  @JsonKey(name: 'build_type')
  dynamic get buildType;
  @override
  @JsonKey(name: 'number_of_passengers')
  dynamic get numberOfPassengers;
  @override
  List<dynamic>? get features;
  @override
  dynamic get status;
  @override
  String? get price;
  @override
  dynamic get mileage;
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
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt;
  @override
  dynamic get Height;
  @override
  dynamic get VIN;
  @override
  Category? get category;
  @override
  @JsonKey(name: 'is_promoted')
  bool? get isPromoted;

  /// Create a copy of Listing
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ListingImplCopyWith<_$ListingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ListingResponse _$ListingResponseFromJson(Map<String, dynamic> json) {
  return _ListingResponse.fromJson(json);
}

/// @nodoc
mixin _$ListingResponse {
  List<Listing> get data => throw _privateConstructorUsedError;

  /// Serializes this ListingResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ListingResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ListingResponseCopyWith<ListingResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListingResponseCopyWith<$Res> {
  factory $ListingResponseCopyWith(
          ListingResponse value, $Res Function(ListingResponse) then) =
      _$ListingResponseCopyWithImpl<$Res, ListingResponse>;
  @useResult
  $Res call({List<Listing> data});
}

/// @nodoc
class _$ListingResponseCopyWithImpl<$Res, $Val extends ListingResponse>
    implements $ListingResponseCopyWith<$Res> {
  _$ListingResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ListingResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Listing>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ListingResponseImplCopyWith<$Res>
    implements $ListingResponseCopyWith<$Res> {
  factory _$$ListingResponseImplCopyWith(_$ListingResponseImpl value,
          $Res Function(_$ListingResponseImpl) then) =
      __$$ListingResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Listing> data});
}

/// @nodoc
class __$$ListingResponseImplCopyWithImpl<$Res>
    extends _$ListingResponseCopyWithImpl<$Res, _$ListingResponseImpl>
    implements _$$ListingResponseImplCopyWith<$Res> {
  __$$ListingResponseImplCopyWithImpl(
      _$ListingResponseImpl _value, $Res Function(_$ListingResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of ListingResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$ListingResponseImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Listing>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ListingResponseImpl implements _ListingResponse {
  const _$ListingResponseImpl({required final List<Listing> data})
      : _data = data;

  factory _$ListingResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ListingResponseImplFromJson(json);

  final List<Listing> _data;
  @override
  List<Listing> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'ListingResponse(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ListingResponseImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  /// Create a copy of ListingResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ListingResponseImplCopyWith<_$ListingResponseImpl> get copyWith =>
      __$$ListingResponseImplCopyWithImpl<_$ListingResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ListingResponseImplToJson(
      this,
    );
  }
}

abstract class _ListingResponse implements ListingResponse {
  const factory _ListingResponse({required final List<Listing> data}) =
      _$ListingResponseImpl;

  factory _ListingResponse.fromJson(Map<String, dynamic> json) =
      _$ListingResponseImpl.fromJson;

  @override
  List<Listing> get data;

  /// Create a copy of ListingResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ListingResponseImplCopyWith<_$ListingResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ErrorResponse _$ErrorResponseFromJson(Map<String, dynamic> json) {
  return _ErrorResponse.fromJson(json);
}

/// @nodoc
mixin _$ErrorResponse {
  String? get message => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  @JsonKey(name: 'error_description')
  String? get errorDescription => throw _privateConstructorUsedError;

  /// Serializes this ErrorResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ErrorResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ErrorResponseCopyWith<ErrorResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ErrorResponseCopyWith<$Res> {
  factory $ErrorResponseCopyWith(
          ErrorResponse value, $Res Function(ErrorResponse) then) =
      _$ErrorResponseCopyWithImpl<$Res, ErrorResponse>;
  @useResult
  $Res call(
      {String? message,
      String? error,
      @JsonKey(name: 'error_description') String? errorDescription});
}

/// @nodoc
class _$ErrorResponseCopyWithImpl<$Res, $Val extends ErrorResponse>
    implements $ErrorResponseCopyWith<$Res> {
  _$ErrorResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ErrorResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? error = freezed,
    Object? errorDescription = freezed,
  }) {
    return _then(_value.copyWith(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      errorDescription: freezed == errorDescription
          ? _value.errorDescription
          : errorDescription // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ErrorResponseImplCopyWith<$Res>
    implements $ErrorResponseCopyWith<$Res> {
  factory _$$ErrorResponseImplCopyWith(
          _$ErrorResponseImpl value, $Res Function(_$ErrorResponseImpl) then) =
      __$$ErrorResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? message,
      String? error,
      @JsonKey(name: 'error_description') String? errorDescription});
}

/// @nodoc
class __$$ErrorResponseImplCopyWithImpl<$Res>
    extends _$ErrorResponseCopyWithImpl<$Res, _$ErrorResponseImpl>
    implements _$$ErrorResponseImplCopyWith<$Res> {
  __$$ErrorResponseImplCopyWithImpl(
      _$ErrorResponseImpl _value, $Res Function(_$ErrorResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of ErrorResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? error = freezed,
    Object? errorDescription = freezed,
  }) {
    return _then(_$ErrorResponseImpl(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      errorDescription: freezed == errorDescription
          ? _value.errorDescription
          : errorDescription // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ErrorResponseImpl implements _ErrorResponse {
  const _$ErrorResponseImpl(
      {this.message,
      this.error,
      @JsonKey(name: 'error_description') this.errorDescription});

  factory _$ErrorResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ErrorResponseImplFromJson(json);

  @override
  final String? message;
  @override
  final String? error;
  @override
  @JsonKey(name: 'error_description')
  final String? errorDescription;

  @override
  String toString() {
    return 'ErrorResponse(message: $message, error: $error, errorDescription: $errorDescription)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorResponseImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.errorDescription, errorDescription) ||
                other.errorDescription == errorDescription));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, message, error, errorDescription);

  /// Create a copy of ErrorResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorResponseImplCopyWith<_$ErrorResponseImpl> get copyWith =>
      __$$ErrorResponseImplCopyWithImpl<_$ErrorResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ErrorResponseImplToJson(
      this,
    );
  }
}

abstract class _ErrorResponse implements ErrorResponse {
  const factory _ErrorResponse(
          {final String? message,
          final String? error,
          @JsonKey(name: 'error_description') final String? errorDescription}) =
      _$ErrorResponseImpl;

  factory _ErrorResponse.fromJson(Map<String, dynamic> json) =
      _$ErrorResponseImpl.fromJson;

  @override
  String? get message;
  @override
  String? get error;
  @override
  @JsonKey(name: 'error_description')
  String? get errorDescription;

  /// Create a copy of ErrorResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorResponseImplCopyWith<_$ErrorResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ApiResponse<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data) success,
    required TResult Function(String message) unauthorized,
    required TResult Function(String message) notFound,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T data)? success,
    TResult? Function(String message)? unauthorized,
    TResult? Function(String message)? notFound,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data)? success,
    TResult Function(String message)? unauthorized,
    TResult Function(String message)? notFound,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Success<T> value) success,
    required TResult Function(Unauthorized<T> value) unauthorized,
    required TResult Function(NotFound<T> value) notFound,
    required TResult Function(Error<T> value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Success<T> value)? success,
    TResult? Function(Unauthorized<T> value)? unauthorized,
    TResult? Function(NotFound<T> value)? notFound,
    TResult? Function(Error<T> value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Success<T> value)? success,
    TResult Function(Unauthorized<T> value)? unauthorized,
    TResult Function(NotFound<T> value)? notFound,
    TResult Function(Error<T> value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiResponseCopyWith<T, $Res> {
  factory $ApiResponseCopyWith(
          ApiResponse<T> value, $Res Function(ApiResponse<T>) then) =
      _$ApiResponseCopyWithImpl<T, $Res, ApiResponse<T>>;
}

/// @nodoc
class _$ApiResponseCopyWithImpl<T, $Res, $Val extends ApiResponse<T>>
    implements $ApiResponseCopyWith<T, $Res> {
  _$ApiResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ApiResponse
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<T, $Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl<T> value, $Res Function(_$SuccessImpl<T>) then) =
      __$$SuccessImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T data});
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<T, $Res>
    extends _$ApiResponseCopyWithImpl<T, $Res, _$SuccessImpl<T>>
    implements _$$SuccessImplCopyWith<T, $Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl<T> _value, $Res Function(_$SuccessImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of ApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$SuccessImpl<T>(
      freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$SuccessImpl<T> implements Success<T> {
  const _$SuccessImpl(this.data);

  @override
  final T data;

  @override
  String toString() {
    return 'ApiResponse<$T>.success(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessImpl<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  /// Create a copy of ApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessImplCopyWith<T, _$SuccessImpl<T>> get copyWith =>
      __$$SuccessImplCopyWithImpl<T, _$SuccessImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data) success,
    required TResult Function(String message) unauthorized,
    required TResult Function(String message) notFound,
    required TResult Function(String message) error,
  }) {
    return success(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T data)? success,
    TResult? Function(String message)? unauthorized,
    TResult? Function(String message)? notFound,
    TResult? Function(String message)? error,
  }) {
    return success?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data)? success,
    TResult Function(String message)? unauthorized,
    TResult Function(String message)? notFound,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Success<T> value) success,
    required TResult Function(Unauthorized<T> value) unauthorized,
    required TResult Function(NotFound<T> value) notFound,
    required TResult Function(Error<T> value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Success<T> value)? success,
    TResult? Function(Unauthorized<T> value)? unauthorized,
    TResult? Function(NotFound<T> value)? notFound,
    TResult? Function(Error<T> value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Success<T> value)? success,
    TResult Function(Unauthorized<T> value)? unauthorized,
    TResult Function(NotFound<T> value)? notFound,
    TResult Function(Error<T> value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class Success<T> implements ApiResponse<T> {
  const factory Success(final T data) = _$SuccessImpl<T>;

  T get data;

  /// Create a copy of ApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SuccessImplCopyWith<T, _$SuccessImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UnauthorizedImplCopyWith<T, $Res> {
  factory _$$UnauthorizedImplCopyWith(_$UnauthorizedImpl<T> value,
          $Res Function(_$UnauthorizedImpl<T>) then) =
      __$$UnauthorizedImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$UnauthorizedImplCopyWithImpl<T, $Res>
    extends _$ApiResponseCopyWithImpl<T, $Res, _$UnauthorizedImpl<T>>
    implements _$$UnauthorizedImplCopyWith<T, $Res> {
  __$$UnauthorizedImplCopyWithImpl(
      _$UnauthorizedImpl<T> _value, $Res Function(_$UnauthorizedImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of ApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$UnauthorizedImpl<T>(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UnauthorizedImpl<T> implements Unauthorized<T> {
  const _$UnauthorizedImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'ApiResponse<$T>.unauthorized(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnauthorizedImpl<T> &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of ApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UnauthorizedImplCopyWith<T, _$UnauthorizedImpl<T>> get copyWith =>
      __$$UnauthorizedImplCopyWithImpl<T, _$UnauthorizedImpl<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data) success,
    required TResult Function(String message) unauthorized,
    required TResult Function(String message) notFound,
    required TResult Function(String message) error,
  }) {
    return unauthorized(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T data)? success,
    TResult? Function(String message)? unauthorized,
    TResult? Function(String message)? notFound,
    TResult? Function(String message)? error,
  }) {
    return unauthorized?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data)? success,
    TResult Function(String message)? unauthorized,
    TResult Function(String message)? notFound,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (unauthorized != null) {
      return unauthorized(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Success<T> value) success,
    required TResult Function(Unauthorized<T> value) unauthorized,
    required TResult Function(NotFound<T> value) notFound,
    required TResult Function(Error<T> value) error,
  }) {
    return unauthorized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Success<T> value)? success,
    TResult? Function(Unauthorized<T> value)? unauthorized,
    TResult? Function(NotFound<T> value)? notFound,
    TResult? Function(Error<T> value)? error,
  }) {
    return unauthorized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Success<T> value)? success,
    TResult Function(Unauthorized<T> value)? unauthorized,
    TResult Function(NotFound<T> value)? notFound,
    TResult Function(Error<T> value)? error,
    required TResult orElse(),
  }) {
    if (unauthorized != null) {
      return unauthorized(this);
    }
    return orElse();
  }
}

abstract class Unauthorized<T> implements ApiResponse<T> {
  const factory Unauthorized(final String message) = _$UnauthorizedImpl<T>;

  String get message;

  /// Create a copy of ApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UnauthorizedImplCopyWith<T, _$UnauthorizedImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NotFoundImplCopyWith<T, $Res> {
  factory _$$NotFoundImplCopyWith(
          _$NotFoundImpl<T> value, $Res Function(_$NotFoundImpl<T>) then) =
      __$$NotFoundImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$NotFoundImplCopyWithImpl<T, $Res>
    extends _$ApiResponseCopyWithImpl<T, $Res, _$NotFoundImpl<T>>
    implements _$$NotFoundImplCopyWith<T, $Res> {
  __$$NotFoundImplCopyWithImpl(
      _$NotFoundImpl<T> _value, $Res Function(_$NotFoundImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of ApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$NotFoundImpl<T>(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$NotFoundImpl<T> implements NotFound<T> {
  const _$NotFoundImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'ApiResponse<$T>.notFound(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotFoundImpl<T> &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of ApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NotFoundImplCopyWith<T, _$NotFoundImpl<T>> get copyWith =>
      __$$NotFoundImplCopyWithImpl<T, _$NotFoundImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data) success,
    required TResult Function(String message) unauthorized,
    required TResult Function(String message) notFound,
    required TResult Function(String message) error,
  }) {
    return notFound(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T data)? success,
    TResult? Function(String message)? unauthorized,
    TResult? Function(String message)? notFound,
    TResult? Function(String message)? error,
  }) {
    return notFound?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data)? success,
    TResult Function(String message)? unauthorized,
    TResult Function(String message)? notFound,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (notFound != null) {
      return notFound(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Success<T> value) success,
    required TResult Function(Unauthorized<T> value) unauthorized,
    required TResult Function(NotFound<T> value) notFound,
    required TResult Function(Error<T> value) error,
  }) {
    return notFound(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Success<T> value)? success,
    TResult? Function(Unauthorized<T> value)? unauthorized,
    TResult? Function(NotFound<T> value)? notFound,
    TResult? Function(Error<T> value)? error,
  }) {
    return notFound?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Success<T> value)? success,
    TResult Function(Unauthorized<T> value)? unauthorized,
    TResult Function(NotFound<T> value)? notFound,
    TResult Function(Error<T> value)? error,
    required TResult orElse(),
  }) {
    if (notFound != null) {
      return notFound(this);
    }
    return orElse();
  }
}

abstract class NotFound<T> implements ApiResponse<T> {
  const factory NotFound(final String message) = _$NotFoundImpl<T>;

  String get message;

  /// Create a copy of ApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NotFoundImplCopyWith<T, _$NotFoundImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<T, $Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl<T> value, $Res Function(_$ErrorImpl<T>) then) =
      __$$ErrorImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<T, $Res>
    extends _$ApiResponseCopyWithImpl<T, $Res, _$ErrorImpl<T>>
    implements _$$ErrorImplCopyWith<T, $Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl<T> _value, $Res Function(_$ErrorImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of ApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ErrorImpl<T>(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorImpl<T> implements Error<T> {
  const _$ErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'ApiResponse<$T>.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl<T> &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of ApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<T, _$ErrorImpl<T>> get copyWith =>
      __$$ErrorImplCopyWithImpl<T, _$ErrorImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data) success,
    required TResult Function(String message) unauthorized,
    required TResult Function(String message) notFound,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T data)? success,
    TResult? Function(String message)? unauthorized,
    TResult? Function(String message)? notFound,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data)? success,
    TResult Function(String message)? unauthorized,
    TResult Function(String message)? notFound,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Success<T> value) success,
    required TResult Function(Unauthorized<T> value) unauthorized,
    required TResult Function(NotFound<T> value) notFound,
    required TResult Function(Error<T> value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Success<T> value)? success,
    TResult? Function(Unauthorized<T> value)? unauthorized,
    TResult? Function(NotFound<T> value)? notFound,
    TResult? Function(Error<T> value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Success<T> value)? success,
    TResult Function(Unauthorized<T> value)? unauthorized,
    TResult Function(NotFound<T> value)? notFound,
    TResult Function(Error<T> value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class Error<T> implements ApiResponse<T> {
  const factory Error(final String message) = _$ErrorImpl<T>;

  String get message;

  /// Create a copy of ApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<T, _$ErrorImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
