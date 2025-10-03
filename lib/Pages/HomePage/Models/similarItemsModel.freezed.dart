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
  PaginationLinks get links => throw _privateConstructorUsedError;
  @JsonKey(name: 'meta')
  PaginationMeta get meta => throw _privateConstructorUsedError;

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
      @JsonKey(name: 'links') PaginationLinks links,
      @JsonKey(name: 'meta') PaginationMeta meta});

  $PaginationLinksCopyWith<$Res> get links;
  $PaginationMetaCopyWith<$Res> get meta;
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
    Object? links = null,
    Object? meta = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<SimilarItem>,
      links: null == links
          ? _value.links
          : links // ignore: cast_nullable_to_non_nullable
              as PaginationLinks,
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as PaginationMeta,
    ) as $Val);
  }

  /// Create a copy of SimilarItemsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PaginationLinksCopyWith<$Res> get links {
    return $PaginationLinksCopyWith<$Res>(_value.links, (value) {
      return _then(_value.copyWith(links: value) as $Val);
    });
  }

  /// Create a copy of SimilarItemsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PaginationMetaCopyWith<$Res> get meta {
    return $PaginationMetaCopyWith<$Res>(_value.meta, (value) {
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
      @JsonKey(name: 'links') PaginationLinks links,
      @JsonKey(name: 'meta') PaginationMeta meta});

  @override
  $PaginationLinksCopyWith<$Res> get links;
  @override
  $PaginationMetaCopyWith<$Res> get meta;
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
    Object? links = null,
    Object? meta = null,
  }) {
    return _then(_$SimilarItemsResponseImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<SimilarItem>,
      links: null == links
          ? _value.links
          : links // ignore: cast_nullable_to_non_nullable
              as PaginationLinks,
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as PaginationMeta,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SimilarItemsResponseImpl implements _SimilarItemsResponse {
  const _$SimilarItemsResponseImpl(
      {@JsonKey(name: 'data') required final List<SimilarItem> data,
      @JsonKey(name: 'links') required this.links,
      @JsonKey(name: 'meta') required this.meta})
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
  final PaginationLinks links;
  @override
  @JsonKey(name: 'meta')
  final PaginationMeta meta;

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
          @JsonKey(name: 'links') required final PaginationLinks links,
          @JsonKey(name: 'meta') required final PaginationMeta meta}) =
      _$SimilarItemsResponseImpl;

  factory _SimilarItemsResponse.fromJson(Map<String, dynamic> json) =
      _$SimilarItemsResponseImpl.fromJson;

  @override
  @JsonKey(name: 'data')
  List<SimilarItem> get data;
  @override
  @JsonKey(name: 'links')
  PaginationLinks get links;
  @override
  @JsonKey(name: 'meta')
  PaginationMeta get meta;

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
  @JsonKey(name: 'country_id', fromJson: _parseInt)
  int? get countryId => throw _privateConstructorUsedError;
  @JsonKey(name: 'brand_model_id', fromJson: _parseInt)
  int? get brandModelId => throw _privateConstructorUsedError;
  @JsonKey(name: 'brand_id', fromJson: _parseInt)
  int? get brandId => throw _privateConstructorUsedError;
  @JsonKey(name: 'category_id', fromJson: _parseInt)
  int get categoryId => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'year')
  String get year => throw _privateConstructorUsedError;
  @JsonKey(name: 'slug')
  String get slug => throw _privateConstructorUsedError;
  @JsonKey(name: 'description')
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'images')
  List<String> get images => throw _privateConstructorUsedError;
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
  @JsonKey(name: 'number_of_passengers', fromJson: _parseInt)
  int? get numberOfPassengers => throw _privateConstructorUsedError;
  @JsonKey(name: 'features')
  List<String> get features => throw _privateConstructorUsedError;
  @JsonKey(name: 'status')
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'price')
  String get price => throw _privateConstructorUsedError;
  @JsonKey(name: 'mileage')
  String? get mileage => throw _privateConstructorUsedError;
  @JsonKey(name: 'warranty', fromJson: _parseInt)
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
      @JsonKey(name: 'country_id', fromJson: _parseInt) int? countryId,
      @JsonKey(name: 'brand_model_id', fromJson: _parseInt) int? brandModelId,
      @JsonKey(name: 'brand_id', fromJson: _parseInt) int? brandId,
      @JsonKey(name: 'category_id', fromJson: _parseInt) int categoryId,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'year') String year,
      @JsonKey(name: 'slug') String slug,
      @JsonKey(name: 'description') String? description,
      @JsonKey(name: 'images') List<String> images,
      @JsonKey(name: 'location') String? location,
      @JsonKey(name: 'serial_number') String? serialNumber,
      @JsonKey(name: 'condition') String? condition,
      @JsonKey(name: 'steer_position') String? steerPosition,
      @JsonKey(name: 'engine_capacity') String? engineCapacity,
      @JsonKey(name: 'transmission') String? transmission,
      @JsonKey(name: 'color') String? color,
      @JsonKey(name: 'build_type') String? buildType,
      @JsonKey(name: 'number_of_passengers', fromJson: _parseInt)
      int? numberOfPassengers,
      @JsonKey(name: 'features') List<String> features,
      @JsonKey(name: 'status') String? status,
      @JsonKey(name: 'price') String price,
      @JsonKey(name: 'mileage') String? mileage,
      @JsonKey(name: 'warranty', fromJson: _parseInt) int? warranty,
      @JsonKey(name: 'warranty_expiration') String? warrantyExpiration,
      @JsonKey(name: 'deleted_at') String? deletedAt,
      @JsonKey(name: 'created_at') String createdAt,
      @JsonKey(name: 'updated_at') String updatedAt,
      @JsonKey(name: 'Height') String? height,
      @JsonKey(name: 'VIN') String? vin});
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
    Object? categoryId = null,
    Object? name = null,
    Object? year = null,
    Object? slug = null,
    Object? description = freezed,
    Object? images = null,
    Object? location = freezed,
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
      brandModelId: freezed == brandModelId
          ? _value.brandModelId
          : brandModelId // ignore: cast_nullable_to_non_nullable
              as int?,
      brandId: freezed == brandId
          ? _value.brandId
          : brandId // ignore: cast_nullable_to_non_nullable
              as int?,
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
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
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
      @JsonKey(name: 'country_id', fromJson: _parseInt) int? countryId,
      @JsonKey(name: 'brand_model_id', fromJson: _parseInt) int? brandModelId,
      @JsonKey(name: 'brand_id', fromJson: _parseInt) int? brandId,
      @JsonKey(name: 'category_id', fromJson: _parseInt) int categoryId,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'year') String year,
      @JsonKey(name: 'slug') String slug,
      @JsonKey(name: 'description') String? description,
      @JsonKey(name: 'images') List<String> images,
      @JsonKey(name: 'location') String? location,
      @JsonKey(name: 'serial_number') String? serialNumber,
      @JsonKey(name: 'condition') String? condition,
      @JsonKey(name: 'steer_position') String? steerPosition,
      @JsonKey(name: 'engine_capacity') String? engineCapacity,
      @JsonKey(name: 'transmission') String? transmission,
      @JsonKey(name: 'color') String? color,
      @JsonKey(name: 'build_type') String? buildType,
      @JsonKey(name: 'number_of_passengers', fromJson: _parseInt)
      int? numberOfPassengers,
      @JsonKey(name: 'features') List<String> features,
      @JsonKey(name: 'status') String? status,
      @JsonKey(name: 'price') String price,
      @JsonKey(name: 'mileage') String? mileage,
      @JsonKey(name: 'warranty', fromJson: _parseInt) int? warranty,
      @JsonKey(name: 'warranty_expiration') String? warrantyExpiration,
      @JsonKey(name: 'deleted_at') String? deletedAt,
      @JsonKey(name: 'created_at') String createdAt,
      @JsonKey(name: 'updated_at') String updatedAt,
      @JsonKey(name: 'Height') String? height,
      @JsonKey(name: 'VIN') String? vin});
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
    Object? categoryId = null,
    Object? name = null,
    Object? year = null,
    Object? slug = null,
    Object? description = freezed,
    Object? images = null,
    Object? location = freezed,
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
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      images: null == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
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

@JsonSerializable(explicitToJson: true)
class _$SimilarItemImpl extends _SimilarItem {
  const _$SimilarItemImpl(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'user_id') required this.userId,
      @JsonKey(name: 'country_id', fromJson: _parseInt) required this.countryId,
      @JsonKey(name: 'brand_model_id', fromJson: _parseInt)
      required this.brandModelId,
      @JsonKey(name: 'brand_id', fromJson: _parseInt) required this.brandId,
      @JsonKey(name: 'category_id', fromJson: _parseInt)
      required this.categoryId,
      @JsonKey(name: 'name') required this.name,
      @JsonKey(name: 'year') required this.year,
      @JsonKey(name: 'slug') required this.slug,
      @JsonKey(name: 'description') required this.description,
      @JsonKey(name: 'images') required final List<String> images,
      @JsonKey(name: 'location') required this.location,
      @JsonKey(name: 'serial_number') required this.serialNumber,
      @JsonKey(name: 'condition') required this.condition,
      @JsonKey(name: 'steer_position') required this.steerPosition,
      @JsonKey(name: 'engine_capacity') required this.engineCapacity,
      @JsonKey(name: 'transmission') required this.transmission,
      @JsonKey(name: 'color') required this.color,
      @JsonKey(name: 'build_type') required this.buildType,
      @JsonKey(name: 'number_of_passengers', fromJson: _parseInt)
      required this.numberOfPassengers,
      @JsonKey(name: 'features') required final List<String> features,
      @JsonKey(name: 'status') required this.status,
      @JsonKey(name: 'price') required this.price,
      @JsonKey(name: 'mileage') required this.mileage,
      @JsonKey(name: 'warranty', fromJson: _parseInt) required this.warranty,
      @JsonKey(name: 'warranty_expiration') required this.warrantyExpiration,
      @JsonKey(name: 'deleted_at') required this.deletedAt,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') required this.updatedAt,
      @JsonKey(name: 'Height') required this.height,
      @JsonKey(name: 'VIN') required this.vin})
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
  @JsonKey(name: 'country_id', fromJson: _parseInt)
  final int? countryId;
  @override
  @JsonKey(name: 'brand_model_id', fromJson: _parseInt)
  final int? brandModelId;
  @override
  @JsonKey(name: 'brand_id', fromJson: _parseInt)
  final int? brandId;
  @override
  @JsonKey(name: 'category_id', fromJson: _parseInt)
  final int categoryId;
  @override
  @JsonKey(name: 'name')
  final String name;
  @override
  @JsonKey(name: 'year')
  final String year;
  @override
  @JsonKey(name: 'slug')
  final String slug;
  @override
  @JsonKey(name: 'description')
  final String? description;
  final List<String> _images;
  @override
  @JsonKey(name: 'images')
  List<String> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
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
  @JsonKey(name: 'number_of_passengers', fromJson: _parseInt)
  final int? numberOfPassengers;
  final List<String> _features;
  @override
  @JsonKey(name: 'features')
  List<String> get features {
    if (_features is EqualUnmodifiableListView) return _features;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_features);
  }

  @override
  @JsonKey(name: 'status')
  final String? status;
  @override
  @JsonKey(name: 'price')
  final String price;
  @override
  @JsonKey(name: 'mileage')
  final String? mileage;
  @override
  @JsonKey(name: 'warranty', fromJson: _parseInt)
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
    return 'SimilarItem(id: $id, userId: $userId, countryId: $countryId, brandModelId: $brandModelId, brandId: $brandId, categoryId: $categoryId, name: $name, year: $year, slug: $slug, description: $description, images: $images, location: $location, serialNumber: $serialNumber, condition: $condition, steerPosition: $steerPosition, engineCapacity: $engineCapacity, transmission: $transmission, color: $color, buildType: $buildType, numberOfPassengers: $numberOfPassengers, features: $features, status: $status, price: $price, mileage: $mileage, warranty: $warranty, warrantyExpiration: $warrantyExpiration, deletedAt: $deletedAt, createdAt: $createdAt, updatedAt: $updatedAt, height: $height, vin: $vin)';
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
      @JsonKey(name: 'user_id') required final String? userId,
      @JsonKey(name: 'country_id', fromJson: _parseInt)
      required final int? countryId,
      @JsonKey(name: 'brand_model_id', fromJson: _parseInt)
      required final int? brandModelId,
      @JsonKey(name: 'brand_id', fromJson: _parseInt)
      required final int? brandId,
      @JsonKey(name: 'category_id', fromJson: _parseInt)
      required final int categoryId,
      @JsonKey(name: 'name') required final String name,
      @JsonKey(name: 'year') required final String year,
      @JsonKey(name: 'slug') required final String slug,
      @JsonKey(name: 'description') required final String? description,
      @JsonKey(name: 'images') required final List<String> images,
      @JsonKey(name: 'location') required final String? location,
      @JsonKey(name: 'serial_number') required final String? serialNumber,
      @JsonKey(name: 'condition') required final String? condition,
      @JsonKey(name: 'steer_position') required final String? steerPosition,
      @JsonKey(name: 'engine_capacity') required final String? engineCapacity,
      @JsonKey(name: 'transmission') required final String? transmission,
      @JsonKey(name: 'color') required final String? color,
      @JsonKey(name: 'build_type') required final String? buildType,
      @JsonKey(name: 'number_of_passengers', fromJson: _parseInt)
      required final int? numberOfPassengers,
      @JsonKey(name: 'features') required final List<String> features,
      @JsonKey(name: 'status') required final String? status,
      @JsonKey(name: 'price') required final String price,
      @JsonKey(name: 'mileage') required final String? mileage,
      @JsonKey(name: 'warranty', fromJson: _parseInt)
      required final int? warranty,
      @JsonKey(name: 'warranty_expiration')
      required final String? warrantyExpiration,
      @JsonKey(name: 'deleted_at') required final String? deletedAt,
      @JsonKey(name: 'created_at') required final String createdAt,
      @JsonKey(name: 'updated_at') required final String updatedAt,
      @JsonKey(name: 'Height') required final String? height,
      @JsonKey(name: 'VIN') required final String? vin}) = _$SimilarItemImpl;
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
  @JsonKey(name: 'country_id', fromJson: _parseInt)
  int? get countryId;
  @override
  @JsonKey(name: 'brand_model_id', fromJson: _parseInt)
  int? get brandModelId;
  @override
  @JsonKey(name: 'brand_id', fromJson: _parseInt)
  int? get brandId;
  @override
  @JsonKey(name: 'category_id', fromJson: _parseInt)
  int get categoryId;
  @override
  @JsonKey(name: 'name')
  String get name;
  @override
  @JsonKey(name: 'year')
  String get year;
  @override
  @JsonKey(name: 'slug')
  String get slug;
  @override
  @JsonKey(name: 'description')
  String? get description;
  @override
  @JsonKey(name: 'images')
  List<String> get images;
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
  @JsonKey(name: 'number_of_passengers', fromJson: _parseInt)
  int? get numberOfPassengers;
  @override
  @JsonKey(name: 'features')
  List<String> get features;
  @override
  @JsonKey(name: 'status')
  String? get status;
  @override
  @JsonKey(name: 'price')
  String get price;
  @override
  @JsonKey(name: 'mileage')
  String? get mileage;
  @override
  @JsonKey(name: 'warranty', fromJson: _parseInt)
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

  /// Create a copy of SimilarItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SimilarItemImplCopyWith<_$SimilarItemImpl> get copyWith =>
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
      {@JsonKey(name: 'first') required this.first,
      @JsonKey(name: 'last') required this.last,
      @JsonKey(name: 'prev') required this.prev,
      @JsonKey(name: 'next') required this.next});

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
          {@JsonKey(name: 'first') required final String? first,
          @JsonKey(name: 'last') required final String? last,
          @JsonKey(name: 'prev') required final String? prev,
          @JsonKey(name: 'next') required final String? next}) =
      _$PaginationLinksImpl;

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
  @JsonKey(name: 'current_page', fromJson: _parseInt)
  int get currentPage => throw _privateConstructorUsedError;
  @JsonKey(name: 'from', fromJson: _parseInt)
  int? get from => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_page', fromJson: _parseInt)
  int get lastPage => throw _privateConstructorUsedError;
  @JsonKey(name: 'links')
  List<PaginationLink> get links => throw _privateConstructorUsedError;
  @JsonKey(name: 'path')
  String get path => throw _privateConstructorUsedError;
  @JsonKey(name: 'per_page', fromJson: _parseInt)
  int get perPage => throw _privateConstructorUsedError;
  @JsonKey(name: 'to', fromJson: _parseInt)
  int? get to => throw _privateConstructorUsedError;
  @JsonKey(name: 'total', fromJson: _parseInt)
  int get total => throw _privateConstructorUsedError;

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
      {@JsonKey(name: 'current_page', fromJson: _parseInt) int currentPage,
      @JsonKey(name: 'from', fromJson: _parseInt) int? from,
      @JsonKey(name: 'last_page', fromJson: _parseInt) int lastPage,
      @JsonKey(name: 'links') List<PaginationLink> links,
      @JsonKey(name: 'path') String path,
      @JsonKey(name: 'per_page', fromJson: _parseInt) int perPage,
      @JsonKey(name: 'to', fromJson: _parseInt) int? to,
      @JsonKey(name: 'total', fromJson: _parseInt) int total});
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
    Object? currentPage = null,
    Object? from = freezed,
    Object? lastPage = null,
    Object? links = null,
    Object? path = null,
    Object? perPage = null,
    Object? to = freezed,
    Object? total = null,
  }) {
    return _then(_value.copyWith(
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      from: freezed == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as int?,
      lastPage: null == lastPage
          ? _value.lastPage
          : lastPage // ignore: cast_nullable_to_non_nullable
              as int,
      links: null == links
          ? _value.links
          : links // ignore: cast_nullable_to_non_nullable
              as List<PaginationLink>,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      perPage: null == perPage
          ? _value.perPage
          : perPage // ignore: cast_nullable_to_non_nullable
              as int,
      to: freezed == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as int?,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
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
      {@JsonKey(name: 'current_page', fromJson: _parseInt) int currentPage,
      @JsonKey(name: 'from', fromJson: _parseInt) int? from,
      @JsonKey(name: 'last_page', fromJson: _parseInt) int lastPage,
      @JsonKey(name: 'links') List<PaginationLink> links,
      @JsonKey(name: 'path') String path,
      @JsonKey(name: 'per_page', fromJson: _parseInt) int perPage,
      @JsonKey(name: 'to', fromJson: _parseInt) int? to,
      @JsonKey(name: 'total', fromJson: _parseInt) int total});
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
    Object? currentPage = null,
    Object? from = freezed,
    Object? lastPage = null,
    Object? links = null,
    Object? path = null,
    Object? perPage = null,
    Object? to = freezed,
    Object? total = null,
  }) {
    return _then(_$PaginationMetaImpl(
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      from: freezed == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as int?,
      lastPage: null == lastPage
          ? _value.lastPage
          : lastPage // ignore: cast_nullable_to_non_nullable
              as int,
      links: null == links
          ? _value._links
          : links // ignore: cast_nullable_to_non_nullable
              as List<PaginationLink>,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      perPage: null == perPage
          ? _value.perPage
          : perPage // ignore: cast_nullable_to_non_nullable
              as int,
      to: freezed == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as int?,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaginationMetaImpl implements _PaginationMeta {
  const _$PaginationMetaImpl(
      {@JsonKey(name: 'current_page', fromJson: _parseInt)
      required this.currentPage,
      @JsonKey(name: 'from', fromJson: _parseInt) required this.from,
      @JsonKey(name: 'last_page', fromJson: _parseInt) required this.lastPage,
      @JsonKey(name: 'links') required final List<PaginationLink> links,
      @JsonKey(name: 'path') required this.path,
      @JsonKey(name: 'per_page', fromJson: _parseInt) required this.perPage,
      @JsonKey(name: 'to', fromJson: _parseInt) required this.to,
      @JsonKey(name: 'total', fromJson: _parseInt) required this.total})
      : _links = links;

  factory _$PaginationMetaImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaginationMetaImplFromJson(json);

  @override
  @JsonKey(name: 'current_page', fromJson: _parseInt)
  final int currentPage;
  @override
  @JsonKey(name: 'from', fromJson: _parseInt)
  final int? from;
  @override
  @JsonKey(name: 'last_page', fromJson: _parseInt)
  final int lastPage;
  final List<PaginationLink> _links;
  @override
  @JsonKey(name: 'links')
  List<PaginationLink> get links {
    if (_links is EqualUnmodifiableListView) return _links;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_links);
  }

  @override
  @JsonKey(name: 'path')
  final String path;
  @override
  @JsonKey(name: 'per_page', fromJson: _parseInt)
  final int perPage;
  @override
  @JsonKey(name: 'to', fromJson: _parseInt)
  final int? to;
  @override
  @JsonKey(name: 'total', fromJson: _parseInt)
  final int total;

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
      {@JsonKey(name: 'current_page', fromJson: _parseInt)
      required final int currentPage,
      @JsonKey(name: 'from', fromJson: _parseInt) required final int? from,
      @JsonKey(name: 'last_page', fromJson: _parseInt)
      required final int lastPage,
      @JsonKey(name: 'links') required final List<PaginationLink> links,
      @JsonKey(name: 'path') required final String path,
      @JsonKey(name: 'per_page', fromJson: _parseInt)
      required final int perPage,
      @JsonKey(name: 'to', fromJson: _parseInt) required final int? to,
      @JsonKey(name: 'total', fromJson: _parseInt)
      required final int total}) = _$PaginationMetaImpl;

  factory _PaginationMeta.fromJson(Map<String, dynamic> json) =
      _$PaginationMetaImpl.fromJson;

  @override
  @JsonKey(name: 'current_page', fromJson: _parseInt)
  int get currentPage;
  @override
  @JsonKey(name: 'from', fromJson: _parseInt)
  int? get from;
  @override
  @JsonKey(name: 'last_page', fromJson: _parseInt)
  int get lastPage;
  @override
  @JsonKey(name: 'links')
  List<PaginationLink> get links;
  @override
  @JsonKey(name: 'path')
  String get path;
  @override
  @JsonKey(name: 'per_page', fromJson: _parseInt)
  int get perPage;
  @override
  @JsonKey(name: 'to', fromJson: _parseInt)
  int? get to;
  @override
  @JsonKey(name: 'total', fromJson: _parseInt)
  int get total;

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
  String get label => throw _privateConstructorUsedError;
  @JsonKey(name: 'active')
  bool get active => throw _privateConstructorUsedError;

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
      @JsonKey(name: 'label') String label,
      @JsonKey(name: 'active') bool active});
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
    Object? label = null,
    Object? active = null,
  }) {
    return _then(_value.copyWith(
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
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
      @JsonKey(name: 'label') String label,
      @JsonKey(name: 'active') bool active});
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
    Object? label = null,
    Object? active = null,
  }) {
    return _then(_$PaginationLinkImpl(
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaginationLinkImpl implements _PaginationLink {
  const _$PaginationLinkImpl(
      {@JsonKey(name: 'url') required this.url,
      @JsonKey(name: 'label') required this.label,
      @JsonKey(name: 'active') required this.active});

  factory _$PaginationLinkImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaginationLinkImplFromJson(json);

  @override
  @JsonKey(name: 'url')
  final String? url;
  @override
  @JsonKey(name: 'label')
  final String label;
  @override
  @JsonKey(name: 'active')
  final bool active;

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
          {@JsonKey(name: 'url') required final String? url,
          @JsonKey(name: 'label') required final String label,
          @JsonKey(name: 'active') required final bool active}) =
      _$PaginationLinkImpl;

  factory _PaginationLink.fromJson(Map<String, dynamic> json) =
      _$PaginationLinkImpl.fromJson;

  @override
  @JsonKey(name: 'url')
  String? get url;
  @override
  @JsonKey(name: 'label')
  String get label;
  @override
  @JsonKey(name: 'active')
  bool get active;

  /// Create a copy of PaginationLink
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaginationLinkImplCopyWith<_$PaginationLinkImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
