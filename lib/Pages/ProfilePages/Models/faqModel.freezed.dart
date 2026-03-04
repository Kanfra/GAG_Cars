// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'faqModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FaqResponse {

 List<Faq> get data; FaqLinks get links; FaqMeta get meta;
/// Create a copy of FaqResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FaqResponseCopyWith<FaqResponse> get copyWith => _$FaqResponseCopyWithImpl<FaqResponse>(this as FaqResponse, _$identity);

  /// Serializes this FaqResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FaqResponse&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.links, links) || other.links == links)&&(identical(other.meta, meta) || other.meta == meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data),links,meta);

@override
String toString() {
  return 'FaqResponse(data: $data, links: $links, meta: $meta)';
}


}

/// @nodoc
abstract mixin class $FaqResponseCopyWith<$Res>  {
  factory $FaqResponseCopyWith(FaqResponse value, $Res Function(FaqResponse) _then) = _$FaqResponseCopyWithImpl;
@useResult
$Res call({
 List<Faq> data, FaqLinks links, FaqMeta meta
});


$FaqLinksCopyWith<$Res> get links;$FaqMetaCopyWith<$Res> get meta;

}
/// @nodoc
class _$FaqResponseCopyWithImpl<$Res>
    implements $FaqResponseCopyWith<$Res> {
  _$FaqResponseCopyWithImpl(this._self, this._then);

  final FaqResponse _self;
  final $Res Function(FaqResponse) _then;

/// Create a copy of FaqResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = null,Object? links = null,Object? meta = null,}) {
  return _then(_self.copyWith(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<Faq>,links: null == links ? _self.links : links // ignore: cast_nullable_to_non_nullable
as FaqLinks,meta: null == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as FaqMeta,
  ));
}
/// Create a copy of FaqResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FaqLinksCopyWith<$Res> get links {
  
  return $FaqLinksCopyWith<$Res>(_self.links, (value) {
    return _then(_self.copyWith(links: value));
  });
}/// Create a copy of FaqResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FaqMetaCopyWith<$Res> get meta {
  
  return $FaqMetaCopyWith<$Res>(_self.meta, (value) {
    return _then(_self.copyWith(meta: value));
  });
}
}


/// Adds pattern-matching-related methods to [FaqResponse].
extension FaqResponsePatterns on FaqResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FaqResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FaqResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FaqResponse value)  $default,){
final _that = this;
switch (_that) {
case _FaqResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FaqResponse value)?  $default,){
final _that = this;
switch (_that) {
case _FaqResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Faq> data,  FaqLinks links,  FaqMeta meta)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FaqResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Faq> data,  FaqLinks links,  FaqMeta meta)  $default,) {final _that = this;
switch (_that) {
case _FaqResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Faq> data,  FaqLinks links,  FaqMeta meta)?  $default,) {final _that = this;
switch (_that) {
case _FaqResponse() when $default != null:
return $default(_that.data,_that.links,_that.meta);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FaqResponse implements FaqResponse {
  const _FaqResponse({required final  List<Faq> data, required this.links, required this.meta}): _data = data;
  factory _FaqResponse.fromJson(Map<String, dynamic> json) => _$FaqResponseFromJson(json);

 final  List<Faq> _data;
@override List<Faq> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}

@override final  FaqLinks links;
@override final  FaqMeta meta;

/// Create a copy of FaqResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FaqResponseCopyWith<_FaqResponse> get copyWith => __$FaqResponseCopyWithImpl<_FaqResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FaqResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FaqResponse&&const DeepCollectionEquality().equals(other._data, _data)&&(identical(other.links, links) || other.links == links)&&(identical(other.meta, meta) || other.meta == meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_data),links,meta);

@override
String toString() {
  return 'FaqResponse(data: $data, links: $links, meta: $meta)';
}


}

/// @nodoc
abstract mixin class _$FaqResponseCopyWith<$Res> implements $FaqResponseCopyWith<$Res> {
  factory _$FaqResponseCopyWith(_FaqResponse value, $Res Function(_FaqResponse) _then) = __$FaqResponseCopyWithImpl;
@override @useResult
$Res call({
 List<Faq> data, FaqLinks links, FaqMeta meta
});


@override $FaqLinksCopyWith<$Res> get links;@override $FaqMetaCopyWith<$Res> get meta;

}
/// @nodoc
class __$FaqResponseCopyWithImpl<$Res>
    implements _$FaqResponseCopyWith<$Res> {
  __$FaqResponseCopyWithImpl(this._self, this._then);

  final _FaqResponse _self;
  final $Res Function(_FaqResponse) _then;

/// Create a copy of FaqResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,Object? links = null,Object? meta = null,}) {
  return _then(_FaqResponse(
data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<Faq>,links: null == links ? _self.links : links // ignore: cast_nullable_to_non_nullable
as FaqLinks,meta: null == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as FaqMeta,
  ));
}

/// Create a copy of FaqResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FaqLinksCopyWith<$Res> get links {
  
  return $FaqLinksCopyWith<$Res>(_self.links, (value) {
    return _then(_self.copyWith(links: value));
  });
}/// Create a copy of FaqResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FaqMetaCopyWith<$Res> get meta {
  
  return $FaqMetaCopyWith<$Res>(_self.meta, (value) {
    return _then(_self.copyWith(meta: value));
  });
}
}


/// @nodoc
mixin _$Faq {

 String get id;@JsonKey(name: 'user_id') String get userId; String get question; String get answer; String get status; List<String> get tags;@JsonKey(name: 'created_at') DateTime get createdAt;@JsonKey(name: 'updated_at') DateTime get updatedAt; String? get image;@JsonKey(name: 'category_id') int get categoryId; FaqUser get user; FaqCategory get category;
/// Create a copy of Faq
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FaqCopyWith<Faq> get copyWith => _$FaqCopyWithImpl<Faq>(this as Faq, _$identity);

  /// Serializes this Faq to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Faq&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.question, question) || other.question == question)&&(identical(other.answer, answer) || other.answer == answer)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.tags, tags)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.image, image) || other.image == image)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.user, user) || other.user == user)&&(identical(other.category, category) || other.category == category));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,question,answer,status,const DeepCollectionEquality().hash(tags),createdAt,updatedAt,image,categoryId,user,category);

@override
String toString() {
  return 'Faq(id: $id, userId: $userId, question: $question, answer: $answer, status: $status, tags: $tags, createdAt: $createdAt, updatedAt: $updatedAt, image: $image, categoryId: $categoryId, user: $user, category: $category)';
}


}

/// @nodoc
abstract mixin class $FaqCopyWith<$Res>  {
  factory $FaqCopyWith(Faq value, $Res Function(Faq) _then) = _$FaqCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'user_id') String userId, String question, String answer, String status, List<String> tags,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt, String? image,@JsonKey(name: 'category_id') int categoryId, FaqUser user, FaqCategory category
});


$FaqUserCopyWith<$Res> get user;$FaqCategoryCopyWith<$Res> get category;

}
/// @nodoc
class _$FaqCopyWithImpl<$Res>
    implements $FaqCopyWith<$Res> {
  _$FaqCopyWithImpl(this._self, this._then);

  final Faq _self;
  final $Res Function(Faq) _then;

/// Create a copy of Faq
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? question = null,Object? answer = null,Object? status = null,Object? tags = null,Object? createdAt = null,Object? updatedAt = null,Object? image = freezed,Object? categoryId = null,Object? user = null,Object? category = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,question: null == question ? _self.question : question // ignore: cast_nullable_to_non_nullable
as String,answer: null == answer ? _self.answer : answer // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,tags: null == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as FaqUser,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as FaqCategory,
  ));
}
/// Create a copy of Faq
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FaqUserCopyWith<$Res> get user {
  
  return $FaqUserCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}/// Create a copy of Faq
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FaqCategoryCopyWith<$Res> get category {
  
  return $FaqCategoryCopyWith<$Res>(_self.category, (value) {
    return _then(_self.copyWith(category: value));
  });
}
}


/// Adds pattern-matching-related methods to [Faq].
extension FaqPatterns on Faq {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Faq value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Faq() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Faq value)  $default,){
final _that = this;
switch (_that) {
case _Faq():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Faq value)?  $default,){
final _that = this;
switch (_that) {
case _Faq() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'user_id')  String userId,  String question,  String answer,  String status,  List<String> tags, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt,  String? image, @JsonKey(name: 'category_id')  int categoryId,  FaqUser user,  FaqCategory category)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Faq() when $default != null:
return $default(_that.id,_that.userId,_that.question,_that.answer,_that.status,_that.tags,_that.createdAt,_that.updatedAt,_that.image,_that.categoryId,_that.user,_that.category);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'user_id')  String userId,  String question,  String answer,  String status,  List<String> tags, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt,  String? image, @JsonKey(name: 'category_id')  int categoryId,  FaqUser user,  FaqCategory category)  $default,) {final _that = this;
switch (_that) {
case _Faq():
return $default(_that.id,_that.userId,_that.question,_that.answer,_that.status,_that.tags,_that.createdAt,_that.updatedAt,_that.image,_that.categoryId,_that.user,_that.category);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'user_id')  String userId,  String question,  String answer,  String status,  List<String> tags, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt,  String? image, @JsonKey(name: 'category_id')  int categoryId,  FaqUser user,  FaqCategory category)?  $default,) {final _that = this;
switch (_that) {
case _Faq() when $default != null:
return $default(_that.id,_that.userId,_that.question,_that.answer,_that.status,_that.tags,_that.createdAt,_that.updatedAt,_that.image,_that.categoryId,_that.user,_that.category);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Faq implements Faq {
  const _Faq({required this.id, @JsonKey(name: 'user_id') required this.userId, required this.question, required this.answer, required this.status, required final  List<String> tags, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'updated_at') required this.updatedAt, required this.image, @JsonKey(name: 'category_id') required this.categoryId, required this.user, required this.category}): _tags = tags;
  factory _Faq.fromJson(Map<String, dynamic> json) => _$FaqFromJson(json);

@override final  String id;
@override@JsonKey(name: 'user_id') final  String userId;
@override final  String question;
@override final  String answer;
@override final  String status;
 final  List<String> _tags;
@override List<String> get tags {
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tags);
}

@override@JsonKey(name: 'created_at') final  DateTime createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime updatedAt;
@override final  String? image;
@override@JsonKey(name: 'category_id') final  int categoryId;
@override final  FaqUser user;
@override final  FaqCategory category;

/// Create a copy of Faq
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FaqCopyWith<_Faq> get copyWith => __$FaqCopyWithImpl<_Faq>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FaqToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Faq&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.question, question) || other.question == question)&&(identical(other.answer, answer) || other.answer == answer)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._tags, _tags)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.image, image) || other.image == image)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.user, user) || other.user == user)&&(identical(other.category, category) || other.category == category));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,question,answer,status,const DeepCollectionEquality().hash(_tags),createdAt,updatedAt,image,categoryId,user,category);

@override
String toString() {
  return 'Faq(id: $id, userId: $userId, question: $question, answer: $answer, status: $status, tags: $tags, createdAt: $createdAt, updatedAt: $updatedAt, image: $image, categoryId: $categoryId, user: $user, category: $category)';
}


}

/// @nodoc
abstract mixin class _$FaqCopyWith<$Res> implements $FaqCopyWith<$Res> {
  factory _$FaqCopyWith(_Faq value, $Res Function(_Faq) _then) = __$FaqCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'user_id') String userId, String question, String answer, String status, List<String> tags,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt, String? image,@JsonKey(name: 'category_id') int categoryId, FaqUser user, FaqCategory category
});


@override $FaqUserCopyWith<$Res> get user;@override $FaqCategoryCopyWith<$Res> get category;

}
/// @nodoc
class __$FaqCopyWithImpl<$Res>
    implements _$FaqCopyWith<$Res> {
  __$FaqCopyWithImpl(this._self, this._then);

  final _Faq _self;
  final $Res Function(_Faq) _then;

/// Create a copy of Faq
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? question = null,Object? answer = null,Object? status = null,Object? tags = null,Object? createdAt = null,Object? updatedAt = null,Object? image = freezed,Object? categoryId = null,Object? user = null,Object? category = null,}) {
  return _then(_Faq(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,question: null == question ? _self.question : question // ignore: cast_nullable_to_non_nullable
as String,answer: null == answer ? _self.answer : answer // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,tags: null == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as FaqUser,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as FaqCategory,
  ));
}

/// Create a copy of Faq
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FaqUserCopyWith<$Res> get user {
  
  return $FaqUserCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}/// Create a copy of Faq
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FaqCategoryCopyWith<$Res> get category {
  
  return $FaqCategoryCopyWith<$Res>(_self.category, (value) {
    return _then(_self.copyWith(category: value));
  });
}
}


/// @nodoc
mixin _$FaqUser {

 String get id; String get name; String get email; String? get phone;@JsonKey(name: 'email_verified_at') DateTime? get emailVerifiedAt;@JsonKey(name: 'paid_seller') int get paidSeller;@JsonKey(name: 'deleted_at') DateTime? get deletedAt;@JsonKey(name: 'created_at') DateTime get createdAt;@JsonKey(name: 'updated_at') DateTime get updatedAt;@JsonKey(name: 'country_id') int? get countryId;@JsonKey(name: 'state_id') int? get stateId;@JsonKey(name: 'profile_photo') String? get profilePhoto;@JsonKey(name: 'uploads_left') int? get uploadsLeft;@JsonKey(name: 'active_status') int get activeStatus; String get avatar;@JsonKey(name: 'dark_mode') int get darkMode;@JsonKey(name: 'messenger_color') String get messengerColor;
/// Create a copy of FaqUser
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FaqUserCopyWith<FaqUser> get copyWith => _$FaqUserCopyWithImpl<FaqUser>(this as FaqUser, _$identity);

  /// Serializes this FaqUser to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FaqUser&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.emailVerifiedAt, emailVerifiedAt) || other.emailVerifiedAt == emailVerifiedAt)&&(identical(other.paidSeller, paidSeller) || other.paidSeller == paidSeller)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.countryId, countryId) || other.countryId == countryId)&&(identical(other.stateId, stateId) || other.stateId == stateId)&&(identical(other.profilePhoto, profilePhoto) || other.profilePhoto == profilePhoto)&&(identical(other.uploadsLeft, uploadsLeft) || other.uploadsLeft == uploadsLeft)&&(identical(other.activeStatus, activeStatus) || other.activeStatus == activeStatus)&&(identical(other.avatar, avatar) || other.avatar == avatar)&&(identical(other.darkMode, darkMode) || other.darkMode == darkMode)&&(identical(other.messengerColor, messengerColor) || other.messengerColor == messengerColor));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,email,phone,emailVerifiedAt,paidSeller,deletedAt,createdAt,updatedAt,countryId,stateId,profilePhoto,uploadsLeft,activeStatus,avatar,darkMode,messengerColor);

@override
String toString() {
  return 'FaqUser(id: $id, name: $name, email: $email, phone: $phone, emailVerifiedAt: $emailVerifiedAt, paidSeller: $paidSeller, deletedAt: $deletedAt, createdAt: $createdAt, updatedAt: $updatedAt, countryId: $countryId, stateId: $stateId, profilePhoto: $profilePhoto, uploadsLeft: $uploadsLeft, activeStatus: $activeStatus, avatar: $avatar, darkMode: $darkMode, messengerColor: $messengerColor)';
}


}

/// @nodoc
abstract mixin class $FaqUserCopyWith<$Res>  {
  factory $FaqUserCopyWith(FaqUser value, $Res Function(FaqUser) _then) = _$FaqUserCopyWithImpl;
@useResult
$Res call({
 String id, String name, String email, String? phone,@JsonKey(name: 'email_verified_at') DateTime? emailVerifiedAt,@JsonKey(name: 'paid_seller') int paidSeller,@JsonKey(name: 'deleted_at') DateTime? deletedAt,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt,@JsonKey(name: 'country_id') int? countryId,@JsonKey(name: 'state_id') int? stateId,@JsonKey(name: 'profile_photo') String? profilePhoto,@JsonKey(name: 'uploads_left') int? uploadsLeft,@JsonKey(name: 'active_status') int activeStatus, String avatar,@JsonKey(name: 'dark_mode') int darkMode,@JsonKey(name: 'messenger_color') String messengerColor
});




}
/// @nodoc
class _$FaqUserCopyWithImpl<$Res>
    implements $FaqUserCopyWith<$Res> {
  _$FaqUserCopyWithImpl(this._self, this._then);

  final FaqUser _self;
  final $Res Function(FaqUser) _then;

/// Create a copy of FaqUser
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? email = null,Object? phone = freezed,Object? emailVerifiedAt = freezed,Object? paidSeller = null,Object? deletedAt = freezed,Object? createdAt = null,Object? updatedAt = null,Object? countryId = freezed,Object? stateId = freezed,Object? profilePhoto = freezed,Object? uploadsLeft = freezed,Object? activeStatus = null,Object? avatar = null,Object? darkMode = null,Object? messengerColor = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,emailVerifiedAt: freezed == emailVerifiedAt ? _self.emailVerifiedAt : emailVerifiedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,paidSeller: null == paidSeller ? _self.paidSeller : paidSeller // ignore: cast_nullable_to_non_nullable
as int,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,countryId: freezed == countryId ? _self.countryId : countryId // ignore: cast_nullable_to_non_nullable
as int?,stateId: freezed == stateId ? _self.stateId : stateId // ignore: cast_nullable_to_non_nullable
as int?,profilePhoto: freezed == profilePhoto ? _self.profilePhoto : profilePhoto // ignore: cast_nullable_to_non_nullable
as String?,uploadsLeft: freezed == uploadsLeft ? _self.uploadsLeft : uploadsLeft // ignore: cast_nullable_to_non_nullable
as int?,activeStatus: null == activeStatus ? _self.activeStatus : activeStatus // ignore: cast_nullable_to_non_nullable
as int,avatar: null == avatar ? _self.avatar : avatar // ignore: cast_nullable_to_non_nullable
as String,darkMode: null == darkMode ? _self.darkMode : darkMode // ignore: cast_nullable_to_non_nullable
as int,messengerColor: null == messengerColor ? _self.messengerColor : messengerColor // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [FaqUser].
extension FaqUserPatterns on FaqUser {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FaqUser value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FaqUser() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FaqUser value)  $default,){
final _that = this;
switch (_that) {
case _FaqUser():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FaqUser value)?  $default,){
final _that = this;
switch (_that) {
case _FaqUser() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String email,  String? phone, @JsonKey(name: 'email_verified_at')  DateTime? emailVerifiedAt, @JsonKey(name: 'paid_seller')  int paidSeller, @JsonKey(name: 'deleted_at')  DateTime? deletedAt, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt, @JsonKey(name: 'country_id')  int? countryId, @JsonKey(name: 'state_id')  int? stateId, @JsonKey(name: 'profile_photo')  String? profilePhoto, @JsonKey(name: 'uploads_left')  int? uploadsLeft, @JsonKey(name: 'active_status')  int activeStatus,  String avatar, @JsonKey(name: 'dark_mode')  int darkMode, @JsonKey(name: 'messenger_color')  String messengerColor)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FaqUser() when $default != null:
return $default(_that.id,_that.name,_that.email,_that.phone,_that.emailVerifiedAt,_that.paidSeller,_that.deletedAt,_that.createdAt,_that.updatedAt,_that.countryId,_that.stateId,_that.profilePhoto,_that.uploadsLeft,_that.activeStatus,_that.avatar,_that.darkMode,_that.messengerColor);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String email,  String? phone, @JsonKey(name: 'email_verified_at')  DateTime? emailVerifiedAt, @JsonKey(name: 'paid_seller')  int paidSeller, @JsonKey(name: 'deleted_at')  DateTime? deletedAt, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt, @JsonKey(name: 'country_id')  int? countryId, @JsonKey(name: 'state_id')  int? stateId, @JsonKey(name: 'profile_photo')  String? profilePhoto, @JsonKey(name: 'uploads_left')  int? uploadsLeft, @JsonKey(name: 'active_status')  int activeStatus,  String avatar, @JsonKey(name: 'dark_mode')  int darkMode, @JsonKey(name: 'messenger_color')  String messengerColor)  $default,) {final _that = this;
switch (_that) {
case _FaqUser():
return $default(_that.id,_that.name,_that.email,_that.phone,_that.emailVerifiedAt,_that.paidSeller,_that.deletedAt,_that.createdAt,_that.updatedAt,_that.countryId,_that.stateId,_that.profilePhoto,_that.uploadsLeft,_that.activeStatus,_that.avatar,_that.darkMode,_that.messengerColor);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String email,  String? phone, @JsonKey(name: 'email_verified_at')  DateTime? emailVerifiedAt, @JsonKey(name: 'paid_seller')  int paidSeller, @JsonKey(name: 'deleted_at')  DateTime? deletedAt, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt, @JsonKey(name: 'country_id')  int? countryId, @JsonKey(name: 'state_id')  int? stateId, @JsonKey(name: 'profile_photo')  String? profilePhoto, @JsonKey(name: 'uploads_left')  int? uploadsLeft, @JsonKey(name: 'active_status')  int activeStatus,  String avatar, @JsonKey(name: 'dark_mode')  int darkMode, @JsonKey(name: 'messenger_color')  String messengerColor)?  $default,) {final _that = this;
switch (_that) {
case _FaqUser() when $default != null:
return $default(_that.id,_that.name,_that.email,_that.phone,_that.emailVerifiedAt,_that.paidSeller,_that.deletedAt,_that.createdAt,_that.updatedAt,_that.countryId,_that.stateId,_that.profilePhoto,_that.uploadsLeft,_that.activeStatus,_that.avatar,_that.darkMode,_that.messengerColor);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FaqUser implements FaqUser {
  const _FaqUser({required this.id, required this.name, required this.email, required this.phone, @JsonKey(name: 'email_verified_at') required this.emailVerifiedAt, @JsonKey(name: 'paid_seller') required this.paidSeller, @JsonKey(name: 'deleted_at') required this.deletedAt, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'updated_at') required this.updatedAt, @JsonKey(name: 'country_id') required this.countryId, @JsonKey(name: 'state_id') required this.stateId, @JsonKey(name: 'profile_photo') required this.profilePhoto, @JsonKey(name: 'uploads_left') required this.uploadsLeft, @JsonKey(name: 'active_status') required this.activeStatus, required this.avatar, @JsonKey(name: 'dark_mode') required this.darkMode, @JsonKey(name: 'messenger_color') required this.messengerColor});
  factory _FaqUser.fromJson(Map<String, dynamic> json) => _$FaqUserFromJson(json);

@override final  String id;
@override final  String name;
@override final  String email;
@override final  String? phone;
@override@JsonKey(name: 'email_verified_at') final  DateTime? emailVerifiedAt;
@override@JsonKey(name: 'paid_seller') final  int paidSeller;
@override@JsonKey(name: 'deleted_at') final  DateTime? deletedAt;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime updatedAt;
@override@JsonKey(name: 'country_id') final  int? countryId;
@override@JsonKey(name: 'state_id') final  int? stateId;
@override@JsonKey(name: 'profile_photo') final  String? profilePhoto;
@override@JsonKey(name: 'uploads_left') final  int? uploadsLeft;
@override@JsonKey(name: 'active_status') final  int activeStatus;
@override final  String avatar;
@override@JsonKey(name: 'dark_mode') final  int darkMode;
@override@JsonKey(name: 'messenger_color') final  String messengerColor;

/// Create a copy of FaqUser
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FaqUserCopyWith<_FaqUser> get copyWith => __$FaqUserCopyWithImpl<_FaqUser>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FaqUserToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FaqUser&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.emailVerifiedAt, emailVerifiedAt) || other.emailVerifiedAt == emailVerifiedAt)&&(identical(other.paidSeller, paidSeller) || other.paidSeller == paidSeller)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.countryId, countryId) || other.countryId == countryId)&&(identical(other.stateId, stateId) || other.stateId == stateId)&&(identical(other.profilePhoto, profilePhoto) || other.profilePhoto == profilePhoto)&&(identical(other.uploadsLeft, uploadsLeft) || other.uploadsLeft == uploadsLeft)&&(identical(other.activeStatus, activeStatus) || other.activeStatus == activeStatus)&&(identical(other.avatar, avatar) || other.avatar == avatar)&&(identical(other.darkMode, darkMode) || other.darkMode == darkMode)&&(identical(other.messengerColor, messengerColor) || other.messengerColor == messengerColor));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,email,phone,emailVerifiedAt,paidSeller,deletedAt,createdAt,updatedAt,countryId,stateId,profilePhoto,uploadsLeft,activeStatus,avatar,darkMode,messengerColor);

@override
String toString() {
  return 'FaqUser(id: $id, name: $name, email: $email, phone: $phone, emailVerifiedAt: $emailVerifiedAt, paidSeller: $paidSeller, deletedAt: $deletedAt, createdAt: $createdAt, updatedAt: $updatedAt, countryId: $countryId, stateId: $stateId, profilePhoto: $profilePhoto, uploadsLeft: $uploadsLeft, activeStatus: $activeStatus, avatar: $avatar, darkMode: $darkMode, messengerColor: $messengerColor)';
}


}

/// @nodoc
abstract mixin class _$FaqUserCopyWith<$Res> implements $FaqUserCopyWith<$Res> {
  factory _$FaqUserCopyWith(_FaqUser value, $Res Function(_FaqUser) _then) = __$FaqUserCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String email, String? phone,@JsonKey(name: 'email_verified_at') DateTime? emailVerifiedAt,@JsonKey(name: 'paid_seller') int paidSeller,@JsonKey(name: 'deleted_at') DateTime? deletedAt,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt,@JsonKey(name: 'country_id') int? countryId,@JsonKey(name: 'state_id') int? stateId,@JsonKey(name: 'profile_photo') String? profilePhoto,@JsonKey(name: 'uploads_left') int? uploadsLeft,@JsonKey(name: 'active_status') int activeStatus, String avatar,@JsonKey(name: 'dark_mode') int darkMode,@JsonKey(name: 'messenger_color') String messengerColor
});




}
/// @nodoc
class __$FaqUserCopyWithImpl<$Res>
    implements _$FaqUserCopyWith<$Res> {
  __$FaqUserCopyWithImpl(this._self, this._then);

  final _FaqUser _self;
  final $Res Function(_FaqUser) _then;

/// Create a copy of FaqUser
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? email = null,Object? phone = freezed,Object? emailVerifiedAt = freezed,Object? paidSeller = null,Object? deletedAt = freezed,Object? createdAt = null,Object? updatedAt = null,Object? countryId = freezed,Object? stateId = freezed,Object? profilePhoto = freezed,Object? uploadsLeft = freezed,Object? activeStatus = null,Object? avatar = null,Object? darkMode = null,Object? messengerColor = null,}) {
  return _then(_FaqUser(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,emailVerifiedAt: freezed == emailVerifiedAt ? _self.emailVerifiedAt : emailVerifiedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,paidSeller: null == paidSeller ? _self.paidSeller : paidSeller // ignore: cast_nullable_to_non_nullable
as int,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,countryId: freezed == countryId ? _self.countryId : countryId // ignore: cast_nullable_to_non_nullable
as int?,stateId: freezed == stateId ? _self.stateId : stateId // ignore: cast_nullable_to_non_nullable
as int?,profilePhoto: freezed == profilePhoto ? _self.profilePhoto : profilePhoto // ignore: cast_nullable_to_non_nullable
as String?,uploadsLeft: freezed == uploadsLeft ? _self.uploadsLeft : uploadsLeft // ignore: cast_nullable_to_non_nullable
as int?,activeStatus: null == activeStatus ? _self.activeStatus : activeStatus // ignore: cast_nullable_to_non_nullable
as int,avatar: null == avatar ? _self.avatar : avatar // ignore: cast_nullable_to_non_nullable
as String,darkMode: null == darkMode ? _self.darkMode : darkMode // ignore: cast_nullable_to_non_nullable
as int,messengerColor: null == messengerColor ? _self.messengerColor : messengerColor // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$FaqCategory {

 int get id; String get name; String get slug; String? get description; String get status;@JsonKey(name: 'created_at') DateTime get createdAt;@JsonKey(name: 'updated_at') DateTime get updatedAt;
/// Create a copy of FaqCategory
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FaqCategoryCopyWith<FaqCategory> get copyWith => _$FaqCategoryCopyWithImpl<FaqCategory>(this as FaqCategory, _$identity);

  /// Serializes this FaqCategory to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FaqCategory&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.description, description) || other.description == description)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,slug,description,status,createdAt,updatedAt);

@override
String toString() {
  return 'FaqCategory(id: $id, name: $name, slug: $slug, description: $description, status: $status, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $FaqCategoryCopyWith<$Res>  {
  factory $FaqCategoryCopyWith(FaqCategory value, $Res Function(FaqCategory) _then) = _$FaqCategoryCopyWithImpl;
@useResult
$Res call({
 int id, String name, String slug, String? description, String status,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt
});




}
/// @nodoc
class _$FaqCategoryCopyWithImpl<$Res>
    implements $FaqCategoryCopyWith<$Res> {
  _$FaqCategoryCopyWithImpl(this._self, this._then);

  final FaqCategory _self;
  final $Res Function(FaqCategory) _then;

/// Create a copy of FaqCategory
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? slug = null,Object? description = freezed,Object? status = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [FaqCategory].
extension FaqCategoryPatterns on FaqCategory {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FaqCategory value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FaqCategory() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FaqCategory value)  $default,){
final _that = this;
switch (_that) {
case _FaqCategory():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FaqCategory value)?  $default,){
final _that = this;
switch (_that) {
case _FaqCategory() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String slug,  String? description,  String status, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FaqCategory() when $default != null:
return $default(_that.id,_that.name,_that.slug,_that.description,_that.status,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String slug,  String? description,  String status, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _FaqCategory():
return $default(_that.id,_that.name,_that.slug,_that.description,_that.status,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String slug,  String? description,  String status, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _FaqCategory() when $default != null:
return $default(_that.id,_that.name,_that.slug,_that.description,_that.status,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FaqCategory implements FaqCategory {
  const _FaqCategory({required this.id, required this.name, required this.slug, required this.description, required this.status, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'updated_at') required this.updatedAt});
  factory _FaqCategory.fromJson(Map<String, dynamic> json) => _$FaqCategoryFromJson(json);

@override final  int id;
@override final  String name;
@override final  String slug;
@override final  String? description;
@override final  String status;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime updatedAt;

/// Create a copy of FaqCategory
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FaqCategoryCopyWith<_FaqCategory> get copyWith => __$FaqCategoryCopyWithImpl<_FaqCategory>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FaqCategoryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FaqCategory&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.description, description) || other.description == description)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,slug,description,status,createdAt,updatedAt);

@override
String toString() {
  return 'FaqCategory(id: $id, name: $name, slug: $slug, description: $description, status: $status, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$FaqCategoryCopyWith<$Res> implements $FaqCategoryCopyWith<$Res> {
  factory _$FaqCategoryCopyWith(_FaqCategory value, $Res Function(_FaqCategory) _then) = __$FaqCategoryCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String slug, String? description, String status,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt
});




}
/// @nodoc
class __$FaqCategoryCopyWithImpl<$Res>
    implements _$FaqCategoryCopyWith<$Res> {
  __$FaqCategoryCopyWithImpl(this._self, this._then);

  final _FaqCategory _self;
  final $Res Function(_FaqCategory) _then;

/// Create a copy of FaqCategory
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? slug = null,Object? description = freezed,Object? status = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_FaqCategory(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}


/// @nodoc
mixin _$FaqLinks {

 String get first; String get last; String? get prev; String? get next;
/// Create a copy of FaqLinks
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FaqLinksCopyWith<FaqLinks> get copyWith => _$FaqLinksCopyWithImpl<FaqLinks>(this as FaqLinks, _$identity);

  /// Serializes this FaqLinks to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FaqLinks&&(identical(other.first, first) || other.first == first)&&(identical(other.last, last) || other.last == last)&&(identical(other.prev, prev) || other.prev == prev)&&(identical(other.next, next) || other.next == next));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,first,last,prev,next);

@override
String toString() {
  return 'FaqLinks(first: $first, last: $last, prev: $prev, next: $next)';
}


}

/// @nodoc
abstract mixin class $FaqLinksCopyWith<$Res>  {
  factory $FaqLinksCopyWith(FaqLinks value, $Res Function(FaqLinks) _then) = _$FaqLinksCopyWithImpl;
@useResult
$Res call({
 String first, String last, String? prev, String? next
});




}
/// @nodoc
class _$FaqLinksCopyWithImpl<$Res>
    implements $FaqLinksCopyWith<$Res> {
  _$FaqLinksCopyWithImpl(this._self, this._then);

  final FaqLinks _self;
  final $Res Function(FaqLinks) _then;

/// Create a copy of FaqLinks
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


/// Adds pattern-matching-related methods to [FaqLinks].
extension FaqLinksPatterns on FaqLinks {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FaqLinks value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FaqLinks() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FaqLinks value)  $default,){
final _that = this;
switch (_that) {
case _FaqLinks():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FaqLinks value)?  $default,){
final _that = this;
switch (_that) {
case _FaqLinks() when $default != null:
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
case _FaqLinks() when $default != null:
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
case _FaqLinks():
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
case _FaqLinks() when $default != null:
return $default(_that.first,_that.last,_that.prev,_that.next);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FaqLinks implements FaqLinks {
  const _FaqLinks({required this.first, required this.last, required this.prev, required this.next});
  factory _FaqLinks.fromJson(Map<String, dynamic> json) => _$FaqLinksFromJson(json);

@override final  String first;
@override final  String last;
@override final  String? prev;
@override final  String? next;

/// Create a copy of FaqLinks
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FaqLinksCopyWith<_FaqLinks> get copyWith => __$FaqLinksCopyWithImpl<_FaqLinks>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FaqLinksToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FaqLinks&&(identical(other.first, first) || other.first == first)&&(identical(other.last, last) || other.last == last)&&(identical(other.prev, prev) || other.prev == prev)&&(identical(other.next, next) || other.next == next));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,first,last,prev,next);

@override
String toString() {
  return 'FaqLinks(first: $first, last: $last, prev: $prev, next: $next)';
}


}

/// @nodoc
abstract mixin class _$FaqLinksCopyWith<$Res> implements $FaqLinksCopyWith<$Res> {
  factory _$FaqLinksCopyWith(_FaqLinks value, $Res Function(_FaqLinks) _then) = __$FaqLinksCopyWithImpl;
@override @useResult
$Res call({
 String first, String last, String? prev, String? next
});




}
/// @nodoc
class __$FaqLinksCopyWithImpl<$Res>
    implements _$FaqLinksCopyWith<$Res> {
  __$FaqLinksCopyWithImpl(this._self, this._then);

  final _FaqLinks _self;
  final $Res Function(_FaqLinks) _then;

/// Create a copy of FaqLinks
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? first = null,Object? last = null,Object? prev = freezed,Object? next = freezed,}) {
  return _then(_FaqLinks(
first: null == first ? _self.first : first // ignore: cast_nullable_to_non_nullable
as String,last: null == last ? _self.last : last // ignore: cast_nullable_to_non_nullable
as String,prev: freezed == prev ? _self.prev : prev // ignore: cast_nullable_to_non_nullable
as String?,next: freezed == next ? _self.next : next // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$FaqMeta {

@JsonKey(name: 'current_page') int get currentPage; int get from;@JsonKey(name: 'last_page') int get lastPage; List<FaqMetaLink> get links; String get path;@JsonKey(name: 'per_page') int get perPage; int get to; int get total;
/// Create a copy of FaqMeta
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FaqMetaCopyWith<FaqMeta> get copyWith => _$FaqMetaCopyWithImpl<FaqMeta>(this as FaqMeta, _$identity);

  /// Serializes this FaqMeta to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FaqMeta&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.from, from) || other.from == from)&&(identical(other.lastPage, lastPage) || other.lastPage == lastPage)&&const DeepCollectionEquality().equals(other.links, links)&&(identical(other.path, path) || other.path == path)&&(identical(other.perPage, perPage) || other.perPage == perPage)&&(identical(other.to, to) || other.to == to)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,currentPage,from,lastPage,const DeepCollectionEquality().hash(links),path,perPage,to,total);

@override
String toString() {
  return 'FaqMeta(currentPage: $currentPage, from: $from, lastPage: $lastPage, links: $links, path: $path, perPage: $perPage, to: $to, total: $total)';
}


}

/// @nodoc
abstract mixin class $FaqMetaCopyWith<$Res>  {
  factory $FaqMetaCopyWith(FaqMeta value, $Res Function(FaqMeta) _then) = _$FaqMetaCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'current_page') int currentPage, int from,@JsonKey(name: 'last_page') int lastPage, List<FaqMetaLink> links, String path,@JsonKey(name: 'per_page') int perPage, int to, int total
});




}
/// @nodoc
class _$FaqMetaCopyWithImpl<$Res>
    implements $FaqMetaCopyWith<$Res> {
  _$FaqMetaCopyWithImpl(this._self, this._then);

  final FaqMeta _self;
  final $Res Function(FaqMeta) _then;

/// Create a copy of FaqMeta
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currentPage = null,Object? from = null,Object? lastPage = null,Object? links = null,Object? path = null,Object? perPage = null,Object? to = null,Object? total = null,}) {
  return _then(_self.copyWith(
currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,from: null == from ? _self.from : from // ignore: cast_nullable_to_non_nullable
as int,lastPage: null == lastPage ? _self.lastPage : lastPage // ignore: cast_nullable_to_non_nullable
as int,links: null == links ? _self.links : links // ignore: cast_nullable_to_non_nullable
as List<FaqMetaLink>,path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String,perPage: null == perPage ? _self.perPage : perPage // ignore: cast_nullable_to_non_nullable
as int,to: null == to ? _self.to : to // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [FaqMeta].
extension FaqMetaPatterns on FaqMeta {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FaqMeta value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FaqMeta() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FaqMeta value)  $default,){
final _that = this;
switch (_that) {
case _FaqMeta():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FaqMeta value)?  $default,){
final _that = this;
switch (_that) {
case _FaqMeta() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'current_page')  int currentPage,  int from, @JsonKey(name: 'last_page')  int lastPage,  List<FaqMetaLink> links,  String path, @JsonKey(name: 'per_page')  int perPage,  int to,  int total)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FaqMeta() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'current_page')  int currentPage,  int from, @JsonKey(name: 'last_page')  int lastPage,  List<FaqMetaLink> links,  String path, @JsonKey(name: 'per_page')  int perPage,  int to,  int total)  $default,) {final _that = this;
switch (_that) {
case _FaqMeta():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'current_page')  int currentPage,  int from, @JsonKey(name: 'last_page')  int lastPage,  List<FaqMetaLink> links,  String path, @JsonKey(name: 'per_page')  int perPage,  int to,  int total)?  $default,) {final _that = this;
switch (_that) {
case _FaqMeta() when $default != null:
return $default(_that.currentPage,_that.from,_that.lastPage,_that.links,_that.path,_that.perPage,_that.to,_that.total);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FaqMeta implements FaqMeta {
  const _FaqMeta({@JsonKey(name: 'current_page') required this.currentPage, required this.from, @JsonKey(name: 'last_page') required this.lastPage, required final  List<FaqMetaLink> links, required this.path, @JsonKey(name: 'per_page') required this.perPage, required this.to, required this.total}): _links = links;
  factory _FaqMeta.fromJson(Map<String, dynamic> json) => _$FaqMetaFromJson(json);

@override@JsonKey(name: 'current_page') final  int currentPage;
@override final  int from;
@override@JsonKey(name: 'last_page') final  int lastPage;
 final  List<FaqMetaLink> _links;
@override List<FaqMetaLink> get links {
  if (_links is EqualUnmodifiableListView) return _links;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_links);
}

@override final  String path;
@override@JsonKey(name: 'per_page') final  int perPage;
@override final  int to;
@override final  int total;

/// Create a copy of FaqMeta
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FaqMetaCopyWith<_FaqMeta> get copyWith => __$FaqMetaCopyWithImpl<_FaqMeta>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FaqMetaToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FaqMeta&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.from, from) || other.from == from)&&(identical(other.lastPage, lastPage) || other.lastPage == lastPage)&&const DeepCollectionEquality().equals(other._links, _links)&&(identical(other.path, path) || other.path == path)&&(identical(other.perPage, perPage) || other.perPage == perPage)&&(identical(other.to, to) || other.to == to)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,currentPage,from,lastPage,const DeepCollectionEquality().hash(_links),path,perPage,to,total);

@override
String toString() {
  return 'FaqMeta(currentPage: $currentPage, from: $from, lastPage: $lastPage, links: $links, path: $path, perPage: $perPage, to: $to, total: $total)';
}


}

/// @nodoc
abstract mixin class _$FaqMetaCopyWith<$Res> implements $FaqMetaCopyWith<$Res> {
  factory _$FaqMetaCopyWith(_FaqMeta value, $Res Function(_FaqMeta) _then) = __$FaqMetaCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'current_page') int currentPage, int from,@JsonKey(name: 'last_page') int lastPage, List<FaqMetaLink> links, String path,@JsonKey(name: 'per_page') int perPage, int to, int total
});




}
/// @nodoc
class __$FaqMetaCopyWithImpl<$Res>
    implements _$FaqMetaCopyWith<$Res> {
  __$FaqMetaCopyWithImpl(this._self, this._then);

  final _FaqMeta _self;
  final $Res Function(_FaqMeta) _then;

/// Create a copy of FaqMeta
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currentPage = null,Object? from = null,Object? lastPage = null,Object? links = null,Object? path = null,Object? perPage = null,Object? to = null,Object? total = null,}) {
  return _then(_FaqMeta(
currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,from: null == from ? _self.from : from // ignore: cast_nullable_to_non_nullable
as int,lastPage: null == lastPage ? _self.lastPage : lastPage // ignore: cast_nullable_to_non_nullable
as int,links: null == links ? _self._links : links // ignore: cast_nullable_to_non_nullable
as List<FaqMetaLink>,path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String,perPage: null == perPage ? _self.perPage : perPage // ignore: cast_nullable_to_non_nullable
as int,to: null == to ? _self.to : to // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$FaqMetaLink {

 String? get url; String get label; int? get page; bool get active;
/// Create a copy of FaqMetaLink
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FaqMetaLinkCopyWith<FaqMetaLink> get copyWith => _$FaqMetaLinkCopyWithImpl<FaqMetaLink>(this as FaqMetaLink, _$identity);

  /// Serializes this FaqMetaLink to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FaqMetaLink&&(identical(other.url, url) || other.url == url)&&(identical(other.label, label) || other.label == label)&&(identical(other.page, page) || other.page == page)&&(identical(other.active, active) || other.active == active));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,url,label,page,active);

@override
String toString() {
  return 'FaqMetaLink(url: $url, label: $label, page: $page, active: $active)';
}


}

/// @nodoc
abstract mixin class $FaqMetaLinkCopyWith<$Res>  {
  factory $FaqMetaLinkCopyWith(FaqMetaLink value, $Res Function(FaqMetaLink) _then) = _$FaqMetaLinkCopyWithImpl;
@useResult
$Res call({
 String? url, String label, int? page, bool active
});




}
/// @nodoc
class _$FaqMetaLinkCopyWithImpl<$Res>
    implements $FaqMetaLinkCopyWith<$Res> {
  _$FaqMetaLinkCopyWithImpl(this._self, this._then);

  final FaqMetaLink _self;
  final $Res Function(FaqMetaLink) _then;

/// Create a copy of FaqMetaLink
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


/// Adds pattern-matching-related methods to [FaqMetaLink].
extension FaqMetaLinkPatterns on FaqMetaLink {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FaqMetaLink value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FaqMetaLink() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FaqMetaLink value)  $default,){
final _that = this;
switch (_that) {
case _FaqMetaLink():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FaqMetaLink value)?  $default,){
final _that = this;
switch (_that) {
case _FaqMetaLink() when $default != null:
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
case _FaqMetaLink() when $default != null:
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
case _FaqMetaLink():
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
case _FaqMetaLink() when $default != null:
return $default(_that.url,_that.label,_that.page,_that.active);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FaqMetaLink implements FaqMetaLink {
  const _FaqMetaLink({required this.url, required this.label, required this.page, required this.active});
  factory _FaqMetaLink.fromJson(Map<String, dynamic> json) => _$FaqMetaLinkFromJson(json);

@override final  String? url;
@override final  String label;
@override final  int? page;
@override final  bool active;

/// Create a copy of FaqMetaLink
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FaqMetaLinkCopyWith<_FaqMetaLink> get copyWith => __$FaqMetaLinkCopyWithImpl<_FaqMetaLink>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FaqMetaLinkToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FaqMetaLink&&(identical(other.url, url) || other.url == url)&&(identical(other.label, label) || other.label == label)&&(identical(other.page, page) || other.page == page)&&(identical(other.active, active) || other.active == active));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,url,label,page,active);

@override
String toString() {
  return 'FaqMetaLink(url: $url, label: $label, page: $page, active: $active)';
}


}

/// @nodoc
abstract mixin class _$FaqMetaLinkCopyWith<$Res> implements $FaqMetaLinkCopyWith<$Res> {
  factory _$FaqMetaLinkCopyWith(_FaqMetaLink value, $Res Function(_FaqMetaLink) _then) = __$FaqMetaLinkCopyWithImpl;
@override @useResult
$Res call({
 String? url, String label, int? page, bool active
});




}
/// @nodoc
class __$FaqMetaLinkCopyWithImpl<$Res>
    implements _$FaqMetaLinkCopyWith<$Res> {
  __$FaqMetaLinkCopyWithImpl(this._self, this._then);

  final _FaqMetaLink _self;
  final $Res Function(_FaqMetaLink) _then;

/// Create a copy of FaqMetaLink
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? url = freezed,Object? label = null,Object? page = freezed,Object? active = null,}) {
  return _then(_FaqMetaLink(
url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,page: freezed == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int?,active: null == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
