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

SpecialOffer _$SpecialOfferFromJson(Map<String, dynamic> json) {
  return _SpecialOffer.fromJson(json);
}

/// @nodoc
mixin _$SpecialOffer {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  String get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'item_id')
  String get itemId => throw _privateConstructorUsedError;
  @JsonKey(name: 'start_at')
  String get startAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'end_at')
  String get endAt => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  int get discount => throw _privateConstructorUsedError;
  @JsonKey(name: 'discount_type')
  String get discountType => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt => throw _privateConstructorUsedError;

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
      {int id,
      @JsonKey(name: 'user_id') String userId,
      @JsonKey(name: 'item_id') String itemId,
      @JsonKey(name: 'start_at') String startAt,
      @JsonKey(name: 'end_at') String endAt,
      String status,
      int discount,
      @JsonKey(name: 'discount_type') String discountType,
      String description,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt});
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
    Object? userId = null,
    Object? itemId = null,
    Object? startAt = null,
    Object? endAt = null,
    Object? status = null,
    Object? discount = null,
    Object? discountType = null,
    Object? description = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
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
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
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
abstract class _$$SpecialOfferImplCopyWith<$Res>
    implements $SpecialOfferCopyWith<$Res> {
  factory _$$SpecialOfferImplCopyWith(
          _$SpecialOfferImpl value, $Res Function(_$SpecialOfferImpl) then) =
      __$$SpecialOfferImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'user_id') String userId,
      @JsonKey(name: 'item_id') String itemId,
      @JsonKey(name: 'start_at') String startAt,
      @JsonKey(name: 'end_at') String endAt,
      String status,
      int discount,
      @JsonKey(name: 'discount_type') String discountType,
      String description,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt});
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
    Object? userId = null,
    Object? itemId = null,
    Object? startAt = null,
    Object? endAt = null,
    Object? status = null,
    Object? discount = null,
    Object? discountType = null,
    Object? description = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$SpecialOfferImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
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
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
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
class _$SpecialOfferImpl with DiagnosticableTreeMixin implements _SpecialOffer {
  const _$SpecialOfferImpl(
      {required this.id,
      @JsonKey(name: 'user_id') required this.userId,
      @JsonKey(name: 'item_id') required this.itemId,
      @JsonKey(name: 'start_at') required this.startAt,
      @JsonKey(name: 'end_at') required this.endAt,
      required this.status,
      required this.discount,
      @JsonKey(name: 'discount_type') required this.discountType,
      required this.description,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') required this.updatedAt});

  factory _$SpecialOfferImpl.fromJson(Map<String, dynamic> json) =>
      _$$SpecialOfferImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'user_id')
  final String userId;
  @override
  @JsonKey(name: 'item_id')
  final String itemId;
  @override
  @JsonKey(name: 'start_at')
  final String startAt;
  @override
  @JsonKey(name: 'end_at')
  final String endAt;
  @override
  final String status;
  @override
  final int discount;
  @override
  @JsonKey(name: 'discount_type')
  final String discountType;
  @override
  final String description;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SpecialOffer(id: $id, userId: $userId, itemId: $itemId, startAt: $startAt, endAt: $endAt, status: $status, discount: $discount, discountType: $discountType, description: $description, createdAt: $createdAt, updatedAt: $updatedAt)';
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
      ..add(DiagnosticsProperty('updatedAt', updatedAt));
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
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, userId, itemId, startAt,
      endAt, status, discount, discountType, description, createdAt, updatedAt);

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
          {required final int id,
          @JsonKey(name: 'user_id') required final String userId,
          @JsonKey(name: 'item_id') required final String itemId,
          @JsonKey(name: 'start_at') required final String startAt,
          @JsonKey(name: 'end_at') required final String endAt,
          required final String status,
          required final int discount,
          @JsonKey(name: 'discount_type') required final String discountType,
          required final String description,
          @JsonKey(name: 'created_at') required final DateTime createdAt,
          @JsonKey(name: 'updated_at') required final DateTime updatedAt}) =
      _$SpecialOfferImpl;

  factory _SpecialOffer.fromJson(Map<String, dynamic> json) =
      _$SpecialOfferImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'user_id')
  String get userId;
  @override
  @JsonKey(name: 'item_id')
  String get itemId;
  @override
  @JsonKey(name: 'start_at')
  String get startAt;
  @override
  @JsonKey(name: 'end_at')
  String get endAt;
  @override
  String get status;
  @override
  int get discount;
  @override
  @JsonKey(name: 'discount_type')
  String get discountType;
  @override
  String get description;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt;

  /// Create a copy of SpecialOffer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SpecialOfferImplCopyWith<_$SpecialOfferImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SpecialOfferResponse _$SpecialOfferResponseFromJson(Map<String, dynamic> json) {
  return _SpecialOfferResponse.fromJson(json);
}

/// @nodoc
mixin _$SpecialOfferResponse {
  List<SpecialOffer> get data => throw _privateConstructorUsedError;

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
  $Res call({List<SpecialOffer> data});
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
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<SpecialOffer>,
    ) as $Val);
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
  $Res call({List<SpecialOffer> data});
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
  }) {
    return _then(_$SpecialOfferResponseImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<SpecialOffer>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SpecialOfferResponseImpl
    with DiagnosticableTreeMixin
    implements _SpecialOfferResponse {
  const _$SpecialOfferResponseImpl({required final List<SpecialOffer> data})
      : _data = data;

  factory _$SpecialOfferResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$SpecialOfferResponseImplFromJson(json);

  final List<SpecialOffer> _data;
  @override
  List<SpecialOffer> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SpecialOfferResponse(data: $data)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SpecialOfferResponse'))
      ..add(DiagnosticsProperty('data', data));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SpecialOfferResponseImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

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
      {required final List<SpecialOffer> data}) = _$SpecialOfferResponseImpl;

  factory _SpecialOfferResponse.fromJson(Map<String, dynamic> json) =
      _$SpecialOfferResponseImpl.fromJson;

  @override
  List<SpecialOffer> get data;

  /// Create a copy of SpecialOfferResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SpecialOfferResponseImplCopyWith<_$SpecialOfferResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
