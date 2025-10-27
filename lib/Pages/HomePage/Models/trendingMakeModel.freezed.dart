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
  @JsonKey(fromJson: _safeParseInt)
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id', fromJson: _safeParseString)
  String? get userId => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _safeParseStringWithDefault)
  String get name => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _safeParseStringWithDefault)
  String get slug => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _safeParseStringWithDefault)
  String get image => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at', fromJson: _safeParseStringWithDefault)
  String get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at', fromJson: _safeParseStringWithDefault)
  String get updatedAt => throw _privateConstructorUsedError;

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
      {@JsonKey(fromJson: _safeParseInt) int id,
      @JsonKey(name: 'user_id', fromJson: _safeParseString) String? userId,
      @JsonKey(fromJson: _safeParseStringWithDefault) String name,
      @JsonKey(fromJson: _safeParseStringWithDefault) String slug,
      @JsonKey(fromJson: _safeParseStringWithDefault) String image,
      @JsonKey(name: 'created_at', fromJson: _safeParseStringWithDefault)
      String createdAt,
      @JsonKey(name: 'updated_at', fromJson: _safeParseStringWithDefault)
      String updatedAt});
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
    Object? userId = freezed,
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
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
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
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
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
      {@JsonKey(fromJson: _safeParseInt) int id,
      @JsonKey(name: 'user_id', fromJson: _safeParseString) String? userId,
      @JsonKey(fromJson: _safeParseStringWithDefault) String name,
      @JsonKey(fromJson: _safeParseStringWithDefault) String slug,
      @JsonKey(fromJson: _safeParseStringWithDefault) String image,
      @JsonKey(name: 'created_at', fromJson: _safeParseStringWithDefault)
      String createdAt,
      @JsonKey(name: 'updated_at', fromJson: _safeParseStringWithDefault)
      String updatedAt});
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
    Object? userId = freezed,
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
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
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
class _$TrendingMakeImpl with DiagnosticableTreeMixin implements _TrendingMake {
  const _$TrendingMakeImpl(
      {@JsonKey(fromJson: _safeParseInt) required this.id,
      @JsonKey(name: 'user_id', fromJson: _safeParseString) this.userId,
      @JsonKey(fromJson: _safeParseStringWithDefault) required this.name,
      @JsonKey(fromJson: _safeParseStringWithDefault) required this.slug,
      @JsonKey(fromJson: _safeParseStringWithDefault) required this.image,
      @JsonKey(name: 'created_at', fromJson: _safeParseStringWithDefault)
      required this.createdAt,
      @JsonKey(name: 'updated_at', fromJson: _safeParseStringWithDefault)
      required this.updatedAt});

  factory _$TrendingMakeImpl.fromJson(Map<String, dynamic> json) =>
      _$$TrendingMakeImplFromJson(json);

  @override
  @JsonKey(fromJson: _safeParseInt)
  final int id;
  @override
  @JsonKey(name: 'user_id', fromJson: _safeParseString)
  final String? userId;
  @override
  @JsonKey(fromJson: _safeParseStringWithDefault)
  final String name;
  @override
  @JsonKey(fromJson: _safeParseStringWithDefault)
  final String slug;
  @override
  @JsonKey(fromJson: _safeParseStringWithDefault)
  final String image;
  @override
  @JsonKey(name: 'created_at', fromJson: _safeParseStringWithDefault)
  final String createdAt;
  @override
  @JsonKey(name: 'updated_at', fromJson: _safeParseStringWithDefault)
  final String updatedAt;

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
      {@JsonKey(fromJson: _safeParseInt) required final int id,
      @JsonKey(name: 'user_id', fromJson: _safeParseString)
      final String? userId,
      @JsonKey(fromJson: _safeParseStringWithDefault)
      required final String name,
      @JsonKey(fromJson: _safeParseStringWithDefault)
      required final String slug,
      @JsonKey(fromJson: _safeParseStringWithDefault)
      required final String image,
      @JsonKey(name: 'created_at', fromJson: _safeParseStringWithDefault)
      required final String createdAt,
      @JsonKey(name: 'updated_at', fromJson: _safeParseStringWithDefault)
      required final String updatedAt}) = _$TrendingMakeImpl;

  factory _TrendingMake.fromJson(Map<String, dynamic> json) =
      _$TrendingMakeImpl.fromJson;

  @override
  @JsonKey(fromJson: _safeParseInt)
  int get id;
  @override
  @JsonKey(name: 'user_id', fromJson: _safeParseString)
  String? get userId;
  @override
  @JsonKey(fromJson: _safeParseStringWithDefault)
  String get name;
  @override
  @JsonKey(fromJson: _safeParseStringWithDefault)
  String get slug;
  @override
  @JsonKey(fromJson: _safeParseStringWithDefault)
  String get image;
  @override
  @JsonKey(name: 'created_at', fromJson: _safeParseStringWithDefault)
  String get createdAt;
  @override
  @JsonKey(name: 'updated_at', fromJson: _safeParseStringWithDefault)
  String get updatedAt;

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
  @JsonKey(fromJson: _safeParseTrendingMakeList)
  List<TrendingMake> get data => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _safeParsePaginationLinks)
  PaginationLinks get links => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _safeParsePaginationMeta)
  PaginationMeta get meta => throw _privateConstructorUsedError;

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
  $Res call(
      {@JsonKey(fromJson: _safeParseTrendingMakeList) List<TrendingMake> data,
      @JsonKey(fromJson: _safeParsePaginationLinks) PaginationLinks links,
      @JsonKey(fromJson: _safeParsePaginationMeta) PaginationMeta meta});

  $PaginationLinksCopyWith<$Res> get links;
  $PaginationMetaCopyWith<$Res> get meta;
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
    Object? data = null,
    Object? links = null,
    Object? meta = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<TrendingMake>,
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

  /// Create a copy of TrendingMakeResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PaginationLinksCopyWith<$Res> get links {
    return $PaginationLinksCopyWith<$Res>(_value.links, (value) {
      return _then(_value.copyWith(links: value) as $Val);
    });
  }

  /// Create a copy of TrendingMakeResponse
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
abstract class _$$TrendingMakeResponseImplCopyWith<$Res>
    implements $TrendingMakeResponseCopyWith<$Res> {
  factory _$$TrendingMakeResponseImplCopyWith(_$TrendingMakeResponseImpl value,
          $Res Function(_$TrendingMakeResponseImpl) then) =
      __$$TrendingMakeResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(fromJson: _safeParseTrendingMakeList) List<TrendingMake> data,
      @JsonKey(fromJson: _safeParsePaginationLinks) PaginationLinks links,
      @JsonKey(fromJson: _safeParsePaginationMeta) PaginationMeta meta});

  @override
  $PaginationLinksCopyWith<$Res> get links;
  @override
  $PaginationMetaCopyWith<$Res> get meta;
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
    Object? data = null,
    Object? links = null,
    Object? meta = null,
  }) {
    return _then(_$TrendingMakeResponseImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<TrendingMake>,
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
class _$TrendingMakeResponseImpl
    with DiagnosticableTreeMixin
    implements _TrendingMakeResponse {
  const _$TrendingMakeResponseImpl(
      {@JsonKey(fromJson: _safeParseTrendingMakeList)
      required final List<TrendingMake> data,
      @JsonKey(fromJson: _safeParsePaginationLinks) required this.links,
      @JsonKey(fromJson: _safeParsePaginationMeta) required this.meta})
      : _data = data;

  factory _$TrendingMakeResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$TrendingMakeResponseImplFromJson(json);

  final List<TrendingMake> _data;
  @override
  @JsonKey(fromJson: _safeParseTrendingMakeList)
  List<TrendingMake> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  @JsonKey(fromJson: _safeParsePaginationLinks)
  final PaginationLinks links;
  @override
  @JsonKey(fromJson: _safeParsePaginationMeta)
  final PaginationMeta meta;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TrendingMakeResponse(data: $data, links: $links, meta: $meta)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TrendingMakeResponse'))
      ..add(DiagnosticsProperty('data', data))
      ..add(DiagnosticsProperty('links', links))
      ..add(DiagnosticsProperty('meta', meta));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TrendingMakeResponseImpl &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.links, links) || other.links == links) &&
            (identical(other.meta, meta) || other.meta == meta));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_data), links, meta);

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
  const factory _TrendingMakeResponse(
      {@JsonKey(fromJson: _safeParseTrendingMakeList)
      required final List<TrendingMake> data,
      @JsonKey(fromJson: _safeParsePaginationLinks)
      required final PaginationLinks links,
      @JsonKey(fromJson: _safeParsePaginationMeta)
      required final PaginationMeta meta}) = _$TrendingMakeResponseImpl;

  factory _TrendingMakeResponse.fromJson(Map<String, dynamic> json) =
      _$TrendingMakeResponseImpl.fromJson;

  @override
  @JsonKey(fromJson: _safeParseTrendingMakeList)
  List<TrendingMake> get data;
  @override
  @JsonKey(fromJson: _safeParsePaginationLinks)
  PaginationLinks get links;
  @override
  @JsonKey(fromJson: _safeParsePaginationMeta)
  PaginationMeta get meta;

  /// Create a copy of TrendingMakeResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TrendingMakeResponseImplCopyWith<_$TrendingMakeResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

PaginationLinks _$PaginationLinksFromJson(Map<String, dynamic> json) {
  return _PaginationLinks.fromJson(json);
}

/// @nodoc
mixin _$PaginationLinks {
  @JsonKey(fromJson: _safeParseStringWithDefault)
  String get first => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _safeParseStringWithDefault)
  String get last => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _safeParseString)
  String? get prev => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _safeParseString)
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
      {@JsonKey(fromJson: _safeParseStringWithDefault) String first,
      @JsonKey(fromJson: _safeParseStringWithDefault) String last,
      @JsonKey(fromJson: _safeParseString) String? prev,
      @JsonKey(fromJson: _safeParseString) String? next});
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
    Object? first = null,
    Object? last = null,
    Object? prev = freezed,
    Object? next = freezed,
  }) {
    return _then(_value.copyWith(
      first: null == first
          ? _value.first
          : first // ignore: cast_nullable_to_non_nullable
              as String,
      last: null == last
          ? _value.last
          : last // ignore: cast_nullable_to_non_nullable
              as String,
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
      {@JsonKey(fromJson: _safeParseStringWithDefault) String first,
      @JsonKey(fromJson: _safeParseStringWithDefault) String last,
      @JsonKey(fromJson: _safeParseString) String? prev,
      @JsonKey(fromJson: _safeParseString) String? next});
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
    Object? first = null,
    Object? last = null,
    Object? prev = freezed,
    Object? next = freezed,
  }) {
    return _then(_$PaginationLinksImpl(
      first: null == first
          ? _value.first
          : first // ignore: cast_nullable_to_non_nullable
              as String,
      last: null == last
          ? _value.last
          : last // ignore: cast_nullable_to_non_nullable
              as String,
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
  const _$PaginationLinksImpl(
      {@JsonKey(fromJson: _safeParseStringWithDefault) required this.first,
      @JsonKey(fromJson: _safeParseStringWithDefault) required this.last,
      @JsonKey(fromJson: _safeParseString) this.prev,
      @JsonKey(fromJson: _safeParseString) this.next});

  factory _$PaginationLinksImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaginationLinksImplFromJson(json);

  @override
  @JsonKey(fromJson: _safeParseStringWithDefault)
  final String first;
  @override
  @JsonKey(fromJson: _safeParseStringWithDefault)
  final String last;
  @override
  @JsonKey(fromJson: _safeParseString)
  final String? prev;
  @override
  @JsonKey(fromJson: _safeParseString)
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
          {@JsonKey(fromJson: _safeParseStringWithDefault)
          required final String first,
          @JsonKey(fromJson: _safeParseStringWithDefault)
          required final String last,
          @JsonKey(fromJson: _safeParseString) final String? prev,
          @JsonKey(fromJson: _safeParseString) final String? next}) =
      _$PaginationLinksImpl;

  factory _PaginationLinks.fromJson(Map<String, dynamic> json) =
      _$PaginationLinksImpl.fromJson;

  @override
  @JsonKey(fromJson: _safeParseStringWithDefault)
  String get first;
  @override
  @JsonKey(fromJson: _safeParseStringWithDefault)
  String get last;
  @override
  @JsonKey(fromJson: _safeParseString)
  String? get prev;
  @override
  @JsonKey(fromJson: _safeParseString)
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
  @JsonKey(name: 'current_page', fromJson: _safeParseIntWithDefault)
  int get currentPage => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _safeParseIntWithDefault)
  int get from => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_page', fromJson: _safeParseIntWithDefault)
  int get lastPage => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _safeParsePaginationMetaLinkList)
  List<PaginationMetaLink> get links => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _safeParseStringWithDefault)
  String get path => throw _privateConstructorUsedError;
  @JsonKey(name: 'per_page', fromJson: _safeParseIntWithDefault)
  int get perPage => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _safeParseIntWithDefault)
  int get to => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _safeParseIntWithDefault)
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
      {@JsonKey(name: 'current_page', fromJson: _safeParseIntWithDefault)
      int currentPage,
      @JsonKey(fromJson: _safeParseIntWithDefault) int from,
      @JsonKey(name: 'last_page', fromJson: _safeParseIntWithDefault)
      int lastPage,
      @JsonKey(fromJson: _safeParsePaginationMetaLinkList)
      List<PaginationMetaLink> links,
      @JsonKey(fromJson: _safeParseStringWithDefault) String path,
      @JsonKey(name: 'per_page', fromJson: _safeParseIntWithDefault)
      int perPage,
      @JsonKey(fromJson: _safeParseIntWithDefault) int to,
      @JsonKey(fromJson: _safeParseIntWithDefault) int total});
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
    Object? from = null,
    Object? lastPage = null,
    Object? links = null,
    Object? path = null,
    Object? perPage = null,
    Object? to = null,
    Object? total = null,
  }) {
    return _then(_value.copyWith(
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      from: null == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as int,
      lastPage: null == lastPage
          ? _value.lastPage
          : lastPage // ignore: cast_nullable_to_non_nullable
              as int,
      links: null == links
          ? _value.links
          : links // ignore: cast_nullable_to_non_nullable
              as List<PaginationMetaLink>,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      perPage: null == perPage
          ? _value.perPage
          : perPage // ignore: cast_nullable_to_non_nullable
              as int,
      to: null == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as int,
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
      {@JsonKey(name: 'current_page', fromJson: _safeParseIntWithDefault)
      int currentPage,
      @JsonKey(fromJson: _safeParseIntWithDefault) int from,
      @JsonKey(name: 'last_page', fromJson: _safeParseIntWithDefault)
      int lastPage,
      @JsonKey(fromJson: _safeParsePaginationMetaLinkList)
      List<PaginationMetaLink> links,
      @JsonKey(fromJson: _safeParseStringWithDefault) String path,
      @JsonKey(name: 'per_page', fromJson: _safeParseIntWithDefault)
      int perPage,
      @JsonKey(fromJson: _safeParseIntWithDefault) int to,
      @JsonKey(fromJson: _safeParseIntWithDefault) int total});
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
    Object? from = null,
    Object? lastPage = null,
    Object? links = null,
    Object? path = null,
    Object? perPage = null,
    Object? to = null,
    Object? total = null,
  }) {
    return _then(_$PaginationMetaImpl(
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      from: null == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as int,
      lastPage: null == lastPage
          ? _value.lastPage
          : lastPage // ignore: cast_nullable_to_non_nullable
              as int,
      links: null == links
          ? _value._links
          : links // ignore: cast_nullable_to_non_nullable
              as List<PaginationMetaLink>,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      perPage: null == perPage
          ? _value.perPage
          : perPage // ignore: cast_nullable_to_non_nullable
              as int,
      to: null == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaginationMetaImpl
    with DiagnosticableTreeMixin
    implements _PaginationMeta {
  const _$PaginationMetaImpl(
      {@JsonKey(name: 'current_page', fromJson: _safeParseIntWithDefault)
      required this.currentPage,
      @JsonKey(fromJson: _safeParseIntWithDefault) required this.from,
      @JsonKey(name: 'last_page', fromJson: _safeParseIntWithDefault)
      required this.lastPage,
      @JsonKey(fromJson: _safeParsePaginationMetaLinkList)
      required final List<PaginationMetaLink> links,
      @JsonKey(fromJson: _safeParseStringWithDefault) required this.path,
      @JsonKey(name: 'per_page', fromJson: _safeParseIntWithDefault)
      required this.perPage,
      @JsonKey(fromJson: _safeParseIntWithDefault) required this.to,
      @JsonKey(fromJson: _safeParseIntWithDefault) required this.total})
      : _links = links;

  factory _$PaginationMetaImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaginationMetaImplFromJson(json);

  @override
  @JsonKey(name: 'current_page', fromJson: _safeParseIntWithDefault)
  final int currentPage;
  @override
  @JsonKey(fromJson: _safeParseIntWithDefault)
  final int from;
  @override
  @JsonKey(name: 'last_page', fromJson: _safeParseIntWithDefault)
  final int lastPage;
  final List<PaginationMetaLink> _links;
  @override
  @JsonKey(fromJson: _safeParsePaginationMetaLinkList)
  List<PaginationMetaLink> get links {
    if (_links is EqualUnmodifiableListView) return _links;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_links);
  }

  @override
  @JsonKey(fromJson: _safeParseStringWithDefault)
  final String path;
  @override
  @JsonKey(name: 'per_page', fromJson: _safeParseIntWithDefault)
  final int perPage;
  @override
  @JsonKey(fromJson: _safeParseIntWithDefault)
  final int to;
  @override
  @JsonKey(fromJson: _safeParseIntWithDefault)
  final int total;

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
      {@JsonKey(name: 'current_page', fromJson: _safeParseIntWithDefault)
      required final int currentPage,
      @JsonKey(fromJson: _safeParseIntWithDefault) required final int from,
      @JsonKey(name: 'last_page', fromJson: _safeParseIntWithDefault)
      required final int lastPage,
      @JsonKey(fromJson: _safeParsePaginationMetaLinkList)
      required final List<PaginationMetaLink> links,
      @JsonKey(fromJson: _safeParseStringWithDefault)
      required final String path,
      @JsonKey(name: 'per_page', fromJson: _safeParseIntWithDefault)
      required final int perPage,
      @JsonKey(fromJson: _safeParseIntWithDefault) required final int to,
      @JsonKey(fromJson: _safeParseIntWithDefault)
      required final int total}) = _$PaginationMetaImpl;

  factory _PaginationMeta.fromJson(Map<String, dynamic> json) =
      _$PaginationMetaImpl.fromJson;

  @override
  @JsonKey(name: 'current_page', fromJson: _safeParseIntWithDefault)
  int get currentPage;
  @override
  @JsonKey(fromJson: _safeParseIntWithDefault)
  int get from;
  @override
  @JsonKey(name: 'last_page', fromJson: _safeParseIntWithDefault)
  int get lastPage;
  @override
  @JsonKey(fromJson: _safeParsePaginationMetaLinkList)
  List<PaginationMetaLink> get links;
  @override
  @JsonKey(fromJson: _safeParseStringWithDefault)
  String get path;
  @override
  @JsonKey(name: 'per_page', fromJson: _safeParseIntWithDefault)
  int get perPage;
  @override
  @JsonKey(fromJson: _safeParseIntWithDefault)
  int get to;
  @override
  @JsonKey(fromJson: _safeParseIntWithDefault)
  int get total;

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
  @JsonKey(fromJson: _safeParseString)
  String? get url => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _safeParseStringWithDefault)
  String get label => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _safeParseBoolWithDefault)
  bool get active => throw _privateConstructorUsedError;

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
  $Res call(
      {@JsonKey(fromJson: _safeParseString) String? url,
      @JsonKey(fromJson: _safeParseStringWithDefault) String label,
      @JsonKey(fromJson: _safeParseBoolWithDefault) bool active});
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
abstract class _$$PaginationMetaLinkImplCopyWith<$Res>
    implements $PaginationMetaLinkCopyWith<$Res> {
  factory _$$PaginationMetaLinkImplCopyWith(_$PaginationMetaLinkImpl value,
          $Res Function(_$PaginationMetaLinkImpl) then) =
      __$$PaginationMetaLinkImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(fromJson: _safeParseString) String? url,
      @JsonKey(fromJson: _safeParseStringWithDefault) String label,
      @JsonKey(fromJson: _safeParseBoolWithDefault) bool active});
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
    Object? label = null,
    Object? active = null,
  }) {
    return _then(_$PaginationMetaLinkImpl(
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
class _$PaginationMetaLinkImpl
    with DiagnosticableTreeMixin
    implements _PaginationMetaLink {
  const _$PaginationMetaLinkImpl(
      {@JsonKey(fromJson: _safeParseString) this.url,
      @JsonKey(fromJson: _safeParseStringWithDefault) required this.label,
      @JsonKey(fromJson: _safeParseBoolWithDefault) required this.active});

  factory _$PaginationMetaLinkImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaginationMetaLinkImplFromJson(json);

  @override
  @JsonKey(fromJson: _safeParseString)
  final String? url;
  @override
  @JsonKey(fromJson: _safeParseStringWithDefault)
  final String label;
  @override
  @JsonKey(fromJson: _safeParseBoolWithDefault)
  final bool active;

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
      {@JsonKey(fromJson: _safeParseString) final String? url,
      @JsonKey(fromJson: _safeParseStringWithDefault)
      required final String label,
      @JsonKey(fromJson: _safeParseBoolWithDefault)
      required final bool active}) = _$PaginationMetaLinkImpl;

  factory _PaginationMetaLink.fromJson(Map<String, dynamic> json) =
      _$PaginationMetaLinkImpl.fromJson;

  @override
  @JsonKey(fromJson: _safeParseString)
  String? get url;
  @override
  @JsonKey(fromJson: _safeParseStringWithDefault)
  String get label;
  @override
  @JsonKey(fromJson: _safeParseBoolWithDefault)
  bool get active;

  /// Create a copy of PaginationMetaLink
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaginationMetaLinkImplCopyWith<_$PaginationMetaLinkImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
