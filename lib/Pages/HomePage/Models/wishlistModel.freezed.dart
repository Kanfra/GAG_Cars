// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wishlistModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WishlistResponse implements DiagnosticableTreeMixin {

 List<WishlistItem> get data;
/// Create a copy of WishlistResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WishlistResponseCopyWith<WishlistResponse> get copyWith => _$WishlistResponseCopyWithImpl<WishlistResponse>(this as WishlistResponse, _$identity);

  /// Serializes this WishlistResponse to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'WishlistResponse'))
    ..add(DiagnosticsProperty('data', data));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WishlistResponse&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'WishlistResponse(data: $data)';
}


}

/// @nodoc
abstract mixin class $WishlistResponseCopyWith<$Res>  {
  factory $WishlistResponseCopyWith(WishlistResponse value, $Res Function(WishlistResponse) _then) = _$WishlistResponseCopyWithImpl;
@useResult
$Res call({
 List<WishlistItem> data
});




}
/// @nodoc
class _$WishlistResponseCopyWithImpl<$Res>
    implements $WishlistResponseCopyWith<$Res> {
  _$WishlistResponseCopyWithImpl(this._self, this._then);

  final WishlistResponse _self;
  final $Res Function(WishlistResponse) _then;

/// Create a copy of WishlistResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = null,}) {
  return _then(_self.copyWith(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<WishlistItem>,
  ));
}

}


/// Adds pattern-matching-related methods to [WishlistResponse].
extension WishlistResponsePatterns on WishlistResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WishlistResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WishlistResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WishlistResponse value)  $default,){
final _that = this;
switch (_that) {
case _WishlistResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WishlistResponse value)?  $default,){
final _that = this;
switch (_that) {
case _WishlistResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<WishlistItem> data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WishlistResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<WishlistItem> data)  $default,) {final _that = this;
switch (_that) {
case _WishlistResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<WishlistItem> data)?  $default,) {final _that = this;
switch (_that) {
case _WishlistResponse() when $default != null:
return $default(_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WishlistResponse with DiagnosticableTreeMixin implements WishlistResponse {
  const _WishlistResponse({required final  List<WishlistItem> data}): _data = data;
  factory _WishlistResponse.fromJson(Map<String, dynamic> json) => _$WishlistResponseFromJson(json);

 final  List<WishlistItem> _data;
@override List<WishlistItem> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}


/// Create a copy of WishlistResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WishlistResponseCopyWith<_WishlistResponse> get copyWith => __$WishlistResponseCopyWithImpl<_WishlistResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WishlistResponseToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'WishlistResponse'))
    ..add(DiagnosticsProperty('data', data));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WishlistResponse&&const DeepCollectionEquality().equals(other._data, _data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_data));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'WishlistResponse(data: $data)';
}


}

/// @nodoc
abstract mixin class _$WishlistResponseCopyWith<$Res> implements $WishlistResponseCopyWith<$Res> {
  factory _$WishlistResponseCopyWith(_WishlistResponse value, $Res Function(_WishlistResponse) _then) = __$WishlistResponseCopyWithImpl;
@override @useResult
$Res call({
 List<WishlistItem> data
});




}
/// @nodoc
class __$WishlistResponseCopyWithImpl<$Res>
    implements _$WishlistResponseCopyWith<$Res> {
  __$WishlistResponseCopyWithImpl(this._self, this._then);

  final _WishlistResponse _self;
  final $Res Function(_WishlistResponse) _then;

/// Create a copy of WishlistResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(_WishlistResponse(
data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<WishlistItem>,
  ));
}


}


/// @nodoc
mixin _$WishlistItem implements DiagnosticableTreeMixin {

 String get id;@JsonKey(name: 'user_id') String get userId;@JsonKey(name: 'item_id') String get itemId;@JsonKey(name: 'created_at') DateTime get createdAt;@JsonKey(name: 'updated_at') DateTime get updatedAt; RecommendedItem get item;
/// Create a copy of WishlistItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WishlistItemCopyWith<WishlistItem> get copyWith => _$WishlistItemCopyWithImpl<WishlistItem>(this as WishlistItem, _$identity);

  /// Serializes this WishlistItem to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'WishlistItem'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('userId', userId))..add(DiagnosticsProperty('itemId', itemId))..add(DiagnosticsProperty('createdAt', createdAt))..add(DiagnosticsProperty('updatedAt', updatedAt))..add(DiagnosticsProperty('item', item));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WishlistItem&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.itemId, itemId) || other.itemId == itemId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.item, item) || other.item == item));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,itemId,createdAt,updatedAt,item);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'WishlistItem(id: $id, userId: $userId, itemId: $itemId, createdAt: $createdAt, updatedAt: $updatedAt, item: $item)';
}


}

/// @nodoc
abstract mixin class $WishlistItemCopyWith<$Res>  {
  factory $WishlistItemCopyWith(WishlistItem value, $Res Function(WishlistItem) _then) = _$WishlistItemCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'user_id') String userId,@JsonKey(name: 'item_id') String itemId,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt, RecommendedItem item
});


$RecommendedItemCopyWith<$Res> get item;

}
/// @nodoc
class _$WishlistItemCopyWithImpl<$Res>
    implements $WishlistItemCopyWith<$Res> {
  _$WishlistItemCopyWithImpl(this._self, this._then);

  final WishlistItem _self;
  final $Res Function(WishlistItem) _then;

/// Create a copy of WishlistItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? itemId = null,Object? createdAt = null,Object? updatedAt = null,Object? item = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,itemId: null == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,item: null == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as RecommendedItem,
  ));
}
/// Create a copy of WishlistItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RecommendedItemCopyWith<$Res> get item {
  
  return $RecommendedItemCopyWith<$Res>(_self.item, (value) {
    return _then(_self.copyWith(item: value));
  });
}
}


/// Adds pattern-matching-related methods to [WishlistItem].
extension WishlistItemPatterns on WishlistItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WishlistItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WishlistItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WishlistItem value)  $default,){
final _that = this;
switch (_that) {
case _WishlistItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WishlistItem value)?  $default,){
final _that = this;
switch (_that) {
case _WishlistItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'item_id')  String itemId, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt,  RecommendedItem item)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WishlistItem() when $default != null:
return $default(_that.id,_that.userId,_that.itemId,_that.createdAt,_that.updatedAt,_that.item);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'item_id')  String itemId, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt,  RecommendedItem item)  $default,) {final _that = this;
switch (_that) {
case _WishlistItem():
return $default(_that.id,_that.userId,_that.itemId,_that.createdAt,_that.updatedAt,_that.item);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'item_id')  String itemId, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt,  RecommendedItem item)?  $default,) {final _that = this;
switch (_that) {
case _WishlistItem() when $default != null:
return $default(_that.id,_that.userId,_that.itemId,_that.createdAt,_that.updatedAt,_that.item);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WishlistItem with DiagnosticableTreeMixin implements WishlistItem {
  const _WishlistItem({required this.id, @JsonKey(name: 'user_id') required this.userId, @JsonKey(name: 'item_id') required this.itemId, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'updated_at') required this.updatedAt, required this.item});
  factory _WishlistItem.fromJson(Map<String, dynamic> json) => _$WishlistItemFromJson(json);

@override final  String id;
@override@JsonKey(name: 'user_id') final  String userId;
@override@JsonKey(name: 'item_id') final  String itemId;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime updatedAt;
@override final  RecommendedItem item;

/// Create a copy of WishlistItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WishlistItemCopyWith<_WishlistItem> get copyWith => __$WishlistItemCopyWithImpl<_WishlistItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WishlistItemToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'WishlistItem'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('userId', userId))..add(DiagnosticsProperty('itemId', itemId))..add(DiagnosticsProperty('createdAt', createdAt))..add(DiagnosticsProperty('updatedAt', updatedAt))..add(DiagnosticsProperty('item', item));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WishlistItem&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.itemId, itemId) || other.itemId == itemId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.item, item) || other.item == item));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,itemId,createdAt,updatedAt,item);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'WishlistItem(id: $id, userId: $userId, itemId: $itemId, createdAt: $createdAt, updatedAt: $updatedAt, item: $item)';
}


}

/// @nodoc
abstract mixin class _$WishlistItemCopyWith<$Res> implements $WishlistItemCopyWith<$Res> {
  factory _$WishlistItemCopyWith(_WishlistItem value, $Res Function(_WishlistItem) _then) = __$WishlistItemCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'user_id') String userId,@JsonKey(name: 'item_id') String itemId,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt, RecommendedItem item
});


@override $RecommendedItemCopyWith<$Res> get item;

}
/// @nodoc
class __$WishlistItemCopyWithImpl<$Res>
    implements _$WishlistItemCopyWith<$Res> {
  __$WishlistItemCopyWithImpl(this._self, this._then);

  final _WishlistItem _self;
  final $Res Function(_WishlistItem) _then;

/// Create a copy of WishlistItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? itemId = null,Object? createdAt = null,Object? updatedAt = null,Object? item = null,}) {
  return _then(_WishlistItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,itemId: null == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,item: null == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as RecommendedItem,
  ));
}

/// Create a copy of WishlistItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RecommendedItemCopyWith<$Res> get item {
  
  return $RecommendedItemCopyWith<$Res>(_self.item, (value) {
    return _then(_self.copyWith(item: value));
  });
}
}


/// @nodoc
mixin _$RecommendedItem implements DiagnosticableTreeMixin {

 String get id;@JsonKey(name: 'user_id') String? get userId;@JsonKey(name: 'country_id') int? get countryId;@JsonKey(name: 'brand_model_id') int? get brandModelId;@JsonKey(name: 'brand_id') int? get brandId;@JsonKey(name: 'category_id') int? get categoryId; String? get name; String? get year; String? get slug; String? get description; List<String>? get images; String? get location;@JsonKey(name: 'serial_number') String? get serialNumber; String? get condition;@JsonKey(name: 'steer_position') String? get steerPosition;@JsonKey(name: 'engine_capacity') String? get engineCapacity; String? get transmission; String? get color;@JsonKey(name: 'build_type') String? get buildType;@JsonKey(name: 'number_of_passengers') int? get numberOfPassengers; List<String>? get features; String? get status; String? get price; String? get mileage; int? get warranty;@JsonKey(name: 'warranty_expiration') String? get warrantyExpiration;@JsonKey(name: 'deleted_at') String? get deletedAt;@JsonKey(name: 'created_at') DateTime? get createdAt;@JsonKey(name: 'updated_at') DateTime? get updatedAt; String? get Height; String? get VIN;
/// Create a copy of RecommendedItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecommendedItemCopyWith<RecommendedItem> get copyWith => _$RecommendedItemCopyWithImpl<RecommendedItem>(this as RecommendedItem, _$identity);

  /// Serializes this RecommendedItem to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'RecommendedItem'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('userId', userId))..add(DiagnosticsProperty('countryId', countryId))..add(DiagnosticsProperty('brandModelId', brandModelId))..add(DiagnosticsProperty('brandId', brandId))..add(DiagnosticsProperty('categoryId', categoryId))..add(DiagnosticsProperty('name', name))..add(DiagnosticsProperty('year', year))..add(DiagnosticsProperty('slug', slug))..add(DiagnosticsProperty('description', description))..add(DiagnosticsProperty('images', images))..add(DiagnosticsProperty('location', location))..add(DiagnosticsProperty('serialNumber', serialNumber))..add(DiagnosticsProperty('condition', condition))..add(DiagnosticsProperty('steerPosition', steerPosition))..add(DiagnosticsProperty('engineCapacity', engineCapacity))..add(DiagnosticsProperty('transmission', transmission))..add(DiagnosticsProperty('color', color))..add(DiagnosticsProperty('buildType', buildType))..add(DiagnosticsProperty('numberOfPassengers', numberOfPassengers))..add(DiagnosticsProperty('features', features))..add(DiagnosticsProperty('status', status))..add(DiagnosticsProperty('price', price))..add(DiagnosticsProperty('mileage', mileage))..add(DiagnosticsProperty('warranty', warranty))..add(DiagnosticsProperty('warrantyExpiration', warrantyExpiration))..add(DiagnosticsProperty('deletedAt', deletedAt))..add(DiagnosticsProperty('createdAt', createdAt))..add(DiagnosticsProperty('updatedAt', updatedAt))..add(DiagnosticsProperty('Height', Height))..add(DiagnosticsProperty('VIN', VIN));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RecommendedItem&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.countryId, countryId) || other.countryId == countryId)&&(identical(other.brandModelId, brandModelId) || other.brandModelId == brandModelId)&&(identical(other.brandId, brandId) || other.brandId == brandId)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.name, name) || other.name == name)&&(identical(other.year, year) || other.year == year)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.images, images)&&(identical(other.location, location) || other.location == location)&&(identical(other.serialNumber, serialNumber) || other.serialNumber == serialNumber)&&(identical(other.condition, condition) || other.condition == condition)&&(identical(other.steerPosition, steerPosition) || other.steerPosition == steerPosition)&&(identical(other.engineCapacity, engineCapacity) || other.engineCapacity == engineCapacity)&&(identical(other.transmission, transmission) || other.transmission == transmission)&&(identical(other.color, color) || other.color == color)&&(identical(other.buildType, buildType) || other.buildType == buildType)&&(identical(other.numberOfPassengers, numberOfPassengers) || other.numberOfPassengers == numberOfPassengers)&&const DeepCollectionEquality().equals(other.features, features)&&(identical(other.status, status) || other.status == status)&&(identical(other.price, price) || other.price == price)&&(identical(other.mileage, mileage) || other.mileage == mileage)&&(identical(other.warranty, warranty) || other.warranty == warranty)&&(identical(other.warrantyExpiration, warrantyExpiration) || other.warrantyExpiration == warrantyExpiration)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.Height, Height) || other.Height == Height)&&(identical(other.VIN, VIN) || other.VIN == VIN));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,userId,countryId,brandModelId,brandId,categoryId,name,year,slug,description,const DeepCollectionEquality().hash(images),location,serialNumber,condition,steerPosition,engineCapacity,transmission,color,buildType,numberOfPassengers,const DeepCollectionEquality().hash(features),status,price,mileage,warranty,warrantyExpiration,deletedAt,createdAt,updatedAt,Height,VIN]);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'RecommendedItem(id: $id, userId: $userId, countryId: $countryId, brandModelId: $brandModelId, brandId: $brandId, categoryId: $categoryId, name: $name, year: $year, slug: $slug, description: $description, images: $images, location: $location, serialNumber: $serialNumber, condition: $condition, steerPosition: $steerPosition, engineCapacity: $engineCapacity, transmission: $transmission, color: $color, buildType: $buildType, numberOfPassengers: $numberOfPassengers, features: $features, status: $status, price: $price, mileage: $mileage, warranty: $warranty, warrantyExpiration: $warrantyExpiration, deletedAt: $deletedAt, createdAt: $createdAt, updatedAt: $updatedAt, Height: $Height, VIN: $VIN)';
}


}

/// @nodoc
abstract mixin class $RecommendedItemCopyWith<$Res>  {
  factory $RecommendedItemCopyWith(RecommendedItem value, $Res Function(RecommendedItem) _then) = _$RecommendedItemCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'user_id') String? userId,@JsonKey(name: 'country_id') int? countryId,@JsonKey(name: 'brand_model_id') int? brandModelId,@JsonKey(name: 'brand_id') int? brandId,@JsonKey(name: 'category_id') int? categoryId, String? name, String? year, String? slug, String? description, List<String>? images, String? location,@JsonKey(name: 'serial_number') String? serialNumber, String? condition,@JsonKey(name: 'steer_position') String? steerPosition,@JsonKey(name: 'engine_capacity') String? engineCapacity, String? transmission, String? color,@JsonKey(name: 'build_type') String? buildType,@JsonKey(name: 'number_of_passengers') int? numberOfPassengers, List<String>? features, String? status, String? price, String? mileage, int? warranty,@JsonKey(name: 'warranty_expiration') String? warrantyExpiration,@JsonKey(name: 'deleted_at') String? deletedAt,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt, String? Height, String? VIN
});




}
/// @nodoc
class _$RecommendedItemCopyWithImpl<$Res>
    implements $RecommendedItemCopyWith<$Res> {
  _$RecommendedItemCopyWithImpl(this._self, this._then);

  final RecommendedItem _self;
  final $Res Function(RecommendedItem) _then;

/// Create a copy of RecommendedItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = freezed,Object? countryId = freezed,Object? brandModelId = freezed,Object? brandId = freezed,Object? categoryId = freezed,Object? name = freezed,Object? year = freezed,Object? slug = freezed,Object? description = freezed,Object? images = freezed,Object? location = freezed,Object? serialNumber = freezed,Object? condition = freezed,Object? steerPosition = freezed,Object? engineCapacity = freezed,Object? transmission = freezed,Object? color = freezed,Object? buildType = freezed,Object? numberOfPassengers = freezed,Object? features = freezed,Object? status = freezed,Object? price = freezed,Object? mileage = freezed,Object? warranty = freezed,Object? warrantyExpiration = freezed,Object? deletedAt = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? Height = freezed,Object? VIN = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,countryId: freezed == countryId ? _self.countryId : countryId // ignore: cast_nullable_to_non_nullable
as int?,brandModelId: freezed == brandModelId ? _self.brandModelId : brandModelId // ignore: cast_nullable_to_non_nullable
as int?,brandId: freezed == brandId ? _self.brandId : brandId // ignore: cast_nullable_to_non_nullable
as int?,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,year: freezed == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as String?,slug: freezed == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,images: freezed == images ? _self.images : images // ignore: cast_nullable_to_non_nullable
as List<String>?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,serialNumber: freezed == serialNumber ? _self.serialNumber : serialNumber // ignore: cast_nullable_to_non_nullable
as String?,condition: freezed == condition ? _self.condition : condition // ignore: cast_nullable_to_non_nullable
as String?,steerPosition: freezed == steerPosition ? _self.steerPosition : steerPosition // ignore: cast_nullable_to_non_nullable
as String?,engineCapacity: freezed == engineCapacity ? _self.engineCapacity : engineCapacity // ignore: cast_nullable_to_non_nullable
as String?,transmission: freezed == transmission ? _self.transmission : transmission // ignore: cast_nullable_to_non_nullable
as String?,color: freezed == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String?,buildType: freezed == buildType ? _self.buildType : buildType // ignore: cast_nullable_to_non_nullable
as String?,numberOfPassengers: freezed == numberOfPassengers ? _self.numberOfPassengers : numberOfPassengers // ignore: cast_nullable_to_non_nullable
as int?,features: freezed == features ? _self.features : features // ignore: cast_nullable_to_non_nullable
as List<String>?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as String?,mileage: freezed == mileage ? _self.mileage : mileage // ignore: cast_nullable_to_non_nullable
as String?,warranty: freezed == warranty ? _self.warranty : warranty // ignore: cast_nullable_to_non_nullable
as int?,warrantyExpiration: freezed == warrantyExpiration ? _self.warrantyExpiration : warrantyExpiration // ignore: cast_nullable_to_non_nullable
as String?,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,Height: freezed == Height ? _self.Height : Height // ignore: cast_nullable_to_non_nullable
as String?,VIN: freezed == VIN ? _self.VIN : VIN // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [RecommendedItem].
extension RecommendedItemPatterns on RecommendedItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RecommendedItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RecommendedItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RecommendedItem value)  $default,){
final _that = this;
switch (_that) {
case _RecommendedItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RecommendedItem value)?  $default,){
final _that = this;
switch (_that) {
case _RecommendedItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'user_id')  String? userId, @JsonKey(name: 'country_id')  int? countryId, @JsonKey(name: 'brand_model_id')  int? brandModelId, @JsonKey(name: 'brand_id')  int? brandId, @JsonKey(name: 'category_id')  int? categoryId,  String? name,  String? year,  String? slug,  String? description,  List<String>? images,  String? location, @JsonKey(name: 'serial_number')  String? serialNumber,  String? condition, @JsonKey(name: 'steer_position')  String? steerPosition, @JsonKey(name: 'engine_capacity')  String? engineCapacity,  String? transmission,  String? color, @JsonKey(name: 'build_type')  String? buildType, @JsonKey(name: 'number_of_passengers')  int? numberOfPassengers,  List<String>? features,  String? status,  String? price,  String? mileage,  int? warranty, @JsonKey(name: 'warranty_expiration')  String? warrantyExpiration, @JsonKey(name: 'deleted_at')  String? deletedAt, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt,  String? Height,  String? VIN)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RecommendedItem() when $default != null:
return $default(_that.id,_that.userId,_that.countryId,_that.brandModelId,_that.brandId,_that.categoryId,_that.name,_that.year,_that.slug,_that.description,_that.images,_that.location,_that.serialNumber,_that.condition,_that.steerPosition,_that.engineCapacity,_that.transmission,_that.color,_that.buildType,_that.numberOfPassengers,_that.features,_that.status,_that.price,_that.mileage,_that.warranty,_that.warrantyExpiration,_that.deletedAt,_that.createdAt,_that.updatedAt,_that.Height,_that.VIN);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'user_id')  String? userId, @JsonKey(name: 'country_id')  int? countryId, @JsonKey(name: 'brand_model_id')  int? brandModelId, @JsonKey(name: 'brand_id')  int? brandId, @JsonKey(name: 'category_id')  int? categoryId,  String? name,  String? year,  String? slug,  String? description,  List<String>? images,  String? location, @JsonKey(name: 'serial_number')  String? serialNumber,  String? condition, @JsonKey(name: 'steer_position')  String? steerPosition, @JsonKey(name: 'engine_capacity')  String? engineCapacity,  String? transmission,  String? color, @JsonKey(name: 'build_type')  String? buildType, @JsonKey(name: 'number_of_passengers')  int? numberOfPassengers,  List<String>? features,  String? status,  String? price,  String? mileage,  int? warranty, @JsonKey(name: 'warranty_expiration')  String? warrantyExpiration, @JsonKey(name: 'deleted_at')  String? deletedAt, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt,  String? Height,  String? VIN)  $default,) {final _that = this;
switch (_that) {
case _RecommendedItem():
return $default(_that.id,_that.userId,_that.countryId,_that.brandModelId,_that.brandId,_that.categoryId,_that.name,_that.year,_that.slug,_that.description,_that.images,_that.location,_that.serialNumber,_that.condition,_that.steerPosition,_that.engineCapacity,_that.transmission,_that.color,_that.buildType,_that.numberOfPassengers,_that.features,_that.status,_that.price,_that.mileage,_that.warranty,_that.warrantyExpiration,_that.deletedAt,_that.createdAt,_that.updatedAt,_that.Height,_that.VIN);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'user_id')  String? userId, @JsonKey(name: 'country_id')  int? countryId, @JsonKey(name: 'brand_model_id')  int? brandModelId, @JsonKey(name: 'brand_id')  int? brandId, @JsonKey(name: 'category_id')  int? categoryId,  String? name,  String? year,  String? slug,  String? description,  List<String>? images,  String? location, @JsonKey(name: 'serial_number')  String? serialNumber,  String? condition, @JsonKey(name: 'steer_position')  String? steerPosition, @JsonKey(name: 'engine_capacity')  String? engineCapacity,  String? transmission,  String? color, @JsonKey(name: 'build_type')  String? buildType, @JsonKey(name: 'number_of_passengers')  int? numberOfPassengers,  List<String>? features,  String? status,  String? price,  String? mileage,  int? warranty, @JsonKey(name: 'warranty_expiration')  String? warrantyExpiration, @JsonKey(name: 'deleted_at')  String? deletedAt, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt,  String? Height,  String? VIN)?  $default,) {final _that = this;
switch (_that) {
case _RecommendedItem() when $default != null:
return $default(_that.id,_that.userId,_that.countryId,_that.brandModelId,_that.brandId,_that.categoryId,_that.name,_that.year,_that.slug,_that.description,_that.images,_that.location,_that.serialNumber,_that.condition,_that.steerPosition,_that.engineCapacity,_that.transmission,_that.color,_that.buildType,_that.numberOfPassengers,_that.features,_that.status,_that.price,_that.mileage,_that.warranty,_that.warrantyExpiration,_that.deletedAt,_that.createdAt,_that.updatedAt,_that.Height,_that.VIN);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RecommendedItem with DiagnosticableTreeMixin implements RecommendedItem {
  const _RecommendedItem({required this.id, @JsonKey(name: 'user_id') this.userId, @JsonKey(name: 'country_id') this.countryId, @JsonKey(name: 'brand_model_id') this.brandModelId, @JsonKey(name: 'brand_id') this.brandId, @JsonKey(name: 'category_id') this.categoryId, this.name, this.year, this.slug, this.description, final  List<String>? images, this.location, @JsonKey(name: 'serial_number') this.serialNumber, this.condition, @JsonKey(name: 'steer_position') this.steerPosition, @JsonKey(name: 'engine_capacity') this.engineCapacity, this.transmission, this.color, @JsonKey(name: 'build_type') this.buildType, @JsonKey(name: 'number_of_passengers') this.numberOfPassengers, final  List<String>? features, this.status, this.price, this.mileage, this.warranty, @JsonKey(name: 'warranty_expiration') this.warrantyExpiration, @JsonKey(name: 'deleted_at') this.deletedAt, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt, this.Height, this.VIN}): _images = images,_features = features;
  factory _RecommendedItem.fromJson(Map<String, dynamic> json) => _$RecommendedItemFromJson(json);

@override final  String id;
@override@JsonKey(name: 'user_id') final  String? userId;
@override@JsonKey(name: 'country_id') final  int? countryId;
@override@JsonKey(name: 'brand_model_id') final  int? brandModelId;
@override@JsonKey(name: 'brand_id') final  int? brandId;
@override@JsonKey(name: 'category_id') final  int? categoryId;
@override final  String? name;
@override final  String? year;
@override final  String? slug;
@override final  String? description;
 final  List<String>? _images;
@override List<String>? get images {
  final value = _images;
  if (value == null) return null;
  if (_images is EqualUnmodifiableListView) return _images;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  String? location;
@override@JsonKey(name: 'serial_number') final  String? serialNumber;
@override final  String? condition;
@override@JsonKey(name: 'steer_position') final  String? steerPosition;
@override@JsonKey(name: 'engine_capacity') final  String? engineCapacity;
@override final  String? transmission;
@override final  String? color;
@override@JsonKey(name: 'build_type') final  String? buildType;
@override@JsonKey(name: 'number_of_passengers') final  int? numberOfPassengers;
 final  List<String>? _features;
@override List<String>? get features {
  final value = _features;
  if (value == null) return null;
  if (_features is EqualUnmodifiableListView) return _features;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  String? status;
@override final  String? price;
@override final  String? mileage;
@override final  int? warranty;
@override@JsonKey(name: 'warranty_expiration') final  String? warrantyExpiration;
@override@JsonKey(name: 'deleted_at') final  String? deletedAt;
@override@JsonKey(name: 'created_at') final  DateTime? createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime? updatedAt;
@override final  String? Height;
@override final  String? VIN;

/// Create a copy of RecommendedItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RecommendedItemCopyWith<_RecommendedItem> get copyWith => __$RecommendedItemCopyWithImpl<_RecommendedItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RecommendedItemToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'RecommendedItem'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('userId', userId))..add(DiagnosticsProperty('countryId', countryId))..add(DiagnosticsProperty('brandModelId', brandModelId))..add(DiagnosticsProperty('brandId', brandId))..add(DiagnosticsProperty('categoryId', categoryId))..add(DiagnosticsProperty('name', name))..add(DiagnosticsProperty('year', year))..add(DiagnosticsProperty('slug', slug))..add(DiagnosticsProperty('description', description))..add(DiagnosticsProperty('images', images))..add(DiagnosticsProperty('location', location))..add(DiagnosticsProperty('serialNumber', serialNumber))..add(DiagnosticsProperty('condition', condition))..add(DiagnosticsProperty('steerPosition', steerPosition))..add(DiagnosticsProperty('engineCapacity', engineCapacity))..add(DiagnosticsProperty('transmission', transmission))..add(DiagnosticsProperty('color', color))..add(DiagnosticsProperty('buildType', buildType))..add(DiagnosticsProperty('numberOfPassengers', numberOfPassengers))..add(DiagnosticsProperty('features', features))..add(DiagnosticsProperty('status', status))..add(DiagnosticsProperty('price', price))..add(DiagnosticsProperty('mileage', mileage))..add(DiagnosticsProperty('warranty', warranty))..add(DiagnosticsProperty('warrantyExpiration', warrantyExpiration))..add(DiagnosticsProperty('deletedAt', deletedAt))..add(DiagnosticsProperty('createdAt', createdAt))..add(DiagnosticsProperty('updatedAt', updatedAt))..add(DiagnosticsProperty('Height', Height))..add(DiagnosticsProperty('VIN', VIN));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RecommendedItem&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.countryId, countryId) || other.countryId == countryId)&&(identical(other.brandModelId, brandModelId) || other.brandModelId == brandModelId)&&(identical(other.brandId, brandId) || other.brandId == brandId)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.name, name) || other.name == name)&&(identical(other.year, year) || other.year == year)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._images, _images)&&(identical(other.location, location) || other.location == location)&&(identical(other.serialNumber, serialNumber) || other.serialNumber == serialNumber)&&(identical(other.condition, condition) || other.condition == condition)&&(identical(other.steerPosition, steerPosition) || other.steerPosition == steerPosition)&&(identical(other.engineCapacity, engineCapacity) || other.engineCapacity == engineCapacity)&&(identical(other.transmission, transmission) || other.transmission == transmission)&&(identical(other.color, color) || other.color == color)&&(identical(other.buildType, buildType) || other.buildType == buildType)&&(identical(other.numberOfPassengers, numberOfPassengers) || other.numberOfPassengers == numberOfPassengers)&&const DeepCollectionEquality().equals(other._features, _features)&&(identical(other.status, status) || other.status == status)&&(identical(other.price, price) || other.price == price)&&(identical(other.mileage, mileage) || other.mileage == mileage)&&(identical(other.warranty, warranty) || other.warranty == warranty)&&(identical(other.warrantyExpiration, warrantyExpiration) || other.warrantyExpiration == warrantyExpiration)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.Height, Height) || other.Height == Height)&&(identical(other.VIN, VIN) || other.VIN == VIN));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,userId,countryId,brandModelId,brandId,categoryId,name,year,slug,description,const DeepCollectionEquality().hash(_images),location,serialNumber,condition,steerPosition,engineCapacity,transmission,color,buildType,numberOfPassengers,const DeepCollectionEquality().hash(_features),status,price,mileage,warranty,warrantyExpiration,deletedAt,createdAt,updatedAt,Height,VIN]);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'RecommendedItem(id: $id, userId: $userId, countryId: $countryId, brandModelId: $brandModelId, brandId: $brandId, categoryId: $categoryId, name: $name, year: $year, slug: $slug, description: $description, images: $images, location: $location, serialNumber: $serialNumber, condition: $condition, steerPosition: $steerPosition, engineCapacity: $engineCapacity, transmission: $transmission, color: $color, buildType: $buildType, numberOfPassengers: $numberOfPassengers, features: $features, status: $status, price: $price, mileage: $mileage, warranty: $warranty, warrantyExpiration: $warrantyExpiration, deletedAt: $deletedAt, createdAt: $createdAt, updatedAt: $updatedAt, Height: $Height, VIN: $VIN)';
}


}

/// @nodoc
abstract mixin class _$RecommendedItemCopyWith<$Res> implements $RecommendedItemCopyWith<$Res> {
  factory _$RecommendedItemCopyWith(_RecommendedItem value, $Res Function(_RecommendedItem) _then) = __$RecommendedItemCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'user_id') String? userId,@JsonKey(name: 'country_id') int? countryId,@JsonKey(name: 'brand_model_id') int? brandModelId,@JsonKey(name: 'brand_id') int? brandId,@JsonKey(name: 'category_id') int? categoryId, String? name, String? year, String? slug, String? description, List<String>? images, String? location,@JsonKey(name: 'serial_number') String? serialNumber, String? condition,@JsonKey(name: 'steer_position') String? steerPosition,@JsonKey(name: 'engine_capacity') String? engineCapacity, String? transmission, String? color,@JsonKey(name: 'build_type') String? buildType,@JsonKey(name: 'number_of_passengers') int? numberOfPassengers, List<String>? features, String? status, String? price, String? mileage, int? warranty,@JsonKey(name: 'warranty_expiration') String? warrantyExpiration,@JsonKey(name: 'deleted_at') String? deletedAt,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt, String? Height, String? VIN
});




}
/// @nodoc
class __$RecommendedItemCopyWithImpl<$Res>
    implements _$RecommendedItemCopyWith<$Res> {
  __$RecommendedItemCopyWithImpl(this._self, this._then);

  final _RecommendedItem _self;
  final $Res Function(_RecommendedItem) _then;

/// Create a copy of RecommendedItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = freezed,Object? countryId = freezed,Object? brandModelId = freezed,Object? brandId = freezed,Object? categoryId = freezed,Object? name = freezed,Object? year = freezed,Object? slug = freezed,Object? description = freezed,Object? images = freezed,Object? location = freezed,Object? serialNumber = freezed,Object? condition = freezed,Object? steerPosition = freezed,Object? engineCapacity = freezed,Object? transmission = freezed,Object? color = freezed,Object? buildType = freezed,Object? numberOfPassengers = freezed,Object? features = freezed,Object? status = freezed,Object? price = freezed,Object? mileage = freezed,Object? warranty = freezed,Object? warrantyExpiration = freezed,Object? deletedAt = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? Height = freezed,Object? VIN = freezed,}) {
  return _then(_RecommendedItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,countryId: freezed == countryId ? _self.countryId : countryId // ignore: cast_nullable_to_non_nullable
as int?,brandModelId: freezed == brandModelId ? _self.brandModelId : brandModelId // ignore: cast_nullable_to_non_nullable
as int?,brandId: freezed == brandId ? _self.brandId : brandId // ignore: cast_nullable_to_non_nullable
as int?,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,year: freezed == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as String?,slug: freezed == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,images: freezed == images ? _self._images : images // ignore: cast_nullable_to_non_nullable
as List<String>?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,serialNumber: freezed == serialNumber ? _self.serialNumber : serialNumber // ignore: cast_nullable_to_non_nullable
as String?,condition: freezed == condition ? _self.condition : condition // ignore: cast_nullable_to_non_nullable
as String?,steerPosition: freezed == steerPosition ? _self.steerPosition : steerPosition // ignore: cast_nullable_to_non_nullable
as String?,engineCapacity: freezed == engineCapacity ? _self.engineCapacity : engineCapacity // ignore: cast_nullable_to_non_nullable
as String?,transmission: freezed == transmission ? _self.transmission : transmission // ignore: cast_nullable_to_non_nullable
as String?,color: freezed == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String?,buildType: freezed == buildType ? _self.buildType : buildType // ignore: cast_nullable_to_non_nullable
as String?,numberOfPassengers: freezed == numberOfPassengers ? _self.numberOfPassengers : numberOfPassengers // ignore: cast_nullable_to_non_nullable
as int?,features: freezed == features ? _self._features : features // ignore: cast_nullable_to_non_nullable
as List<String>?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as String?,mileage: freezed == mileage ? _self.mileage : mileage // ignore: cast_nullable_to_non_nullable
as String?,warranty: freezed == warranty ? _self.warranty : warranty // ignore: cast_nullable_to_non_nullable
as int?,warrantyExpiration: freezed == warrantyExpiration ? _self.warrantyExpiration : warrantyExpiration // ignore: cast_nullable_to_non_nullable
as String?,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,Height: freezed == Height ? _self.Height : Height // ignore: cast_nullable_to_non_nullable
as String?,VIN: freezed == VIN ? _self.VIN : VIN // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
