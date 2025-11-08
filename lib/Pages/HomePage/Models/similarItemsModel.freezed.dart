// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'similarItemsModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SimilarItemsResponse _$SimilarItemsResponseFromJson(Map<String, dynamic> json) {
  return _SimilarItemsResponse.fromJson(json);
}

/// @nodoc
mixin _$SimilarItemsResponse {
  @JsonKey(name: 'data')
  List<SimilarItem> get data => throw _privateConstructorUsedError;
  @JsonKey(name: 'links')
  PaginationLinks? get links => throw _privateConstructorUsedError;
  @JsonKey(name: 'meta')
  PaginationMeta? get meta => throw _privateConstructorUsedError;

  /// Serializes this SimilarItemsResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SimilarItemsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SimilarItemsResponseCopyWith<SimilarItemsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SimilarItemsResponseCopyWith<$Res> {
  factory $SimilarItemsResponseCopyWith(SimilarItemsResponse value,
          $Res Function(SimilarItemsResponse) then) =
      _$SimilarItemsResponseCopyWithImpl<$Res, SimilarItemsResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'data') List<SimilarItem> data,
      @JsonKey(name: 'links') PaginationLinks? links,
      @JsonKey(name: 'meta') PaginationMeta? meta});

  $PaginationLinksCopyWith<$Res>? get links;
  $PaginationMetaCopyWith<$Res>? get meta;
}

/// @nodoc
class _$SimilarItemsResponseCopyWithImpl<$Res,
        $Val extends SimilarItemsResponse>
    implements $SimilarItemsResponseCopyWith<$Res> {
  _$SimilarItemsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SimilarItemsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? links = freezed,
    Object? meta = freezed,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<SimilarItem>,
      links: freezed == links
          ? _value.links
          : links // ignore: cast_nullable_to_non_nullable
              as PaginationLinks?,
      meta: freezed == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as PaginationMeta?,
    ) as $Val);
  }

  /// Create a copy of SimilarItemsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PaginationLinksCopyWith<$Res>? get links {
    if (_value.links == null) {
      return null;
    }

    return $PaginationLinksCopyWith<$Res>(_value.links!, (value) {
      return _then(_value.copyWith(links: value) as $Val);
    });
  }

  /// Create a copy of SimilarItemsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PaginationMetaCopyWith<$Res>? get meta {
    if (_value.meta == null) {
      return null;
    }

    return $PaginationMetaCopyWith<$Res>(_value.meta!, (value) {
      return _then(_value.copyWith(meta: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SimilarItemsResponseImplCopyWith<$Res>
    implements $SimilarItemsResponseCopyWith<$Res> {
  factory _$$SimilarItemsResponseImplCopyWith(_$SimilarItemsResponseImpl value,
          $Res Function(_$SimilarItemsResponseImpl) then) =
      __$$SimilarItemsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'data') List<SimilarItem> data,
      @JsonKey(name: 'links') PaginationLinks? links,
      @JsonKey(name: 'meta') PaginationMeta? meta});

  @override
  $PaginationLinksCopyWith<$Res>? get links;
  @override
  $PaginationMetaCopyWith<$Res>? get meta;
}

/// @nodoc
class __$$SimilarItemsResponseImplCopyWithImpl<$Res>
    extends _$SimilarItemsResponseCopyWithImpl<$Res, _$SimilarItemsResponseImpl>
    implements _$$SimilarItemsResponseImplCopyWith<$Res> {
  __$$SimilarItemsResponseImplCopyWithImpl(_$SimilarItemsResponseImpl _value,
      $Res Function(_$SimilarItemsResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of SimilarItemsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? links = freezed,
    Object? meta = freezed,
  }) {
    return _then(_$SimilarItemsResponseImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<SimilarItem>,
      links: freezed == links
          ? _value.links
          : links // ignore: cast_nullable_to_non_nullable
              as PaginationLinks?,
      meta: freezed == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as PaginationMeta?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SimilarItemsResponseImpl implements _SimilarItemsResponse {
  const _$SimilarItemsResponseImpl(
      {@JsonKey(name: 'data') required final List<SimilarItem> data,
      @JsonKey(name: 'links') this.links,
      @JsonKey(name: 'meta') this.meta})
      : _data = data;

  factory _$SimilarItemsResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$SimilarItemsResponseImplFromJson(json);

  final List<SimilarItem> _data;
  @override
  @JsonKey(name: 'data')
  List<SimilarItem> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  @JsonKey(name: 'links')
  final PaginationLinks? links;
  @override
  @JsonKey(name: 'meta')
  final PaginationMeta? meta;

  @override
  String toString() {
    return 'SimilarItemsResponse(data: $data, links: $links, meta: $meta)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SimilarItemsResponseImpl &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.links, links) || other.links == links) &&
            (identical(other.meta, meta) || other.meta == meta));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_data), links, meta);

  /// Create a copy of SimilarItemsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SimilarItemsResponseImplCopyWith<_$SimilarItemsResponseImpl>
      get copyWith =>
          __$$SimilarItemsResponseImplCopyWithImpl<_$SimilarItemsResponseImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SimilarItemsResponseImplToJson(
      this,
    );
  }
}

abstract class _SimilarItemsResponse implements SimilarItemsResponse {
  const factory _SimilarItemsResponse(
          {@JsonKey(name: 'data') required final List<SimilarItem> data,
          @JsonKey(name: 'links') final PaginationLinks? links,
          @JsonKey(name: 'meta') final PaginationMeta? meta}) =
      _$SimilarItemsResponseImpl;

  factory _SimilarItemsResponse.fromJson(Map<String, dynamic> json) =
      _$SimilarItemsResponseImpl.fromJson;

  @override
  @JsonKey(name: 'data')
  List<SimilarItem> get data;
  @override
  @JsonKey(name: 'links')
  PaginationLinks? get links;
  @override
  @JsonKey(name: 'meta')
  PaginationMeta? get meta;

  /// Create a copy of SimilarItemsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SimilarItemsResponseImplCopyWith<_$SimilarItemsResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

SimilarItem _$SimilarItemFromJson(Map<String, dynamic> json) {
  return _SimilarItem.fromJson(json);
}

/// @nodoc
mixin _$SimilarItem {
  @JsonKey(name: 'id')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  String? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'country_id', fromJson: _parseNullableInt)
  int? get countryId => throw _privateConstructorUsedError;
  @JsonKey(name: 'brand_model_id', fromJson: _parseNullableInt)
  int? get brandModelId => throw _privateConstructorUsedError;
  @JsonKey(name: 'brand_id', fromJson: _parseNullableInt)
  int? get brandId => throw _privateConstructorUsedError;
  @JsonKey(name: 'category_id', fromJson: _parseNullableInt)
  int? get categoryId => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'year')
  String? get year => throw _privateConstructorUsedError;
  @JsonKey(name: 'slug')
  String? get slug => throw _privateConstructorUsedError;
  @JsonKey(name: 'description')
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'images', fromJson: _parseStringList)
  List<String>? get images => throw _privateConstructorUsedError;
  @JsonKey(name: 'location')
  String? get location => throw _privateConstructorUsedError;
  @JsonKey(name: 'serial_number')
  String? get serialNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'condition')
  String? get condition => throw _privateConstructorUsedError;
  @JsonKey(name: 'steer_position')
  String? get steerPosition => throw _privateConstructorUsedError;
  @JsonKey(name: 'engine_capacity')
  String? get engineCapacity => throw _privateConstructorUsedError;
  @JsonKey(name: 'transmission')
  String? get transmission => throw _privateConstructorUsedError;
  @JsonKey(name: 'color')
  String? get color => throw _privateConstructorUsedError;
  @JsonKey(name: 'build_type')
  String? get buildType => throw _privateConstructorUsedError;
  @JsonKey(name: 'number_of_passengers', fromJson: _parseNullableInt)
  int? get numberOfPassengers => throw _privateConstructorUsedError;
  @JsonKey(name: 'features', fromJson: _parseStringList)
  List<String>? get features => throw _privateConstructorUsedError;
  @JsonKey(name: 'status')
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'price')
  String? get price => throw _privateConstructorUsedError;
  @JsonKey(name: 'mileage')
  String? get mileage => throw _privateConstructorUsedError;
  @JsonKey(name: 'warranty', fromJson: _parseNullableInt)
  int? get warranty => throw _privateConstructorUsedError;
  @JsonKey(name: 'warranty_expiration')
  String? get warrantyExpiration => throw _privateConstructorUsedError;
  @JsonKey(name: 'deleted_at')
  String? get deletedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  String? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'Height')
  String? get height => throw _privateConstructorUsedError;
  @JsonKey(name: 'VIN')
  String? get vin => throw _privateConstructorUsedError; // Added nested objects
  @JsonKey(name: 'brand')
  Brand? get brand => throw _privateConstructorUsedError;
  @JsonKey(name: 'category')
  Category? get category => throw _privateConstructorUsedError;
  @JsonKey(name: 'brand_model')
  BrandModel? get brandModel => throw _privateConstructorUsedError;
  @JsonKey(name: 'user')
  User? get user => throw _privateConstructorUsedError;

  /// Serializes this SimilarItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SimilarItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SimilarItemCopyWith<SimilarItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SimilarItemCopyWith<$Res> {
  factory $SimilarItemCopyWith(
          SimilarItem value, $Res Function(SimilarItem) then) =
      _$SimilarItemCopyWithImpl<$Res, SimilarItem>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String id,
      @JsonKey(name: 'user_id') String? userId,
      @JsonKey(name: 'country_id', fromJson: _parseNullableInt) int? countryId,
      @JsonKey(name: 'brand_model_id', fromJson: _parseNullableInt)
      int? brandModelId,
      @JsonKey(name: 'brand_id', fromJson: _parseNullableInt) int? brandId,
      @JsonKey(name: 'category_id', fromJson: _parseNullableInt)
      int? categoryId,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'year') String? year,
      @JsonKey(name: 'slug') String? slug,
      @JsonKey(name: 'description') String? description,
      @JsonKey(name: 'images', fromJson: _parseStringList) List<String>? images,
      @JsonKey(name: 'location') String? location,
      @JsonKey(name: 'serial_number') String? serialNumber,
      @JsonKey(name: 'condition') String? condition,
      @JsonKey(name: 'steer_position') String? steerPosition,
      @JsonKey(name: 'engine_capacity') String? engineCapacity,
      @JsonKey(name: 'transmission') String? transmission,
      @JsonKey(name: 'color') String? color,
      @JsonKey(name: 'build_type') String? buildType,
      @JsonKey(name: 'number_of_passengers', fromJson: _parseNullableInt)
      int? numberOfPassengers,
      @JsonKey(name: 'features', fromJson: _parseStringList)
      List<String>? features,
      @JsonKey(name: 'status') String? status,
      @JsonKey(name: 'price') String? price,
      @JsonKey(name: 'mileage') String? mileage,
      @JsonKey(name: 'warranty', fromJson: _parseNullableInt) int? warranty,
      @JsonKey(name: 'warranty_expiration') String? warrantyExpiration,
      @JsonKey(name: 'deleted_at') String? deletedAt,
      @JsonKey(name: 'created_at') String? createdAt,
      @JsonKey(name: 'updated_at') String? updatedAt,
      @JsonKey(name: 'Height') String? height,
      @JsonKey(name: 'VIN') String? vin,
      @JsonKey(name: 'brand') Brand? brand,
      @JsonKey(name: 'category') Category? category,
      @JsonKey(name: 'brand_model') BrandModel? brandModel,
      @JsonKey(name: 'user') User? user});

  $BrandCopyWith<$Res>? get brand;
  $CategoryCopyWith<$Res>? get category;
  $BrandModelCopyWith<$Res>? get brandModel;
  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class _$SimilarItemCopyWithImpl<$Res, $Val extends SimilarItem>
    implements $SimilarItemCopyWith<$Res> {
  _$SimilarItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SimilarItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
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
    Object? height = freezed,
    Object? vin = freezed,
    Object? brand = freezed,
    Object? category = freezed,
    Object? brandModel = freezed,
    Object? user = freezed,
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
      features: freezed == features
          ? _value.features
          : features // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String?,
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
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      height: freezed == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as String?,
      vin: freezed == vin
          ? _value.vin
          : vin // ignore: cast_nullable_to_non_nullable
              as String?,
      brand: freezed == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as Brand?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as Category?,
      brandModel: freezed == brandModel
          ? _value.brandModel
          : brandModel // ignore: cast_nullable_to_non_nullable
              as BrandModel?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
    ) as $Val);
  }

  /// Create a copy of SimilarItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BrandCopyWith<$Res>? get brand {
    if (_value.brand == null) {
      return null;
    }

    return $BrandCopyWith<$Res>(_value.brand!, (value) {
      return _then(_value.copyWith(brand: value) as $Val);
    });
  }

  /// Create a copy of SimilarItem
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

  /// Create a copy of SimilarItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BrandModelCopyWith<$Res>? get brandModel {
    if (_value.brandModel == null) {
      return null;
    }

    return $BrandModelCopyWith<$Res>(_value.brandModel!, (value) {
      return _then(_value.copyWith(brandModel: value) as $Val);
    });
  }

  /// Create a copy of SimilarItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SimilarItemImplCopyWith<$Res>
    implements $SimilarItemCopyWith<$Res> {
  factory _$$SimilarItemImplCopyWith(
          _$SimilarItemImpl value, $Res Function(_$SimilarItemImpl) then) =
      __$$SimilarItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String id,
      @JsonKey(name: 'user_id') String? userId,
      @JsonKey(name: 'country_id', fromJson: _parseNullableInt) int? countryId,
      @JsonKey(name: 'brand_model_id', fromJson: _parseNullableInt)
      int? brandModelId,
      @JsonKey(name: 'brand_id', fromJson: _parseNullableInt) int? brandId,
      @JsonKey(name: 'category_id', fromJson: _parseNullableInt)
      int? categoryId,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'year') String? year,
      @JsonKey(name: 'slug') String? slug,
      @JsonKey(name: 'description') String? description,
      @JsonKey(name: 'images', fromJson: _parseStringList) List<String>? images,
      @JsonKey(name: 'location') String? location,
      @JsonKey(name: 'serial_number') String? serialNumber,
      @JsonKey(name: 'condition') String? condition,
      @JsonKey(name: 'steer_position') String? steerPosition,
      @JsonKey(name: 'engine_capacity') String? engineCapacity,
      @JsonKey(name: 'transmission') String? transmission,
      @JsonKey(name: 'color') String? color,
      @JsonKey(name: 'build_type') String? buildType,
      @JsonKey(name: 'number_of_passengers', fromJson: _parseNullableInt)
      int? numberOfPassengers,
      @JsonKey(name: 'features', fromJson: _parseStringList)
      List<String>? features,
      @JsonKey(name: 'status') String? status,
      @JsonKey(name: 'price') String? price,
      @JsonKey(name: 'mileage') String? mileage,
      @JsonKey(name: 'warranty', fromJson: _parseNullableInt) int? warranty,
      @JsonKey(name: 'warranty_expiration') String? warrantyExpiration,
      @JsonKey(name: 'deleted_at') String? deletedAt,
      @JsonKey(name: 'created_at') String? createdAt,
      @JsonKey(name: 'updated_at') String? updatedAt,
      @JsonKey(name: 'Height') String? height,
      @JsonKey(name: 'VIN') String? vin,
      @JsonKey(name: 'brand') Brand? brand,
      @JsonKey(name: 'category') Category? category,
      @JsonKey(name: 'brand_model') BrandModel? brandModel,
      @JsonKey(name: 'user') User? user});

  @override
  $BrandCopyWith<$Res>? get brand;
  @override
  $CategoryCopyWith<$Res>? get category;
  @override
  $BrandModelCopyWith<$Res>? get brandModel;
  @override
  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class __$$SimilarItemImplCopyWithImpl<$Res>
    extends _$SimilarItemCopyWithImpl<$Res, _$SimilarItemImpl>
    implements _$$SimilarItemImplCopyWith<$Res> {
  __$$SimilarItemImplCopyWithImpl(
      _$SimilarItemImpl _value, $Res Function(_$SimilarItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of SimilarItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
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
    Object? height = freezed,
    Object? vin = freezed,
    Object? brand = freezed,
    Object? category = freezed,
    Object? brandModel = freezed,
    Object? user = freezed,
  }) {
    return _then(_$SimilarItemImpl(
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
      features: freezed == features
          ? _value._features
          : features // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String?,
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
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      height: freezed == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as String?,
      vin: freezed == vin
          ? _value.vin
          : vin // ignore: cast_nullable_to_non_nullable
              as String?,
      brand: freezed == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as Brand?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as Category?,
      brandModel: freezed == brandModel
          ? _value.brandModel
          : brandModel // ignore: cast_nullable_to_non_nullable
              as BrandModel?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$SimilarItemImpl extends _SimilarItem {
  const _$SimilarItemImpl(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'user_id') this.userId,
      @JsonKey(name: 'country_id', fromJson: _parseNullableInt) this.countryId,
      @JsonKey(name: 'brand_model_id', fromJson: _parseNullableInt)
      this.brandModelId,
      @JsonKey(name: 'brand_id', fromJson: _parseNullableInt) this.brandId,
      @JsonKey(name: 'category_id', fromJson: _parseNullableInt)
      this.categoryId,
      @JsonKey(name: 'name') this.name,
      @JsonKey(name: 'year') this.year,
      @JsonKey(name: 'slug') this.slug,
      @JsonKey(name: 'description') this.description,
      @JsonKey(name: 'images', fromJson: _parseStringList)
      final List<String>? images,
      @JsonKey(name: 'location') this.location,
      @JsonKey(name: 'serial_number') this.serialNumber,
      @JsonKey(name: 'condition') this.condition,
      @JsonKey(name: 'steer_position') this.steerPosition,
      @JsonKey(name: 'engine_capacity') this.engineCapacity,
      @JsonKey(name: 'transmission') this.transmission,
      @JsonKey(name: 'color') this.color,
      @JsonKey(name: 'build_type') this.buildType,
      @JsonKey(name: 'number_of_passengers', fromJson: _parseNullableInt)
      this.numberOfPassengers,
      @JsonKey(name: 'features', fromJson: _parseStringList)
      final List<String>? features,
      @JsonKey(name: 'status') this.status,
      @JsonKey(name: 'price') this.price,
      @JsonKey(name: 'mileage') this.mileage,
      @JsonKey(name: 'warranty', fromJson: _parseNullableInt) this.warranty,
      @JsonKey(name: 'warranty_expiration') this.warrantyExpiration,
      @JsonKey(name: 'deleted_at') this.deletedAt,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt,
      @JsonKey(name: 'Height') this.height,
      @JsonKey(name: 'VIN') this.vin,
      @JsonKey(name: 'brand') this.brand,
      @JsonKey(name: 'category') this.category,
      @JsonKey(name: 'brand_model') this.brandModel,
      @JsonKey(name: 'user') this.user})
      : _images = images,
        _features = features,
        super._();

  factory _$SimilarItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$SimilarItemImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final String id;
  @override
  @JsonKey(name: 'user_id')
  final String? userId;
  @override
  @JsonKey(name: 'country_id', fromJson: _parseNullableInt)
  final int? countryId;
  @override
  @JsonKey(name: 'brand_model_id', fromJson: _parseNullableInt)
  final int? brandModelId;
  @override
  @JsonKey(name: 'brand_id', fromJson: _parseNullableInt)
  final int? brandId;
  @override
  @JsonKey(name: 'category_id', fromJson: _parseNullableInt)
  final int? categoryId;
  @override
  @JsonKey(name: 'name')
  final String? name;
  @override
  @JsonKey(name: 'year')
  final String? year;
  @override
  @JsonKey(name: 'slug')
  final String? slug;
  @override
  @JsonKey(name: 'description')
  final String? description;
  final List<String>? _images;
  @override
  @JsonKey(name: 'images', fromJson: _parseStringList)
  List<String>? get images {
    final value = _images;
    if (value == null) return null;
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'location')
  final String? location;
  @override
  @JsonKey(name: 'serial_number')
  final String? serialNumber;
  @override
  @JsonKey(name: 'condition')
  final String? condition;
  @override
  @JsonKey(name: 'steer_position')
  final String? steerPosition;
  @override
  @JsonKey(name: 'engine_capacity')
  final String? engineCapacity;
  @override
  @JsonKey(name: 'transmission')
  final String? transmission;
  @override
  @JsonKey(name: 'color')
  final String? color;
  @override
  @JsonKey(name: 'build_type')
  final String? buildType;
  @override
  @JsonKey(name: 'number_of_passengers', fromJson: _parseNullableInt)
  final int? numberOfPassengers;
  final List<String>? _features;
  @override
  @JsonKey(name: 'features', fromJson: _parseStringList)
  List<String>? get features {
    final value = _features;
    if (value == null) return null;
    if (_features is EqualUnmodifiableListView) return _features;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'status')
  final String? status;
  @override
  @JsonKey(name: 'price')
  final String? price;
  @override
  @JsonKey(name: 'mileage')
  final String? mileage;
  @override
  @JsonKey(name: 'warranty', fromJson: _parseNullableInt)
  final int? warranty;
  @override
  @JsonKey(name: 'warranty_expiration')
  final String? warrantyExpiration;
  @override
  @JsonKey(name: 'deleted_at')
  final String? deletedAt;
  @override
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final String? updatedAt;
  @override
  @JsonKey(name: 'Height')
  final String? height;
  @override
  @JsonKey(name: 'VIN')
  final String? vin;
// Added nested objects
  @override
  @JsonKey(name: 'brand')
  final Brand? brand;
  @override
  @JsonKey(name: 'category')
  final Category? category;
  @override
  @JsonKey(name: 'brand_model')
  final BrandModel? brandModel;
  @override
  @JsonKey(name: 'user')
  final User? user;

  @override
  String toString() {
    return 'SimilarItem(id: $id, userId: $userId, countryId: $countryId, brandModelId: $brandModelId, brandId: $brandId, categoryId: $categoryId, name: $name, year: $year, slug: $slug, description: $description, images: $images, location: $location, serialNumber: $serialNumber, condition: $condition, steerPosition: $steerPosition, engineCapacity: $engineCapacity, transmission: $transmission, color: $color, buildType: $buildType, numberOfPassengers: $numberOfPassengers, features: $features, status: $status, price: $price, mileage: $mileage, warranty: $warranty, warrantyExpiration: $warrantyExpiration, deletedAt: $deletedAt, createdAt: $createdAt, updatedAt: $updatedAt, height: $height, vin: $vin, brand: $brand, category: $category, brandModel: $brandModel, user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SimilarItemImpl &&
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
            (identical(other.vin, vin) || other.vin == vin) &&
            (identical(other.brand, brand) || other.brand == brand) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.brandModel, brandModel) ||
                other.brandModel == brandModel) &&
            (identical(other.user, user) || other.user == user));
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
        vin,
        brand,
        category,
        brandModel,
        user
      ]);

  /// Create a copy of SimilarItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SimilarItemImplCopyWith<_$SimilarItemImpl> get copyWith =>
      __$$SimilarItemImplCopyWithImpl<_$SimilarItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SimilarItemImplToJson(
      this,
    );
  }
}

abstract class _SimilarItem extends SimilarItem {
  const factory _SimilarItem(
      {@JsonKey(name: 'id') required final String id,
      @JsonKey(name: 'user_id') final String? userId,
      @JsonKey(name: 'country_id', fromJson: _parseNullableInt)
      final int? countryId,
      @JsonKey(name: 'brand_model_id', fromJson: _parseNullableInt)
      final int? brandModelId,
      @JsonKey(name: 'brand_id', fromJson: _parseNullableInt)
      final int? brandId,
      @JsonKey(name: 'category_id', fromJson: _parseNullableInt)
      final int? categoryId,
      @JsonKey(name: 'name') final String? name,
      @JsonKey(name: 'year') final String? year,
      @JsonKey(name: 'slug') final String? slug,
      @JsonKey(name: 'description') final String? description,
      @JsonKey(name: 'images', fromJson: _parseStringList)
      final List<String>? images,
      @JsonKey(name: 'location') final String? location,
      @JsonKey(name: 'serial_number') final String? serialNumber,
      @JsonKey(name: 'condition') final String? condition,
      @JsonKey(name: 'steer_position') final String? steerPosition,
      @JsonKey(name: 'engine_capacity') final String? engineCapacity,
      @JsonKey(name: 'transmission') final String? transmission,
      @JsonKey(name: 'color') final String? color,
      @JsonKey(name: 'build_type') final String? buildType,
      @JsonKey(name: 'number_of_passengers', fromJson: _parseNullableInt)
      final int? numberOfPassengers,
      @JsonKey(name: 'features', fromJson: _parseStringList)
      final List<String>? features,
      @JsonKey(name: 'status') final String? status,
      @JsonKey(name: 'price') final String? price,
      @JsonKey(name: 'mileage') final String? mileage,
      @JsonKey(name: 'warranty', fromJson: _parseNullableInt)
      final int? warranty,
      @JsonKey(name: 'warranty_expiration') final String? warrantyExpiration,
      @JsonKey(name: 'deleted_at') final String? deletedAt,
      @JsonKey(name: 'created_at') final String? createdAt,
      @JsonKey(name: 'updated_at') final String? updatedAt,
      @JsonKey(name: 'Height') final String? height,
      @JsonKey(name: 'VIN') final String? vin,
      @JsonKey(name: 'brand') final Brand? brand,
      @JsonKey(name: 'category') final Category? category,
      @JsonKey(name: 'brand_model') final BrandModel? brandModel,
      @JsonKey(name: 'user') final User? user}) = _$SimilarItemImpl;
  const _SimilarItem._() : super._();

  factory _SimilarItem.fromJson(Map<String, dynamic> json) =
      _$SimilarItemImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  String get id;
  @override
  @JsonKey(name: 'user_id')
  String? get userId;
  @override
  @JsonKey(name: 'country_id', fromJson: _parseNullableInt)
  int? get countryId;
  @override
  @JsonKey(name: 'brand_model_id', fromJson: _parseNullableInt)
  int? get brandModelId;
  @override
  @JsonKey(name: 'brand_id', fromJson: _parseNullableInt)
  int? get brandId;
  @override
  @JsonKey(name: 'category_id', fromJson: _parseNullableInt)
  int? get categoryId;
  @override
  @JsonKey(name: 'name')
  String? get name;
  @override
  @JsonKey(name: 'year')
  String? get year;
  @override
  @JsonKey(name: 'slug')
  String? get slug;
  @override
  @JsonKey(name: 'description')
  String? get description;
  @override
  @JsonKey(name: 'images', fromJson: _parseStringList)
  List<String>? get images;
  @override
  @JsonKey(name: 'location')
  String? get location;
  @override
  @JsonKey(name: 'serial_number')
  String? get serialNumber;
  @override
  @JsonKey(name: 'condition')
  String? get condition;
  @override
  @JsonKey(name: 'steer_position')
  String? get steerPosition;
  @override
  @JsonKey(name: 'engine_capacity')
  String? get engineCapacity;
  @override
  @JsonKey(name: 'transmission')
  String? get transmission;
  @override
  @JsonKey(name: 'color')
  String? get color;
  @override
  @JsonKey(name: 'build_type')
  String? get buildType;
  @override
  @JsonKey(name: 'number_of_passengers', fromJson: _parseNullableInt)
  int? get numberOfPassengers;
  @override
  @JsonKey(name: 'features', fromJson: _parseStringList)
  List<String>? get features;
  @override
  @JsonKey(name: 'status')
  String? get status;
  @override
  @JsonKey(name: 'price')
  String? get price;
  @override
  @JsonKey(name: 'mileage')
  String? get mileage;
  @override
  @JsonKey(name: 'warranty', fromJson: _parseNullableInt)
  int? get warranty;
  @override
  @JsonKey(name: 'warranty_expiration')
  String? get warrantyExpiration;
  @override
  @JsonKey(name: 'deleted_at')
  String? get deletedAt;
  @override
  @JsonKey(name: 'created_at')
  String? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  String? get updatedAt;
  @override
  @JsonKey(name: 'Height')
  String? get height;
  @override
  @JsonKey(name: 'VIN')
  String? get vin; // Added nested objects
  @override
  @JsonKey(name: 'brand')
  Brand? get brand;
  @override
  @JsonKey(name: 'category')
  Category? get category;
  @override
  @JsonKey(name: 'brand_model')
  BrandModel? get brandModel;
  @override
  @JsonKey(name: 'user')
  User? get user;

  /// Create a copy of SimilarItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SimilarItemImplCopyWith<_$SimilarItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Brand _$BrandFromJson(Map<String, dynamic> json) {
  return _Brand.fromJson(json);
}

/// @nodoc
mixin _$Brand {
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id', fromJson: _parseNullableInt)
  int? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'slug')
  String? get slug => throw _privateConstructorUsedError;
  @JsonKey(name: 'image')
  String? get image => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  String? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this Brand to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Brand
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BrandCopyWith<Brand> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BrandCopyWith<$Res> {
  factory $BrandCopyWith(Brand value, $Res Function(Brand) then) =
      _$BrandCopyWithImpl<$Res, Brand>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'user_id', fromJson: _parseNullableInt) int? userId,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'slug') String? slug,
      @JsonKey(name: 'image') String? image,
      @JsonKey(name: 'created_at') String? createdAt,
      @JsonKey(name: 'updated_at') String? updatedAt});
}

/// @nodoc
class _$BrandCopyWithImpl<$Res, $Val extends Brand>
    implements $BrandCopyWith<$Res> {
  _$BrandCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Brand
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = freezed,
    Object? name = freezed,
    Object? slug = freezed,
    Object? image = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      slug: freezed == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BrandImplCopyWith<$Res> implements $BrandCopyWith<$Res> {
  factory _$$BrandImplCopyWith(
          _$BrandImpl value, $Res Function(_$BrandImpl) then) =
      __$$BrandImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'user_id', fromJson: _parseNullableInt) int? userId,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'slug') String? slug,
      @JsonKey(name: 'image') String? image,
      @JsonKey(name: 'created_at') String? createdAt,
      @JsonKey(name: 'updated_at') String? updatedAt});
}

/// @nodoc
class __$$BrandImplCopyWithImpl<$Res>
    extends _$BrandCopyWithImpl<$Res, _$BrandImpl>
    implements _$$BrandImplCopyWith<$Res> {
  __$$BrandImplCopyWithImpl(
      _$BrandImpl _value, $Res Function(_$BrandImpl) _then)
      : super(_value, _then);

  /// Create a copy of Brand
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = freezed,
    Object? name = freezed,
    Object? slug = freezed,
    Object? image = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$BrandImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      slug: freezed == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BrandImpl implements _Brand {
  const _$BrandImpl(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'user_id', fromJson: _parseNullableInt) this.userId,
      @JsonKey(name: 'name') this.name,
      @JsonKey(name: 'slug') this.slug,
      @JsonKey(name: 'image') this.image,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt});

  factory _$BrandImpl.fromJson(Map<String, dynamic> json) =>
      _$$BrandImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int id;
  @override
  @JsonKey(name: 'user_id', fromJson: _parseNullableInt)
  final int? userId;
  @override
  @JsonKey(name: 'name')
  final String? name;
  @override
  @JsonKey(name: 'slug')
  final String? slug;
  @override
  @JsonKey(name: 'image')
  final String? image;
  @override
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final String? updatedAt;

  @override
  String toString() {
    return 'Brand(id: $id, userId: $userId, name: $name, slug: $slug, image: $image, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BrandImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, userId, name, slug, image, createdAt, updatedAt);

  /// Create a copy of Brand
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BrandImplCopyWith<_$BrandImpl> get copyWith =>
      __$$BrandImplCopyWithImpl<_$BrandImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BrandImplToJson(
      this,
    );
  }
}

abstract class _Brand implements Brand {
  const factory _Brand(
      {@JsonKey(name: 'id') required final int id,
      @JsonKey(name: 'user_id', fromJson: _parseNullableInt) final int? userId,
      @JsonKey(name: 'name') final String? name,
      @JsonKey(name: 'slug') final String? slug,
      @JsonKey(name: 'image') final String? image,
      @JsonKey(name: 'created_at') final String? createdAt,
      @JsonKey(name: 'updated_at') final String? updatedAt}) = _$BrandImpl;

  factory _Brand.fromJson(Map<String, dynamic> json) = _$BrandImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  @JsonKey(name: 'user_id', fromJson: _parseNullableInt)
  int? get userId;
  @override
  @JsonKey(name: 'name')
  String? get name;
  @override
  @JsonKey(name: 'slug')
  String? get slug;
  @override
  @JsonKey(name: 'image')
  String? get image;
  @override
  @JsonKey(name: 'created_at')
  String? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  String? get updatedAt;

  /// Create a copy of Brand
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BrandImplCopyWith<_$BrandImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Category _$CategoryFromJson(Map<String, dynamic> json) {
  return _Category.fromJson(json);
}

/// @nodoc
mixin _$Category {
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id', fromJson: _parseNullableInt)
  int? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'parent_id', fromJson: _parseNullableInt)
  int? get parentId => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'slug')
  String? get slug => throw _privateConstructorUsedError;
  @JsonKey(name: 'description')
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'features', fromJson: _parseStringList)
  List<String>? get features => throw _privateConstructorUsedError;
  @JsonKey(name: 'image')
  String? get image => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  String? get updatedAt => throw _privateConstructorUsedError;

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
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'user_id', fromJson: _parseNullableInt) int? userId,
      @JsonKey(name: 'parent_id', fromJson: _parseNullableInt) int? parentId,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'slug') String? slug,
      @JsonKey(name: 'description') String? description,
      @JsonKey(name: 'features', fromJson: _parseStringList)
      List<String>? features,
      @JsonKey(name: 'image') String? image,
      @JsonKey(name: 'created_at') String? createdAt,
      @JsonKey(name: 'updated_at') String? updatedAt});
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
    Object? name = freezed,
    Object? slug = freezed,
    Object? description = freezed,
    Object? features = freezed,
    Object? image = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      parentId: freezed == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      slug: freezed == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      features: freezed == features
          ? _value.features
          : features // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
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
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'user_id', fromJson: _parseNullableInt) int? userId,
      @JsonKey(name: 'parent_id', fromJson: _parseNullableInt) int? parentId,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'slug') String? slug,
      @JsonKey(name: 'description') String? description,
      @JsonKey(name: 'features', fromJson: _parseStringList)
      List<String>? features,
      @JsonKey(name: 'image') String? image,
      @JsonKey(name: 'created_at') String? createdAt,
      @JsonKey(name: 'updated_at') String? updatedAt});
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
    Object? name = freezed,
    Object? slug = freezed,
    Object? description = freezed,
    Object? features = freezed,
    Object? image = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$CategoryImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      parentId: freezed == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      slug: freezed == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      features: freezed == features
          ? _value._features
          : features // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CategoryImpl implements _Category {
  const _$CategoryImpl(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'user_id', fromJson: _parseNullableInt) this.userId,
      @JsonKey(name: 'parent_id', fromJson: _parseNullableInt) this.parentId,
      @JsonKey(name: 'name') this.name,
      @JsonKey(name: 'slug') this.slug,
      @JsonKey(name: 'description') this.description,
      @JsonKey(name: 'features', fromJson: _parseStringList)
      final List<String>? features,
      @JsonKey(name: 'image') this.image,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt})
      : _features = features;

  factory _$CategoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoryImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int id;
  @override
  @JsonKey(name: 'user_id', fromJson: _parseNullableInt)
  final int? userId;
  @override
  @JsonKey(name: 'parent_id', fromJson: _parseNullableInt)
  final int? parentId;
  @override
  @JsonKey(name: 'name')
  final String? name;
  @override
  @JsonKey(name: 'slug')
  final String? slug;
  @override
  @JsonKey(name: 'description')
  final String? description;
  final List<String>? _features;
  @override
  @JsonKey(name: 'features', fromJson: _parseStringList)
  List<String>? get features {
    final value = _features;
    if (value == null) return null;
    if (_features is EqualUnmodifiableListView) return _features;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'image')
  final String? image;
  @override
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final String? updatedAt;

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
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.parentId, parentId) ||
                other.parentId == parentId) &&
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
      userId,
      parentId,
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
      {@JsonKey(name: 'id') required final int id,
      @JsonKey(name: 'user_id', fromJson: _parseNullableInt) final int? userId,
      @JsonKey(name: 'parent_id', fromJson: _parseNullableInt)
      final int? parentId,
      @JsonKey(name: 'name') final String? name,
      @JsonKey(name: 'slug') final String? slug,
      @JsonKey(name: 'description') final String? description,
      @JsonKey(name: 'features', fromJson: _parseStringList)
      final List<String>? features,
      @JsonKey(name: 'image') final String? image,
      @JsonKey(name: 'created_at') final String? createdAt,
      @JsonKey(name: 'updated_at') final String? updatedAt}) = _$CategoryImpl;

  factory _Category.fromJson(Map<String, dynamic> json) =
      _$CategoryImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  @JsonKey(name: 'user_id', fromJson: _parseNullableInt)
  int? get userId;
  @override
  @JsonKey(name: 'parent_id', fromJson: _parseNullableInt)
  int? get parentId;
  @override
  @JsonKey(name: 'name')
  String? get name;
  @override
  @JsonKey(name: 'slug')
  String? get slug;
  @override
  @JsonKey(name: 'description')
  String? get description;
  @override
  @JsonKey(name: 'features', fromJson: _parseStringList)
  List<String>? get features;
  @override
  @JsonKey(name: 'image')
  String? get image;
  @override
  @JsonKey(name: 'created_at')
  String? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  String? get updatedAt;

  /// Create a copy of Category
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CategoryImplCopyWith<_$CategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BrandModel _$BrandModelFromJson(Map<String, dynamic> json) {
  return _BrandModel.fromJson(json);
}

/// @nodoc
mixin _$BrandModel {
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'brand_id', fromJson: _parseNullableInt)
  int? get brandId => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'slug')
  String? get slug => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  String? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this BrandModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BrandModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BrandModelCopyWith<BrandModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BrandModelCopyWith<$Res> {
  factory $BrandModelCopyWith(
          BrandModel value, $Res Function(BrandModel) then) =
      _$BrandModelCopyWithImpl<$Res, BrandModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'brand_id', fromJson: _parseNullableInt) int? brandId,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'slug') String? slug,
      @JsonKey(name: 'created_at') String? createdAt,
      @JsonKey(name: 'updated_at') String? updatedAt});
}

/// @nodoc
class _$BrandModelCopyWithImpl<$Res, $Val extends BrandModel>
    implements $BrandModelCopyWith<$Res> {
  _$BrandModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BrandModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? brandId = freezed,
    Object? name = freezed,
    Object? slug = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      brandId: freezed == brandId
          ? _value.brandId
          : brandId // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      slug: freezed == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BrandModelImplCopyWith<$Res>
    implements $BrandModelCopyWith<$Res> {
  factory _$$BrandModelImplCopyWith(
          _$BrandModelImpl value, $Res Function(_$BrandModelImpl) then) =
      __$$BrandModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'brand_id', fromJson: _parseNullableInt) int? brandId,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'slug') String? slug,
      @JsonKey(name: 'created_at') String? createdAt,
      @JsonKey(name: 'updated_at') String? updatedAt});
}

/// @nodoc
class __$$BrandModelImplCopyWithImpl<$Res>
    extends _$BrandModelCopyWithImpl<$Res, _$BrandModelImpl>
    implements _$$BrandModelImplCopyWith<$Res> {
  __$$BrandModelImplCopyWithImpl(
      _$BrandModelImpl _value, $Res Function(_$BrandModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of BrandModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? brandId = freezed,
    Object? name = freezed,
    Object? slug = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$BrandModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      brandId: freezed == brandId
          ? _value.brandId
          : brandId // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      slug: freezed == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BrandModelImpl implements _BrandModel {
  const _$BrandModelImpl(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'brand_id', fromJson: _parseNullableInt) this.brandId,
      @JsonKey(name: 'name') this.name,
      @JsonKey(name: 'slug') this.slug,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt});

  factory _$BrandModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BrandModelImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int id;
  @override
  @JsonKey(name: 'brand_id', fromJson: _parseNullableInt)
  final int? brandId;
  @override
  @JsonKey(name: 'name')
  final String? name;
  @override
  @JsonKey(name: 'slug')
  final String? slug;
  @override
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final String? updatedAt;

  @override
  String toString() {
    return 'BrandModel(id: $id, brandId: $brandId, name: $name, slug: $slug, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BrandModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.brandId, brandId) || other.brandId == brandId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, brandId, name, slug, createdAt, updatedAt);

  /// Create a copy of BrandModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BrandModelImplCopyWith<_$BrandModelImpl> get copyWith =>
      __$$BrandModelImplCopyWithImpl<_$BrandModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BrandModelImplToJson(
      this,
    );
  }
}

abstract class _BrandModel implements BrandModel {
  const factory _BrandModel(
      {@JsonKey(name: 'id') required final int id,
      @JsonKey(name: 'brand_id', fromJson: _parseNullableInt)
      final int? brandId,
      @JsonKey(name: 'name') final String? name,
      @JsonKey(name: 'slug') final String? slug,
      @JsonKey(name: 'created_at') final String? createdAt,
      @JsonKey(name: 'updated_at') final String? updatedAt}) = _$BrandModelImpl;

  factory _BrandModel.fromJson(Map<String, dynamic> json) =
      _$BrandModelImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  @JsonKey(name: 'brand_id', fromJson: _parseNullableInt)
  int? get brandId;
  @override
  @JsonKey(name: 'name')
  String? get name;
  @override
  @JsonKey(name: 'slug')
  String? get slug;
  @override
  @JsonKey(name: 'created_at')
  String? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  String? get updatedAt;

  /// Create a copy of BrandModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BrandModelImplCopyWith<_$BrandModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  @JsonKey(name: 'id')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'email')
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'phone')
  String? get phone => throw _privateConstructorUsedError;
  @JsonKey(name: 'email_verified_at')
  String? get emailVerifiedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'paid_seller', fromJson: _parseNullableInt)
  int? get paidSeller => throw _privateConstructorUsedError;
  @JsonKey(name: 'deleted_at')
  String? get deletedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  String? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'country_id', fromJson: _parseNullableInt)
  int? get countryId => throw _privateConstructorUsedError;
  @JsonKey(name: 'state_id', fromJson: _parseNullableInt)
  int? get stateId => throw _privateConstructorUsedError;
  @JsonKey(name: 'profile_photo')
  String? get profilePhoto => throw _privateConstructorUsedError;
  @JsonKey(name: 'uploads_left', fromJson: _parseNullableInt)
  int? get uploadsLeft => throw _privateConstructorUsedError;
  @JsonKey(name: 'active_status', fromJson: _parseNullableInt)
  int? get activeStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'avatar')
  String? get avatar => throw _privateConstructorUsedError;
  @JsonKey(name: 'dark_mode', fromJson: _parseNullableInt)
  int? get darkMode => throw _privateConstructorUsedError;
  @JsonKey(name: 'messenger_color')
  String? get messengerColor => throw _privateConstructorUsedError;

  /// Serializes this User to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String id,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'email') String? email,
      @JsonKey(name: 'phone') String? phone,
      @JsonKey(name: 'email_verified_at') String? emailVerifiedAt,
      @JsonKey(name: 'paid_seller', fromJson: _parseNullableInt)
      int? paidSeller,
      @JsonKey(name: 'deleted_at') String? deletedAt,
      @JsonKey(name: 'created_at') String? createdAt,
      @JsonKey(name: 'updated_at') String? updatedAt,
      @JsonKey(name: 'country_id', fromJson: _parseNullableInt) int? countryId,
      @JsonKey(name: 'state_id', fromJson: _parseNullableInt) int? stateId,
      @JsonKey(name: 'profile_photo') String? profilePhoto,
      @JsonKey(name: 'uploads_left', fromJson: _parseNullableInt)
      int? uploadsLeft,
      @JsonKey(name: 'active_status', fromJson: _parseNullableInt)
      int? activeStatus,
      @JsonKey(name: 'avatar') String? avatar,
      @JsonKey(name: 'dark_mode', fromJson: _parseNullableInt) int? darkMode,
      @JsonKey(name: 'messenger_color') String? messengerColor});
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? email = freezed,
    Object? phone = freezed,
    Object? emailVerifiedAt = freezed,
    Object? paidSeller = freezed,
    Object? deletedAt = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? countryId = freezed,
    Object? stateId = freezed,
    Object? profilePhoto = freezed,
    Object? uploadsLeft = freezed,
    Object? activeStatus = freezed,
    Object? avatar = freezed,
    Object? darkMode = freezed,
    Object? messengerColor = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      emailVerifiedAt: freezed == emailVerifiedAt
          ? _value.emailVerifiedAt
          : emailVerifiedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      paidSeller: freezed == paidSeller
          ? _value.paidSeller
          : paidSeller // ignore: cast_nullable_to_non_nullable
              as int?,
      deletedAt: freezed == deletedAt
          ? _value.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      countryId: freezed == countryId
          ? _value.countryId
          : countryId // ignore: cast_nullable_to_non_nullable
              as int?,
      stateId: freezed == stateId
          ? _value.stateId
          : stateId // ignore: cast_nullable_to_non_nullable
              as int?,
      profilePhoto: freezed == profilePhoto
          ? _value.profilePhoto
          : profilePhoto // ignore: cast_nullable_to_non_nullable
              as String?,
      uploadsLeft: freezed == uploadsLeft
          ? _value.uploadsLeft
          : uploadsLeft // ignore: cast_nullable_to_non_nullable
              as int?,
      activeStatus: freezed == activeStatus
          ? _value.activeStatus
          : activeStatus // ignore: cast_nullable_to_non_nullable
              as int?,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      darkMode: freezed == darkMode
          ? _value.darkMode
          : darkMode // ignore: cast_nullable_to_non_nullable
              as int?,
      messengerColor: freezed == messengerColor
          ? _value.messengerColor
          : messengerColor // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserImplCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$UserImplCopyWith(
          _$UserImpl value, $Res Function(_$UserImpl) then) =
      __$$UserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String id,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'email') String? email,
      @JsonKey(name: 'phone') String? phone,
      @JsonKey(name: 'email_verified_at') String? emailVerifiedAt,
      @JsonKey(name: 'paid_seller', fromJson: _parseNullableInt)
      int? paidSeller,
      @JsonKey(name: 'deleted_at') String? deletedAt,
      @JsonKey(name: 'created_at') String? createdAt,
      @JsonKey(name: 'updated_at') String? updatedAt,
      @JsonKey(name: 'country_id', fromJson: _parseNullableInt) int? countryId,
      @JsonKey(name: 'state_id', fromJson: _parseNullableInt) int? stateId,
      @JsonKey(name: 'profile_photo') String? profilePhoto,
      @JsonKey(name: 'uploads_left', fromJson: _parseNullableInt)
      int? uploadsLeft,
      @JsonKey(name: 'active_status', fromJson: _parseNullableInt)
      int? activeStatus,
      @JsonKey(name: 'avatar') String? avatar,
      @JsonKey(name: 'dark_mode', fromJson: _parseNullableInt) int? darkMode,
      @JsonKey(name: 'messenger_color') String? messengerColor});
}

/// @nodoc
class __$$UserImplCopyWithImpl<$Res>
    extends _$UserCopyWithImpl<$Res, _$UserImpl>
    implements _$$UserImplCopyWith<$Res> {
  __$$UserImplCopyWithImpl(_$UserImpl _value, $Res Function(_$UserImpl) _then)
      : super(_value, _then);

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? email = freezed,
    Object? phone = freezed,
    Object? emailVerifiedAt = freezed,
    Object? paidSeller = freezed,
    Object? deletedAt = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? countryId = freezed,
    Object? stateId = freezed,
    Object? profilePhoto = freezed,
    Object? uploadsLeft = freezed,
    Object? activeStatus = freezed,
    Object? avatar = freezed,
    Object? darkMode = freezed,
    Object? messengerColor = freezed,
  }) {
    return _then(_$UserImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      emailVerifiedAt: freezed == emailVerifiedAt
          ? _value.emailVerifiedAt
          : emailVerifiedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      paidSeller: freezed == paidSeller
          ? _value.paidSeller
          : paidSeller // ignore: cast_nullable_to_non_nullable
              as int?,
      deletedAt: freezed == deletedAt
          ? _value.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      countryId: freezed == countryId
          ? _value.countryId
          : countryId // ignore: cast_nullable_to_non_nullable
              as int?,
      stateId: freezed == stateId
          ? _value.stateId
          : stateId // ignore: cast_nullable_to_non_nullable
              as int?,
      profilePhoto: freezed == profilePhoto
          ? _value.profilePhoto
          : profilePhoto // ignore: cast_nullable_to_non_nullable
              as String?,
      uploadsLeft: freezed == uploadsLeft
          ? _value.uploadsLeft
          : uploadsLeft // ignore: cast_nullable_to_non_nullable
              as int?,
      activeStatus: freezed == activeStatus
          ? _value.activeStatus
          : activeStatus // ignore: cast_nullable_to_non_nullable
              as int?,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      darkMode: freezed == darkMode
          ? _value.darkMode
          : darkMode // ignore: cast_nullable_to_non_nullable
              as int?,
      messengerColor: freezed == messengerColor
          ? _value.messengerColor
          : messengerColor // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserImpl implements _User {
  const _$UserImpl(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'name') this.name,
      @JsonKey(name: 'email') this.email,
      @JsonKey(name: 'phone') this.phone,
      @JsonKey(name: 'email_verified_at') this.emailVerifiedAt,
      @JsonKey(name: 'paid_seller', fromJson: _parseNullableInt)
      this.paidSeller,
      @JsonKey(name: 'deleted_at') this.deletedAt,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt,
      @JsonKey(name: 'country_id', fromJson: _parseNullableInt) this.countryId,
      @JsonKey(name: 'state_id', fromJson: _parseNullableInt) this.stateId,
      @JsonKey(name: 'profile_photo') this.profilePhoto,
      @JsonKey(name: 'uploads_left', fromJson: _parseNullableInt)
      this.uploadsLeft,
      @JsonKey(name: 'active_status', fromJson: _parseNullableInt)
      this.activeStatus,
      @JsonKey(name: 'avatar') this.avatar,
      @JsonKey(name: 'dark_mode', fromJson: _parseNullableInt) this.darkMode,
      @JsonKey(name: 'messenger_color') this.messengerColor});

  factory _$UserImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final String id;
  @override
  @JsonKey(name: 'name')
  final String? name;
  @override
  @JsonKey(name: 'email')
  final String? email;
  @override
  @JsonKey(name: 'phone')
  final String? phone;
  @override
  @JsonKey(name: 'email_verified_at')
  final String? emailVerifiedAt;
  @override
  @JsonKey(name: 'paid_seller', fromJson: _parseNullableInt)
  final int? paidSeller;
  @override
  @JsonKey(name: 'deleted_at')
  final String? deletedAt;
  @override
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final String? updatedAt;
  @override
  @JsonKey(name: 'country_id', fromJson: _parseNullableInt)
  final int? countryId;
  @override
  @JsonKey(name: 'state_id', fromJson: _parseNullableInt)
  final int? stateId;
  @override
  @JsonKey(name: 'profile_photo')
  final String? profilePhoto;
  @override
  @JsonKey(name: 'uploads_left', fromJson: _parseNullableInt)
  final int? uploadsLeft;
  @override
  @JsonKey(name: 'active_status', fromJson: _parseNullableInt)
  final int? activeStatus;
  @override
  @JsonKey(name: 'avatar')
  final String? avatar;
  @override
  @JsonKey(name: 'dark_mode', fromJson: _parseNullableInt)
  final int? darkMode;
  @override
  @JsonKey(name: 'messenger_color')
  final String? messengerColor;

  @override
  String toString() {
    return 'User(id: $id, name: $name, email: $email, phone: $phone, emailVerifiedAt: $emailVerifiedAt, paidSeller: $paidSeller, deletedAt: $deletedAt, createdAt: $createdAt, updatedAt: $updatedAt, countryId: $countryId, stateId: $stateId, profilePhoto: $profilePhoto, uploadsLeft: $uploadsLeft, activeStatus: $activeStatus, avatar: $avatar, darkMode: $darkMode, messengerColor: $messengerColor)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.emailVerifiedAt, emailVerifiedAt) ||
                other.emailVerifiedAt == emailVerifiedAt) &&
            (identical(other.paidSeller, paidSeller) ||
                other.paidSeller == paidSeller) &&
            (identical(other.deletedAt, deletedAt) ||
                other.deletedAt == deletedAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.countryId, countryId) ||
                other.countryId == countryId) &&
            (identical(other.stateId, stateId) || other.stateId == stateId) &&
            (identical(other.profilePhoto, profilePhoto) ||
                other.profilePhoto == profilePhoto) &&
            (identical(other.uploadsLeft, uploadsLeft) ||
                other.uploadsLeft == uploadsLeft) &&
            (identical(other.activeStatus, activeStatus) ||
                other.activeStatus == activeStatus) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            (identical(other.darkMode, darkMode) ||
                other.darkMode == darkMode) &&
            (identical(other.messengerColor, messengerColor) ||
                other.messengerColor == messengerColor));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      email,
      phone,
      emailVerifiedAt,
      paidSeller,
      deletedAt,
      createdAt,
      updatedAt,
      countryId,
      stateId,
      profilePhoto,
      uploadsLeft,
      activeStatus,
      avatar,
      darkMode,
      messengerColor);

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      __$$UserImplCopyWithImpl<_$UserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserImplToJson(
      this,
    );
  }
}

abstract class _User implements User {
  const factory _User(
          {@JsonKey(name: 'id') required final String id,
          @JsonKey(name: 'name') final String? name,
          @JsonKey(name: 'email') final String? email,
          @JsonKey(name: 'phone') final String? phone,
          @JsonKey(name: 'email_verified_at') final String? emailVerifiedAt,
          @JsonKey(name: 'paid_seller', fromJson: _parseNullableInt)
          final int? paidSeller,
          @JsonKey(name: 'deleted_at') final String? deletedAt,
          @JsonKey(name: 'created_at') final String? createdAt,
          @JsonKey(name: 'updated_at') final String? updatedAt,
          @JsonKey(name: 'country_id', fromJson: _parseNullableInt)
          final int? countryId,
          @JsonKey(name: 'state_id', fromJson: _parseNullableInt)
          final int? stateId,
          @JsonKey(name: 'profile_photo') final String? profilePhoto,
          @JsonKey(name: 'uploads_left', fromJson: _parseNullableInt)
          final int? uploadsLeft,
          @JsonKey(name: 'active_status', fromJson: _parseNullableInt)
          final int? activeStatus,
          @JsonKey(name: 'avatar') final String? avatar,
          @JsonKey(name: 'dark_mode', fromJson: _parseNullableInt)
          final int? darkMode,
          @JsonKey(name: 'messenger_color') final String? messengerColor}) =
      _$UserImpl;

  factory _User.fromJson(Map<String, dynamic> json) = _$UserImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  String get id;
  @override
  @JsonKey(name: 'name')
  String? get name;
  @override
  @JsonKey(name: 'email')
  String? get email;
  @override
  @JsonKey(name: 'phone')
  String? get phone;
  @override
  @JsonKey(name: 'email_verified_at')
  String? get emailVerifiedAt;
  @override
  @JsonKey(name: 'paid_seller', fromJson: _parseNullableInt)
  int? get paidSeller;
  @override
  @JsonKey(name: 'deleted_at')
  String? get deletedAt;
  @override
  @JsonKey(name: 'created_at')
  String? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  String? get updatedAt;
  @override
  @JsonKey(name: 'country_id', fromJson: _parseNullableInt)
  int? get countryId;
  @override
  @JsonKey(name: 'state_id', fromJson: _parseNullableInt)
  int? get stateId;
  @override
  @JsonKey(name: 'profile_photo')
  String? get profilePhoto;
  @override
  @JsonKey(name: 'uploads_left', fromJson: _parseNullableInt)
  int? get uploadsLeft;
  @override
  @JsonKey(name: 'active_status', fromJson: _parseNullableInt)
  int? get activeStatus;
  @override
  @JsonKey(name: 'avatar')
  String? get avatar;
  @override
  @JsonKey(name: 'dark_mode', fromJson: _parseNullableInt)
  int? get darkMode;
  @override
  @JsonKey(name: 'messenger_color')
  String? get messengerColor;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PaginationLinks _$PaginationLinksFromJson(Map<String, dynamic> json) {
  return _PaginationLinks.fromJson(json);
}

/// @nodoc
mixin _$PaginationLinks {
  @JsonKey(name: 'first')
  String? get first => throw _privateConstructorUsedError;
  @JsonKey(name: 'last')
  String? get last => throw _privateConstructorUsedError;
  @JsonKey(name: 'prev')
  String? get prev => throw _privateConstructorUsedError;
  @JsonKey(name: 'next')
  String? get next => throw _privateConstructorUsedError;

  /// Serializes this PaginationLinks to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaginationLinks
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaginationLinksCopyWith<PaginationLinks> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginationLinksCopyWith<$Res> {
  factory $PaginationLinksCopyWith(
          PaginationLinks value, $Res Function(PaginationLinks) then) =
      _$PaginationLinksCopyWithImpl<$Res, PaginationLinks>;
  @useResult
  $Res call(
      {@JsonKey(name: 'first') String? first,
      @JsonKey(name: 'last') String? last,
      @JsonKey(name: 'prev') String? prev,
      @JsonKey(name: 'next') String? next});
}

/// @nodoc
class _$PaginationLinksCopyWithImpl<$Res, $Val extends PaginationLinks>
    implements $PaginationLinksCopyWith<$Res> {
  _$PaginationLinksCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaginationLinks
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? first = freezed,
    Object? last = freezed,
    Object? prev = freezed,
    Object? next = freezed,
  }) {
    return _then(_value.copyWith(
      first: freezed == first
          ? _value.first
          : first // ignore: cast_nullable_to_non_nullable
              as String?,
      last: freezed == last
          ? _value.last
          : last // ignore: cast_nullable_to_non_nullable
              as String?,
      prev: freezed == prev
          ? _value.prev
          : prev // ignore: cast_nullable_to_non_nullable
              as String?,
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaginationLinksImplCopyWith<$Res>
    implements $PaginationLinksCopyWith<$Res> {
  factory _$$PaginationLinksImplCopyWith(_$PaginationLinksImpl value,
          $Res Function(_$PaginationLinksImpl) then) =
      __$$PaginationLinksImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'first') String? first,
      @JsonKey(name: 'last') String? last,
      @JsonKey(name: 'prev') String? prev,
      @JsonKey(name: 'next') String? next});
}

/// @nodoc
class __$$PaginationLinksImplCopyWithImpl<$Res>
    extends _$PaginationLinksCopyWithImpl<$Res, _$PaginationLinksImpl>
    implements _$$PaginationLinksImplCopyWith<$Res> {
  __$$PaginationLinksImplCopyWithImpl(
      _$PaginationLinksImpl _value, $Res Function(_$PaginationLinksImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaginationLinks
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? first = freezed,
    Object? last = freezed,
    Object? prev = freezed,
    Object? next = freezed,
  }) {
    return _then(_$PaginationLinksImpl(
      first: freezed == first
          ? _value.first
          : first // ignore: cast_nullable_to_non_nullable
              as String?,
      last: freezed == last
          ? _value.last
          : last // ignore: cast_nullable_to_non_nullable
              as String?,
      prev: freezed == prev
          ? _value.prev
          : prev // ignore: cast_nullable_to_non_nullable
              as String?,
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaginationLinksImpl implements _PaginationLinks {
  const _$PaginationLinksImpl(
      {@JsonKey(name: 'first') this.first,
      @JsonKey(name: 'last') this.last,
      @JsonKey(name: 'prev') this.prev,
      @JsonKey(name: 'next') this.next});

  factory _$PaginationLinksImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaginationLinksImplFromJson(json);

  @override
  @JsonKey(name: 'first')
  final String? first;
  @override
  @JsonKey(name: 'last')
  final String? last;
  @override
  @JsonKey(name: 'prev')
  final String? prev;
  @override
  @JsonKey(name: 'next')
  final String? next;

  @override
  String toString() {
    return 'PaginationLinks(first: $first, last: $last, prev: $prev, next: $next)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaginationLinksImpl &&
            (identical(other.first, first) || other.first == first) &&
            (identical(other.last, last) || other.last == last) &&
            (identical(other.prev, prev) || other.prev == prev) &&
            (identical(other.next, next) || other.next == next));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, first, last, prev, next);

  /// Create a copy of PaginationLinks
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaginationLinksImplCopyWith<_$PaginationLinksImpl> get copyWith =>
      __$$PaginationLinksImplCopyWithImpl<_$PaginationLinksImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaginationLinksImplToJson(
      this,
    );
  }
}

abstract class _PaginationLinks implements PaginationLinks {
  const factory _PaginationLinks(
      {@JsonKey(name: 'first') final String? first,
      @JsonKey(name: 'last') final String? last,
      @JsonKey(name: 'prev') final String? prev,
      @JsonKey(name: 'next') final String? next}) = _$PaginationLinksImpl;

  factory _PaginationLinks.fromJson(Map<String, dynamic> json) =
      _$PaginationLinksImpl.fromJson;

  @override
  @JsonKey(name: 'first')
  String? get first;
  @override
  @JsonKey(name: 'last')
  String? get last;
  @override
  @JsonKey(name: 'prev')
  String? get prev;
  @override
  @JsonKey(name: 'next')
  String? get next;

  /// Create a copy of PaginationLinks
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaginationLinksImplCopyWith<_$PaginationLinksImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PaginationMeta _$PaginationMetaFromJson(Map<String, dynamic> json) {
  return _PaginationMeta.fromJson(json);
}

/// @nodoc
mixin _$PaginationMeta {
  @JsonKey(name: 'current_page', fromJson: _parseNullableInt)
  int? get currentPage => throw _privateConstructorUsedError;
  @JsonKey(name: 'from', fromJson: _parseNullableInt)
  int? get from => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_page', fromJson: _parseNullableInt)
  int? get lastPage => throw _privateConstructorUsedError;
  @JsonKey(name: 'links')
  List<PaginationLink>? get links => throw _privateConstructorUsedError;
  @JsonKey(name: 'path')
  String? get path => throw _privateConstructorUsedError;
  @JsonKey(name: 'per_page', fromJson: _parseNullableInt)
  int? get perPage => throw _privateConstructorUsedError;
  @JsonKey(name: 'to', fromJson: _parseNullableInt)
  int? get to => throw _privateConstructorUsedError;
  @JsonKey(name: 'total', fromJson: _parseNullableInt)
  int? get total => throw _privateConstructorUsedError;

  /// Serializes this PaginationMeta to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaginationMeta
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaginationMetaCopyWith<PaginationMeta> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginationMetaCopyWith<$Res> {
  factory $PaginationMetaCopyWith(
          PaginationMeta value, $Res Function(PaginationMeta) then) =
      _$PaginationMetaCopyWithImpl<$Res, PaginationMeta>;
  @useResult
  $Res call(
      {@JsonKey(name: 'current_page', fromJson: _parseNullableInt)
      int? currentPage,
      @JsonKey(name: 'from', fromJson: _parseNullableInt) int? from,
      @JsonKey(name: 'last_page', fromJson: _parseNullableInt) int? lastPage,
      @JsonKey(name: 'links') List<PaginationLink>? links,
      @JsonKey(name: 'path') String? path,
      @JsonKey(name: 'per_page', fromJson: _parseNullableInt) int? perPage,
      @JsonKey(name: 'to', fromJson: _parseNullableInt) int? to,
      @JsonKey(name: 'total', fromJson: _parseNullableInt) int? total});
}

/// @nodoc
class _$PaginationMetaCopyWithImpl<$Res, $Val extends PaginationMeta>
    implements $PaginationMetaCopyWith<$Res> {
  _$PaginationMetaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaginationMeta
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPage = freezed,
    Object? from = freezed,
    Object? lastPage = freezed,
    Object? links = freezed,
    Object? path = freezed,
    Object? perPage = freezed,
    Object? to = freezed,
    Object? total = freezed,
  }) {
    return _then(_value.copyWith(
      currentPage: freezed == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int?,
      from: freezed == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as int?,
      lastPage: freezed == lastPage
          ? _value.lastPage
          : lastPage // ignore: cast_nullable_to_non_nullable
              as int?,
      links: freezed == links
          ? _value.links
          : links // ignore: cast_nullable_to_non_nullable
              as List<PaginationLink>?,
      path: freezed == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String?,
      perPage: freezed == perPage
          ? _value.perPage
          : perPage // ignore: cast_nullable_to_non_nullable
              as int?,
      to: freezed == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as int?,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaginationMetaImplCopyWith<$Res>
    implements $PaginationMetaCopyWith<$Res> {
  factory _$$PaginationMetaImplCopyWith(_$PaginationMetaImpl value,
          $Res Function(_$PaginationMetaImpl) then) =
      __$$PaginationMetaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'current_page', fromJson: _parseNullableInt)
      int? currentPage,
      @JsonKey(name: 'from', fromJson: _parseNullableInt) int? from,
      @JsonKey(name: 'last_page', fromJson: _parseNullableInt) int? lastPage,
      @JsonKey(name: 'links') List<PaginationLink>? links,
      @JsonKey(name: 'path') String? path,
      @JsonKey(name: 'per_page', fromJson: _parseNullableInt) int? perPage,
      @JsonKey(name: 'to', fromJson: _parseNullableInt) int? to,
      @JsonKey(name: 'total', fromJson: _parseNullableInt) int? total});
}

/// @nodoc
class __$$PaginationMetaImplCopyWithImpl<$Res>
    extends _$PaginationMetaCopyWithImpl<$Res, _$PaginationMetaImpl>
    implements _$$PaginationMetaImplCopyWith<$Res> {
  __$$PaginationMetaImplCopyWithImpl(
      _$PaginationMetaImpl _value, $Res Function(_$PaginationMetaImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaginationMeta
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPage = freezed,
    Object? from = freezed,
    Object? lastPage = freezed,
    Object? links = freezed,
    Object? path = freezed,
    Object? perPage = freezed,
    Object? to = freezed,
    Object? total = freezed,
  }) {
    return _then(_$PaginationMetaImpl(
      currentPage: freezed == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int?,
      from: freezed == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as int?,
      lastPage: freezed == lastPage
          ? _value.lastPage
          : lastPage // ignore: cast_nullable_to_non_nullable
              as int?,
      links: freezed == links
          ? _value._links
          : links // ignore: cast_nullable_to_non_nullable
              as List<PaginationLink>?,
      path: freezed == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String?,
      perPage: freezed == perPage
          ? _value.perPage
          : perPage // ignore: cast_nullable_to_non_nullable
              as int?,
      to: freezed == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as int?,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaginationMetaImpl implements _PaginationMeta {
  const _$PaginationMetaImpl(
      {@JsonKey(name: 'current_page', fromJson: _parseNullableInt)
      this.currentPage,
      @JsonKey(name: 'from', fromJson: _parseNullableInt) this.from,
      @JsonKey(name: 'last_page', fromJson: _parseNullableInt) this.lastPage,
      @JsonKey(name: 'links') final List<PaginationLink>? links,
      @JsonKey(name: 'path') this.path,
      @JsonKey(name: 'per_page', fromJson: _parseNullableInt) this.perPage,
      @JsonKey(name: 'to', fromJson: _parseNullableInt) this.to,
      @JsonKey(name: 'total', fromJson: _parseNullableInt) this.total})
      : _links = links;

  factory _$PaginationMetaImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaginationMetaImplFromJson(json);

  @override
  @JsonKey(name: 'current_page', fromJson: _parseNullableInt)
  final int? currentPage;
  @override
  @JsonKey(name: 'from', fromJson: _parseNullableInt)
  final int? from;
  @override
  @JsonKey(name: 'last_page', fromJson: _parseNullableInt)
  final int? lastPage;
  final List<PaginationLink>? _links;
  @override
  @JsonKey(name: 'links')
  List<PaginationLink>? get links {
    final value = _links;
    if (value == null) return null;
    if (_links is EqualUnmodifiableListView) return _links;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'path')
  final String? path;
  @override
  @JsonKey(name: 'per_page', fromJson: _parseNullableInt)
  final int? perPage;
  @override
  @JsonKey(name: 'to', fromJson: _parseNullableInt)
  final int? to;
  @override
  @JsonKey(name: 'total', fromJson: _parseNullableInt)
  final int? total;

  @override
  String toString() {
    return 'PaginationMeta(currentPage: $currentPage, from: $from, lastPage: $lastPage, links: $links, path: $path, perPage: $perPage, to: $to, total: $total)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaginationMetaImpl &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.from, from) || other.from == from) &&
            (identical(other.lastPage, lastPage) ||
                other.lastPage == lastPage) &&
            const DeepCollectionEquality().equals(other._links, _links) &&
            (identical(other.path, path) || other.path == path) &&
            (identical(other.perPage, perPage) || other.perPage == perPage) &&
            (identical(other.to, to) || other.to == to) &&
            (identical(other.total, total) || other.total == total));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, currentPage, from, lastPage,
      const DeepCollectionEquality().hash(_links), path, perPage, to, total);

  /// Create a copy of PaginationMeta
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaginationMetaImplCopyWith<_$PaginationMetaImpl> get copyWith =>
      __$$PaginationMetaImplCopyWithImpl<_$PaginationMetaImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaginationMetaImplToJson(
      this,
    );
  }
}

abstract class _PaginationMeta implements PaginationMeta {
  const factory _PaginationMeta(
      {@JsonKey(name: 'current_page', fromJson: _parseNullableInt)
      final int? currentPage,
      @JsonKey(name: 'from', fromJson: _parseNullableInt) final int? from,
      @JsonKey(name: 'last_page', fromJson: _parseNullableInt)
      final int? lastPage,
      @JsonKey(name: 'links') final List<PaginationLink>? links,
      @JsonKey(name: 'path') final String? path,
      @JsonKey(name: 'per_page', fromJson: _parseNullableInt)
      final int? perPage,
      @JsonKey(name: 'to', fromJson: _parseNullableInt) final int? to,
      @JsonKey(name: 'total', fromJson: _parseNullableInt)
      final int? total}) = _$PaginationMetaImpl;

  factory _PaginationMeta.fromJson(Map<String, dynamic> json) =
      _$PaginationMetaImpl.fromJson;

  @override
  @JsonKey(name: 'current_page', fromJson: _parseNullableInt)
  int? get currentPage;
  @override
  @JsonKey(name: 'from', fromJson: _parseNullableInt)
  int? get from;
  @override
  @JsonKey(name: 'last_page', fromJson: _parseNullableInt)
  int? get lastPage;
  @override
  @JsonKey(name: 'links')
  List<PaginationLink>? get links;
  @override
  @JsonKey(name: 'path')
  String? get path;
  @override
  @JsonKey(name: 'per_page', fromJson: _parseNullableInt)
  int? get perPage;
  @override
  @JsonKey(name: 'to', fromJson: _parseNullableInt)
  int? get to;
  @override
  @JsonKey(name: 'total', fromJson: _parseNullableInt)
  int? get total;

  /// Create a copy of PaginationMeta
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaginationMetaImplCopyWith<_$PaginationMetaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PaginationLink _$PaginationLinkFromJson(Map<String, dynamic> json) {
  return _PaginationLink.fromJson(json);
}

/// @nodoc
mixin _$PaginationLink {
  @JsonKey(name: 'url')
  String? get url => throw _privateConstructorUsedError;
  @JsonKey(name: 'label')
  String? get label => throw _privateConstructorUsedError;
  @JsonKey(name: 'active')
  bool? get active => throw _privateConstructorUsedError;

  /// Serializes this PaginationLink to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaginationLink
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaginationLinkCopyWith<PaginationLink> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginationLinkCopyWith<$Res> {
  factory $PaginationLinkCopyWith(
          PaginationLink value, $Res Function(PaginationLink) then) =
      _$PaginationLinkCopyWithImpl<$Res, PaginationLink>;
  @useResult
  $Res call(
      {@JsonKey(name: 'url') String? url,
      @JsonKey(name: 'label') String? label,
      @JsonKey(name: 'active') bool? active});
}

/// @nodoc
class _$PaginationLinkCopyWithImpl<$Res, $Val extends PaginationLink>
    implements $PaginationLinkCopyWith<$Res> {
  _$PaginationLinkCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaginationLink
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = freezed,
    Object? label = freezed,
    Object? active = freezed,
  }) {
    return _then(_value.copyWith(
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      label: freezed == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String?,
      active: freezed == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaginationLinkImplCopyWith<$Res>
    implements $PaginationLinkCopyWith<$Res> {
  factory _$$PaginationLinkImplCopyWith(_$PaginationLinkImpl value,
          $Res Function(_$PaginationLinkImpl) then) =
      __$$PaginationLinkImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'url') String? url,
      @JsonKey(name: 'label') String? label,
      @JsonKey(name: 'active') bool? active});
}

/// @nodoc
class __$$PaginationLinkImplCopyWithImpl<$Res>
    extends _$PaginationLinkCopyWithImpl<$Res, _$PaginationLinkImpl>
    implements _$$PaginationLinkImplCopyWith<$Res> {
  __$$PaginationLinkImplCopyWithImpl(
      _$PaginationLinkImpl _value, $Res Function(_$PaginationLinkImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaginationLink
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = freezed,
    Object? label = freezed,
    Object? active = freezed,
  }) {
    return _then(_$PaginationLinkImpl(
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      label: freezed == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String?,
      active: freezed == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaginationLinkImpl implements _PaginationLink {
  const _$PaginationLinkImpl(
      {@JsonKey(name: 'url') this.url,
      @JsonKey(name: 'label') this.label,
      @JsonKey(name: 'active') this.active});

  factory _$PaginationLinkImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaginationLinkImplFromJson(json);

  @override
  @JsonKey(name: 'url')
  final String? url;
  @override
  @JsonKey(name: 'label')
  final String? label;
  @override
  @JsonKey(name: 'active')
  final bool? active;

  @override
  String toString() {
    return 'PaginationLink(url: $url, label: $label, active: $active)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaginationLinkImpl &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.active, active) || other.active == active));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, url, label, active);

  /// Create a copy of PaginationLink
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaginationLinkImplCopyWith<_$PaginationLinkImpl> get copyWith =>
      __$$PaginationLinkImplCopyWithImpl<_$PaginationLinkImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaginationLinkImplToJson(
      this,
    );
  }
}

abstract class _PaginationLink implements PaginationLink {
  const factory _PaginationLink(
      {@JsonKey(name: 'url') final String? url,
      @JsonKey(name: 'label') final String? label,
      @JsonKey(name: 'active') final bool? active}) = _$PaginationLinkImpl;

  factory _PaginationLink.fromJson(Map<String, dynamic> json) =
      _$PaginationLinkImpl.fromJson;

  @override
  @JsonKey(name: 'url')
  String? get url;
  @override
  @JsonKey(name: 'label')
  String? get label;
  @override
  @JsonKey(name: 'active')
  bool? get active;

  /// Create a copy of PaginationLink
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaginationLinkImplCopyWith<_$PaginationLinkImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
