// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'makeAndModelModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MakeAndModelResponse {

 List<VehicleMake> get data; PaginationLinks get links; PaginationMeta get meta;
/// Create a copy of MakeAndModelResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MakeAndModelResponseCopyWith<MakeAndModelResponse> get copyWith => _$MakeAndModelResponseCopyWithImpl<MakeAndModelResponse>(this as MakeAndModelResponse, _$identity);

  /// Serializes this MakeAndModelResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MakeAndModelResponse&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.links, links) || other.links == links)&&(identical(other.meta, meta) || other.meta == meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data),links,meta);

@override
String toString() {
  return 'MakeAndModelResponse(data: $data, links: $links, meta: $meta)';
}


}

/// @nodoc
abstract mixin class $MakeAndModelResponseCopyWith<$Res>  {
  factory $MakeAndModelResponseCopyWith(MakeAndModelResponse value, $Res Function(MakeAndModelResponse) _then) = _$MakeAndModelResponseCopyWithImpl;
@useResult
$Res call({
 List<VehicleMake> data, PaginationLinks links, PaginationMeta meta
});


$PaginationLinksCopyWith<$Res> get links;$PaginationMetaCopyWith<$Res> get meta;

}
/// @nodoc
class _$MakeAndModelResponseCopyWithImpl<$Res>
    implements $MakeAndModelResponseCopyWith<$Res> {
  _$MakeAndModelResponseCopyWithImpl(this._self, this._then);

  final MakeAndModelResponse _self;
  final $Res Function(MakeAndModelResponse) _then;

/// Create a copy of MakeAndModelResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = null,Object? links = null,Object? meta = null,}) {
  return _then(_self.copyWith(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<VehicleMake>,links: null == links ? _self.links : links // ignore: cast_nullable_to_non_nullable
as PaginationLinks,meta: null == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as PaginationMeta,
  ));
}
/// Create a copy of MakeAndModelResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaginationLinksCopyWith<$Res> get links {
  
  return $PaginationLinksCopyWith<$Res>(_self.links, (value) {
    return _then(_self.copyWith(links: value));
  });
}/// Create a copy of MakeAndModelResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaginationMetaCopyWith<$Res> get meta {
  
  return $PaginationMetaCopyWith<$Res>(_self.meta, (value) {
    return _then(_self.copyWith(meta: value));
  });
}
}


/// Adds pattern-matching-related methods to [MakeAndModelResponse].
extension MakeAndModelResponsePatterns on MakeAndModelResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MakeAndModelResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MakeAndModelResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MakeAndModelResponse value)  $default,){
final _that = this;
switch (_that) {
case _MakeAndModelResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MakeAndModelResponse value)?  $default,){
final _that = this;
switch (_that) {
case _MakeAndModelResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<VehicleMake> data,  PaginationLinks links,  PaginationMeta meta)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MakeAndModelResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<VehicleMake> data,  PaginationLinks links,  PaginationMeta meta)  $default,) {final _that = this;
switch (_that) {
case _MakeAndModelResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<VehicleMake> data,  PaginationLinks links,  PaginationMeta meta)?  $default,) {final _that = this;
switch (_that) {
case _MakeAndModelResponse() when $default != null:
return $default(_that.data,_that.links,_that.meta);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MakeAndModelResponse implements MakeAndModelResponse {
  const _MakeAndModelResponse({required final  List<VehicleMake> data, required this.links, required this.meta}): _data = data;
  factory _MakeAndModelResponse.fromJson(Map<String, dynamic> json) => _$MakeAndModelResponseFromJson(json);

 final  List<VehicleMake> _data;
@override List<VehicleMake> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}

@override final  PaginationLinks links;
@override final  PaginationMeta meta;

/// Create a copy of MakeAndModelResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MakeAndModelResponseCopyWith<_MakeAndModelResponse> get copyWith => __$MakeAndModelResponseCopyWithImpl<_MakeAndModelResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MakeAndModelResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MakeAndModelResponse&&const DeepCollectionEquality().equals(other._data, _data)&&(identical(other.links, links) || other.links == links)&&(identical(other.meta, meta) || other.meta == meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_data),links,meta);

@override
String toString() {
  return 'MakeAndModelResponse(data: $data, links: $links, meta: $meta)';
}


}

/// @nodoc
abstract mixin class _$MakeAndModelResponseCopyWith<$Res> implements $MakeAndModelResponseCopyWith<$Res> {
  factory _$MakeAndModelResponseCopyWith(_MakeAndModelResponse value, $Res Function(_MakeAndModelResponse) _then) = __$MakeAndModelResponseCopyWithImpl;
@override @useResult
$Res call({
 List<VehicleMake> data, PaginationLinks links, PaginationMeta meta
});


@override $PaginationLinksCopyWith<$Res> get links;@override $PaginationMetaCopyWith<$Res> get meta;

}
/// @nodoc
class __$MakeAndModelResponseCopyWithImpl<$Res>
    implements _$MakeAndModelResponseCopyWith<$Res> {
  __$MakeAndModelResponseCopyWithImpl(this._self, this._then);

  final _MakeAndModelResponse _self;
  final $Res Function(_MakeAndModelResponse) _then;

/// Create a copy of MakeAndModelResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,Object? links = null,Object? meta = null,}) {
  return _then(_MakeAndModelResponse(
data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<VehicleMake>,links: null == links ? _self.links : links // ignore: cast_nullable_to_non_nullable
as PaginationLinks,meta: null == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as PaginationMeta,
  ));
}

/// Create a copy of MakeAndModelResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaginationLinksCopyWith<$Res> get links {
  
  return $PaginationLinksCopyWith<$Res>(_self.links, (value) {
    return _then(_self.copyWith(links: value));
  });
}/// Create a copy of MakeAndModelResponse
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
mixin _$VehicleMake {

@JsonKey(fromJson: _parseInt) int get id;@JsonKey(name: 'user_id', fromJson: _parseInt) int? get userId; String get name; String get slug; String? get image;@JsonKey(name: 'created_at') DateTime get createdAt;@JsonKey(name: 'updated_at') DateTime get updatedAt;@JsonKey(name: 'brand_models') List<VehicleModel> get models;
/// Create a copy of VehicleMake
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VehicleMakeCopyWith<VehicleMake> get copyWith => _$VehicleMakeCopyWithImpl<VehicleMake>(this as VehicleMake, _$identity);

  /// Serializes this VehicleMake to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VehicleMake&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.image, image) || other.image == image)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other.models, models));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,name,slug,image,createdAt,updatedAt,const DeepCollectionEquality().hash(models));

@override
String toString() {
  return 'VehicleMake(id: $id, userId: $userId, name: $name, slug: $slug, image: $image, createdAt: $createdAt, updatedAt: $updatedAt, models: $models)';
}


}

/// @nodoc
abstract mixin class $VehicleMakeCopyWith<$Res>  {
  factory $VehicleMakeCopyWith(VehicleMake value, $Res Function(VehicleMake) _then) = _$VehicleMakeCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: _parseInt) int id,@JsonKey(name: 'user_id', fromJson: _parseInt) int? userId, String name, String slug, String? image,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt,@JsonKey(name: 'brand_models') List<VehicleModel> models
});




}
/// @nodoc
class _$VehicleMakeCopyWithImpl<$Res>
    implements $VehicleMakeCopyWith<$Res> {
  _$VehicleMakeCopyWithImpl(this._self, this._then);

  final VehicleMake _self;
  final $Res Function(VehicleMake) _then;

/// Create a copy of VehicleMake
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = freezed,Object? name = null,Object? slug = null,Object? image = freezed,Object? createdAt = null,Object? updatedAt = null,Object? models = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,models: null == models ? _self.models : models // ignore: cast_nullable_to_non_nullable
as List<VehicleModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [VehicleMake].
extension VehicleMakePatterns on VehicleMake {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VehicleMake value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VehicleMake() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VehicleMake value)  $default,){
final _that = this;
switch (_that) {
case _VehicleMake():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VehicleMake value)?  $default,){
final _that = this;
switch (_that) {
case _VehicleMake() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _parseInt)  int id, @JsonKey(name: 'user_id', fromJson: _parseInt)  int? userId,  String name,  String slug,  String? image, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt, @JsonKey(name: 'brand_models')  List<VehicleModel> models)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VehicleMake() when $default != null:
return $default(_that.id,_that.userId,_that.name,_that.slug,_that.image,_that.createdAt,_that.updatedAt,_that.models);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _parseInt)  int id, @JsonKey(name: 'user_id', fromJson: _parseInt)  int? userId,  String name,  String slug,  String? image, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt, @JsonKey(name: 'brand_models')  List<VehicleModel> models)  $default,) {final _that = this;
switch (_that) {
case _VehicleMake():
return $default(_that.id,_that.userId,_that.name,_that.slug,_that.image,_that.createdAt,_that.updatedAt,_that.models);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: _parseInt)  int id, @JsonKey(name: 'user_id', fromJson: _parseInt)  int? userId,  String name,  String slug,  String? image, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt, @JsonKey(name: 'brand_models')  List<VehicleModel> models)?  $default,) {final _that = this;
switch (_that) {
case _VehicleMake() when $default != null:
return $default(_that.id,_that.userId,_that.name,_that.slug,_that.image,_that.createdAt,_that.updatedAt,_that.models);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VehicleMake implements VehicleMake {
  const _VehicleMake({@JsonKey(fromJson: _parseInt) required this.id, @JsonKey(name: 'user_id', fromJson: _parseInt) this.userId, required this.name, required this.slug, this.image, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'updated_at') required this.updatedAt, @JsonKey(name: 'brand_models') required final  List<VehicleModel> models}): _models = models;
  factory _VehicleMake.fromJson(Map<String, dynamic> json) => _$VehicleMakeFromJson(json);

@override@JsonKey(fromJson: _parseInt) final  int id;
@override@JsonKey(name: 'user_id', fromJson: _parseInt) final  int? userId;
@override final  String name;
@override final  String slug;
@override final  String? image;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime updatedAt;
 final  List<VehicleModel> _models;
@override@JsonKey(name: 'brand_models') List<VehicleModel> get models {
  if (_models is EqualUnmodifiableListView) return _models;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_models);
}


/// Create a copy of VehicleMake
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VehicleMakeCopyWith<_VehicleMake> get copyWith => __$VehicleMakeCopyWithImpl<_VehicleMake>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VehicleMakeToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VehicleMake&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.image, image) || other.image == image)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other._models, _models));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,name,slug,image,createdAt,updatedAt,const DeepCollectionEquality().hash(_models));

@override
String toString() {
  return 'VehicleMake(id: $id, userId: $userId, name: $name, slug: $slug, image: $image, createdAt: $createdAt, updatedAt: $updatedAt, models: $models)';
}


}

/// @nodoc
abstract mixin class _$VehicleMakeCopyWith<$Res> implements $VehicleMakeCopyWith<$Res> {
  factory _$VehicleMakeCopyWith(_VehicleMake value, $Res Function(_VehicleMake) _then) = __$VehicleMakeCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: _parseInt) int id,@JsonKey(name: 'user_id', fromJson: _parseInt) int? userId, String name, String slug, String? image,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt,@JsonKey(name: 'brand_models') List<VehicleModel> models
});




}
/// @nodoc
class __$VehicleMakeCopyWithImpl<$Res>
    implements _$VehicleMakeCopyWith<$Res> {
  __$VehicleMakeCopyWithImpl(this._self, this._then);

  final _VehicleMake _self;
  final $Res Function(_VehicleMake) _then;

/// Create a copy of VehicleMake
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = freezed,Object? name = null,Object? slug = null,Object? image = freezed,Object? createdAt = null,Object? updatedAt = null,Object? models = null,}) {
  return _then(_VehicleMake(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,models: null == models ? _self._models : models // ignore: cast_nullable_to_non_nullable
as List<VehicleModel>,
  ));
}


}


/// @nodoc
mixin _$VehicleModel {

@JsonKey(fromJson: _parseInt) int get id;@JsonKey(name: 'brand_id', fromJson: _parseInt) int get makeId; String get name; String get slug;@JsonKey(name: 'created_at') DateTime get createdAt;@JsonKey(name: 'updated_at') DateTime get updatedAt;
/// Create a copy of VehicleModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VehicleModelCopyWith<VehicleModel> get copyWith => _$VehicleModelCopyWithImpl<VehicleModel>(this as VehicleModel, _$identity);

  /// Serializes this VehicleModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VehicleModel&&(identical(other.id, id) || other.id == id)&&(identical(other.makeId, makeId) || other.makeId == makeId)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,makeId,name,slug,createdAt,updatedAt);

@override
String toString() {
  return 'VehicleModel(id: $id, makeId: $makeId, name: $name, slug: $slug, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $VehicleModelCopyWith<$Res>  {
  factory $VehicleModelCopyWith(VehicleModel value, $Res Function(VehicleModel) _then) = _$VehicleModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: _parseInt) int id,@JsonKey(name: 'brand_id', fromJson: _parseInt) int makeId, String name, String slug,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt
});




}
/// @nodoc
class _$VehicleModelCopyWithImpl<$Res>
    implements $VehicleModelCopyWith<$Res> {
  _$VehicleModelCopyWithImpl(this._self, this._then);

  final VehicleModel _self;
  final $Res Function(VehicleModel) _then;

/// Create a copy of VehicleModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? makeId = null,Object? name = null,Object? slug = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,makeId: null == makeId ? _self.makeId : makeId // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [VehicleModel].
extension VehicleModelPatterns on VehicleModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VehicleModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VehicleModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VehicleModel value)  $default,){
final _that = this;
switch (_that) {
case _VehicleModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VehicleModel value)?  $default,){
final _that = this;
switch (_that) {
case _VehicleModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _parseInt)  int id, @JsonKey(name: 'brand_id', fromJson: _parseInt)  int makeId,  String name,  String slug, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VehicleModel() when $default != null:
return $default(_that.id,_that.makeId,_that.name,_that.slug,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _parseInt)  int id, @JsonKey(name: 'brand_id', fromJson: _parseInt)  int makeId,  String name,  String slug, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _VehicleModel():
return $default(_that.id,_that.makeId,_that.name,_that.slug,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: _parseInt)  int id, @JsonKey(name: 'brand_id', fromJson: _parseInt)  int makeId,  String name,  String slug, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _VehicleModel() when $default != null:
return $default(_that.id,_that.makeId,_that.name,_that.slug,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VehicleModel implements VehicleModel {
  const _VehicleModel({@JsonKey(fromJson: _parseInt) required this.id, @JsonKey(name: 'brand_id', fromJson: _parseInt) required this.makeId, required this.name, required this.slug, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'updated_at') required this.updatedAt});
  factory _VehicleModel.fromJson(Map<String, dynamic> json) => _$VehicleModelFromJson(json);

@override@JsonKey(fromJson: _parseInt) final  int id;
@override@JsonKey(name: 'brand_id', fromJson: _parseInt) final  int makeId;
@override final  String name;
@override final  String slug;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime updatedAt;

/// Create a copy of VehicleModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VehicleModelCopyWith<_VehicleModel> get copyWith => __$VehicleModelCopyWithImpl<_VehicleModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VehicleModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VehicleModel&&(identical(other.id, id) || other.id == id)&&(identical(other.makeId, makeId) || other.makeId == makeId)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,makeId,name,slug,createdAt,updatedAt);

@override
String toString() {
  return 'VehicleModel(id: $id, makeId: $makeId, name: $name, slug: $slug, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$VehicleModelCopyWith<$Res> implements $VehicleModelCopyWith<$Res> {
  factory _$VehicleModelCopyWith(_VehicleModel value, $Res Function(_VehicleModel) _then) = __$VehicleModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: _parseInt) int id,@JsonKey(name: 'brand_id', fromJson: _parseInt) int makeId, String name, String slug,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt
});




}
/// @nodoc
class __$VehicleModelCopyWithImpl<$Res>
    implements _$VehicleModelCopyWith<$Res> {
  __$VehicleModelCopyWithImpl(this._self, this._then);

  final _VehicleModel _self;
  final $Res Function(_VehicleModel) _then;

/// Create a copy of VehicleModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? makeId = null,Object? name = null,Object? slug = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_VehicleModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,makeId: null == makeId ? _self.makeId : makeId // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}


/// @nodoc
mixin _$PaginationLinks {

 String get first; String get last; String? get prev; String? get next;
/// Create a copy of PaginationLinks
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaginationLinksCopyWith<PaginationLinks> get copyWith => _$PaginationLinksCopyWithImpl<PaginationLinks>(this as PaginationLinks, _$identity);

  /// Serializes this PaginationLinks to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaginationLinks&&(identical(other.first, first) || other.first == first)&&(identical(other.last, last) || other.last == last)&&(identical(other.prev, prev) || other.prev == prev)&&(identical(other.next, next) || other.next == next));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,first,last,prev,next);

@override
String toString() {
  return 'PaginationLinks(first: $first, last: $last, prev: $prev, next: $next)';
}


}

/// @nodoc
abstract mixin class $PaginationLinksCopyWith<$Res>  {
  factory $PaginationLinksCopyWith(PaginationLinks value, $Res Function(PaginationLinks) _then) = _$PaginationLinksCopyWithImpl;
@useResult
$Res call({
 String first, String last, String? prev, String? next
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String first,  String last,  String? prev,  String? next)?  $default,{required TResult orElse(),}) {final _that = this;
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String first,  String last,  String? prev,  String? next)  $default,) {final _that = this;
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String first,  String last,  String? prev,  String? next)?  $default,) {final _that = this;
switch (_that) {
case _PaginationLinks() when $default != null:
return $default(_that.first,_that.last,_that.prev,_that.next);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PaginationLinks implements PaginationLinks {
  const _PaginationLinks({required this.first, required this.last, required this.prev, required this.next});
  factory _PaginationLinks.fromJson(Map<String, dynamic> json) => _$PaginationLinksFromJson(json);

@override final  String first;
@override final  String last;
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
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaginationLinks&&(identical(other.first, first) || other.first == first)&&(identical(other.last, last) || other.last == last)&&(identical(other.prev, prev) || other.prev == prev)&&(identical(other.next, next) || other.next == next));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,first,last,prev,next);

@override
String toString() {
  return 'PaginationLinks(first: $first, last: $last, prev: $prev, next: $next)';
}


}

/// @nodoc
abstract mixin class _$PaginationLinksCopyWith<$Res> implements $PaginationLinksCopyWith<$Res> {
  factory _$PaginationLinksCopyWith(_PaginationLinks value, $Res Function(_PaginationLinks) _then) = __$PaginationLinksCopyWithImpl;
@override @useResult
$Res call({
 String first, String last, String? prev, String? next
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
@override @pragma('vm:prefer-inline') $Res call({Object? first = null,Object? last = null,Object? prev = freezed,Object? next = freezed,}) {
  return _then(_PaginationLinks(
first: null == first ? _self.first : first // ignore: cast_nullable_to_non_nullable
as String,last: null == last ? _self.last : last // ignore: cast_nullable_to_non_nullable
as String,prev: freezed == prev ? _self.prev : prev // ignore: cast_nullable_to_non_nullable
as String?,next: freezed == next ? _self.next : next // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$PaginationMeta {

@JsonKey(name: 'current_page', fromJson: _parseInt) int get currentPage;@JsonKey(fromJson: _parseInt) int get from;@JsonKey(name: 'last_page', fromJson: _parseInt) int get lastPage; List<PaginationLink> get links; String get path;@JsonKey(name: 'per_page', fromJson: _parseInt) int get perPage;@JsonKey(fromJson: _parseInt) int get to;@JsonKey(fromJson: _parseInt) int get total;
/// Create a copy of PaginationMeta
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaginationMetaCopyWith<PaginationMeta> get copyWith => _$PaginationMetaCopyWithImpl<PaginationMeta>(this as PaginationMeta, _$identity);

  /// Serializes this PaginationMeta to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaginationMeta&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.from, from) || other.from == from)&&(identical(other.lastPage, lastPage) || other.lastPage == lastPage)&&const DeepCollectionEquality().equals(other.links, links)&&(identical(other.path, path) || other.path == path)&&(identical(other.perPage, perPage) || other.perPage == perPage)&&(identical(other.to, to) || other.to == to)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,currentPage,from,lastPage,const DeepCollectionEquality().hash(links),path,perPage,to,total);

@override
String toString() {
  return 'PaginationMeta(currentPage: $currentPage, from: $from, lastPage: $lastPage, links: $links, path: $path, perPage: $perPage, to: $to, total: $total)';
}


}

/// @nodoc
abstract mixin class $PaginationMetaCopyWith<$Res>  {
  factory $PaginationMetaCopyWith(PaginationMeta value, $Res Function(PaginationMeta) _then) = _$PaginationMetaCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'current_page', fromJson: _parseInt) int currentPage,@JsonKey(fromJson: _parseInt) int from,@JsonKey(name: 'last_page', fromJson: _parseInt) int lastPage, List<PaginationLink> links, String path,@JsonKey(name: 'per_page', fromJson: _parseInt) int perPage,@JsonKey(fromJson: _parseInt) int to,@JsonKey(fromJson: _parseInt) int total
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
@pragma('vm:prefer-inline') @override $Res call({Object? currentPage = null,Object? from = null,Object? lastPage = null,Object? links = null,Object? path = null,Object? perPage = null,Object? to = null,Object? total = null,}) {
  return _then(_self.copyWith(
currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,from: null == from ? _self.from : from // ignore: cast_nullable_to_non_nullable
as int,lastPage: null == lastPage ? _self.lastPage : lastPage // ignore: cast_nullable_to_non_nullable
as int,links: null == links ? _self.links : links // ignore: cast_nullable_to_non_nullable
as List<PaginationLink>,path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String,perPage: null == perPage ? _self.perPage : perPage // ignore: cast_nullable_to_non_nullable
as int,to: null == to ? _self.to : to // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'current_page', fromJson: _parseInt)  int currentPage, @JsonKey(fromJson: _parseInt)  int from, @JsonKey(name: 'last_page', fromJson: _parseInt)  int lastPage,  List<PaginationLink> links,  String path, @JsonKey(name: 'per_page', fromJson: _parseInt)  int perPage, @JsonKey(fromJson: _parseInt)  int to, @JsonKey(fromJson: _parseInt)  int total)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaginationMeta() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'current_page', fromJson: _parseInt)  int currentPage, @JsonKey(fromJson: _parseInt)  int from, @JsonKey(name: 'last_page', fromJson: _parseInt)  int lastPage,  List<PaginationLink> links,  String path, @JsonKey(name: 'per_page', fromJson: _parseInt)  int perPage, @JsonKey(fromJson: _parseInt)  int to, @JsonKey(fromJson: _parseInt)  int total)  $default,) {final _that = this;
switch (_that) {
case _PaginationMeta():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'current_page', fromJson: _parseInt)  int currentPage, @JsonKey(fromJson: _parseInt)  int from, @JsonKey(name: 'last_page', fromJson: _parseInt)  int lastPage,  List<PaginationLink> links,  String path, @JsonKey(name: 'per_page', fromJson: _parseInt)  int perPage, @JsonKey(fromJson: _parseInt)  int to, @JsonKey(fromJson: _parseInt)  int total)?  $default,) {final _that = this;
switch (_that) {
case _PaginationMeta() when $default != null:
return $default(_that.currentPage,_that.from,_that.lastPage,_that.links,_that.path,_that.perPage,_that.to,_that.total);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PaginationMeta implements PaginationMeta {
  const _PaginationMeta({@JsonKey(name: 'current_page', fromJson: _parseInt) required this.currentPage, @JsonKey(fromJson: _parseInt) required this.from, @JsonKey(name: 'last_page', fromJson: _parseInt) required this.lastPage, required final  List<PaginationLink> links, required this.path, @JsonKey(name: 'per_page', fromJson: _parseInt) required this.perPage, @JsonKey(fromJson: _parseInt) required this.to, @JsonKey(fromJson: _parseInt) required this.total}): _links = links;
  factory _PaginationMeta.fromJson(Map<String, dynamic> json) => _$PaginationMetaFromJson(json);

@override@JsonKey(name: 'current_page', fromJson: _parseInt) final  int currentPage;
@override@JsonKey(fromJson: _parseInt) final  int from;
@override@JsonKey(name: 'last_page', fromJson: _parseInt) final  int lastPage;
 final  List<PaginationLink> _links;
@override List<PaginationLink> get links {
  if (_links is EqualUnmodifiableListView) return _links;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_links);
}

@override final  String path;
@override@JsonKey(name: 'per_page', fromJson: _parseInt) final  int perPage;
@override@JsonKey(fromJson: _parseInt) final  int to;
@override@JsonKey(fromJson: _parseInt) final  int total;

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
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaginationMeta&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.from, from) || other.from == from)&&(identical(other.lastPage, lastPage) || other.lastPage == lastPage)&&const DeepCollectionEquality().equals(other._links, _links)&&(identical(other.path, path) || other.path == path)&&(identical(other.perPage, perPage) || other.perPage == perPage)&&(identical(other.to, to) || other.to == to)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,currentPage,from,lastPage,const DeepCollectionEquality().hash(_links),path,perPage,to,total);

@override
String toString() {
  return 'PaginationMeta(currentPage: $currentPage, from: $from, lastPage: $lastPage, links: $links, path: $path, perPage: $perPage, to: $to, total: $total)';
}


}

/// @nodoc
abstract mixin class _$PaginationMetaCopyWith<$Res> implements $PaginationMetaCopyWith<$Res> {
  factory _$PaginationMetaCopyWith(_PaginationMeta value, $Res Function(_PaginationMeta) _then) = __$PaginationMetaCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'current_page', fromJson: _parseInt) int currentPage,@JsonKey(fromJson: _parseInt) int from,@JsonKey(name: 'last_page', fromJson: _parseInt) int lastPage, List<PaginationLink> links, String path,@JsonKey(name: 'per_page', fromJson: _parseInt) int perPage,@JsonKey(fromJson: _parseInt) int to,@JsonKey(fromJson: _parseInt) int total
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
@override @pragma('vm:prefer-inline') $Res call({Object? currentPage = null,Object? from = null,Object? lastPage = null,Object? links = null,Object? path = null,Object? perPage = null,Object? to = null,Object? total = null,}) {
  return _then(_PaginationMeta(
currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,from: null == from ? _self.from : from // ignore: cast_nullable_to_non_nullable
as int,lastPage: null == lastPage ? _self.lastPage : lastPage // ignore: cast_nullable_to_non_nullable
as int,links: null == links ? _self._links : links // ignore: cast_nullable_to_non_nullable
as List<PaginationLink>,path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String,perPage: null == perPage ? _self.perPage : perPage // ignore: cast_nullable_to_non_nullable
as int,to: null == to ? _self.to : to // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$PaginationLink {

 String? get url; String get label; bool get active;
/// Create a copy of PaginationLink
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaginationLinkCopyWith<PaginationLink> get copyWith => _$PaginationLinkCopyWithImpl<PaginationLink>(this as PaginationLink, _$identity);

  /// Serializes this PaginationLink to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaginationLink&&(identical(other.url, url) || other.url == url)&&(identical(other.label, label) || other.label == label)&&(identical(other.active, active) || other.active == active));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,url,label,active);

@override
String toString() {
  return 'PaginationLink(url: $url, label: $label, active: $active)';
}


}

/// @nodoc
abstract mixin class $PaginationLinkCopyWith<$Res>  {
  factory $PaginationLinkCopyWith(PaginationLink value, $Res Function(PaginationLink) _then) = _$PaginationLinkCopyWithImpl;
@useResult
$Res call({
 String? url, String label, bool active
});




}
/// @nodoc
class _$PaginationLinkCopyWithImpl<$Res>
    implements $PaginationLinkCopyWith<$Res> {
  _$PaginationLinkCopyWithImpl(this._self, this._then);

  final PaginationLink _self;
  final $Res Function(PaginationLink) _then;

/// Create a copy of PaginationLink
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? url = freezed,Object? label = null,Object? active = null,}) {
  return _then(_self.copyWith(
url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,active: null == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [PaginationLink].
extension PaginationLinkPatterns on PaginationLink {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaginationLink value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaginationLink() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaginationLink value)  $default,){
final _that = this;
switch (_that) {
case _PaginationLink():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaginationLink value)?  $default,){
final _that = this;
switch (_that) {
case _PaginationLink() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? url,  String label,  bool active)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaginationLink() when $default != null:
return $default(_that.url,_that.label,_that.active);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? url,  String label,  bool active)  $default,) {final _that = this;
switch (_that) {
case _PaginationLink():
return $default(_that.url,_that.label,_that.active);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? url,  String label,  bool active)?  $default,) {final _that = this;
switch (_that) {
case _PaginationLink() when $default != null:
return $default(_that.url,_that.label,_that.active);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PaginationLink implements PaginationLink {
  const _PaginationLink({required this.url, required this.label, required this.active});
  factory _PaginationLink.fromJson(Map<String, dynamic> json) => _$PaginationLinkFromJson(json);

@override final  String? url;
@override final  String label;
@override final  bool active;

/// Create a copy of PaginationLink
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaginationLinkCopyWith<_PaginationLink> get copyWith => __$PaginationLinkCopyWithImpl<_PaginationLink>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaginationLinkToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaginationLink&&(identical(other.url, url) || other.url == url)&&(identical(other.label, label) || other.label == label)&&(identical(other.active, active) || other.active == active));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,url,label,active);

@override
String toString() {
  return 'PaginationLink(url: $url, label: $label, active: $active)';
}


}

/// @nodoc
abstract mixin class _$PaginationLinkCopyWith<$Res> implements $PaginationLinkCopyWith<$Res> {
  factory _$PaginationLinkCopyWith(_PaginationLink value, $Res Function(_PaginationLink) _then) = __$PaginationLinkCopyWithImpl;
@override @useResult
$Res call({
 String? url, String label, bool active
});




}
/// @nodoc
class __$PaginationLinkCopyWithImpl<$Res>
    implements _$PaginationLinkCopyWith<$Res> {
  __$PaginationLinkCopyWithImpl(this._self, this._then);

  final _PaginationLink _self;
  final $Res Function(_PaginationLink) _then;

/// Create a copy of PaginationLink
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? url = freezed,Object? label = null,Object? active = null,}) {
  return _then(_PaginationLink(
url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,active: null == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
