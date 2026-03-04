// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'specialOfferModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SpecialOfferResponse implements DiagnosticableTreeMixin {

 List<SpecialOffer> get data; PaginationLinks? get links; PaginationMeta? get meta;
/// Create a copy of SpecialOfferResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SpecialOfferResponseCopyWith<SpecialOfferResponse> get copyWith => _$SpecialOfferResponseCopyWithImpl<SpecialOfferResponse>(this as SpecialOfferResponse, _$identity);

  /// Serializes this SpecialOfferResponse to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'SpecialOfferResponse'))
    ..add(DiagnosticsProperty('data', data))..add(DiagnosticsProperty('links', links))..add(DiagnosticsProperty('meta', meta));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SpecialOfferResponse&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.links, links) || other.links == links)&&(identical(other.meta, meta) || other.meta == meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data),links,meta);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'SpecialOfferResponse(data: $data, links: $links, meta: $meta)';
}


}

/// @nodoc
abstract mixin class $SpecialOfferResponseCopyWith<$Res>  {
  factory $SpecialOfferResponseCopyWith(SpecialOfferResponse value, $Res Function(SpecialOfferResponse) _then) = _$SpecialOfferResponseCopyWithImpl;
@useResult
$Res call({
 List<SpecialOffer> data, PaginationLinks? links, PaginationMeta? meta
});


$PaginationLinksCopyWith<$Res>? get links;$PaginationMetaCopyWith<$Res>? get meta;

}
/// @nodoc
class _$SpecialOfferResponseCopyWithImpl<$Res>
    implements $SpecialOfferResponseCopyWith<$Res> {
  _$SpecialOfferResponseCopyWithImpl(this._self, this._then);

  final SpecialOfferResponse _self;
  final $Res Function(SpecialOfferResponse) _then;

/// Create a copy of SpecialOfferResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = null,Object? links = freezed,Object? meta = freezed,}) {
  return _then(_self.copyWith(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<SpecialOffer>,links: freezed == links ? _self.links : links // ignore: cast_nullable_to_non_nullable
as PaginationLinks?,meta: freezed == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as PaginationMeta?,
  ));
}
/// Create a copy of SpecialOfferResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaginationLinksCopyWith<$Res>? get links {
    if (_self.links == null) {
    return null;
  }

  return $PaginationLinksCopyWith<$Res>(_self.links!, (value) {
    return _then(_self.copyWith(links: value));
  });
}/// Create a copy of SpecialOfferResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaginationMetaCopyWith<$Res>? get meta {
    if (_self.meta == null) {
    return null;
  }

  return $PaginationMetaCopyWith<$Res>(_self.meta!, (value) {
    return _then(_self.copyWith(meta: value));
  });
}
}


/// Adds pattern-matching-related methods to [SpecialOfferResponse].
extension SpecialOfferResponsePatterns on SpecialOfferResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SpecialOfferResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SpecialOfferResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SpecialOfferResponse value)  $default,){
final _that = this;
switch (_that) {
case _SpecialOfferResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SpecialOfferResponse value)?  $default,){
final _that = this;
switch (_that) {
case _SpecialOfferResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<SpecialOffer> data,  PaginationLinks? links,  PaginationMeta? meta)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SpecialOfferResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<SpecialOffer> data,  PaginationLinks? links,  PaginationMeta? meta)  $default,) {final _that = this;
switch (_that) {
case _SpecialOfferResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<SpecialOffer> data,  PaginationLinks? links,  PaginationMeta? meta)?  $default,) {final _that = this;
switch (_that) {
case _SpecialOfferResponse() when $default != null:
return $default(_that.data,_that.links,_that.meta);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SpecialOfferResponse with DiagnosticableTreeMixin implements SpecialOfferResponse {
  const _SpecialOfferResponse({final  List<SpecialOffer> data = const [], this.links, this.meta}): _data = data;
  factory _SpecialOfferResponse.fromJson(Map<String, dynamic> json) => _$SpecialOfferResponseFromJson(json);

 final  List<SpecialOffer> _data;
@override@JsonKey() List<SpecialOffer> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}

@override final  PaginationLinks? links;
@override final  PaginationMeta? meta;

/// Create a copy of SpecialOfferResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SpecialOfferResponseCopyWith<_SpecialOfferResponse> get copyWith => __$SpecialOfferResponseCopyWithImpl<_SpecialOfferResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SpecialOfferResponseToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'SpecialOfferResponse'))
    ..add(DiagnosticsProperty('data', data))..add(DiagnosticsProperty('links', links))..add(DiagnosticsProperty('meta', meta));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SpecialOfferResponse&&const DeepCollectionEquality().equals(other._data, _data)&&(identical(other.links, links) || other.links == links)&&(identical(other.meta, meta) || other.meta == meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_data),links,meta);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'SpecialOfferResponse(data: $data, links: $links, meta: $meta)';
}


}

/// @nodoc
abstract mixin class _$SpecialOfferResponseCopyWith<$Res> implements $SpecialOfferResponseCopyWith<$Res> {
  factory _$SpecialOfferResponseCopyWith(_SpecialOfferResponse value, $Res Function(_SpecialOfferResponse) _then) = __$SpecialOfferResponseCopyWithImpl;
@override @useResult
$Res call({
 List<SpecialOffer> data, PaginationLinks? links, PaginationMeta? meta
});


@override $PaginationLinksCopyWith<$Res>? get links;@override $PaginationMetaCopyWith<$Res>? get meta;

}
/// @nodoc
class __$SpecialOfferResponseCopyWithImpl<$Res>
    implements _$SpecialOfferResponseCopyWith<$Res> {
  __$SpecialOfferResponseCopyWithImpl(this._self, this._then);

  final _SpecialOfferResponse _self;
  final $Res Function(_SpecialOfferResponse) _then;

/// Create a copy of SpecialOfferResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,Object? links = freezed,Object? meta = freezed,}) {
  return _then(_SpecialOfferResponse(
data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<SpecialOffer>,links: freezed == links ? _self.links : links // ignore: cast_nullable_to_non_nullable
as PaginationLinks?,meta: freezed == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as PaginationMeta?,
  ));
}

/// Create a copy of SpecialOfferResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaginationLinksCopyWith<$Res>? get links {
    if (_self.links == null) {
    return null;
  }

  return $PaginationLinksCopyWith<$Res>(_self.links!, (value) {
    return _then(_self.copyWith(links: value));
  });
}/// Create a copy of SpecialOfferResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaginationMetaCopyWith<$Res>? get meta {
    if (_self.meta == null) {
    return null;
  }

  return $PaginationMetaCopyWith<$Res>(_self.meta!, (value) {
    return _then(_self.copyWith(meta: value));
  });
}
}


/// @nodoc
mixin _$SpecialOffer implements DiagnosticableTreeMixin {

@JsonKey(fromJson: _parseInt) int get id;@JsonKey(name: 'user_id', fromJson: _parseInt) int? get userId;@JsonKey(name: 'item_id', fromJson: _parseString) String get itemId;@JsonKey(name: 'start_at', fromJson: _parseString) String get startAt;@JsonKey(name: 'end_at', fromJson: _parseString) String get endAt;@JsonKey(fromJson: _parseString) String get status;@JsonKey(fromJson: _parseInt) int get discount;@JsonKey(name: 'discount_type', fromJson: _parseString) String get discountType; String? get description;@JsonKey(name: 'created_at', fromJson: _parseString) String get createdAt;@JsonKey(name: 'updated_at', fromJson: _parseString) String get updatedAt; Item? get item;
/// Create a copy of SpecialOffer
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SpecialOfferCopyWith<SpecialOffer> get copyWith => _$SpecialOfferCopyWithImpl<SpecialOffer>(this as SpecialOffer, _$identity);

  /// Serializes this SpecialOffer to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'SpecialOffer'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('userId', userId))..add(DiagnosticsProperty('itemId', itemId))..add(DiagnosticsProperty('startAt', startAt))..add(DiagnosticsProperty('endAt', endAt))..add(DiagnosticsProperty('status', status))..add(DiagnosticsProperty('discount', discount))..add(DiagnosticsProperty('discountType', discountType))..add(DiagnosticsProperty('description', description))..add(DiagnosticsProperty('createdAt', createdAt))..add(DiagnosticsProperty('updatedAt', updatedAt))..add(DiagnosticsProperty('item', item));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SpecialOffer&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.itemId, itemId) || other.itemId == itemId)&&(identical(other.startAt, startAt) || other.startAt == startAt)&&(identical(other.endAt, endAt) || other.endAt == endAt)&&(identical(other.status, status) || other.status == status)&&(identical(other.discount, discount) || other.discount == discount)&&(identical(other.discountType, discountType) || other.discountType == discountType)&&(identical(other.description, description) || other.description == description)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.item, item) || other.item == item));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,itemId,startAt,endAt,status,discount,discountType,description,createdAt,updatedAt,item);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'SpecialOffer(id: $id, userId: $userId, itemId: $itemId, startAt: $startAt, endAt: $endAt, status: $status, discount: $discount, discountType: $discountType, description: $description, createdAt: $createdAt, updatedAt: $updatedAt, item: $item)';
}


}

/// @nodoc
abstract mixin class $SpecialOfferCopyWith<$Res>  {
  factory $SpecialOfferCopyWith(SpecialOffer value, $Res Function(SpecialOffer) _then) = _$SpecialOfferCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: _parseInt) int id,@JsonKey(name: 'user_id', fromJson: _parseInt) int? userId,@JsonKey(name: 'item_id', fromJson: _parseString) String itemId,@JsonKey(name: 'start_at', fromJson: _parseString) String startAt,@JsonKey(name: 'end_at', fromJson: _parseString) String endAt,@JsonKey(fromJson: _parseString) String status,@JsonKey(fromJson: _parseInt) int discount,@JsonKey(name: 'discount_type', fromJson: _parseString) String discountType, String? description,@JsonKey(name: 'created_at', fromJson: _parseString) String createdAt,@JsonKey(name: 'updated_at', fromJson: _parseString) String updatedAt, Item? item
});


$ItemCopyWith<$Res>? get item;

}
/// @nodoc
class _$SpecialOfferCopyWithImpl<$Res>
    implements $SpecialOfferCopyWith<$Res> {
  _$SpecialOfferCopyWithImpl(this._self, this._then);

  final SpecialOffer _self;
  final $Res Function(SpecialOffer) _then;

/// Create a copy of SpecialOffer
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = freezed,Object? itemId = null,Object? startAt = null,Object? endAt = null,Object? status = null,Object? discount = null,Object? discountType = null,Object? description = freezed,Object? createdAt = null,Object? updatedAt = null,Object? item = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int?,itemId: null == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as String,startAt: null == startAt ? _self.startAt : startAt // ignore: cast_nullable_to_non_nullable
as String,endAt: null == endAt ? _self.endAt : endAt // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,discount: null == discount ? _self.discount : discount // ignore: cast_nullable_to_non_nullable
as int,discountType: null == discountType ? _self.discountType : discountType // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,item: freezed == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as Item?,
  ));
}
/// Create a copy of SpecialOffer
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ItemCopyWith<$Res>? get item {
    if (_self.item == null) {
    return null;
  }

  return $ItemCopyWith<$Res>(_self.item!, (value) {
    return _then(_self.copyWith(item: value));
  });
}
}


/// Adds pattern-matching-related methods to [SpecialOffer].
extension SpecialOfferPatterns on SpecialOffer {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SpecialOffer value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SpecialOffer() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SpecialOffer value)  $default,){
final _that = this;
switch (_that) {
case _SpecialOffer():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SpecialOffer value)?  $default,){
final _that = this;
switch (_that) {
case _SpecialOffer() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _parseInt)  int id, @JsonKey(name: 'user_id', fromJson: _parseInt)  int? userId, @JsonKey(name: 'item_id', fromJson: _parseString)  String itemId, @JsonKey(name: 'start_at', fromJson: _parseString)  String startAt, @JsonKey(name: 'end_at', fromJson: _parseString)  String endAt, @JsonKey(fromJson: _parseString)  String status, @JsonKey(fromJson: _parseInt)  int discount, @JsonKey(name: 'discount_type', fromJson: _parseString)  String discountType,  String? description, @JsonKey(name: 'created_at', fromJson: _parseString)  String createdAt, @JsonKey(name: 'updated_at', fromJson: _parseString)  String updatedAt,  Item? item)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SpecialOffer() when $default != null:
return $default(_that.id,_that.userId,_that.itemId,_that.startAt,_that.endAt,_that.status,_that.discount,_that.discountType,_that.description,_that.createdAt,_that.updatedAt,_that.item);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _parseInt)  int id, @JsonKey(name: 'user_id', fromJson: _parseInt)  int? userId, @JsonKey(name: 'item_id', fromJson: _parseString)  String itemId, @JsonKey(name: 'start_at', fromJson: _parseString)  String startAt, @JsonKey(name: 'end_at', fromJson: _parseString)  String endAt, @JsonKey(fromJson: _parseString)  String status, @JsonKey(fromJson: _parseInt)  int discount, @JsonKey(name: 'discount_type', fromJson: _parseString)  String discountType,  String? description, @JsonKey(name: 'created_at', fromJson: _parseString)  String createdAt, @JsonKey(name: 'updated_at', fromJson: _parseString)  String updatedAt,  Item? item)  $default,) {final _that = this;
switch (_that) {
case _SpecialOffer():
return $default(_that.id,_that.userId,_that.itemId,_that.startAt,_that.endAt,_that.status,_that.discount,_that.discountType,_that.description,_that.createdAt,_that.updatedAt,_that.item);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: _parseInt)  int id, @JsonKey(name: 'user_id', fromJson: _parseInt)  int? userId, @JsonKey(name: 'item_id', fromJson: _parseString)  String itemId, @JsonKey(name: 'start_at', fromJson: _parseString)  String startAt, @JsonKey(name: 'end_at', fromJson: _parseString)  String endAt, @JsonKey(fromJson: _parseString)  String status, @JsonKey(fromJson: _parseInt)  int discount, @JsonKey(name: 'discount_type', fromJson: _parseString)  String discountType,  String? description, @JsonKey(name: 'created_at', fromJson: _parseString)  String createdAt, @JsonKey(name: 'updated_at', fromJson: _parseString)  String updatedAt,  Item? item)?  $default,) {final _that = this;
switch (_that) {
case _SpecialOffer() when $default != null:
return $default(_that.id,_that.userId,_that.itemId,_that.startAt,_that.endAt,_that.status,_that.discount,_that.discountType,_that.description,_that.createdAt,_that.updatedAt,_that.item);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SpecialOffer with DiagnosticableTreeMixin implements SpecialOffer {
  const _SpecialOffer({@JsonKey(fromJson: _parseInt) required this.id, @JsonKey(name: 'user_id', fromJson: _parseInt) this.userId, @JsonKey(name: 'item_id', fromJson: _parseString) required this.itemId, @JsonKey(name: 'start_at', fromJson: _parseString) required this.startAt, @JsonKey(name: 'end_at', fromJson: _parseString) required this.endAt, @JsonKey(fromJson: _parseString) required this.status, @JsonKey(fromJson: _parseInt) required this.discount, @JsonKey(name: 'discount_type', fromJson: _parseString) required this.discountType, this.description, @JsonKey(name: 'created_at', fromJson: _parseString) required this.createdAt, @JsonKey(name: 'updated_at', fromJson: _parseString) required this.updatedAt, this.item});
  factory _SpecialOffer.fromJson(Map<String, dynamic> json) => _$SpecialOfferFromJson(json);

@override@JsonKey(fromJson: _parseInt) final  int id;
@override@JsonKey(name: 'user_id', fromJson: _parseInt) final  int? userId;
@override@JsonKey(name: 'item_id', fromJson: _parseString) final  String itemId;
@override@JsonKey(name: 'start_at', fromJson: _parseString) final  String startAt;
@override@JsonKey(name: 'end_at', fromJson: _parseString) final  String endAt;
@override@JsonKey(fromJson: _parseString) final  String status;
@override@JsonKey(fromJson: _parseInt) final  int discount;
@override@JsonKey(name: 'discount_type', fromJson: _parseString) final  String discountType;
@override final  String? description;
@override@JsonKey(name: 'created_at', fromJson: _parseString) final  String createdAt;
@override@JsonKey(name: 'updated_at', fromJson: _parseString) final  String updatedAt;
@override final  Item? item;

/// Create a copy of SpecialOffer
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SpecialOfferCopyWith<_SpecialOffer> get copyWith => __$SpecialOfferCopyWithImpl<_SpecialOffer>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SpecialOfferToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'SpecialOffer'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('userId', userId))..add(DiagnosticsProperty('itemId', itemId))..add(DiagnosticsProperty('startAt', startAt))..add(DiagnosticsProperty('endAt', endAt))..add(DiagnosticsProperty('status', status))..add(DiagnosticsProperty('discount', discount))..add(DiagnosticsProperty('discountType', discountType))..add(DiagnosticsProperty('description', description))..add(DiagnosticsProperty('createdAt', createdAt))..add(DiagnosticsProperty('updatedAt', updatedAt))..add(DiagnosticsProperty('item', item));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SpecialOffer&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.itemId, itemId) || other.itemId == itemId)&&(identical(other.startAt, startAt) || other.startAt == startAt)&&(identical(other.endAt, endAt) || other.endAt == endAt)&&(identical(other.status, status) || other.status == status)&&(identical(other.discount, discount) || other.discount == discount)&&(identical(other.discountType, discountType) || other.discountType == discountType)&&(identical(other.description, description) || other.description == description)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.item, item) || other.item == item));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,itemId,startAt,endAt,status,discount,discountType,description,createdAt,updatedAt,item);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'SpecialOffer(id: $id, userId: $userId, itemId: $itemId, startAt: $startAt, endAt: $endAt, status: $status, discount: $discount, discountType: $discountType, description: $description, createdAt: $createdAt, updatedAt: $updatedAt, item: $item)';
}


}

/// @nodoc
abstract mixin class _$SpecialOfferCopyWith<$Res> implements $SpecialOfferCopyWith<$Res> {
  factory _$SpecialOfferCopyWith(_SpecialOffer value, $Res Function(_SpecialOffer) _then) = __$SpecialOfferCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: _parseInt) int id,@JsonKey(name: 'user_id', fromJson: _parseInt) int? userId,@JsonKey(name: 'item_id', fromJson: _parseString) String itemId,@JsonKey(name: 'start_at', fromJson: _parseString) String startAt,@JsonKey(name: 'end_at', fromJson: _parseString) String endAt,@JsonKey(fromJson: _parseString) String status,@JsonKey(fromJson: _parseInt) int discount,@JsonKey(name: 'discount_type', fromJson: _parseString) String discountType, String? description,@JsonKey(name: 'created_at', fromJson: _parseString) String createdAt,@JsonKey(name: 'updated_at', fromJson: _parseString) String updatedAt, Item? item
});


@override $ItemCopyWith<$Res>? get item;

}
/// @nodoc
class __$SpecialOfferCopyWithImpl<$Res>
    implements _$SpecialOfferCopyWith<$Res> {
  __$SpecialOfferCopyWithImpl(this._self, this._then);

  final _SpecialOffer _self;
  final $Res Function(_SpecialOffer) _then;

/// Create a copy of SpecialOffer
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = freezed,Object? itemId = null,Object? startAt = null,Object? endAt = null,Object? status = null,Object? discount = null,Object? discountType = null,Object? description = freezed,Object? createdAt = null,Object? updatedAt = null,Object? item = freezed,}) {
  return _then(_SpecialOffer(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int?,itemId: null == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as String,startAt: null == startAt ? _self.startAt : startAt // ignore: cast_nullable_to_non_nullable
as String,endAt: null == endAt ? _self.endAt : endAt // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,discount: null == discount ? _self.discount : discount // ignore: cast_nullable_to_non_nullable
as int,discountType: null == discountType ? _self.discountType : discountType // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,item: freezed == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as Item?,
  ));
}

/// Create a copy of SpecialOffer
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ItemCopyWith<$Res>? get item {
    if (_self.item == null) {
    return null;
  }

  return $ItemCopyWith<$Res>(_self.item!, (value) {
    return _then(_self.copyWith(item: value));
  });
}
}


/// @nodoc
mixin _$Item implements DiagnosticableTreeMixin {

@JsonKey(fromJson: _parseString) String get id;@JsonKey(name: 'user_id', fromJson: _parseInt) int? get userId;@JsonKey(name: 'country_id', fromJson: _parseInt) int? get countryId;@JsonKey(name: 'brand_model_id', fromJson: _parseInt) int? get brandModelId;@JsonKey(name: 'brand_id', fromJson: _parseInt) int? get brandId;@JsonKey(name: 'category_id', fromJson: _parseInt) int? get categoryId;@JsonKey(fromJson: _parseString) String get name;@JsonKey(fromJson: _parseString) String? get year;// Added converter
@JsonKey(fromJson: _parseString) String? get slug;@JsonKey(fromJson: _parseString) String? get description; List<String>? get images;@JsonKey(fromJson: _parseString) String? get location;@JsonKey(name: 'serial_number', fromJson: _parseString) String? get serialNumber;// Added converter
@JsonKey(fromJson: _parseString) String? get condition;// Added converter
@JsonKey(name: 'steer_position', fromJson: _parseString) String? get steerPosition;@JsonKey(name: 'engine_capacity', fromJson: _parseString) String? get engineCapacity;@JsonKey(fromJson: _parseString) String? get transmission;@JsonKey(fromJson: _parseString) String? get color;@JsonKey(name: 'build_type', fromJson: _parseString) String? get buildType;@JsonKey(name: 'number_of_passengers', fromJson: _parseInt) int? get numberOfPassengers; List<String>? get features;@JsonKey(fromJson: _parseString) String? get status;// Added converter
@JsonKey(fromJson: _parseString) String? get price;@JsonKey(fromJson: _parseString) String? get mileage;@JsonKey(fromJson: _parseInt) int? get warranty;@JsonKey(name: 'warranty_expiration', fromJson: _parseString) String? get warrantyExpiration;@JsonKey(name: 'deleted_at', fromJson: _parseString) String? get deletedAt;@JsonKey(name: 'created_at', fromJson: _parseString) String? get createdAt;@JsonKey(name: 'updated_at', fromJson: _parseString) String? get updatedAt;// New fields from response
@JsonKey(fromJson: _parseString) String? get Height;@JsonKey(fromJson: _parseString) String? get VIN; Brand? get brand; Category? get category;@JsonKey(name: 'brand_model') BrandModel? get brandModel; User? get user;
/// Create a copy of Item
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ItemCopyWith<Item> get copyWith => _$ItemCopyWithImpl<Item>(this as Item, _$identity);

  /// Serializes this Item to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'Item'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('userId', userId))..add(DiagnosticsProperty('countryId', countryId))..add(DiagnosticsProperty('brandModelId', brandModelId))..add(DiagnosticsProperty('brandId', brandId))..add(DiagnosticsProperty('categoryId', categoryId))..add(DiagnosticsProperty('name', name))..add(DiagnosticsProperty('year', year))..add(DiagnosticsProperty('slug', slug))..add(DiagnosticsProperty('description', description))..add(DiagnosticsProperty('images', images))..add(DiagnosticsProperty('location', location))..add(DiagnosticsProperty('serialNumber', serialNumber))..add(DiagnosticsProperty('condition', condition))..add(DiagnosticsProperty('steerPosition', steerPosition))..add(DiagnosticsProperty('engineCapacity', engineCapacity))..add(DiagnosticsProperty('transmission', transmission))..add(DiagnosticsProperty('color', color))..add(DiagnosticsProperty('buildType', buildType))..add(DiagnosticsProperty('numberOfPassengers', numberOfPassengers))..add(DiagnosticsProperty('features', features))..add(DiagnosticsProperty('status', status))..add(DiagnosticsProperty('price', price))..add(DiagnosticsProperty('mileage', mileage))..add(DiagnosticsProperty('warranty', warranty))..add(DiagnosticsProperty('warrantyExpiration', warrantyExpiration))..add(DiagnosticsProperty('deletedAt', deletedAt))..add(DiagnosticsProperty('createdAt', createdAt))..add(DiagnosticsProperty('updatedAt', updatedAt))..add(DiagnosticsProperty('Height', Height))..add(DiagnosticsProperty('VIN', VIN))..add(DiagnosticsProperty('brand', brand))..add(DiagnosticsProperty('category', category))..add(DiagnosticsProperty('brandModel', brandModel))..add(DiagnosticsProperty('user', user));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Item&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.countryId, countryId) || other.countryId == countryId)&&(identical(other.brandModelId, brandModelId) || other.brandModelId == brandModelId)&&(identical(other.brandId, brandId) || other.brandId == brandId)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.name, name) || other.name == name)&&(identical(other.year, year) || other.year == year)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.images, images)&&(identical(other.location, location) || other.location == location)&&(identical(other.serialNumber, serialNumber) || other.serialNumber == serialNumber)&&(identical(other.condition, condition) || other.condition == condition)&&(identical(other.steerPosition, steerPosition) || other.steerPosition == steerPosition)&&(identical(other.engineCapacity, engineCapacity) || other.engineCapacity == engineCapacity)&&(identical(other.transmission, transmission) || other.transmission == transmission)&&(identical(other.color, color) || other.color == color)&&(identical(other.buildType, buildType) || other.buildType == buildType)&&(identical(other.numberOfPassengers, numberOfPassengers) || other.numberOfPassengers == numberOfPassengers)&&const DeepCollectionEquality().equals(other.features, features)&&(identical(other.status, status) || other.status == status)&&(identical(other.price, price) || other.price == price)&&(identical(other.mileage, mileage) || other.mileage == mileage)&&(identical(other.warranty, warranty) || other.warranty == warranty)&&(identical(other.warrantyExpiration, warrantyExpiration) || other.warrantyExpiration == warrantyExpiration)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.Height, Height) || other.Height == Height)&&(identical(other.VIN, VIN) || other.VIN == VIN)&&(identical(other.brand, brand) || other.brand == brand)&&(identical(other.category, category) || other.category == category)&&(identical(other.brandModel, brandModel) || other.brandModel == brandModel)&&(identical(other.user, user) || other.user == user));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,userId,countryId,brandModelId,brandId,categoryId,name,year,slug,description,const DeepCollectionEquality().hash(images),location,serialNumber,condition,steerPosition,engineCapacity,transmission,color,buildType,numberOfPassengers,const DeepCollectionEquality().hash(features),status,price,mileage,warranty,warrantyExpiration,deletedAt,createdAt,updatedAt,Height,VIN,brand,category,brandModel,user]);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'Item(id: $id, userId: $userId, countryId: $countryId, brandModelId: $brandModelId, brandId: $brandId, categoryId: $categoryId, name: $name, year: $year, slug: $slug, description: $description, images: $images, location: $location, serialNumber: $serialNumber, condition: $condition, steerPosition: $steerPosition, engineCapacity: $engineCapacity, transmission: $transmission, color: $color, buildType: $buildType, numberOfPassengers: $numberOfPassengers, features: $features, status: $status, price: $price, mileage: $mileage, warranty: $warranty, warrantyExpiration: $warrantyExpiration, deletedAt: $deletedAt, createdAt: $createdAt, updatedAt: $updatedAt, Height: $Height, VIN: $VIN, brand: $brand, category: $category, brandModel: $brandModel, user: $user)';
}


}

/// @nodoc
abstract mixin class $ItemCopyWith<$Res>  {
  factory $ItemCopyWith(Item value, $Res Function(Item) _then) = _$ItemCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: _parseString) String id,@JsonKey(name: 'user_id', fromJson: _parseInt) int? userId,@JsonKey(name: 'country_id', fromJson: _parseInt) int? countryId,@JsonKey(name: 'brand_model_id', fromJson: _parseInt) int? brandModelId,@JsonKey(name: 'brand_id', fromJson: _parseInt) int? brandId,@JsonKey(name: 'category_id', fromJson: _parseInt) int? categoryId,@JsonKey(fromJson: _parseString) String name,@JsonKey(fromJson: _parseString) String? year,@JsonKey(fromJson: _parseString) String? slug,@JsonKey(fromJson: _parseString) String? description, List<String>? images,@JsonKey(fromJson: _parseString) String? location,@JsonKey(name: 'serial_number', fromJson: _parseString) String? serialNumber,@JsonKey(fromJson: _parseString) String? condition,@JsonKey(name: 'steer_position', fromJson: _parseString) String? steerPosition,@JsonKey(name: 'engine_capacity', fromJson: _parseString) String? engineCapacity,@JsonKey(fromJson: _parseString) String? transmission,@JsonKey(fromJson: _parseString) String? color,@JsonKey(name: 'build_type', fromJson: _parseString) String? buildType,@JsonKey(name: 'number_of_passengers', fromJson: _parseInt) int? numberOfPassengers, List<String>? features,@JsonKey(fromJson: _parseString) String? status,@JsonKey(fromJson: _parseString) String? price,@JsonKey(fromJson: _parseString) String? mileage,@JsonKey(fromJson: _parseInt) int? warranty,@JsonKey(name: 'warranty_expiration', fromJson: _parseString) String? warrantyExpiration,@JsonKey(name: 'deleted_at', fromJson: _parseString) String? deletedAt,@JsonKey(name: 'created_at', fromJson: _parseString) String? createdAt,@JsonKey(name: 'updated_at', fromJson: _parseString) String? updatedAt,@JsonKey(fromJson: _parseString) String? Height,@JsonKey(fromJson: _parseString) String? VIN, Brand? brand, Category? category,@JsonKey(name: 'brand_model') BrandModel? brandModel, User? user
});


$BrandCopyWith<$Res>? get brand;$CategoryCopyWith<$Res>? get category;$BrandModelCopyWith<$Res>? get brandModel;$UserCopyWith<$Res>? get user;

}
/// @nodoc
class _$ItemCopyWithImpl<$Res>
    implements $ItemCopyWith<$Res> {
  _$ItemCopyWithImpl(this._self, this._then);

  final Item _self;
  final $Res Function(Item) _then;

/// Create a copy of Item
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = freezed,Object? countryId = freezed,Object? brandModelId = freezed,Object? brandId = freezed,Object? categoryId = freezed,Object? name = null,Object? year = freezed,Object? slug = freezed,Object? description = freezed,Object? images = freezed,Object? location = freezed,Object? serialNumber = freezed,Object? condition = freezed,Object? steerPosition = freezed,Object? engineCapacity = freezed,Object? transmission = freezed,Object? color = freezed,Object? buildType = freezed,Object? numberOfPassengers = freezed,Object? features = freezed,Object? status = freezed,Object? price = freezed,Object? mileage = freezed,Object? warranty = freezed,Object? warrantyExpiration = freezed,Object? deletedAt = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? Height = freezed,Object? VIN = freezed,Object? brand = freezed,Object? category = freezed,Object? brandModel = freezed,Object? user = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int?,countryId: freezed == countryId ? _self.countryId : countryId // ignore: cast_nullable_to_non_nullable
as int?,brandModelId: freezed == brandModelId ? _self.brandModelId : brandModelId // ignore: cast_nullable_to_non_nullable
as int?,brandId: freezed == brandId ? _self.brandId : brandId // ignore: cast_nullable_to_non_nullable
as int?,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,year: freezed == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
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
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,Height: freezed == Height ? _self.Height : Height // ignore: cast_nullable_to_non_nullable
as String?,VIN: freezed == VIN ? _self.VIN : VIN // ignore: cast_nullable_to_non_nullable
as String?,brand: freezed == brand ? _self.brand : brand // ignore: cast_nullable_to_non_nullable
as Brand?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as Category?,brandModel: freezed == brandModel ? _self.brandModel : brandModel // ignore: cast_nullable_to_non_nullable
as BrandModel?,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User?,
  ));
}
/// Create a copy of Item
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BrandCopyWith<$Res>? get brand {
    if (_self.brand == null) {
    return null;
  }

  return $BrandCopyWith<$Res>(_self.brand!, (value) {
    return _then(_self.copyWith(brand: value));
  });
}/// Create a copy of Item
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategoryCopyWith<$Res>? get category {
    if (_self.category == null) {
    return null;
  }

  return $CategoryCopyWith<$Res>(_self.category!, (value) {
    return _then(_self.copyWith(category: value));
  });
}/// Create a copy of Item
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BrandModelCopyWith<$Res>? get brandModel {
    if (_self.brandModel == null) {
    return null;
  }

  return $BrandModelCopyWith<$Res>(_self.brandModel!, (value) {
    return _then(_self.copyWith(brandModel: value));
  });
}/// Create a copy of Item
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $UserCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// Adds pattern-matching-related methods to [Item].
extension ItemPatterns on Item {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Item value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Item() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Item value)  $default,){
final _that = this;
switch (_that) {
case _Item():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Item value)?  $default,){
final _that = this;
switch (_that) {
case _Item() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _parseString)  String id, @JsonKey(name: 'user_id', fromJson: _parseInt)  int? userId, @JsonKey(name: 'country_id', fromJson: _parseInt)  int? countryId, @JsonKey(name: 'brand_model_id', fromJson: _parseInt)  int? brandModelId, @JsonKey(name: 'brand_id', fromJson: _parseInt)  int? brandId, @JsonKey(name: 'category_id', fromJson: _parseInt)  int? categoryId, @JsonKey(fromJson: _parseString)  String name, @JsonKey(fromJson: _parseString)  String? year, @JsonKey(fromJson: _parseString)  String? slug, @JsonKey(fromJson: _parseString)  String? description,  List<String>? images, @JsonKey(fromJson: _parseString)  String? location, @JsonKey(name: 'serial_number', fromJson: _parseString)  String? serialNumber, @JsonKey(fromJson: _parseString)  String? condition, @JsonKey(name: 'steer_position', fromJson: _parseString)  String? steerPosition, @JsonKey(name: 'engine_capacity', fromJson: _parseString)  String? engineCapacity, @JsonKey(fromJson: _parseString)  String? transmission, @JsonKey(fromJson: _parseString)  String? color, @JsonKey(name: 'build_type', fromJson: _parseString)  String? buildType, @JsonKey(name: 'number_of_passengers', fromJson: _parseInt)  int? numberOfPassengers,  List<String>? features, @JsonKey(fromJson: _parseString)  String? status, @JsonKey(fromJson: _parseString)  String? price, @JsonKey(fromJson: _parseString)  String? mileage, @JsonKey(fromJson: _parseInt)  int? warranty, @JsonKey(name: 'warranty_expiration', fromJson: _parseString)  String? warrantyExpiration, @JsonKey(name: 'deleted_at', fromJson: _parseString)  String? deletedAt, @JsonKey(name: 'created_at', fromJson: _parseString)  String? createdAt, @JsonKey(name: 'updated_at', fromJson: _parseString)  String? updatedAt, @JsonKey(fromJson: _parseString)  String? Height, @JsonKey(fromJson: _parseString)  String? VIN,  Brand? brand,  Category? category, @JsonKey(name: 'brand_model')  BrandModel? brandModel,  User? user)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Item() when $default != null:
return $default(_that.id,_that.userId,_that.countryId,_that.brandModelId,_that.brandId,_that.categoryId,_that.name,_that.year,_that.slug,_that.description,_that.images,_that.location,_that.serialNumber,_that.condition,_that.steerPosition,_that.engineCapacity,_that.transmission,_that.color,_that.buildType,_that.numberOfPassengers,_that.features,_that.status,_that.price,_that.mileage,_that.warranty,_that.warrantyExpiration,_that.deletedAt,_that.createdAt,_that.updatedAt,_that.Height,_that.VIN,_that.brand,_that.category,_that.brandModel,_that.user);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _parseString)  String id, @JsonKey(name: 'user_id', fromJson: _parseInt)  int? userId, @JsonKey(name: 'country_id', fromJson: _parseInt)  int? countryId, @JsonKey(name: 'brand_model_id', fromJson: _parseInt)  int? brandModelId, @JsonKey(name: 'brand_id', fromJson: _parseInt)  int? brandId, @JsonKey(name: 'category_id', fromJson: _parseInt)  int? categoryId, @JsonKey(fromJson: _parseString)  String name, @JsonKey(fromJson: _parseString)  String? year, @JsonKey(fromJson: _parseString)  String? slug, @JsonKey(fromJson: _parseString)  String? description,  List<String>? images, @JsonKey(fromJson: _parseString)  String? location, @JsonKey(name: 'serial_number', fromJson: _parseString)  String? serialNumber, @JsonKey(fromJson: _parseString)  String? condition, @JsonKey(name: 'steer_position', fromJson: _parseString)  String? steerPosition, @JsonKey(name: 'engine_capacity', fromJson: _parseString)  String? engineCapacity, @JsonKey(fromJson: _parseString)  String? transmission, @JsonKey(fromJson: _parseString)  String? color, @JsonKey(name: 'build_type', fromJson: _parseString)  String? buildType, @JsonKey(name: 'number_of_passengers', fromJson: _parseInt)  int? numberOfPassengers,  List<String>? features, @JsonKey(fromJson: _parseString)  String? status, @JsonKey(fromJson: _parseString)  String? price, @JsonKey(fromJson: _parseString)  String? mileage, @JsonKey(fromJson: _parseInt)  int? warranty, @JsonKey(name: 'warranty_expiration', fromJson: _parseString)  String? warrantyExpiration, @JsonKey(name: 'deleted_at', fromJson: _parseString)  String? deletedAt, @JsonKey(name: 'created_at', fromJson: _parseString)  String? createdAt, @JsonKey(name: 'updated_at', fromJson: _parseString)  String? updatedAt, @JsonKey(fromJson: _parseString)  String? Height, @JsonKey(fromJson: _parseString)  String? VIN,  Brand? brand,  Category? category, @JsonKey(name: 'brand_model')  BrandModel? brandModel,  User? user)  $default,) {final _that = this;
switch (_that) {
case _Item():
return $default(_that.id,_that.userId,_that.countryId,_that.brandModelId,_that.brandId,_that.categoryId,_that.name,_that.year,_that.slug,_that.description,_that.images,_that.location,_that.serialNumber,_that.condition,_that.steerPosition,_that.engineCapacity,_that.transmission,_that.color,_that.buildType,_that.numberOfPassengers,_that.features,_that.status,_that.price,_that.mileage,_that.warranty,_that.warrantyExpiration,_that.deletedAt,_that.createdAt,_that.updatedAt,_that.Height,_that.VIN,_that.brand,_that.category,_that.brandModel,_that.user);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: _parseString)  String id, @JsonKey(name: 'user_id', fromJson: _parseInt)  int? userId, @JsonKey(name: 'country_id', fromJson: _parseInt)  int? countryId, @JsonKey(name: 'brand_model_id', fromJson: _parseInt)  int? brandModelId, @JsonKey(name: 'brand_id', fromJson: _parseInt)  int? brandId, @JsonKey(name: 'category_id', fromJson: _parseInt)  int? categoryId, @JsonKey(fromJson: _parseString)  String name, @JsonKey(fromJson: _parseString)  String? year, @JsonKey(fromJson: _parseString)  String? slug, @JsonKey(fromJson: _parseString)  String? description,  List<String>? images, @JsonKey(fromJson: _parseString)  String? location, @JsonKey(name: 'serial_number', fromJson: _parseString)  String? serialNumber, @JsonKey(fromJson: _parseString)  String? condition, @JsonKey(name: 'steer_position', fromJson: _parseString)  String? steerPosition, @JsonKey(name: 'engine_capacity', fromJson: _parseString)  String? engineCapacity, @JsonKey(fromJson: _parseString)  String? transmission, @JsonKey(fromJson: _parseString)  String? color, @JsonKey(name: 'build_type', fromJson: _parseString)  String? buildType, @JsonKey(name: 'number_of_passengers', fromJson: _parseInt)  int? numberOfPassengers,  List<String>? features, @JsonKey(fromJson: _parseString)  String? status, @JsonKey(fromJson: _parseString)  String? price, @JsonKey(fromJson: _parseString)  String? mileage, @JsonKey(fromJson: _parseInt)  int? warranty, @JsonKey(name: 'warranty_expiration', fromJson: _parseString)  String? warrantyExpiration, @JsonKey(name: 'deleted_at', fromJson: _parseString)  String? deletedAt, @JsonKey(name: 'created_at', fromJson: _parseString)  String? createdAt, @JsonKey(name: 'updated_at', fromJson: _parseString)  String? updatedAt, @JsonKey(fromJson: _parseString)  String? Height, @JsonKey(fromJson: _parseString)  String? VIN,  Brand? brand,  Category? category, @JsonKey(name: 'brand_model')  BrandModel? brandModel,  User? user)?  $default,) {final _that = this;
switch (_that) {
case _Item() when $default != null:
return $default(_that.id,_that.userId,_that.countryId,_that.brandModelId,_that.brandId,_that.categoryId,_that.name,_that.year,_that.slug,_that.description,_that.images,_that.location,_that.serialNumber,_that.condition,_that.steerPosition,_that.engineCapacity,_that.transmission,_that.color,_that.buildType,_that.numberOfPassengers,_that.features,_that.status,_that.price,_that.mileage,_that.warranty,_that.warrantyExpiration,_that.deletedAt,_that.createdAt,_that.updatedAt,_that.Height,_that.VIN,_that.brand,_that.category,_that.brandModel,_that.user);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Item with DiagnosticableTreeMixin implements Item {
  const _Item({@JsonKey(fromJson: _parseString) required this.id, @JsonKey(name: 'user_id', fromJson: _parseInt) this.userId, @JsonKey(name: 'country_id', fromJson: _parseInt) this.countryId, @JsonKey(name: 'brand_model_id', fromJson: _parseInt) this.brandModelId, @JsonKey(name: 'brand_id', fromJson: _parseInt) this.brandId, @JsonKey(name: 'category_id', fromJson: _parseInt) this.categoryId, @JsonKey(fromJson: _parseString) required this.name, @JsonKey(fromJson: _parseString) this.year, @JsonKey(fromJson: _parseString) this.slug, @JsonKey(fromJson: _parseString) this.description, final  List<String>? images, @JsonKey(fromJson: _parseString) this.location, @JsonKey(name: 'serial_number', fromJson: _parseString) this.serialNumber, @JsonKey(fromJson: _parseString) this.condition, @JsonKey(name: 'steer_position', fromJson: _parseString) this.steerPosition, @JsonKey(name: 'engine_capacity', fromJson: _parseString) this.engineCapacity, @JsonKey(fromJson: _parseString) this.transmission, @JsonKey(fromJson: _parseString) this.color, @JsonKey(name: 'build_type', fromJson: _parseString) this.buildType, @JsonKey(name: 'number_of_passengers', fromJson: _parseInt) this.numberOfPassengers, final  List<String>? features, @JsonKey(fromJson: _parseString) this.status, @JsonKey(fromJson: _parseString) this.price, @JsonKey(fromJson: _parseString) this.mileage, @JsonKey(fromJson: _parseInt) this.warranty, @JsonKey(name: 'warranty_expiration', fromJson: _parseString) this.warrantyExpiration, @JsonKey(name: 'deleted_at', fromJson: _parseString) this.deletedAt, @JsonKey(name: 'created_at', fromJson: _parseString) this.createdAt, @JsonKey(name: 'updated_at', fromJson: _parseString) this.updatedAt, @JsonKey(fromJson: _parseString) this.Height, @JsonKey(fromJson: _parseString) this.VIN, this.brand, this.category, @JsonKey(name: 'brand_model') this.brandModel, this.user}): _images = images,_features = features;
  factory _Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

@override@JsonKey(fromJson: _parseString) final  String id;
@override@JsonKey(name: 'user_id', fromJson: _parseInt) final  int? userId;
@override@JsonKey(name: 'country_id', fromJson: _parseInt) final  int? countryId;
@override@JsonKey(name: 'brand_model_id', fromJson: _parseInt) final  int? brandModelId;
@override@JsonKey(name: 'brand_id', fromJson: _parseInt) final  int? brandId;
@override@JsonKey(name: 'category_id', fromJson: _parseInt) final  int? categoryId;
@override@JsonKey(fromJson: _parseString) final  String name;
@override@JsonKey(fromJson: _parseString) final  String? year;
// Added converter
@override@JsonKey(fromJson: _parseString) final  String? slug;
@override@JsonKey(fromJson: _parseString) final  String? description;
 final  List<String>? _images;
@override List<String>? get images {
  final value = _images;
  if (value == null) return null;
  if (_images is EqualUnmodifiableListView) return _images;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey(fromJson: _parseString) final  String? location;
@override@JsonKey(name: 'serial_number', fromJson: _parseString) final  String? serialNumber;
// Added converter
@override@JsonKey(fromJson: _parseString) final  String? condition;
// Added converter
@override@JsonKey(name: 'steer_position', fromJson: _parseString) final  String? steerPosition;
@override@JsonKey(name: 'engine_capacity', fromJson: _parseString) final  String? engineCapacity;
@override@JsonKey(fromJson: _parseString) final  String? transmission;
@override@JsonKey(fromJson: _parseString) final  String? color;
@override@JsonKey(name: 'build_type', fromJson: _parseString) final  String? buildType;
@override@JsonKey(name: 'number_of_passengers', fromJson: _parseInt) final  int? numberOfPassengers;
 final  List<String>? _features;
@override List<String>? get features {
  final value = _features;
  if (value == null) return null;
  if (_features is EqualUnmodifiableListView) return _features;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey(fromJson: _parseString) final  String? status;
// Added converter
@override@JsonKey(fromJson: _parseString) final  String? price;
@override@JsonKey(fromJson: _parseString) final  String? mileage;
@override@JsonKey(fromJson: _parseInt) final  int? warranty;
@override@JsonKey(name: 'warranty_expiration', fromJson: _parseString) final  String? warrantyExpiration;
@override@JsonKey(name: 'deleted_at', fromJson: _parseString) final  String? deletedAt;
@override@JsonKey(name: 'created_at', fromJson: _parseString) final  String? createdAt;
@override@JsonKey(name: 'updated_at', fromJson: _parseString) final  String? updatedAt;
// New fields from response
@override@JsonKey(fromJson: _parseString) final  String? Height;
@override@JsonKey(fromJson: _parseString) final  String? VIN;
@override final  Brand? brand;
@override final  Category? category;
@override@JsonKey(name: 'brand_model') final  BrandModel? brandModel;
@override final  User? user;

/// Create a copy of Item
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ItemCopyWith<_Item> get copyWith => __$ItemCopyWithImpl<_Item>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ItemToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'Item'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('userId', userId))..add(DiagnosticsProperty('countryId', countryId))..add(DiagnosticsProperty('brandModelId', brandModelId))..add(DiagnosticsProperty('brandId', brandId))..add(DiagnosticsProperty('categoryId', categoryId))..add(DiagnosticsProperty('name', name))..add(DiagnosticsProperty('year', year))..add(DiagnosticsProperty('slug', slug))..add(DiagnosticsProperty('description', description))..add(DiagnosticsProperty('images', images))..add(DiagnosticsProperty('location', location))..add(DiagnosticsProperty('serialNumber', serialNumber))..add(DiagnosticsProperty('condition', condition))..add(DiagnosticsProperty('steerPosition', steerPosition))..add(DiagnosticsProperty('engineCapacity', engineCapacity))..add(DiagnosticsProperty('transmission', transmission))..add(DiagnosticsProperty('color', color))..add(DiagnosticsProperty('buildType', buildType))..add(DiagnosticsProperty('numberOfPassengers', numberOfPassengers))..add(DiagnosticsProperty('features', features))..add(DiagnosticsProperty('status', status))..add(DiagnosticsProperty('price', price))..add(DiagnosticsProperty('mileage', mileage))..add(DiagnosticsProperty('warranty', warranty))..add(DiagnosticsProperty('warrantyExpiration', warrantyExpiration))..add(DiagnosticsProperty('deletedAt', deletedAt))..add(DiagnosticsProperty('createdAt', createdAt))..add(DiagnosticsProperty('updatedAt', updatedAt))..add(DiagnosticsProperty('Height', Height))..add(DiagnosticsProperty('VIN', VIN))..add(DiagnosticsProperty('brand', brand))..add(DiagnosticsProperty('category', category))..add(DiagnosticsProperty('brandModel', brandModel))..add(DiagnosticsProperty('user', user));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Item&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.countryId, countryId) || other.countryId == countryId)&&(identical(other.brandModelId, brandModelId) || other.brandModelId == brandModelId)&&(identical(other.brandId, brandId) || other.brandId == brandId)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.name, name) || other.name == name)&&(identical(other.year, year) || other.year == year)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._images, _images)&&(identical(other.location, location) || other.location == location)&&(identical(other.serialNumber, serialNumber) || other.serialNumber == serialNumber)&&(identical(other.condition, condition) || other.condition == condition)&&(identical(other.steerPosition, steerPosition) || other.steerPosition == steerPosition)&&(identical(other.engineCapacity, engineCapacity) || other.engineCapacity == engineCapacity)&&(identical(other.transmission, transmission) || other.transmission == transmission)&&(identical(other.color, color) || other.color == color)&&(identical(other.buildType, buildType) || other.buildType == buildType)&&(identical(other.numberOfPassengers, numberOfPassengers) || other.numberOfPassengers == numberOfPassengers)&&const DeepCollectionEquality().equals(other._features, _features)&&(identical(other.status, status) || other.status == status)&&(identical(other.price, price) || other.price == price)&&(identical(other.mileage, mileage) || other.mileage == mileage)&&(identical(other.warranty, warranty) || other.warranty == warranty)&&(identical(other.warrantyExpiration, warrantyExpiration) || other.warrantyExpiration == warrantyExpiration)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.Height, Height) || other.Height == Height)&&(identical(other.VIN, VIN) || other.VIN == VIN)&&(identical(other.brand, brand) || other.brand == brand)&&(identical(other.category, category) || other.category == category)&&(identical(other.brandModel, brandModel) || other.brandModel == brandModel)&&(identical(other.user, user) || other.user == user));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,userId,countryId,brandModelId,brandId,categoryId,name,year,slug,description,const DeepCollectionEquality().hash(_images),location,serialNumber,condition,steerPosition,engineCapacity,transmission,color,buildType,numberOfPassengers,const DeepCollectionEquality().hash(_features),status,price,mileage,warranty,warrantyExpiration,deletedAt,createdAt,updatedAt,Height,VIN,brand,category,brandModel,user]);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'Item(id: $id, userId: $userId, countryId: $countryId, brandModelId: $brandModelId, brandId: $brandId, categoryId: $categoryId, name: $name, year: $year, slug: $slug, description: $description, images: $images, location: $location, serialNumber: $serialNumber, condition: $condition, steerPosition: $steerPosition, engineCapacity: $engineCapacity, transmission: $transmission, color: $color, buildType: $buildType, numberOfPassengers: $numberOfPassengers, features: $features, status: $status, price: $price, mileage: $mileage, warranty: $warranty, warrantyExpiration: $warrantyExpiration, deletedAt: $deletedAt, createdAt: $createdAt, updatedAt: $updatedAt, Height: $Height, VIN: $VIN, brand: $brand, category: $category, brandModel: $brandModel, user: $user)';
}


}

/// @nodoc
abstract mixin class _$ItemCopyWith<$Res> implements $ItemCopyWith<$Res> {
  factory _$ItemCopyWith(_Item value, $Res Function(_Item) _then) = __$ItemCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: _parseString) String id,@JsonKey(name: 'user_id', fromJson: _parseInt) int? userId,@JsonKey(name: 'country_id', fromJson: _parseInt) int? countryId,@JsonKey(name: 'brand_model_id', fromJson: _parseInt) int? brandModelId,@JsonKey(name: 'brand_id', fromJson: _parseInt) int? brandId,@JsonKey(name: 'category_id', fromJson: _parseInt) int? categoryId,@JsonKey(fromJson: _parseString) String name,@JsonKey(fromJson: _parseString) String? year,@JsonKey(fromJson: _parseString) String? slug,@JsonKey(fromJson: _parseString) String? description, List<String>? images,@JsonKey(fromJson: _parseString) String? location,@JsonKey(name: 'serial_number', fromJson: _parseString) String? serialNumber,@JsonKey(fromJson: _parseString) String? condition,@JsonKey(name: 'steer_position', fromJson: _parseString) String? steerPosition,@JsonKey(name: 'engine_capacity', fromJson: _parseString) String? engineCapacity,@JsonKey(fromJson: _parseString) String? transmission,@JsonKey(fromJson: _parseString) String? color,@JsonKey(name: 'build_type', fromJson: _parseString) String? buildType,@JsonKey(name: 'number_of_passengers', fromJson: _parseInt) int? numberOfPassengers, List<String>? features,@JsonKey(fromJson: _parseString) String? status,@JsonKey(fromJson: _parseString) String? price,@JsonKey(fromJson: _parseString) String? mileage,@JsonKey(fromJson: _parseInt) int? warranty,@JsonKey(name: 'warranty_expiration', fromJson: _parseString) String? warrantyExpiration,@JsonKey(name: 'deleted_at', fromJson: _parseString) String? deletedAt,@JsonKey(name: 'created_at', fromJson: _parseString) String? createdAt,@JsonKey(name: 'updated_at', fromJson: _parseString) String? updatedAt,@JsonKey(fromJson: _parseString) String? Height,@JsonKey(fromJson: _parseString) String? VIN, Brand? brand, Category? category,@JsonKey(name: 'brand_model') BrandModel? brandModel, User? user
});


@override $BrandCopyWith<$Res>? get brand;@override $CategoryCopyWith<$Res>? get category;@override $BrandModelCopyWith<$Res>? get brandModel;@override $UserCopyWith<$Res>? get user;

}
/// @nodoc
class __$ItemCopyWithImpl<$Res>
    implements _$ItemCopyWith<$Res> {
  __$ItemCopyWithImpl(this._self, this._then);

  final _Item _self;
  final $Res Function(_Item) _then;

/// Create a copy of Item
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = freezed,Object? countryId = freezed,Object? brandModelId = freezed,Object? brandId = freezed,Object? categoryId = freezed,Object? name = null,Object? year = freezed,Object? slug = freezed,Object? description = freezed,Object? images = freezed,Object? location = freezed,Object? serialNumber = freezed,Object? condition = freezed,Object? steerPosition = freezed,Object? engineCapacity = freezed,Object? transmission = freezed,Object? color = freezed,Object? buildType = freezed,Object? numberOfPassengers = freezed,Object? features = freezed,Object? status = freezed,Object? price = freezed,Object? mileage = freezed,Object? warranty = freezed,Object? warrantyExpiration = freezed,Object? deletedAt = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? Height = freezed,Object? VIN = freezed,Object? brand = freezed,Object? category = freezed,Object? brandModel = freezed,Object? user = freezed,}) {
  return _then(_Item(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int?,countryId: freezed == countryId ? _self.countryId : countryId // ignore: cast_nullable_to_non_nullable
as int?,brandModelId: freezed == brandModelId ? _self.brandModelId : brandModelId // ignore: cast_nullable_to_non_nullable
as int?,brandId: freezed == brandId ? _self.brandId : brandId // ignore: cast_nullable_to_non_nullable
as int?,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,year: freezed == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
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
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,Height: freezed == Height ? _self.Height : Height // ignore: cast_nullable_to_non_nullable
as String?,VIN: freezed == VIN ? _self.VIN : VIN // ignore: cast_nullable_to_non_nullable
as String?,brand: freezed == brand ? _self.brand : brand // ignore: cast_nullable_to_non_nullable
as Brand?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as Category?,brandModel: freezed == brandModel ? _self.brandModel : brandModel // ignore: cast_nullable_to_non_nullable
as BrandModel?,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User?,
  ));
}

/// Create a copy of Item
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BrandCopyWith<$Res>? get brand {
    if (_self.brand == null) {
    return null;
  }

  return $BrandCopyWith<$Res>(_self.brand!, (value) {
    return _then(_self.copyWith(brand: value));
  });
}/// Create a copy of Item
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategoryCopyWith<$Res>? get category {
    if (_self.category == null) {
    return null;
  }

  return $CategoryCopyWith<$Res>(_self.category!, (value) {
    return _then(_self.copyWith(category: value));
  });
}/// Create a copy of Item
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BrandModelCopyWith<$Res>? get brandModel {
    if (_self.brandModel == null) {
    return null;
  }

  return $BrandModelCopyWith<$Res>(_self.brandModel!, (value) {
    return _then(_self.copyWith(brandModel: value));
  });
}/// Create a copy of Item
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $UserCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// @nodoc
mixin _$User implements DiagnosticableTreeMixin {

@JsonKey(fromJson: _parseString) String get id;@JsonKey(fromJson: _parseString) String get name;@JsonKey(fromJson: _parseString) String get email;@JsonKey(fromJson: _parseString) String? get phone;@JsonKey(name: 'email_verified_at', fromJson: _parseString) String? get emailVerifiedAt;@JsonKey(name: 'paid_seller', fromJson: _parseInt) int? get paidSeller;@JsonKey(name: 'deleted_at', fromJson: _parseString) String? get deletedAt;@JsonKey(name: 'created_at', fromJson: _parseString) String? get createdAt;@JsonKey(name: 'updated_at', fromJson: _parseString) String? get updatedAt;@JsonKey(name: 'country_id', fromJson: _parseInt) int? get countryId;@JsonKey(name: 'state_id', fromJson: _parseInt) int? get stateId;@JsonKey(name: 'profile_photo', fromJson: _parseString) String? get profilePhoto;@JsonKey(name: 'uploads_left', fromJson: _parseInt) int? get uploadsLeft;@JsonKey(name: 'active_status', fromJson: _parseInt) int? get activeStatus;@JsonKey(fromJson: _parseString) String? get avatar;@JsonKey(name: 'dark_mode', fromJson: _parseInt) int? get darkMode;@JsonKey(name: 'messenger_color', fromJson: _parseString) String? get messengerColor;
/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserCopyWith<User> get copyWith => _$UserCopyWithImpl<User>(this as User, _$identity);

  /// Serializes this User to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'User'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('name', name))..add(DiagnosticsProperty('email', email))..add(DiagnosticsProperty('phone', phone))..add(DiagnosticsProperty('emailVerifiedAt', emailVerifiedAt))..add(DiagnosticsProperty('paidSeller', paidSeller))..add(DiagnosticsProperty('deletedAt', deletedAt))..add(DiagnosticsProperty('createdAt', createdAt))..add(DiagnosticsProperty('updatedAt', updatedAt))..add(DiagnosticsProperty('countryId', countryId))..add(DiagnosticsProperty('stateId', stateId))..add(DiagnosticsProperty('profilePhoto', profilePhoto))..add(DiagnosticsProperty('uploadsLeft', uploadsLeft))..add(DiagnosticsProperty('activeStatus', activeStatus))..add(DiagnosticsProperty('avatar', avatar))..add(DiagnosticsProperty('darkMode', darkMode))..add(DiagnosticsProperty('messengerColor', messengerColor));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is User&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.emailVerifiedAt, emailVerifiedAt) || other.emailVerifiedAt == emailVerifiedAt)&&(identical(other.paidSeller, paidSeller) || other.paidSeller == paidSeller)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.countryId, countryId) || other.countryId == countryId)&&(identical(other.stateId, stateId) || other.stateId == stateId)&&(identical(other.profilePhoto, profilePhoto) || other.profilePhoto == profilePhoto)&&(identical(other.uploadsLeft, uploadsLeft) || other.uploadsLeft == uploadsLeft)&&(identical(other.activeStatus, activeStatus) || other.activeStatus == activeStatus)&&(identical(other.avatar, avatar) || other.avatar == avatar)&&(identical(other.darkMode, darkMode) || other.darkMode == darkMode)&&(identical(other.messengerColor, messengerColor) || other.messengerColor == messengerColor));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,email,phone,emailVerifiedAt,paidSeller,deletedAt,createdAt,updatedAt,countryId,stateId,profilePhoto,uploadsLeft,activeStatus,avatar,darkMode,messengerColor);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'User(id: $id, name: $name, email: $email, phone: $phone, emailVerifiedAt: $emailVerifiedAt, paidSeller: $paidSeller, deletedAt: $deletedAt, createdAt: $createdAt, updatedAt: $updatedAt, countryId: $countryId, stateId: $stateId, profilePhoto: $profilePhoto, uploadsLeft: $uploadsLeft, activeStatus: $activeStatus, avatar: $avatar, darkMode: $darkMode, messengerColor: $messengerColor)';
}


}

/// @nodoc
abstract mixin class $UserCopyWith<$Res>  {
  factory $UserCopyWith(User value, $Res Function(User) _then) = _$UserCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: _parseString) String id,@JsonKey(fromJson: _parseString) String name,@JsonKey(fromJson: _parseString) String email,@JsonKey(fromJson: _parseString) String? phone,@JsonKey(name: 'email_verified_at', fromJson: _parseString) String? emailVerifiedAt,@JsonKey(name: 'paid_seller', fromJson: _parseInt) int? paidSeller,@JsonKey(name: 'deleted_at', fromJson: _parseString) String? deletedAt,@JsonKey(name: 'created_at', fromJson: _parseString) String? createdAt,@JsonKey(name: 'updated_at', fromJson: _parseString) String? updatedAt,@JsonKey(name: 'country_id', fromJson: _parseInt) int? countryId,@JsonKey(name: 'state_id', fromJson: _parseInt) int? stateId,@JsonKey(name: 'profile_photo', fromJson: _parseString) String? profilePhoto,@JsonKey(name: 'uploads_left', fromJson: _parseInt) int? uploadsLeft,@JsonKey(name: 'active_status', fromJson: _parseInt) int? activeStatus,@JsonKey(fromJson: _parseString) String? avatar,@JsonKey(name: 'dark_mode', fromJson: _parseInt) int? darkMode,@JsonKey(name: 'messenger_color', fromJson: _parseString) String? messengerColor
});




}
/// @nodoc
class _$UserCopyWithImpl<$Res>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._self, this._then);

  final User _self;
  final $Res Function(User) _then;

/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? email = null,Object? phone = freezed,Object? emailVerifiedAt = freezed,Object? paidSeller = freezed,Object? deletedAt = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? countryId = freezed,Object? stateId = freezed,Object? profilePhoto = freezed,Object? uploadsLeft = freezed,Object? activeStatus = freezed,Object? avatar = freezed,Object? darkMode = freezed,Object? messengerColor = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,emailVerifiedAt: freezed == emailVerifiedAt ? _self.emailVerifiedAt : emailVerifiedAt // ignore: cast_nullable_to_non_nullable
as String?,paidSeller: freezed == paidSeller ? _self.paidSeller : paidSeller // ignore: cast_nullable_to_non_nullable
as int?,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,countryId: freezed == countryId ? _self.countryId : countryId // ignore: cast_nullable_to_non_nullable
as int?,stateId: freezed == stateId ? _self.stateId : stateId // ignore: cast_nullable_to_non_nullable
as int?,profilePhoto: freezed == profilePhoto ? _self.profilePhoto : profilePhoto // ignore: cast_nullable_to_non_nullable
as String?,uploadsLeft: freezed == uploadsLeft ? _self.uploadsLeft : uploadsLeft // ignore: cast_nullable_to_non_nullable
as int?,activeStatus: freezed == activeStatus ? _self.activeStatus : activeStatus // ignore: cast_nullable_to_non_nullable
as int?,avatar: freezed == avatar ? _self.avatar : avatar // ignore: cast_nullable_to_non_nullable
as String?,darkMode: freezed == darkMode ? _self.darkMode : darkMode // ignore: cast_nullable_to_non_nullable
as int?,messengerColor: freezed == messengerColor ? _self.messengerColor : messengerColor // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [User].
extension UserPatterns on User {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _User value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _User() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _User value)  $default,){
final _that = this;
switch (_that) {
case _User():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _User value)?  $default,){
final _that = this;
switch (_that) {
case _User() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _parseString)  String id, @JsonKey(fromJson: _parseString)  String name, @JsonKey(fromJson: _parseString)  String email, @JsonKey(fromJson: _parseString)  String? phone, @JsonKey(name: 'email_verified_at', fromJson: _parseString)  String? emailVerifiedAt, @JsonKey(name: 'paid_seller', fromJson: _parseInt)  int? paidSeller, @JsonKey(name: 'deleted_at', fromJson: _parseString)  String? deletedAt, @JsonKey(name: 'created_at', fromJson: _parseString)  String? createdAt, @JsonKey(name: 'updated_at', fromJson: _parseString)  String? updatedAt, @JsonKey(name: 'country_id', fromJson: _parseInt)  int? countryId, @JsonKey(name: 'state_id', fromJson: _parseInt)  int? stateId, @JsonKey(name: 'profile_photo', fromJson: _parseString)  String? profilePhoto, @JsonKey(name: 'uploads_left', fromJson: _parseInt)  int? uploadsLeft, @JsonKey(name: 'active_status', fromJson: _parseInt)  int? activeStatus, @JsonKey(fromJson: _parseString)  String? avatar, @JsonKey(name: 'dark_mode', fromJson: _parseInt)  int? darkMode, @JsonKey(name: 'messenger_color', fromJson: _parseString)  String? messengerColor)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _User() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _parseString)  String id, @JsonKey(fromJson: _parseString)  String name, @JsonKey(fromJson: _parseString)  String email, @JsonKey(fromJson: _parseString)  String? phone, @JsonKey(name: 'email_verified_at', fromJson: _parseString)  String? emailVerifiedAt, @JsonKey(name: 'paid_seller', fromJson: _parseInt)  int? paidSeller, @JsonKey(name: 'deleted_at', fromJson: _parseString)  String? deletedAt, @JsonKey(name: 'created_at', fromJson: _parseString)  String? createdAt, @JsonKey(name: 'updated_at', fromJson: _parseString)  String? updatedAt, @JsonKey(name: 'country_id', fromJson: _parseInt)  int? countryId, @JsonKey(name: 'state_id', fromJson: _parseInt)  int? stateId, @JsonKey(name: 'profile_photo', fromJson: _parseString)  String? profilePhoto, @JsonKey(name: 'uploads_left', fromJson: _parseInt)  int? uploadsLeft, @JsonKey(name: 'active_status', fromJson: _parseInt)  int? activeStatus, @JsonKey(fromJson: _parseString)  String? avatar, @JsonKey(name: 'dark_mode', fromJson: _parseInt)  int? darkMode, @JsonKey(name: 'messenger_color', fromJson: _parseString)  String? messengerColor)  $default,) {final _that = this;
switch (_that) {
case _User():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: _parseString)  String id, @JsonKey(fromJson: _parseString)  String name, @JsonKey(fromJson: _parseString)  String email, @JsonKey(fromJson: _parseString)  String? phone, @JsonKey(name: 'email_verified_at', fromJson: _parseString)  String? emailVerifiedAt, @JsonKey(name: 'paid_seller', fromJson: _parseInt)  int? paidSeller, @JsonKey(name: 'deleted_at', fromJson: _parseString)  String? deletedAt, @JsonKey(name: 'created_at', fromJson: _parseString)  String? createdAt, @JsonKey(name: 'updated_at', fromJson: _parseString)  String? updatedAt, @JsonKey(name: 'country_id', fromJson: _parseInt)  int? countryId, @JsonKey(name: 'state_id', fromJson: _parseInt)  int? stateId, @JsonKey(name: 'profile_photo', fromJson: _parseString)  String? profilePhoto, @JsonKey(name: 'uploads_left', fromJson: _parseInt)  int? uploadsLeft, @JsonKey(name: 'active_status', fromJson: _parseInt)  int? activeStatus, @JsonKey(fromJson: _parseString)  String? avatar, @JsonKey(name: 'dark_mode', fromJson: _parseInt)  int? darkMode, @JsonKey(name: 'messenger_color', fromJson: _parseString)  String? messengerColor)?  $default,) {final _that = this;
switch (_that) {
case _User() when $default != null:
return $default(_that.id,_that.name,_that.email,_that.phone,_that.emailVerifiedAt,_that.paidSeller,_that.deletedAt,_that.createdAt,_that.updatedAt,_that.countryId,_that.stateId,_that.profilePhoto,_that.uploadsLeft,_that.activeStatus,_that.avatar,_that.darkMode,_that.messengerColor);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _User with DiagnosticableTreeMixin implements User {
  const _User({@JsonKey(fromJson: _parseString) required this.id, @JsonKey(fromJson: _parseString) required this.name, @JsonKey(fromJson: _parseString) required this.email, @JsonKey(fromJson: _parseString) this.phone, @JsonKey(name: 'email_verified_at', fromJson: _parseString) this.emailVerifiedAt, @JsonKey(name: 'paid_seller', fromJson: _parseInt) this.paidSeller, @JsonKey(name: 'deleted_at', fromJson: _parseString) this.deletedAt, @JsonKey(name: 'created_at', fromJson: _parseString) this.createdAt, @JsonKey(name: 'updated_at', fromJson: _parseString) this.updatedAt, @JsonKey(name: 'country_id', fromJson: _parseInt) this.countryId, @JsonKey(name: 'state_id', fromJson: _parseInt) this.stateId, @JsonKey(name: 'profile_photo', fromJson: _parseString) this.profilePhoto, @JsonKey(name: 'uploads_left', fromJson: _parseInt) this.uploadsLeft, @JsonKey(name: 'active_status', fromJson: _parseInt) this.activeStatus, @JsonKey(fromJson: _parseString) this.avatar, @JsonKey(name: 'dark_mode', fromJson: _parseInt) this.darkMode, @JsonKey(name: 'messenger_color', fromJson: _parseString) this.messengerColor});
  factory _User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

@override@JsonKey(fromJson: _parseString) final  String id;
@override@JsonKey(fromJson: _parseString) final  String name;
@override@JsonKey(fromJson: _parseString) final  String email;
@override@JsonKey(fromJson: _parseString) final  String? phone;
@override@JsonKey(name: 'email_verified_at', fromJson: _parseString) final  String? emailVerifiedAt;
@override@JsonKey(name: 'paid_seller', fromJson: _parseInt) final  int? paidSeller;
@override@JsonKey(name: 'deleted_at', fromJson: _parseString) final  String? deletedAt;
@override@JsonKey(name: 'created_at', fromJson: _parseString) final  String? createdAt;
@override@JsonKey(name: 'updated_at', fromJson: _parseString) final  String? updatedAt;
@override@JsonKey(name: 'country_id', fromJson: _parseInt) final  int? countryId;
@override@JsonKey(name: 'state_id', fromJson: _parseInt) final  int? stateId;
@override@JsonKey(name: 'profile_photo', fromJson: _parseString) final  String? profilePhoto;
@override@JsonKey(name: 'uploads_left', fromJson: _parseInt) final  int? uploadsLeft;
@override@JsonKey(name: 'active_status', fromJson: _parseInt) final  int? activeStatus;
@override@JsonKey(fromJson: _parseString) final  String? avatar;
@override@JsonKey(name: 'dark_mode', fromJson: _parseInt) final  int? darkMode;
@override@JsonKey(name: 'messenger_color', fromJson: _parseString) final  String? messengerColor;

/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserCopyWith<_User> get copyWith => __$UserCopyWithImpl<_User>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'User'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('name', name))..add(DiagnosticsProperty('email', email))..add(DiagnosticsProperty('phone', phone))..add(DiagnosticsProperty('emailVerifiedAt', emailVerifiedAt))..add(DiagnosticsProperty('paidSeller', paidSeller))..add(DiagnosticsProperty('deletedAt', deletedAt))..add(DiagnosticsProperty('createdAt', createdAt))..add(DiagnosticsProperty('updatedAt', updatedAt))..add(DiagnosticsProperty('countryId', countryId))..add(DiagnosticsProperty('stateId', stateId))..add(DiagnosticsProperty('profilePhoto', profilePhoto))..add(DiagnosticsProperty('uploadsLeft', uploadsLeft))..add(DiagnosticsProperty('activeStatus', activeStatus))..add(DiagnosticsProperty('avatar', avatar))..add(DiagnosticsProperty('darkMode', darkMode))..add(DiagnosticsProperty('messengerColor', messengerColor));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _User&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.emailVerifiedAt, emailVerifiedAt) || other.emailVerifiedAt == emailVerifiedAt)&&(identical(other.paidSeller, paidSeller) || other.paidSeller == paidSeller)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.countryId, countryId) || other.countryId == countryId)&&(identical(other.stateId, stateId) || other.stateId == stateId)&&(identical(other.profilePhoto, profilePhoto) || other.profilePhoto == profilePhoto)&&(identical(other.uploadsLeft, uploadsLeft) || other.uploadsLeft == uploadsLeft)&&(identical(other.activeStatus, activeStatus) || other.activeStatus == activeStatus)&&(identical(other.avatar, avatar) || other.avatar == avatar)&&(identical(other.darkMode, darkMode) || other.darkMode == darkMode)&&(identical(other.messengerColor, messengerColor) || other.messengerColor == messengerColor));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,email,phone,emailVerifiedAt,paidSeller,deletedAt,createdAt,updatedAt,countryId,stateId,profilePhoto,uploadsLeft,activeStatus,avatar,darkMode,messengerColor);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'User(id: $id, name: $name, email: $email, phone: $phone, emailVerifiedAt: $emailVerifiedAt, paidSeller: $paidSeller, deletedAt: $deletedAt, createdAt: $createdAt, updatedAt: $updatedAt, countryId: $countryId, stateId: $stateId, profilePhoto: $profilePhoto, uploadsLeft: $uploadsLeft, activeStatus: $activeStatus, avatar: $avatar, darkMode: $darkMode, messengerColor: $messengerColor)';
}


}

/// @nodoc
abstract mixin class _$UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$UserCopyWith(_User value, $Res Function(_User) _then) = __$UserCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: _parseString) String id,@JsonKey(fromJson: _parseString) String name,@JsonKey(fromJson: _parseString) String email,@JsonKey(fromJson: _parseString) String? phone,@JsonKey(name: 'email_verified_at', fromJson: _parseString) String? emailVerifiedAt,@JsonKey(name: 'paid_seller', fromJson: _parseInt) int? paidSeller,@JsonKey(name: 'deleted_at', fromJson: _parseString) String? deletedAt,@JsonKey(name: 'created_at', fromJson: _parseString) String? createdAt,@JsonKey(name: 'updated_at', fromJson: _parseString) String? updatedAt,@JsonKey(name: 'country_id', fromJson: _parseInt) int? countryId,@JsonKey(name: 'state_id', fromJson: _parseInt) int? stateId,@JsonKey(name: 'profile_photo', fromJson: _parseString) String? profilePhoto,@JsonKey(name: 'uploads_left', fromJson: _parseInt) int? uploadsLeft,@JsonKey(name: 'active_status', fromJson: _parseInt) int? activeStatus,@JsonKey(fromJson: _parseString) String? avatar,@JsonKey(name: 'dark_mode', fromJson: _parseInt) int? darkMode,@JsonKey(name: 'messenger_color', fromJson: _parseString) String? messengerColor
});




}
/// @nodoc
class __$UserCopyWithImpl<$Res>
    implements _$UserCopyWith<$Res> {
  __$UserCopyWithImpl(this._self, this._then);

  final _User _self;
  final $Res Function(_User) _then;

/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? email = null,Object? phone = freezed,Object? emailVerifiedAt = freezed,Object? paidSeller = freezed,Object? deletedAt = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? countryId = freezed,Object? stateId = freezed,Object? profilePhoto = freezed,Object? uploadsLeft = freezed,Object? activeStatus = freezed,Object? avatar = freezed,Object? darkMode = freezed,Object? messengerColor = freezed,}) {
  return _then(_User(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,emailVerifiedAt: freezed == emailVerifiedAt ? _self.emailVerifiedAt : emailVerifiedAt // ignore: cast_nullable_to_non_nullable
as String?,paidSeller: freezed == paidSeller ? _self.paidSeller : paidSeller // ignore: cast_nullable_to_non_nullable
as int?,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,countryId: freezed == countryId ? _self.countryId : countryId // ignore: cast_nullable_to_non_nullable
as int?,stateId: freezed == stateId ? _self.stateId : stateId // ignore: cast_nullable_to_non_nullable
as int?,profilePhoto: freezed == profilePhoto ? _self.profilePhoto : profilePhoto // ignore: cast_nullable_to_non_nullable
as String?,uploadsLeft: freezed == uploadsLeft ? _self.uploadsLeft : uploadsLeft // ignore: cast_nullable_to_non_nullable
as int?,activeStatus: freezed == activeStatus ? _self.activeStatus : activeStatus // ignore: cast_nullable_to_non_nullable
as int?,avatar: freezed == avatar ? _self.avatar : avatar // ignore: cast_nullable_to_non_nullable
as String?,darkMode: freezed == darkMode ? _self.darkMode : darkMode // ignore: cast_nullable_to_non_nullable
as int?,messengerColor: freezed == messengerColor ? _self.messengerColor : messengerColor // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$Brand implements DiagnosticableTreeMixin {

@JsonKey(fromJson: _parseInt) int get id;@JsonKey(name: 'user_id', fromJson: _parseInt) int? get userId;@JsonKey(fromJson: _parseString) String get name;@JsonKey(fromJson: _parseString) String? get slug;@JsonKey(fromJson: _parseString) String? get image;@JsonKey(name: 'created_at', fromJson: _parseString) String? get createdAt;@JsonKey(name: 'updated_at', fromJson: _parseString) String? get updatedAt;
/// Create a copy of Brand
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BrandCopyWith<Brand> get copyWith => _$BrandCopyWithImpl<Brand>(this as Brand, _$identity);

  /// Serializes this Brand to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'Brand'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('userId', userId))..add(DiagnosticsProperty('name', name))..add(DiagnosticsProperty('slug', slug))..add(DiagnosticsProperty('image', image))..add(DiagnosticsProperty('createdAt', createdAt))..add(DiagnosticsProperty('updatedAt', updatedAt));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Brand&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.image, image) || other.image == image)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,name,slug,image,createdAt,updatedAt);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'Brand(id: $id, userId: $userId, name: $name, slug: $slug, image: $image, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $BrandCopyWith<$Res>  {
  factory $BrandCopyWith(Brand value, $Res Function(Brand) _then) = _$BrandCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: _parseInt) int id,@JsonKey(name: 'user_id', fromJson: _parseInt) int? userId,@JsonKey(fromJson: _parseString) String name,@JsonKey(fromJson: _parseString) String? slug,@JsonKey(fromJson: _parseString) String? image,@JsonKey(name: 'created_at', fromJson: _parseString) String? createdAt,@JsonKey(name: 'updated_at', fromJson: _parseString) String? updatedAt
});




}
/// @nodoc
class _$BrandCopyWithImpl<$Res>
    implements $BrandCopyWith<$Res> {
  _$BrandCopyWithImpl(this._self, this._then);

  final Brand _self;
  final $Res Function(Brand) _then;

/// Create a copy of Brand
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = freezed,Object? name = null,Object? slug = freezed,Object? image = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: freezed == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String?,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Brand].
extension BrandPatterns on Brand {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Brand value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Brand() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Brand value)  $default,){
final _that = this;
switch (_that) {
case _Brand():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Brand value)?  $default,){
final _that = this;
switch (_that) {
case _Brand() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _parseInt)  int id, @JsonKey(name: 'user_id', fromJson: _parseInt)  int? userId, @JsonKey(fromJson: _parseString)  String name, @JsonKey(fromJson: _parseString)  String? slug, @JsonKey(fromJson: _parseString)  String? image, @JsonKey(name: 'created_at', fromJson: _parseString)  String? createdAt, @JsonKey(name: 'updated_at', fromJson: _parseString)  String? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Brand() when $default != null:
return $default(_that.id,_that.userId,_that.name,_that.slug,_that.image,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _parseInt)  int id, @JsonKey(name: 'user_id', fromJson: _parseInt)  int? userId, @JsonKey(fromJson: _parseString)  String name, @JsonKey(fromJson: _parseString)  String? slug, @JsonKey(fromJson: _parseString)  String? image, @JsonKey(name: 'created_at', fromJson: _parseString)  String? createdAt, @JsonKey(name: 'updated_at', fromJson: _parseString)  String? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _Brand():
return $default(_that.id,_that.userId,_that.name,_that.slug,_that.image,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: _parseInt)  int id, @JsonKey(name: 'user_id', fromJson: _parseInt)  int? userId, @JsonKey(fromJson: _parseString)  String name, @JsonKey(fromJson: _parseString)  String? slug, @JsonKey(fromJson: _parseString)  String? image, @JsonKey(name: 'created_at', fromJson: _parseString)  String? createdAt, @JsonKey(name: 'updated_at', fromJson: _parseString)  String? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _Brand() when $default != null:
return $default(_that.id,_that.userId,_that.name,_that.slug,_that.image,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Brand with DiagnosticableTreeMixin implements Brand {
  const _Brand({@JsonKey(fromJson: _parseInt) required this.id, @JsonKey(name: 'user_id', fromJson: _parseInt) this.userId, @JsonKey(fromJson: _parseString) required this.name, @JsonKey(fromJson: _parseString) this.slug, @JsonKey(fromJson: _parseString) this.image, @JsonKey(name: 'created_at', fromJson: _parseString) this.createdAt, @JsonKey(name: 'updated_at', fromJson: _parseString) this.updatedAt});
  factory _Brand.fromJson(Map<String, dynamic> json) => _$BrandFromJson(json);

@override@JsonKey(fromJson: _parseInt) final  int id;
@override@JsonKey(name: 'user_id', fromJson: _parseInt) final  int? userId;
@override@JsonKey(fromJson: _parseString) final  String name;
@override@JsonKey(fromJson: _parseString) final  String? slug;
@override@JsonKey(fromJson: _parseString) final  String? image;
@override@JsonKey(name: 'created_at', fromJson: _parseString) final  String? createdAt;
@override@JsonKey(name: 'updated_at', fromJson: _parseString) final  String? updatedAt;

/// Create a copy of Brand
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BrandCopyWith<_Brand> get copyWith => __$BrandCopyWithImpl<_Brand>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BrandToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'Brand'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('userId', userId))..add(DiagnosticsProperty('name', name))..add(DiagnosticsProperty('slug', slug))..add(DiagnosticsProperty('image', image))..add(DiagnosticsProperty('createdAt', createdAt))..add(DiagnosticsProperty('updatedAt', updatedAt));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Brand&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.image, image) || other.image == image)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,name,slug,image,createdAt,updatedAt);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'Brand(id: $id, userId: $userId, name: $name, slug: $slug, image: $image, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$BrandCopyWith<$Res> implements $BrandCopyWith<$Res> {
  factory _$BrandCopyWith(_Brand value, $Res Function(_Brand) _then) = __$BrandCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: _parseInt) int id,@JsonKey(name: 'user_id', fromJson: _parseInt) int? userId,@JsonKey(fromJson: _parseString) String name,@JsonKey(fromJson: _parseString) String? slug,@JsonKey(fromJson: _parseString) String? image,@JsonKey(name: 'created_at', fromJson: _parseString) String? createdAt,@JsonKey(name: 'updated_at', fromJson: _parseString) String? updatedAt
});




}
/// @nodoc
class __$BrandCopyWithImpl<$Res>
    implements _$BrandCopyWith<$Res> {
  __$BrandCopyWithImpl(this._self, this._then);

  final _Brand _self;
  final $Res Function(_Brand) _then;

/// Create a copy of Brand
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = freezed,Object? name = null,Object? slug = freezed,Object? image = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_Brand(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: freezed == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String?,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$Category implements DiagnosticableTreeMixin {

@JsonKey(fromJson: _parseInt) int get id;@JsonKey(name: 'user_id', fromJson: _parseInt) int? get userId;@JsonKey(name: 'parent_id', fromJson: _parseInt) int? get parentId;@JsonKey(fromJson: _parseString) String get name;@JsonKey(fromJson: _parseString) String? get slug;@JsonKey(fromJson: _parseString) String? get description; List<String>? get features;@JsonKey(fromJson: _parseString) String? get image;@JsonKey(name: 'created_at', fromJson: _parseString) String? get createdAt;@JsonKey(name: 'updated_at', fromJson: _parseString) String? get updatedAt;
/// Create a copy of Category
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategoryCopyWith<Category> get copyWith => _$CategoryCopyWithImpl<Category>(this as Category, _$identity);

  /// Serializes this Category to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'Category'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('userId', userId))..add(DiagnosticsProperty('parentId', parentId))..add(DiagnosticsProperty('name', name))..add(DiagnosticsProperty('slug', slug))..add(DiagnosticsProperty('description', description))..add(DiagnosticsProperty('features', features))..add(DiagnosticsProperty('image', image))..add(DiagnosticsProperty('createdAt', createdAt))..add(DiagnosticsProperty('updatedAt', updatedAt));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Category&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.parentId, parentId) || other.parentId == parentId)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.features, features)&&(identical(other.image, image) || other.image == image)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,parentId,name,slug,description,const DeepCollectionEquality().hash(features),image,createdAt,updatedAt);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'Category(id: $id, userId: $userId, parentId: $parentId, name: $name, slug: $slug, description: $description, features: $features, image: $image, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $CategoryCopyWith<$Res>  {
  factory $CategoryCopyWith(Category value, $Res Function(Category) _then) = _$CategoryCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: _parseInt) int id,@JsonKey(name: 'user_id', fromJson: _parseInt) int? userId,@JsonKey(name: 'parent_id', fromJson: _parseInt) int? parentId,@JsonKey(fromJson: _parseString) String name,@JsonKey(fromJson: _parseString) String? slug,@JsonKey(fromJson: _parseString) String? description, List<String>? features,@JsonKey(fromJson: _parseString) String? image,@JsonKey(name: 'created_at', fromJson: _parseString) String? createdAt,@JsonKey(name: 'updated_at', fromJson: _parseString) String? updatedAt
});




}
/// @nodoc
class _$CategoryCopyWithImpl<$Res>
    implements $CategoryCopyWith<$Res> {
  _$CategoryCopyWithImpl(this._self, this._then);

  final Category _self;
  final $Res Function(Category) _then;

/// Create a copy of Category
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = freezed,Object? parentId = freezed,Object? name = null,Object? slug = freezed,Object? description = freezed,Object? features = freezed,Object? image = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int?,parentId: freezed == parentId ? _self.parentId : parentId // ignore: cast_nullable_to_non_nullable
as int?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: freezed == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,features: freezed == features ? _self.features : features // ignore: cast_nullable_to_non_nullable
as List<String>?,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Category].
extension CategoryPatterns on Category {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Category value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Category() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Category value)  $default,){
final _that = this;
switch (_that) {
case _Category():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Category value)?  $default,){
final _that = this;
switch (_that) {
case _Category() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _parseInt)  int id, @JsonKey(name: 'user_id', fromJson: _parseInt)  int? userId, @JsonKey(name: 'parent_id', fromJson: _parseInt)  int? parentId, @JsonKey(fromJson: _parseString)  String name, @JsonKey(fromJson: _parseString)  String? slug, @JsonKey(fromJson: _parseString)  String? description,  List<String>? features, @JsonKey(fromJson: _parseString)  String? image, @JsonKey(name: 'created_at', fromJson: _parseString)  String? createdAt, @JsonKey(name: 'updated_at', fromJson: _parseString)  String? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Category() when $default != null:
return $default(_that.id,_that.userId,_that.parentId,_that.name,_that.slug,_that.description,_that.features,_that.image,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _parseInt)  int id, @JsonKey(name: 'user_id', fromJson: _parseInt)  int? userId, @JsonKey(name: 'parent_id', fromJson: _parseInt)  int? parentId, @JsonKey(fromJson: _parseString)  String name, @JsonKey(fromJson: _parseString)  String? slug, @JsonKey(fromJson: _parseString)  String? description,  List<String>? features, @JsonKey(fromJson: _parseString)  String? image, @JsonKey(name: 'created_at', fromJson: _parseString)  String? createdAt, @JsonKey(name: 'updated_at', fromJson: _parseString)  String? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _Category():
return $default(_that.id,_that.userId,_that.parentId,_that.name,_that.slug,_that.description,_that.features,_that.image,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: _parseInt)  int id, @JsonKey(name: 'user_id', fromJson: _parseInt)  int? userId, @JsonKey(name: 'parent_id', fromJson: _parseInt)  int? parentId, @JsonKey(fromJson: _parseString)  String name, @JsonKey(fromJson: _parseString)  String? slug, @JsonKey(fromJson: _parseString)  String? description,  List<String>? features, @JsonKey(fromJson: _parseString)  String? image, @JsonKey(name: 'created_at', fromJson: _parseString)  String? createdAt, @JsonKey(name: 'updated_at', fromJson: _parseString)  String? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _Category() when $default != null:
return $default(_that.id,_that.userId,_that.parentId,_that.name,_that.slug,_that.description,_that.features,_that.image,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Category with DiagnosticableTreeMixin implements Category {
  const _Category({@JsonKey(fromJson: _parseInt) required this.id, @JsonKey(name: 'user_id', fromJson: _parseInt) this.userId, @JsonKey(name: 'parent_id', fromJson: _parseInt) this.parentId, @JsonKey(fromJson: _parseString) required this.name, @JsonKey(fromJson: _parseString) this.slug, @JsonKey(fromJson: _parseString) this.description, final  List<String>? features, @JsonKey(fromJson: _parseString) this.image, @JsonKey(name: 'created_at', fromJson: _parseString) this.createdAt, @JsonKey(name: 'updated_at', fromJson: _parseString) this.updatedAt}): _features = features;
  factory _Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);

@override@JsonKey(fromJson: _parseInt) final  int id;
@override@JsonKey(name: 'user_id', fromJson: _parseInt) final  int? userId;
@override@JsonKey(name: 'parent_id', fromJson: _parseInt) final  int? parentId;
@override@JsonKey(fromJson: _parseString) final  String name;
@override@JsonKey(fromJson: _parseString) final  String? slug;
@override@JsonKey(fromJson: _parseString) final  String? description;
 final  List<String>? _features;
@override List<String>? get features {
  final value = _features;
  if (value == null) return null;
  if (_features is EqualUnmodifiableListView) return _features;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey(fromJson: _parseString) final  String? image;
@override@JsonKey(name: 'created_at', fromJson: _parseString) final  String? createdAt;
@override@JsonKey(name: 'updated_at', fromJson: _parseString) final  String? updatedAt;

/// Create a copy of Category
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CategoryCopyWith<_Category> get copyWith => __$CategoryCopyWithImpl<_Category>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CategoryToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'Category'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('userId', userId))..add(DiagnosticsProperty('parentId', parentId))..add(DiagnosticsProperty('name', name))..add(DiagnosticsProperty('slug', slug))..add(DiagnosticsProperty('description', description))..add(DiagnosticsProperty('features', features))..add(DiagnosticsProperty('image', image))..add(DiagnosticsProperty('createdAt', createdAt))..add(DiagnosticsProperty('updatedAt', updatedAt));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Category&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.parentId, parentId) || other.parentId == parentId)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._features, _features)&&(identical(other.image, image) || other.image == image)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,parentId,name,slug,description,const DeepCollectionEquality().hash(_features),image,createdAt,updatedAt);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'Category(id: $id, userId: $userId, parentId: $parentId, name: $name, slug: $slug, description: $description, features: $features, image: $image, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$CategoryCopyWith<$Res> implements $CategoryCopyWith<$Res> {
  factory _$CategoryCopyWith(_Category value, $Res Function(_Category) _then) = __$CategoryCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: _parseInt) int id,@JsonKey(name: 'user_id', fromJson: _parseInt) int? userId,@JsonKey(name: 'parent_id', fromJson: _parseInt) int? parentId,@JsonKey(fromJson: _parseString) String name,@JsonKey(fromJson: _parseString) String? slug,@JsonKey(fromJson: _parseString) String? description, List<String>? features,@JsonKey(fromJson: _parseString) String? image,@JsonKey(name: 'created_at', fromJson: _parseString) String? createdAt,@JsonKey(name: 'updated_at', fromJson: _parseString) String? updatedAt
});




}
/// @nodoc
class __$CategoryCopyWithImpl<$Res>
    implements _$CategoryCopyWith<$Res> {
  __$CategoryCopyWithImpl(this._self, this._then);

  final _Category _self;
  final $Res Function(_Category) _then;

/// Create a copy of Category
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = freezed,Object? parentId = freezed,Object? name = null,Object? slug = freezed,Object? description = freezed,Object? features = freezed,Object? image = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_Category(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int?,parentId: freezed == parentId ? _self.parentId : parentId // ignore: cast_nullable_to_non_nullable
as int?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: freezed == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,features: freezed == features ? _self._features : features // ignore: cast_nullable_to_non_nullable
as List<String>?,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$BrandModel implements DiagnosticableTreeMixin {

@JsonKey(fromJson: _parseInt) int get id;@JsonKey(name: 'brand_id', fromJson: _parseInt) int? get brandId;@JsonKey(fromJson: _parseString) String get name;@JsonKey(fromJson: _parseString) String? get slug;@JsonKey(name: 'created_at', fromJson: _parseString) String? get createdAt;@JsonKey(name: 'updated_at', fromJson: _parseString) String? get updatedAt;
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
@JsonKey(fromJson: _parseInt) int id,@JsonKey(name: 'brand_id', fromJson: _parseInt) int? brandId,@JsonKey(fromJson: _parseString) String name,@JsonKey(fromJson: _parseString) String? slug,@JsonKey(name: 'created_at', fromJson: _parseString) String? createdAt,@JsonKey(name: 'updated_at', fromJson: _parseString) String? updatedAt
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? brandId = freezed,Object? name = null,Object? slug = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,brandId: freezed == brandId ? _self.brandId : brandId // ignore: cast_nullable_to_non_nullable
as int?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: freezed == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _parseInt)  int id, @JsonKey(name: 'brand_id', fromJson: _parseInt)  int? brandId, @JsonKey(fromJson: _parseString)  String name, @JsonKey(fromJson: _parseString)  String? slug, @JsonKey(name: 'created_at', fromJson: _parseString)  String? createdAt, @JsonKey(name: 'updated_at', fromJson: _parseString)  String? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _parseInt)  int id, @JsonKey(name: 'brand_id', fromJson: _parseInt)  int? brandId, @JsonKey(fromJson: _parseString)  String name, @JsonKey(fromJson: _parseString)  String? slug, @JsonKey(name: 'created_at', fromJson: _parseString)  String? createdAt, @JsonKey(name: 'updated_at', fromJson: _parseString)  String? updatedAt)  $default,) {final _that = this;
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: _parseInt)  int id, @JsonKey(name: 'brand_id', fromJson: _parseInt)  int? brandId, @JsonKey(fromJson: _parseString)  String name, @JsonKey(fromJson: _parseString)  String? slug, @JsonKey(name: 'created_at', fromJson: _parseString)  String? createdAt, @JsonKey(name: 'updated_at', fromJson: _parseString)  String? updatedAt)?  $default,) {final _that = this;
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
  const _BrandModel({@JsonKey(fromJson: _parseInt) required this.id, @JsonKey(name: 'brand_id', fromJson: _parseInt) this.brandId, @JsonKey(fromJson: _parseString) required this.name, @JsonKey(fromJson: _parseString) this.slug, @JsonKey(name: 'created_at', fromJson: _parseString) this.createdAt, @JsonKey(name: 'updated_at', fromJson: _parseString) this.updatedAt});
  factory _BrandModel.fromJson(Map<String, dynamic> json) => _$BrandModelFromJson(json);

@override@JsonKey(fromJson: _parseInt) final  int id;
@override@JsonKey(name: 'brand_id', fromJson: _parseInt) final  int? brandId;
@override@JsonKey(fromJson: _parseString) final  String name;
@override@JsonKey(fromJson: _parseString) final  String? slug;
@override@JsonKey(name: 'created_at', fromJson: _parseString) final  String? createdAt;
@override@JsonKey(name: 'updated_at', fromJson: _parseString) final  String? updatedAt;

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
@JsonKey(fromJson: _parseInt) int id,@JsonKey(name: 'brand_id', fromJson: _parseInt) int? brandId,@JsonKey(fromJson: _parseString) String name,@JsonKey(fromJson: _parseString) String? slug,@JsonKey(name: 'created_at', fromJson: _parseString) String? createdAt,@JsonKey(name: 'updated_at', fromJson: _parseString) String? updatedAt
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? brandId = freezed,Object? name = null,Object? slug = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_BrandModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,brandId: freezed == brandId ? _self.brandId : brandId // ignore: cast_nullable_to_non_nullable
as int?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: freezed == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


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

@JsonKey(name: 'current_page', fromJson: _parseInt) int get currentPage;@JsonKey(fromJson: _parseInt) int? get from;@JsonKey(name: 'last_page', fromJson: _parseInt) int? get lastPage; List<PaginationMetaLink>? get links; String? get path;@JsonKey(name: 'per_page', fromJson: _parseInt) int? get perPage;@JsonKey(fromJson: _parseInt) int? get to;@JsonKey(fromJson: _parseInt) int? get total;
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
@JsonKey(name: 'current_page', fromJson: _parseInt) int currentPage,@JsonKey(fromJson: _parseInt) int? from,@JsonKey(name: 'last_page', fromJson: _parseInt) int? lastPage, List<PaginationMetaLink>? links, String? path,@JsonKey(name: 'per_page', fromJson: _parseInt) int? perPage,@JsonKey(fromJson: _parseInt) int? to,@JsonKey(fromJson: _parseInt) int? total
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
@pragma('vm:prefer-inline') @override $Res call({Object? currentPage = null,Object? from = freezed,Object? lastPage = freezed,Object? links = freezed,Object? path = freezed,Object? perPage = freezed,Object? to = freezed,Object? total = freezed,}) {
  return _then(_self.copyWith(
currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,from: freezed == from ? _self.from : from // ignore: cast_nullable_to_non_nullable
as int?,lastPage: freezed == lastPage ? _self.lastPage : lastPage // ignore: cast_nullable_to_non_nullable
as int?,links: freezed == links ? _self.links : links // ignore: cast_nullable_to_non_nullable
as List<PaginationMetaLink>?,path: freezed == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String?,perPage: freezed == perPage ? _self.perPage : perPage // ignore: cast_nullable_to_non_nullable
as int?,to: freezed == to ? _self.to : to // ignore: cast_nullable_to_non_nullable
as int?,total: freezed == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int?,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'current_page', fromJson: _parseInt)  int currentPage, @JsonKey(fromJson: _parseInt)  int? from, @JsonKey(name: 'last_page', fromJson: _parseInt)  int? lastPage,  List<PaginationMetaLink>? links,  String? path, @JsonKey(name: 'per_page', fromJson: _parseInt)  int? perPage, @JsonKey(fromJson: _parseInt)  int? to, @JsonKey(fromJson: _parseInt)  int? total)?  $default,{required TResult orElse(),}) {final _that = this;
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'current_page', fromJson: _parseInt)  int currentPage, @JsonKey(fromJson: _parseInt)  int? from, @JsonKey(name: 'last_page', fromJson: _parseInt)  int? lastPage,  List<PaginationMetaLink>? links,  String? path, @JsonKey(name: 'per_page', fromJson: _parseInt)  int? perPage, @JsonKey(fromJson: _parseInt)  int? to, @JsonKey(fromJson: _parseInt)  int? total)  $default,) {final _that = this;
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'current_page', fromJson: _parseInt)  int currentPage, @JsonKey(fromJson: _parseInt)  int? from, @JsonKey(name: 'last_page', fromJson: _parseInt)  int? lastPage,  List<PaginationMetaLink>? links,  String? path, @JsonKey(name: 'per_page', fromJson: _parseInt)  int? perPage, @JsonKey(fromJson: _parseInt)  int? to, @JsonKey(fromJson: _parseInt)  int? total)?  $default,) {final _that = this;
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
  const _PaginationMeta({@JsonKey(name: 'current_page', fromJson: _parseInt) required this.currentPage, @JsonKey(fromJson: _parseInt) this.from, @JsonKey(name: 'last_page', fromJson: _parseInt) this.lastPage, final  List<PaginationMetaLink>? links, this.path, @JsonKey(name: 'per_page', fromJson: _parseInt) this.perPage, @JsonKey(fromJson: _parseInt) this.to, @JsonKey(fromJson: _parseInt) this.total}): _links = links;
  factory _PaginationMeta.fromJson(Map<String, dynamic> json) => _$PaginationMetaFromJson(json);

@override@JsonKey(name: 'current_page', fromJson: _parseInt) final  int currentPage;
@override@JsonKey(fromJson: _parseInt) final  int? from;
@override@JsonKey(name: 'last_page', fromJson: _parseInt) final  int? lastPage;
 final  List<PaginationMetaLink>? _links;
@override List<PaginationMetaLink>? get links {
  final value = _links;
  if (value == null) return null;
  if (_links is EqualUnmodifiableListView) return _links;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  String? path;
@override@JsonKey(name: 'per_page', fromJson: _parseInt) final  int? perPage;
@override@JsonKey(fromJson: _parseInt) final  int? to;
@override@JsonKey(fromJson: _parseInt) final  int? total;

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
@JsonKey(name: 'current_page', fromJson: _parseInt) int currentPage,@JsonKey(fromJson: _parseInt) int? from,@JsonKey(name: 'last_page', fromJson: _parseInt) int? lastPage, List<PaginationMetaLink>? links, String? path,@JsonKey(name: 'per_page', fromJson: _parseInt) int? perPage,@JsonKey(fromJson: _parseInt) int? to,@JsonKey(fromJson: _parseInt) int? total
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
@override @pragma('vm:prefer-inline') $Res call({Object? currentPage = null,Object? from = freezed,Object? lastPage = freezed,Object? links = freezed,Object? path = freezed,Object? perPage = freezed,Object? to = freezed,Object? total = freezed,}) {
  return _then(_PaginationMeta(
currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,from: freezed == from ? _self.from : from // ignore: cast_nullable_to_non_nullable
as int?,lastPage: freezed == lastPage ? _self.lastPage : lastPage // ignore: cast_nullable_to_non_nullable
as int?,links: freezed == links ? _self._links : links // ignore: cast_nullable_to_non_nullable
as List<PaginationMetaLink>?,path: freezed == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String?,perPage: freezed == perPage ? _self.perPage : perPage // ignore: cast_nullable_to_non_nullable
as int?,to: freezed == to ? _self.to : to // ignore: cast_nullable_to_non_nullable
as int?,total: freezed == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$PaginationMetaLink implements DiagnosticableTreeMixin {

 String? get url; String? get label; bool? get active;
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
 String? url, String? label, bool? active
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
@pragma('vm:prefer-inline') @override $Res call({Object? url = freezed,Object? label = freezed,Object? active = freezed,}) {
  return _then(_self.copyWith(
url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,label: freezed == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String?,active: freezed == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool?,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? url,  String? label,  bool? active)?  $default,{required TResult orElse(),}) {final _that = this;
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? url,  String? label,  bool? active)  $default,) {final _that = this;
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? url,  String? label,  bool? active)?  $default,) {final _that = this;
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
  const _PaginationMetaLink({this.url, this.label, this.active});
  factory _PaginationMetaLink.fromJson(Map<String, dynamic> json) => _$PaginationMetaLinkFromJson(json);

@override final  String? url;
@override final  String? label;
@override final  bool? active;

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
 String? url, String? label, bool? active
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
@override @pragma('vm:prefer-inline') $Res call({Object? url = freezed,Object? label = freezed,Object? active = freezed,}) {
  return _then(_PaginationMetaLink(
url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,label: freezed == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String?,active: freezed == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

// dart format on
