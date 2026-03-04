// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trendingMakeModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TrendingMake implements DiagnosticableTreeMixin {

@JsonKey(fromJson: _safeParseInt) int get id;@JsonKey(name: 'user_id', fromJson: _safeParseString) String? get userId;@JsonKey(fromJson: _safeParseStringWithDefault) String get name;@JsonKey(fromJson: _safeParseStringWithDefault) String get slug;@JsonKey(fromJson: _safeParseString) String? get image;@JsonKey(name: 'created_at', fromJson: _safeParseStringWithDefault) String get createdAt;@JsonKey(name: 'updated_at', fromJson: _safeParseStringWithDefault) String get updatedAt;@JsonKey(name: 'items_count', fromJson: _safeParseIntWithDefault) int get itemsCount;@JsonKey(name: 'brand_models', fromJson: _safeParseBrandModelList) List<BrandModel> get brandModels;
/// Create a copy of TrendingMake
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrendingMakeCopyWith<TrendingMake> get copyWith => _$TrendingMakeCopyWithImpl<TrendingMake>(this as TrendingMake, _$identity);

  /// Serializes this TrendingMake to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'TrendingMake'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('userId', userId))..add(DiagnosticsProperty('name', name))..add(DiagnosticsProperty('slug', slug))..add(DiagnosticsProperty('image', image))..add(DiagnosticsProperty('createdAt', createdAt))..add(DiagnosticsProperty('updatedAt', updatedAt))..add(DiagnosticsProperty('itemsCount', itemsCount))..add(DiagnosticsProperty('brandModels', brandModels));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrendingMake&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.image, image) || other.image == image)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.itemsCount, itemsCount) || other.itemsCount == itemsCount)&&const DeepCollectionEquality().equals(other.brandModels, brandModels));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,name,slug,image,createdAt,updatedAt,itemsCount,const DeepCollectionEquality().hash(brandModels));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'TrendingMake(id: $id, userId: $userId, name: $name, slug: $slug, image: $image, createdAt: $createdAt, updatedAt: $updatedAt, itemsCount: $itemsCount, brandModels: $brandModels)';
}


}

/// @nodoc
abstract mixin class $TrendingMakeCopyWith<$Res>  {
  factory $TrendingMakeCopyWith(TrendingMake value, $Res Function(TrendingMake) _then) = _$TrendingMakeCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: _safeParseInt) int id,@JsonKey(name: 'user_id', fromJson: _safeParseString) String? userId,@JsonKey(fromJson: _safeParseStringWithDefault) String name,@JsonKey(fromJson: _safeParseStringWithDefault) String slug,@JsonKey(fromJson: _safeParseString) String? image,@JsonKey(name: 'created_at', fromJson: _safeParseStringWithDefault) String createdAt,@JsonKey(name: 'updated_at', fromJson: _safeParseStringWithDefault) String updatedAt,@JsonKey(name: 'items_count', fromJson: _safeParseIntWithDefault) int itemsCount,@JsonKey(name: 'brand_models', fromJson: _safeParseBrandModelList) List<BrandModel> brandModels
});




}
/// @nodoc
class _$TrendingMakeCopyWithImpl<$Res>
    implements $TrendingMakeCopyWith<$Res> {
  _$TrendingMakeCopyWithImpl(this._self, this._then);

  final TrendingMake _self;
  final $Res Function(TrendingMake) _then;

/// Create a copy of TrendingMake
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = freezed,Object? name = null,Object? slug = null,Object? image = freezed,Object? createdAt = null,Object? updatedAt = null,Object? itemsCount = null,Object? brandModels = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,itemsCount: null == itemsCount ? _self.itemsCount : itemsCount // ignore: cast_nullable_to_non_nullable
as int,brandModels: null == brandModels ? _self.brandModels : brandModels // ignore: cast_nullable_to_non_nullable
as List<BrandModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [TrendingMake].
extension TrendingMakePatterns on TrendingMake {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TrendingMake value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TrendingMake() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TrendingMake value)  $default,){
final _that = this;
switch (_that) {
case _TrendingMake():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TrendingMake value)?  $default,){
final _that = this;
switch (_that) {
case _TrendingMake() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _safeParseInt)  int id, @JsonKey(name: 'user_id', fromJson: _safeParseString)  String? userId, @JsonKey(fromJson: _safeParseStringWithDefault)  String name, @JsonKey(fromJson: _safeParseStringWithDefault)  String slug, @JsonKey(fromJson: _safeParseString)  String? image, @JsonKey(name: 'created_at', fromJson: _safeParseStringWithDefault)  String createdAt, @JsonKey(name: 'updated_at', fromJson: _safeParseStringWithDefault)  String updatedAt, @JsonKey(name: 'items_count', fromJson: _safeParseIntWithDefault)  int itemsCount, @JsonKey(name: 'brand_models', fromJson: _safeParseBrandModelList)  List<BrandModel> brandModels)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TrendingMake() when $default != null:
return $default(_that.id,_that.userId,_that.name,_that.slug,_that.image,_that.createdAt,_that.updatedAt,_that.itemsCount,_that.brandModels);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _safeParseInt)  int id, @JsonKey(name: 'user_id', fromJson: _safeParseString)  String? userId, @JsonKey(fromJson: _safeParseStringWithDefault)  String name, @JsonKey(fromJson: _safeParseStringWithDefault)  String slug, @JsonKey(fromJson: _safeParseString)  String? image, @JsonKey(name: 'created_at', fromJson: _safeParseStringWithDefault)  String createdAt, @JsonKey(name: 'updated_at', fromJson: _safeParseStringWithDefault)  String updatedAt, @JsonKey(name: 'items_count', fromJson: _safeParseIntWithDefault)  int itemsCount, @JsonKey(name: 'brand_models', fromJson: _safeParseBrandModelList)  List<BrandModel> brandModels)  $default,) {final _that = this;
switch (_that) {
case _TrendingMake():
return $default(_that.id,_that.userId,_that.name,_that.slug,_that.image,_that.createdAt,_that.updatedAt,_that.itemsCount,_that.brandModels);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: _safeParseInt)  int id, @JsonKey(name: 'user_id', fromJson: _safeParseString)  String? userId, @JsonKey(fromJson: _safeParseStringWithDefault)  String name, @JsonKey(fromJson: _safeParseStringWithDefault)  String slug, @JsonKey(fromJson: _safeParseString)  String? image, @JsonKey(name: 'created_at', fromJson: _safeParseStringWithDefault)  String createdAt, @JsonKey(name: 'updated_at', fromJson: _safeParseStringWithDefault)  String updatedAt, @JsonKey(name: 'items_count', fromJson: _safeParseIntWithDefault)  int itemsCount, @JsonKey(name: 'brand_models', fromJson: _safeParseBrandModelList)  List<BrandModel> brandModels)?  $default,) {final _that = this;
switch (_that) {
case _TrendingMake() when $default != null:
return $default(_that.id,_that.userId,_that.name,_that.slug,_that.image,_that.createdAt,_that.updatedAt,_that.itemsCount,_that.brandModels);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TrendingMake with DiagnosticableTreeMixin implements TrendingMake {
  const _TrendingMake({@JsonKey(fromJson: _safeParseInt) required this.id, @JsonKey(name: 'user_id', fromJson: _safeParseString) this.userId, @JsonKey(fromJson: _safeParseStringWithDefault) required this.name, @JsonKey(fromJson: _safeParseStringWithDefault) required this.slug, @JsonKey(fromJson: _safeParseString) this.image, @JsonKey(name: 'created_at', fromJson: _safeParseStringWithDefault) required this.createdAt, @JsonKey(name: 'updated_at', fromJson: _safeParseStringWithDefault) required this.updatedAt, @JsonKey(name: 'items_count', fromJson: _safeParseIntWithDefault) required this.itemsCount, @JsonKey(name: 'brand_models', fromJson: _safeParseBrandModelList) required final  List<BrandModel> brandModels}): _brandModels = brandModels;
  factory _TrendingMake.fromJson(Map<String, dynamic> json) => _$TrendingMakeFromJson(json);

@override@JsonKey(fromJson: _safeParseInt) final  int id;
@override@JsonKey(name: 'user_id', fromJson: _safeParseString) final  String? userId;
@override@JsonKey(fromJson: _safeParseStringWithDefault) final  String name;
@override@JsonKey(fromJson: _safeParseStringWithDefault) final  String slug;
@override@JsonKey(fromJson: _safeParseString) final  String? image;
@override@JsonKey(name: 'created_at', fromJson: _safeParseStringWithDefault) final  String createdAt;
@override@JsonKey(name: 'updated_at', fromJson: _safeParseStringWithDefault) final  String updatedAt;
@override@JsonKey(name: 'items_count', fromJson: _safeParseIntWithDefault) final  int itemsCount;
 final  List<BrandModel> _brandModels;
@override@JsonKey(name: 'brand_models', fromJson: _safeParseBrandModelList) List<BrandModel> get brandModels {
  if (_brandModels is EqualUnmodifiableListView) return _brandModels;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_brandModels);
}


/// Create a copy of TrendingMake
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TrendingMakeCopyWith<_TrendingMake> get copyWith => __$TrendingMakeCopyWithImpl<_TrendingMake>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TrendingMakeToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'TrendingMake'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('userId', userId))..add(DiagnosticsProperty('name', name))..add(DiagnosticsProperty('slug', slug))..add(DiagnosticsProperty('image', image))..add(DiagnosticsProperty('createdAt', createdAt))..add(DiagnosticsProperty('updatedAt', updatedAt))..add(DiagnosticsProperty('itemsCount', itemsCount))..add(DiagnosticsProperty('brandModels', brandModels));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TrendingMake&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.image, image) || other.image == image)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.itemsCount, itemsCount) || other.itemsCount == itemsCount)&&const DeepCollectionEquality().equals(other._brandModels, _brandModels));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,name,slug,image,createdAt,updatedAt,itemsCount,const DeepCollectionEquality().hash(_brandModels));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'TrendingMake(id: $id, userId: $userId, name: $name, slug: $slug, image: $image, createdAt: $createdAt, updatedAt: $updatedAt, itemsCount: $itemsCount, brandModels: $brandModels)';
}


}

/// @nodoc
abstract mixin class _$TrendingMakeCopyWith<$Res> implements $TrendingMakeCopyWith<$Res> {
  factory _$TrendingMakeCopyWith(_TrendingMake value, $Res Function(_TrendingMake) _then) = __$TrendingMakeCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: _safeParseInt) int id,@JsonKey(name: 'user_id', fromJson: _safeParseString) String? userId,@JsonKey(fromJson: _safeParseStringWithDefault) String name,@JsonKey(fromJson: _safeParseStringWithDefault) String slug,@JsonKey(fromJson: _safeParseString) String? image,@JsonKey(name: 'created_at', fromJson: _safeParseStringWithDefault) String createdAt,@JsonKey(name: 'updated_at', fromJson: _safeParseStringWithDefault) String updatedAt,@JsonKey(name: 'items_count', fromJson: _safeParseIntWithDefault) int itemsCount,@JsonKey(name: 'brand_models', fromJson: _safeParseBrandModelList) List<BrandModel> brandModels
});




}
/// @nodoc
class __$TrendingMakeCopyWithImpl<$Res>
    implements _$TrendingMakeCopyWith<$Res> {
  __$TrendingMakeCopyWithImpl(this._self, this._then);

  final _TrendingMake _self;
  final $Res Function(_TrendingMake) _then;

/// Create a copy of TrendingMake
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = freezed,Object? name = null,Object? slug = null,Object? image = freezed,Object? createdAt = null,Object? updatedAt = null,Object? itemsCount = null,Object? brandModels = null,}) {
  return _then(_TrendingMake(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,itemsCount: null == itemsCount ? _self.itemsCount : itemsCount // ignore: cast_nullable_to_non_nullable
as int,brandModels: null == brandModels ? _self._brandModels : brandModels // ignore: cast_nullable_to_non_nullable
as List<BrandModel>,
  ));
}


}


/// @nodoc
mixin _$BrandModel implements DiagnosticableTreeMixin {

@JsonKey(fromJson: _safeParseInt) int get id;@JsonKey(name: 'brand_id', fromJson: _safeParseInt) int get brandId;@JsonKey(fromJson: _safeParseStringWithDefault) String get name;@JsonKey(fromJson: _safeParseStringWithDefault) String get slug;@JsonKey(name: 'created_at', fromJson: _safeParseStringWithDefault) String get createdAt;@JsonKey(name: 'updated_at', fromJson: _safeParseStringWithDefault) String get updatedAt;
/// Create a copy of BrandModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BrandModelCopyWith<BrandModel> get copyWith => _$BrandModelCopyWithImpl<BrandModel>(this as BrandModel, _$identity);

  /// Serializes this BrandModel to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'BrandModel'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('brandId', brandId))..add(DiagnosticsProperty('name', name))..add(DiagnosticsProperty('slug', slug))..add(DiagnosticsProperty('createdAt', createdAt))..add(DiagnosticsProperty('updatedAt', updatedAt));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BrandModel&&(identical(other.id, id) || other.id == id)&&(identical(other.brandId, brandId) || other.brandId == brandId)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,brandId,name,slug,createdAt,updatedAt);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'BrandModel(id: $id, brandId: $brandId, name: $name, slug: $slug, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $BrandModelCopyWith<$Res>  {
  factory $BrandModelCopyWith(BrandModel value, $Res Function(BrandModel) _then) = _$BrandModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: _safeParseInt) int id,@JsonKey(name: 'brand_id', fromJson: _safeParseInt) int brandId,@JsonKey(fromJson: _safeParseStringWithDefault) String name,@JsonKey(fromJson: _safeParseStringWithDefault) String slug,@JsonKey(name: 'created_at', fromJson: _safeParseStringWithDefault) String createdAt,@JsonKey(name: 'updated_at', fromJson: _safeParseStringWithDefault) String updatedAt
});




}
/// @nodoc
class _$BrandModelCopyWithImpl<$Res>
    implements $BrandModelCopyWith<$Res> {
  _$BrandModelCopyWithImpl(this._self, this._then);

  final BrandModel _self;
  final $Res Function(BrandModel) _then;

/// Create a copy of BrandModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? brandId = null,Object? name = null,Object? slug = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,brandId: null == brandId ? _self.brandId : brandId // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [BrandModel].
extension BrandModelPatterns on BrandModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BrandModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BrandModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BrandModel value)  $default,){
final _that = this;
switch (_that) {
case _BrandModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BrandModel value)?  $default,){
final _that = this;
switch (_that) {
case _BrandModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _safeParseInt)  int id, @JsonKey(name: 'brand_id', fromJson: _safeParseInt)  int brandId, @JsonKey(fromJson: _safeParseStringWithDefault)  String name, @JsonKey(fromJson: _safeParseStringWithDefault)  String slug, @JsonKey(name: 'created_at', fromJson: _safeParseStringWithDefault)  String createdAt, @JsonKey(name: 'updated_at', fromJson: _safeParseStringWithDefault)  String updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BrandModel() when $default != null:
return $default(_that.id,_that.brandId,_that.name,_that.slug,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _safeParseInt)  int id, @JsonKey(name: 'brand_id', fromJson: _safeParseInt)  int brandId, @JsonKey(fromJson: _safeParseStringWithDefault)  String name, @JsonKey(fromJson: _safeParseStringWithDefault)  String slug, @JsonKey(name: 'created_at', fromJson: _safeParseStringWithDefault)  String createdAt, @JsonKey(name: 'updated_at', fromJson: _safeParseStringWithDefault)  String updatedAt)  $default,) {final _that = this;
switch (_that) {
case _BrandModel():
return $default(_that.id,_that.brandId,_that.name,_that.slug,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: _safeParseInt)  int id, @JsonKey(name: 'brand_id', fromJson: _safeParseInt)  int brandId, @JsonKey(fromJson: _safeParseStringWithDefault)  String name, @JsonKey(fromJson: _safeParseStringWithDefault)  String slug, @JsonKey(name: 'created_at', fromJson: _safeParseStringWithDefault)  String createdAt, @JsonKey(name: 'updated_at', fromJson: _safeParseStringWithDefault)  String updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _BrandModel() when $default != null:
return $default(_that.id,_that.brandId,_that.name,_that.slug,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BrandModel with DiagnosticableTreeMixin implements BrandModel {
  const _BrandModel({@JsonKey(fromJson: _safeParseInt) required this.id, @JsonKey(name: 'brand_id', fromJson: _safeParseInt) required this.brandId, @JsonKey(fromJson: _safeParseStringWithDefault) required this.name, @JsonKey(fromJson: _safeParseStringWithDefault) required this.slug, @JsonKey(name: 'created_at', fromJson: _safeParseStringWithDefault) required this.createdAt, @JsonKey(name: 'updated_at', fromJson: _safeParseStringWithDefault) required this.updatedAt});
  factory _BrandModel.fromJson(Map<String, dynamic> json) => _$BrandModelFromJson(json);

@override@JsonKey(fromJson: _safeParseInt) final  int id;
@override@JsonKey(name: 'brand_id', fromJson: _safeParseInt) final  int brandId;
@override@JsonKey(fromJson: _safeParseStringWithDefault) final  String name;
@override@JsonKey(fromJson: _safeParseStringWithDefault) final  String slug;
@override@JsonKey(name: 'created_at', fromJson: _safeParseStringWithDefault) final  String createdAt;
@override@JsonKey(name: 'updated_at', fromJson: _safeParseStringWithDefault) final  String updatedAt;

/// Create a copy of BrandModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BrandModelCopyWith<_BrandModel> get copyWith => __$BrandModelCopyWithImpl<_BrandModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BrandModelToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'BrandModel'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('brandId', brandId))..add(DiagnosticsProperty('name', name))..add(DiagnosticsProperty('slug', slug))..add(DiagnosticsProperty('createdAt', createdAt))..add(DiagnosticsProperty('updatedAt', updatedAt));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BrandModel&&(identical(other.id, id) || other.id == id)&&(identical(other.brandId, brandId) || other.brandId == brandId)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,brandId,name,slug,createdAt,updatedAt);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'BrandModel(id: $id, brandId: $brandId, name: $name, slug: $slug, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$BrandModelCopyWith<$Res> implements $BrandModelCopyWith<$Res> {
  factory _$BrandModelCopyWith(_BrandModel value, $Res Function(_BrandModel) _then) = __$BrandModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: _safeParseInt) int id,@JsonKey(name: 'brand_id', fromJson: _safeParseInt) int brandId,@JsonKey(fromJson: _safeParseStringWithDefault) String name,@JsonKey(fromJson: _safeParseStringWithDefault) String slug,@JsonKey(name: 'created_at', fromJson: _safeParseStringWithDefault) String createdAt,@JsonKey(name: 'updated_at', fromJson: _safeParseStringWithDefault) String updatedAt
});




}
/// @nodoc
class __$BrandModelCopyWithImpl<$Res>
    implements _$BrandModelCopyWith<$Res> {
  __$BrandModelCopyWithImpl(this._self, this._then);

  final _BrandModel _self;
  final $Res Function(_BrandModel) _then;

/// Create a copy of BrandModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? brandId = null,Object? name = null,Object? slug = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_BrandModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,brandId: null == brandId ? _self.brandId : brandId // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$TrendingMakeResponse implements DiagnosticableTreeMixin {

@JsonKey(fromJson: _safeParseTrendingMakeList) List<TrendingMake> get data;@JsonKey(fromJson: _safeParsePaginationLinks) PaginationLinks get links;@JsonKey(fromJson: _safeParsePaginationMeta) PaginationMeta get meta;
/// Create a copy of TrendingMakeResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrendingMakeResponseCopyWith<TrendingMakeResponse> get copyWith => _$TrendingMakeResponseCopyWithImpl<TrendingMakeResponse>(this as TrendingMakeResponse, _$identity);

  /// Serializes this TrendingMakeResponse to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'TrendingMakeResponse'))
    ..add(DiagnosticsProperty('data', data))..add(DiagnosticsProperty('links', links))..add(DiagnosticsProperty('meta', meta));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrendingMakeResponse&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.links, links) || other.links == links)&&(identical(other.meta, meta) || other.meta == meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data),links,meta);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'TrendingMakeResponse(data: $data, links: $links, meta: $meta)';
}


}

/// @nodoc
abstract mixin class $TrendingMakeResponseCopyWith<$Res>  {
  factory $TrendingMakeResponseCopyWith(TrendingMakeResponse value, $Res Function(TrendingMakeResponse) _then) = _$TrendingMakeResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: _safeParseTrendingMakeList) List<TrendingMake> data,@JsonKey(fromJson: _safeParsePaginationLinks) PaginationLinks links,@JsonKey(fromJson: _safeParsePaginationMeta) PaginationMeta meta
});


$PaginationLinksCopyWith<$Res> get links;$PaginationMetaCopyWith<$Res> get meta;

}
/// @nodoc
class _$TrendingMakeResponseCopyWithImpl<$Res>
    implements $TrendingMakeResponseCopyWith<$Res> {
  _$TrendingMakeResponseCopyWithImpl(this._self, this._then);

  final TrendingMakeResponse _self;
  final $Res Function(TrendingMakeResponse) _then;

/// Create a copy of TrendingMakeResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = null,Object? links = null,Object? meta = null,}) {
  return _then(_self.copyWith(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<TrendingMake>,links: null == links ? _self.links : links // ignore: cast_nullable_to_non_nullable
as PaginationLinks,meta: null == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as PaginationMeta,
  ));
}
/// Create a copy of TrendingMakeResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaginationLinksCopyWith<$Res> get links {
  
  return $PaginationLinksCopyWith<$Res>(_self.links, (value) {
    return _then(_self.copyWith(links: value));
  });
}/// Create a copy of TrendingMakeResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaginationMetaCopyWith<$Res> get meta {
  
  return $PaginationMetaCopyWith<$Res>(_self.meta, (value) {
    return _then(_self.copyWith(meta: value));
  });
}
}


/// Adds pattern-matching-related methods to [TrendingMakeResponse].
extension TrendingMakeResponsePatterns on TrendingMakeResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TrendingMakeResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TrendingMakeResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TrendingMakeResponse value)  $default,){
final _that = this;
switch (_that) {
case _TrendingMakeResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TrendingMakeResponse value)?  $default,){
final _that = this;
switch (_that) {
case _TrendingMakeResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _safeParseTrendingMakeList)  List<TrendingMake> data, @JsonKey(fromJson: _safeParsePaginationLinks)  PaginationLinks links, @JsonKey(fromJson: _safeParsePaginationMeta)  PaginationMeta meta)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TrendingMakeResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _safeParseTrendingMakeList)  List<TrendingMake> data, @JsonKey(fromJson: _safeParsePaginationLinks)  PaginationLinks links, @JsonKey(fromJson: _safeParsePaginationMeta)  PaginationMeta meta)  $default,) {final _that = this;
switch (_that) {
case _TrendingMakeResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: _safeParseTrendingMakeList)  List<TrendingMake> data, @JsonKey(fromJson: _safeParsePaginationLinks)  PaginationLinks links, @JsonKey(fromJson: _safeParsePaginationMeta)  PaginationMeta meta)?  $default,) {final _that = this;
switch (_that) {
case _TrendingMakeResponse() when $default != null:
return $default(_that.data,_that.links,_that.meta);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TrendingMakeResponse with DiagnosticableTreeMixin implements TrendingMakeResponse {
  const _TrendingMakeResponse({@JsonKey(fromJson: _safeParseTrendingMakeList) required final  List<TrendingMake> data, @JsonKey(fromJson: _safeParsePaginationLinks) required this.links, @JsonKey(fromJson: _safeParsePaginationMeta) required this.meta}): _data = data;
  factory _TrendingMakeResponse.fromJson(Map<String, dynamic> json) => _$TrendingMakeResponseFromJson(json);

 final  List<TrendingMake> _data;
@override@JsonKey(fromJson: _safeParseTrendingMakeList) List<TrendingMake> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}

@override@JsonKey(fromJson: _safeParsePaginationLinks) final  PaginationLinks links;
@override@JsonKey(fromJson: _safeParsePaginationMeta) final  PaginationMeta meta;

/// Create a copy of TrendingMakeResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TrendingMakeResponseCopyWith<_TrendingMakeResponse> get copyWith => __$TrendingMakeResponseCopyWithImpl<_TrendingMakeResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TrendingMakeResponseToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'TrendingMakeResponse'))
    ..add(DiagnosticsProperty('data', data))..add(DiagnosticsProperty('links', links))..add(DiagnosticsProperty('meta', meta));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TrendingMakeResponse&&const DeepCollectionEquality().equals(other._data, _data)&&(identical(other.links, links) || other.links == links)&&(identical(other.meta, meta) || other.meta == meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_data),links,meta);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'TrendingMakeResponse(data: $data, links: $links, meta: $meta)';
}


}

/// @nodoc
abstract mixin class _$TrendingMakeResponseCopyWith<$Res> implements $TrendingMakeResponseCopyWith<$Res> {
  factory _$TrendingMakeResponseCopyWith(_TrendingMakeResponse value, $Res Function(_TrendingMakeResponse) _then) = __$TrendingMakeResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: _safeParseTrendingMakeList) List<TrendingMake> data,@JsonKey(fromJson: _safeParsePaginationLinks) PaginationLinks links,@JsonKey(fromJson: _safeParsePaginationMeta) PaginationMeta meta
});


@override $PaginationLinksCopyWith<$Res> get links;@override $PaginationMetaCopyWith<$Res> get meta;

}
/// @nodoc
class __$TrendingMakeResponseCopyWithImpl<$Res>
    implements _$TrendingMakeResponseCopyWith<$Res> {
  __$TrendingMakeResponseCopyWithImpl(this._self, this._then);

  final _TrendingMakeResponse _self;
  final $Res Function(_TrendingMakeResponse) _then;

/// Create a copy of TrendingMakeResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,Object? links = null,Object? meta = null,}) {
  return _then(_TrendingMakeResponse(
data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<TrendingMake>,links: null == links ? _self.links : links // ignore: cast_nullable_to_non_nullable
as PaginationLinks,meta: null == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as PaginationMeta,
  ));
}

/// Create a copy of TrendingMakeResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaginationLinksCopyWith<$Res> get links {
  
  return $PaginationLinksCopyWith<$Res>(_self.links, (value) {
    return _then(_self.copyWith(links: value));
  });
}/// Create a copy of TrendingMakeResponse
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
mixin _$PaginationLinks implements DiagnosticableTreeMixin {

@JsonKey(fromJson: _safeParseStringWithDefault) String get first;@JsonKey(fromJson: _safeParseStringWithDefault) String get last;@JsonKey(fromJson: _safeParseString) String? get prev;@JsonKey(fromJson: _safeParseString) String? get next;
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
@JsonKey(fromJson: _safeParseStringWithDefault) String first,@JsonKey(fromJson: _safeParseStringWithDefault) String last,@JsonKey(fromJson: _safeParseString) String? prev,@JsonKey(fromJson: _safeParseString) String? next
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _safeParseStringWithDefault)  String first, @JsonKey(fromJson: _safeParseStringWithDefault)  String last, @JsonKey(fromJson: _safeParseString)  String? prev, @JsonKey(fromJson: _safeParseString)  String? next)?  $default,{required TResult orElse(),}) {final _that = this;
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _safeParseStringWithDefault)  String first, @JsonKey(fromJson: _safeParseStringWithDefault)  String last, @JsonKey(fromJson: _safeParseString)  String? prev, @JsonKey(fromJson: _safeParseString)  String? next)  $default,) {final _that = this;
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: _safeParseStringWithDefault)  String first, @JsonKey(fromJson: _safeParseStringWithDefault)  String last, @JsonKey(fromJson: _safeParseString)  String? prev, @JsonKey(fromJson: _safeParseString)  String? next)?  $default,) {final _that = this;
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
  const _PaginationLinks({@JsonKey(fromJson: _safeParseStringWithDefault) required this.first, @JsonKey(fromJson: _safeParseStringWithDefault) required this.last, @JsonKey(fromJson: _safeParseString) this.prev, @JsonKey(fromJson: _safeParseString) this.next});
  factory _PaginationLinks.fromJson(Map<String, dynamic> json) => _$PaginationLinksFromJson(json);

@override@JsonKey(fromJson: _safeParseStringWithDefault) final  String first;
@override@JsonKey(fromJson: _safeParseStringWithDefault) final  String last;
@override@JsonKey(fromJson: _safeParseString) final  String? prev;
@override@JsonKey(fromJson: _safeParseString) final  String? next;

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
@JsonKey(fromJson: _safeParseStringWithDefault) String first,@JsonKey(fromJson: _safeParseStringWithDefault) String last,@JsonKey(fromJson: _safeParseString) String? prev,@JsonKey(fromJson: _safeParseString) String? next
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
mixin _$PaginationMeta implements DiagnosticableTreeMixin {

@JsonKey(name: 'current_page', fromJson: _safeParseIntWithDefault) int get currentPage;@JsonKey(fromJson: _safeParseIntWithDefault) int get from;@JsonKey(name: 'last_page', fromJson: _safeParseIntWithDefault) int get lastPage;@JsonKey(fromJson: _safeParsePaginationMetaLinkList) List<PaginationMetaLink> get links;@JsonKey(fromJson: _safeParseStringWithDefault) String get path;@JsonKey(name: 'per_page', fromJson: _safeParseIntWithDefault) int get perPage;@JsonKey(fromJson: _safeParseIntWithDefault) int get to;@JsonKey(fromJson: _safeParseIntWithDefault) int get total;
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
    ..add(DiagnosticsProperty('currentPage', currentPage))..add(DiagnosticsProperty('from', from))..add(DiagnosticsProperty('lastPage', lastPage))..add(DiagnosticsProperty('links', links))..add(DiagnosticsProperty('path', path))..add(DiagnosticsProperty('perPage', perPage))..add(DiagnosticsProperty('to', to))..add(DiagnosticsProperty('total', total));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaginationMeta&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.from, from) || other.from == from)&&(identical(other.lastPage, lastPage) || other.lastPage == lastPage)&&const DeepCollectionEquality().equals(other.links, links)&&(identical(other.path, path) || other.path == path)&&(identical(other.perPage, perPage) || other.perPage == perPage)&&(identical(other.to, to) || other.to == to)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,currentPage,from,lastPage,const DeepCollectionEquality().hash(links),path,perPage,to,total);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'PaginationMeta(currentPage: $currentPage, from: $from, lastPage: $lastPage, links: $links, path: $path, perPage: $perPage, to: $to, total: $total)';
}


}

/// @nodoc
abstract mixin class $PaginationMetaCopyWith<$Res>  {
  factory $PaginationMetaCopyWith(PaginationMeta value, $Res Function(PaginationMeta) _then) = _$PaginationMetaCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'current_page', fromJson: _safeParseIntWithDefault) int currentPage,@JsonKey(fromJson: _safeParseIntWithDefault) int from,@JsonKey(name: 'last_page', fromJson: _safeParseIntWithDefault) int lastPage,@JsonKey(fromJson: _safeParsePaginationMetaLinkList) List<PaginationMetaLink> links,@JsonKey(fromJson: _safeParseStringWithDefault) String path,@JsonKey(name: 'per_page', fromJson: _safeParseIntWithDefault) int perPage,@JsonKey(fromJson: _safeParseIntWithDefault) int to,@JsonKey(fromJson: _safeParseIntWithDefault) int total
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
as List<PaginationMetaLink>,path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'current_page', fromJson: _safeParseIntWithDefault)  int currentPage, @JsonKey(fromJson: _safeParseIntWithDefault)  int from, @JsonKey(name: 'last_page', fromJson: _safeParseIntWithDefault)  int lastPage, @JsonKey(fromJson: _safeParsePaginationMetaLinkList)  List<PaginationMetaLink> links, @JsonKey(fromJson: _safeParseStringWithDefault)  String path, @JsonKey(name: 'per_page', fromJson: _safeParseIntWithDefault)  int perPage, @JsonKey(fromJson: _safeParseIntWithDefault)  int to, @JsonKey(fromJson: _safeParseIntWithDefault)  int total)?  $default,{required TResult orElse(),}) {final _that = this;
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'current_page', fromJson: _safeParseIntWithDefault)  int currentPage, @JsonKey(fromJson: _safeParseIntWithDefault)  int from, @JsonKey(name: 'last_page', fromJson: _safeParseIntWithDefault)  int lastPage, @JsonKey(fromJson: _safeParsePaginationMetaLinkList)  List<PaginationMetaLink> links, @JsonKey(fromJson: _safeParseStringWithDefault)  String path, @JsonKey(name: 'per_page', fromJson: _safeParseIntWithDefault)  int perPage, @JsonKey(fromJson: _safeParseIntWithDefault)  int to, @JsonKey(fromJson: _safeParseIntWithDefault)  int total)  $default,) {final _that = this;
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'current_page', fromJson: _safeParseIntWithDefault)  int currentPage, @JsonKey(fromJson: _safeParseIntWithDefault)  int from, @JsonKey(name: 'last_page', fromJson: _safeParseIntWithDefault)  int lastPage, @JsonKey(fromJson: _safeParsePaginationMetaLinkList)  List<PaginationMetaLink> links, @JsonKey(fromJson: _safeParseStringWithDefault)  String path, @JsonKey(name: 'per_page', fromJson: _safeParseIntWithDefault)  int perPage, @JsonKey(fromJson: _safeParseIntWithDefault)  int to, @JsonKey(fromJson: _safeParseIntWithDefault)  int total)?  $default,) {final _that = this;
switch (_that) {
case _PaginationMeta() when $default != null:
return $default(_that.currentPage,_that.from,_that.lastPage,_that.links,_that.path,_that.perPage,_that.to,_that.total);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PaginationMeta with DiagnosticableTreeMixin implements PaginationMeta {
  const _PaginationMeta({@JsonKey(name: 'current_page', fromJson: _safeParseIntWithDefault) required this.currentPage, @JsonKey(fromJson: _safeParseIntWithDefault) required this.from, @JsonKey(name: 'last_page', fromJson: _safeParseIntWithDefault) required this.lastPage, @JsonKey(fromJson: _safeParsePaginationMetaLinkList) required final  List<PaginationMetaLink> links, @JsonKey(fromJson: _safeParseStringWithDefault) required this.path, @JsonKey(name: 'per_page', fromJson: _safeParseIntWithDefault) required this.perPage, @JsonKey(fromJson: _safeParseIntWithDefault) required this.to, @JsonKey(fromJson: _safeParseIntWithDefault) required this.total}): _links = links;
  factory _PaginationMeta.fromJson(Map<String, dynamic> json) => _$PaginationMetaFromJson(json);

@override@JsonKey(name: 'current_page', fromJson: _safeParseIntWithDefault) final  int currentPage;
@override@JsonKey(fromJson: _safeParseIntWithDefault) final  int from;
@override@JsonKey(name: 'last_page', fromJson: _safeParseIntWithDefault) final  int lastPage;
 final  List<PaginationMetaLink> _links;
@override@JsonKey(fromJson: _safeParsePaginationMetaLinkList) List<PaginationMetaLink> get links {
  if (_links is EqualUnmodifiableListView) return _links;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_links);
}

@override@JsonKey(fromJson: _safeParseStringWithDefault) final  String path;
@override@JsonKey(name: 'per_page', fromJson: _safeParseIntWithDefault) final  int perPage;
@override@JsonKey(fromJson: _safeParseIntWithDefault) final  int to;
@override@JsonKey(fromJson: _safeParseIntWithDefault) final  int total;

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
    ..add(DiagnosticsProperty('currentPage', currentPage))..add(DiagnosticsProperty('from', from))..add(DiagnosticsProperty('lastPage', lastPage))..add(DiagnosticsProperty('links', links))..add(DiagnosticsProperty('path', path))..add(DiagnosticsProperty('perPage', perPage))..add(DiagnosticsProperty('to', to))..add(DiagnosticsProperty('total', total));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaginationMeta&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.from, from) || other.from == from)&&(identical(other.lastPage, lastPage) || other.lastPage == lastPage)&&const DeepCollectionEquality().equals(other._links, _links)&&(identical(other.path, path) || other.path == path)&&(identical(other.perPage, perPage) || other.perPage == perPage)&&(identical(other.to, to) || other.to == to)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,currentPage,from,lastPage,const DeepCollectionEquality().hash(_links),path,perPage,to,total);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'PaginationMeta(currentPage: $currentPage, from: $from, lastPage: $lastPage, links: $links, path: $path, perPage: $perPage, to: $to, total: $total)';
}


}

/// @nodoc
abstract mixin class _$PaginationMetaCopyWith<$Res> implements $PaginationMetaCopyWith<$Res> {
  factory _$PaginationMetaCopyWith(_PaginationMeta value, $Res Function(_PaginationMeta) _then) = __$PaginationMetaCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'current_page', fromJson: _safeParseIntWithDefault) int currentPage,@JsonKey(fromJson: _safeParseIntWithDefault) int from,@JsonKey(name: 'last_page', fromJson: _safeParseIntWithDefault) int lastPage,@JsonKey(fromJson: _safeParsePaginationMetaLinkList) List<PaginationMetaLink> links,@JsonKey(fromJson: _safeParseStringWithDefault) String path,@JsonKey(name: 'per_page', fromJson: _safeParseIntWithDefault) int perPage,@JsonKey(fromJson: _safeParseIntWithDefault) int to,@JsonKey(fromJson: _safeParseIntWithDefault) int total
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
as List<PaginationMetaLink>,path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String,perPage: null == perPage ? _self.perPage : perPage // ignore: cast_nullable_to_non_nullable
as int,to: null == to ? _self.to : to // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$PaginationMetaLink implements DiagnosticableTreeMixin {

@JsonKey(fromJson: _safeParseString) String? get url;@JsonKey(fromJson: _safeParseStringWithDefault) String get label;@JsonKey(fromJson: _safeParseBoolWithDefault) bool get active;
/// Create a copy of PaginationMetaLink
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaginationMetaLinkCopyWith<PaginationMetaLink> get copyWith => _$PaginationMetaLinkCopyWithImpl<PaginationMetaLink>(this as PaginationMetaLink, _$identity);

  /// Serializes this PaginationMetaLink to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'PaginationMetaLink'))
    ..add(DiagnosticsProperty('url', url))..add(DiagnosticsProperty('label', label))..add(DiagnosticsProperty('active', active));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaginationMetaLink&&(identical(other.url, url) || other.url == url)&&(identical(other.label, label) || other.label == label)&&(identical(other.active, active) || other.active == active));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,url,label,active);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'PaginationMetaLink(url: $url, label: $label, active: $active)';
}


}

/// @nodoc
abstract mixin class $PaginationMetaLinkCopyWith<$Res>  {
  factory $PaginationMetaLinkCopyWith(PaginationMetaLink value, $Res Function(PaginationMetaLink) _then) = _$PaginationMetaLinkCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: _safeParseString) String? url,@JsonKey(fromJson: _safeParseStringWithDefault) String label,@JsonKey(fromJson: _safeParseBoolWithDefault) bool active
});




}
/// @nodoc
class _$PaginationMetaLinkCopyWithImpl<$Res>
    implements $PaginationMetaLinkCopyWith<$Res> {
  _$PaginationMetaLinkCopyWithImpl(this._self, this._then);

  final PaginationMetaLink _self;
  final $Res Function(PaginationMetaLink) _then;

/// Create a copy of PaginationMetaLink
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


/// Adds pattern-matching-related methods to [PaginationMetaLink].
extension PaginationMetaLinkPatterns on PaginationMetaLink {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaginationMetaLink value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaginationMetaLink() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaginationMetaLink value)  $default,){
final _that = this;
switch (_that) {
case _PaginationMetaLink():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaginationMetaLink value)?  $default,){
final _that = this;
switch (_that) {
case _PaginationMetaLink() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _safeParseString)  String? url, @JsonKey(fromJson: _safeParseStringWithDefault)  String label, @JsonKey(fromJson: _safeParseBoolWithDefault)  bool active)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaginationMetaLink() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _safeParseString)  String? url, @JsonKey(fromJson: _safeParseStringWithDefault)  String label, @JsonKey(fromJson: _safeParseBoolWithDefault)  bool active)  $default,) {final _that = this;
switch (_that) {
case _PaginationMetaLink():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: _safeParseString)  String? url, @JsonKey(fromJson: _safeParseStringWithDefault)  String label, @JsonKey(fromJson: _safeParseBoolWithDefault)  bool active)?  $default,) {final _that = this;
switch (_that) {
case _PaginationMetaLink() when $default != null:
return $default(_that.url,_that.label,_that.active);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PaginationMetaLink with DiagnosticableTreeMixin implements PaginationMetaLink {
  const _PaginationMetaLink({@JsonKey(fromJson: _safeParseString) this.url, @JsonKey(fromJson: _safeParseStringWithDefault) required this.label, @JsonKey(fromJson: _safeParseBoolWithDefault) required this.active});
  factory _PaginationMetaLink.fromJson(Map<String, dynamic> json) => _$PaginationMetaLinkFromJson(json);

@override@JsonKey(fromJson: _safeParseString) final  String? url;
@override@JsonKey(fromJson: _safeParseStringWithDefault) final  String label;
@override@JsonKey(fromJson: _safeParseBoolWithDefault) final  bool active;

/// Create a copy of PaginationMetaLink
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaginationMetaLinkCopyWith<_PaginationMetaLink> get copyWith => __$PaginationMetaLinkCopyWithImpl<_PaginationMetaLink>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaginationMetaLinkToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'PaginationMetaLink'))
    ..add(DiagnosticsProperty('url', url))..add(DiagnosticsProperty('label', label))..add(DiagnosticsProperty('active', active));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaginationMetaLink&&(identical(other.url, url) || other.url == url)&&(identical(other.label, label) || other.label == label)&&(identical(other.active, active) || other.active == active));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,url,label,active);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'PaginationMetaLink(url: $url, label: $label, active: $active)';
}


}

/// @nodoc
abstract mixin class _$PaginationMetaLinkCopyWith<$Res> implements $PaginationMetaLinkCopyWith<$Res> {
  factory _$PaginationMetaLinkCopyWith(_PaginationMetaLink value, $Res Function(_PaginationMetaLink) _then) = __$PaginationMetaLinkCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: _safeParseString) String? url,@JsonKey(fromJson: _safeParseStringWithDefault) String label,@JsonKey(fromJson: _safeParseBoolWithDefault) bool active
});




}
/// @nodoc
class __$PaginationMetaLinkCopyWithImpl<$Res>
    implements _$PaginationMetaLinkCopyWith<$Res> {
  __$PaginationMetaLinkCopyWithImpl(this._self, this._then);

  final _PaginationMetaLink _self;
  final $Res Function(_PaginationMetaLink) _then;

/// Create a copy of PaginationMetaLink
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? url = freezed,Object? label = null,Object? active = null,}) {
  return _then(_PaginationMetaLink(
url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,active: null == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
