// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chatContactModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChatContactResponse {

 List<ChatContact> get contacts; int get total;@JsonKey(name: 'last_page') int get lastPage;
/// Create a copy of ChatContactResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatContactResponseCopyWith<ChatContactResponse> get copyWith => _$ChatContactResponseCopyWithImpl<ChatContactResponse>(this as ChatContactResponse, _$identity);

  /// Serializes this ChatContactResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatContactResponse&&const DeepCollectionEquality().equals(other.contacts, contacts)&&(identical(other.total, total) || other.total == total)&&(identical(other.lastPage, lastPage) || other.lastPage == lastPage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(contacts),total,lastPage);

@override
String toString() {
  return 'ChatContactResponse(contacts: $contacts, total: $total, lastPage: $lastPage)';
}


}

/// @nodoc
abstract mixin class $ChatContactResponseCopyWith<$Res>  {
  factory $ChatContactResponseCopyWith(ChatContactResponse value, $Res Function(ChatContactResponse) _then) = _$ChatContactResponseCopyWithImpl;
@useResult
$Res call({
 List<ChatContact> contacts, int total,@JsonKey(name: 'last_page') int lastPage
});




}
/// @nodoc
class _$ChatContactResponseCopyWithImpl<$Res>
    implements $ChatContactResponseCopyWith<$Res> {
  _$ChatContactResponseCopyWithImpl(this._self, this._then);

  final ChatContactResponse _self;
  final $Res Function(ChatContactResponse) _then;

/// Create a copy of ChatContactResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? contacts = null,Object? total = null,Object? lastPage = null,}) {
  return _then(_self.copyWith(
contacts: null == contacts ? _self.contacts : contacts // ignore: cast_nullable_to_non_nullable
as List<ChatContact>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,lastPage: null == lastPage ? _self.lastPage : lastPage // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ChatContactResponse].
extension ChatContactResponsePatterns on ChatContactResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChatContactResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChatContactResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChatContactResponse value)  $default,){
final _that = this;
switch (_that) {
case _ChatContactResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChatContactResponse value)?  $default,){
final _that = this;
switch (_that) {
case _ChatContactResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ChatContact> contacts,  int total, @JsonKey(name: 'last_page')  int lastPage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChatContactResponse() when $default != null:
return $default(_that.contacts,_that.total,_that.lastPage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ChatContact> contacts,  int total, @JsonKey(name: 'last_page')  int lastPage)  $default,) {final _that = this;
switch (_that) {
case _ChatContactResponse():
return $default(_that.contacts,_that.total,_that.lastPage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ChatContact> contacts,  int total, @JsonKey(name: 'last_page')  int lastPage)?  $default,) {final _that = this;
switch (_that) {
case _ChatContactResponse() when $default != null:
return $default(_that.contacts,_that.total,_that.lastPage);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChatContactResponse implements ChatContactResponse {
  const _ChatContactResponse({final  List<ChatContact> contacts = const [], this.total = 0, @JsonKey(name: 'last_page') this.lastPage = 0}): _contacts = contacts;
  factory _ChatContactResponse.fromJson(Map<String, dynamic> json) => _$ChatContactResponseFromJson(json);

 final  List<ChatContact> _contacts;
@override@JsonKey() List<ChatContact> get contacts {
  if (_contacts is EqualUnmodifiableListView) return _contacts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_contacts);
}

@override@JsonKey() final  int total;
@override@JsonKey(name: 'last_page') final  int lastPage;

/// Create a copy of ChatContactResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatContactResponseCopyWith<_ChatContactResponse> get copyWith => __$ChatContactResponseCopyWithImpl<_ChatContactResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChatContactResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatContactResponse&&const DeepCollectionEquality().equals(other._contacts, _contacts)&&(identical(other.total, total) || other.total == total)&&(identical(other.lastPage, lastPage) || other.lastPage == lastPage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_contacts),total,lastPage);

@override
String toString() {
  return 'ChatContactResponse(contacts: $contacts, total: $total, lastPage: $lastPage)';
}


}

/// @nodoc
abstract mixin class _$ChatContactResponseCopyWith<$Res> implements $ChatContactResponseCopyWith<$Res> {
  factory _$ChatContactResponseCopyWith(_ChatContactResponse value, $Res Function(_ChatContactResponse) _then) = __$ChatContactResponseCopyWithImpl;
@override @useResult
$Res call({
 List<ChatContact> contacts, int total,@JsonKey(name: 'last_page') int lastPage
});




}
/// @nodoc
class __$ChatContactResponseCopyWithImpl<$Res>
    implements _$ChatContactResponseCopyWith<$Res> {
  __$ChatContactResponseCopyWithImpl(this._self, this._then);

  final _ChatContactResponse _self;
  final $Res Function(_ChatContactResponse) _then;

/// Create a copy of ChatContactResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? contacts = null,Object? total = null,Object? lastPage = null,}) {
  return _then(_ChatContactResponse(
contacts: null == contacts ? _self._contacts : contacts // ignore: cast_nullable_to_non_nullable
as List<ChatContact>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,lastPage: null == lastPage ? _self.lastPage : lastPage // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$ChatContact {

 String get id; String get name; String get email; String get phone;@JsonKey(name: 'email_verified_at') String? get emailVerifiedAt; String? get password;@JsonKey(name: 'paid_seller') int get paidSeller;@JsonKey(name: 'deleted_at') String? get deletedAt;@JsonKey(name: 'remember_token') String? get rememberToken;@JsonKey(name: 'created_at') String get createdAt;@JsonKey(name: 'updated_at') String get updatedAt;@JsonKey(name: 'country_id') int get countryId;@JsonKey(name: 'state_id') int? get stateId;@JsonKey(name: 'profile_photo') String? get profilePhoto;@JsonKey(name: 'uploads_left') int? get uploadsLeft;@JsonKey(name: 'active_status') int get activeStatus; String get avatar;@JsonKey(name: 'dark_mode') int get darkMode;@JsonKey(name: 'messenger_color') String? get messengerColor;@JsonKey(name: 'max_created_at') String get maxCreatedAt;
/// Create a copy of ChatContact
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatContactCopyWith<ChatContact> get copyWith => _$ChatContactCopyWithImpl<ChatContact>(this as ChatContact, _$identity);

  /// Serializes this ChatContact to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatContact&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.emailVerifiedAt, emailVerifiedAt) || other.emailVerifiedAt == emailVerifiedAt)&&(identical(other.password, password) || other.password == password)&&(identical(other.paidSeller, paidSeller) || other.paidSeller == paidSeller)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&(identical(other.rememberToken, rememberToken) || other.rememberToken == rememberToken)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.countryId, countryId) || other.countryId == countryId)&&(identical(other.stateId, stateId) || other.stateId == stateId)&&(identical(other.profilePhoto, profilePhoto) || other.profilePhoto == profilePhoto)&&(identical(other.uploadsLeft, uploadsLeft) || other.uploadsLeft == uploadsLeft)&&(identical(other.activeStatus, activeStatus) || other.activeStatus == activeStatus)&&(identical(other.avatar, avatar) || other.avatar == avatar)&&(identical(other.darkMode, darkMode) || other.darkMode == darkMode)&&(identical(other.messengerColor, messengerColor) || other.messengerColor == messengerColor)&&(identical(other.maxCreatedAt, maxCreatedAt) || other.maxCreatedAt == maxCreatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,name,email,phone,emailVerifiedAt,password,paidSeller,deletedAt,rememberToken,createdAt,updatedAt,countryId,stateId,profilePhoto,uploadsLeft,activeStatus,avatar,darkMode,messengerColor,maxCreatedAt]);

@override
String toString() {
  return 'ChatContact(id: $id, name: $name, email: $email, phone: $phone, emailVerifiedAt: $emailVerifiedAt, password: $password, paidSeller: $paidSeller, deletedAt: $deletedAt, rememberToken: $rememberToken, createdAt: $createdAt, updatedAt: $updatedAt, countryId: $countryId, stateId: $stateId, profilePhoto: $profilePhoto, uploadsLeft: $uploadsLeft, activeStatus: $activeStatus, avatar: $avatar, darkMode: $darkMode, messengerColor: $messengerColor, maxCreatedAt: $maxCreatedAt)';
}


}

/// @nodoc
abstract mixin class $ChatContactCopyWith<$Res>  {
  factory $ChatContactCopyWith(ChatContact value, $Res Function(ChatContact) _then) = _$ChatContactCopyWithImpl;
@useResult
$Res call({
 String id, String name, String email, String phone,@JsonKey(name: 'email_verified_at') String? emailVerifiedAt, String? password,@JsonKey(name: 'paid_seller') int paidSeller,@JsonKey(name: 'deleted_at') String? deletedAt,@JsonKey(name: 'remember_token') String? rememberToken,@JsonKey(name: 'created_at') String createdAt,@JsonKey(name: 'updated_at') String updatedAt,@JsonKey(name: 'country_id') int countryId,@JsonKey(name: 'state_id') int? stateId,@JsonKey(name: 'profile_photo') String? profilePhoto,@JsonKey(name: 'uploads_left') int? uploadsLeft,@JsonKey(name: 'active_status') int activeStatus, String avatar,@JsonKey(name: 'dark_mode') int darkMode,@JsonKey(name: 'messenger_color') String? messengerColor,@JsonKey(name: 'max_created_at') String maxCreatedAt
});




}
/// @nodoc
class _$ChatContactCopyWithImpl<$Res>
    implements $ChatContactCopyWith<$Res> {
  _$ChatContactCopyWithImpl(this._self, this._then);

  final ChatContact _self;
  final $Res Function(ChatContact) _then;

/// Create a copy of ChatContact
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? email = null,Object? phone = null,Object? emailVerifiedAt = freezed,Object? password = freezed,Object? paidSeller = null,Object? deletedAt = freezed,Object? rememberToken = freezed,Object? createdAt = null,Object? updatedAt = null,Object? countryId = null,Object? stateId = freezed,Object? profilePhoto = freezed,Object? uploadsLeft = freezed,Object? activeStatus = null,Object? avatar = null,Object? darkMode = null,Object? messengerColor = freezed,Object? maxCreatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,emailVerifiedAt: freezed == emailVerifiedAt ? _self.emailVerifiedAt : emailVerifiedAt // ignore: cast_nullable_to_non_nullable
as String?,password: freezed == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String?,paidSeller: null == paidSeller ? _self.paidSeller : paidSeller // ignore: cast_nullable_to_non_nullable
as int,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as String?,rememberToken: freezed == rememberToken ? _self.rememberToken : rememberToken // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,countryId: null == countryId ? _self.countryId : countryId // ignore: cast_nullable_to_non_nullable
as int,stateId: freezed == stateId ? _self.stateId : stateId // ignore: cast_nullable_to_non_nullable
as int?,profilePhoto: freezed == profilePhoto ? _self.profilePhoto : profilePhoto // ignore: cast_nullable_to_non_nullable
as String?,uploadsLeft: freezed == uploadsLeft ? _self.uploadsLeft : uploadsLeft // ignore: cast_nullable_to_non_nullable
as int?,activeStatus: null == activeStatus ? _self.activeStatus : activeStatus // ignore: cast_nullable_to_non_nullable
as int,avatar: null == avatar ? _self.avatar : avatar // ignore: cast_nullable_to_non_nullable
as String,darkMode: null == darkMode ? _self.darkMode : darkMode // ignore: cast_nullable_to_non_nullable
as int,messengerColor: freezed == messengerColor ? _self.messengerColor : messengerColor // ignore: cast_nullable_to_non_nullable
as String?,maxCreatedAt: null == maxCreatedAt ? _self.maxCreatedAt : maxCreatedAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ChatContact].
extension ChatContactPatterns on ChatContact {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChatContact value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChatContact() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChatContact value)  $default,){
final _that = this;
switch (_that) {
case _ChatContact():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChatContact value)?  $default,){
final _that = this;
switch (_that) {
case _ChatContact() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String email,  String phone, @JsonKey(name: 'email_verified_at')  String? emailVerifiedAt,  String? password, @JsonKey(name: 'paid_seller')  int paidSeller, @JsonKey(name: 'deleted_at')  String? deletedAt, @JsonKey(name: 'remember_token')  String? rememberToken, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'updated_at')  String updatedAt, @JsonKey(name: 'country_id')  int countryId, @JsonKey(name: 'state_id')  int? stateId, @JsonKey(name: 'profile_photo')  String? profilePhoto, @JsonKey(name: 'uploads_left')  int? uploadsLeft, @JsonKey(name: 'active_status')  int activeStatus,  String avatar, @JsonKey(name: 'dark_mode')  int darkMode, @JsonKey(name: 'messenger_color')  String? messengerColor, @JsonKey(name: 'max_created_at')  String maxCreatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChatContact() when $default != null:
return $default(_that.id,_that.name,_that.email,_that.phone,_that.emailVerifiedAt,_that.password,_that.paidSeller,_that.deletedAt,_that.rememberToken,_that.createdAt,_that.updatedAt,_that.countryId,_that.stateId,_that.profilePhoto,_that.uploadsLeft,_that.activeStatus,_that.avatar,_that.darkMode,_that.messengerColor,_that.maxCreatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String email,  String phone, @JsonKey(name: 'email_verified_at')  String? emailVerifiedAt,  String? password, @JsonKey(name: 'paid_seller')  int paidSeller, @JsonKey(name: 'deleted_at')  String? deletedAt, @JsonKey(name: 'remember_token')  String? rememberToken, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'updated_at')  String updatedAt, @JsonKey(name: 'country_id')  int countryId, @JsonKey(name: 'state_id')  int? stateId, @JsonKey(name: 'profile_photo')  String? profilePhoto, @JsonKey(name: 'uploads_left')  int? uploadsLeft, @JsonKey(name: 'active_status')  int activeStatus,  String avatar, @JsonKey(name: 'dark_mode')  int darkMode, @JsonKey(name: 'messenger_color')  String? messengerColor, @JsonKey(name: 'max_created_at')  String maxCreatedAt)  $default,) {final _that = this;
switch (_that) {
case _ChatContact():
return $default(_that.id,_that.name,_that.email,_that.phone,_that.emailVerifiedAt,_that.password,_that.paidSeller,_that.deletedAt,_that.rememberToken,_that.createdAt,_that.updatedAt,_that.countryId,_that.stateId,_that.profilePhoto,_that.uploadsLeft,_that.activeStatus,_that.avatar,_that.darkMode,_that.messengerColor,_that.maxCreatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String email,  String phone, @JsonKey(name: 'email_verified_at')  String? emailVerifiedAt,  String? password, @JsonKey(name: 'paid_seller')  int paidSeller, @JsonKey(name: 'deleted_at')  String? deletedAt, @JsonKey(name: 'remember_token')  String? rememberToken, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'updated_at')  String updatedAt, @JsonKey(name: 'country_id')  int countryId, @JsonKey(name: 'state_id')  int? stateId, @JsonKey(name: 'profile_photo')  String? profilePhoto, @JsonKey(name: 'uploads_left')  int? uploadsLeft, @JsonKey(name: 'active_status')  int activeStatus,  String avatar, @JsonKey(name: 'dark_mode')  int darkMode, @JsonKey(name: 'messenger_color')  String? messengerColor, @JsonKey(name: 'max_created_at')  String maxCreatedAt)?  $default,) {final _that = this;
switch (_that) {
case _ChatContact() when $default != null:
return $default(_that.id,_that.name,_that.email,_that.phone,_that.emailVerifiedAt,_that.password,_that.paidSeller,_that.deletedAt,_that.rememberToken,_that.createdAt,_that.updatedAt,_that.countryId,_that.stateId,_that.profilePhoto,_that.uploadsLeft,_that.activeStatus,_that.avatar,_that.darkMode,_that.messengerColor,_that.maxCreatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChatContact implements ChatContact {
  const _ChatContact({this.id = '', this.name = 'Unknown', this.email = '', this.phone = '', @JsonKey(name: 'email_verified_at') this.emailVerifiedAt, this.password, @JsonKey(name: 'paid_seller') this.paidSeller = 0, @JsonKey(name: 'deleted_at') this.deletedAt, @JsonKey(name: 'remember_token') this.rememberToken, @JsonKey(name: 'created_at') this.createdAt = '', @JsonKey(name: 'updated_at') this.updatedAt = '', @JsonKey(name: 'country_id') this.countryId = 0, @JsonKey(name: 'state_id') this.stateId, @JsonKey(name: 'profile_photo') this.profilePhoto, @JsonKey(name: 'uploads_left') this.uploadsLeft, @JsonKey(name: 'active_status') this.activeStatus = 0, this.avatar = '', @JsonKey(name: 'dark_mode') this.darkMode = 0, @JsonKey(name: 'messenger_color') this.messengerColor, @JsonKey(name: 'max_created_at') this.maxCreatedAt = ''});
  factory _ChatContact.fromJson(Map<String, dynamic> json) => _$ChatContactFromJson(json);

@override@JsonKey() final  String id;
@override@JsonKey() final  String name;
@override@JsonKey() final  String email;
@override@JsonKey() final  String phone;
@override@JsonKey(name: 'email_verified_at') final  String? emailVerifiedAt;
@override final  String? password;
@override@JsonKey(name: 'paid_seller') final  int paidSeller;
@override@JsonKey(name: 'deleted_at') final  String? deletedAt;
@override@JsonKey(name: 'remember_token') final  String? rememberToken;
@override@JsonKey(name: 'created_at') final  String createdAt;
@override@JsonKey(name: 'updated_at') final  String updatedAt;
@override@JsonKey(name: 'country_id') final  int countryId;
@override@JsonKey(name: 'state_id') final  int? stateId;
@override@JsonKey(name: 'profile_photo') final  String? profilePhoto;
@override@JsonKey(name: 'uploads_left') final  int? uploadsLeft;
@override@JsonKey(name: 'active_status') final  int activeStatus;
@override@JsonKey() final  String avatar;
@override@JsonKey(name: 'dark_mode') final  int darkMode;
@override@JsonKey(name: 'messenger_color') final  String? messengerColor;
@override@JsonKey(name: 'max_created_at') final  String maxCreatedAt;

/// Create a copy of ChatContact
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatContactCopyWith<_ChatContact> get copyWith => __$ChatContactCopyWithImpl<_ChatContact>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChatContactToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatContact&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.emailVerifiedAt, emailVerifiedAt) || other.emailVerifiedAt == emailVerifiedAt)&&(identical(other.password, password) || other.password == password)&&(identical(other.paidSeller, paidSeller) || other.paidSeller == paidSeller)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&(identical(other.rememberToken, rememberToken) || other.rememberToken == rememberToken)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.countryId, countryId) || other.countryId == countryId)&&(identical(other.stateId, stateId) || other.stateId == stateId)&&(identical(other.profilePhoto, profilePhoto) || other.profilePhoto == profilePhoto)&&(identical(other.uploadsLeft, uploadsLeft) || other.uploadsLeft == uploadsLeft)&&(identical(other.activeStatus, activeStatus) || other.activeStatus == activeStatus)&&(identical(other.avatar, avatar) || other.avatar == avatar)&&(identical(other.darkMode, darkMode) || other.darkMode == darkMode)&&(identical(other.messengerColor, messengerColor) || other.messengerColor == messengerColor)&&(identical(other.maxCreatedAt, maxCreatedAt) || other.maxCreatedAt == maxCreatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,name,email,phone,emailVerifiedAt,password,paidSeller,deletedAt,rememberToken,createdAt,updatedAt,countryId,stateId,profilePhoto,uploadsLeft,activeStatus,avatar,darkMode,messengerColor,maxCreatedAt]);

@override
String toString() {
  return 'ChatContact(id: $id, name: $name, email: $email, phone: $phone, emailVerifiedAt: $emailVerifiedAt, password: $password, paidSeller: $paidSeller, deletedAt: $deletedAt, rememberToken: $rememberToken, createdAt: $createdAt, updatedAt: $updatedAt, countryId: $countryId, stateId: $stateId, profilePhoto: $profilePhoto, uploadsLeft: $uploadsLeft, activeStatus: $activeStatus, avatar: $avatar, darkMode: $darkMode, messengerColor: $messengerColor, maxCreatedAt: $maxCreatedAt)';
}


}

/// @nodoc
abstract mixin class _$ChatContactCopyWith<$Res> implements $ChatContactCopyWith<$Res> {
  factory _$ChatContactCopyWith(_ChatContact value, $Res Function(_ChatContact) _then) = __$ChatContactCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String email, String phone,@JsonKey(name: 'email_verified_at') String? emailVerifiedAt, String? password,@JsonKey(name: 'paid_seller') int paidSeller,@JsonKey(name: 'deleted_at') String? deletedAt,@JsonKey(name: 'remember_token') String? rememberToken,@JsonKey(name: 'created_at') String createdAt,@JsonKey(name: 'updated_at') String updatedAt,@JsonKey(name: 'country_id') int countryId,@JsonKey(name: 'state_id') int? stateId,@JsonKey(name: 'profile_photo') String? profilePhoto,@JsonKey(name: 'uploads_left') int? uploadsLeft,@JsonKey(name: 'active_status') int activeStatus, String avatar,@JsonKey(name: 'dark_mode') int darkMode,@JsonKey(name: 'messenger_color') String? messengerColor,@JsonKey(name: 'max_created_at') String maxCreatedAt
});




}
/// @nodoc
class __$ChatContactCopyWithImpl<$Res>
    implements _$ChatContactCopyWith<$Res> {
  __$ChatContactCopyWithImpl(this._self, this._then);

  final _ChatContact _self;
  final $Res Function(_ChatContact) _then;

/// Create a copy of ChatContact
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? email = null,Object? phone = null,Object? emailVerifiedAt = freezed,Object? password = freezed,Object? paidSeller = null,Object? deletedAt = freezed,Object? rememberToken = freezed,Object? createdAt = null,Object? updatedAt = null,Object? countryId = null,Object? stateId = freezed,Object? profilePhoto = freezed,Object? uploadsLeft = freezed,Object? activeStatus = null,Object? avatar = null,Object? darkMode = null,Object? messengerColor = freezed,Object? maxCreatedAt = null,}) {
  return _then(_ChatContact(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,emailVerifiedAt: freezed == emailVerifiedAt ? _self.emailVerifiedAt : emailVerifiedAt // ignore: cast_nullable_to_non_nullable
as String?,password: freezed == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String?,paidSeller: null == paidSeller ? _self.paidSeller : paidSeller // ignore: cast_nullable_to_non_nullable
as int,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as String?,rememberToken: freezed == rememberToken ? _self.rememberToken : rememberToken // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,countryId: null == countryId ? _self.countryId : countryId // ignore: cast_nullable_to_non_nullable
as int,stateId: freezed == stateId ? _self.stateId : stateId // ignore: cast_nullable_to_non_nullable
as int?,profilePhoto: freezed == profilePhoto ? _self.profilePhoto : profilePhoto // ignore: cast_nullable_to_non_nullable
as String?,uploadsLeft: freezed == uploadsLeft ? _self.uploadsLeft : uploadsLeft // ignore: cast_nullable_to_non_nullable
as int?,activeStatus: null == activeStatus ? _self.activeStatus : activeStatus // ignore: cast_nullable_to_non_nullable
as int,avatar: null == avatar ? _self.avatar : avatar // ignore: cast_nullable_to_non_nullable
as String,darkMode: null == darkMode ? _self.darkMode : darkMode // ignore: cast_nullable_to_non_nullable
as int,messengerColor: freezed == messengerColor ? _self.messengerColor : messengerColor // ignore: cast_nullable_to_non_nullable
as String?,maxCreatedAt: null == maxCreatedAt ? _self.maxCreatedAt : maxCreatedAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
