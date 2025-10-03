// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'categoriesModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

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
  int get current_page => throw _privateConstructorUsedError;
  int get from => throw _privateConstructorUsedError;
  int get last_page => throw _privateConstructorUsedError;
  String get path => throw _privateConstructorUsedError;
  int get per_page => throw _privateConstructorUsedError;
  int get to => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;
  List<dynamic> get links => throw _privateConstructorUsedError;

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
      {int current_page,
      int from,
      int last_page,
      String path,
      int per_page,
      int to,
      int total,
      List<dynamic> links});
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
    Object? current_page = null,
    Object? from = null,
    Object? last_page = null,
    Object? path = null,
    Object? per_page = null,
    Object? to = null,
    Object? total = null,
    Object? links = null,
  }) {
    return _then(_value.copyWith(
      current_page: null == current_page
          ? _value.current_page
          : current_page // ignore: cast_nullable_to_non_nullable
              as int,
      from: null == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as int,
      last_page: null == last_page
          ? _value.last_page
          : last_page // ignore: cast_nullable_to_non_nullable
              as int,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      per_page: null == per_page
          ? _value.per_page
          : per_page // ignore: cast_nullable_to_non_nullable
              as int,
      to: null == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      links: null == links
          ? _value.links
          : links // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
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
      {int current_page,
      int from,
      int last_page,
      String path,
      int per_page,
      int to,
      int total,
      List<dynamic> links});
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
    Object? current_page = null,
    Object? from = null,
    Object? last_page = null,
    Object? path = null,
    Object? per_page = null,
    Object? to = null,
    Object? total = null,
    Object? links = null,
  }) {
    return _then(_$PaginationMetaImpl(
      current_page: null == current_page
          ? _value.current_page
          : current_page // ignore: cast_nullable_to_non_nullable
              as int,
      from: null == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as int,
      last_page: null == last_page
          ? _value.last_page
          : last_page // ignore: cast_nullable_to_non_nullable
              as int,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      per_page: null == per_page
          ? _value.per_page
          : per_page // ignore: cast_nullable_to_non_nullable
              as int,
      to: null == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      links: null == links
          ? _value._links
          : links // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaginationMetaImpl
    with DiagnosticableTreeMixin
    implements _PaginationMeta {
  const _$PaginationMetaImpl(
      {required this.current_page,
      required this.from,
      required this.last_page,
      required this.path,
      required this.per_page,
      required this.to,
      required this.total,
      final List<dynamic> links = const []})
      : _links = links;

  factory _$PaginationMetaImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaginationMetaImplFromJson(json);

  @override
  final int current_page;
  @override
  final int from;
  @override
  final int last_page;
  @override
  final String path;
  @override
  final int per_page;
  @override
  final int to;
  @override
  final int total;
  final List<dynamic> _links;
  @override
  @JsonKey()
  List<dynamic> get links {
    if (_links is EqualUnmodifiableListView) return _links;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_links);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PaginationMeta(current_page: $current_page, from: $from, last_page: $last_page, path: $path, per_page: $per_page, to: $to, total: $total, links: $links)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PaginationMeta'))
      ..add(DiagnosticsProperty('current_page', current_page))
      ..add(DiagnosticsProperty('from', from))
      ..add(DiagnosticsProperty('last_page', last_page))
      ..add(DiagnosticsProperty('path', path))
      ..add(DiagnosticsProperty('per_page', per_page))
      ..add(DiagnosticsProperty('to', to))
      ..add(DiagnosticsProperty('total', total))
      ..add(DiagnosticsProperty('links', links));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaginationMetaImpl &&
            (identical(other.current_page, current_page) ||
                other.current_page == current_page) &&
            (identical(other.from, from) || other.from == from) &&
            (identical(other.last_page, last_page) ||
                other.last_page == last_page) &&
            (identical(other.path, path) || other.path == path) &&
            (identical(other.per_page, per_page) ||
                other.per_page == per_page) &&
            (identical(other.to, to) || other.to == to) &&
            (identical(other.total, total) || other.total == total) &&
            const DeepCollectionEquality().equals(other._links, _links));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, current_page, from, last_page,
      path, per_page, to, total, const DeepCollectionEquality().hash(_links));

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
      {required final int current_page,
      required final int from,
      required final int last_page,
      required final String path,
      required final int per_page,
      required final int to,
      required final int total,
      final List<dynamic> links}) = _$PaginationMetaImpl;

  factory _PaginationMeta.fromJson(Map<String, dynamic> json) =
      _$PaginationMetaImpl.fromJson;

  @override
  int get current_page;
  @override
  int get from;
  @override
  int get last_page;
  @override
  String get path;
  @override
  int get per_page;
  @override
  int get to;
  @override
  int get total;
  @override
  List<dynamic> get links;

  /// Create a copy of PaginationMeta
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaginationMetaImplCopyWith<_$PaginationMetaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MetaLink _$MetaLinkFromJson(Map<String, dynamic> json) {
  return _MetaLink.fromJson(json);
}

/// @nodoc
mixin _$MetaLink {
  String? get url => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;
  int? get page => throw _privateConstructorUsedError;
  bool get active => throw _privateConstructorUsedError;

  /// Serializes this MetaLink to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MetaLink
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MetaLinkCopyWith<MetaLink> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MetaLinkCopyWith<$Res> {
  factory $MetaLinkCopyWith(MetaLink value, $Res Function(MetaLink) then) =
      _$MetaLinkCopyWithImpl<$Res, MetaLink>;
  @useResult
  $Res call({String? url, String label, int? page, bool active});
}

/// @nodoc
class _$MetaLinkCopyWithImpl<$Res, $Val extends MetaLink>
    implements $MetaLinkCopyWith<$Res> {
  _$MetaLinkCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MetaLink
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = freezed,
    Object? label = null,
    Object? page = freezed,
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
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MetaLinkImplCopyWith<$Res>
    implements $MetaLinkCopyWith<$Res> {
  factory _$$MetaLinkImplCopyWith(
          _$MetaLinkImpl value, $Res Function(_$MetaLinkImpl) then) =
      __$$MetaLinkImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? url, String label, int? page, bool active});
}

/// @nodoc
class __$$MetaLinkImplCopyWithImpl<$Res>
    extends _$MetaLinkCopyWithImpl<$Res, _$MetaLinkImpl>
    implements _$$MetaLinkImplCopyWith<$Res> {
  __$$MetaLinkImplCopyWithImpl(
      _$MetaLinkImpl _value, $Res Function(_$MetaLinkImpl) _then)
      : super(_value, _then);

  /// Create a copy of MetaLink
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = freezed,
    Object? label = null,
    Object? page = freezed,
    Object? active = null,
  }) {
    return _then(_$MetaLinkImpl(
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MetaLinkImpl with DiagnosticableTreeMixin implements _MetaLink {
  const _$MetaLinkImpl(
      {this.url, required this.label, this.page, required this.active});

  factory _$MetaLinkImpl.fromJson(Map<String, dynamic> json) =>
      _$$MetaLinkImplFromJson(json);

  @override
  final String? url;
  @override
  final String label;
  @override
  final int? page;
  @override
  final bool active;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MetaLink(url: $url, label: $label, page: $page, active: $active)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MetaLink'))
      ..add(DiagnosticsProperty('url', url))
      ..add(DiagnosticsProperty('label', label))
      ..add(DiagnosticsProperty('page', page))
      ..add(DiagnosticsProperty('active', active));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MetaLinkImpl &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.active, active) || other.active == active));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, url, label, page, active);

  /// Create a copy of MetaLink
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MetaLinkImplCopyWith<_$MetaLinkImpl> get copyWith =>
      __$$MetaLinkImplCopyWithImpl<_$MetaLinkImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MetaLinkImplToJson(
      this,
    );
  }
}

abstract class _MetaLink implements MetaLink {
  const factory _MetaLink(
      {final String? url,
      required final String label,
      final int? page,
      required final bool active}) = _$MetaLinkImpl;

  factory _MetaLink.fromJson(Map<String, dynamic> json) =
      _$MetaLinkImpl.fromJson;

  @override
  String? get url;
  @override
  String get label;
  @override
  int? get page;
  @override
  bool get active;

  /// Create a copy of MetaLink
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MetaLinkImplCopyWith<_$MetaLinkImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ItemField _$ItemFieldFromJson(Map<String, dynamic> json) {
  return _ItemField.fromJson(json);
}

/// @nodoc
mixin _$ItemField {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'required')
  int get isRequired => throw _privateConstructorUsedError;
  int get unique => throw _privateConstructorUsedError;
  int get nullable => throw _privateConstructorUsedError;
  dynamic get options =>
      throw _privateConstructorUsedError; // Can be List, Map, or null
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt => throw _privateConstructorUsedError;
  Map<String, dynamic>? get pivot => throw _privateConstructorUsedError;
  @JsonKey(name: 'options_keys')
  List<String>? get optionsKeys => throw _privateConstructorUsedError;

  /// Serializes this ItemField to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ItemField
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ItemFieldCopyWith<ItemField> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemFieldCopyWith<$Res> {
  factory $ItemFieldCopyWith(ItemField value, $Res Function(ItemField) then) =
      _$ItemFieldCopyWithImpl<$Res, ItemField>;
  @useResult
  $Res call(
      {int id,
      String name,
      String label,
      String type,
      @JsonKey(name: 'required') int isRequired,
      int unique,
      int nullable,
      dynamic options,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt,
      Map<String, dynamic>? pivot,
      @JsonKey(name: 'options_keys') List<String>? optionsKeys});
}

/// @nodoc
class _$ItemFieldCopyWithImpl<$Res, $Val extends ItemField>
    implements $ItemFieldCopyWith<$Res> {
  _$ItemFieldCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ItemField
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? label = null,
    Object? type = null,
    Object? isRequired = null,
    Object? unique = null,
    Object? nullable = null,
    Object? options = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? pivot = freezed,
    Object? optionsKeys = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      isRequired: null == isRequired
          ? _value.isRequired
          : isRequired // ignore: cast_nullable_to_non_nullable
              as int,
      unique: null == unique
          ? _value.unique
          : unique // ignore: cast_nullable_to_non_nullable
              as int,
      nullable: null == nullable
          ? _value.nullable
          : nullable // ignore: cast_nullable_to_non_nullable
              as int,
      options: freezed == options
          ? _value.options
          : options // ignore: cast_nullable_to_non_nullable
              as dynamic,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      pivot: freezed == pivot
          ? _value.pivot
          : pivot // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      optionsKeys: freezed == optionsKeys
          ? _value.optionsKeys
          : optionsKeys // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ItemFieldImplCopyWith<$Res>
    implements $ItemFieldCopyWith<$Res> {
  factory _$$ItemFieldImplCopyWith(
          _$ItemFieldImpl value, $Res Function(_$ItemFieldImpl) then) =
      __$$ItemFieldImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String label,
      String type,
      @JsonKey(name: 'required') int isRequired,
      int unique,
      int nullable,
      dynamic options,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt,
      Map<String, dynamic>? pivot,
      @JsonKey(name: 'options_keys') List<String>? optionsKeys});
}

/// @nodoc
class __$$ItemFieldImplCopyWithImpl<$Res>
    extends _$ItemFieldCopyWithImpl<$Res, _$ItemFieldImpl>
    implements _$$ItemFieldImplCopyWith<$Res> {
  __$$ItemFieldImplCopyWithImpl(
      _$ItemFieldImpl _value, $Res Function(_$ItemFieldImpl) _then)
      : super(_value, _then);

  /// Create a copy of ItemField
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? label = null,
    Object? type = null,
    Object? isRequired = null,
    Object? unique = null,
    Object? nullable = null,
    Object? options = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? pivot = freezed,
    Object? optionsKeys = freezed,
  }) {
    return _then(_$ItemFieldImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      isRequired: null == isRequired
          ? _value.isRequired
          : isRequired // ignore: cast_nullable_to_non_nullable
              as int,
      unique: null == unique
          ? _value.unique
          : unique // ignore: cast_nullable_to_non_nullable
              as int,
      nullable: null == nullable
          ? _value.nullable
          : nullable // ignore: cast_nullable_to_non_nullable
              as int,
      options: freezed == options
          ? _value.options
          : options // ignore: cast_nullable_to_non_nullable
              as dynamic,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      pivot: freezed == pivot
          ? _value._pivot
          : pivot // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      optionsKeys: freezed == optionsKeys
          ? _value._optionsKeys
          : optionsKeys // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ItemFieldImpl with DiagnosticableTreeMixin implements _ItemField {
  const _$ItemFieldImpl(
      {required this.id,
      required this.name,
      required this.label,
      required this.type,
      @JsonKey(name: 'required') required this.isRequired,
      required this.unique,
      required this.nullable,
      this.options,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') required this.updatedAt,
      final Map<String, dynamic>? pivot,
      @JsonKey(name: 'options_keys') final List<String>? optionsKeys})
      : _pivot = pivot,
        _optionsKeys = optionsKeys;

  factory _$ItemFieldImpl.fromJson(Map<String, dynamic> json) =>
      _$$ItemFieldImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String label;
  @override
  final String type;
  @override
  @JsonKey(name: 'required')
  final int isRequired;
  @override
  final int unique;
  @override
  final int nullable;
  @override
  final dynamic options;
// Can be List, Map, or null
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;
  final Map<String, dynamic>? _pivot;
  @override
  Map<String, dynamic>? get pivot {
    final value = _pivot;
    if (value == null) return null;
    if (_pivot is EqualUnmodifiableMapView) return _pivot;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  final List<String>? _optionsKeys;
  @override
  @JsonKey(name: 'options_keys')
  List<String>? get optionsKeys {
    final value = _optionsKeys;
    if (value == null) return null;
    if (_optionsKeys is EqualUnmodifiableListView) return _optionsKeys;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ItemField(id: $id, name: $name, label: $label, type: $type, isRequired: $isRequired, unique: $unique, nullable: $nullable, options: $options, createdAt: $createdAt, updatedAt: $updatedAt, pivot: $pivot, optionsKeys: $optionsKeys)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ItemField'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('label', label))
      ..add(DiagnosticsProperty('type', type))
      ..add(DiagnosticsProperty('isRequired', isRequired))
      ..add(DiagnosticsProperty('unique', unique))
      ..add(DiagnosticsProperty('nullable', nullable))
      ..add(DiagnosticsProperty('options', options))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('updatedAt', updatedAt))
      ..add(DiagnosticsProperty('pivot', pivot))
      ..add(DiagnosticsProperty('optionsKeys', optionsKeys));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ItemFieldImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.isRequired, isRequired) ||
                other.isRequired == isRequired) &&
            (identical(other.unique, unique) || other.unique == unique) &&
            (identical(other.nullable, nullable) ||
                other.nullable == nullable) &&
            const DeepCollectionEquality().equals(other.options, options) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            const DeepCollectionEquality().equals(other._pivot, _pivot) &&
            const DeepCollectionEquality()
                .equals(other._optionsKeys, _optionsKeys));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      label,
      type,
      isRequired,
      unique,
      nullable,
      const DeepCollectionEquality().hash(options),
      createdAt,
      updatedAt,
      const DeepCollectionEquality().hash(_pivot),
      const DeepCollectionEquality().hash(_optionsKeys));

  /// Create a copy of ItemField
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ItemFieldImplCopyWith<_$ItemFieldImpl> get copyWith =>
      __$$ItemFieldImplCopyWithImpl<_$ItemFieldImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ItemFieldImplToJson(
      this,
    );
  }
}

abstract class _ItemField implements ItemField {
  const factory _ItemField(
          {required final int id,
          required final String name,
          required final String label,
          required final String type,
          @JsonKey(name: 'required') required final int isRequired,
          required final int unique,
          required final int nullable,
          final dynamic options,
          @JsonKey(name: 'created_at') required final DateTime createdAt,
          @JsonKey(name: 'updated_at') required final DateTime updatedAt,
          final Map<String, dynamic>? pivot,
          @JsonKey(name: 'options_keys') final List<String>? optionsKeys}) =
      _$ItemFieldImpl;

  factory _ItemField.fromJson(Map<String, dynamic> json) =
      _$ItemFieldImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get label;
  @override
  String get type;
  @override
  @JsonKey(name: 'required')
  int get isRequired;
  @override
  int get unique;
  @override
  int get nullable;
  @override
  dynamic get options; // Can be List, Map, or null
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt;
  @override
  Map<String, dynamic>? get pivot;
  @override
  @JsonKey(name: 'options_keys')
  List<String>? get optionsKeys;

  /// Create a copy of ItemField
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ItemFieldImplCopyWith<_$ItemFieldImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Categories _$CategoriesFromJson(Map<String, dynamic> json) {
  return _Categories.fromJson(json);
}

/// @nodoc
mixin _$Categories {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  String? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'parent_id')
  int? get parentId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get slug => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  List<String> get features => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt =>
      throw _privateConstructorUsedError; // Added missing fields from API response
  @JsonKey(name: 'item_fields')
  List<ItemField> get itemFields => throw _privateConstructorUsedError;
  @JsonKey(name: 'highlighted_fields')
  List<ItemField> get highlightedFields => throw _privateConstructorUsedError;

  /// Serializes this Categories to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Categories
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CategoriesCopyWith<Categories> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoriesCopyWith<$Res> {
  factory $CategoriesCopyWith(
          Categories value, $Res Function(Categories) then) =
      _$CategoriesCopyWithImpl<$Res, Categories>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'user_id') String? userId,
      @JsonKey(name: 'parent_id') int? parentId,
      String name,
      String slug,
      String description,
      List<String> features,
      String image,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt,
      @JsonKey(name: 'item_fields') List<ItemField> itemFields,
      @JsonKey(name: 'highlighted_fields') List<ItemField> highlightedFields});
}

/// @nodoc
class _$CategoriesCopyWithImpl<$Res, $Val extends Categories>
    implements $CategoriesCopyWith<$Res> {
  _$CategoriesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Categories
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
    Object? itemFields = null,
    Object? highlightedFields = null,
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
              as int?,
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
      itemFields: null == itemFields
          ? _value.itemFields
          : itemFields // ignore: cast_nullable_to_non_nullable
              as List<ItemField>,
      highlightedFields: null == highlightedFields
          ? _value.highlightedFields
          : highlightedFields // ignore: cast_nullable_to_non_nullable
              as List<ItemField>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CategoriesImplCopyWith<$Res>
    implements $CategoriesCopyWith<$Res> {
  factory _$$CategoriesImplCopyWith(
          _$CategoriesImpl value, $Res Function(_$CategoriesImpl) then) =
      __$$CategoriesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'user_id') String? userId,
      @JsonKey(name: 'parent_id') int? parentId,
      String name,
      String slug,
      String description,
      List<String> features,
      String image,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt,
      @JsonKey(name: 'item_fields') List<ItemField> itemFields,
      @JsonKey(name: 'highlighted_fields') List<ItemField> highlightedFields});
}

/// @nodoc
class __$$CategoriesImplCopyWithImpl<$Res>
    extends _$CategoriesCopyWithImpl<$Res, _$CategoriesImpl>
    implements _$$CategoriesImplCopyWith<$Res> {
  __$$CategoriesImplCopyWithImpl(
      _$CategoriesImpl _value, $Res Function(_$CategoriesImpl) _then)
      : super(_value, _then);

  /// Create a copy of Categories
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
    Object? itemFields = null,
    Object? highlightedFields = null,
  }) {
    return _then(_$CategoriesImpl(
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
              as int?,
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
      itemFields: null == itemFields
          ? _value._itemFields
          : itemFields // ignore: cast_nullable_to_non_nullable
              as List<ItemField>,
      highlightedFields: null == highlightedFields
          ? _value._highlightedFields
          : highlightedFields // ignore: cast_nullable_to_non_nullable
              as List<ItemField>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CategoriesImpl with DiagnosticableTreeMixin implements _Categories {
  const _$CategoriesImpl(
      {required this.id,
      @JsonKey(name: 'user_id') this.userId,
      @JsonKey(name: 'parent_id') this.parentId,
      required this.name,
      this.slug = '',
      this.description = '',
      final List<String> features = const [],
      this.image = 'assets/images/category_placeholder.png',
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') required this.updatedAt,
      @JsonKey(name: 'item_fields') final List<ItemField> itemFields = const [],
      @JsonKey(name: 'highlighted_fields')
      final List<ItemField> highlightedFields = const []})
      : _features = features,
        _itemFields = itemFields,
        _highlightedFields = highlightedFields;

  factory _$CategoriesImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoriesImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'user_id')
  final String? userId;
  @override
  @JsonKey(name: 'parent_id')
  final int? parentId;
  @override
  final String name;
  @override
  @JsonKey()
  final String slug;
  @override
  @JsonKey()
  final String description;
  final List<String> _features;
  @override
  @JsonKey()
  List<String> get features {
    if (_features is EqualUnmodifiableListView) return _features;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_features);
  }

  @override
  @JsonKey()
  final String image;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;
// Added missing fields from API response
  final List<ItemField> _itemFields;
// Added missing fields from API response
  @override
  @JsonKey(name: 'item_fields')
  List<ItemField> get itemFields {
    if (_itemFields is EqualUnmodifiableListView) return _itemFields;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_itemFields);
  }

  final List<ItemField> _highlightedFields;
  @override
  @JsonKey(name: 'highlighted_fields')
  List<ItemField> get highlightedFields {
    if (_highlightedFields is EqualUnmodifiableListView)
      return _highlightedFields;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_highlightedFields);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Categories(id: $id, userId: $userId, parentId: $parentId, name: $name, slug: $slug, description: $description, features: $features, image: $image, createdAt: $createdAt, updatedAt: $updatedAt, itemFields: $itemFields, highlightedFields: $highlightedFields)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Categories'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('userId', userId))
      ..add(DiagnosticsProperty('parentId', parentId))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('slug', slug))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('features', features))
      ..add(DiagnosticsProperty('image', image))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('updatedAt', updatedAt))
      ..add(DiagnosticsProperty('itemFields', itemFields))
      ..add(DiagnosticsProperty('highlightedFields', highlightedFields));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoriesImpl &&
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
                other.updatedAt == updatedAt) &&
            const DeepCollectionEquality()
                .equals(other._itemFields, _itemFields) &&
            const DeepCollectionEquality()
                .equals(other._highlightedFields, _highlightedFields));
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
      updatedAt,
      const DeepCollectionEquality().hash(_itemFields),
      const DeepCollectionEquality().hash(_highlightedFields));

  /// Create a copy of Categories
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoriesImplCopyWith<_$CategoriesImpl> get copyWith =>
      __$$CategoriesImplCopyWithImpl<_$CategoriesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CategoriesImplToJson(
      this,
    );
  }
}

abstract class _Categories implements Categories {
  const factory _Categories(
      {required final int id,
      @JsonKey(name: 'user_id') final String? userId,
      @JsonKey(name: 'parent_id') final int? parentId,
      required final String name,
      final String slug,
      final String description,
      final List<String> features,
      final String image,
      @JsonKey(name: 'created_at') required final DateTime createdAt,
      @JsonKey(name: 'updated_at') required final DateTime updatedAt,
      @JsonKey(name: 'item_fields') final List<ItemField> itemFields,
      @JsonKey(name: 'highlighted_fields')
      final List<ItemField> highlightedFields}) = _$CategoriesImpl;

  factory _Categories.fromJson(Map<String, dynamic> json) =
      _$CategoriesImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'user_id')
  String? get userId;
  @override
  @JsonKey(name: 'parent_id')
  int? get parentId;
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
  DateTime get updatedAt; // Added missing fields from API response
  @override
  @JsonKey(name: 'item_fields')
  List<ItemField> get itemFields;
  @override
  @JsonKey(name: 'highlighted_fields')
  List<ItemField> get highlightedFields;

  /// Create a copy of Categories
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CategoriesImplCopyWith<_$CategoriesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CategoriesResponse _$CategoriesResponseFromJson(Map<String, dynamic> json) {
  return _CategoriesResponse.fromJson(json);
}

/// @nodoc
mixin _$CategoriesResponse {
  List<Categories> get data => throw _privateConstructorUsedError;
  PaginationLinks get links => throw _privateConstructorUsedError;
  PaginationMeta get meta => throw _privateConstructorUsedError;

  /// Serializes this CategoriesResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CategoriesResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CategoriesResponseCopyWith<CategoriesResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoriesResponseCopyWith<$Res> {
  factory $CategoriesResponseCopyWith(
          CategoriesResponse value, $Res Function(CategoriesResponse) then) =
      _$CategoriesResponseCopyWithImpl<$Res, CategoriesResponse>;
  @useResult
  $Res call(
      {List<Categories> data, PaginationLinks links, PaginationMeta meta});

  $PaginationLinksCopyWith<$Res> get links;
  $PaginationMetaCopyWith<$Res> get meta;
}

/// @nodoc
class _$CategoriesResponseCopyWithImpl<$Res, $Val extends CategoriesResponse>
    implements $CategoriesResponseCopyWith<$Res> {
  _$CategoriesResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CategoriesResponse
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
              as List<Categories>,
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

  /// Create a copy of CategoriesResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PaginationLinksCopyWith<$Res> get links {
    return $PaginationLinksCopyWith<$Res>(_value.links, (value) {
      return _then(_value.copyWith(links: value) as $Val);
    });
  }

  /// Create a copy of CategoriesResponse
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
abstract class _$$CategoriesResponseImplCopyWith<$Res>
    implements $CategoriesResponseCopyWith<$Res> {
  factory _$$CategoriesResponseImplCopyWith(_$CategoriesResponseImpl value,
          $Res Function(_$CategoriesResponseImpl) then) =
      __$$CategoriesResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Categories> data, PaginationLinks links, PaginationMeta meta});

  @override
  $PaginationLinksCopyWith<$Res> get links;
  @override
  $PaginationMetaCopyWith<$Res> get meta;
}

/// @nodoc
class __$$CategoriesResponseImplCopyWithImpl<$Res>
    extends _$CategoriesResponseCopyWithImpl<$Res, _$CategoriesResponseImpl>
    implements _$$CategoriesResponseImplCopyWith<$Res> {
  __$$CategoriesResponseImplCopyWithImpl(_$CategoriesResponseImpl _value,
      $Res Function(_$CategoriesResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of CategoriesResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? links = null,
    Object? meta = null,
  }) {
    return _then(_$CategoriesResponseImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Categories>,
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
class _$CategoriesResponseImpl
    with DiagnosticableTreeMixin
    implements _CategoriesResponse {
  const _$CategoriesResponseImpl(
      {final List<Categories> data = const [],
      required this.links,
      required this.meta})
      : _data = data;

  factory _$CategoriesResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoriesResponseImplFromJson(json);

  final List<Categories> _data;
  @override
  @JsonKey()
  List<Categories> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  final PaginationLinks links;
  @override
  final PaginationMeta meta;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CategoriesResponse(data: $data, links: $links, meta: $meta)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CategoriesResponse'))
      ..add(DiagnosticsProperty('data', data))
      ..add(DiagnosticsProperty('links', links))
      ..add(DiagnosticsProperty('meta', meta));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoriesResponseImpl &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.links, links) || other.links == links) &&
            (identical(other.meta, meta) || other.meta == meta));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_data), links, meta);

  /// Create a copy of CategoriesResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoriesResponseImplCopyWith<_$CategoriesResponseImpl> get copyWith =>
      __$$CategoriesResponseImplCopyWithImpl<_$CategoriesResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CategoriesResponseImplToJson(
      this,
    );
  }
}

abstract class _CategoriesResponse implements CategoriesResponse {
  const factory _CategoriesResponse(
      {final List<Categories> data,
      required final PaginationLinks links,
      required final PaginationMeta meta}) = _$CategoriesResponseImpl;

  factory _CategoriesResponse.fromJson(Map<String, dynamic> json) =
      _$CategoriesResponseImpl.fromJson;

  @override
  List<Categories> get data;
  @override
  PaginationLinks get links;
  @override
  PaginationMeta get meta;

  /// Create a copy of CategoriesResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CategoriesResponseImplCopyWith<_$CategoriesResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DetailedCategory _$DetailedCategoryFromJson(Map<String, dynamic> json) {
  return _DetailedCategory.fromJson(json);
}

/// @nodoc
mixin _$DetailedCategory {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  String? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'parent_id')
  int? get parentId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get slug => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  List<String> get features => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'item_fields')
  List<ItemField> get itemFields => throw _privateConstructorUsedError;
  @JsonKey(name: 'highlighted_fields')
  List<ItemField> get highlightedFields => throw _privateConstructorUsedError;

  /// Serializes this DetailedCategory to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DetailedCategory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DetailedCategoryCopyWith<DetailedCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailedCategoryCopyWith<$Res> {
  factory $DetailedCategoryCopyWith(
          DetailedCategory value, $Res Function(DetailedCategory) then) =
      _$DetailedCategoryCopyWithImpl<$Res, DetailedCategory>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'user_id') String? userId,
      @JsonKey(name: 'parent_id') int? parentId,
      String name,
      String slug,
      String description,
      List<String> features,
      String image,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt,
      @JsonKey(name: 'item_fields') List<ItemField> itemFields,
      @JsonKey(name: 'highlighted_fields') List<ItemField> highlightedFields});
}

/// @nodoc
class _$DetailedCategoryCopyWithImpl<$Res, $Val extends DetailedCategory>
    implements $DetailedCategoryCopyWith<$Res> {
  _$DetailedCategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DetailedCategory
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
    Object? itemFields = null,
    Object? highlightedFields = null,
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
              as int?,
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
      itemFields: null == itemFields
          ? _value.itemFields
          : itemFields // ignore: cast_nullable_to_non_nullable
              as List<ItemField>,
      highlightedFields: null == highlightedFields
          ? _value.highlightedFields
          : highlightedFields // ignore: cast_nullable_to_non_nullable
              as List<ItemField>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DetailedCategoryImplCopyWith<$Res>
    implements $DetailedCategoryCopyWith<$Res> {
  factory _$$DetailedCategoryImplCopyWith(_$DetailedCategoryImpl value,
          $Res Function(_$DetailedCategoryImpl) then) =
      __$$DetailedCategoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'user_id') String? userId,
      @JsonKey(name: 'parent_id') int? parentId,
      String name,
      String slug,
      String description,
      List<String> features,
      String image,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt,
      @JsonKey(name: 'item_fields') List<ItemField> itemFields,
      @JsonKey(name: 'highlighted_fields') List<ItemField> highlightedFields});
}

/// @nodoc
class __$$DetailedCategoryImplCopyWithImpl<$Res>
    extends _$DetailedCategoryCopyWithImpl<$Res, _$DetailedCategoryImpl>
    implements _$$DetailedCategoryImplCopyWith<$Res> {
  __$$DetailedCategoryImplCopyWithImpl(_$DetailedCategoryImpl _value,
      $Res Function(_$DetailedCategoryImpl) _then)
      : super(_value, _then);

  /// Create a copy of DetailedCategory
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
    Object? itemFields = null,
    Object? highlightedFields = null,
  }) {
    return _then(_$DetailedCategoryImpl(
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
              as int?,
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
      itemFields: null == itemFields
          ? _value._itemFields
          : itemFields // ignore: cast_nullable_to_non_nullable
              as List<ItemField>,
      highlightedFields: null == highlightedFields
          ? _value._highlightedFields
          : highlightedFields // ignore: cast_nullable_to_non_nullable
              as List<ItemField>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DetailedCategoryImpl
    with DiagnosticableTreeMixin
    implements _DetailedCategory {
  const _$DetailedCategoryImpl(
      {required this.id,
      @JsonKey(name: 'user_id') this.userId,
      @JsonKey(name: 'parent_id') this.parentId,
      required this.name,
      this.slug = '',
      this.description = '',
      final List<String> features = const [],
      this.image = 'assets/images/category_placeholder.png',
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') required this.updatedAt,
      @JsonKey(name: 'item_fields') final List<ItemField> itemFields = const [],
      @JsonKey(name: 'highlighted_fields')
      final List<ItemField> highlightedFields = const []})
      : _features = features,
        _itemFields = itemFields,
        _highlightedFields = highlightedFields;

  factory _$DetailedCategoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$DetailedCategoryImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'user_id')
  final String? userId;
  @override
  @JsonKey(name: 'parent_id')
  final int? parentId;
  @override
  final String name;
  @override
  @JsonKey()
  final String slug;
  @override
  @JsonKey()
  final String description;
  final List<String> _features;
  @override
  @JsonKey()
  List<String> get features {
    if (_features is EqualUnmodifiableListView) return _features;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_features);
  }

  @override
  @JsonKey()
  final String image;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;
  final List<ItemField> _itemFields;
  @override
  @JsonKey(name: 'item_fields')
  List<ItemField> get itemFields {
    if (_itemFields is EqualUnmodifiableListView) return _itemFields;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_itemFields);
  }

  final List<ItemField> _highlightedFields;
  @override
  @JsonKey(name: 'highlighted_fields')
  List<ItemField> get highlightedFields {
    if (_highlightedFields is EqualUnmodifiableListView)
      return _highlightedFields;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_highlightedFields);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DetailedCategory(id: $id, userId: $userId, parentId: $parentId, name: $name, slug: $slug, description: $description, features: $features, image: $image, createdAt: $createdAt, updatedAt: $updatedAt, itemFields: $itemFields, highlightedFields: $highlightedFields)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'DetailedCategory'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('userId', userId))
      ..add(DiagnosticsProperty('parentId', parentId))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('slug', slug))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('features', features))
      ..add(DiagnosticsProperty('image', image))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('updatedAt', updatedAt))
      ..add(DiagnosticsProperty('itemFields', itemFields))
      ..add(DiagnosticsProperty('highlightedFields', highlightedFields));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailedCategoryImpl &&
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
                other.updatedAt == updatedAt) &&
            const DeepCollectionEquality()
                .equals(other._itemFields, _itemFields) &&
            const DeepCollectionEquality()
                .equals(other._highlightedFields, _highlightedFields));
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
      updatedAt,
      const DeepCollectionEquality().hash(_itemFields),
      const DeepCollectionEquality().hash(_highlightedFields));

  /// Create a copy of DetailedCategory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DetailedCategoryImplCopyWith<_$DetailedCategoryImpl> get copyWith =>
      __$$DetailedCategoryImplCopyWithImpl<_$DetailedCategoryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DetailedCategoryImplToJson(
      this,
    );
  }
}

abstract class _DetailedCategory implements DetailedCategory {
  const factory _DetailedCategory(
      {required final int id,
      @JsonKey(name: 'user_id') final String? userId,
      @JsonKey(name: 'parent_id') final int? parentId,
      required final String name,
      final String slug,
      final String description,
      final List<String> features,
      final String image,
      @JsonKey(name: 'created_at') required final DateTime createdAt,
      @JsonKey(name: 'updated_at') required final DateTime updatedAt,
      @JsonKey(name: 'item_fields') final List<ItemField> itemFields,
      @JsonKey(name: 'highlighted_fields')
      final List<ItemField> highlightedFields}) = _$DetailedCategoryImpl;

  factory _DetailedCategory.fromJson(Map<String, dynamic> json) =
      _$DetailedCategoryImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'user_id')
  String? get userId;
  @override
  @JsonKey(name: 'parent_id')
  int? get parentId;
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
  @override
  @JsonKey(name: 'item_fields')
  List<ItemField> get itemFields;
  @override
  @JsonKey(name: 'highlighted_fields')
  List<ItemField> get highlightedFields;

  /// Create a copy of DetailedCategory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DetailedCategoryImplCopyWith<_$DetailedCategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DetailedCategoryResponse _$DetailedCategoryResponseFromJson(
    Map<String, dynamic> json) {
  return _DetailedCategoryResponse.fromJson(json);
}

/// @nodoc
mixin _$DetailedCategoryResponse {
  DetailedCategory get data => throw _privateConstructorUsedError;

  /// Serializes this DetailedCategoryResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DetailedCategoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DetailedCategoryResponseCopyWith<DetailedCategoryResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailedCategoryResponseCopyWith<$Res> {
  factory $DetailedCategoryResponseCopyWith(DetailedCategoryResponse value,
          $Res Function(DetailedCategoryResponse) then) =
      _$DetailedCategoryResponseCopyWithImpl<$Res, DetailedCategoryResponse>;
  @useResult
  $Res call({DetailedCategory data});

  $DetailedCategoryCopyWith<$Res> get data;
}

/// @nodoc
class _$DetailedCategoryResponseCopyWithImpl<$Res,
        $Val extends DetailedCategoryResponse>
    implements $DetailedCategoryResponseCopyWith<$Res> {
  _$DetailedCategoryResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DetailedCategoryResponse
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
              as DetailedCategory,
    ) as $Val);
  }

  /// Create a copy of DetailedCategoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DetailedCategoryCopyWith<$Res> get data {
    return $DetailedCategoryCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DetailedCategoryResponseImplCopyWith<$Res>
    implements $DetailedCategoryResponseCopyWith<$Res> {
  factory _$$DetailedCategoryResponseImplCopyWith(
          _$DetailedCategoryResponseImpl value,
          $Res Function(_$DetailedCategoryResponseImpl) then) =
      __$$DetailedCategoryResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DetailedCategory data});

  @override
  $DetailedCategoryCopyWith<$Res> get data;
}

/// @nodoc
class __$$DetailedCategoryResponseImplCopyWithImpl<$Res>
    extends _$DetailedCategoryResponseCopyWithImpl<$Res,
        _$DetailedCategoryResponseImpl>
    implements _$$DetailedCategoryResponseImplCopyWith<$Res> {
  __$$DetailedCategoryResponseImplCopyWithImpl(
      _$DetailedCategoryResponseImpl _value,
      $Res Function(_$DetailedCategoryResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of DetailedCategoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$DetailedCategoryResponseImpl(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as DetailedCategory,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DetailedCategoryResponseImpl
    with DiagnosticableTreeMixin
    implements _DetailedCategoryResponse {
  const _$DetailedCategoryResponseImpl({required this.data});

  factory _$DetailedCategoryResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$DetailedCategoryResponseImplFromJson(json);

  @override
  final DetailedCategory data;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DetailedCategoryResponse(data: $data)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'DetailedCategoryResponse'))
      ..add(DiagnosticsProperty('data', data));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailedCategoryResponseImpl &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, data);

  /// Create a copy of DetailedCategoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DetailedCategoryResponseImplCopyWith<_$DetailedCategoryResponseImpl>
      get copyWith => __$$DetailedCategoryResponseImplCopyWithImpl<
          _$DetailedCategoryResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DetailedCategoryResponseImplToJson(
      this,
    );
  }
}

abstract class _DetailedCategoryResponse implements DetailedCategoryResponse {
  const factory _DetailedCategoryResponse(
      {required final DetailedCategory data}) = _$DetailedCategoryResponseImpl;

  factory _DetailedCategoryResponse.fromJson(Map<String, dynamic> json) =
      _$DetailedCategoryResponseImpl.fromJson;

  @override
  DetailedCategory get data;

  /// Create a copy of DetailedCategoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DetailedCategoryResponseImplCopyWith<_$DetailedCategoryResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
