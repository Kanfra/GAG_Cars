// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'specialOfferModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SpecialOfferResponse _$SpecialOfferResponseFromJson(Map<String, dynamic> json) {
  return _SpecialOfferResponse.fromJson(json);
}

/// @nodoc
mixin _$SpecialOfferResponse {
  List<SpecialOffer> get data => throw _privateConstructorUsedError;
  PaginationLinks? get links => throw _privateConstructorUsedError;
  PaginationMeta? get meta => throw _privateConstructorUsedError;

  /// Serializes this SpecialOfferResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SpecialOfferResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SpecialOfferResponseCopyWith<SpecialOfferResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpecialOfferResponseCopyWith<$Res> {
  factory $SpecialOfferResponseCopyWith(SpecialOfferResponse value,
          $Res Function(SpecialOfferResponse) then) =
      _$SpecialOfferResponseCopyWithImpl<$Res, SpecialOfferResponse>;
  @useResult
  $Res call(
      {List<SpecialOffer> data, PaginationLinks? links, PaginationMeta? meta});

  $PaginationLinksCopyWith<$Res>? get links;
  $PaginationMetaCopyWith<$Res>? get meta;
}

/// @nodoc
class _$SpecialOfferResponseCopyWithImpl<$Res,
        $Val extends SpecialOfferResponse>
    implements $SpecialOfferResponseCopyWith<$Res> {
  _$SpecialOfferResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SpecialOfferResponse
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
              as List<SpecialOffer>,
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

  /// Create a copy of SpecialOfferResponse
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

  /// Create a copy of SpecialOfferResponse
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
abstract class _$$SpecialOfferResponseImplCopyWith<$Res>
    implements $SpecialOfferResponseCopyWith<$Res> {
  factory _$$SpecialOfferResponseImplCopyWith(_$SpecialOfferResponseImpl value,
          $Res Function(_$SpecialOfferResponseImpl) then) =
      __$$SpecialOfferResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<SpecialOffer> data, PaginationLinks? links, PaginationMeta? meta});

  @override
  $PaginationLinksCopyWith<$Res>? get links;
  @override
  $PaginationMetaCopyWith<$Res>? get meta;
}

/// @nodoc
class __$$SpecialOfferResponseImplCopyWithImpl<$Res>
    extends _$SpecialOfferResponseCopyWithImpl<$Res, _$SpecialOfferResponseImpl>
    implements _$$SpecialOfferResponseImplCopyWith<$Res> {
  __$$SpecialOfferResponseImplCopyWithImpl(_$SpecialOfferResponseImpl _value,
      $Res Function(_$SpecialOfferResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of SpecialOfferResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? links = freezed,
    Object? meta = freezed,
  }) {
    return _then(_$SpecialOfferResponseImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<SpecialOffer>,
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
class _$SpecialOfferResponseImpl
    with DiagnosticableTreeMixin
    implements _SpecialOfferResponse {
  const _$SpecialOfferResponseImpl(
      {final List<SpecialOffer> data = const [], this.links, this.meta})
      : _data = data;

  factory _$SpecialOfferResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$SpecialOfferResponseImplFromJson(json);

  final List<SpecialOffer> _data;
  @override
  @JsonKey()
  List<SpecialOffer> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  final PaginationLinks? links;
  @override
  final PaginationMeta? meta;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SpecialOfferResponse(data: $data, links: $links, meta: $meta)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SpecialOfferResponse'))
      ..add(DiagnosticsProperty('data', data))
      ..add(DiagnosticsProperty('links', links))
      ..add(DiagnosticsProperty('meta', meta));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SpecialOfferResponseImpl &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.links, links) || other.links == links) &&
            (identical(other.meta, meta) || other.meta == meta));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_data), links, meta);

  /// Create a copy of SpecialOfferResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SpecialOfferResponseImplCopyWith<_$SpecialOfferResponseImpl>
      get copyWith =>
          __$$SpecialOfferResponseImplCopyWithImpl<_$SpecialOfferResponseImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SpecialOfferResponseImplToJson(
      this,
    );
  }
}

abstract class _SpecialOfferResponse implements SpecialOfferResponse {
  const factory _SpecialOfferResponse(
      {final List<SpecialOffer> data,
      final PaginationLinks? links,
      final PaginationMeta? meta}) = _$SpecialOfferResponseImpl;

  factory _SpecialOfferResponse.fromJson(Map<String, dynamic> json) =
      _$SpecialOfferResponseImpl.fromJson;

  @override
  List<SpecialOffer> get data;
  @override
  PaginationLinks? get links;
  @override
  PaginationMeta? get meta;

  /// Create a copy of SpecialOfferResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SpecialOfferResponseImplCopyWith<_$SpecialOfferResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

SpecialOffer _$SpecialOfferFromJson(Map<String, dynamic> json) {
  return _SpecialOffer.fromJson(json);
}

/// @nodoc
mixin _$SpecialOffer {
  @JsonKey(fromJson: _parseInt)
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  String? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'item_id', fromJson: _parseString)
  String get itemId => throw _privateConstructorUsedError;
  @JsonKey(name: 'start_at', fromJson: _parseString)
  String get startAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'end_at', fromJson: _parseString)
  String get endAt => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _parseString)
  String get status => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _parseInt)
  int get discount => throw _privateConstructorUsedError;
  @JsonKey(name: 'discount_type', fromJson: _parseString)
  String get discountType => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at', fromJson: _parseString)
  String get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at', fromJson: _parseString)
  String get updatedAt => throw _privateConstructorUsedError;
  Item? get item => throw _privateConstructorUsedError;

  /// Serializes this SpecialOffer to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SpecialOffer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SpecialOfferCopyWith<SpecialOffer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpecialOfferCopyWith<$Res> {
  factory $SpecialOfferCopyWith(
          SpecialOffer value, $Res Function(SpecialOffer) then) =
      _$SpecialOfferCopyWithImpl<$Res, SpecialOffer>;
  @useResult
  $Res call(
      {@JsonKey(fromJson: _parseInt) int id,
      @JsonKey(name: 'user_id') String? userId,
      @JsonKey(name: 'item_id', fromJson: _parseString) String itemId,
      @JsonKey(name: 'start_at', fromJson: _parseString) String startAt,
      @JsonKey(name: 'end_at', fromJson: _parseString) String endAt,
      @JsonKey(fromJson: _parseString) String status,
      @JsonKey(fromJson: _parseInt) int discount,
      @JsonKey(name: 'discount_type', fromJson: _parseString)
      String discountType,
      String? description,
      @JsonKey(name: 'created_at', fromJson: _parseString) String createdAt,
      @JsonKey(name: 'updated_at', fromJson: _parseString) String updatedAt,
      Item? item});

  $ItemCopyWith<$Res>? get item;
}

/// @nodoc
class _$SpecialOfferCopyWithImpl<$Res, $Val extends SpecialOffer>
    implements $SpecialOfferCopyWith<$Res> {
  _$SpecialOfferCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SpecialOffer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = freezed,
    Object? itemId = null,
    Object? startAt = null,
    Object? endAt = null,
    Object? status = null,
    Object? discount = null,
    Object? discountType = null,
    Object? description = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? item = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      itemId: null == itemId
          ? _value.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as String,
      startAt: null == startAt
          ? _value.startAt
          : startAt // ignore: cast_nullable_to_non_nullable
              as String,
      endAt: null == endAt
          ? _value.endAt
          : endAt // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      discount: null == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as int,
      discountType: null == discountType
          ? _value.discountType
          : discountType // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      item: freezed == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as Item?,
    ) as $Val);
  }

  /// Create a copy of SpecialOffer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ItemCopyWith<$Res>? get item {
    if (_value.item == null) {
      return null;
    }

    return $ItemCopyWith<$Res>(_value.item!, (value) {
      return _then(_value.copyWith(item: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SpecialOfferImplCopyWith<$Res>
    implements $SpecialOfferCopyWith<$Res> {
  factory _$$SpecialOfferImplCopyWith(
          _$SpecialOfferImpl value, $Res Function(_$SpecialOfferImpl) then) =
      __$$SpecialOfferImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(fromJson: _parseInt) int id,
      @JsonKey(name: 'user_id') String? userId,
      @JsonKey(name: 'item_id', fromJson: _parseString) String itemId,
      @JsonKey(name: 'start_at', fromJson: _parseString) String startAt,
      @JsonKey(name: 'end_at', fromJson: _parseString) String endAt,
      @JsonKey(fromJson: _parseString) String status,
      @JsonKey(fromJson: _parseInt) int discount,
      @JsonKey(name: 'discount_type', fromJson: _parseString)
      String discountType,
      String? description,
      @JsonKey(name: 'created_at', fromJson: _parseString) String createdAt,
      @JsonKey(name: 'updated_at', fromJson: _parseString) String updatedAt,
      Item? item});

  @override
  $ItemCopyWith<$Res>? get item;
}

/// @nodoc
class __$$SpecialOfferImplCopyWithImpl<$Res>
    extends _$SpecialOfferCopyWithImpl<$Res, _$SpecialOfferImpl>
    implements _$$SpecialOfferImplCopyWith<$Res> {
  __$$SpecialOfferImplCopyWithImpl(
      _$SpecialOfferImpl _value, $Res Function(_$SpecialOfferImpl) _then)
      : super(_value, _then);

  /// Create a copy of SpecialOffer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = freezed,
    Object? itemId = null,
    Object? startAt = null,
    Object? endAt = null,
    Object? status = null,
    Object? discount = null,
    Object? discountType = null,
    Object? description = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? item = freezed,
  }) {
    return _then(_$SpecialOfferImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      itemId: null == itemId
          ? _value.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as String,
      startAt: null == startAt
          ? _value.startAt
          : startAt // ignore: cast_nullable_to_non_nullable
              as String,
      endAt: null == endAt
          ? _value.endAt
          : endAt // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      discount: null == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as int,
      discountType: null == discountType
          ? _value.discountType
          : discountType // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      item: freezed == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as Item?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SpecialOfferImpl with DiagnosticableTreeMixin implements _SpecialOffer {
  const _$SpecialOfferImpl(
      {@JsonKey(fromJson: _parseInt) required this.id,
      @JsonKey(name: 'user_id') this.userId,
      @JsonKey(name: 'item_id', fromJson: _parseString) required this.itemId,
      @JsonKey(name: 'start_at', fromJson: _parseString) required this.startAt,
      @JsonKey(name: 'end_at', fromJson: _parseString) required this.endAt,
      @JsonKey(fromJson: _parseString) required this.status,
      @JsonKey(fromJson: _parseInt) required this.discount,
      @JsonKey(name: 'discount_type', fromJson: _parseString)
      required this.discountType,
      this.description,
      @JsonKey(name: 'created_at', fromJson: _parseString)
      required this.createdAt,
      @JsonKey(name: 'updated_at', fromJson: _parseString)
      required this.updatedAt,
      this.item});

  factory _$SpecialOfferImpl.fromJson(Map<String, dynamic> json) =>
      _$$SpecialOfferImplFromJson(json);

  @override
  @JsonKey(fromJson: _parseInt)
  final int id;
  @override
  @JsonKey(name: 'user_id')
  final String? userId;
  @override
  @JsonKey(name: 'item_id', fromJson: _parseString)
  final String itemId;
  @override
  @JsonKey(name: 'start_at', fromJson: _parseString)
  final String startAt;
  @override
  @JsonKey(name: 'end_at', fromJson: _parseString)
  final String endAt;
  @override
  @JsonKey(fromJson: _parseString)
  final String status;
  @override
  @JsonKey(fromJson: _parseInt)
  final int discount;
  @override
  @JsonKey(name: 'discount_type', fromJson: _parseString)
  final String discountType;
  @override
  final String? description;
  @override
  @JsonKey(name: 'created_at', fromJson: _parseString)
  final String createdAt;
  @override
  @JsonKey(name: 'updated_at', fromJson: _parseString)
  final String updatedAt;
  @override
  final Item? item;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SpecialOffer(id: $id, userId: $userId, itemId: $itemId, startAt: $startAt, endAt: $endAt, status: $status, discount: $discount, discountType: $discountType, description: $description, createdAt: $createdAt, updatedAt: $updatedAt, item: $item)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SpecialOffer'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('userId', userId))
      ..add(DiagnosticsProperty('itemId', itemId))
      ..add(DiagnosticsProperty('startAt', startAt))
      ..add(DiagnosticsProperty('endAt', endAt))
      ..add(DiagnosticsProperty('status', status))
      ..add(DiagnosticsProperty('discount', discount))
      ..add(DiagnosticsProperty('discountType', discountType))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('updatedAt', updatedAt))
      ..add(DiagnosticsProperty('item', item));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SpecialOfferImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.itemId, itemId) || other.itemId == itemId) &&
            (identical(other.startAt, startAt) || other.startAt == startAt) &&
            (identical(other.endAt, endAt) || other.endAt == endAt) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.discount, discount) ||
                other.discount == discount) &&
            (identical(other.discountType, discountType) ||
                other.discountType == discountType) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.item, item) || other.item == item));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      itemId,
      startAt,
      endAt,
      status,
      discount,
      discountType,
      description,
      createdAt,
      updatedAt,
      item);

  /// Create a copy of SpecialOffer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SpecialOfferImplCopyWith<_$SpecialOfferImpl> get copyWith =>
      __$$SpecialOfferImplCopyWithImpl<_$SpecialOfferImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SpecialOfferImplToJson(
      this,
    );
  }
}

abstract class _SpecialOffer implements SpecialOffer {
  const factory _SpecialOffer(
      {@JsonKey(fromJson: _parseInt) required final int id,
      @JsonKey(name: 'user_id') final String? userId,
      @JsonKey(name: 'item_id', fromJson: _parseString)
      required final String itemId,
      @JsonKey(name: 'start_at', fromJson: _parseString)
      required final String startAt,
      @JsonKey(name: 'end_at', fromJson: _parseString)
      required final String endAt,
      @JsonKey(fromJson: _parseString) required final String status,
      @JsonKey(fromJson: _parseInt) required final int discount,
      @JsonKey(name: 'discount_type', fromJson: _parseString)
      required final String discountType,
      final String? description,
      @JsonKey(name: 'created_at', fromJson: _parseString)
      required final String createdAt,
      @JsonKey(name: 'updated_at', fromJson: _parseString)
      required final String updatedAt,
      final Item? item}) = _$SpecialOfferImpl;

  factory _SpecialOffer.fromJson(Map<String, dynamic> json) =
      _$SpecialOfferImpl.fromJson;

  @override
  @JsonKey(fromJson: _parseInt)
  int get id;
  @override
  @JsonKey(name: 'user_id')
  String? get userId;
  @override
  @JsonKey(name: 'item_id', fromJson: _parseString)
  String get itemId;
  @override
  @JsonKey(name: 'start_at', fromJson: _parseString)
  String get startAt;
  @override
  @JsonKey(name: 'end_at', fromJson: _parseString)
  String get endAt;
  @override
  @JsonKey(fromJson: _parseString)
  String get status;
  @override
  @JsonKey(fromJson: _parseInt)
  int get discount;
  @override
  @JsonKey(name: 'discount_type', fromJson: _parseString)
  String get discountType;
  @override
  String? get description;
  @override
  @JsonKey(name: 'created_at', fromJson: _parseString)
  String get createdAt;
  @override
  @JsonKey(name: 'updated_at', fromJson: _parseString)
  String get updatedAt;
  @override
  Item? get item;

  /// Create a copy of SpecialOffer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SpecialOfferImplCopyWith<_$SpecialOfferImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Item _$ItemFromJson(Map<String, dynamic> json) {
  return _Item.fromJson(json);
}

/// @nodoc
mixin _$Item {
  @JsonKey(fromJson: _parseString)
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
  int? get categoryId => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _parseString)
  String get name => throw _privateConstructorUsedError;
  String? get year => throw _privateConstructorUsedError;
  String? get slug => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  List<String>? get images => throw _privateConstructorUsedError;
  String? get location => throw _privateConstructorUsedError;
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
  @JsonKey(name: 'number_of_passengers', fromJson: _parseInt)
  int? get numberOfPassengers => throw _privateConstructorUsedError;
  List<String>? get features => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get price => throw _privateConstructorUsedError;
  String? get mileage => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _parseInt)
  int? get warranty => throw _privateConstructorUsedError;
  @JsonKey(name: 'warranty_expiration')
  String? get warrantyExpiration => throw _privateConstructorUsedError;
  @JsonKey(name: 'deleted_at')
  String? get deletedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  String? get updatedAt => throw _privateConstructorUsedError;
  Brand? get brand => throw _privateConstructorUsedError;
  Category? get category => throw _privateConstructorUsedError;
  @JsonKey(name: 'brand_model')
  BrandModel? get brandModel => throw _privateConstructorUsedError;
  Map<String, dynamic>? get user => throw _privateConstructorUsedError;

  /// Serializes this Item to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Item
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ItemCopyWith<Item> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemCopyWith<$Res> {
  factory $ItemCopyWith(Item value, $Res Function(Item) then) =
      _$ItemCopyWithImpl<$Res, Item>;
  @useResult
  $Res call(
      {@JsonKey(fromJson: _parseString) String id,
      @JsonKey(name: 'user_id') String? userId,
      @JsonKey(name: 'country_id', fromJson: _parseInt) int? countryId,
      @JsonKey(name: 'brand_model_id', fromJson: _parseInt) int? brandModelId,
      @JsonKey(name: 'brand_id', fromJson: _parseInt) int? brandId,
      @JsonKey(name: 'category_id', fromJson: _parseInt) int? categoryId,
      @JsonKey(fromJson: _parseString) String name,
      String? year,
      String? slug,
      String? description,
      List<String>? images,
      String? location,
      @JsonKey(name: 'serial_number') String? serialNumber,
      String? condition,
      @JsonKey(name: 'steer_position') String? steerPosition,
      @JsonKey(name: 'engine_capacity') String? engineCapacity,
      String? transmission,
      String? color,
      @JsonKey(name: 'build_type') String? buildType,
      @JsonKey(name: 'number_of_passengers', fromJson: _parseInt)
      int? numberOfPassengers,
      List<String>? features,
      String? status,
      String? price,
      String? mileage,
      @JsonKey(fromJson: _parseInt) int? warranty,
      @JsonKey(name: 'warranty_expiration') String? warrantyExpiration,
      @JsonKey(name: 'deleted_at') String? deletedAt,
      @JsonKey(name: 'created_at') String? createdAt,
      @JsonKey(name: 'updated_at') String? updatedAt,
      Brand? brand,
      Category? category,
      @JsonKey(name: 'brand_model') BrandModel? brandModel,
      Map<String, dynamic>? user});

  $BrandCopyWith<$Res>? get brand;
  $CategoryCopyWith<$Res>? get category;
  $BrandModelCopyWith<$Res>? get brandModel;
}

/// @nodoc
class _$ItemCopyWithImpl<$Res, $Val extends Item>
    implements $ItemCopyWith<$Res> {
  _$ItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Item
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
    Object? name = null,
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
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
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
              as Map<String, dynamic>?,
    ) as $Val);
  }

  /// Create a copy of Item
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

  /// Create a copy of Item
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

  /// Create a copy of Item
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
}

/// @nodoc
abstract class _$$ItemImplCopyWith<$Res> implements $ItemCopyWith<$Res> {
  factory _$$ItemImplCopyWith(
          _$ItemImpl value, $Res Function(_$ItemImpl) then) =
      __$$ItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(fromJson: _parseString) String id,
      @JsonKey(name: 'user_id') String? userId,
      @JsonKey(name: 'country_id', fromJson: _parseInt) int? countryId,
      @JsonKey(name: 'brand_model_id', fromJson: _parseInt) int? brandModelId,
      @JsonKey(name: 'brand_id', fromJson: _parseInt) int? brandId,
      @JsonKey(name: 'category_id', fromJson: _parseInt) int? categoryId,
      @JsonKey(fromJson: _parseString) String name,
      String? year,
      String? slug,
      String? description,
      List<String>? images,
      String? location,
      @JsonKey(name: 'serial_number') String? serialNumber,
      String? condition,
      @JsonKey(name: 'steer_position') String? steerPosition,
      @JsonKey(name: 'engine_capacity') String? engineCapacity,
      String? transmission,
      String? color,
      @JsonKey(name: 'build_type') String? buildType,
      @JsonKey(name: 'number_of_passengers', fromJson: _parseInt)
      int? numberOfPassengers,
      List<String>? features,
      String? status,
      String? price,
      String? mileage,
      @JsonKey(fromJson: _parseInt) int? warranty,
      @JsonKey(name: 'warranty_expiration') String? warrantyExpiration,
      @JsonKey(name: 'deleted_at') String? deletedAt,
      @JsonKey(name: 'created_at') String? createdAt,
      @JsonKey(name: 'updated_at') String? updatedAt,
      Brand? brand,
      Category? category,
      @JsonKey(name: 'brand_model') BrandModel? brandModel,
      Map<String, dynamic>? user});

  @override
  $BrandCopyWith<$Res>? get brand;
  @override
  $CategoryCopyWith<$Res>? get category;
  @override
  $BrandModelCopyWith<$Res>? get brandModel;
}

/// @nodoc
class __$$ItemImplCopyWithImpl<$Res>
    extends _$ItemCopyWithImpl<$Res, _$ItemImpl>
    implements _$$ItemImplCopyWith<$Res> {
  __$$ItemImplCopyWithImpl(_$ItemImpl _value, $Res Function(_$ItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of Item
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
    Object? name = null,
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
    Object? brand = freezed,
    Object? category = freezed,
    Object? brandModel = freezed,
    Object? user = freezed,
  }) {
    return _then(_$ItemImpl(
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
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
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
          ? _value._user
          : user // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ItemImpl with DiagnosticableTreeMixin implements _Item {
  const _$ItemImpl(
      {@JsonKey(fromJson: _parseString) required this.id,
      @JsonKey(name: 'user_id') this.userId,
      @JsonKey(name: 'country_id', fromJson: _parseInt) this.countryId,
      @JsonKey(name: 'brand_model_id', fromJson: _parseInt) this.brandModelId,
      @JsonKey(name: 'brand_id', fromJson: _parseInt) this.brandId,
      @JsonKey(name: 'category_id', fromJson: _parseInt) this.categoryId,
      @JsonKey(fromJson: _parseString) required this.name,
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
      @JsonKey(name: 'number_of_passengers', fromJson: _parseInt)
      this.numberOfPassengers,
      final List<String>? features,
      this.status,
      this.price,
      this.mileage,
      @JsonKey(fromJson: _parseInt) this.warranty,
      @JsonKey(name: 'warranty_expiration') this.warrantyExpiration,
      @JsonKey(name: 'deleted_at') this.deletedAt,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt,
      this.brand,
      this.category,
      @JsonKey(name: 'brand_model') this.brandModel,
      final Map<String, dynamic>? user = null})
      : _images = images,
        _features = features,
        _user = user;

  factory _$ItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$ItemImplFromJson(json);

  @override
  @JsonKey(fromJson: _parseString)
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
  final int? categoryId;
  @override
  @JsonKey(fromJson: _parseString)
  final String name;
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
  @JsonKey(name: 'number_of_passengers', fromJson: _parseInt)
  final int? numberOfPassengers;
  final List<String>? _features;
  @override
  List<String>? get features {
    final value = _features;
    if (value == null) return null;
    if (_features is EqualUnmodifiableListView) return _features;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? status;
  @override
  final String? price;
  @override
  final String? mileage;
  @override
  @JsonKey(fromJson: _parseInt)
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
  final Brand? brand;
  @override
  final Category? category;
  @override
  @JsonKey(name: 'brand_model')
  final BrandModel? brandModel;
  final Map<String, dynamic>? _user;
  @override
  @JsonKey()
  Map<String, dynamic>? get user {
    final value = _user;
    if (value == null) return null;
    if (_user is EqualUnmodifiableMapView) return _user;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Item(id: $id, userId: $userId, countryId: $countryId, brandModelId: $brandModelId, brandId: $brandId, categoryId: $categoryId, name: $name, year: $year, slug: $slug, description: $description, images: $images, location: $location, serialNumber: $serialNumber, condition: $condition, steerPosition: $steerPosition, engineCapacity: $engineCapacity, transmission: $transmission, color: $color, buildType: $buildType, numberOfPassengers: $numberOfPassengers, features: $features, status: $status, price: $price, mileage: $mileage, warranty: $warranty, warrantyExpiration: $warrantyExpiration, deletedAt: $deletedAt, createdAt: $createdAt, updatedAt: $updatedAt, brand: $brand, category: $category, brandModel: $brandModel, user: $user)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Item'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('userId', userId))
      ..add(DiagnosticsProperty('countryId', countryId))
      ..add(DiagnosticsProperty('brandModelId', brandModelId))
      ..add(DiagnosticsProperty('brandId', brandId))
      ..add(DiagnosticsProperty('categoryId', categoryId))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('year', year))
      ..add(DiagnosticsProperty('slug', slug))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('images', images))
      ..add(DiagnosticsProperty('location', location))
      ..add(DiagnosticsProperty('serialNumber', serialNumber))
      ..add(DiagnosticsProperty('condition', condition))
      ..add(DiagnosticsProperty('steerPosition', steerPosition))
      ..add(DiagnosticsProperty('engineCapacity', engineCapacity))
      ..add(DiagnosticsProperty('transmission', transmission))
      ..add(DiagnosticsProperty('color', color))
      ..add(DiagnosticsProperty('buildType', buildType))
      ..add(DiagnosticsProperty('numberOfPassengers', numberOfPassengers))
      ..add(DiagnosticsProperty('features', features))
      ..add(DiagnosticsProperty('status', status))
      ..add(DiagnosticsProperty('price', price))
      ..add(DiagnosticsProperty('mileage', mileage))
      ..add(DiagnosticsProperty('warranty', warranty))
      ..add(DiagnosticsProperty('warrantyExpiration', warrantyExpiration))
      ..add(DiagnosticsProperty('deletedAt', deletedAt))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('updatedAt', updatedAt))
      ..add(DiagnosticsProperty('brand', brand))
      ..add(DiagnosticsProperty('category', category))
      ..add(DiagnosticsProperty('brandModel', brandModel))
      ..add(DiagnosticsProperty('user', user));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ItemImpl &&
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
            (identical(other.brand, brand) || other.brand == brand) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.brandModel, brandModel) ||
                other.brandModel == brandModel) &&
            const DeepCollectionEquality().equals(other._user, _user));
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
        brand,
        category,
        brandModel,
        const DeepCollectionEquality().hash(_user)
      ]);

  /// Create a copy of Item
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ItemImplCopyWith<_$ItemImpl> get copyWith =>
      __$$ItemImplCopyWithImpl<_$ItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ItemImplToJson(
      this,
    );
  }
}

abstract class _Item implements Item {
  const factory _Item(
      {@JsonKey(fromJson: _parseString) required final String id,
      @JsonKey(name: 'user_id') final String? userId,
      @JsonKey(name: 'country_id', fromJson: _parseInt) final int? countryId,
      @JsonKey(name: 'brand_model_id', fromJson: _parseInt)
      final int? brandModelId,
      @JsonKey(name: 'brand_id', fromJson: _parseInt) final int? brandId,
      @JsonKey(name: 'category_id', fromJson: _parseInt) final int? categoryId,
      @JsonKey(fromJson: _parseString) required final String name,
      final String? year,
      final String? slug,
      final String? description,
      final List<String>? images,
      final String? location,
      @JsonKey(name: 'serial_number') final String? serialNumber,
      final String? condition,
      @JsonKey(name: 'steer_position') final String? steerPosition,
      @JsonKey(name: 'engine_capacity') final String? engineCapacity,
      final String? transmission,
      final String? color,
      @JsonKey(name: 'build_type') final String? buildType,
      @JsonKey(name: 'number_of_passengers', fromJson: _parseInt)
      final int? numberOfPassengers,
      final List<String>? features,
      final String? status,
      final String? price,
      final String? mileage,
      @JsonKey(fromJson: _parseInt) final int? warranty,
      @JsonKey(name: 'warranty_expiration') final String? warrantyExpiration,
      @JsonKey(name: 'deleted_at') final String? deletedAt,
      @JsonKey(name: 'created_at') final String? createdAt,
      @JsonKey(name: 'updated_at') final String? updatedAt,
      final Brand? brand,
      final Category? category,
      @JsonKey(name: 'brand_model') final BrandModel? brandModel,
      final Map<String, dynamic>? user}) = _$ItemImpl;

  factory _Item.fromJson(Map<String, dynamic> json) = _$ItemImpl.fromJson;

  @override
  @JsonKey(fromJson: _parseString)
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
  int? get categoryId;
  @override
  @JsonKey(fromJson: _parseString)
  String get name;
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
  @JsonKey(name: 'number_of_passengers', fromJson: _parseInt)
  int? get numberOfPassengers;
  @override
  List<String>? get features;
  @override
  String? get status;
  @override
  String? get price;
  @override
  String? get mileage;
  @override
  @JsonKey(fromJson: _parseInt)
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
  Brand? get brand;
  @override
  Category? get category;
  @override
  @JsonKey(name: 'brand_model')
  BrandModel? get brandModel;
  @override
  Map<String, dynamic>? get user;

  /// Create a copy of Item
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ItemImplCopyWith<_$ItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Brand _$BrandFromJson(Map<String, dynamic> json) {
  return _Brand.fromJson(json);
}

/// @nodoc
mixin _$Brand {
  @JsonKey(fromJson: _parseInt)
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  String? get userId => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _parseString)
  String get name => throw _privateConstructorUsedError;
  String? get slug => throw _privateConstructorUsedError;
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
      {@JsonKey(fromJson: _parseInt) int id,
      @JsonKey(name: 'user_id') String? userId,
      @JsonKey(fromJson: _parseString) String name,
      String? slug,
      String? image,
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
    Object? name = null,
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
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
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
      {@JsonKey(fromJson: _parseInt) int id,
      @JsonKey(name: 'user_id') String? userId,
      @JsonKey(fromJson: _parseString) String name,
      String? slug,
      String? image,
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
    Object? name = null,
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
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
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
class _$BrandImpl with DiagnosticableTreeMixin implements _Brand {
  const _$BrandImpl(
      {@JsonKey(fromJson: _parseInt) required this.id,
      @JsonKey(name: 'user_id') this.userId,
      @JsonKey(fromJson: _parseString) required this.name,
      this.slug,
      this.image,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt});

  factory _$BrandImpl.fromJson(Map<String, dynamic> json) =>
      _$$BrandImplFromJson(json);

  @override
  @JsonKey(fromJson: _parseInt)
  final int id;
  @override
  @JsonKey(name: 'user_id')
  final String? userId;
  @override
  @JsonKey(fromJson: _parseString)
  final String name;
  @override
  final String? slug;
  @override
  final String? image;
  @override
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final String? updatedAt;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Brand(id: $id, userId: $userId, name: $name, slug: $slug, image: $image, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Brand'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('userId', userId))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('slug', slug))
      ..add(DiagnosticsProperty('image', image))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('updatedAt', updatedAt));
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
      {@JsonKey(fromJson: _parseInt) required final int id,
      @JsonKey(name: 'user_id') final String? userId,
      @JsonKey(fromJson: _parseString) required final String name,
      final String? slug,
      final String? image,
      @JsonKey(name: 'created_at') final String? createdAt,
      @JsonKey(name: 'updated_at') final String? updatedAt}) = _$BrandImpl;

  factory _Brand.fromJson(Map<String, dynamic> json) = _$BrandImpl.fromJson;

  @override
  @JsonKey(fromJson: _parseInt)
  int get id;
  @override
  @JsonKey(name: 'user_id')
  String? get userId;
  @override
  @JsonKey(fromJson: _parseString)
  String get name;
  @override
  String? get slug;
  @override
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
  @JsonKey(fromJson: _parseInt)
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  String? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'parent_id')
  String? get parentId => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _parseString)
  String get name => throw _privateConstructorUsedError;
  String? get slug => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  List<String>? get features => throw _privateConstructorUsedError;
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
      {@JsonKey(fromJson: _parseInt) int id,
      @JsonKey(name: 'user_id') String? userId,
      @JsonKey(name: 'parent_id') String? parentId,
      @JsonKey(fromJson: _parseString) String name,
      String? slug,
      String? description,
      List<String>? features,
      String? image,
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
    Object? name = null,
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
              as String?,
      parentId: freezed == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
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
      {@JsonKey(fromJson: _parseInt) int id,
      @JsonKey(name: 'user_id') String? userId,
      @JsonKey(name: 'parent_id') String? parentId,
      @JsonKey(fromJson: _parseString) String name,
      String? slug,
      String? description,
      List<String>? features,
      String? image,
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
    Object? name = null,
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
              as String?,
      parentId: freezed == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
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
class _$CategoryImpl with DiagnosticableTreeMixin implements _Category {
  const _$CategoryImpl(
      {@JsonKey(fromJson: _parseInt) required this.id,
      @JsonKey(name: 'user_id') this.userId,
      @JsonKey(name: 'parent_id') this.parentId,
      @JsonKey(fromJson: _parseString) required this.name,
      this.slug,
      this.description,
      final List<String>? features,
      this.image,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt})
      : _features = features;

  factory _$CategoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoryImplFromJson(json);

  @override
  @JsonKey(fromJson: _parseInt)
  final int id;
  @override
  @JsonKey(name: 'user_id')
  final String? userId;
  @override
  @JsonKey(name: 'parent_id')
  final String? parentId;
  @override
  @JsonKey(fromJson: _parseString)
  final String name;
  @override
  final String? slug;
  @override
  final String? description;
  final List<String>? _features;
  @override
  List<String>? get features {
    final value = _features;
    if (value == null) return null;
    if (_features is EqualUnmodifiableListView) return _features;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? image;
  @override
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final String? updatedAt;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Category(id: $id, userId: $userId, parentId: $parentId, name: $name, slug: $slug, description: $description, features: $features, image: $image, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Category'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('userId', userId))
      ..add(DiagnosticsProperty('parentId', parentId))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('slug', slug))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('features', features))
      ..add(DiagnosticsProperty('image', image))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('updatedAt', updatedAt));
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
      {@JsonKey(fromJson: _parseInt) required final int id,
      @JsonKey(name: 'user_id') final String? userId,
      @JsonKey(name: 'parent_id') final String? parentId,
      @JsonKey(fromJson: _parseString) required final String name,
      final String? slug,
      final String? description,
      final List<String>? features,
      final String? image,
      @JsonKey(name: 'created_at') final String? createdAt,
      @JsonKey(name: 'updated_at') final String? updatedAt}) = _$CategoryImpl;

  factory _Category.fromJson(Map<String, dynamic> json) =
      _$CategoryImpl.fromJson;

  @override
  @JsonKey(fromJson: _parseInt)
  int get id;
  @override
  @JsonKey(name: 'user_id')
  String? get userId;
  @override
  @JsonKey(name: 'parent_id')
  String? get parentId;
  @override
  @JsonKey(fromJson: _parseString)
  String get name;
  @override
  String? get slug;
  @override
  String? get description;
  @override
  List<String>? get features;
  @override
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
  @JsonKey(fromJson: _parseInt)
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'brand_id', fromJson: _parseInt)
  int? get brandId => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _parseString)
  String get name => throw _privateConstructorUsedError;
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
      {@JsonKey(fromJson: _parseInt) int id,
      @JsonKey(name: 'brand_id', fromJson: _parseInt) int? brandId,
      @JsonKey(fromJson: _parseString) String name,
      String? slug,
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
    Object? name = null,
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
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
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
      {@JsonKey(fromJson: _parseInt) int id,
      @JsonKey(name: 'brand_id', fromJson: _parseInt) int? brandId,
      @JsonKey(fromJson: _parseString) String name,
      String? slug,
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
    Object? name = null,
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
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
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
class _$BrandModelImpl with DiagnosticableTreeMixin implements _BrandModel {
  const _$BrandModelImpl(
      {@JsonKey(fromJson: _parseInt) required this.id,
      @JsonKey(name: 'brand_id', fromJson: _parseInt) this.brandId,
      @JsonKey(fromJson: _parseString) required this.name,
      this.slug,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt});

  factory _$BrandModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BrandModelImplFromJson(json);

  @override
  @JsonKey(fromJson: _parseInt)
  final int id;
  @override
  @JsonKey(name: 'brand_id', fromJson: _parseInt)
  final int? brandId;
  @override
  @JsonKey(fromJson: _parseString)
  final String name;
  @override
  final String? slug;
  @override
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final String? updatedAt;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BrandModel(id: $id, brandId: $brandId, name: $name, slug: $slug, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BrandModel'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('brandId', brandId))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('slug', slug))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('updatedAt', updatedAt));
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
      {@JsonKey(fromJson: _parseInt) required final int id,
      @JsonKey(name: 'brand_id', fromJson: _parseInt) final int? brandId,
      @JsonKey(fromJson: _parseString) required final String name,
      final String? slug,
      @JsonKey(name: 'created_at') final String? createdAt,
      @JsonKey(name: 'updated_at') final String? updatedAt}) = _$BrandModelImpl;

  factory _BrandModel.fromJson(Map<String, dynamic> json) =
      _$BrandModelImpl.fromJson;

  @override
  @JsonKey(fromJson: _parseInt)
  int get id;
  @override
  @JsonKey(name: 'brand_id', fromJson: _parseInt)
  int? get brandId;
  @override
  @JsonKey(fromJson: _parseString)
  String get name;
  @override
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

PaginationLinks _$PaginationLinksFromJson(Map<String, dynamic> json) {
  return _PaginationLinks.fromJson(json);
}

/// @nodoc
mixin _$PaginationLinks {
  String? get first => throw _privateConstructorUsedError;
  String? get last => throw _privateConstructorUsedError;
  String? get prev => throw _privateConstructorUsedError;
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
  $Res call({String? first, String? last, String? prev, String? next});
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
  $Res call({String? first, String? last, String? prev, String? next});
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
class _$PaginationLinksImpl
    with DiagnosticableTreeMixin
    implements _PaginationLinks {
  const _$PaginationLinksImpl({this.first, this.last, this.prev, this.next});

  factory _$PaginationLinksImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaginationLinksImplFromJson(json);

  @override
  final String? first;
  @override
  final String? last;
  @override
  final String? prev;
  @override
  final String? next;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PaginationLinks(first: $first, last: $last, prev: $prev, next: $next)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PaginationLinks'))
      ..add(DiagnosticsProperty('first', first))
      ..add(DiagnosticsProperty('last', last))
      ..add(DiagnosticsProperty('prev', prev))
      ..add(DiagnosticsProperty('next', next));
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
      {final String? first,
      final String? last,
      final String? prev,
      final String? next}) = _$PaginationLinksImpl;

  factory _PaginationLinks.fromJson(Map<String, dynamic> json) =
      _$PaginationLinksImpl.fromJson;

  @override
  String? get first;
  @override
  String? get last;
  @override
  String? get prev;
  @override
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
  @JsonKey(fromJson: _parseInt)
  int? get from => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_page', fromJson: _parseInt)
  int? get lastPage => throw _privateConstructorUsedError;
  List<PaginationMetaLink>? get links => throw _privateConstructorUsedError;
  String? get path => throw _privateConstructorUsedError;
  @JsonKey(name: 'per_page', fromJson: _parseInt)
  int? get perPage => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _parseInt)
  int? get to => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _parseInt)
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
      {@JsonKey(name: 'current_page', fromJson: _parseInt) int currentPage,
      @JsonKey(fromJson: _parseInt) int? from,
      @JsonKey(name: 'last_page', fromJson: _parseInt) int? lastPage,
      List<PaginationMetaLink>? links,
      String? path,
      @JsonKey(name: 'per_page', fromJson: _parseInt) int? perPage,
      @JsonKey(fromJson: _parseInt) int? to,
      @JsonKey(fromJson: _parseInt) int? total});
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
    Object? lastPage = freezed,
    Object? links = freezed,
    Object? path = freezed,
    Object? perPage = freezed,
    Object? to = freezed,
    Object? total = freezed,
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
      lastPage: freezed == lastPage
          ? _value.lastPage
          : lastPage // ignore: cast_nullable_to_non_nullable
              as int?,
      links: freezed == links
          ? _value.links
          : links // ignore: cast_nullable_to_non_nullable
              as List<PaginationMetaLink>?,
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
      {@JsonKey(name: 'current_page', fromJson: _parseInt) int currentPage,
      @JsonKey(fromJson: _parseInt) int? from,
      @JsonKey(name: 'last_page', fromJson: _parseInt) int? lastPage,
      List<PaginationMetaLink>? links,
      String? path,
      @JsonKey(name: 'per_page', fromJson: _parseInt) int? perPage,
      @JsonKey(fromJson: _parseInt) int? to,
      @JsonKey(fromJson: _parseInt) int? total});
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
    Object? lastPage = freezed,
    Object? links = freezed,
    Object? path = freezed,
    Object? perPage = freezed,
    Object? to = freezed,
    Object? total = freezed,
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
      lastPage: freezed == lastPage
          ? _value.lastPage
          : lastPage // ignore: cast_nullable_to_non_nullable
              as int?,
      links: freezed == links
          ? _value._links
          : links // ignore: cast_nullable_to_non_nullable
              as List<PaginationMetaLink>?,
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
class _$PaginationMetaImpl
    with DiagnosticableTreeMixin
    implements _PaginationMeta {
  const _$PaginationMetaImpl(
      {@JsonKey(name: 'current_page', fromJson: _parseInt)
      required this.currentPage,
      @JsonKey(fromJson: _parseInt) this.from,
      @JsonKey(name: 'last_page', fromJson: _parseInt) this.lastPage,
      final List<PaginationMetaLink>? links,
      this.path,
      @JsonKey(name: 'per_page', fromJson: _parseInt) this.perPage,
      @JsonKey(fromJson: _parseInt) this.to,
      @JsonKey(fromJson: _parseInt) this.total})
      : _links = links;

  factory _$PaginationMetaImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaginationMetaImplFromJson(json);

  @override
  @JsonKey(name: 'current_page', fromJson: _parseInt)
  final int currentPage;
  @override
  @JsonKey(fromJson: _parseInt)
  final int? from;
  @override
  @JsonKey(name: 'last_page', fromJson: _parseInt)
  final int? lastPage;
  final List<PaginationMetaLink>? _links;
  @override
  List<PaginationMetaLink>? get links {
    final value = _links;
    if (value == null) return null;
    if (_links is EqualUnmodifiableListView) return _links;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? path;
  @override
  @JsonKey(name: 'per_page', fromJson: _parseInt)
  final int? perPage;
  @override
  @JsonKey(fromJson: _parseInt)
  final int? to;
  @override
  @JsonKey(fromJson: _parseInt)
  final int? total;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PaginationMeta(currentPage: $currentPage, from: $from, lastPage: $lastPage, links: $links, path: $path, perPage: $perPage, to: $to, total: $total)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PaginationMeta'))
      ..add(DiagnosticsProperty('currentPage', currentPage))
      ..add(DiagnosticsProperty('from', from))
      ..add(DiagnosticsProperty('lastPage', lastPage))
      ..add(DiagnosticsProperty('links', links))
      ..add(DiagnosticsProperty('path', path))
      ..add(DiagnosticsProperty('perPage', perPage))
      ..add(DiagnosticsProperty('to', to))
      ..add(DiagnosticsProperty('total', total));
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
      @JsonKey(fromJson: _parseInt) final int? from,
      @JsonKey(name: 'last_page', fromJson: _parseInt) final int? lastPage,
      final List<PaginationMetaLink>? links,
      final String? path,
      @JsonKey(name: 'per_page', fromJson: _parseInt) final int? perPage,
      @JsonKey(fromJson: _parseInt) final int? to,
      @JsonKey(fromJson: _parseInt) final int? total}) = _$PaginationMetaImpl;

  factory _PaginationMeta.fromJson(Map<String, dynamic> json) =
      _$PaginationMetaImpl.fromJson;

  @override
  @JsonKey(name: 'current_page', fromJson: _parseInt)
  int get currentPage;
  @override
  @JsonKey(fromJson: _parseInt)
  int? get from;
  @override
  @JsonKey(name: 'last_page', fromJson: _parseInt)
  int? get lastPage;
  @override
  List<PaginationMetaLink>? get links;
  @override
  String? get path;
  @override
  @JsonKey(name: 'per_page', fromJson: _parseInt)
  int? get perPage;
  @override
  @JsonKey(fromJson: _parseInt)
  int? get to;
  @override
  @JsonKey(fromJson: _parseInt)
  int? get total;

  /// Create a copy of PaginationMeta
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaginationMetaImplCopyWith<_$PaginationMetaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PaginationMetaLink _$PaginationMetaLinkFromJson(Map<String, dynamic> json) {
  return _PaginationMetaLink.fromJson(json);
}

/// @nodoc
mixin _$PaginationMetaLink {
  String? get url => throw _privateConstructorUsedError;
  String? get label => throw _privateConstructorUsedError;
  bool? get active => throw _privateConstructorUsedError;

  /// Serializes this PaginationMetaLink to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaginationMetaLink
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaginationMetaLinkCopyWith<PaginationMetaLink> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginationMetaLinkCopyWith<$Res> {
  factory $PaginationMetaLinkCopyWith(
          PaginationMetaLink value, $Res Function(PaginationMetaLink) then) =
      _$PaginationMetaLinkCopyWithImpl<$Res, PaginationMetaLink>;
  @useResult
  $Res call({String? url, String? label, bool? active});
}

/// @nodoc
class _$PaginationMetaLinkCopyWithImpl<$Res, $Val extends PaginationMetaLink>
    implements $PaginationMetaLinkCopyWith<$Res> {
  _$PaginationMetaLinkCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaginationMetaLink
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
abstract class _$$PaginationMetaLinkImplCopyWith<$Res>
    implements $PaginationMetaLinkCopyWith<$Res> {
  factory _$$PaginationMetaLinkImplCopyWith(_$PaginationMetaLinkImpl value,
          $Res Function(_$PaginationMetaLinkImpl) then) =
      __$$PaginationMetaLinkImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? url, String? label, bool? active});
}

/// @nodoc
class __$$PaginationMetaLinkImplCopyWithImpl<$Res>
    extends _$PaginationMetaLinkCopyWithImpl<$Res, _$PaginationMetaLinkImpl>
    implements _$$PaginationMetaLinkImplCopyWith<$Res> {
  __$$PaginationMetaLinkImplCopyWithImpl(_$PaginationMetaLinkImpl _value,
      $Res Function(_$PaginationMetaLinkImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaginationMetaLink
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = freezed,
    Object? label = freezed,
    Object? active = freezed,
  }) {
    return _then(_$PaginationMetaLinkImpl(
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
class _$PaginationMetaLinkImpl
    with DiagnosticableTreeMixin
    implements _PaginationMetaLink {
  const _$PaginationMetaLinkImpl({this.url, this.label, this.active});

  factory _$PaginationMetaLinkImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaginationMetaLinkImplFromJson(json);

  @override
  final String? url;
  @override
  final String? label;
  @override
  final bool? active;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PaginationMetaLink(url: $url, label: $label, active: $active)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PaginationMetaLink'))
      ..add(DiagnosticsProperty('url', url))
      ..add(DiagnosticsProperty('label', label))
      ..add(DiagnosticsProperty('active', active));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaginationMetaLinkImpl &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.active, active) || other.active == active));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, url, label, active);

  /// Create a copy of PaginationMetaLink
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaginationMetaLinkImplCopyWith<_$PaginationMetaLinkImpl> get copyWith =>
      __$$PaginationMetaLinkImplCopyWithImpl<_$PaginationMetaLinkImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaginationMetaLinkImplToJson(
      this,
    );
  }
}

abstract class _PaginationMetaLink implements PaginationMetaLink {
  const factory _PaginationMetaLink(
      {final String? url,
      final String? label,
      final bool? active}) = _$PaginationMetaLinkImpl;

  factory _PaginationMetaLink.fromJson(Map<String, dynamic> json) =
      _$PaginationMetaLinkImpl.fromJson;

  @override
  String? get url;
  @override
  String? get label;
  @override
  bool? get active;

  /// Create a copy of PaginationMetaLink
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaginationMetaLinkImplCopyWith<_$PaginationMetaLinkImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
