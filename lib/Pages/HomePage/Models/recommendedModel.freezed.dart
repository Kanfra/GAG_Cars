// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recommendedModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Recommended _$RecommendedFromJson(Map<String, dynamic> json) {
  return _Recommended.fromJson(json);
}

/// @nodoc
mixin _$Recommended {
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
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this Recommended to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Recommended
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RecommendedCopyWith<Recommended> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecommendedCopyWith<$Res> {
  factory $RecommendedCopyWith(
          Recommended value, $Res Function(Recommended) then) =
      _$RecommendedCopyWithImpl<$Res, Recommended>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'user_id') String userId,
      @JsonKey(name: 'item_id') String itemId,
      @JsonKey(name: 'start_at') String startAt,
      @JsonKey(name: 'end_at') String endAt,
      String status,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt});
}

/// @nodoc
class _$RecommendedCopyWithImpl<$Res, $Val extends Recommended>
    implements $RecommendedCopyWith<$Res> {
  _$RecommendedCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Recommended
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
abstract class _$$RecommendedImplCopyWith<$Res>
    implements $RecommendedCopyWith<$Res> {
  factory _$$RecommendedImplCopyWith(
          _$RecommendedImpl value, $Res Function(_$RecommendedImpl) then) =
      __$$RecommendedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'user_id') String userId,
      @JsonKey(name: 'item_id') String itemId,
      @JsonKey(name: 'start_at') String startAt,
      @JsonKey(name: 'end_at') String endAt,
      String status,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt});
}

/// @nodoc
class __$$RecommendedImplCopyWithImpl<$Res>
    extends _$RecommendedCopyWithImpl<$Res, _$RecommendedImpl>
    implements _$$RecommendedImplCopyWith<$Res> {
  __$$RecommendedImplCopyWithImpl(
      _$RecommendedImpl _value, $Res Function(_$RecommendedImpl) _then)
      : super(_value, _then);

  /// Create a copy of Recommended
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
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$RecommendedImpl(
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
class _$RecommendedImpl with DiagnosticableTreeMixin implements _Recommended {
  const _$RecommendedImpl(
      {required this.id,
      @JsonKey(name: 'user_id') required this.userId,
      @JsonKey(name: 'item_id') required this.itemId,
      @JsonKey(name: 'start_at') required this.startAt,
      @JsonKey(name: 'end_at') required this.endAt,
      required this.status,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') required this.updatedAt});

  factory _$RecommendedImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecommendedImplFromJson(json);

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
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Recommended(id: $id, userId: $userId, itemId: $itemId, startAt: $startAt, endAt: $endAt, status: $status, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Recommended'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('userId', userId))
      ..add(DiagnosticsProperty('itemId', itemId))
      ..add(DiagnosticsProperty('startAt', startAt))
      ..add(DiagnosticsProperty('endAt', endAt))
      ..add(DiagnosticsProperty('status', status))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('updatedAt', updatedAt));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecommendedImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.itemId, itemId) || other.itemId == itemId) &&
            (identical(other.startAt, startAt) || other.startAt == startAt) &&
            (identical(other.endAt, endAt) || other.endAt == endAt) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, userId, itemId, startAt,
      endAt, status, createdAt, updatedAt);

  /// Create a copy of Recommended
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RecommendedImplCopyWith<_$RecommendedImpl> get copyWith =>
      __$$RecommendedImplCopyWithImpl<_$RecommendedImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RecommendedImplToJson(
      this,
    );
  }
}

abstract class _Recommended implements Recommended {
  const factory _Recommended(
          {required final int id,
          @JsonKey(name: 'user_id') required final String userId,
          @JsonKey(name: 'item_id') required final String itemId,
          @JsonKey(name: 'start_at') required final String startAt,
          @JsonKey(name: 'end_at') required final String endAt,
          required final String status,
          @JsonKey(name: 'created_at') required final DateTime createdAt,
          @JsonKey(name: 'updated_at') required final DateTime updatedAt}) =
      _$RecommendedImpl;

  factory _Recommended.fromJson(Map<String, dynamic> json) =
      _$RecommendedImpl.fromJson;

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
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt;

  /// Create a copy of Recommended
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecommendedImplCopyWith<_$RecommendedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RecommendedResponse _$RecommendedResponseFromJson(Map<String, dynamic> json) {
  return _RecommendedResponse.fromJson(json);
}

/// @nodoc
mixin _$RecommendedResponse {
  List<Recommended> get data => throw _privateConstructorUsedError;

  /// Serializes this RecommendedResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RecommendedResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RecommendedResponseCopyWith<RecommendedResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecommendedResponseCopyWith<$Res> {
  factory $RecommendedResponseCopyWith(
          RecommendedResponse value, $Res Function(RecommendedResponse) then) =
      _$RecommendedResponseCopyWithImpl<$Res, RecommendedResponse>;
  @useResult
  $Res call({List<Recommended> data});
}

/// @nodoc
class _$RecommendedResponseCopyWithImpl<$Res, $Val extends RecommendedResponse>
    implements $RecommendedResponseCopyWith<$Res> {
  _$RecommendedResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RecommendedResponse
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
              as List<Recommended>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RecommendedResponseImplCopyWith<$Res>
    implements $RecommendedResponseCopyWith<$Res> {
  factory _$$RecommendedResponseImplCopyWith(_$RecommendedResponseImpl value,
          $Res Function(_$RecommendedResponseImpl) then) =
      __$$RecommendedResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Recommended> data});
}

/// @nodoc
class __$$RecommendedResponseImplCopyWithImpl<$Res>
    extends _$RecommendedResponseCopyWithImpl<$Res, _$RecommendedResponseImpl>
    implements _$$RecommendedResponseImplCopyWith<$Res> {
  __$$RecommendedResponseImplCopyWithImpl(_$RecommendedResponseImpl _value,
      $Res Function(_$RecommendedResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of RecommendedResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$RecommendedResponseImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Recommended>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RecommendedResponseImpl
    with DiagnosticableTreeMixin
    implements _RecommendedResponse {
  const _$RecommendedResponseImpl({required final List<Recommended> data})
      : _data = data;

  factory _$RecommendedResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecommendedResponseImplFromJson(json);

  final List<Recommended> _data;
  @override
  List<Recommended> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RecommendedResponse(data: $data)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RecommendedResponse'))
      ..add(DiagnosticsProperty('data', data));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecommendedResponseImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  /// Create a copy of RecommendedResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RecommendedResponseImplCopyWith<_$RecommendedResponseImpl> get copyWith =>
      __$$RecommendedResponseImplCopyWithImpl<_$RecommendedResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RecommendedResponseImplToJson(
      this,
    );
  }
}

abstract class _RecommendedResponse implements RecommendedResponse {
  const factory _RecommendedResponse({required final List<Recommended> data}) =
      _$RecommendedResponseImpl;

  factory _RecommendedResponse.fromJson(Map<String, dynamic> json) =
      _$RecommendedResponseImpl.fromJson;

  @override
  List<Recommended> get data;

  /// Create a copy of RecommendedResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecommendedResponseImplCopyWith<_$RecommendedResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
