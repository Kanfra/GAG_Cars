// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'faqCategoryModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FaqCategoryResponse {

 List<FaqCategoryWithFaqs> get data; FaqCategoryLinks get links; FaqCategoryMeta get meta;
/// Create a copy of FaqCategoryResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FaqCategoryResponseCopyWith<FaqCategoryResponse> get copyWith => _$FaqCategoryResponseCopyWithImpl<FaqCategoryResponse>(this as FaqCategoryResponse, _$identity);

  /// Serializes this FaqCategoryResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FaqCategoryResponse&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.links, links) || other.links == links)&&(identical(other.meta, meta) || other.meta == meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data),links,meta);

@override
String toString() {
  return 'FaqCategoryResponse(data: $data, links: $links, meta: $meta)';
}


}

/// @nodoc
abstract mixin class $FaqCategoryResponseCopyWith<$Res>  {
  factory $FaqCategoryResponseCopyWith(FaqCategoryResponse value, $Res Function(FaqCategoryResponse) _then) = _$FaqCategoryResponseCopyWithImpl;
@useResult
$Res call({
 List<FaqCategoryWithFaqs> data, FaqCategoryLinks links, FaqCategoryMeta meta
});


$FaqCategoryLinksCopyWith<$Res> get links;$FaqCategoryMetaCopyWith<$Res> get meta;

}
/// @nodoc
class _$FaqCategoryResponseCopyWithImpl<$Res>
    implements $FaqCategoryResponseCopyWith<$Res> {
  _$FaqCategoryResponseCopyWithImpl(this._self, this._then);

  final FaqCategoryResponse _self;
  final $Res Function(FaqCategoryResponse) _then;

/// Create a copy of FaqCategoryResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = null,Object? links = null,Object? meta = null,}) {
  return _then(_self.copyWith(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<FaqCategoryWithFaqs>,links: null == links ? _self.links : links // ignore: cast_nullable_to_non_nullable
as FaqCategoryLinks,meta: null == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as FaqCategoryMeta,
  ));
}
/// Create a copy of FaqCategoryResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FaqCategoryLinksCopyWith<$Res> get links {
  
  return $FaqCategoryLinksCopyWith<$Res>(_self.links, (value) {
    return _then(_self.copyWith(links: value));
  });
}/// Create a copy of FaqCategoryResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FaqCategoryMetaCopyWith<$Res> get meta {
  
  return $FaqCategoryMetaCopyWith<$Res>(_self.meta, (value) {
    return _then(_self.copyWith(meta: value));
  });
}
}


/// Adds pattern-matching-related methods to [FaqCategoryResponse].
extension FaqCategoryResponsePatterns on FaqCategoryResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FaqCategoryResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FaqCategoryResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FaqCategoryResponse value)  $default,){
final _that = this;
switch (_that) {
case _FaqCategoryResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FaqCategoryResponse value)?  $default,){
final _that = this;
switch (_that) {
case _FaqCategoryResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<FaqCategoryWithFaqs> data,  FaqCategoryLinks links,  FaqCategoryMeta meta)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FaqCategoryResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<FaqCategoryWithFaqs> data,  FaqCategoryLinks links,  FaqCategoryMeta meta)  $default,) {final _that = this;
switch (_that) {
case _FaqCategoryResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<FaqCategoryWithFaqs> data,  FaqCategoryLinks links,  FaqCategoryMeta meta)?  $default,) {final _that = this;
switch (_that) {
case _FaqCategoryResponse() when $default != null:
return $default(_that.data,_that.links,_that.meta);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FaqCategoryResponse implements FaqCategoryResponse {
  const _FaqCategoryResponse({required final  List<FaqCategoryWithFaqs> data, required this.links, required this.meta}): _data = data;
  factory _FaqCategoryResponse.fromJson(Map<String, dynamic> json) => _$FaqCategoryResponseFromJson(json);

 final  List<FaqCategoryWithFaqs> _data;
@override List<FaqCategoryWithFaqs> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}

@override final  FaqCategoryLinks links;
@override final  FaqCategoryMeta meta;

/// Create a copy of FaqCategoryResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FaqCategoryResponseCopyWith<_FaqCategoryResponse> get copyWith => __$FaqCategoryResponseCopyWithImpl<_FaqCategoryResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FaqCategoryResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FaqCategoryResponse&&const DeepCollectionEquality().equals(other._data, _data)&&(identical(other.links, links) || other.links == links)&&(identical(other.meta, meta) || other.meta == meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_data),links,meta);

@override
String toString() {
  return 'FaqCategoryResponse(data: $data, links: $links, meta: $meta)';
}


}

/// @nodoc
abstract mixin class _$FaqCategoryResponseCopyWith<$Res> implements $FaqCategoryResponseCopyWith<$Res> {
  factory _$FaqCategoryResponseCopyWith(_FaqCategoryResponse value, $Res Function(_FaqCategoryResponse) _then) = __$FaqCategoryResponseCopyWithImpl;
@override @useResult
$Res call({
 List<FaqCategoryWithFaqs> data, FaqCategoryLinks links, FaqCategoryMeta meta
});


@override $FaqCategoryLinksCopyWith<$Res> get links;@override $FaqCategoryMetaCopyWith<$Res> get meta;

}
/// @nodoc
class __$FaqCategoryResponseCopyWithImpl<$Res>
    implements _$FaqCategoryResponseCopyWith<$Res> {
  __$FaqCategoryResponseCopyWithImpl(this._self, this._then);

  final _FaqCategoryResponse _self;
  final $Res Function(_FaqCategoryResponse) _then;

/// Create a copy of FaqCategoryResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,Object? links = null,Object? meta = null,}) {
  return _then(_FaqCategoryResponse(
data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<FaqCategoryWithFaqs>,links: null == links ? _self.links : links // ignore: cast_nullable_to_non_nullable
as FaqCategoryLinks,meta: null == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as FaqCategoryMeta,
  ));
}

/// Create a copy of FaqCategoryResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FaqCategoryLinksCopyWith<$Res> get links {
  
  return $FaqCategoryLinksCopyWith<$Res>(_self.links, (value) {
    return _then(_self.copyWith(links: value));
  });
}/// Create a copy of FaqCategoryResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FaqCategoryMetaCopyWith<$Res> get meta {
  
  return $FaqCategoryMetaCopyWith<$Res>(_self.meta, (value) {
    return _then(_self.copyWith(meta: value));
  });
}
}


/// @nodoc
mixin _$FaqCategoryWithFaqs {

 int get id; String get name; String get slug; String? get description; String get status;@JsonKey(name: 'created_at') DateTime get createdAt;@JsonKey(name: 'updated_at') DateTime get updatedAt;@JsonKey(name: 'faqs_count') int get faqsCount; List<FaqItem> get faqs;
/// Create a copy of FaqCategoryWithFaqs
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FaqCategoryWithFaqsCopyWith<FaqCategoryWithFaqs> get copyWith => _$FaqCategoryWithFaqsCopyWithImpl<FaqCategoryWithFaqs>(this as FaqCategoryWithFaqs, _$identity);

  /// Serializes this FaqCategoryWithFaqs to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FaqCategoryWithFaqs&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.description, description) || other.description == description)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.faqsCount, faqsCount) || other.faqsCount == faqsCount)&&const DeepCollectionEquality().equals(other.faqs, faqs));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,slug,description,status,createdAt,updatedAt,faqsCount,const DeepCollectionEquality().hash(faqs));

@override
String toString() {
  return 'FaqCategoryWithFaqs(id: $id, name: $name, slug: $slug, description: $description, status: $status, createdAt: $createdAt, updatedAt: $updatedAt, faqsCount: $faqsCount, faqs: $faqs)';
}


}

/// @nodoc
abstract mixin class $FaqCategoryWithFaqsCopyWith<$Res>  {
  factory $FaqCategoryWithFaqsCopyWith(FaqCategoryWithFaqs value, $Res Function(FaqCategoryWithFaqs) _then) = _$FaqCategoryWithFaqsCopyWithImpl;
@useResult
$Res call({
 int id, String name, String slug, String? description, String status,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt,@JsonKey(name: 'faqs_count') int faqsCount, List<FaqItem> faqs
});




}
/// @nodoc
class _$FaqCategoryWithFaqsCopyWithImpl<$Res>
    implements $FaqCategoryWithFaqsCopyWith<$Res> {
  _$FaqCategoryWithFaqsCopyWithImpl(this._self, this._then);

  final FaqCategoryWithFaqs _self;
  final $Res Function(FaqCategoryWithFaqs) _then;

/// Create a copy of FaqCategoryWithFaqs
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? slug = null,Object? description = freezed,Object? status = null,Object? createdAt = null,Object? updatedAt = null,Object? faqsCount = null,Object? faqs = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,faqsCount: null == faqsCount ? _self.faqsCount : faqsCount // ignore: cast_nullable_to_non_nullable
as int,faqs: null == faqs ? _self.faqs : faqs // ignore: cast_nullable_to_non_nullable
as List<FaqItem>,
  ));
}

}


/// Adds pattern-matching-related methods to [FaqCategoryWithFaqs].
extension FaqCategoryWithFaqsPatterns on FaqCategoryWithFaqs {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FaqCategoryWithFaqs value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FaqCategoryWithFaqs() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FaqCategoryWithFaqs value)  $default,){
final _that = this;
switch (_that) {
case _FaqCategoryWithFaqs():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FaqCategoryWithFaqs value)?  $default,){
final _that = this;
switch (_that) {
case _FaqCategoryWithFaqs() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String slug,  String? description,  String status, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt, @JsonKey(name: 'faqs_count')  int faqsCount,  List<FaqItem> faqs)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FaqCategoryWithFaqs() when $default != null:
return $default(_that.id,_that.name,_that.slug,_that.description,_that.status,_that.createdAt,_that.updatedAt,_that.faqsCount,_that.faqs);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String slug,  String? description,  String status, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt, @JsonKey(name: 'faqs_count')  int faqsCount,  List<FaqItem> faqs)  $default,) {final _that = this;
switch (_that) {
case _FaqCategoryWithFaqs():
return $default(_that.id,_that.name,_that.slug,_that.description,_that.status,_that.createdAt,_that.updatedAt,_that.faqsCount,_that.faqs);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String slug,  String? description,  String status, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt, @JsonKey(name: 'faqs_count')  int faqsCount,  List<FaqItem> faqs)?  $default,) {final _that = this;
switch (_that) {
case _FaqCategoryWithFaqs() when $default != null:
return $default(_that.id,_that.name,_that.slug,_that.description,_that.status,_that.createdAt,_that.updatedAt,_that.faqsCount,_that.faqs);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FaqCategoryWithFaqs implements FaqCategoryWithFaqs {
  const _FaqCategoryWithFaqs({required this.id, required this.name, required this.slug, required this.description, required this.status, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'updated_at') required this.updatedAt, @JsonKey(name: 'faqs_count') required this.faqsCount, required final  List<FaqItem> faqs}): _faqs = faqs;
  factory _FaqCategoryWithFaqs.fromJson(Map<String, dynamic> json) => _$FaqCategoryWithFaqsFromJson(json);

@override final  int id;
@override final  String name;
@override final  String slug;
@override final  String? description;
@override final  String status;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime updatedAt;
@override@JsonKey(name: 'faqs_count') final  int faqsCount;
 final  List<FaqItem> _faqs;
@override List<FaqItem> get faqs {
  if (_faqs is EqualUnmodifiableListView) return _faqs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_faqs);
}


/// Create a copy of FaqCategoryWithFaqs
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FaqCategoryWithFaqsCopyWith<_FaqCategoryWithFaqs> get copyWith => __$FaqCategoryWithFaqsCopyWithImpl<_FaqCategoryWithFaqs>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FaqCategoryWithFaqsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FaqCategoryWithFaqs&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.description, description) || other.description == description)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.faqsCount, faqsCount) || other.faqsCount == faqsCount)&&const DeepCollectionEquality().equals(other._faqs, _faqs));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,slug,description,status,createdAt,updatedAt,faqsCount,const DeepCollectionEquality().hash(_faqs));

@override
String toString() {
  return 'FaqCategoryWithFaqs(id: $id, name: $name, slug: $slug, description: $description, status: $status, createdAt: $createdAt, updatedAt: $updatedAt, faqsCount: $faqsCount, faqs: $faqs)';
}


}

/// @nodoc
abstract mixin class _$FaqCategoryWithFaqsCopyWith<$Res> implements $FaqCategoryWithFaqsCopyWith<$Res> {
  factory _$FaqCategoryWithFaqsCopyWith(_FaqCategoryWithFaqs value, $Res Function(_FaqCategoryWithFaqs) _then) = __$FaqCategoryWithFaqsCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String slug, String? description, String status,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt,@JsonKey(name: 'faqs_count') int faqsCount, List<FaqItem> faqs
});




}
/// @nodoc
class __$FaqCategoryWithFaqsCopyWithImpl<$Res>
    implements _$FaqCategoryWithFaqsCopyWith<$Res> {
  __$FaqCategoryWithFaqsCopyWithImpl(this._self, this._then);

  final _FaqCategoryWithFaqs _self;
  final $Res Function(_FaqCategoryWithFaqs) _then;

/// Create a copy of FaqCategoryWithFaqs
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? slug = null,Object? description = freezed,Object? status = null,Object? createdAt = null,Object? updatedAt = null,Object? faqsCount = null,Object? faqs = null,}) {
  return _then(_FaqCategoryWithFaqs(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,faqsCount: null == faqsCount ? _self.faqsCount : faqsCount // ignore: cast_nullable_to_non_nullable
as int,faqs: null == faqs ? _self._faqs : faqs // ignore: cast_nullable_to_non_nullable
as List<FaqItem>,
  ));
}


}


/// @nodoc
mixin _$FaqItem {

 String get id;@JsonKey(name: 'user_id') String get userId; String get question; String get answer; String get status; List<dynamic> get tags;@JsonKey(name: 'created_at') DateTime get createdAt;@JsonKey(name: 'updated_at') DateTime get updatedAt; String? get image;@JsonKey(name: 'category_id') int get categoryId;
/// Create a copy of FaqItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FaqItemCopyWith<FaqItem> get copyWith => _$FaqItemCopyWithImpl<FaqItem>(this as FaqItem, _$identity);

  /// Serializes this FaqItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FaqItem&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.question, question) || other.question == question)&&(identical(other.answer, answer) || other.answer == answer)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.tags, tags)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.image, image) || other.image == image)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,question,answer,status,const DeepCollectionEquality().hash(tags),createdAt,updatedAt,image,categoryId);

@override
String toString() {
  return 'FaqItem(id: $id, userId: $userId, question: $question, answer: $answer, status: $status, tags: $tags, createdAt: $createdAt, updatedAt: $updatedAt, image: $image, categoryId: $categoryId)';
}


}

/// @nodoc
abstract mixin class $FaqItemCopyWith<$Res>  {
  factory $FaqItemCopyWith(FaqItem value, $Res Function(FaqItem) _then) = _$FaqItemCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'user_id') String userId, String question, String answer, String status, List<dynamic> tags,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt, String? image,@JsonKey(name: 'category_id') int categoryId
});




}
/// @nodoc
class _$FaqItemCopyWithImpl<$Res>
    implements $FaqItemCopyWith<$Res> {
  _$FaqItemCopyWithImpl(this._self, this._then);

  final FaqItem _self;
  final $Res Function(FaqItem) _then;

/// Create a copy of FaqItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? question = null,Object? answer = null,Object? status = null,Object? tags = null,Object? createdAt = null,Object? updatedAt = null,Object? image = freezed,Object? categoryId = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,question: null == question ? _self.question : question // ignore: cast_nullable_to_non_nullable
as String,answer: null == answer ? _self.answer : answer // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,tags: null == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<dynamic>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [FaqItem].
extension FaqItemPatterns on FaqItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FaqItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FaqItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FaqItem value)  $default,){
final _that = this;
switch (_that) {
case _FaqItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FaqItem value)?  $default,){
final _that = this;
switch (_that) {
case _FaqItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'user_id')  String userId,  String question,  String answer,  String status,  List<dynamic> tags, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt,  String? image, @JsonKey(name: 'category_id')  int categoryId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FaqItem() when $default != null:
return $default(_that.id,_that.userId,_that.question,_that.answer,_that.status,_that.tags,_that.createdAt,_that.updatedAt,_that.image,_that.categoryId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'user_id')  String userId,  String question,  String answer,  String status,  List<dynamic> tags, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt,  String? image, @JsonKey(name: 'category_id')  int categoryId)  $default,) {final _that = this;
switch (_that) {
case _FaqItem():
return $default(_that.id,_that.userId,_that.question,_that.answer,_that.status,_that.tags,_that.createdAt,_that.updatedAt,_that.image,_that.categoryId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'user_id')  String userId,  String question,  String answer,  String status,  List<dynamic> tags, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt,  String? image, @JsonKey(name: 'category_id')  int categoryId)?  $default,) {final _that = this;
switch (_that) {
case _FaqItem() when $default != null:
return $default(_that.id,_that.userId,_that.question,_that.answer,_that.status,_that.tags,_that.createdAt,_that.updatedAt,_that.image,_that.categoryId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FaqItem implements FaqItem {
  const _FaqItem({required this.id, @JsonKey(name: 'user_id') required this.userId, required this.question, required this.answer, required this.status, required final  List<dynamic> tags, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'updated_at') required this.updatedAt, required this.image, @JsonKey(name: 'category_id') required this.categoryId}): _tags = tags;
  factory _FaqItem.fromJson(Map<String, dynamic> json) => _$FaqItemFromJson(json);

@override final  String id;
@override@JsonKey(name: 'user_id') final  String userId;
@override final  String question;
@override final  String answer;
@override final  String status;
 final  List<dynamic> _tags;
@override List<dynamic> get tags {
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tags);
}

@override@JsonKey(name: 'created_at') final  DateTime createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime updatedAt;
@override final  String? image;
@override@JsonKey(name: 'category_id') final  int categoryId;

/// Create a copy of FaqItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FaqItemCopyWith<_FaqItem> get copyWith => __$FaqItemCopyWithImpl<_FaqItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FaqItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FaqItem&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.question, question) || other.question == question)&&(identical(other.answer, answer) || other.answer == answer)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._tags, _tags)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.image, image) || other.image == image)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,question,answer,status,const DeepCollectionEquality().hash(_tags),createdAt,updatedAt,image,categoryId);

@override
String toString() {
  return 'FaqItem(id: $id, userId: $userId, question: $question, answer: $answer, status: $status, tags: $tags, createdAt: $createdAt, updatedAt: $updatedAt, image: $image, categoryId: $categoryId)';
}


}

/// @nodoc
abstract mixin class _$FaqItemCopyWith<$Res> implements $FaqItemCopyWith<$Res> {
  factory _$FaqItemCopyWith(_FaqItem value, $Res Function(_FaqItem) _then) = __$FaqItemCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'user_id') String userId, String question, String answer, String status, List<dynamic> tags,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt, String? image,@JsonKey(name: 'category_id') int categoryId
});




}
/// @nodoc
class __$FaqItemCopyWithImpl<$Res>
    implements _$FaqItemCopyWith<$Res> {
  __$FaqItemCopyWithImpl(this._self, this._then);

  final _FaqItem _self;
  final $Res Function(_FaqItem) _then;

/// Create a copy of FaqItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? question = null,Object? answer = null,Object? status = null,Object? tags = null,Object? createdAt = null,Object? updatedAt = null,Object? image = freezed,Object? categoryId = null,}) {
  return _then(_FaqItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,question: null == question ? _self.question : question // ignore: cast_nullable_to_non_nullable
as String,answer: null == answer ? _self.answer : answer // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,tags: null == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<dynamic>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$FaqCategoryLinks {

 String get first; String get last; String? get prev; String? get next;
/// Create a copy of FaqCategoryLinks
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FaqCategoryLinksCopyWith<FaqCategoryLinks> get copyWith => _$FaqCategoryLinksCopyWithImpl<FaqCategoryLinks>(this as FaqCategoryLinks, _$identity);

  /// Serializes this FaqCategoryLinks to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FaqCategoryLinks&&(identical(other.first, first) || other.first == first)&&(identical(other.last, last) || other.last == last)&&(identical(other.prev, prev) || other.prev == prev)&&(identical(other.next, next) || other.next == next));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,first,last,prev,next);

@override
String toString() {
  return 'FaqCategoryLinks(first: $first, last: $last, prev: $prev, next: $next)';
}


}

/// @nodoc
abstract mixin class $FaqCategoryLinksCopyWith<$Res>  {
  factory $FaqCategoryLinksCopyWith(FaqCategoryLinks value, $Res Function(FaqCategoryLinks) _then) = _$FaqCategoryLinksCopyWithImpl;
@useResult
$Res call({
 String first, String last, String? prev, String? next
});




}
/// @nodoc
class _$FaqCategoryLinksCopyWithImpl<$Res>
    implements $FaqCategoryLinksCopyWith<$Res> {
  _$FaqCategoryLinksCopyWithImpl(this._self, this._then);

  final FaqCategoryLinks _self;
  final $Res Function(FaqCategoryLinks) _then;

/// Create a copy of FaqCategoryLinks
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? first = null,Object? last = null,Object? prev = freezed,Object? next = freezed,}) {
  return _then(_self.copyWith(
first: null == first ? _self.first : first // ignore: cast_nullable_to_non_nullable
as String,last: null == last ? _self.last : last // ignore: cast_nullable_to_non_nullable
as String,prev: freezed == prev ? _self.prev : prev // ignore: cast_nullable_to_non_nullable
as String?,next: freezed == next ? _self.next : next // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [FaqCategoryLinks].
extension FaqCategoryLinksPatterns on FaqCategoryLinks {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FaqCategoryLinks value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FaqCategoryLinks() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FaqCategoryLinks value)  $default,){
final _that = this;
switch (_that) {
case _FaqCategoryLinks():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FaqCategoryLinks value)?  $default,){
final _that = this;
switch (_that) {
case _FaqCategoryLinks() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String first,  String last,  String? prev,  String? next)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FaqCategoryLinks() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String first,  String last,  String? prev,  String? next)  $default,) {final _that = this;
switch (_that) {
case _FaqCategoryLinks():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String first,  String last,  String? prev,  String? next)?  $default,) {final _that = this;
switch (_that) {
case _FaqCategoryLinks() when $default != null:
return $default(_that.first,_that.last,_that.prev,_that.next);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FaqCategoryLinks implements FaqCategoryLinks {
  const _FaqCategoryLinks({required this.first, required this.last, required this.prev, required this.next});
  factory _FaqCategoryLinks.fromJson(Map<String, dynamic> json) => _$FaqCategoryLinksFromJson(json);

@override final  String first;
@override final  String last;
@override final  String? prev;
@override final  String? next;

/// Create a copy of FaqCategoryLinks
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FaqCategoryLinksCopyWith<_FaqCategoryLinks> get copyWith => __$FaqCategoryLinksCopyWithImpl<_FaqCategoryLinks>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FaqCategoryLinksToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FaqCategoryLinks&&(identical(other.first, first) || other.first == first)&&(identical(other.last, last) || other.last == last)&&(identical(other.prev, prev) || other.prev == prev)&&(identical(other.next, next) || other.next == next));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,first,last,prev,next);

@override
String toString() {
  return 'FaqCategoryLinks(first: $first, last: $last, prev: $prev, next: $next)';
}


}

/// @nodoc
abstract mixin class _$FaqCategoryLinksCopyWith<$Res> implements $FaqCategoryLinksCopyWith<$Res> {
  factory _$FaqCategoryLinksCopyWith(_FaqCategoryLinks value, $Res Function(_FaqCategoryLinks) _then) = __$FaqCategoryLinksCopyWithImpl;
@override @useResult
$Res call({
 String first, String last, String? prev, String? next
});




}
/// @nodoc
class __$FaqCategoryLinksCopyWithImpl<$Res>
    implements _$FaqCategoryLinksCopyWith<$Res> {
  __$FaqCategoryLinksCopyWithImpl(this._self, this._then);

  final _FaqCategoryLinks _self;
  final $Res Function(_FaqCategoryLinks) _then;

/// Create a copy of FaqCategoryLinks
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? first = null,Object? last = null,Object? prev = freezed,Object? next = freezed,}) {
  return _then(_FaqCategoryLinks(
first: null == first ? _self.first : first // ignore: cast_nullable_to_non_nullable
as String,last: null == last ? _self.last : last // ignore: cast_nullable_to_non_nullable
as String,prev: freezed == prev ? _self.prev : prev // ignore: cast_nullable_to_non_nullable
as String?,next: freezed == next ? _self.next : next // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$FaqCategoryMeta {

@JsonKey(name: 'current_page') int get currentPage; int get from;@JsonKey(name: 'last_page') int get lastPage; List<FaqCategoryMetaLink> get links; String get path;@JsonKey(name: 'per_page') int get perPage; int get to; int get total;
/// Create a copy of FaqCategoryMeta
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FaqCategoryMetaCopyWith<FaqCategoryMeta> get copyWith => _$FaqCategoryMetaCopyWithImpl<FaqCategoryMeta>(this as FaqCategoryMeta, _$identity);

  /// Serializes this FaqCategoryMeta to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FaqCategoryMeta&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.from, from) || other.from == from)&&(identical(other.lastPage, lastPage) || other.lastPage == lastPage)&&const DeepCollectionEquality().equals(other.links, links)&&(identical(other.path, path) || other.path == path)&&(identical(other.perPage, perPage) || other.perPage == perPage)&&(identical(other.to, to) || other.to == to)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,currentPage,from,lastPage,const DeepCollectionEquality().hash(links),path,perPage,to,total);

@override
String toString() {
  return 'FaqCategoryMeta(currentPage: $currentPage, from: $from, lastPage: $lastPage, links: $links, path: $path, perPage: $perPage, to: $to, total: $total)';
}


}

/// @nodoc
abstract mixin class $FaqCategoryMetaCopyWith<$Res>  {
  factory $FaqCategoryMetaCopyWith(FaqCategoryMeta value, $Res Function(FaqCategoryMeta) _then) = _$FaqCategoryMetaCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'current_page') int currentPage, int from,@JsonKey(name: 'last_page') int lastPage, List<FaqCategoryMetaLink> links, String path,@JsonKey(name: 'per_page') int perPage, int to, int total
});




}
/// @nodoc
class _$FaqCategoryMetaCopyWithImpl<$Res>
    implements $FaqCategoryMetaCopyWith<$Res> {
  _$FaqCategoryMetaCopyWithImpl(this._self, this._then);

  final FaqCategoryMeta _self;
  final $Res Function(FaqCategoryMeta) _then;

/// Create a copy of FaqCategoryMeta
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currentPage = null,Object? from = null,Object? lastPage = null,Object? links = null,Object? path = null,Object? perPage = null,Object? to = null,Object? total = null,}) {
  return _then(_self.copyWith(
currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,from: null == from ? _self.from : from // ignore: cast_nullable_to_non_nullable
as int,lastPage: null == lastPage ? _self.lastPage : lastPage // ignore: cast_nullable_to_non_nullable
as int,links: null == links ? _self.links : links // ignore: cast_nullable_to_non_nullable
as List<FaqCategoryMetaLink>,path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String,perPage: null == perPage ? _self.perPage : perPage // ignore: cast_nullable_to_non_nullable
as int,to: null == to ? _self.to : to // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [FaqCategoryMeta].
extension FaqCategoryMetaPatterns on FaqCategoryMeta {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FaqCategoryMeta value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FaqCategoryMeta() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FaqCategoryMeta value)  $default,){
final _that = this;
switch (_that) {
case _FaqCategoryMeta():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FaqCategoryMeta value)?  $default,){
final _that = this;
switch (_that) {
case _FaqCategoryMeta() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'current_page')  int currentPage,  int from, @JsonKey(name: 'last_page')  int lastPage,  List<FaqCategoryMetaLink> links,  String path, @JsonKey(name: 'per_page')  int perPage,  int to,  int total)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FaqCategoryMeta() when $default != null:
return $default(_that.currentPage,_that.from,_that.lastPage,_that.links,_that.path,_that.perPage,_that.to,_that.total);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'current_page')  int currentPage,  int from, @JsonKey(name: 'last_page')  int lastPage,  List<FaqCategoryMetaLink> links,  String path, @JsonKey(name: 'per_page')  int perPage,  int to,  int total)  $default,) {final _that = this;
switch (_that) {
case _FaqCategoryMeta():
return $default(_that.currentPage,_that.from,_that.lastPage,_that.links,_that.path,_that.perPage,_that.to,_that.total);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'current_page')  int currentPage,  int from, @JsonKey(name: 'last_page')  int lastPage,  List<FaqCategoryMetaLink> links,  String path, @JsonKey(name: 'per_page')  int perPage,  int to,  int total)?  $default,) {final _that = this;
switch (_that) {
case _FaqCategoryMeta() when $default != null:
return $default(_that.currentPage,_that.from,_that.lastPage,_that.links,_that.path,_that.perPage,_that.to,_that.total);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FaqCategoryMeta implements FaqCategoryMeta {
  const _FaqCategoryMeta({@JsonKey(name: 'current_page') required this.currentPage, required this.from, @JsonKey(name: 'last_page') required this.lastPage, required final  List<FaqCategoryMetaLink> links, required this.path, @JsonKey(name: 'per_page') required this.perPage, required this.to, required this.total}): _links = links;
  factory _FaqCategoryMeta.fromJson(Map<String, dynamic> json) => _$FaqCategoryMetaFromJson(json);

@override@JsonKey(name: 'current_page') final  int currentPage;
@override final  int from;
@override@JsonKey(name: 'last_page') final  int lastPage;
 final  List<FaqCategoryMetaLink> _links;
@override List<FaqCategoryMetaLink> get links {
  if (_links is EqualUnmodifiableListView) return _links;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_links);
}

@override final  String path;
@override@JsonKey(name: 'per_page') final  int perPage;
@override final  int to;
@override final  int total;

/// Create a copy of FaqCategoryMeta
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FaqCategoryMetaCopyWith<_FaqCategoryMeta> get copyWith => __$FaqCategoryMetaCopyWithImpl<_FaqCategoryMeta>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FaqCategoryMetaToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FaqCategoryMeta&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.from, from) || other.from == from)&&(identical(other.lastPage, lastPage) || other.lastPage == lastPage)&&const DeepCollectionEquality().equals(other._links, _links)&&(identical(other.path, path) || other.path == path)&&(identical(other.perPage, perPage) || other.perPage == perPage)&&(identical(other.to, to) || other.to == to)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,currentPage,from,lastPage,const DeepCollectionEquality().hash(_links),path,perPage,to,total);

@override
String toString() {
  return 'FaqCategoryMeta(currentPage: $currentPage, from: $from, lastPage: $lastPage, links: $links, path: $path, perPage: $perPage, to: $to, total: $total)';
}


}

/// @nodoc
abstract mixin class _$FaqCategoryMetaCopyWith<$Res> implements $FaqCategoryMetaCopyWith<$Res> {
  factory _$FaqCategoryMetaCopyWith(_FaqCategoryMeta value, $Res Function(_FaqCategoryMeta) _then) = __$FaqCategoryMetaCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'current_page') int currentPage, int from,@JsonKey(name: 'last_page') int lastPage, List<FaqCategoryMetaLink> links, String path,@JsonKey(name: 'per_page') int perPage, int to, int total
});




}
/// @nodoc
class __$FaqCategoryMetaCopyWithImpl<$Res>
    implements _$FaqCategoryMetaCopyWith<$Res> {
  __$FaqCategoryMetaCopyWithImpl(this._self, this._then);

  final _FaqCategoryMeta _self;
  final $Res Function(_FaqCategoryMeta) _then;

/// Create a copy of FaqCategoryMeta
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currentPage = null,Object? from = null,Object? lastPage = null,Object? links = null,Object? path = null,Object? perPage = null,Object? to = null,Object? total = null,}) {
  return _then(_FaqCategoryMeta(
currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,from: null == from ? _self.from : from // ignore: cast_nullable_to_non_nullable
as int,lastPage: null == lastPage ? _self.lastPage : lastPage // ignore: cast_nullable_to_non_nullable
as int,links: null == links ? _self._links : links // ignore: cast_nullable_to_non_nullable
as List<FaqCategoryMetaLink>,path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String,perPage: null == perPage ? _self.perPage : perPage // ignore: cast_nullable_to_non_nullable
as int,to: null == to ? _self.to : to // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$FaqCategoryMetaLink {

 String? get url; String get label; int? get page; bool get active;
/// Create a copy of FaqCategoryMetaLink
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FaqCategoryMetaLinkCopyWith<FaqCategoryMetaLink> get copyWith => _$FaqCategoryMetaLinkCopyWithImpl<FaqCategoryMetaLink>(this as FaqCategoryMetaLink, _$identity);

  /// Serializes this FaqCategoryMetaLink to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FaqCategoryMetaLink&&(identical(other.url, url) || other.url == url)&&(identical(other.label, label) || other.label == label)&&(identical(other.page, page) || other.page == page)&&(identical(other.active, active) || other.active == active));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,url,label,page,active);

@override
String toString() {
  return 'FaqCategoryMetaLink(url: $url, label: $label, page: $page, active: $active)';
}


}

/// @nodoc
abstract mixin class $FaqCategoryMetaLinkCopyWith<$Res>  {
  factory $FaqCategoryMetaLinkCopyWith(FaqCategoryMetaLink value, $Res Function(FaqCategoryMetaLink) _then) = _$FaqCategoryMetaLinkCopyWithImpl;
@useResult
$Res call({
 String? url, String label, int? page, bool active
});




}
/// @nodoc
class _$FaqCategoryMetaLinkCopyWithImpl<$Res>
    implements $FaqCategoryMetaLinkCopyWith<$Res> {
  _$FaqCategoryMetaLinkCopyWithImpl(this._self, this._then);

  final FaqCategoryMetaLink _self;
  final $Res Function(FaqCategoryMetaLink) _then;

/// Create a copy of FaqCategoryMetaLink
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


/// Adds pattern-matching-related methods to [FaqCategoryMetaLink].
extension FaqCategoryMetaLinkPatterns on FaqCategoryMetaLink {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FaqCategoryMetaLink value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FaqCategoryMetaLink() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FaqCategoryMetaLink value)  $default,){
final _that = this;
switch (_that) {
case _FaqCategoryMetaLink():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FaqCategoryMetaLink value)?  $default,){
final _that = this;
switch (_that) {
case _FaqCategoryMetaLink() when $default != null:
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
case _FaqCategoryMetaLink() when $default != null:
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
case _FaqCategoryMetaLink():
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
case _FaqCategoryMetaLink() when $default != null:
return $default(_that.url,_that.label,_that.page,_that.active);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FaqCategoryMetaLink implements FaqCategoryMetaLink {
  const _FaqCategoryMetaLink({required this.url, required this.label, required this.page, required this.active});
  factory _FaqCategoryMetaLink.fromJson(Map<String, dynamic> json) => _$FaqCategoryMetaLinkFromJson(json);

@override final  String? url;
@override final  String label;
@override final  int? page;
@override final  bool active;

/// Create a copy of FaqCategoryMetaLink
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FaqCategoryMetaLinkCopyWith<_FaqCategoryMetaLink> get copyWith => __$FaqCategoryMetaLinkCopyWithImpl<_FaqCategoryMetaLink>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FaqCategoryMetaLinkToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FaqCategoryMetaLink&&(identical(other.url, url) || other.url == url)&&(identical(other.label, label) || other.label == label)&&(identical(other.page, page) || other.page == page)&&(identical(other.active, active) || other.active == active));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,url,label,page,active);

@override
String toString() {
  return 'FaqCategoryMetaLink(url: $url, label: $label, page: $page, active: $active)';
}


}

/// @nodoc
abstract mixin class _$FaqCategoryMetaLinkCopyWith<$Res> implements $FaqCategoryMetaLinkCopyWith<$Res> {
  factory _$FaqCategoryMetaLinkCopyWith(_FaqCategoryMetaLink value, $Res Function(_FaqCategoryMetaLink) _then) = __$FaqCategoryMetaLinkCopyWithImpl;
@override @useResult
$Res call({
 String? url, String label, int? page, bool active
});




}
/// @nodoc
class __$FaqCategoryMetaLinkCopyWithImpl<$Res>
    implements _$FaqCategoryMetaLinkCopyWith<$Res> {
  __$FaqCategoryMetaLinkCopyWithImpl(this._self, this._then);

  final _FaqCategoryMetaLink _self;
  final $Res Function(_FaqCategoryMetaLink) _then;

/// Create a copy of FaqCategoryMetaLink
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? url = freezed,Object? label = null,Object? page = freezed,Object? active = null,}) {
  return _then(_FaqCategoryMetaLink(
url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,page: freezed == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int?,active: null == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
