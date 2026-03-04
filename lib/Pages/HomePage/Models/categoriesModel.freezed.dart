// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'categoriesModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PaginationLinks implements DiagnosticableTreeMixin {

 String? get first; String? get last; String? get prev; String? get next;
/// Create a copy of PaginationLinks
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaginationLinksCopyWith<PaginationLinks> get copyWith => _$PaginationLinksCopyWithImpl<PaginationLinks>(this as PaginationLinks, _$identity);

  /// Serializes this PaginationLinks to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'PaginationLinks'))
    ..add(DiagnosticsProperty('first', first))..add(DiagnosticsProperty('last', last))..add(DiagnosticsProperty('prev', prev))..add(DiagnosticsProperty('next', next));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaginationLinks&&(identical(other.first, first) || other.first == first)&&(identical(other.last, last) || other.last == last)&&(identical(other.prev, prev) || other.prev == prev)&&(identical(other.next, next) || other.next == next));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,first,last,prev,next);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'PaginationLinks(first: $first, last: $last, prev: $prev, next: $next)';
}


}

/// @nodoc
abstract mixin class $PaginationLinksCopyWith<$Res>  {
  factory $PaginationLinksCopyWith(PaginationLinks value, $Res Function(PaginationLinks) _then) = _$PaginationLinksCopyWithImpl;
@useResult
$Res call({
 String? first, String? last, String? prev, String? next
});




}
/// @nodoc
class _$PaginationLinksCopyWithImpl<$Res>
    implements $PaginationLinksCopyWith<$Res> {
  _$PaginationLinksCopyWithImpl(this._self, this._then);

  final PaginationLinks _self;
  final $Res Function(PaginationLinks) _then;

/// Create a copy of PaginationLinks
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? first = freezed,Object? last = freezed,Object? prev = freezed,Object? next = freezed,}) {
  return _then(_self.copyWith(
first: freezed == first ? _self.first : first // ignore: cast_nullable_to_non_nullable
as String?,last: freezed == last ? _self.last : last // ignore: cast_nullable_to_non_nullable
as String?,prev: freezed == prev ? _self.prev : prev // ignore: cast_nullable_to_non_nullable
as String?,next: freezed == next ? _self.next : next // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PaginationLinks].
extension PaginationLinksPatterns on PaginationLinks {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaginationLinks value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaginationLinks() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaginationLinks value)  $default,){
final _that = this;
switch (_that) {
case _PaginationLinks():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaginationLinks value)?  $default,){
final _that = this;
switch (_that) {
case _PaginationLinks() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? first,  String? last,  String? prev,  String? next)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaginationLinks() when $default != null:
return $default(_that.first,_that.last,_that.prev,_that.next);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? first,  String? last,  String? prev,  String? next)  $default,) {final _that = this;
switch (_that) {
case _PaginationLinks():
return $default(_that.first,_that.last,_that.prev,_that.next);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? first,  String? last,  String? prev,  String? next)?  $default,) {final _that = this;
switch (_that) {
case _PaginationLinks() when $default != null:
return $default(_that.first,_that.last,_that.prev,_that.next);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PaginationLinks with DiagnosticableTreeMixin implements PaginationLinks {
  const _PaginationLinks({this.first, this.last, this.prev, this.next});
  factory _PaginationLinks.fromJson(Map<String, dynamic> json) => _$PaginationLinksFromJson(json);

@override final  String? first;
@override final  String? last;
@override final  String? prev;
@override final  String? next;

/// Create a copy of PaginationLinks
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaginationLinksCopyWith<_PaginationLinks> get copyWith => __$PaginationLinksCopyWithImpl<_PaginationLinks>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaginationLinksToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'PaginationLinks'))
    ..add(DiagnosticsProperty('first', first))..add(DiagnosticsProperty('last', last))..add(DiagnosticsProperty('prev', prev))..add(DiagnosticsProperty('next', next));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaginationLinks&&(identical(other.first, first) || other.first == first)&&(identical(other.last, last) || other.last == last)&&(identical(other.prev, prev) || other.prev == prev)&&(identical(other.next, next) || other.next == next));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,first,last,prev,next);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'PaginationLinks(first: $first, last: $last, prev: $prev, next: $next)';
}


}

/// @nodoc
abstract mixin class _$PaginationLinksCopyWith<$Res> implements $PaginationLinksCopyWith<$Res> {
  factory _$PaginationLinksCopyWith(_PaginationLinks value, $Res Function(_PaginationLinks) _then) = __$PaginationLinksCopyWithImpl;
@override @useResult
$Res call({
 String? first, String? last, String? prev, String? next
});




}
/// @nodoc
class __$PaginationLinksCopyWithImpl<$Res>
    implements _$PaginationLinksCopyWith<$Res> {
  __$PaginationLinksCopyWithImpl(this._self, this._then);

  final _PaginationLinks _self;
  final $Res Function(_PaginationLinks) _then;

/// Create a copy of PaginationLinks
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? first = freezed,Object? last = freezed,Object? prev = freezed,Object? next = freezed,}) {
  return _then(_PaginationLinks(
first: freezed == first ? _self.first : first // ignore: cast_nullable_to_non_nullable
as String?,last: freezed == last ? _self.last : last // ignore: cast_nullable_to_non_nullable
as String?,prev: freezed == prev ? _self.prev : prev // ignore: cast_nullable_to_non_nullable
as String?,next: freezed == next ? _self.next : next // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$PaginationMeta implements DiagnosticableTreeMixin {

 int get current_page; int get from; int get last_page; String get path; int get per_page; int get to; int get total; List<dynamic> get links;
/// Create a copy of PaginationMeta
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaginationMetaCopyWith<PaginationMeta> get copyWith => _$PaginationMetaCopyWithImpl<PaginationMeta>(this as PaginationMeta, _$identity);

  /// Serializes this PaginationMeta to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'PaginationMeta'))
    ..add(DiagnosticsProperty('current_page', current_page))..add(DiagnosticsProperty('from', from))..add(DiagnosticsProperty('last_page', last_page))..add(DiagnosticsProperty('path', path))..add(DiagnosticsProperty('per_page', per_page))..add(DiagnosticsProperty('to', to))..add(DiagnosticsProperty('total', total))..add(DiagnosticsProperty('links', links));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaginationMeta&&(identical(other.current_page, current_page) || other.current_page == current_page)&&(identical(other.from, from) || other.from == from)&&(identical(other.last_page, last_page) || other.last_page == last_page)&&(identical(other.path, path) || other.path == path)&&(identical(other.per_page, per_page) || other.per_page == per_page)&&(identical(other.to, to) || other.to == to)&&(identical(other.total, total) || other.total == total)&&const DeepCollectionEquality().equals(other.links, links));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,current_page,from,last_page,path,per_page,to,total,const DeepCollectionEquality().hash(links));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'PaginationMeta(current_page: $current_page, from: $from, last_page: $last_page, path: $path, per_page: $per_page, to: $to, total: $total, links: $links)';
}


}

/// @nodoc
abstract mixin class $PaginationMetaCopyWith<$Res>  {
  factory $PaginationMetaCopyWith(PaginationMeta value, $Res Function(PaginationMeta) _then) = _$PaginationMetaCopyWithImpl;
@useResult
$Res call({
 int current_page, int from, int last_page, String path, int per_page, int to, int total, List<dynamic> links
});




}
/// @nodoc
class _$PaginationMetaCopyWithImpl<$Res>
    implements $PaginationMetaCopyWith<$Res> {
  _$PaginationMetaCopyWithImpl(this._self, this._then);

  final PaginationMeta _self;
  final $Res Function(PaginationMeta) _then;

/// Create a copy of PaginationMeta
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? current_page = null,Object? from = null,Object? last_page = null,Object? path = null,Object? per_page = null,Object? to = null,Object? total = null,Object? links = null,}) {
  return _then(_self.copyWith(
current_page: null == current_page ? _self.current_page : current_page // ignore: cast_nullable_to_non_nullable
as int,from: null == from ? _self.from : from // ignore: cast_nullable_to_non_nullable
as int,last_page: null == last_page ? _self.last_page : last_page // ignore: cast_nullable_to_non_nullable
as int,path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String,per_page: null == per_page ? _self.per_page : per_page // ignore: cast_nullable_to_non_nullable
as int,to: null == to ? _self.to : to // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,links: null == links ? _self.links : links // ignore: cast_nullable_to_non_nullable
as List<dynamic>,
  ));
}

}


/// Adds pattern-matching-related methods to [PaginationMeta].
extension PaginationMetaPatterns on PaginationMeta {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaginationMeta value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaginationMeta() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaginationMeta value)  $default,){
final _that = this;
switch (_that) {
case _PaginationMeta():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaginationMeta value)?  $default,){
final _that = this;
switch (_that) {
case _PaginationMeta() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int current_page,  int from,  int last_page,  String path,  int per_page,  int to,  int total,  List<dynamic> links)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaginationMeta() when $default != null:
return $default(_that.current_page,_that.from,_that.last_page,_that.path,_that.per_page,_that.to,_that.total,_that.links);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int current_page,  int from,  int last_page,  String path,  int per_page,  int to,  int total,  List<dynamic> links)  $default,) {final _that = this;
switch (_that) {
case _PaginationMeta():
return $default(_that.current_page,_that.from,_that.last_page,_that.path,_that.per_page,_that.to,_that.total,_that.links);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int current_page,  int from,  int last_page,  String path,  int per_page,  int to,  int total,  List<dynamic> links)?  $default,) {final _that = this;
switch (_that) {
case _PaginationMeta() when $default != null:
return $default(_that.current_page,_that.from,_that.last_page,_that.path,_that.per_page,_that.to,_that.total,_that.links);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PaginationMeta with DiagnosticableTreeMixin implements PaginationMeta {
  const _PaginationMeta({required this.current_page, required this.from, required this.last_page, required this.path, required this.per_page, required this.to, required this.total, final  List<dynamic> links = const []}): _links = links;
  factory _PaginationMeta.fromJson(Map<String, dynamic> json) => _$PaginationMetaFromJson(json);

@override final  int current_page;
@override final  int from;
@override final  int last_page;
@override final  String path;
@override final  int per_page;
@override final  int to;
@override final  int total;
 final  List<dynamic> _links;
@override@JsonKey() List<dynamic> get links {
  if (_links is EqualUnmodifiableListView) return _links;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_links);
}


/// Create a copy of PaginationMeta
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaginationMetaCopyWith<_PaginationMeta> get copyWith => __$PaginationMetaCopyWithImpl<_PaginationMeta>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaginationMetaToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'PaginationMeta'))
    ..add(DiagnosticsProperty('current_page', current_page))..add(DiagnosticsProperty('from', from))..add(DiagnosticsProperty('last_page', last_page))..add(DiagnosticsProperty('path', path))..add(DiagnosticsProperty('per_page', per_page))..add(DiagnosticsProperty('to', to))..add(DiagnosticsProperty('total', total))..add(DiagnosticsProperty('links', links));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaginationMeta&&(identical(other.current_page, current_page) || other.current_page == current_page)&&(identical(other.from, from) || other.from == from)&&(identical(other.last_page, last_page) || other.last_page == last_page)&&(identical(other.path, path) || other.path == path)&&(identical(other.per_page, per_page) || other.per_page == per_page)&&(identical(other.to, to) || other.to == to)&&(identical(other.total, total) || other.total == total)&&const DeepCollectionEquality().equals(other._links, _links));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,current_page,from,last_page,path,per_page,to,total,const DeepCollectionEquality().hash(_links));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'PaginationMeta(current_page: $current_page, from: $from, last_page: $last_page, path: $path, per_page: $per_page, to: $to, total: $total, links: $links)';
}


}

/// @nodoc
abstract mixin class _$PaginationMetaCopyWith<$Res> implements $PaginationMetaCopyWith<$Res> {
  factory _$PaginationMetaCopyWith(_PaginationMeta value, $Res Function(_PaginationMeta) _then) = __$PaginationMetaCopyWithImpl;
@override @useResult
$Res call({
 int current_page, int from, int last_page, String path, int per_page, int to, int total, List<dynamic> links
});




}
/// @nodoc
class __$PaginationMetaCopyWithImpl<$Res>
    implements _$PaginationMetaCopyWith<$Res> {
  __$PaginationMetaCopyWithImpl(this._self, this._then);

  final _PaginationMeta _self;
  final $Res Function(_PaginationMeta) _then;

/// Create a copy of PaginationMeta
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? current_page = null,Object? from = null,Object? last_page = null,Object? path = null,Object? per_page = null,Object? to = null,Object? total = null,Object? links = null,}) {
  return _then(_PaginationMeta(
current_page: null == current_page ? _self.current_page : current_page // ignore: cast_nullable_to_non_nullable
as int,from: null == from ? _self.from : from // ignore: cast_nullable_to_non_nullable
as int,last_page: null == last_page ? _self.last_page : last_page // ignore: cast_nullable_to_non_nullable
as int,path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String,per_page: null == per_page ? _self.per_page : per_page // ignore: cast_nullable_to_non_nullable
as int,to: null == to ? _self.to : to // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,links: null == links ? _self._links : links // ignore: cast_nullable_to_non_nullable
as List<dynamic>,
  ));
}


}


/// @nodoc
mixin _$MetaLink implements DiagnosticableTreeMixin {

 String? get url; String get label; int? get page; bool get active;
/// Create a copy of MetaLink
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MetaLinkCopyWith<MetaLink> get copyWith => _$MetaLinkCopyWithImpl<MetaLink>(this as MetaLink, _$identity);

  /// Serializes this MetaLink to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'MetaLink'))
    ..add(DiagnosticsProperty('url', url))..add(DiagnosticsProperty('label', label))..add(DiagnosticsProperty('page', page))..add(DiagnosticsProperty('active', active));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MetaLink&&(identical(other.url, url) || other.url == url)&&(identical(other.label, label) || other.label == label)&&(identical(other.page, page) || other.page == page)&&(identical(other.active, active) || other.active == active));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,url,label,page,active);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'MetaLink(url: $url, label: $label, page: $page, active: $active)';
}


}

/// @nodoc
abstract mixin class $MetaLinkCopyWith<$Res>  {
  factory $MetaLinkCopyWith(MetaLink value, $Res Function(MetaLink) _then) = _$MetaLinkCopyWithImpl;
@useResult
$Res call({
 String? url, String label, int? page, bool active
});




}
/// @nodoc
class _$MetaLinkCopyWithImpl<$Res>
    implements $MetaLinkCopyWith<$Res> {
  _$MetaLinkCopyWithImpl(this._self, this._then);

  final MetaLink _self;
  final $Res Function(MetaLink) _then;

/// Create a copy of MetaLink
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? url = freezed,Object? label = null,Object? page = freezed,Object? active = null,}) {
  return _then(_self.copyWith(
url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,page: freezed == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int?,active: null == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [MetaLink].
extension MetaLinkPatterns on MetaLink {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MetaLink value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MetaLink() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MetaLink value)  $default,){
final _that = this;
switch (_that) {
case _MetaLink():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MetaLink value)?  $default,){
final _that = this;
switch (_that) {
case _MetaLink() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? url,  String label,  int? page,  bool active)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MetaLink() when $default != null:
return $default(_that.url,_that.label,_that.page,_that.active);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? url,  String label,  int? page,  bool active)  $default,) {final _that = this;
switch (_that) {
case _MetaLink():
return $default(_that.url,_that.label,_that.page,_that.active);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? url,  String label,  int? page,  bool active)?  $default,) {final _that = this;
switch (_that) {
case _MetaLink() when $default != null:
return $default(_that.url,_that.label,_that.page,_that.active);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MetaLink with DiagnosticableTreeMixin implements MetaLink {
  const _MetaLink({this.url, required this.label, this.page, required this.active});
  factory _MetaLink.fromJson(Map<String, dynamic> json) => _$MetaLinkFromJson(json);

@override final  String? url;
@override final  String label;
@override final  int? page;
@override final  bool active;

/// Create a copy of MetaLink
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MetaLinkCopyWith<_MetaLink> get copyWith => __$MetaLinkCopyWithImpl<_MetaLink>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MetaLinkToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'MetaLink'))
    ..add(DiagnosticsProperty('url', url))..add(DiagnosticsProperty('label', label))..add(DiagnosticsProperty('page', page))..add(DiagnosticsProperty('active', active));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MetaLink&&(identical(other.url, url) || other.url == url)&&(identical(other.label, label) || other.label == label)&&(identical(other.page, page) || other.page == page)&&(identical(other.active, active) || other.active == active));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,url,label,page,active);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'MetaLink(url: $url, label: $label, page: $page, active: $active)';
}


}

/// @nodoc
abstract mixin class _$MetaLinkCopyWith<$Res> implements $MetaLinkCopyWith<$Res> {
  factory _$MetaLinkCopyWith(_MetaLink value, $Res Function(_MetaLink) _then) = __$MetaLinkCopyWithImpl;
@override @useResult
$Res call({
 String? url, String label, int? page, bool active
});




}
/// @nodoc
class __$MetaLinkCopyWithImpl<$Res>
    implements _$MetaLinkCopyWith<$Res> {
  __$MetaLinkCopyWithImpl(this._self, this._then);

  final _MetaLink _self;
  final $Res Function(_MetaLink) _then;

/// Create a copy of MetaLink
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? url = freezed,Object? label = null,Object? page = freezed,Object? active = null,}) {
  return _then(_MetaLink(
url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,page: freezed == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int?,active: null == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$ItemField implements DiagnosticableTreeMixin {

 int get id; String get name; String get label; String get type;@JsonKey(name: 'required') int get isRequired; int get unique; int get nullable; dynamic get options;// Can be List, Map, or null
@JsonKey(name: 'created_at') DateTime get createdAt;@JsonKey(name: 'updated_at') DateTime get updatedAt; Map<String, dynamic>? get pivot;@JsonKey(name: 'options_keys') List<String>? get optionsKeys;
/// Create a copy of ItemField
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ItemFieldCopyWith<ItemField> get copyWith => _$ItemFieldCopyWithImpl<ItemField>(this as ItemField, _$identity);

  /// Serializes this ItemField to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ItemField'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('name', name))..add(DiagnosticsProperty('label', label))..add(DiagnosticsProperty('type', type))..add(DiagnosticsProperty('isRequired', isRequired))..add(DiagnosticsProperty('unique', unique))..add(DiagnosticsProperty('nullable', nullable))..add(DiagnosticsProperty('options', options))..add(DiagnosticsProperty('createdAt', createdAt))..add(DiagnosticsProperty('updatedAt', updatedAt))..add(DiagnosticsProperty('pivot', pivot))..add(DiagnosticsProperty('optionsKeys', optionsKeys));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ItemField&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.label, label) || other.label == label)&&(identical(other.type, type) || other.type == type)&&(identical(other.isRequired, isRequired) || other.isRequired == isRequired)&&(identical(other.unique, unique) || other.unique == unique)&&(identical(other.nullable, nullable) || other.nullable == nullable)&&const DeepCollectionEquality().equals(other.options, options)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other.pivot, pivot)&&const DeepCollectionEquality().equals(other.optionsKeys, optionsKeys));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,label,type,isRequired,unique,nullable,const DeepCollectionEquality().hash(options),createdAt,updatedAt,const DeepCollectionEquality().hash(pivot),const DeepCollectionEquality().hash(optionsKeys));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ItemField(id: $id, name: $name, label: $label, type: $type, isRequired: $isRequired, unique: $unique, nullable: $nullable, options: $options, createdAt: $createdAt, updatedAt: $updatedAt, pivot: $pivot, optionsKeys: $optionsKeys)';
}


}

/// @nodoc
abstract mixin class $ItemFieldCopyWith<$Res>  {
  factory $ItemFieldCopyWith(ItemField value, $Res Function(ItemField) _then) = _$ItemFieldCopyWithImpl;
@useResult
$Res call({
 int id, String name, String label, String type,@JsonKey(name: 'required') int isRequired, int unique, int nullable, dynamic options,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt, Map<String, dynamic>? pivot,@JsonKey(name: 'options_keys') List<String>? optionsKeys
});




}
/// @nodoc
class _$ItemFieldCopyWithImpl<$Res>
    implements $ItemFieldCopyWith<$Res> {
  _$ItemFieldCopyWithImpl(this._self, this._then);

  final ItemField _self;
  final $Res Function(ItemField) _then;

/// Create a copy of ItemField
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? label = null,Object? type = null,Object? isRequired = null,Object? unique = null,Object? nullable = null,Object? options = freezed,Object? createdAt = null,Object? updatedAt = null,Object? pivot = freezed,Object? optionsKeys = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,isRequired: null == isRequired ? _self.isRequired : isRequired // ignore: cast_nullable_to_non_nullable
as int,unique: null == unique ? _self.unique : unique // ignore: cast_nullable_to_non_nullable
as int,nullable: null == nullable ? _self.nullable : nullable // ignore: cast_nullable_to_non_nullable
as int,options: freezed == options ? _self.options : options // ignore: cast_nullable_to_non_nullable
as dynamic,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,pivot: freezed == pivot ? _self.pivot : pivot // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,optionsKeys: freezed == optionsKeys ? _self.optionsKeys : optionsKeys // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}

}


/// Adds pattern-matching-related methods to [ItemField].
extension ItemFieldPatterns on ItemField {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ItemField value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ItemField() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ItemField value)  $default,){
final _that = this;
switch (_that) {
case _ItemField():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ItemField value)?  $default,){
final _that = this;
switch (_that) {
case _ItemField() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String label,  String type, @JsonKey(name: 'required')  int isRequired,  int unique,  int nullable,  dynamic options, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt,  Map<String, dynamic>? pivot, @JsonKey(name: 'options_keys')  List<String>? optionsKeys)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ItemField() when $default != null:
return $default(_that.id,_that.name,_that.label,_that.type,_that.isRequired,_that.unique,_that.nullable,_that.options,_that.createdAt,_that.updatedAt,_that.pivot,_that.optionsKeys);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String label,  String type, @JsonKey(name: 'required')  int isRequired,  int unique,  int nullable,  dynamic options, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt,  Map<String, dynamic>? pivot, @JsonKey(name: 'options_keys')  List<String>? optionsKeys)  $default,) {final _that = this;
switch (_that) {
case _ItemField():
return $default(_that.id,_that.name,_that.label,_that.type,_that.isRequired,_that.unique,_that.nullable,_that.options,_that.createdAt,_that.updatedAt,_that.pivot,_that.optionsKeys);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String label,  String type, @JsonKey(name: 'required')  int isRequired,  int unique,  int nullable,  dynamic options, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt,  Map<String, dynamic>? pivot, @JsonKey(name: 'options_keys')  List<String>? optionsKeys)?  $default,) {final _that = this;
switch (_that) {
case _ItemField() when $default != null:
return $default(_that.id,_that.name,_that.label,_that.type,_that.isRequired,_that.unique,_that.nullable,_that.options,_that.createdAt,_that.updatedAt,_that.pivot,_that.optionsKeys);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ItemField with DiagnosticableTreeMixin implements ItemField {
  const _ItemField({required this.id, required this.name, required this.label, required this.type, @JsonKey(name: 'required') required this.isRequired, required this.unique, required this.nullable, this.options, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'updated_at') required this.updatedAt, final  Map<String, dynamic>? pivot, @JsonKey(name: 'options_keys') final  List<String>? optionsKeys}): _pivot = pivot,_optionsKeys = optionsKeys;
  factory _ItemField.fromJson(Map<String, dynamic> json) => _$ItemFieldFromJson(json);

@override final  int id;
@override final  String name;
@override final  String label;
@override final  String type;
@override@JsonKey(name: 'required') final  int isRequired;
@override final  int unique;
@override final  int nullable;
@override final  dynamic options;
// Can be List, Map, or null
@override@JsonKey(name: 'created_at') final  DateTime createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime updatedAt;
 final  Map<String, dynamic>? _pivot;
@override Map<String, dynamic>? get pivot {
  final value = _pivot;
  if (value == null) return null;
  if (_pivot is EqualUnmodifiableMapView) return _pivot;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

 final  List<String>? _optionsKeys;
@override@JsonKey(name: 'options_keys') List<String>? get optionsKeys {
  final value = _optionsKeys;
  if (value == null) return null;
  if (_optionsKeys is EqualUnmodifiableListView) return _optionsKeys;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of ItemField
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ItemFieldCopyWith<_ItemField> get copyWith => __$ItemFieldCopyWithImpl<_ItemField>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ItemFieldToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ItemField'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('name', name))..add(DiagnosticsProperty('label', label))..add(DiagnosticsProperty('type', type))..add(DiagnosticsProperty('isRequired', isRequired))..add(DiagnosticsProperty('unique', unique))..add(DiagnosticsProperty('nullable', nullable))..add(DiagnosticsProperty('options', options))..add(DiagnosticsProperty('createdAt', createdAt))..add(DiagnosticsProperty('updatedAt', updatedAt))..add(DiagnosticsProperty('pivot', pivot))..add(DiagnosticsProperty('optionsKeys', optionsKeys));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ItemField&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.label, label) || other.label == label)&&(identical(other.type, type) || other.type == type)&&(identical(other.isRequired, isRequired) || other.isRequired == isRequired)&&(identical(other.unique, unique) || other.unique == unique)&&(identical(other.nullable, nullable) || other.nullable == nullable)&&const DeepCollectionEquality().equals(other.options, options)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other._pivot, _pivot)&&const DeepCollectionEquality().equals(other._optionsKeys, _optionsKeys));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,label,type,isRequired,unique,nullable,const DeepCollectionEquality().hash(options),createdAt,updatedAt,const DeepCollectionEquality().hash(_pivot),const DeepCollectionEquality().hash(_optionsKeys));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ItemField(id: $id, name: $name, label: $label, type: $type, isRequired: $isRequired, unique: $unique, nullable: $nullable, options: $options, createdAt: $createdAt, updatedAt: $updatedAt, pivot: $pivot, optionsKeys: $optionsKeys)';
}


}

/// @nodoc
abstract mixin class _$ItemFieldCopyWith<$Res> implements $ItemFieldCopyWith<$Res> {
  factory _$ItemFieldCopyWith(_ItemField value, $Res Function(_ItemField) _then) = __$ItemFieldCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String label, String type,@JsonKey(name: 'required') int isRequired, int unique, int nullable, dynamic options,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt, Map<String, dynamic>? pivot,@JsonKey(name: 'options_keys') List<String>? optionsKeys
});




}
/// @nodoc
class __$ItemFieldCopyWithImpl<$Res>
    implements _$ItemFieldCopyWith<$Res> {
  __$ItemFieldCopyWithImpl(this._self, this._then);

  final _ItemField _self;
  final $Res Function(_ItemField) _then;

/// Create a copy of ItemField
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? label = null,Object? type = null,Object? isRequired = null,Object? unique = null,Object? nullable = null,Object? options = freezed,Object? createdAt = null,Object? updatedAt = null,Object? pivot = freezed,Object? optionsKeys = freezed,}) {
  return _then(_ItemField(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,isRequired: null == isRequired ? _self.isRequired : isRequired // ignore: cast_nullable_to_non_nullable
as int,unique: null == unique ? _self.unique : unique // ignore: cast_nullable_to_non_nullable
as int,nullable: null == nullable ? _self.nullable : nullable // ignore: cast_nullable_to_non_nullable
as int,options: freezed == options ? _self.options : options // ignore: cast_nullable_to_non_nullable
as dynamic,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,pivot: freezed == pivot ? _self._pivot : pivot // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,optionsKeys: freezed == optionsKeys ? _self._optionsKeys : optionsKeys // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}


}


/// @nodoc
mixin _$Categories implements DiagnosticableTreeMixin {

 int get id;@JsonKey(name: 'user_id') String? get userId;@JsonKey(name: 'parent_id') int? get parentId; String get name; String get slug; String get description; List<String> get features; String get image;@JsonKey(name: 'created_at') DateTime get createdAt;@JsonKey(name: 'updated_at') DateTime get updatedAt;// Added missing fields from API response
@JsonKey(name: 'item_fields') List<ItemField> get itemFields;@JsonKey(name: 'highlighted_fields') List<ItemField> get highlightedFields;
/// Create a copy of Categories
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategoriesCopyWith<Categories> get copyWith => _$CategoriesCopyWithImpl<Categories>(this as Categories, _$identity);

  /// Serializes this Categories to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'Categories'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('userId', userId))..add(DiagnosticsProperty('parentId', parentId))..add(DiagnosticsProperty('name', name))..add(DiagnosticsProperty('slug', slug))..add(DiagnosticsProperty('description', description))..add(DiagnosticsProperty('features', features))..add(DiagnosticsProperty('image', image))..add(DiagnosticsProperty('createdAt', createdAt))..add(DiagnosticsProperty('updatedAt', updatedAt))..add(DiagnosticsProperty('itemFields', itemFields))..add(DiagnosticsProperty('highlightedFields', highlightedFields));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Categories&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.parentId, parentId) || other.parentId == parentId)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.features, features)&&(identical(other.image, image) || other.image == image)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other.itemFields, itemFields)&&const DeepCollectionEquality().equals(other.highlightedFields, highlightedFields));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,parentId,name,slug,description,const DeepCollectionEquality().hash(features),image,createdAt,updatedAt,const DeepCollectionEquality().hash(itemFields),const DeepCollectionEquality().hash(highlightedFields));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'Categories(id: $id, userId: $userId, parentId: $parentId, name: $name, slug: $slug, description: $description, features: $features, image: $image, createdAt: $createdAt, updatedAt: $updatedAt, itemFields: $itemFields, highlightedFields: $highlightedFields)';
}


}

/// @nodoc
abstract mixin class $CategoriesCopyWith<$Res>  {
  factory $CategoriesCopyWith(Categories value, $Res Function(Categories) _then) = _$CategoriesCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'user_id') String? userId,@JsonKey(name: 'parent_id') int? parentId, String name, String slug, String description, List<String> features, String image,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt,@JsonKey(name: 'item_fields') List<ItemField> itemFields,@JsonKey(name: 'highlighted_fields') List<ItemField> highlightedFields
});




}
/// @nodoc
class _$CategoriesCopyWithImpl<$Res>
    implements $CategoriesCopyWith<$Res> {
  _$CategoriesCopyWithImpl(this._self, this._then);

  final Categories _self;
  final $Res Function(Categories) _then;

/// Create a copy of Categories
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = freezed,Object? parentId = freezed,Object? name = null,Object? slug = null,Object? description = null,Object? features = null,Object? image = null,Object? createdAt = null,Object? updatedAt = null,Object? itemFields = null,Object? highlightedFields = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,parentId: freezed == parentId ? _self.parentId : parentId // ignore: cast_nullable_to_non_nullable
as int?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,features: null == features ? _self.features : features // ignore: cast_nullable_to_non_nullable
as List<String>,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,itemFields: null == itemFields ? _self.itemFields : itemFields // ignore: cast_nullable_to_non_nullable
as List<ItemField>,highlightedFields: null == highlightedFields ? _self.highlightedFields : highlightedFields // ignore: cast_nullable_to_non_nullable
as List<ItemField>,
  ));
}

}


/// Adds pattern-matching-related methods to [Categories].
extension CategoriesPatterns on Categories {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Categories value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Categories() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Categories value)  $default,){
final _that = this;
switch (_that) {
case _Categories():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Categories value)?  $default,){
final _that = this;
switch (_that) {
case _Categories() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'user_id')  String? userId, @JsonKey(name: 'parent_id')  int? parentId,  String name,  String slug,  String description,  List<String> features,  String image, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt, @JsonKey(name: 'item_fields')  List<ItemField> itemFields, @JsonKey(name: 'highlighted_fields')  List<ItemField> highlightedFields)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Categories() when $default != null:
return $default(_that.id,_that.userId,_that.parentId,_that.name,_that.slug,_that.description,_that.features,_that.image,_that.createdAt,_that.updatedAt,_that.itemFields,_that.highlightedFields);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'user_id')  String? userId, @JsonKey(name: 'parent_id')  int? parentId,  String name,  String slug,  String description,  List<String> features,  String image, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt, @JsonKey(name: 'item_fields')  List<ItemField> itemFields, @JsonKey(name: 'highlighted_fields')  List<ItemField> highlightedFields)  $default,) {final _that = this;
switch (_that) {
case _Categories():
return $default(_that.id,_that.userId,_that.parentId,_that.name,_that.slug,_that.description,_that.features,_that.image,_that.createdAt,_that.updatedAt,_that.itemFields,_that.highlightedFields);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'user_id')  String? userId, @JsonKey(name: 'parent_id')  int? parentId,  String name,  String slug,  String description,  List<String> features,  String image, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt, @JsonKey(name: 'item_fields')  List<ItemField> itemFields, @JsonKey(name: 'highlighted_fields')  List<ItemField> highlightedFields)?  $default,) {final _that = this;
switch (_that) {
case _Categories() when $default != null:
return $default(_that.id,_that.userId,_that.parentId,_that.name,_that.slug,_that.description,_that.features,_that.image,_that.createdAt,_that.updatedAt,_that.itemFields,_that.highlightedFields);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Categories with DiagnosticableTreeMixin implements Categories {
  const _Categories({required this.id, @JsonKey(name: 'user_id') this.userId, @JsonKey(name: 'parent_id') this.parentId, required this.name, this.slug = '', this.description = '', final  List<String> features = const [], this.image = 'assets/images/category_placeholder.png', @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'updated_at') required this.updatedAt, @JsonKey(name: 'item_fields') final  List<ItemField> itemFields = const [], @JsonKey(name: 'highlighted_fields') final  List<ItemField> highlightedFields = const []}): _features = features,_itemFields = itemFields,_highlightedFields = highlightedFields;
  factory _Categories.fromJson(Map<String, dynamic> json) => _$CategoriesFromJson(json);

@override final  int id;
@override@JsonKey(name: 'user_id') final  String? userId;
@override@JsonKey(name: 'parent_id') final  int? parentId;
@override final  String name;
@override@JsonKey() final  String slug;
@override@JsonKey() final  String description;
 final  List<String> _features;
@override@JsonKey() List<String> get features {
  if (_features is EqualUnmodifiableListView) return _features;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_features);
}

@override@JsonKey() final  String image;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime updatedAt;
// Added missing fields from API response
 final  List<ItemField> _itemFields;
// Added missing fields from API response
@override@JsonKey(name: 'item_fields') List<ItemField> get itemFields {
  if (_itemFields is EqualUnmodifiableListView) return _itemFields;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_itemFields);
}

 final  List<ItemField> _highlightedFields;
@override@JsonKey(name: 'highlighted_fields') List<ItemField> get highlightedFields {
  if (_highlightedFields is EqualUnmodifiableListView) return _highlightedFields;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_highlightedFields);
}


/// Create a copy of Categories
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CategoriesCopyWith<_Categories> get copyWith => __$CategoriesCopyWithImpl<_Categories>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CategoriesToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'Categories'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('userId', userId))..add(DiagnosticsProperty('parentId', parentId))..add(DiagnosticsProperty('name', name))..add(DiagnosticsProperty('slug', slug))..add(DiagnosticsProperty('description', description))..add(DiagnosticsProperty('features', features))..add(DiagnosticsProperty('image', image))..add(DiagnosticsProperty('createdAt', createdAt))..add(DiagnosticsProperty('updatedAt', updatedAt))..add(DiagnosticsProperty('itemFields', itemFields))..add(DiagnosticsProperty('highlightedFields', highlightedFields));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Categories&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.parentId, parentId) || other.parentId == parentId)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._features, _features)&&(identical(other.image, image) || other.image == image)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other._itemFields, _itemFields)&&const DeepCollectionEquality().equals(other._highlightedFields, _highlightedFields));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,parentId,name,slug,description,const DeepCollectionEquality().hash(_features),image,createdAt,updatedAt,const DeepCollectionEquality().hash(_itemFields),const DeepCollectionEquality().hash(_highlightedFields));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'Categories(id: $id, userId: $userId, parentId: $parentId, name: $name, slug: $slug, description: $description, features: $features, image: $image, createdAt: $createdAt, updatedAt: $updatedAt, itemFields: $itemFields, highlightedFields: $highlightedFields)';
}


}

/// @nodoc
abstract mixin class _$CategoriesCopyWith<$Res> implements $CategoriesCopyWith<$Res> {
  factory _$CategoriesCopyWith(_Categories value, $Res Function(_Categories) _then) = __$CategoriesCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'user_id') String? userId,@JsonKey(name: 'parent_id') int? parentId, String name, String slug, String description, List<String> features, String image,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt,@JsonKey(name: 'item_fields') List<ItemField> itemFields,@JsonKey(name: 'highlighted_fields') List<ItemField> highlightedFields
});




}
/// @nodoc
class __$CategoriesCopyWithImpl<$Res>
    implements _$CategoriesCopyWith<$Res> {
  __$CategoriesCopyWithImpl(this._self, this._then);

  final _Categories _self;
  final $Res Function(_Categories) _then;

/// Create a copy of Categories
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = freezed,Object? parentId = freezed,Object? name = null,Object? slug = null,Object? description = null,Object? features = null,Object? image = null,Object? createdAt = null,Object? updatedAt = null,Object? itemFields = null,Object? highlightedFields = null,}) {
  return _then(_Categories(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,parentId: freezed == parentId ? _self.parentId : parentId // ignore: cast_nullable_to_non_nullable
as int?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,features: null == features ? _self._features : features // ignore: cast_nullable_to_non_nullable
as List<String>,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,itemFields: null == itemFields ? _self._itemFields : itemFields // ignore: cast_nullable_to_non_nullable
as List<ItemField>,highlightedFields: null == highlightedFields ? _self._highlightedFields : highlightedFields // ignore: cast_nullable_to_non_nullable
as List<ItemField>,
  ));
}


}


/// @nodoc
mixin _$CategoriesResponse implements DiagnosticableTreeMixin {

 List<Categories> get data; PaginationLinks get links; PaginationMeta get meta;
/// Create a copy of CategoriesResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategoriesResponseCopyWith<CategoriesResponse> get copyWith => _$CategoriesResponseCopyWithImpl<CategoriesResponse>(this as CategoriesResponse, _$identity);

  /// Serializes this CategoriesResponse to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'CategoriesResponse'))
    ..add(DiagnosticsProperty('data', data))..add(DiagnosticsProperty('links', links))..add(DiagnosticsProperty('meta', meta));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoriesResponse&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.links, links) || other.links == links)&&(identical(other.meta, meta) || other.meta == meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data),links,meta);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'CategoriesResponse(data: $data, links: $links, meta: $meta)';
}


}

/// @nodoc
abstract mixin class $CategoriesResponseCopyWith<$Res>  {
  factory $CategoriesResponseCopyWith(CategoriesResponse value, $Res Function(CategoriesResponse) _then) = _$CategoriesResponseCopyWithImpl;
@useResult
$Res call({
 List<Categories> data, PaginationLinks links, PaginationMeta meta
});


$PaginationLinksCopyWith<$Res> get links;$PaginationMetaCopyWith<$Res> get meta;

}
/// @nodoc
class _$CategoriesResponseCopyWithImpl<$Res>
    implements $CategoriesResponseCopyWith<$Res> {
  _$CategoriesResponseCopyWithImpl(this._self, this._then);

  final CategoriesResponse _self;
  final $Res Function(CategoriesResponse) _then;

/// Create a copy of CategoriesResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = null,Object? links = null,Object? meta = null,}) {
  return _then(_self.copyWith(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<Categories>,links: null == links ? _self.links : links // ignore: cast_nullable_to_non_nullable
as PaginationLinks,meta: null == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as PaginationMeta,
  ));
}
/// Create a copy of CategoriesResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaginationLinksCopyWith<$Res> get links {
  
  return $PaginationLinksCopyWith<$Res>(_self.links, (value) {
    return _then(_self.copyWith(links: value));
  });
}/// Create a copy of CategoriesResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaginationMetaCopyWith<$Res> get meta {
  
  return $PaginationMetaCopyWith<$Res>(_self.meta, (value) {
    return _then(_self.copyWith(meta: value));
  });
}
}


/// Adds pattern-matching-related methods to [CategoriesResponse].
extension CategoriesResponsePatterns on CategoriesResponse {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CategoriesResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CategoriesResponse() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CategoriesResponse value)  $default,){
final _that = this;
switch (_that) {
case _CategoriesResponse():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CategoriesResponse value)?  $default,){
final _that = this;
switch (_that) {
case _CategoriesResponse() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Categories> data,  PaginationLinks links,  PaginationMeta meta)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CategoriesResponse() when $default != null:
return $default(_that.data,_that.links,_that.meta);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Categories> data,  PaginationLinks links,  PaginationMeta meta)  $default,) {final _that = this;
switch (_that) {
case _CategoriesResponse():
return $default(_that.data,_that.links,_that.meta);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Categories> data,  PaginationLinks links,  PaginationMeta meta)?  $default,) {final _that = this;
switch (_that) {
case _CategoriesResponse() when $default != null:
return $default(_that.data,_that.links,_that.meta);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CategoriesResponse with DiagnosticableTreeMixin implements CategoriesResponse {
  const _CategoriesResponse({final  List<Categories> data = const [], required this.links, required this.meta}): _data = data;
  factory _CategoriesResponse.fromJson(Map<String, dynamic> json) => _$CategoriesResponseFromJson(json);

 final  List<Categories> _data;
@override@JsonKey() List<Categories> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}

@override final  PaginationLinks links;
@override final  PaginationMeta meta;

/// Create a copy of CategoriesResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CategoriesResponseCopyWith<_CategoriesResponse> get copyWith => __$CategoriesResponseCopyWithImpl<_CategoriesResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CategoriesResponseToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'CategoriesResponse'))
    ..add(DiagnosticsProperty('data', data))..add(DiagnosticsProperty('links', links))..add(DiagnosticsProperty('meta', meta));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CategoriesResponse&&const DeepCollectionEquality().equals(other._data, _data)&&(identical(other.links, links) || other.links == links)&&(identical(other.meta, meta) || other.meta == meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_data),links,meta);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'CategoriesResponse(data: $data, links: $links, meta: $meta)';
}


}

/// @nodoc
abstract mixin class _$CategoriesResponseCopyWith<$Res> implements $CategoriesResponseCopyWith<$Res> {
  factory _$CategoriesResponseCopyWith(_CategoriesResponse value, $Res Function(_CategoriesResponse) _then) = __$CategoriesResponseCopyWithImpl;
@override @useResult
$Res call({
 List<Categories> data, PaginationLinks links, PaginationMeta meta
});


@override $PaginationLinksCopyWith<$Res> get links;@override $PaginationMetaCopyWith<$Res> get meta;

}
/// @nodoc
class __$CategoriesResponseCopyWithImpl<$Res>
    implements _$CategoriesResponseCopyWith<$Res> {
  __$CategoriesResponseCopyWithImpl(this._self, this._then);

  final _CategoriesResponse _self;
  final $Res Function(_CategoriesResponse) _then;

/// Create a copy of CategoriesResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,Object? links = null,Object? meta = null,}) {
  return _then(_CategoriesResponse(
data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<Categories>,links: null == links ? _self.links : links // ignore: cast_nullable_to_non_nullable
as PaginationLinks,meta: null == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as PaginationMeta,
  ));
}

/// Create a copy of CategoriesResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaginationLinksCopyWith<$Res> get links {
  
  return $PaginationLinksCopyWith<$Res>(_self.links, (value) {
    return _then(_self.copyWith(links: value));
  });
}/// Create a copy of CategoriesResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaginationMetaCopyWith<$Res> get meta {
  
  return $PaginationMetaCopyWith<$Res>(_self.meta, (value) {
    return _then(_self.copyWith(meta: value));
  });
}
}


/// @nodoc
mixin _$DetailedCategory implements DiagnosticableTreeMixin {

 int get id;@JsonKey(name: 'user_id') String? get userId;@JsonKey(name: 'parent_id') int? get parentId; String get name; String get slug; String get description; List<String> get features; String get image;@JsonKey(name: 'created_at') DateTime get createdAt;@JsonKey(name: 'updated_at') DateTime get updatedAt;@JsonKey(name: 'item_fields') List<ItemField> get itemFields;@JsonKey(name: 'highlighted_fields') List<ItemField> get highlightedFields;
/// Create a copy of DetailedCategory
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DetailedCategoryCopyWith<DetailedCategory> get copyWith => _$DetailedCategoryCopyWithImpl<DetailedCategory>(this as DetailedCategory, _$identity);

  /// Serializes this DetailedCategory to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'DetailedCategory'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('userId', userId))..add(DiagnosticsProperty('parentId', parentId))..add(DiagnosticsProperty('name', name))..add(DiagnosticsProperty('slug', slug))..add(DiagnosticsProperty('description', description))..add(DiagnosticsProperty('features', features))..add(DiagnosticsProperty('image', image))..add(DiagnosticsProperty('createdAt', createdAt))..add(DiagnosticsProperty('updatedAt', updatedAt))..add(DiagnosticsProperty('itemFields', itemFields))..add(DiagnosticsProperty('highlightedFields', highlightedFields));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DetailedCategory&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.parentId, parentId) || other.parentId == parentId)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.features, features)&&(identical(other.image, image) || other.image == image)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other.itemFields, itemFields)&&const DeepCollectionEquality().equals(other.highlightedFields, highlightedFields));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,parentId,name,slug,description,const DeepCollectionEquality().hash(features),image,createdAt,updatedAt,const DeepCollectionEquality().hash(itemFields),const DeepCollectionEquality().hash(highlightedFields));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'DetailedCategory(id: $id, userId: $userId, parentId: $parentId, name: $name, slug: $slug, description: $description, features: $features, image: $image, createdAt: $createdAt, updatedAt: $updatedAt, itemFields: $itemFields, highlightedFields: $highlightedFields)';
}


}

/// @nodoc
abstract mixin class $DetailedCategoryCopyWith<$Res>  {
  factory $DetailedCategoryCopyWith(DetailedCategory value, $Res Function(DetailedCategory) _then) = _$DetailedCategoryCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'user_id') String? userId,@JsonKey(name: 'parent_id') int? parentId, String name, String slug, String description, List<String> features, String image,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt,@JsonKey(name: 'item_fields') List<ItemField> itemFields,@JsonKey(name: 'highlighted_fields') List<ItemField> highlightedFields
});




}
/// @nodoc
class _$DetailedCategoryCopyWithImpl<$Res>
    implements $DetailedCategoryCopyWith<$Res> {
  _$DetailedCategoryCopyWithImpl(this._self, this._then);

  final DetailedCategory _self;
  final $Res Function(DetailedCategory) _then;

/// Create a copy of DetailedCategory
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = freezed,Object? parentId = freezed,Object? name = null,Object? slug = null,Object? description = null,Object? features = null,Object? image = null,Object? createdAt = null,Object? updatedAt = null,Object? itemFields = null,Object? highlightedFields = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,parentId: freezed == parentId ? _self.parentId : parentId // ignore: cast_nullable_to_non_nullable
as int?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,features: null == features ? _self.features : features // ignore: cast_nullable_to_non_nullable
as List<String>,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,itemFields: null == itemFields ? _self.itemFields : itemFields // ignore: cast_nullable_to_non_nullable
as List<ItemField>,highlightedFields: null == highlightedFields ? _self.highlightedFields : highlightedFields // ignore: cast_nullable_to_non_nullable
as List<ItemField>,
  ));
}

}


/// Adds pattern-matching-related methods to [DetailedCategory].
extension DetailedCategoryPatterns on DetailedCategory {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DetailedCategory value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DetailedCategory() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DetailedCategory value)  $default,){
final _that = this;
switch (_that) {
case _DetailedCategory():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DetailedCategory value)?  $default,){
final _that = this;
switch (_that) {
case _DetailedCategory() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'user_id')  String? userId, @JsonKey(name: 'parent_id')  int? parentId,  String name,  String slug,  String description,  List<String> features,  String image, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt, @JsonKey(name: 'item_fields')  List<ItemField> itemFields, @JsonKey(name: 'highlighted_fields')  List<ItemField> highlightedFields)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DetailedCategory() when $default != null:
return $default(_that.id,_that.userId,_that.parentId,_that.name,_that.slug,_that.description,_that.features,_that.image,_that.createdAt,_that.updatedAt,_that.itemFields,_that.highlightedFields);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'user_id')  String? userId, @JsonKey(name: 'parent_id')  int? parentId,  String name,  String slug,  String description,  List<String> features,  String image, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt, @JsonKey(name: 'item_fields')  List<ItemField> itemFields, @JsonKey(name: 'highlighted_fields')  List<ItemField> highlightedFields)  $default,) {final _that = this;
switch (_that) {
case _DetailedCategory():
return $default(_that.id,_that.userId,_that.parentId,_that.name,_that.slug,_that.description,_that.features,_that.image,_that.createdAt,_that.updatedAt,_that.itemFields,_that.highlightedFields);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'user_id')  String? userId, @JsonKey(name: 'parent_id')  int? parentId,  String name,  String slug,  String description,  List<String> features,  String image, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt, @JsonKey(name: 'item_fields')  List<ItemField> itemFields, @JsonKey(name: 'highlighted_fields')  List<ItemField> highlightedFields)?  $default,) {final _that = this;
switch (_that) {
case _DetailedCategory() when $default != null:
return $default(_that.id,_that.userId,_that.parentId,_that.name,_that.slug,_that.description,_that.features,_that.image,_that.createdAt,_that.updatedAt,_that.itemFields,_that.highlightedFields);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DetailedCategory with DiagnosticableTreeMixin implements DetailedCategory {
  const _DetailedCategory({required this.id, @JsonKey(name: 'user_id') this.userId, @JsonKey(name: 'parent_id') this.parentId, required this.name, this.slug = '', this.description = '', final  List<String> features = const [], this.image = 'assets/images/category_placeholder.png', @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'updated_at') required this.updatedAt, @JsonKey(name: 'item_fields') final  List<ItemField> itemFields = const [], @JsonKey(name: 'highlighted_fields') final  List<ItemField> highlightedFields = const []}): _features = features,_itemFields = itemFields,_highlightedFields = highlightedFields;
  factory _DetailedCategory.fromJson(Map<String, dynamic> json) => _$DetailedCategoryFromJson(json);

@override final  int id;
@override@JsonKey(name: 'user_id') final  String? userId;
@override@JsonKey(name: 'parent_id') final  int? parentId;
@override final  String name;
@override@JsonKey() final  String slug;
@override@JsonKey() final  String description;
 final  List<String> _features;
@override@JsonKey() List<String> get features {
  if (_features is EqualUnmodifiableListView) return _features;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_features);
}

@override@JsonKey() final  String image;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime updatedAt;
 final  List<ItemField> _itemFields;
@override@JsonKey(name: 'item_fields') List<ItemField> get itemFields {
  if (_itemFields is EqualUnmodifiableListView) return _itemFields;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_itemFields);
}

 final  List<ItemField> _highlightedFields;
@override@JsonKey(name: 'highlighted_fields') List<ItemField> get highlightedFields {
  if (_highlightedFields is EqualUnmodifiableListView) return _highlightedFields;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_highlightedFields);
}


/// Create a copy of DetailedCategory
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DetailedCategoryCopyWith<_DetailedCategory> get copyWith => __$DetailedCategoryCopyWithImpl<_DetailedCategory>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DetailedCategoryToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'DetailedCategory'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('userId', userId))..add(DiagnosticsProperty('parentId', parentId))..add(DiagnosticsProperty('name', name))..add(DiagnosticsProperty('slug', slug))..add(DiagnosticsProperty('description', description))..add(DiagnosticsProperty('features', features))..add(DiagnosticsProperty('image', image))..add(DiagnosticsProperty('createdAt', createdAt))..add(DiagnosticsProperty('updatedAt', updatedAt))..add(DiagnosticsProperty('itemFields', itemFields))..add(DiagnosticsProperty('highlightedFields', highlightedFields));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DetailedCategory&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.parentId, parentId) || other.parentId == parentId)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._features, _features)&&(identical(other.image, image) || other.image == image)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other._itemFields, _itemFields)&&const DeepCollectionEquality().equals(other._highlightedFields, _highlightedFields));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,parentId,name,slug,description,const DeepCollectionEquality().hash(_features),image,createdAt,updatedAt,const DeepCollectionEquality().hash(_itemFields),const DeepCollectionEquality().hash(_highlightedFields));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'DetailedCategory(id: $id, userId: $userId, parentId: $parentId, name: $name, slug: $slug, description: $description, features: $features, image: $image, createdAt: $createdAt, updatedAt: $updatedAt, itemFields: $itemFields, highlightedFields: $highlightedFields)';
}


}

/// @nodoc
abstract mixin class _$DetailedCategoryCopyWith<$Res> implements $DetailedCategoryCopyWith<$Res> {
  factory _$DetailedCategoryCopyWith(_DetailedCategory value, $Res Function(_DetailedCategory) _then) = __$DetailedCategoryCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'user_id') String? userId,@JsonKey(name: 'parent_id') int? parentId, String name, String slug, String description, List<String> features, String image,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt,@JsonKey(name: 'item_fields') List<ItemField> itemFields,@JsonKey(name: 'highlighted_fields') List<ItemField> highlightedFields
});




}
/// @nodoc
class __$DetailedCategoryCopyWithImpl<$Res>
    implements _$DetailedCategoryCopyWith<$Res> {
  __$DetailedCategoryCopyWithImpl(this._self, this._then);

  final _DetailedCategory _self;
  final $Res Function(_DetailedCategory) _then;

/// Create a copy of DetailedCategory
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = freezed,Object? parentId = freezed,Object? name = null,Object? slug = null,Object? description = null,Object? features = null,Object? image = null,Object? createdAt = null,Object? updatedAt = null,Object? itemFields = null,Object? highlightedFields = null,}) {
  return _then(_DetailedCategory(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,parentId: freezed == parentId ? _self.parentId : parentId // ignore: cast_nullable_to_non_nullable
as int?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,features: null == features ? _self._features : features // ignore: cast_nullable_to_non_nullable
as List<String>,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,itemFields: null == itemFields ? _self._itemFields : itemFields // ignore: cast_nullable_to_non_nullable
as List<ItemField>,highlightedFields: null == highlightedFields ? _self._highlightedFields : highlightedFields // ignore: cast_nullable_to_non_nullable
as List<ItemField>,
  ));
}


}


/// @nodoc
mixin _$DetailedCategoryResponse implements DiagnosticableTreeMixin {

 DetailedCategory get data;
/// Create a copy of DetailedCategoryResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DetailedCategoryResponseCopyWith<DetailedCategoryResponse> get copyWith => _$DetailedCategoryResponseCopyWithImpl<DetailedCategoryResponse>(this as DetailedCategoryResponse, _$identity);

  /// Serializes this DetailedCategoryResponse to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'DetailedCategoryResponse'))
    ..add(DiagnosticsProperty('data', data));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DetailedCategoryResponse&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,data);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'DetailedCategoryResponse(data: $data)';
}


}

/// @nodoc
abstract mixin class $DetailedCategoryResponseCopyWith<$Res>  {
  factory $DetailedCategoryResponseCopyWith(DetailedCategoryResponse value, $Res Function(DetailedCategoryResponse) _then) = _$DetailedCategoryResponseCopyWithImpl;
@useResult
$Res call({
 DetailedCategory data
});


$DetailedCategoryCopyWith<$Res> get data;

}
/// @nodoc
class _$DetailedCategoryResponseCopyWithImpl<$Res>
    implements $DetailedCategoryResponseCopyWith<$Res> {
  _$DetailedCategoryResponseCopyWithImpl(this._self, this._then);

  final DetailedCategoryResponse _self;
  final $Res Function(DetailedCategoryResponse) _then;

/// Create a copy of DetailedCategoryResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = null,}) {
  return _then(_self.copyWith(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as DetailedCategory,
  ));
}
/// Create a copy of DetailedCategoryResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DetailedCategoryCopyWith<$Res> get data {
  
  return $DetailedCategoryCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [DetailedCategoryResponse].
extension DetailedCategoryResponsePatterns on DetailedCategoryResponse {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DetailedCategoryResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DetailedCategoryResponse() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DetailedCategoryResponse value)  $default,){
final _that = this;
switch (_that) {
case _DetailedCategoryResponse():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DetailedCategoryResponse value)?  $default,){
final _that = this;
switch (_that) {
case _DetailedCategoryResponse() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DetailedCategory data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DetailedCategoryResponse() when $default != null:
return $default(_that.data);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DetailedCategory data)  $default,) {final _that = this;
switch (_that) {
case _DetailedCategoryResponse():
return $default(_that.data);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DetailedCategory data)?  $default,) {final _that = this;
switch (_that) {
case _DetailedCategoryResponse() when $default != null:
return $default(_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DetailedCategoryResponse with DiagnosticableTreeMixin implements DetailedCategoryResponse {
  const _DetailedCategoryResponse({required this.data});
  factory _DetailedCategoryResponse.fromJson(Map<String, dynamic> json) => _$DetailedCategoryResponseFromJson(json);

@override final  DetailedCategory data;

/// Create a copy of DetailedCategoryResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DetailedCategoryResponseCopyWith<_DetailedCategoryResponse> get copyWith => __$DetailedCategoryResponseCopyWithImpl<_DetailedCategoryResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DetailedCategoryResponseToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'DetailedCategoryResponse'))
    ..add(DiagnosticsProperty('data', data));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DetailedCategoryResponse&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,data);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'DetailedCategoryResponse(data: $data)';
}


}

/// @nodoc
abstract mixin class _$DetailedCategoryResponseCopyWith<$Res> implements $DetailedCategoryResponseCopyWith<$Res> {
  factory _$DetailedCategoryResponseCopyWith(_DetailedCategoryResponse value, $Res Function(_DetailedCategoryResponse) _then) = __$DetailedCategoryResponseCopyWithImpl;
@override @useResult
$Res call({
 DetailedCategory data
});


@override $DetailedCategoryCopyWith<$Res> get data;

}
/// @nodoc
class __$DetailedCategoryResponseCopyWithImpl<$Res>
    implements _$DetailedCategoryResponseCopyWith<$Res> {
  __$DetailedCategoryResponseCopyWithImpl(this._self, this._then);

  final _DetailedCategoryResponse _self;
  final $Res Function(_DetailedCategoryResponse) _then;

/// Create a copy of DetailedCategoryResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(_DetailedCategoryResponse(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as DetailedCategory,
  ));
}

/// Create a copy of DetailedCategoryResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DetailedCategoryCopyWith<$Res> get data {
  
  return $DetailedCategoryCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}

// dart format on
