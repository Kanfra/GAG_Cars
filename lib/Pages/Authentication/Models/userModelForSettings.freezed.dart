// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'userModelForSettings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserModelForSettings _$UserModelForSettingsFromJson(Map<String, dynamic> json) {
  return _UserModelForSettings.fromJson(json);
}

/// @nodoc
mixin _$UserModelForSettings {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  @JsonKey(name: 'email_verified_at')
  DateTime? get emailVerifiedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'paid_seller')
  int get paidSeller => throw _privateConstructorUsedError;
  @JsonKey(name: 'deleted_at')
  DateTime? get deletedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'country_id')
  String? get countryId => throw _privateConstructorUsedError;
  @JsonKey(name: 'state_id')
  String? get stateId => throw _privateConstructorUsedError;
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

  /// Serializes this UserModelForSettings to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserModelForSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserModelForSettingsCopyWith<UserModelForSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelForSettingsCopyWith<$Res> {
  factory $UserModelForSettingsCopyWith(UserModelForSettings value,
          $Res Function(UserModelForSettings) then) =
      _$UserModelForSettingsCopyWithImpl<$Res, UserModelForSettings>;
  @useResult
  $Res call(
      {String id,
      String name,
      String email,
      String phone,
      @JsonKey(name: 'email_verified_at') DateTime? emailVerifiedAt,
      @JsonKey(name: 'paid_seller') int paidSeller,
      @JsonKey(name: 'deleted_at') DateTime? deletedAt,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt,
      @JsonKey(name: 'country_id') String? countryId,
      @JsonKey(name: 'state_id') String? stateId,
      @JsonKey(name: 'profile_photo') String? profilePhoto,
      @JsonKey(name: 'uploads_left') int? uploadsLeft,
      @JsonKey(name: 'active_status') int activeStatus,
      String avatar,
      @JsonKey(name: 'dark_mode') int darkMode,
      @JsonKey(name: 'messenger_color') String? messengerColor});
}

/// @nodoc
class _$UserModelForSettingsCopyWithImpl<$Res,
        $Val extends UserModelForSettings>
    implements $UserModelForSettingsCopyWith<$Res> {
  _$UserModelForSettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserModelForSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = null,
    Object? phone = null,
    Object? emailVerifiedAt = freezed,
    Object? paidSeller = null,
    Object? deletedAt = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? countryId = freezed,
    Object? stateId = freezed,
    Object? profilePhoto = freezed,
    Object? uploadsLeft = freezed,
    Object? activeStatus = null,
    Object? avatar = null,
    Object? darkMode = null,
    Object? messengerColor = freezed,
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
              as DateTime?,
      paidSeller: null == paidSeller
          ? _value.paidSeller
          : paidSeller // ignore: cast_nullable_to_non_nullable
              as int,
      deletedAt: freezed == deletedAt
          ? _value.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      countryId: freezed == countryId
          ? _value.countryId
          : countryId // ignore: cast_nullable_to_non_nullable
              as String?,
      stateId: freezed == stateId
          ? _value.stateId
          : stateId // ignore: cast_nullable_to_non_nullable
              as String?,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserModelForSettingsImplCopyWith<$Res>
    implements $UserModelForSettingsCopyWith<$Res> {
  factory _$$UserModelForSettingsImplCopyWith(_$UserModelForSettingsImpl value,
          $Res Function(_$UserModelForSettingsImpl) then) =
      __$$UserModelForSettingsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String email,
      String phone,
      @JsonKey(name: 'email_verified_at') DateTime? emailVerifiedAt,
      @JsonKey(name: 'paid_seller') int paidSeller,
      @JsonKey(name: 'deleted_at') DateTime? deletedAt,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt,
      @JsonKey(name: 'country_id') String? countryId,
      @JsonKey(name: 'state_id') String? stateId,
      @JsonKey(name: 'profile_photo') String? profilePhoto,
      @JsonKey(name: 'uploads_left') int? uploadsLeft,
      @JsonKey(name: 'active_status') int activeStatus,
      String avatar,
      @JsonKey(name: 'dark_mode') int darkMode,
      @JsonKey(name: 'messenger_color') String? messengerColor});
}

/// @nodoc
class __$$UserModelForSettingsImplCopyWithImpl<$Res>
    extends _$UserModelForSettingsCopyWithImpl<$Res, _$UserModelForSettingsImpl>
    implements _$$UserModelForSettingsImplCopyWith<$Res> {
  __$$UserModelForSettingsImplCopyWithImpl(_$UserModelForSettingsImpl _value,
      $Res Function(_$UserModelForSettingsImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserModelForSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = null,
    Object? phone = null,
    Object? emailVerifiedAt = freezed,
    Object? paidSeller = null,
    Object? deletedAt = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? countryId = freezed,
    Object? stateId = freezed,
    Object? profilePhoto = freezed,
    Object? uploadsLeft = freezed,
    Object? activeStatus = null,
    Object? avatar = null,
    Object? darkMode = null,
    Object? messengerColor = freezed,
  }) {
    return _then(_$UserModelForSettingsImpl(
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
              as DateTime?,
      paidSeller: null == paidSeller
          ? _value.paidSeller
          : paidSeller // ignore: cast_nullable_to_non_nullable
              as int,
      deletedAt: freezed == deletedAt
          ? _value.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      countryId: freezed == countryId
          ? _value.countryId
          : countryId // ignore: cast_nullable_to_non_nullable
              as String?,
      stateId: freezed == stateId
          ? _value.stateId
          : stateId // ignore: cast_nullable_to_non_nullable
              as String?,
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserModelForSettingsImpl implements _UserModelForSettings {
  const _$UserModelForSettingsImpl(
      {required this.id,
      required this.name,
      required this.email,
      required this.phone,
      @JsonKey(name: 'email_verified_at') this.emailVerifiedAt,
      @JsonKey(name: 'paid_seller') required this.paidSeller,
      @JsonKey(name: 'deleted_at') this.deletedAt,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') required this.updatedAt,
      @JsonKey(name: 'country_id') this.countryId,
      @JsonKey(name: 'state_id') this.stateId,
      @JsonKey(name: 'profile_photo') this.profilePhoto,
      @JsonKey(name: 'uploads_left') this.uploadsLeft,
      @JsonKey(name: 'active_status') required this.activeStatus,
      required this.avatar,
      @JsonKey(name: 'dark_mode') required this.darkMode,
      @JsonKey(name: 'messenger_color') this.messengerColor});

  factory _$UserModelForSettingsImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserModelForSettingsImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String email;
  @override
  final String phone;
  @override
  @JsonKey(name: 'email_verified_at')
  final DateTime? emailVerifiedAt;
  @override
  @JsonKey(name: 'paid_seller')
  final int paidSeller;
  @override
  @JsonKey(name: 'deleted_at')
  final DateTime? deletedAt;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;
  @override
  @JsonKey(name: 'country_id')
  final String? countryId;
  @override
  @JsonKey(name: 'state_id')
  final String? stateId;
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
  final String avatar;
  @override
  @JsonKey(name: 'dark_mode')
  final int darkMode;
  @override
  @JsonKey(name: 'messenger_color')
  final String? messengerColor;

  @override
  String toString() {
    return 'UserModelForSettings(id: $id, name: $name, email: $email, phone: $phone, emailVerifiedAt: $emailVerifiedAt, paidSeller: $paidSeller, deletedAt: $deletedAt, createdAt: $createdAt, updatedAt: $updatedAt, countryId: $countryId, stateId: $stateId, profilePhoto: $profilePhoto, uploadsLeft: $uploadsLeft, activeStatus: $activeStatus, avatar: $avatar, darkMode: $darkMode, messengerColor: $messengerColor)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserModelForSettingsImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.emailVerifiedAt, emailVerifiedAt) ||
                other.emailVerifiedAt == emailVerifiedAt) &&
            (identical(other.paidSeller, paidSeller) ||
                other.paidSeller == paidSeller) &&
            (identical(other.deletedAt, deletedAt) ||
                other.deletedAt == deletedAt) &&
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
                other.messengerColor == messengerColor));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      email,
      phone,
      emailVerifiedAt,
      paidSeller,
      deletedAt,
      createdAt,
      updatedAt,
      countryId,
      stateId,
      profilePhoto,
      uploadsLeft,
      activeStatus,
      avatar,
      darkMode,
      messengerColor);

  /// Create a copy of UserModelForSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserModelForSettingsImplCopyWith<_$UserModelForSettingsImpl>
      get copyWith =>
          __$$UserModelForSettingsImplCopyWithImpl<_$UserModelForSettingsImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserModelForSettingsImplToJson(
      this,
    );
  }
}

abstract class _UserModelForSettings implements UserModelForSettings {
  const factory _UserModelForSettings(
          {required final String id,
          required final String name,
          required final String email,
          required final String phone,
          @JsonKey(name: 'email_verified_at') final DateTime? emailVerifiedAt,
          @JsonKey(name: 'paid_seller') required final int paidSeller,
          @JsonKey(name: 'deleted_at') final DateTime? deletedAt,
          @JsonKey(name: 'created_at') required final DateTime createdAt,
          @JsonKey(name: 'updated_at') required final DateTime updatedAt,
          @JsonKey(name: 'country_id') final String? countryId,
          @JsonKey(name: 'state_id') final String? stateId,
          @JsonKey(name: 'profile_photo') final String? profilePhoto,
          @JsonKey(name: 'uploads_left') final int? uploadsLeft,
          @JsonKey(name: 'active_status') required final int activeStatus,
          required final String avatar,
          @JsonKey(name: 'dark_mode') required final int darkMode,
          @JsonKey(name: 'messenger_color') final String? messengerColor}) =
      _$UserModelForSettingsImpl;

  factory _UserModelForSettings.fromJson(Map<String, dynamic> json) =
      _$UserModelForSettingsImpl.fromJson;

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
  DateTime? get emailVerifiedAt;
  @override
  @JsonKey(name: 'paid_seller')
  int get paidSeller;
  @override
  @JsonKey(name: 'deleted_at')
  DateTime? get deletedAt;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt;
  @override
  @JsonKey(name: 'country_id')
  String? get countryId;
  @override
  @JsonKey(name: 'state_id')
  String? get stateId;
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

  /// Create a copy of UserModelForSettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserModelForSettingsImplCopyWith<_$UserModelForSettingsImpl>
      get copyWith => throw _privateConstructorUsedError;
}
