// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trendingMakeModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TrendingMake _$TrendingMakeFromJson(Map<String, dynamic> json) {
  return _TrendingMake.fromJson(json);
}

/// @nodoc
mixin _$TrendingMake {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  String get userId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get slug => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this TrendingMake to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TrendingMake
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TrendingMakeCopyWith<TrendingMake> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TrendingMakeCopyWith<$Res> {
  factory $TrendingMakeCopyWith(
          TrendingMake value, $Res Function(TrendingMake) then) =
      _$TrendingMakeCopyWithImpl<$Res, TrendingMake>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'user_id') String userId,
      String name,
      String slug,
      String image,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt});
}

/// @nodoc
class _$TrendingMakeCopyWithImpl<$Res, $Val extends TrendingMake>
    implements $TrendingMakeCopyWith<$Res> {
  _$TrendingMakeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TrendingMake
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? name = null,
    Object? slug = null,
    Object? image = null,
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
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      slug: null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
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
abstract class _$$TrendingMakeImplCopyWith<$Res>
    implements $TrendingMakeCopyWith<$Res> {
  factory _$$TrendingMakeImplCopyWith(
          _$TrendingMakeImpl value, $Res Function(_$TrendingMakeImpl) then) =
      __$$TrendingMakeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'user_id') String userId,
      String name,
      String slug,
      String image,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt});
}

/// @nodoc
class __$$TrendingMakeImplCopyWithImpl<$Res>
    extends _$TrendingMakeCopyWithImpl<$Res, _$TrendingMakeImpl>
    implements _$$TrendingMakeImplCopyWith<$Res> {
  __$$TrendingMakeImplCopyWithImpl(
      _$TrendingMakeImpl _value, $Res Function(_$TrendingMakeImpl) _then)
      : super(_value, _then);

  /// Create a copy of TrendingMake
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? name = null,
    Object? slug = null,
    Object? image = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$TrendingMakeImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      slug: null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
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
class _$TrendingMakeImpl with DiagnosticableTreeMixin implements _TrendingMake {
  const _$TrendingMakeImpl(
      {required this.id,
      @JsonKey(name: 'user_id') required this.userId,
      required this.name,
      required this.slug,
      required this.image,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') required this.updatedAt});

  factory _$TrendingMakeImpl.fromJson(Map<String, dynamic> json) =>
      _$$TrendingMakeImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'user_id')
  final String userId;
  @override
  final String name;
  @override
  final String slug;
  @override
  final String image;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TrendingMake(id: $id, userId: $userId, name: $name, slug: $slug, image: $image, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TrendingMake'))
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
            other is _$TrendingMakeImpl &&
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

  /// Create a copy of TrendingMake
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TrendingMakeImplCopyWith<_$TrendingMakeImpl> get copyWith =>
      __$$TrendingMakeImplCopyWithImpl<_$TrendingMakeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TrendingMakeImplToJson(
      this,
    );
  }
}

abstract class _TrendingMake implements TrendingMake {
  const factory _TrendingMake(
          {required final int id,
          @JsonKey(name: 'user_id') required final String userId,
          required final String name,
          required final String slug,
          required final String image,
          @JsonKey(name: 'created_at') required final DateTime createdAt,
          @JsonKey(name: 'updated_at') required final DateTime updatedAt}) =
      _$TrendingMakeImpl;

  factory _TrendingMake.fromJson(Map<String, dynamic> json) =
      _$TrendingMakeImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'user_id')
  String get userId;
  @override
  String get name;
  @override
  String get slug;
  @override
  String get image;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt;

  /// Create a copy of TrendingMake
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TrendingMakeImplCopyWith<_$TrendingMakeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TrendingMakeResponse _$TrendingMakeResponseFromJson(Map<String, dynamic> json) {
  return _TrendingMakeResponse.fromJson(json);
}

/// @nodoc
mixin _$TrendingMakeResponse {
  Map<String, dynamic> get json => throw _privateConstructorUsedError;
  List<TrendingMake> get data => throw _privateConstructorUsedError;

  /// Serializes this TrendingMakeResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TrendingMakeResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TrendingMakeResponseCopyWith<TrendingMakeResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TrendingMakeResponseCopyWith<$Res> {
  factory $TrendingMakeResponseCopyWith(TrendingMakeResponse value,
          $Res Function(TrendingMakeResponse) then) =
      _$TrendingMakeResponseCopyWithImpl<$Res, TrendingMakeResponse>;
  @useResult
  $Res call({Map<String, dynamic> json, List<TrendingMake> data});
}

/// @nodoc
class _$TrendingMakeResponseCopyWithImpl<$Res,
        $Val extends TrendingMakeResponse>
    implements $TrendingMakeResponseCopyWith<$Res> {
  _$TrendingMakeResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TrendingMakeResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? json = null,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      json: null == json
          ? _value.json
          : json // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<TrendingMake>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TrendingMakeResponseImplCopyWith<$Res>
    implements $TrendingMakeResponseCopyWith<$Res> {
  factory _$$TrendingMakeResponseImplCopyWith(_$TrendingMakeResponseImpl value,
          $Res Function(_$TrendingMakeResponseImpl) then) =
      __$$TrendingMakeResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Map<String, dynamic> json, List<TrendingMake> data});
}

/// @nodoc
class __$$TrendingMakeResponseImplCopyWithImpl<$Res>
    extends _$TrendingMakeResponseCopyWithImpl<$Res, _$TrendingMakeResponseImpl>
    implements _$$TrendingMakeResponseImplCopyWith<$Res> {
  __$$TrendingMakeResponseImplCopyWithImpl(_$TrendingMakeResponseImpl _value,
      $Res Function(_$TrendingMakeResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of TrendingMakeResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? json = null,
    Object? data = null,
  }) {
    return _then(_$TrendingMakeResponseImpl(
      null == json
          ? _value._json
          : json // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<TrendingMake>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TrendingMakeResponseImpl
    with DiagnosticableTreeMixin
    implements _TrendingMakeResponse {
  const _$TrendingMakeResponseImpl(final Map<String, dynamic> json,
      {required final List<TrendingMake> data})
      : _json = json,
        _data = data;

  factory _$TrendingMakeResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$TrendingMakeResponseImplFromJson(json);

  final Map<String, dynamic> _json;
  @override
  Map<String, dynamic> get json {
    if (_json is EqualUnmodifiableMapView) return _json;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_json);
  }

  final List<TrendingMake> _data;
  @override
  List<TrendingMake> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TrendingMakeResponse(json: $json, data: $data)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TrendingMakeResponse'))
      ..add(DiagnosticsProperty('json', json))
      ..add(DiagnosticsProperty('data', data));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TrendingMakeResponseImpl &&
            const DeepCollectionEquality().equals(other._json, _json) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_json),
      const DeepCollectionEquality().hash(_data));

  /// Create a copy of TrendingMakeResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TrendingMakeResponseImplCopyWith<_$TrendingMakeResponseImpl>
      get copyWith =>
          __$$TrendingMakeResponseImplCopyWithImpl<_$TrendingMakeResponseImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TrendingMakeResponseImplToJson(
      this,
    );
  }
}

abstract class _TrendingMakeResponse implements TrendingMakeResponse {
  const factory _TrendingMakeResponse(final Map<String, dynamic> json,
      {required final List<TrendingMake> data}) = _$TrendingMakeResponseImpl;

  factory _TrendingMakeResponse.fromJson(Map<String, dynamic> json) =
      _$TrendingMakeResponseImpl.fromJson;

  @override
  Map<String, dynamic> get json;
  @override
  List<TrendingMake> get data;

  /// Create a copy of TrendingMakeResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TrendingMakeResponseImplCopyWith<_$TrendingMakeResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
