// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _UserModel.fromJson(json);
}

/// @nodoc
mixin _$UserModel {
  String? get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String? get password => throw _privateConstructorUsedError;
  @JsonKey(name: 'phone')
  String? get phoneNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'paid_seller')
  int? get paidSeller => throw _privateConstructorUsedError;
  @JsonKey(name: 'email_verified_at')
  DateTime? get emailVerifiedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'country_id')
  int? get countryId => throw _privateConstructorUsedError;
  @JsonKey(name: 'state_id')
  int? get stateId => throw _privateConstructorUsedError;
  @JsonKey(name: 'profile_photo')
  String? get profileImage => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'deleted_at')
  DateTime? get deletedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'uploads_left')
  int? get uploadsLeft => throw _privateConstructorUsedError;
  @JsonKey(name: 'active_status')
  int? get activeStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'avatar')
  String? get avatar => throw _privateConstructorUsedError;
  @JsonKey(name: 'dark_mode')
  int? get darkMode => throw _privateConstructorUsedError;
  @JsonKey(name: 'messenger_color')
  String? get messengerColor => throw _privateConstructorUsedError;

  /// Serializes this UserModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res, UserModel>;
  @useResult
  $Res call(
      {String? id,
      String name,
      String email,
      String? password,
      @JsonKey(name: 'phone') String? phoneNumber,
      @JsonKey(name: 'paid_seller') int? paidSeller,
      @JsonKey(name: 'email_verified_at') DateTime? emailVerifiedAt,
      @JsonKey(name: 'country_id') int? countryId,
      @JsonKey(name: 'state_id') int? stateId,
      @JsonKey(name: 'profile_photo') String? profileImage,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt,
      @JsonKey(name: 'deleted_at') DateTime? deletedAt,
      @JsonKey(name: 'uploads_left') int? uploadsLeft,
      @JsonKey(name: 'active_status') int? activeStatus,
      @JsonKey(name: 'avatar') String? avatar,
      @JsonKey(name: 'dark_mode') int? darkMode,
      @JsonKey(name: 'messenger_color') String? messengerColor});
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res, $Val extends UserModel>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? email = null,
    Object? password = freezed,
    Object? phoneNumber = freezed,
    Object? paidSeller = freezed,
    Object? emailVerifiedAt = freezed,
    Object? countryId = freezed,
    Object? stateId = freezed,
    Object? profileImage = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? deletedAt = freezed,
    Object? uploadsLeft = freezed,
    Object? activeStatus = freezed,
    Object? avatar = freezed,
    Object? darkMode = freezed,
    Object? messengerColor = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      paidSeller: freezed == paidSeller
          ? _value.paidSeller
          : paidSeller // ignore: cast_nullable_to_non_nullable
              as int?,
      emailVerifiedAt: freezed == emailVerifiedAt
          ? _value.emailVerifiedAt
          : emailVerifiedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      countryId: freezed == countryId
          ? _value.countryId
          : countryId // ignore: cast_nullable_to_non_nullable
              as int?,
      stateId: freezed == stateId
          ? _value.stateId
          : stateId // ignore: cast_nullable_to_non_nullable
              as int?,
      profileImage: freezed == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      deletedAt: freezed == deletedAt
          ? _value.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      uploadsLeft: freezed == uploadsLeft
          ? _value.uploadsLeft
          : uploadsLeft // ignore: cast_nullable_to_non_nullable
              as int?,
      activeStatus: freezed == activeStatus
          ? _value.activeStatus
          : activeStatus // ignore: cast_nullable_to_non_nullable
              as int?,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      darkMode: freezed == darkMode
          ? _value.darkMode
          : darkMode // ignore: cast_nullable_to_non_nullable
              as int?,
      messengerColor: freezed == messengerColor
          ? _value.messengerColor
          : messengerColor // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserModelImplCopyWith<$Res>
    implements $UserModelCopyWith<$Res> {
  factory _$$UserModelImplCopyWith(
          _$UserModelImpl value, $Res Function(_$UserModelImpl) then) =
      __$$UserModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String name,
      String email,
      String? password,
      @JsonKey(name: 'phone') String? phoneNumber,
      @JsonKey(name: 'paid_seller') int? paidSeller,
      @JsonKey(name: 'email_verified_at') DateTime? emailVerifiedAt,
      @JsonKey(name: 'country_id') int? countryId,
      @JsonKey(name: 'state_id') int? stateId,
      @JsonKey(name: 'profile_photo') String? profileImage,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt,
      @JsonKey(name: 'deleted_at') DateTime? deletedAt,
      @JsonKey(name: 'uploads_left') int? uploadsLeft,
      @JsonKey(name: 'active_status') int? activeStatus,
      @JsonKey(name: 'avatar') String? avatar,
      @JsonKey(name: 'dark_mode') int? darkMode,
      @JsonKey(name: 'messenger_color') String? messengerColor});
}

/// @nodoc
class __$$UserModelImplCopyWithImpl<$Res>
    extends _$UserModelCopyWithImpl<$Res, _$UserModelImpl>
    implements _$$UserModelImplCopyWith<$Res> {
  __$$UserModelImplCopyWithImpl(
      _$UserModelImpl _value, $Res Function(_$UserModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? email = null,
    Object? password = freezed,
    Object? phoneNumber = freezed,
    Object? paidSeller = freezed,
    Object? emailVerifiedAt = freezed,
    Object? countryId = freezed,
    Object? stateId = freezed,
    Object? profileImage = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? deletedAt = freezed,
    Object? uploadsLeft = freezed,
    Object? activeStatus = freezed,
    Object? avatar = freezed,
    Object? darkMode = freezed,
    Object? messengerColor = freezed,
  }) {
    return _then(_$UserModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      paidSeller: freezed == paidSeller
          ? _value.paidSeller
          : paidSeller // ignore: cast_nullable_to_non_nullable
              as int?,
      emailVerifiedAt: freezed == emailVerifiedAt
          ? _value.emailVerifiedAt
          : emailVerifiedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      countryId: freezed == countryId
          ? _value.countryId
          : countryId // ignore: cast_nullable_to_non_nullable
              as int?,
      stateId: freezed == stateId
          ? _value.stateId
          : stateId // ignore: cast_nullable_to_non_nullable
              as int?,
      profileImage: freezed == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      deletedAt: freezed == deletedAt
          ? _value.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      uploadsLeft: freezed == uploadsLeft
          ? _value.uploadsLeft
          : uploadsLeft // ignore: cast_nullable_to_non_nullable
              as int?,
      activeStatus: freezed == activeStatus
          ? _value.activeStatus
          : activeStatus // ignore: cast_nullable_to_non_nullable
              as int?,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      darkMode: freezed == darkMode
          ? _value.darkMode
          : darkMode // ignore: cast_nullable_to_non_nullable
              as int?,
      messengerColor: freezed == messengerColor
          ? _value.messengerColor
          : messengerColor // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$UserModelImpl extends _UserModel {
  const _$UserModelImpl(
      {this.id,
      required this.name,
      required this.email,
      this.password,
      @JsonKey(name: 'phone') this.phoneNumber,
      @JsonKey(name: 'paid_seller') this.paidSeller,
      @JsonKey(name: 'email_verified_at') this.emailVerifiedAt,
      @JsonKey(name: 'country_id') this.countryId,
      @JsonKey(name: 'state_id') this.stateId,
      @JsonKey(name: 'profile_photo') this.profileImage,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt,
      @JsonKey(name: 'deleted_at') this.deletedAt,
      @JsonKey(name: 'uploads_left') this.uploadsLeft,
      @JsonKey(name: 'active_status') this.activeStatus,
      @JsonKey(name: 'avatar') this.avatar,
      @JsonKey(name: 'dark_mode') this.darkMode,
      @JsonKey(name: 'messenger_color') this.messengerColor})
      : super._();

  factory _$UserModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserModelImplFromJson(json);

  @override
  final String? id;
  @override
  final String name;
  @override
  final String email;
  @override
  final String? password;
  @override
  @JsonKey(name: 'phone')
  final String? phoneNumber;
  @override
  @JsonKey(name: 'paid_seller')
  final int? paidSeller;
  @override
  @JsonKey(name: 'email_verified_at')
  final DateTime? emailVerifiedAt;
  @override
  @JsonKey(name: 'country_id')
  final int? countryId;
  @override
  @JsonKey(name: 'state_id')
  final int? stateId;
  @override
  @JsonKey(name: 'profile_photo')
  final String? profileImage;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;
  @override
  @JsonKey(name: 'deleted_at')
  final DateTime? deletedAt;
  @override
  @JsonKey(name: 'uploads_left')
  final int? uploadsLeft;
  @override
  @JsonKey(name: 'active_status')
  final int? activeStatus;
  @override
  @JsonKey(name: 'avatar')
  final String? avatar;
  @override
  @JsonKey(name: 'dark_mode')
  final int? darkMode;
  @override
  @JsonKey(name: 'messenger_color')
  final String? messengerColor;

  @override
  String toString() {
    return 'UserModel(id: $id, name: $name, email: $email, password: $password, phoneNumber: $phoneNumber, paidSeller: $paidSeller, emailVerifiedAt: $emailVerifiedAt, countryId: $countryId, stateId: $stateId, profileImage: $profileImage, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt, uploadsLeft: $uploadsLeft, activeStatus: $activeStatus, avatar: $avatar, darkMode: $darkMode, messengerColor: $messengerColor)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.paidSeller, paidSeller) ||
                other.paidSeller == paidSeller) &&
            (identical(other.emailVerifiedAt, emailVerifiedAt) ||
                other.emailVerifiedAt == emailVerifiedAt) &&
            (identical(other.countryId, countryId) ||
                other.countryId == countryId) &&
            (identical(other.stateId, stateId) || other.stateId == stateId) &&
            (identical(other.profileImage, profileImage) ||
                other.profileImage == profileImage) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.deletedAt, deletedAt) ||
                other.deletedAt == deletedAt) &&
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
      password,
      phoneNumber,
      paidSeller,
      emailVerifiedAt,
      countryId,
      stateId,
      profileImage,
      createdAt,
      updatedAt,
      deletedAt,
      uploadsLeft,
      activeStatus,
      avatar,
      darkMode,
      messengerColor);

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      __$$UserModelImplCopyWithImpl<_$UserModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserModelImplToJson(
      this,
    );
  }
}

abstract class _UserModel extends UserModel {
  const factory _UserModel(
          {final String? id,
          required final String name,
          required final String email,
          final String? password,
          @JsonKey(name: 'phone') final String? phoneNumber,
          @JsonKey(name: 'paid_seller') final int? paidSeller,
          @JsonKey(name: 'email_verified_at') final DateTime? emailVerifiedAt,
          @JsonKey(name: 'country_id') final int? countryId,
          @JsonKey(name: 'state_id') final int? stateId,
          @JsonKey(name: 'profile_photo') final String? profileImage,
          @JsonKey(name: 'created_at') final DateTime? createdAt,
          @JsonKey(name: 'updated_at') final DateTime? updatedAt,
          @JsonKey(name: 'deleted_at') final DateTime? deletedAt,
          @JsonKey(name: 'uploads_left') final int? uploadsLeft,
          @JsonKey(name: 'active_status') final int? activeStatus,
          @JsonKey(name: 'avatar') final String? avatar,
          @JsonKey(name: 'dark_mode') final int? darkMode,
          @JsonKey(name: 'messenger_color') final String? messengerColor}) =
      _$UserModelImpl;
  const _UserModel._() : super._();

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$UserModelImpl.fromJson;

  @override
  String? get id;
  @override
  String get name;
  @override
  String get email;
  @override
  String? get password;
  @override
  @JsonKey(name: 'phone')
  String? get phoneNumber;
  @override
  @JsonKey(name: 'paid_seller')
  int? get paidSeller;
  @override
  @JsonKey(name: 'email_verified_at')
  DateTime? get emailVerifiedAt;
  @override
  @JsonKey(name: 'country_id')
  int? get countryId;
  @override
  @JsonKey(name: 'state_id')
  int? get stateId;
  @override
  @JsonKey(name: 'profile_photo')
  String? get profileImage;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt;
  @override
  @JsonKey(name: 'deleted_at')
  DateTime? get deletedAt;
  @override
  @JsonKey(name: 'uploads_left')
  int? get uploadsLeft;
  @override
  @JsonKey(name: 'active_status')
  int? get activeStatus;
  @override
  @JsonKey(name: 'avatar')
  String? get avatar;
  @override
  @JsonKey(name: 'dark_mode')
  int? get darkMode;
  @override
  @JsonKey(name: 'messenger_color')
  String? get messengerColor;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
