// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chatContactModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ChatContactResponse _$ChatContactResponseFromJson(Map<String, dynamic> json) {
  return _ChatContactResponse.fromJson(json);
}

/// @nodoc
mixin _$ChatContactResponse {
  List<ChatContact> get contacts => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_page')
  int get lastPage => throw _privateConstructorUsedError;

  /// Serializes this ChatContactResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChatContactResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChatContactResponseCopyWith<ChatContactResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatContactResponseCopyWith<$Res> {
  factory $ChatContactResponseCopyWith(
          ChatContactResponse value, $Res Function(ChatContactResponse) then) =
      _$ChatContactResponseCopyWithImpl<$Res, ChatContactResponse>;
  @useResult
  $Res call(
      {List<ChatContact> contacts,
      int total,
      @JsonKey(name: 'last_page') int lastPage});
}

/// @nodoc
class _$ChatContactResponseCopyWithImpl<$Res, $Val extends ChatContactResponse>
    implements $ChatContactResponseCopyWith<$Res> {
  _$ChatContactResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChatContactResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contacts = null,
    Object? total = null,
    Object? lastPage = null,
  }) {
    return _then(_value.copyWith(
      contacts: null == contacts
          ? _value.contacts
          : contacts // ignore: cast_nullable_to_non_nullable
              as List<ChatContact>,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      lastPage: null == lastPage
          ? _value.lastPage
          : lastPage // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChatContactResponseImplCopyWith<$Res>
    implements $ChatContactResponseCopyWith<$Res> {
  factory _$$ChatContactResponseImplCopyWith(_$ChatContactResponseImpl value,
          $Res Function(_$ChatContactResponseImpl) then) =
      __$$ChatContactResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<ChatContact> contacts,
      int total,
      @JsonKey(name: 'last_page') int lastPage});
}

/// @nodoc
class __$$ChatContactResponseImplCopyWithImpl<$Res>
    extends _$ChatContactResponseCopyWithImpl<$Res, _$ChatContactResponseImpl>
    implements _$$ChatContactResponseImplCopyWith<$Res> {
  __$$ChatContactResponseImplCopyWithImpl(_$ChatContactResponseImpl _value,
      $Res Function(_$ChatContactResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChatContactResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contacts = null,
    Object? total = null,
    Object? lastPage = null,
  }) {
    return _then(_$ChatContactResponseImpl(
      contacts: null == contacts
          ? _value._contacts
          : contacts // ignore: cast_nullable_to_non_nullable
              as List<ChatContact>,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      lastPage: null == lastPage
          ? _value.lastPage
          : lastPage // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatContactResponseImpl implements _ChatContactResponse {
  const _$ChatContactResponseImpl(
      {final List<ChatContact> contacts = const [],
      this.total = 0,
      @JsonKey(name: 'last_page') this.lastPage = 0})
      : _contacts = contacts;

  factory _$ChatContactResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatContactResponseImplFromJson(json);

  final List<ChatContact> _contacts;
  @override
  @JsonKey()
  List<ChatContact> get contacts {
    if (_contacts is EqualUnmodifiableListView) return _contacts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_contacts);
  }

  @override
  @JsonKey()
  final int total;
  @override
  @JsonKey(name: 'last_page')
  final int lastPage;

  @override
  String toString() {
    return 'ChatContactResponse(contacts: $contacts, total: $total, lastPage: $lastPage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatContactResponseImpl &&
            const DeepCollectionEquality().equals(other._contacts, _contacts) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.lastPage, lastPage) ||
                other.lastPage == lastPage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_contacts), total, lastPage);

  /// Create a copy of ChatContactResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatContactResponseImplCopyWith<_$ChatContactResponseImpl> get copyWith =>
      __$$ChatContactResponseImplCopyWithImpl<_$ChatContactResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatContactResponseImplToJson(
      this,
    );
  }
}

abstract class _ChatContactResponse implements ChatContactResponse {
  const factory _ChatContactResponse(
          {final List<ChatContact> contacts,
          final int total,
          @JsonKey(name: 'last_page') final int lastPage}) =
      _$ChatContactResponseImpl;

  factory _ChatContactResponse.fromJson(Map<String, dynamic> json) =
      _$ChatContactResponseImpl.fromJson;

  @override
  List<ChatContact> get contacts;
  @override
  int get total;
  @override
  @JsonKey(name: 'last_page')
  int get lastPage;

  /// Create a copy of ChatContactResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChatContactResponseImplCopyWith<_$ChatContactResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ChatContact _$ChatContactFromJson(Map<String, dynamic> json) {
  return _ChatContact.fromJson(json);
}

/// @nodoc
mixin _$ChatContact {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  @JsonKey(name: 'email_verified_at')
  String? get emailVerifiedAt => throw _privateConstructorUsedError;
  String? get password => throw _privateConstructorUsedError;
  @JsonKey(name: 'paid_seller')
  int get paidSeller => throw _privateConstructorUsedError;
  @JsonKey(name: 'deleted_at')
  String? get deletedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'remember_token')
  String? get rememberToken => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  String get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'country_id')
  int get countryId => throw _privateConstructorUsedError;
  @JsonKey(name: 'state_id')
  int? get stateId => throw _privateConstructorUsedError;
  @JsonKey(name: 'profile_photo')
  String? get profilePhoto => throw _privateConstructorUsedError;
  @JsonKey(name: 'uploads_left')
  int? get uploadsLeft => throw _privateConstructorUsedError;
  @JsonKey(name: 'active_status')
  int get activeStatus => throw _privateConstructorUsedError;
  String get avatar => throw _privateConstructorUsedError;
  @JsonKey(name: 'dark_mode')
  int get darkMode => throw _privateConstructorUsedError;
  @JsonKey(name: 'messenger_color')
  String? get messengerColor => throw _privateConstructorUsedError;
  @JsonKey(name: 'max_created_at')
  String get maxCreatedAt => throw _privateConstructorUsedError;

  /// Serializes this ChatContact to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChatContact
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChatContactCopyWith<ChatContact> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatContactCopyWith<$Res> {
  factory $ChatContactCopyWith(
          ChatContact value, $Res Function(ChatContact) then) =
      _$ChatContactCopyWithImpl<$Res, ChatContact>;
  @useResult
  $Res call(
      {String id,
      String name,
      String email,
      String phone,
      @JsonKey(name: 'email_verified_at') String? emailVerifiedAt,
      String? password,
      @JsonKey(name: 'paid_seller') int paidSeller,
      @JsonKey(name: 'deleted_at') String? deletedAt,
      @JsonKey(name: 'remember_token') String? rememberToken,
      @JsonKey(name: 'created_at') String createdAt,
      @JsonKey(name: 'updated_at') String updatedAt,
      @JsonKey(name: 'country_id') int countryId,
      @JsonKey(name: 'state_id') int? stateId,
      @JsonKey(name: 'profile_photo') String? profilePhoto,
      @JsonKey(name: 'uploads_left') int? uploadsLeft,
      @JsonKey(name: 'active_status') int activeStatus,
      String avatar,
      @JsonKey(name: 'dark_mode') int darkMode,
      @JsonKey(name: 'messenger_color') String? messengerColor,
      @JsonKey(name: 'max_created_at') String maxCreatedAt});
}

/// @nodoc
class _$ChatContactCopyWithImpl<$Res, $Val extends ChatContact>
    implements $ChatContactCopyWith<$Res> {
  _$ChatContactCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChatContact
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = null,
    Object? phone = null,
    Object? emailVerifiedAt = freezed,
    Object? password = freezed,
    Object? paidSeller = null,
    Object? deletedAt = freezed,
    Object? rememberToken = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? countryId = null,
    Object? stateId = freezed,
    Object? profilePhoto = freezed,
    Object? uploadsLeft = freezed,
    Object? activeStatus = null,
    Object? avatar = null,
    Object? darkMode = null,
    Object? messengerColor = freezed,
    Object? maxCreatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      emailVerifiedAt: freezed == emailVerifiedAt
          ? _value.emailVerifiedAt
          : emailVerifiedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      paidSeller: null == paidSeller
          ? _value.paidSeller
          : paidSeller // ignore: cast_nullable_to_non_nullable
              as int,
      deletedAt: freezed == deletedAt
          ? _value.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      rememberToken: freezed == rememberToken
          ? _value.rememberToken
          : rememberToken // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      countryId: null == countryId
          ? _value.countryId
          : countryId // ignore: cast_nullable_to_non_nullable
              as int,
      stateId: freezed == stateId
          ? _value.stateId
          : stateId // ignore: cast_nullable_to_non_nullable
              as int?,
      profilePhoto: freezed == profilePhoto
          ? _value.profilePhoto
          : profilePhoto // ignore: cast_nullable_to_non_nullable
              as String?,
      uploadsLeft: freezed == uploadsLeft
          ? _value.uploadsLeft
          : uploadsLeft // ignore: cast_nullable_to_non_nullable
              as int?,
      activeStatus: null == activeStatus
          ? _value.activeStatus
          : activeStatus // ignore: cast_nullable_to_non_nullable
              as int,
      avatar: null == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String,
      darkMode: null == darkMode
          ? _value.darkMode
          : darkMode // ignore: cast_nullable_to_non_nullable
              as int,
      messengerColor: freezed == messengerColor
          ? _value.messengerColor
          : messengerColor // ignore: cast_nullable_to_non_nullable
              as String?,
      maxCreatedAt: null == maxCreatedAt
          ? _value.maxCreatedAt
          : maxCreatedAt // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChatContactImplCopyWith<$Res>
    implements $ChatContactCopyWith<$Res> {
  factory _$$ChatContactImplCopyWith(
          _$ChatContactImpl value, $Res Function(_$ChatContactImpl) then) =
      __$$ChatContactImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String email,
      String phone,
      @JsonKey(name: 'email_verified_at') String? emailVerifiedAt,
      String? password,
      @JsonKey(name: 'paid_seller') int paidSeller,
      @JsonKey(name: 'deleted_at') String? deletedAt,
      @JsonKey(name: 'remember_token') String? rememberToken,
      @JsonKey(name: 'created_at') String createdAt,
      @JsonKey(name: 'updated_at') String updatedAt,
      @JsonKey(name: 'country_id') int countryId,
      @JsonKey(name: 'state_id') int? stateId,
      @JsonKey(name: 'profile_photo') String? profilePhoto,
      @JsonKey(name: 'uploads_left') int? uploadsLeft,
      @JsonKey(name: 'active_status') int activeStatus,
      String avatar,
      @JsonKey(name: 'dark_mode') int darkMode,
      @JsonKey(name: 'messenger_color') String? messengerColor,
      @JsonKey(name: 'max_created_at') String maxCreatedAt});
}

/// @nodoc
class __$$ChatContactImplCopyWithImpl<$Res>
    extends _$ChatContactCopyWithImpl<$Res, _$ChatContactImpl>
    implements _$$ChatContactImplCopyWith<$Res> {
  __$$ChatContactImplCopyWithImpl(
      _$ChatContactImpl _value, $Res Function(_$ChatContactImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChatContact
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = null,
    Object? phone = null,
    Object? emailVerifiedAt = freezed,
    Object? password = freezed,
    Object? paidSeller = null,
    Object? deletedAt = freezed,
    Object? rememberToken = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? countryId = null,
    Object? stateId = freezed,
    Object? profilePhoto = freezed,
    Object? uploadsLeft = freezed,
    Object? activeStatus = null,
    Object? avatar = null,
    Object? darkMode = null,
    Object? messengerColor = freezed,
    Object? maxCreatedAt = null,
  }) {
    return _then(_$ChatContactImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      emailVerifiedAt: freezed == emailVerifiedAt
          ? _value.emailVerifiedAt
          : emailVerifiedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      paidSeller: null == paidSeller
          ? _value.paidSeller
          : paidSeller // ignore: cast_nullable_to_non_nullable
              as int,
      deletedAt: freezed == deletedAt
          ? _value.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      rememberToken: freezed == rememberToken
          ? _value.rememberToken
          : rememberToken // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      countryId: null == countryId
          ? _value.countryId
          : countryId // ignore: cast_nullable_to_non_nullable
              as int,
      stateId: freezed == stateId
          ? _value.stateId
          : stateId // ignore: cast_nullable_to_non_nullable
              as int?,
      profilePhoto: freezed == profilePhoto
          ? _value.profilePhoto
          : profilePhoto // ignore: cast_nullable_to_non_nullable
              as String?,
      uploadsLeft: freezed == uploadsLeft
          ? _value.uploadsLeft
          : uploadsLeft // ignore: cast_nullable_to_non_nullable
              as int?,
      activeStatus: null == activeStatus
          ? _value.activeStatus
          : activeStatus // ignore: cast_nullable_to_non_nullable
              as int,
      avatar: null == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String,
      darkMode: null == darkMode
          ? _value.darkMode
          : darkMode // ignore: cast_nullable_to_non_nullable
              as int,
      messengerColor: freezed == messengerColor
          ? _value.messengerColor
          : messengerColor // ignore: cast_nullable_to_non_nullable
              as String?,
      maxCreatedAt: null == maxCreatedAt
          ? _value.maxCreatedAt
          : maxCreatedAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatContactImpl implements _ChatContact {
  const _$ChatContactImpl(
      {this.id = '',
      this.name = 'Unknown',
      this.email = '',
      this.phone = '',
      @JsonKey(name: 'email_verified_at') this.emailVerifiedAt,
      this.password,
      @JsonKey(name: 'paid_seller') this.paidSeller = 0,
      @JsonKey(name: 'deleted_at') this.deletedAt,
      @JsonKey(name: 'remember_token') this.rememberToken,
      @JsonKey(name: 'created_at') this.createdAt = '',
      @JsonKey(name: 'updated_at') this.updatedAt = '',
      @JsonKey(name: 'country_id') this.countryId = 0,
      @JsonKey(name: 'state_id') this.stateId,
      @JsonKey(name: 'profile_photo') this.profilePhoto,
      @JsonKey(name: 'uploads_left') this.uploadsLeft,
      @JsonKey(name: 'active_status') this.activeStatus = 0,
      this.avatar = '',
      @JsonKey(name: 'dark_mode') this.darkMode = 0,
      @JsonKey(name: 'messenger_color') this.messengerColor,
      @JsonKey(name: 'max_created_at') this.maxCreatedAt = ''});

  factory _$ChatContactImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatContactImplFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String email;
  @override
  @JsonKey()
  final String phone;
  @override
  @JsonKey(name: 'email_verified_at')
  final String? emailVerifiedAt;
  @override
  final String? password;
  @override
  @JsonKey(name: 'paid_seller')
  final int paidSeller;
  @override
  @JsonKey(name: 'deleted_at')
  final String? deletedAt;
  @override
  @JsonKey(name: 'remember_token')
  final String? rememberToken;
  @override
  @JsonKey(name: 'created_at')
  final String createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final String updatedAt;
  @override
  @JsonKey(name: 'country_id')
  final int countryId;
  @override
  @JsonKey(name: 'state_id')
  final int? stateId;
  @override
  @JsonKey(name: 'profile_photo')
  final String? profilePhoto;
  @override
  @JsonKey(name: 'uploads_left')
  final int? uploadsLeft;
  @override
  @JsonKey(name: 'active_status')
  final int activeStatus;
  @override
  @JsonKey()
  final String avatar;
  @override
  @JsonKey(name: 'dark_mode')
  final int darkMode;
  @override
  @JsonKey(name: 'messenger_color')
  final String? messengerColor;
  @override
  @JsonKey(name: 'max_created_at')
  final String maxCreatedAt;

  @override
  String toString() {
    return 'ChatContact(id: $id, name: $name, email: $email, phone: $phone, emailVerifiedAt: $emailVerifiedAt, password: $password, paidSeller: $paidSeller, deletedAt: $deletedAt, rememberToken: $rememberToken, createdAt: $createdAt, updatedAt: $updatedAt, countryId: $countryId, stateId: $stateId, profilePhoto: $profilePhoto, uploadsLeft: $uploadsLeft, activeStatus: $activeStatus, avatar: $avatar, darkMode: $darkMode, messengerColor: $messengerColor, maxCreatedAt: $maxCreatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatContactImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.emailVerifiedAt, emailVerifiedAt) ||
                other.emailVerifiedAt == emailVerifiedAt) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.paidSeller, paidSeller) ||
                other.paidSeller == paidSeller) &&
            (identical(other.deletedAt, deletedAt) ||
                other.deletedAt == deletedAt) &&
            (identical(other.rememberToken, rememberToken) ||
                other.rememberToken == rememberToken) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.countryId, countryId) ||
                other.countryId == countryId) &&
            (identical(other.stateId, stateId) || other.stateId == stateId) &&
            (identical(other.profilePhoto, profilePhoto) ||
                other.profilePhoto == profilePhoto) &&
            (identical(other.uploadsLeft, uploadsLeft) ||
                other.uploadsLeft == uploadsLeft) &&
            (identical(other.activeStatus, activeStatus) ||
                other.activeStatus == activeStatus) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            (identical(other.darkMode, darkMode) ||
                other.darkMode == darkMode) &&
            (identical(other.messengerColor, messengerColor) ||
                other.messengerColor == messengerColor) &&
            (identical(other.maxCreatedAt, maxCreatedAt) ||
                other.maxCreatedAt == maxCreatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        name,
        email,
        phone,
        emailVerifiedAt,
        password,
        paidSeller,
        deletedAt,
        rememberToken,
        createdAt,
        updatedAt,
        countryId,
        stateId,
        profilePhoto,
        uploadsLeft,
        activeStatus,
        avatar,
        darkMode,
        messengerColor,
        maxCreatedAt
      ]);

  /// Create a copy of ChatContact
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatContactImplCopyWith<_$ChatContactImpl> get copyWith =>
      __$$ChatContactImplCopyWithImpl<_$ChatContactImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatContactImplToJson(
      this,
    );
  }
}

abstract class _ChatContact implements ChatContact {
  const factory _ChatContact(
          {final String id,
          final String name,
          final String email,
          final String phone,
          @JsonKey(name: 'email_verified_at') final String? emailVerifiedAt,
          final String? password,
          @JsonKey(name: 'paid_seller') final int paidSeller,
          @JsonKey(name: 'deleted_at') final String? deletedAt,
          @JsonKey(name: 'remember_token') final String? rememberToken,
          @JsonKey(name: 'created_at') final String createdAt,
          @JsonKey(name: 'updated_at') final String updatedAt,
          @JsonKey(name: 'country_id') final int countryId,
          @JsonKey(name: 'state_id') final int? stateId,
          @JsonKey(name: 'profile_photo') final String? profilePhoto,
          @JsonKey(name: 'uploads_left') final int? uploadsLeft,
          @JsonKey(name: 'active_status') final int activeStatus,
          final String avatar,
          @JsonKey(name: 'dark_mode') final int darkMode,
          @JsonKey(name: 'messenger_color') final String? messengerColor,
          @JsonKey(name: 'max_created_at') final String maxCreatedAt}) =
      _$ChatContactImpl;

  factory _ChatContact.fromJson(Map<String, dynamic> json) =
      _$ChatContactImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get email;
  @override
  String get phone;
  @override
  @JsonKey(name: 'email_verified_at')
  String? get emailVerifiedAt;
  @override
  String? get password;
  @override
  @JsonKey(name: 'paid_seller')
  int get paidSeller;
  @override
  @JsonKey(name: 'deleted_at')
  String? get deletedAt;
  @override
  @JsonKey(name: 'remember_token')
  String? get rememberToken;
  @override
  @JsonKey(name: 'created_at')
  String get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  String get updatedAt;
  @override
  @JsonKey(name: 'country_id')
  int get countryId;
  @override
  @JsonKey(name: 'state_id')
  int? get stateId;
  @override
  @JsonKey(name: 'profile_photo')
  String? get profilePhoto;
  @override
  @JsonKey(name: 'uploads_left')
  int? get uploadsLeft;
  @override
  @JsonKey(name: 'active_status')
  int get activeStatus;
  @override
  String get avatar;
  @override
  @JsonKey(name: 'dark_mode')
  int get darkMode;
  @override
  @JsonKey(name: 'messenger_color')
  String? get messengerColor;
  @override
  @JsonKey(name: 'max_created_at')
  String get maxCreatedAt;

  /// Create a copy of ChatContact
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChatContactImplCopyWith<_$ChatContactImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
