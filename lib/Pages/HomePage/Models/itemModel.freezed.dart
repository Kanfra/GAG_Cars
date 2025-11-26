// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'itemModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  @JsonKey(fromJson: _parseDynamicToString)
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  @JsonKey(name: 'email_verified_at')
  DateTime? get emailVerifiedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'paid_seller', fromJson: _parseDynamicToInt)
  int? get paidSeller => throw _privateConstructorUsedError;
  @JsonKey(name: 'deleted_at')
  DateTime? get deletedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'country_id', fromJson: _parseDynamicToInt)
  int? get countryId => throw _privateConstructorUsedError;
  @JsonKey(name: 'state_id', fromJson: _parseDynamicToInt)
  int? get stateId => throw _privateConstructorUsedError;
  @JsonKey(name: 'profile_photo', fromJson: _parseDynamicToString)
  String? get profilePhoto => throw _privateConstructorUsedError;

  /// Serializes this User to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call(
      {@JsonKey(fromJson: _parseDynamicToString) String id,
      String name,
      String email,
      String? phone,
      @JsonKey(name: 'email_verified_at') DateTime? emailVerifiedAt,
      @JsonKey(name: 'paid_seller', fromJson: _parseDynamicToInt)
      int? paidSeller,
      @JsonKey(name: 'deleted_at') DateTime? deletedAt,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt,
      @JsonKey(name: 'country_id', fromJson: _parseDynamicToInt) int? countryId,
      @JsonKey(name: 'state_id', fromJson: _parseDynamicToInt) int? stateId,
      @JsonKey(name: 'profile_photo', fromJson: _parseDynamicToString)
      String? profilePhoto});
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = null,
    Object? phone = freezed,
    Object? emailVerifiedAt = freezed,
    Object? paidSeller = freezed,
    Object? deletedAt = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? countryId = freezed,
    Object? stateId = freezed,
    Object? profilePhoto = freezed,
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
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      emailVerifiedAt: freezed == emailVerifiedAt
          ? _value.emailVerifiedAt
          : emailVerifiedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      paidSeller: freezed == paidSeller
          ? _value.paidSeller
          : paidSeller // ignore: cast_nullable_to_non_nullable
              as int?,
      deletedAt: freezed == deletedAt
          ? _value.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      countryId: freezed == countryId
          ? _value.countryId
          : countryId // ignore: cast_nullable_to_non_nullable
              as int?,
      stateId: freezed == stateId
          ? _value.stateId
          : stateId // ignore: cast_nullable_to_non_nullable
              as int?,
      profilePhoto: freezed == profilePhoto
          ? _value.profilePhoto
          : profilePhoto // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserImplCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$UserImplCopyWith(
          _$UserImpl value, $Res Function(_$UserImpl) then) =
      __$$UserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(fromJson: _parseDynamicToString) String id,
      String name,
      String email,
      String? phone,
      @JsonKey(name: 'email_verified_at') DateTime? emailVerifiedAt,
      @JsonKey(name: 'paid_seller', fromJson: _parseDynamicToInt)
      int? paidSeller,
      @JsonKey(name: 'deleted_at') DateTime? deletedAt,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt,
      @JsonKey(name: 'country_id', fromJson: _parseDynamicToInt) int? countryId,
      @JsonKey(name: 'state_id', fromJson: _parseDynamicToInt) int? stateId,
      @JsonKey(name: 'profile_photo', fromJson: _parseDynamicToString)
      String? profilePhoto});
}

/// @nodoc
class __$$UserImplCopyWithImpl<$Res>
    extends _$UserCopyWithImpl<$Res, _$UserImpl>
    implements _$$UserImplCopyWith<$Res> {
  __$$UserImplCopyWithImpl(_$UserImpl _value, $Res Function(_$UserImpl) _then)
      : super(_value, _then);

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = null,
    Object? phone = freezed,
    Object? emailVerifiedAt = freezed,
    Object? paidSeller = freezed,
    Object? deletedAt = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? countryId = freezed,
    Object? stateId = freezed,
    Object? profilePhoto = freezed,
  }) {
    return _then(_$UserImpl(
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
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      emailVerifiedAt: freezed == emailVerifiedAt
          ? _value.emailVerifiedAt
          : emailVerifiedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      paidSeller: freezed == paidSeller
          ? _value.paidSeller
          : paidSeller // ignore: cast_nullable_to_non_nullable
              as int?,
      deletedAt: freezed == deletedAt
          ? _value.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      countryId: freezed == countryId
          ? _value.countryId
          : countryId // ignore: cast_nullable_to_non_nullable
              as int?,
      stateId: freezed == stateId
          ? _value.stateId
          : stateId // ignore: cast_nullable_to_non_nullable
              as int?,
      profilePhoto: freezed == profilePhoto
          ? _value.profilePhoto
          : profilePhoto // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserImpl with DiagnosticableTreeMixin implements _User {
  const _$UserImpl(
      {@JsonKey(fromJson: _parseDynamicToString) required this.id,
      required this.name,
      required this.email,
      this.phone,
      @JsonKey(name: 'email_verified_at') this.emailVerifiedAt,
      @JsonKey(name: 'paid_seller', fromJson: _parseDynamicToInt)
      this.paidSeller,
      @JsonKey(name: 'deleted_at') this.deletedAt,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt,
      @JsonKey(name: 'country_id', fromJson: _parseDynamicToInt) this.countryId,
      @JsonKey(name: 'state_id', fromJson: _parseDynamicToInt) this.stateId,
      @JsonKey(name: 'profile_photo', fromJson: _parseDynamicToString)
      this.profilePhoto});

  factory _$UserImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserImplFromJson(json);

  @override
  @JsonKey(fromJson: _parseDynamicToString)
  final String id;
  @override
  final String name;
  @override
  final String email;
  @override
  final String? phone;
  @override
  @JsonKey(name: 'email_verified_at')
  final DateTime? emailVerifiedAt;
  @override
  @JsonKey(name: 'paid_seller', fromJson: _parseDynamicToInt)
  final int? paidSeller;
  @override
  @JsonKey(name: 'deleted_at')
  final DateTime? deletedAt;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;
  @override
  @JsonKey(name: 'country_id', fromJson: _parseDynamicToInt)
  final int? countryId;
  @override
  @JsonKey(name: 'state_id', fromJson: _parseDynamicToInt)
  final int? stateId;
  @override
  @JsonKey(name: 'profile_photo', fromJson: _parseDynamicToString)
  final String? profilePhoto;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'User(id: $id, name: $name, email: $email, phone: $phone, emailVerifiedAt: $emailVerifiedAt, paidSeller: $paidSeller, deletedAt: $deletedAt, createdAt: $createdAt, updatedAt: $updatedAt, countryId: $countryId, stateId: $stateId, profilePhoto: $profilePhoto)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'User'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('phone', phone))
      ..add(DiagnosticsProperty('emailVerifiedAt', emailVerifiedAt))
      ..add(DiagnosticsProperty('paidSeller', paidSeller))
      ..add(DiagnosticsProperty('deletedAt', deletedAt))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('updatedAt', updatedAt))
      ..add(DiagnosticsProperty('countryId', countryId))
      ..add(DiagnosticsProperty('stateId', stateId))
      ..add(DiagnosticsProperty('profilePhoto', profilePhoto));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserImpl &&
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
                other.profilePhoto == profilePhoto));
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
      profilePhoto);

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      __$$UserImplCopyWithImpl<_$UserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserImplToJson(
      this,
    );
  }
}

abstract class _User implements User {
  const factory _User(
      {@JsonKey(fromJson: _parseDynamicToString) required final String id,
      required final String name,
      required final String email,
      final String? phone,
      @JsonKey(name: 'email_verified_at') final DateTime? emailVerifiedAt,
      @JsonKey(name: 'paid_seller', fromJson: _parseDynamicToInt)
      final int? paidSeller,
      @JsonKey(name: 'deleted_at') final DateTime? deletedAt,
      @JsonKey(name: 'created_at') final DateTime? createdAt,
      @JsonKey(name: 'updated_at') final DateTime? updatedAt,
      @JsonKey(name: 'country_id', fromJson: _parseDynamicToInt)
      final int? countryId,
      @JsonKey(name: 'state_id', fromJson: _parseDynamicToInt)
      final int? stateId,
      @JsonKey(name: 'profile_photo', fromJson: _parseDynamicToString)
      final String? profilePhoto}) = _$UserImpl;

  factory _User.fromJson(Map<String, dynamic> json) = _$UserImpl.fromJson;

  @override
  @JsonKey(fromJson: _parseDynamicToString)
  String get id;
  @override
  String get name;
  @override
  String get email;
  @override
  String? get phone;
  @override
  @JsonKey(name: 'email_verified_at')
  DateTime? get emailVerifiedAt;
  @override
  @JsonKey(name: 'paid_seller', fromJson: _parseDynamicToInt)
  int? get paidSeller;
  @override
  @JsonKey(name: 'deleted_at')
  DateTime? get deletedAt;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt;
  @override
  @JsonKey(name: 'country_id', fromJson: _parseDynamicToInt)
  int? get countryId;
  @override
  @JsonKey(name: 'state_id', fromJson: _parseDynamicToInt)
  int? get stateId;
  @override
  @JsonKey(name: 'profile_photo', fromJson: _parseDynamicToString)
  String? get profilePhoto;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Brand _$BrandFromJson(Map<String, dynamic> json) {
  return _Brand.fromJson(json);
}

/// @nodoc
mixin _$Brand {
  @JsonKey(fromJson: _parseDynamicToInt)
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id', fromJson: _parseDynamicToString)
  String? get userId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get slug => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _parseDynamicToString)
  String? get image => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this Brand to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Brand
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BrandCopyWith<Brand> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BrandCopyWith<$Res> {
  factory $BrandCopyWith(Brand value, $Res Function(Brand) then) =
      _$BrandCopyWithImpl<$Res, Brand>;
  @useResult
  $Res call(
      {@JsonKey(fromJson: _parseDynamicToInt) int id,
      @JsonKey(name: 'user_id', fromJson: _parseDynamicToString) String? userId,
      String name,
      String slug,
      @JsonKey(fromJson: _parseDynamicToString) String? image,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt});
}

/// @nodoc
class _$BrandCopyWithImpl<$Res, $Val extends Brand>
    implements $BrandCopyWith<$Res> {
  _$BrandCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Brand
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = freezed,
    Object? name = null,
    Object? slug = null,
    Object? image = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      slug: null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BrandImplCopyWith<$Res> implements $BrandCopyWith<$Res> {
  factory _$$BrandImplCopyWith(
          _$BrandImpl value, $Res Function(_$BrandImpl) then) =
      __$$BrandImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(fromJson: _parseDynamicToInt) int id,
      @JsonKey(name: 'user_id', fromJson: _parseDynamicToString) String? userId,
      String name,
      String slug,
      @JsonKey(fromJson: _parseDynamicToString) String? image,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt});
}

/// @nodoc
class __$$BrandImplCopyWithImpl<$Res>
    extends _$BrandCopyWithImpl<$Res, _$BrandImpl>
    implements _$$BrandImplCopyWith<$Res> {
  __$$BrandImplCopyWithImpl(
      _$BrandImpl _value, $Res Function(_$BrandImpl) _then)
      : super(_value, _then);

  /// Create a copy of Brand
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = freezed,
    Object? name = null,
    Object? slug = null,
    Object? image = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$BrandImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      slug: null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BrandImpl with DiagnosticableTreeMixin implements _Brand {
  const _$BrandImpl(
      {@JsonKey(fromJson: _parseDynamicToInt) required this.id,
      @JsonKey(name: 'user_id', fromJson: _parseDynamicToString) this.userId,
      required this.name,
      required this.slug,
      @JsonKey(fromJson: _parseDynamicToString) this.image,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt});

  factory _$BrandImpl.fromJson(Map<String, dynamic> json) =>
      _$$BrandImplFromJson(json);

  @override
  @JsonKey(fromJson: _parseDynamicToInt)
  final int id;
  @override
  @JsonKey(name: 'user_id', fromJson: _parseDynamicToString)
  final String? userId;
  @override
  final String name;
  @override
  final String slug;
  @override
  @JsonKey(fromJson: _parseDynamicToString)
  final String? image;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Brand(id: $id, userId: $userId, name: $name, slug: $slug, image: $image, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Brand'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('userId', userId))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('slug', slug))
      ..add(DiagnosticsProperty('image', image))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('updatedAt', updatedAt));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BrandImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, userId, name, slug, image, createdAt, updatedAt);

  /// Create a copy of Brand
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BrandImplCopyWith<_$BrandImpl> get copyWith =>
      __$$BrandImplCopyWithImpl<_$BrandImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BrandImplToJson(
      this,
    );
  }
}

abstract class _Brand implements Brand {
  const factory _Brand(
      {@JsonKey(fromJson: _parseDynamicToInt) required final int id,
      @JsonKey(name: 'user_id', fromJson: _parseDynamicToString)
      final String? userId,
      required final String name,
      required final String slug,
      @JsonKey(fromJson: _parseDynamicToString) final String? image,
      @JsonKey(name: 'created_at') final DateTime? createdAt,
      @JsonKey(name: 'updated_at') final DateTime? updatedAt}) = _$BrandImpl;

  factory _Brand.fromJson(Map<String, dynamic> json) = _$BrandImpl.fromJson;

  @override
  @JsonKey(fromJson: _parseDynamicToInt)
  int get id;
  @override
  @JsonKey(name: 'user_id', fromJson: _parseDynamicToString)
  String? get userId;
  @override
  String get name;
  @override
  String get slug;
  @override
  @JsonKey(fromJson: _parseDynamicToString)
  String? get image;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt;

  /// Create a copy of Brand
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BrandImplCopyWith<_$BrandImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BrandModel _$BrandModelFromJson(Map<String, dynamic> json) {
  return _BrandModel.fromJson(json);
}

/// @nodoc
mixin _$BrandModel {
  @JsonKey(fromJson: _parseDynamicToInt)
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'brand_id', fromJson: _parseDynamicToInt)
  int get brandId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get slug => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this BrandModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BrandModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BrandModelCopyWith<BrandModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BrandModelCopyWith<$Res> {
  factory $BrandModelCopyWith(
          BrandModel value, $Res Function(BrandModel) then) =
      _$BrandModelCopyWithImpl<$Res, BrandModel>;
  @useResult
  $Res call(
      {@JsonKey(fromJson: _parseDynamicToInt) int id,
      @JsonKey(name: 'brand_id', fromJson: _parseDynamicToInt) int brandId,
      String name,
      String slug,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt});
}

/// @nodoc
class _$BrandModelCopyWithImpl<$Res, $Val extends BrandModel>
    implements $BrandModelCopyWith<$Res> {
  _$BrandModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BrandModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? brandId = null,
    Object? name = null,
    Object? slug = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      brandId: null == brandId
          ? _value.brandId
          : brandId // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      slug: null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BrandModelImplCopyWith<$Res>
    implements $BrandModelCopyWith<$Res> {
  factory _$$BrandModelImplCopyWith(
          _$BrandModelImpl value, $Res Function(_$BrandModelImpl) then) =
      __$$BrandModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(fromJson: _parseDynamicToInt) int id,
      @JsonKey(name: 'brand_id', fromJson: _parseDynamicToInt) int brandId,
      String name,
      String slug,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt});
}

/// @nodoc
class __$$BrandModelImplCopyWithImpl<$Res>
    extends _$BrandModelCopyWithImpl<$Res, _$BrandModelImpl>
    implements _$$BrandModelImplCopyWith<$Res> {
  __$$BrandModelImplCopyWithImpl(
      _$BrandModelImpl _value, $Res Function(_$BrandModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of BrandModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? brandId = null,
    Object? name = null,
    Object? slug = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$BrandModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      brandId: null == brandId
          ? _value.brandId
          : brandId // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      slug: null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BrandModelImpl with DiagnosticableTreeMixin implements _BrandModel {
  const _$BrandModelImpl(
      {@JsonKey(fromJson: _parseDynamicToInt) required this.id,
      @JsonKey(name: 'brand_id', fromJson: _parseDynamicToInt)
      required this.brandId,
      required this.name,
      required this.slug,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt});

  factory _$BrandModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BrandModelImplFromJson(json);

  @override
  @JsonKey(fromJson: _parseDynamicToInt)
  final int id;
  @override
  @JsonKey(name: 'brand_id', fromJson: _parseDynamicToInt)
  final int brandId;
  @override
  final String name;
  @override
  final String slug;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BrandModel(id: $id, brandId: $brandId, name: $name, slug: $slug, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BrandModel'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('brandId', brandId))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('slug', slug))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('updatedAt', updatedAt));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BrandModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.brandId, brandId) || other.brandId == brandId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, brandId, name, slug, createdAt, updatedAt);

  /// Create a copy of BrandModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BrandModelImplCopyWith<_$BrandModelImpl> get copyWith =>
      __$$BrandModelImplCopyWithImpl<_$BrandModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BrandModelImplToJson(
      this,
    );
  }
}

abstract class _BrandModel implements BrandModel {
  const factory _BrandModel(
          {@JsonKey(fromJson: _parseDynamicToInt) required final int id,
          @JsonKey(name: 'brand_id', fromJson: _parseDynamicToInt)
          required final int brandId,
          required final String name,
          required final String slug,
          @JsonKey(name: 'created_at') final DateTime? createdAt,
          @JsonKey(name: 'updated_at') final DateTime? updatedAt}) =
      _$BrandModelImpl;

  factory _BrandModel.fromJson(Map<String, dynamic> json) =
      _$BrandModelImpl.fromJson;

  @override
  @JsonKey(fromJson: _parseDynamicToInt)
  int get id;
  @override
  @JsonKey(name: 'brand_id', fromJson: _parseDynamicToInt)
  int get brandId;
  @override
  String get name;
  @override
  String get slug;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt;

  /// Create a copy of BrandModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BrandModelImplCopyWith<_$BrandModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Category _$CategoryFromJson(Map<String, dynamic> json) {
  return _Category.fromJson(json);
}

/// @nodoc
mixin _$Category {
  @JsonKey(fromJson: _parseDynamicToInt)
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id', fromJson: _parseDynamicToString)
  String? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'parent_id', fromJson: _parseDynamicToInt)
  int? get parentId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get slug => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _parseDynamicToString)
  String? get description => throw _privateConstructorUsedError;
  List<String>? get features => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _parseDynamicToString)
  String? get image => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this Category to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Category
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CategoryCopyWith<Category> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryCopyWith<$Res> {
  factory $CategoryCopyWith(Category value, $Res Function(Category) then) =
      _$CategoryCopyWithImpl<$Res, Category>;
  @useResult
  $Res call(
      {@JsonKey(fromJson: _parseDynamicToInt) int id,
      @JsonKey(name: 'user_id', fromJson: _parseDynamicToString) String? userId,
      @JsonKey(name: 'parent_id', fromJson: _parseDynamicToInt) int? parentId,
      String name,
      String slug,
      @JsonKey(fromJson: _parseDynamicToString) String? description,
      List<String>? features,
      @JsonKey(fromJson: _parseDynamicToString) String? image,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt});
}

/// @nodoc
class _$CategoryCopyWithImpl<$Res, $Val extends Category>
    implements $CategoryCopyWith<$Res> {
  _$CategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Category
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = freezed,
    Object? parentId = freezed,
    Object? name = null,
    Object? slug = null,
    Object? description = freezed,
    Object? features = freezed,
    Object? image = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      parentId: freezed == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as int?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      slug: null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      features: freezed == features
          ? _value.features
          : features // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CategoryImplCopyWith<$Res>
    implements $CategoryCopyWith<$Res> {
  factory _$$CategoryImplCopyWith(
          _$CategoryImpl value, $Res Function(_$CategoryImpl) then) =
      __$$CategoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(fromJson: _parseDynamicToInt) int id,
      @JsonKey(name: 'user_id', fromJson: _parseDynamicToString) String? userId,
      @JsonKey(name: 'parent_id', fromJson: _parseDynamicToInt) int? parentId,
      String name,
      String slug,
      @JsonKey(fromJson: _parseDynamicToString) String? description,
      List<String>? features,
      @JsonKey(fromJson: _parseDynamicToString) String? image,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt});
}

/// @nodoc
class __$$CategoryImplCopyWithImpl<$Res>
    extends _$CategoryCopyWithImpl<$Res, _$CategoryImpl>
    implements _$$CategoryImplCopyWith<$Res> {
  __$$CategoryImplCopyWithImpl(
      _$CategoryImpl _value, $Res Function(_$CategoryImpl) _then)
      : super(_value, _then);

  /// Create a copy of Category
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = freezed,
    Object? parentId = freezed,
    Object? name = null,
    Object? slug = null,
    Object? description = freezed,
    Object? features = freezed,
    Object? image = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$CategoryImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      parentId: freezed == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as int?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      slug: null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      features: freezed == features
          ? _value._features
          : features // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CategoryImpl with DiagnosticableTreeMixin implements _Category {
  const _$CategoryImpl(
      {@JsonKey(fromJson: _parseDynamicToInt) required this.id,
      @JsonKey(name: 'user_id', fromJson: _parseDynamicToString) this.userId,
      @JsonKey(name: 'parent_id', fromJson: _parseDynamicToInt) this.parentId,
      required this.name,
      required this.slug,
      @JsonKey(fromJson: _parseDynamicToString) this.description,
      final List<String>? features,
      @JsonKey(fromJson: _parseDynamicToString) this.image,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt})
      : _features = features;

  factory _$CategoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoryImplFromJson(json);

  @override
  @JsonKey(fromJson: _parseDynamicToInt)
  final int id;
  @override
  @JsonKey(name: 'user_id', fromJson: _parseDynamicToString)
  final String? userId;
  @override
  @JsonKey(name: 'parent_id', fromJson: _parseDynamicToInt)
  final int? parentId;
  @override
  final String name;
  @override
  final String slug;
  @override
  @JsonKey(fromJson: _parseDynamicToString)
  final String? description;
  final List<String>? _features;
  @override
  List<String>? get features {
    final value = _features;
    if (value == null) return null;
    if (_features is EqualUnmodifiableListView) return _features;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(fromJson: _parseDynamicToString)
  final String? image;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Category(id: $id, userId: $userId, parentId: $parentId, name: $name, slug: $slug, description: $description, features: $features, image: $image, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Category'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('userId', userId))
      ..add(DiagnosticsProperty('parentId', parentId))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('slug', slug))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('features', features))
      ..add(DiagnosticsProperty('image', image))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('updatedAt', updatedAt));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.parentId, parentId) ||
                other.parentId == parentId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._features, _features) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      parentId,
      name,
      slug,
      description,
      const DeepCollectionEquality().hash(_features),
      image,
      createdAt,
      updatedAt);

  /// Create a copy of Category
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryImplCopyWith<_$CategoryImpl> get copyWith =>
      __$$CategoryImplCopyWithImpl<_$CategoryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CategoryImplToJson(
      this,
    );
  }
}

abstract class _Category implements Category {
  const factory _Category(
      {@JsonKey(fromJson: _parseDynamicToInt) required final int id,
      @JsonKey(name: 'user_id', fromJson: _parseDynamicToString)
      final String? userId,
      @JsonKey(name: 'parent_id', fromJson: _parseDynamicToInt)
      final int? parentId,
      required final String name,
      required final String slug,
      @JsonKey(fromJson: _parseDynamicToString) final String? description,
      final List<String>? features,
      @JsonKey(fromJson: _parseDynamicToString) final String? image,
      @JsonKey(name: 'created_at') final DateTime? createdAt,
      @JsonKey(name: 'updated_at') final DateTime? updatedAt}) = _$CategoryImpl;

  factory _Category.fromJson(Map<String, dynamic> json) =
      _$CategoryImpl.fromJson;

  @override
  @JsonKey(fromJson: _parseDynamicToInt)
  int get id;
  @override
  @JsonKey(name: 'user_id', fromJson: _parseDynamicToString)
  String? get userId;
  @override
  @JsonKey(name: 'parent_id', fromJson: _parseDynamicToInt)
  int? get parentId;
  @override
  String get name;
  @override
  String get slug;
  @override
  @JsonKey(fromJson: _parseDynamicToString)
  String? get description;
  @override
  List<String>? get features;
  @override
  @JsonKey(fromJson: _parseDynamicToString)
  String? get image;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt;

  /// Create a copy of Category
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CategoryImplCopyWith<_$CategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SingleItem _$SingleItemFromJson(Map<String, dynamic> json) {
  return _SingleItem.fromJson(json);
}

/// @nodoc
mixin _$SingleItem {
  @JsonKey(fromJson: _parseDynamicToString)
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id', fromJson: _parseDynamicToString)
  String? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'country_id', fromJson: _parseDynamicToInt)
  int? get countryId => throw _privateConstructorUsedError;
  @JsonKey(name: 'brand_model_id', fromJson: _parseDynamicToInt)
  int? get brandModelId => throw _privateConstructorUsedError;
  @JsonKey(name: 'brand_id', fromJson: _parseDynamicToInt)
  int? get brandId => throw _privateConstructorUsedError;
  @JsonKey(name: 'category_id', fromJson: _parseDynamicToInt)
  int? get categoryId => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _parseDynamicToString)
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _parseDynamicToString)
  String? get year => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _parseDynamicToString)
  String? get slug => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _parseDynamicToString)
  String? get description => throw _privateConstructorUsedError;
  List<String>? get images => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _parseDynamicToString)
  String? get location => throw _privateConstructorUsedError;
  @JsonKey(name: 'serial_number', fromJson: _parseDynamicToString)
  String? get serialNumber => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _parseDynamicToString)
  String? get condition => throw _privateConstructorUsedError;
  @JsonKey(name: 'steer_position', fromJson: _parseDynamicToString)
  String? get steerPosition => throw _privateConstructorUsedError;
  @JsonKey(name: 'engine_capacity', fromJson: _parseDynamicToString)
  String? get engineCapacity => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _parseDynamicToString)
  String? get transmission => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _parseDynamicToString)
  String? get color => throw _privateConstructorUsedError;
  @JsonKey(name: 'build_type', fromJson: _parseDynamicToString)
  String? get buildType => throw _privateConstructorUsedError;
  @JsonKey(name: 'number_of_passengers', fromJson: _parseDynamicToInt)
  int? get numberOfPassengers => throw _privateConstructorUsedError;
  List<String>? get features => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _parseDynamicToString)
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _parseDynamicToString)
  String? get price => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _parseDynamicToString)
  String? get mileage => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _parseDynamicToInt)
  int? get warranty => throw _privateConstructorUsedError;
  @JsonKey(name: 'warranty_expiration')
  DateTime? get warrantyExpiration => throw _privateConstructorUsedError;
  @JsonKey(name: 'deleted_at')
  DateTime? get deletedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'Height', fromJson: _parseDynamicToString)
  String? get height => throw _privateConstructorUsedError;
  @JsonKey(name: 'VIN', fromJson: _parseDynamicToString)
  String? get vin => throw _privateConstructorUsedError;
  Brand? get brand => throw _privateConstructorUsedError;
  Category? get category => throw _privateConstructorUsedError;
  @JsonKey(name: 'brand_model')
  BrandModel? get brandModel => throw _privateConstructorUsedError;
  User? get user => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_promoted', fromJson: _parseDynamicToBool)
  bool? get isPromoted => throw _privateConstructorUsedError;

  /// Serializes this SingleItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SingleItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SingleItemCopyWith<SingleItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SingleItemCopyWith<$Res> {
  factory $SingleItemCopyWith(
          SingleItem value, $Res Function(SingleItem) then) =
      _$SingleItemCopyWithImpl<$Res, SingleItem>;
  @useResult
  $Res call(
      {@JsonKey(fromJson: _parseDynamicToString) String id,
      @JsonKey(name: 'user_id', fromJson: _parseDynamicToString) String? userId,
      @JsonKey(name: 'country_id', fromJson: _parseDynamicToInt) int? countryId,
      @JsonKey(name: 'brand_model_id', fromJson: _parseDynamicToInt)
      int? brandModelId,
      @JsonKey(name: 'brand_id', fromJson: _parseDynamicToInt) int? brandId,
      @JsonKey(name: 'category_id', fromJson: _parseDynamicToInt)
      int? categoryId,
      @JsonKey(fromJson: _parseDynamicToString) String? name,
      @JsonKey(fromJson: _parseDynamicToString) String? year,
      @JsonKey(fromJson: _parseDynamicToString) String? slug,
      @JsonKey(fromJson: _parseDynamicToString) String? description,
      List<String>? images,
      @JsonKey(fromJson: _parseDynamicToString) String? location,
      @JsonKey(name: 'serial_number', fromJson: _parseDynamicToString)
      String? serialNumber,
      @JsonKey(fromJson: _parseDynamicToString) String? condition,
      @JsonKey(name: 'steer_position', fromJson: _parseDynamicToString)
      String? steerPosition,
      @JsonKey(name: 'engine_capacity', fromJson: _parseDynamicToString)
      String? engineCapacity,
      @JsonKey(fromJson: _parseDynamicToString) String? transmission,
      @JsonKey(fromJson: _parseDynamicToString) String? color,
      @JsonKey(name: 'build_type', fromJson: _parseDynamicToString)
      String? buildType,
      @JsonKey(name: 'number_of_passengers', fromJson: _parseDynamicToInt)
      int? numberOfPassengers,
      List<String>? features,
      @JsonKey(fromJson: _parseDynamicToString) String? status,
      @JsonKey(fromJson: _parseDynamicToString) String? price,
      @JsonKey(fromJson: _parseDynamicToString) String? mileage,
      @JsonKey(fromJson: _parseDynamicToInt) int? warranty,
      @JsonKey(name: 'warranty_expiration') DateTime? warrantyExpiration,
      @JsonKey(name: 'deleted_at') DateTime? deletedAt,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt,
      @JsonKey(name: 'Height', fromJson: _parseDynamicToString) String? height,
      @JsonKey(name: 'VIN', fromJson: _parseDynamicToString) String? vin,
      Brand? brand,
      Category? category,
      @JsonKey(name: 'brand_model') BrandModel? brandModel,
      User? user,
      @JsonKey(name: 'is_promoted', fromJson: _parseDynamicToBool)
      bool? isPromoted});

  $BrandCopyWith<$Res>? get brand;
  $CategoryCopyWith<$Res>? get category;
  $BrandModelCopyWith<$Res>? get brandModel;
  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class _$SingleItemCopyWithImpl<$Res, $Val extends SingleItem>
    implements $SingleItemCopyWith<$Res> {
  _$SingleItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SingleItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = freezed,
    Object? countryId = freezed,
    Object? brandModelId = freezed,
    Object? brandId = freezed,
    Object? categoryId = freezed,
    Object? name = freezed,
    Object? year = freezed,
    Object? slug = freezed,
    Object? description = freezed,
    Object? images = freezed,
    Object? location = freezed,
    Object? serialNumber = freezed,
    Object? condition = freezed,
    Object? steerPosition = freezed,
    Object? engineCapacity = freezed,
    Object? transmission = freezed,
    Object? color = freezed,
    Object? buildType = freezed,
    Object? numberOfPassengers = freezed,
    Object? features = freezed,
    Object? status = freezed,
    Object? price = freezed,
    Object? mileage = freezed,
    Object? warranty = freezed,
    Object? warrantyExpiration = freezed,
    Object? deletedAt = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? height = freezed,
    Object? vin = freezed,
    Object? brand = freezed,
    Object? category = freezed,
    Object? brandModel = freezed,
    Object? user = freezed,
    Object? isPromoted = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      countryId: freezed == countryId
          ? _value.countryId
          : countryId // ignore: cast_nullable_to_non_nullable
              as int?,
      brandModelId: freezed == brandModelId
          ? _value.brandModelId
          : brandModelId // ignore: cast_nullable_to_non_nullable
              as int?,
      brandId: freezed == brandId
          ? _value.brandId
          : brandId // ignore: cast_nullable_to_non_nullable
              as int?,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      year: freezed == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as String?,
      slug: freezed == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      images: freezed == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      serialNumber: freezed == serialNumber
          ? _value.serialNumber
          : serialNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      condition: freezed == condition
          ? _value.condition
          : condition // ignore: cast_nullable_to_non_nullable
              as String?,
      steerPosition: freezed == steerPosition
          ? _value.steerPosition
          : steerPosition // ignore: cast_nullable_to_non_nullable
              as String?,
      engineCapacity: freezed == engineCapacity
          ? _value.engineCapacity
          : engineCapacity // ignore: cast_nullable_to_non_nullable
              as String?,
      transmission: freezed == transmission
          ? _value.transmission
          : transmission // ignore: cast_nullable_to_non_nullable
              as String?,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
      buildType: freezed == buildType
          ? _value.buildType
          : buildType // ignore: cast_nullable_to_non_nullable
              as String?,
      numberOfPassengers: freezed == numberOfPassengers
          ? _value.numberOfPassengers
          : numberOfPassengers // ignore: cast_nullable_to_non_nullable
              as int?,
      features: freezed == features
          ? _value.features
          : features // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String?,
      mileage: freezed == mileage
          ? _value.mileage
          : mileage // ignore: cast_nullable_to_non_nullable
              as String?,
      warranty: freezed == warranty
          ? _value.warranty
          : warranty // ignore: cast_nullable_to_non_nullable
              as int?,
      warrantyExpiration: freezed == warrantyExpiration
          ? _value.warrantyExpiration
          : warrantyExpiration // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      deletedAt: freezed == deletedAt
          ? _value.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      height: freezed == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as String?,
      vin: freezed == vin
          ? _value.vin
          : vin // ignore: cast_nullable_to_non_nullable
              as String?,
      brand: freezed == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as Brand?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as Category?,
      brandModel: freezed == brandModel
          ? _value.brandModel
          : brandModel // ignore: cast_nullable_to_non_nullable
              as BrandModel?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      isPromoted: freezed == isPromoted
          ? _value.isPromoted
          : isPromoted // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }

  /// Create a copy of SingleItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BrandCopyWith<$Res>? get brand {
    if (_value.brand == null) {
      return null;
    }

    return $BrandCopyWith<$Res>(_value.brand!, (value) {
      return _then(_value.copyWith(brand: value) as $Val);
    });
  }

  /// Create a copy of SingleItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CategoryCopyWith<$Res>? get category {
    if (_value.category == null) {
      return null;
    }

    return $CategoryCopyWith<$Res>(_value.category!, (value) {
      return _then(_value.copyWith(category: value) as $Val);
    });
  }

  /// Create a copy of SingleItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BrandModelCopyWith<$Res>? get brandModel {
    if (_value.brandModel == null) {
      return null;
    }

    return $BrandModelCopyWith<$Res>(_value.brandModel!, (value) {
      return _then(_value.copyWith(brandModel: value) as $Val);
    });
  }

  /// Create a copy of SingleItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SingleItemImplCopyWith<$Res>
    implements $SingleItemCopyWith<$Res> {
  factory _$$SingleItemImplCopyWith(
          _$SingleItemImpl value, $Res Function(_$SingleItemImpl) then) =
      __$$SingleItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(fromJson: _parseDynamicToString) String id,
      @JsonKey(name: 'user_id', fromJson: _parseDynamicToString) String? userId,
      @JsonKey(name: 'country_id', fromJson: _parseDynamicToInt) int? countryId,
      @JsonKey(name: 'brand_model_id', fromJson: _parseDynamicToInt)
      int? brandModelId,
      @JsonKey(name: 'brand_id', fromJson: _parseDynamicToInt) int? brandId,
      @JsonKey(name: 'category_id', fromJson: _parseDynamicToInt)
      int? categoryId,
      @JsonKey(fromJson: _parseDynamicToString) String? name,
      @JsonKey(fromJson: _parseDynamicToString) String? year,
      @JsonKey(fromJson: _parseDynamicToString) String? slug,
      @JsonKey(fromJson: _parseDynamicToString) String? description,
      List<String>? images,
      @JsonKey(fromJson: _parseDynamicToString) String? location,
      @JsonKey(name: 'serial_number', fromJson: _parseDynamicToString)
      String? serialNumber,
      @JsonKey(fromJson: _parseDynamicToString) String? condition,
      @JsonKey(name: 'steer_position', fromJson: _parseDynamicToString)
      String? steerPosition,
      @JsonKey(name: 'engine_capacity', fromJson: _parseDynamicToString)
      String? engineCapacity,
      @JsonKey(fromJson: _parseDynamicToString) String? transmission,
      @JsonKey(fromJson: _parseDynamicToString) String? color,
      @JsonKey(name: 'build_type', fromJson: _parseDynamicToString)
      String? buildType,
      @JsonKey(name: 'number_of_passengers', fromJson: _parseDynamicToInt)
      int? numberOfPassengers,
      List<String>? features,
      @JsonKey(fromJson: _parseDynamicToString) String? status,
      @JsonKey(fromJson: _parseDynamicToString) String? price,
      @JsonKey(fromJson: _parseDynamicToString) String? mileage,
      @JsonKey(fromJson: _parseDynamicToInt) int? warranty,
      @JsonKey(name: 'warranty_expiration') DateTime? warrantyExpiration,
      @JsonKey(name: 'deleted_at') DateTime? deletedAt,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt,
      @JsonKey(name: 'Height', fromJson: _parseDynamicToString) String? height,
      @JsonKey(name: 'VIN', fromJson: _parseDynamicToString) String? vin,
      Brand? brand,
      Category? category,
      @JsonKey(name: 'brand_model') BrandModel? brandModel,
      User? user,
      @JsonKey(name: 'is_promoted', fromJson: _parseDynamicToBool)
      bool? isPromoted});

  @override
  $BrandCopyWith<$Res>? get brand;
  @override
  $CategoryCopyWith<$Res>? get category;
  @override
  $BrandModelCopyWith<$Res>? get brandModel;
  @override
  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class __$$SingleItemImplCopyWithImpl<$Res>
    extends _$SingleItemCopyWithImpl<$Res, _$SingleItemImpl>
    implements _$$SingleItemImplCopyWith<$Res> {
  __$$SingleItemImplCopyWithImpl(
      _$SingleItemImpl _value, $Res Function(_$SingleItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of SingleItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = freezed,
    Object? countryId = freezed,
    Object? brandModelId = freezed,
    Object? brandId = freezed,
    Object? categoryId = freezed,
    Object? name = freezed,
    Object? year = freezed,
    Object? slug = freezed,
    Object? description = freezed,
    Object? images = freezed,
    Object? location = freezed,
    Object? serialNumber = freezed,
    Object? condition = freezed,
    Object? steerPosition = freezed,
    Object? engineCapacity = freezed,
    Object? transmission = freezed,
    Object? color = freezed,
    Object? buildType = freezed,
    Object? numberOfPassengers = freezed,
    Object? features = freezed,
    Object? status = freezed,
    Object? price = freezed,
    Object? mileage = freezed,
    Object? warranty = freezed,
    Object? warrantyExpiration = freezed,
    Object? deletedAt = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? height = freezed,
    Object? vin = freezed,
    Object? brand = freezed,
    Object? category = freezed,
    Object? brandModel = freezed,
    Object? user = freezed,
    Object? isPromoted = freezed,
  }) {
    return _then(_$SingleItemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      countryId: freezed == countryId
          ? _value.countryId
          : countryId // ignore: cast_nullable_to_non_nullable
              as int?,
      brandModelId: freezed == brandModelId
          ? _value.brandModelId
          : brandModelId // ignore: cast_nullable_to_non_nullable
              as int?,
      brandId: freezed == brandId
          ? _value.brandId
          : brandId // ignore: cast_nullable_to_non_nullable
              as int?,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      year: freezed == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as String?,
      slug: freezed == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      images: freezed == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      serialNumber: freezed == serialNumber
          ? _value.serialNumber
          : serialNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      condition: freezed == condition
          ? _value.condition
          : condition // ignore: cast_nullable_to_non_nullable
              as String?,
      steerPosition: freezed == steerPosition
          ? _value.steerPosition
          : steerPosition // ignore: cast_nullable_to_non_nullable
              as String?,
      engineCapacity: freezed == engineCapacity
          ? _value.engineCapacity
          : engineCapacity // ignore: cast_nullable_to_non_nullable
              as String?,
      transmission: freezed == transmission
          ? _value.transmission
          : transmission // ignore: cast_nullable_to_non_nullable
              as String?,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
      buildType: freezed == buildType
          ? _value.buildType
          : buildType // ignore: cast_nullable_to_non_nullable
              as String?,
      numberOfPassengers: freezed == numberOfPassengers
          ? _value.numberOfPassengers
          : numberOfPassengers // ignore: cast_nullable_to_non_nullable
              as int?,
      features: freezed == features
          ? _value._features
          : features // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String?,
      mileage: freezed == mileage
          ? _value.mileage
          : mileage // ignore: cast_nullable_to_non_nullable
              as String?,
      warranty: freezed == warranty
          ? _value.warranty
          : warranty // ignore: cast_nullable_to_non_nullable
              as int?,
      warrantyExpiration: freezed == warrantyExpiration
          ? _value.warrantyExpiration
          : warrantyExpiration // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      deletedAt: freezed == deletedAt
          ? _value.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      height: freezed == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as String?,
      vin: freezed == vin
          ? _value.vin
          : vin // ignore: cast_nullable_to_non_nullable
              as String?,
      brand: freezed == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as Brand?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as Category?,
      brandModel: freezed == brandModel
          ? _value.brandModel
          : brandModel // ignore: cast_nullable_to_non_nullable
              as BrandModel?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      isPromoted: freezed == isPromoted
          ? _value.isPromoted
          : isPromoted // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SingleItemImpl with DiagnosticableTreeMixin implements _SingleItem {
  const _$SingleItemImpl(
      {@JsonKey(fromJson: _parseDynamicToString) required this.id,
      @JsonKey(name: 'user_id', fromJson: _parseDynamicToString) this.userId,
      @JsonKey(name: 'country_id', fromJson: _parseDynamicToInt) this.countryId,
      @JsonKey(name: 'brand_model_id', fromJson: _parseDynamicToInt)
      this.brandModelId,
      @JsonKey(name: 'brand_id', fromJson: _parseDynamicToInt) this.brandId,
      @JsonKey(name: 'category_id', fromJson: _parseDynamicToInt)
      this.categoryId,
      @JsonKey(fromJson: _parseDynamicToString) this.name,
      @JsonKey(fromJson: _parseDynamicToString) this.year,
      @JsonKey(fromJson: _parseDynamicToString) this.slug,
      @JsonKey(fromJson: _parseDynamicToString) this.description,
      final List<String>? images,
      @JsonKey(fromJson: _parseDynamicToString) this.location,
      @JsonKey(name: 'serial_number', fromJson: _parseDynamicToString)
      this.serialNumber,
      @JsonKey(fromJson: _parseDynamicToString) this.condition,
      @JsonKey(name: 'steer_position', fromJson: _parseDynamicToString)
      this.steerPosition,
      @JsonKey(name: 'engine_capacity', fromJson: _parseDynamicToString)
      this.engineCapacity,
      @JsonKey(fromJson: _parseDynamicToString) this.transmission,
      @JsonKey(fromJson: _parseDynamicToString) this.color,
      @JsonKey(name: 'build_type', fromJson: _parseDynamicToString)
      this.buildType,
      @JsonKey(name: 'number_of_passengers', fromJson: _parseDynamicToInt)
      this.numberOfPassengers,
      final List<String>? features,
      @JsonKey(fromJson: _parseDynamicToString) this.status,
      @JsonKey(fromJson: _parseDynamicToString) this.price,
      @JsonKey(fromJson: _parseDynamicToString) this.mileage,
      @JsonKey(fromJson: _parseDynamicToInt) this.warranty,
      @JsonKey(name: 'warranty_expiration') this.warrantyExpiration,
      @JsonKey(name: 'deleted_at') this.deletedAt,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt,
      @JsonKey(name: 'Height', fromJson: _parseDynamicToString) this.height,
      @JsonKey(name: 'VIN', fromJson: _parseDynamicToString) this.vin,
      this.brand,
      this.category,
      @JsonKey(name: 'brand_model') this.brandModel,
      this.user,
      @JsonKey(name: 'is_promoted', fromJson: _parseDynamicToBool)
      this.isPromoted})
      : _images = images,
        _features = features;

  factory _$SingleItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$SingleItemImplFromJson(json);

  @override
  @JsonKey(fromJson: _parseDynamicToString)
  final String id;
  @override
  @JsonKey(name: 'user_id', fromJson: _parseDynamicToString)
  final String? userId;
  @override
  @JsonKey(name: 'country_id', fromJson: _parseDynamicToInt)
  final int? countryId;
  @override
  @JsonKey(name: 'brand_model_id', fromJson: _parseDynamicToInt)
  final int? brandModelId;
  @override
  @JsonKey(name: 'brand_id', fromJson: _parseDynamicToInt)
  final int? brandId;
  @override
  @JsonKey(name: 'category_id', fromJson: _parseDynamicToInt)
  final int? categoryId;
  @override
  @JsonKey(fromJson: _parseDynamicToString)
  final String? name;
  @override
  @JsonKey(fromJson: _parseDynamicToString)
  final String? year;
  @override
  @JsonKey(fromJson: _parseDynamicToString)
  final String? slug;
  @override
  @JsonKey(fromJson: _parseDynamicToString)
  final String? description;
  final List<String>? _images;
  @override
  List<String>? get images {
    final value = _images;
    if (value == null) return null;
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(fromJson: _parseDynamicToString)
  final String? location;
  @override
  @JsonKey(name: 'serial_number', fromJson: _parseDynamicToString)
  final String? serialNumber;
  @override
  @JsonKey(fromJson: _parseDynamicToString)
  final String? condition;
  @override
  @JsonKey(name: 'steer_position', fromJson: _parseDynamicToString)
  final String? steerPosition;
  @override
  @JsonKey(name: 'engine_capacity', fromJson: _parseDynamicToString)
  final String? engineCapacity;
  @override
  @JsonKey(fromJson: _parseDynamicToString)
  final String? transmission;
  @override
  @JsonKey(fromJson: _parseDynamicToString)
  final String? color;
  @override
  @JsonKey(name: 'build_type', fromJson: _parseDynamicToString)
  final String? buildType;
  @override
  @JsonKey(name: 'number_of_passengers', fromJson: _parseDynamicToInt)
  final int? numberOfPassengers;
  final List<String>? _features;
  @override
  List<String>? get features {
    final value = _features;
    if (value == null) return null;
    if (_features is EqualUnmodifiableListView) return _features;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(fromJson: _parseDynamicToString)
  final String? status;
  @override
  @JsonKey(fromJson: _parseDynamicToString)
  final String? price;
  @override
  @JsonKey(fromJson: _parseDynamicToString)
  final String? mileage;
  @override
  @JsonKey(fromJson: _parseDynamicToInt)
  final int? warranty;
  @override
  @JsonKey(name: 'warranty_expiration')
  final DateTime? warrantyExpiration;
  @override
  @JsonKey(name: 'deleted_at')
  final DateTime? deletedAt;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;
  @override
  @JsonKey(name: 'Height', fromJson: _parseDynamicToString)
  final String? height;
  @override
  @JsonKey(name: 'VIN', fromJson: _parseDynamicToString)
  final String? vin;
  @override
  final Brand? brand;
  @override
  final Category? category;
  @override
  @JsonKey(name: 'brand_model')
  final BrandModel? brandModel;
  @override
  final User? user;
  @override
  @JsonKey(name: 'is_promoted', fromJson: _parseDynamicToBool)
  final bool? isPromoted;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SingleItem(id: $id, userId: $userId, countryId: $countryId, brandModelId: $brandModelId, brandId: $brandId, categoryId: $categoryId, name: $name, year: $year, slug: $slug, description: $description, images: $images, location: $location, serialNumber: $serialNumber, condition: $condition, steerPosition: $steerPosition, engineCapacity: $engineCapacity, transmission: $transmission, color: $color, buildType: $buildType, numberOfPassengers: $numberOfPassengers, features: $features, status: $status, price: $price, mileage: $mileage, warranty: $warranty, warrantyExpiration: $warrantyExpiration, deletedAt: $deletedAt, createdAt: $createdAt, updatedAt: $updatedAt, height: $height, vin: $vin, brand: $brand, category: $category, brandModel: $brandModel, user: $user, isPromoted: $isPromoted)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SingleItem'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('userId', userId))
      ..add(DiagnosticsProperty('countryId', countryId))
      ..add(DiagnosticsProperty('brandModelId', brandModelId))
      ..add(DiagnosticsProperty('brandId', brandId))
      ..add(DiagnosticsProperty('categoryId', categoryId))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('year', year))
      ..add(DiagnosticsProperty('slug', slug))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('images', images))
      ..add(DiagnosticsProperty('location', location))
      ..add(DiagnosticsProperty('serialNumber', serialNumber))
      ..add(DiagnosticsProperty('condition', condition))
      ..add(DiagnosticsProperty('steerPosition', steerPosition))
      ..add(DiagnosticsProperty('engineCapacity', engineCapacity))
      ..add(DiagnosticsProperty('transmission', transmission))
      ..add(DiagnosticsProperty('color', color))
      ..add(DiagnosticsProperty('buildType', buildType))
      ..add(DiagnosticsProperty('numberOfPassengers', numberOfPassengers))
      ..add(DiagnosticsProperty('features', features))
      ..add(DiagnosticsProperty('status', status))
      ..add(DiagnosticsProperty('price', price))
      ..add(DiagnosticsProperty('mileage', mileage))
      ..add(DiagnosticsProperty('warranty', warranty))
      ..add(DiagnosticsProperty('warrantyExpiration', warrantyExpiration))
      ..add(DiagnosticsProperty('deletedAt', deletedAt))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('updatedAt', updatedAt))
      ..add(DiagnosticsProperty('height', height))
      ..add(DiagnosticsProperty('vin', vin))
      ..add(DiagnosticsProperty('brand', brand))
      ..add(DiagnosticsProperty('category', category))
      ..add(DiagnosticsProperty('brandModel', brandModel))
      ..add(DiagnosticsProperty('user', user))
      ..add(DiagnosticsProperty('isPromoted', isPromoted));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SingleItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.countryId, countryId) ||
                other.countryId == countryId) &&
            (identical(other.brandModelId, brandModelId) ||
                other.brandModelId == brandModelId) &&
            (identical(other.brandId, brandId) || other.brandId == brandId) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.serialNumber, serialNumber) ||
                other.serialNumber == serialNumber) &&
            (identical(other.condition, condition) ||
                other.condition == condition) &&
            (identical(other.steerPosition, steerPosition) ||
                other.steerPosition == steerPosition) &&
            (identical(other.engineCapacity, engineCapacity) ||
                other.engineCapacity == engineCapacity) &&
            (identical(other.transmission, transmission) ||
                other.transmission == transmission) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.buildType, buildType) ||
                other.buildType == buildType) &&
            (identical(other.numberOfPassengers, numberOfPassengers) ||
                other.numberOfPassengers == numberOfPassengers) &&
            const DeepCollectionEquality().equals(other._features, _features) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.mileage, mileage) || other.mileage == mileage) &&
            (identical(other.warranty, warranty) ||
                other.warranty == warranty) &&
            (identical(other.warrantyExpiration, warrantyExpiration) ||
                other.warrantyExpiration == warrantyExpiration) &&
            (identical(other.deletedAt, deletedAt) ||
                other.deletedAt == deletedAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.vin, vin) || other.vin == vin) &&
            (identical(other.brand, brand) || other.brand == brand) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.brandModel, brandModel) ||
                other.brandModel == brandModel) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.isPromoted, isPromoted) ||
                other.isPromoted == isPromoted));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        userId,
        countryId,
        brandModelId,
        brandId,
        categoryId,
        name,
        year,
        slug,
        description,
        const DeepCollectionEquality().hash(_images),
        location,
        serialNumber,
        condition,
        steerPosition,
        engineCapacity,
        transmission,
        color,
        buildType,
        numberOfPassengers,
        const DeepCollectionEquality().hash(_features),
        status,
        price,
        mileage,
        warranty,
        warrantyExpiration,
        deletedAt,
        createdAt,
        updatedAt,
        height,
        vin,
        brand,
        category,
        brandModel,
        user,
        isPromoted
      ]);

  /// Create a copy of SingleItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SingleItemImplCopyWith<_$SingleItemImpl> get copyWith =>
      __$$SingleItemImplCopyWithImpl<_$SingleItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SingleItemImplToJson(
      this,
    );
  }
}

abstract class _SingleItem implements SingleItem {
  const factory _SingleItem(
      {@JsonKey(fromJson: _parseDynamicToString) required final String id,
      @JsonKey(name: 'user_id', fromJson: _parseDynamicToString)
      final String? userId,
      @JsonKey(name: 'country_id', fromJson: _parseDynamicToInt)
      final int? countryId,
      @JsonKey(name: 'brand_model_id', fromJson: _parseDynamicToInt)
      final int? brandModelId,
      @JsonKey(name: 'brand_id', fromJson: _parseDynamicToInt)
      final int? brandId,
      @JsonKey(name: 'category_id', fromJson: _parseDynamicToInt)
      final int? categoryId,
      @JsonKey(fromJson: _parseDynamicToString) final String? name,
      @JsonKey(fromJson: _parseDynamicToString) final String? year,
      @JsonKey(fromJson: _parseDynamicToString) final String? slug,
      @JsonKey(fromJson: _parseDynamicToString) final String? description,
      final List<String>? images,
      @JsonKey(fromJson: _parseDynamicToString) final String? location,
      @JsonKey(name: 'serial_number', fromJson: _parseDynamicToString)
      final String? serialNumber,
      @JsonKey(fromJson: _parseDynamicToString) final String? condition,
      @JsonKey(name: 'steer_position', fromJson: _parseDynamicToString)
      final String? steerPosition,
      @JsonKey(name: 'engine_capacity', fromJson: _parseDynamicToString)
      final String? engineCapacity,
      @JsonKey(fromJson: _parseDynamicToString) final String? transmission,
      @JsonKey(fromJson: _parseDynamicToString) final String? color,
      @JsonKey(name: 'build_type', fromJson: _parseDynamicToString)
      final String? buildType,
      @JsonKey(name: 'number_of_passengers', fromJson: _parseDynamicToInt)
      final int? numberOfPassengers,
      final List<String>? features,
      @JsonKey(fromJson: _parseDynamicToString) final String? status,
      @JsonKey(fromJson: _parseDynamicToString) final String? price,
      @JsonKey(fromJson: _parseDynamicToString) final String? mileage,
      @JsonKey(fromJson: _parseDynamicToInt) final int? warranty,
      @JsonKey(name: 'warranty_expiration') final DateTime? warrantyExpiration,
      @JsonKey(name: 'deleted_at') final DateTime? deletedAt,
      @JsonKey(name: 'created_at') final DateTime? createdAt,
      @JsonKey(name: 'updated_at') final DateTime? updatedAt,
      @JsonKey(name: 'Height', fromJson: _parseDynamicToString)
      final String? height,
      @JsonKey(name: 'VIN', fromJson: _parseDynamicToString) final String? vin,
      final Brand? brand,
      final Category? category,
      @JsonKey(name: 'brand_model') final BrandModel? brandModel,
      final User? user,
      @JsonKey(name: 'is_promoted', fromJson: _parseDynamicToBool)
      final bool? isPromoted}) = _$SingleItemImpl;

  factory _SingleItem.fromJson(Map<String, dynamic> json) =
      _$SingleItemImpl.fromJson;

  @override
  @JsonKey(fromJson: _parseDynamicToString)
  String get id;
  @override
  @JsonKey(name: 'user_id', fromJson: _parseDynamicToString)
  String? get userId;
  @override
  @JsonKey(name: 'country_id', fromJson: _parseDynamicToInt)
  int? get countryId;
  @override
  @JsonKey(name: 'brand_model_id', fromJson: _parseDynamicToInt)
  int? get brandModelId;
  @override
  @JsonKey(name: 'brand_id', fromJson: _parseDynamicToInt)
  int? get brandId;
  @override
  @JsonKey(name: 'category_id', fromJson: _parseDynamicToInt)
  int? get categoryId;
  @override
  @JsonKey(fromJson: _parseDynamicToString)
  String? get name;
  @override
  @JsonKey(fromJson: _parseDynamicToString)
  String? get year;
  @override
  @JsonKey(fromJson: _parseDynamicToString)
  String? get slug;
  @override
  @JsonKey(fromJson: _parseDynamicToString)
  String? get description;
  @override
  List<String>? get images;
  @override
  @JsonKey(fromJson: _parseDynamicToString)
  String? get location;
  @override
  @JsonKey(name: 'serial_number', fromJson: _parseDynamicToString)
  String? get serialNumber;
  @override
  @JsonKey(fromJson: _parseDynamicToString)
  String? get condition;
  @override
  @JsonKey(name: 'steer_position', fromJson: _parseDynamicToString)
  String? get steerPosition;
  @override
  @JsonKey(name: 'engine_capacity', fromJson: _parseDynamicToString)
  String? get engineCapacity;
  @override
  @JsonKey(fromJson: _parseDynamicToString)
  String? get transmission;
  @override
  @JsonKey(fromJson: _parseDynamicToString)
  String? get color;
  @override
  @JsonKey(name: 'build_type', fromJson: _parseDynamicToString)
  String? get buildType;
  @override
  @JsonKey(name: 'number_of_passengers', fromJson: _parseDynamicToInt)
  int? get numberOfPassengers;
  @override
  List<String>? get features;
  @override
  @JsonKey(fromJson: _parseDynamicToString)
  String? get status;
  @override
  @JsonKey(fromJson: _parseDynamicToString)
  String? get price;
  @override
  @JsonKey(fromJson: _parseDynamicToString)
  String? get mileage;
  @override
  @JsonKey(fromJson: _parseDynamicToInt)
  int? get warranty;
  @override
  @JsonKey(name: 'warranty_expiration')
  DateTime? get warrantyExpiration;
  @override
  @JsonKey(name: 'deleted_at')
  DateTime? get deletedAt;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt;
  @override
  @JsonKey(name: 'Height', fromJson: _parseDynamicToString)
  String? get height;
  @override
  @JsonKey(name: 'VIN', fromJson: _parseDynamicToString)
  String? get vin;
  @override
  Brand? get brand;
  @override
  Category? get category;
  @override
  @JsonKey(name: 'brand_model')
  BrandModel? get brandModel;
  @override
  User? get user;
  @override
  @JsonKey(name: 'is_promoted', fromJson: _parseDynamicToBool)
  bool? get isPromoted;

  /// Create a copy of SingleItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SingleItemImplCopyWith<_$SingleItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SingleItemResponse _$SingleItemResponseFromJson(Map<String, dynamic> json) {
  return _SingleItemResponse.fromJson(json);
}

/// @nodoc
mixin _$SingleItemResponse {
  List<SingleItem> get data => throw _privateConstructorUsedError;
  SingleItemLinks get links => throw _privateConstructorUsedError;
  SingleItemMeta get meta => throw _privateConstructorUsedError;

  /// Serializes this SingleItemResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SingleItemResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SingleItemResponseCopyWith<SingleItemResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SingleItemResponseCopyWith<$Res> {
  factory $SingleItemResponseCopyWith(
          SingleItemResponse value, $Res Function(SingleItemResponse) then) =
      _$SingleItemResponseCopyWithImpl<$Res, SingleItemResponse>;
  @useResult
  $Res call(
      {List<SingleItem> data, SingleItemLinks links, SingleItemMeta meta});

  $SingleItemLinksCopyWith<$Res> get links;
  $SingleItemMetaCopyWith<$Res> get meta;
}

/// @nodoc
class _$SingleItemResponseCopyWithImpl<$Res, $Val extends SingleItemResponse>
    implements $SingleItemResponseCopyWith<$Res> {
  _$SingleItemResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SingleItemResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? links = null,
    Object? meta = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<SingleItem>,
      links: null == links
          ? _value.links
          : links // ignore: cast_nullable_to_non_nullable
              as SingleItemLinks,
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as SingleItemMeta,
    ) as $Val);
  }

  /// Create a copy of SingleItemResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SingleItemLinksCopyWith<$Res> get links {
    return $SingleItemLinksCopyWith<$Res>(_value.links, (value) {
      return _then(_value.copyWith(links: value) as $Val);
    });
  }

  /// Create a copy of SingleItemResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SingleItemMetaCopyWith<$Res> get meta {
    return $SingleItemMetaCopyWith<$Res>(_value.meta, (value) {
      return _then(_value.copyWith(meta: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SingleItemResponseImplCopyWith<$Res>
    implements $SingleItemResponseCopyWith<$Res> {
  factory _$$SingleItemResponseImplCopyWith(_$SingleItemResponseImpl value,
          $Res Function(_$SingleItemResponseImpl) then) =
      __$$SingleItemResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<SingleItem> data, SingleItemLinks links, SingleItemMeta meta});

  @override
  $SingleItemLinksCopyWith<$Res> get links;
  @override
  $SingleItemMetaCopyWith<$Res> get meta;
}

/// @nodoc
class __$$SingleItemResponseImplCopyWithImpl<$Res>
    extends _$SingleItemResponseCopyWithImpl<$Res, _$SingleItemResponseImpl>
    implements _$$SingleItemResponseImplCopyWith<$Res> {
  __$$SingleItemResponseImplCopyWithImpl(_$SingleItemResponseImpl _value,
      $Res Function(_$SingleItemResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of SingleItemResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? links = null,
    Object? meta = null,
  }) {
    return _then(_$SingleItemResponseImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<SingleItem>,
      links: null == links
          ? _value.links
          : links // ignore: cast_nullable_to_non_nullable
              as SingleItemLinks,
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as SingleItemMeta,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SingleItemResponseImpl
    with DiagnosticableTreeMixin
    implements _SingleItemResponse {
  const _$SingleItemResponseImpl(
      {required final List<SingleItem> data,
      required this.links,
      required this.meta})
      : _data = data;

  factory _$SingleItemResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$SingleItemResponseImplFromJson(json);

  final List<SingleItem> _data;
  @override
  List<SingleItem> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  final SingleItemLinks links;
  @override
  final SingleItemMeta meta;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SingleItemResponse(data: $data, links: $links, meta: $meta)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SingleItemResponse'))
      ..add(DiagnosticsProperty('data', data))
      ..add(DiagnosticsProperty('links', links))
      ..add(DiagnosticsProperty('meta', meta));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SingleItemResponseImpl &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.links, links) || other.links == links) &&
            (identical(other.meta, meta) || other.meta == meta));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_data), links, meta);

  /// Create a copy of SingleItemResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SingleItemResponseImplCopyWith<_$SingleItemResponseImpl> get copyWith =>
      __$$SingleItemResponseImplCopyWithImpl<_$SingleItemResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SingleItemResponseImplToJson(
      this,
    );
  }
}

abstract class _SingleItemResponse implements SingleItemResponse {
  const factory _SingleItemResponse(
      {required final List<SingleItem> data,
      required final SingleItemLinks links,
      required final SingleItemMeta meta}) = _$SingleItemResponseImpl;

  factory _SingleItemResponse.fromJson(Map<String, dynamic> json) =
      _$SingleItemResponseImpl.fromJson;

  @override
  List<SingleItem> get data;
  @override
  SingleItemLinks get links;
  @override
  SingleItemMeta get meta;

  /// Create a copy of SingleItemResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SingleItemResponseImplCopyWith<_$SingleItemResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SingleItemLinks _$SingleItemLinksFromJson(Map<String, dynamic> json) {
  return _SingleItemLinks.fromJson(json);
}

/// @nodoc
mixin _$SingleItemLinks {
  String get first => throw _privateConstructorUsedError;
  String get last => throw _privateConstructorUsedError;
  String? get prev => throw _privateConstructorUsedError;
  String? get next => throw _privateConstructorUsedError;

  /// Serializes this SingleItemLinks to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SingleItemLinks
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SingleItemLinksCopyWith<SingleItemLinks> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SingleItemLinksCopyWith<$Res> {
  factory $SingleItemLinksCopyWith(
          SingleItemLinks value, $Res Function(SingleItemLinks) then) =
      _$SingleItemLinksCopyWithImpl<$Res, SingleItemLinks>;
  @useResult
  $Res call({String first, String last, String? prev, String? next});
}

/// @nodoc
class _$SingleItemLinksCopyWithImpl<$Res, $Val extends SingleItemLinks>
    implements $SingleItemLinksCopyWith<$Res> {
  _$SingleItemLinksCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SingleItemLinks
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? first = null,
    Object? last = null,
    Object? prev = freezed,
    Object? next = freezed,
  }) {
    return _then(_value.copyWith(
      first: null == first
          ? _value.first
          : first // ignore: cast_nullable_to_non_nullable
              as String,
      last: null == last
          ? _value.last
          : last // ignore: cast_nullable_to_non_nullable
              as String,
      prev: freezed == prev
          ? _value.prev
          : prev // ignore: cast_nullable_to_non_nullable
              as String?,
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SingleItemLinksImplCopyWith<$Res>
    implements $SingleItemLinksCopyWith<$Res> {
  factory _$$SingleItemLinksImplCopyWith(_$SingleItemLinksImpl value,
          $Res Function(_$SingleItemLinksImpl) then) =
      __$$SingleItemLinksImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String first, String last, String? prev, String? next});
}

/// @nodoc
class __$$SingleItemLinksImplCopyWithImpl<$Res>
    extends _$SingleItemLinksCopyWithImpl<$Res, _$SingleItemLinksImpl>
    implements _$$SingleItemLinksImplCopyWith<$Res> {
  __$$SingleItemLinksImplCopyWithImpl(
      _$SingleItemLinksImpl _value, $Res Function(_$SingleItemLinksImpl) _then)
      : super(_value, _then);

  /// Create a copy of SingleItemLinks
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? first = null,
    Object? last = null,
    Object? prev = freezed,
    Object? next = freezed,
  }) {
    return _then(_$SingleItemLinksImpl(
      first: null == first
          ? _value.first
          : first // ignore: cast_nullable_to_non_nullable
              as String,
      last: null == last
          ? _value.last
          : last // ignore: cast_nullable_to_non_nullable
              as String,
      prev: freezed == prev
          ? _value.prev
          : prev // ignore: cast_nullable_to_non_nullable
              as String?,
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SingleItemLinksImpl
    with DiagnosticableTreeMixin
    implements _SingleItemLinks {
  const _$SingleItemLinksImpl(
      {required this.first, required this.last, this.prev, this.next});

  factory _$SingleItemLinksImpl.fromJson(Map<String, dynamic> json) =>
      _$$SingleItemLinksImplFromJson(json);

  @override
  final String first;
  @override
  final String last;
  @override
  final String? prev;
  @override
  final String? next;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SingleItemLinks(first: $first, last: $last, prev: $prev, next: $next)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SingleItemLinks'))
      ..add(DiagnosticsProperty('first', first))
      ..add(DiagnosticsProperty('last', last))
      ..add(DiagnosticsProperty('prev', prev))
      ..add(DiagnosticsProperty('next', next));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SingleItemLinksImpl &&
            (identical(other.first, first) || other.first == first) &&
            (identical(other.last, last) || other.last == last) &&
            (identical(other.prev, prev) || other.prev == prev) &&
            (identical(other.next, next) || other.next == next));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, first, last, prev, next);

  /// Create a copy of SingleItemLinks
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SingleItemLinksImplCopyWith<_$SingleItemLinksImpl> get copyWith =>
      __$$SingleItemLinksImplCopyWithImpl<_$SingleItemLinksImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SingleItemLinksImplToJson(
      this,
    );
  }
}

abstract class _SingleItemLinks implements SingleItemLinks {
  const factory _SingleItemLinks(
      {required final String first,
      required final String last,
      final String? prev,
      final String? next}) = _$SingleItemLinksImpl;

  factory _SingleItemLinks.fromJson(Map<String, dynamic> json) =
      _$SingleItemLinksImpl.fromJson;

  @override
  String get first;
  @override
  String get last;
  @override
  String? get prev;
  @override
  String? get next;

  /// Create a copy of SingleItemLinks
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SingleItemLinksImplCopyWith<_$SingleItemLinksImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SingleItemMeta _$SingleItemMetaFromJson(Map<String, dynamic> json) {
  return _SingleItemMeta.fromJson(json);
}

/// @nodoc
mixin _$SingleItemMeta {
  @JsonKey(name: 'current_page', fromJson: _parseDynamicToInt)
  int get currentPage => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _parseDynamicToInt)
  int? get from => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_page', fromJson: _parseDynamicToInt)
  int get lastPage => throw _privateConstructorUsedError;
  List<SingleItemMetaLink> get links => throw _privateConstructorUsedError;
  String get path => throw _privateConstructorUsedError;
  @JsonKey(name: 'per_page', fromJson: _parseDynamicToInt)
  int get perPage => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _parseDynamicToInt)
  int? get to => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _parseDynamicToInt)
  int get total => throw _privateConstructorUsedError;

  /// Serializes this SingleItemMeta to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SingleItemMeta
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SingleItemMetaCopyWith<SingleItemMeta> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SingleItemMetaCopyWith<$Res> {
  factory $SingleItemMetaCopyWith(
          SingleItemMeta value, $Res Function(SingleItemMeta) then) =
      _$SingleItemMetaCopyWithImpl<$Res, SingleItemMeta>;
  @useResult
  $Res call(
      {@JsonKey(name: 'current_page', fromJson: _parseDynamicToInt)
      int currentPage,
      @JsonKey(fromJson: _parseDynamicToInt) int? from,
      @JsonKey(name: 'last_page', fromJson: _parseDynamicToInt) int lastPage,
      List<SingleItemMetaLink> links,
      String path,
      @JsonKey(name: 'per_page', fromJson: _parseDynamicToInt) int perPage,
      @JsonKey(fromJson: _parseDynamicToInt) int? to,
      @JsonKey(fromJson: _parseDynamicToInt) int total});
}

/// @nodoc
class _$SingleItemMetaCopyWithImpl<$Res, $Val extends SingleItemMeta>
    implements $SingleItemMetaCopyWith<$Res> {
  _$SingleItemMetaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SingleItemMeta
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPage = null,
    Object? from = freezed,
    Object? lastPage = null,
    Object? links = null,
    Object? path = null,
    Object? perPage = null,
    Object? to = freezed,
    Object? total = null,
  }) {
    return _then(_value.copyWith(
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      from: freezed == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as int?,
      lastPage: null == lastPage
          ? _value.lastPage
          : lastPage // ignore: cast_nullable_to_non_nullable
              as int,
      links: null == links
          ? _value.links
          : links // ignore: cast_nullable_to_non_nullable
              as List<SingleItemMetaLink>,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      perPage: null == perPage
          ? _value.perPage
          : perPage // ignore: cast_nullable_to_non_nullable
              as int,
      to: freezed == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as int?,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SingleItemMetaImplCopyWith<$Res>
    implements $SingleItemMetaCopyWith<$Res> {
  factory _$$SingleItemMetaImplCopyWith(_$SingleItemMetaImpl value,
          $Res Function(_$SingleItemMetaImpl) then) =
      __$$SingleItemMetaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'current_page', fromJson: _parseDynamicToInt)
      int currentPage,
      @JsonKey(fromJson: _parseDynamicToInt) int? from,
      @JsonKey(name: 'last_page', fromJson: _parseDynamicToInt) int lastPage,
      List<SingleItemMetaLink> links,
      String path,
      @JsonKey(name: 'per_page', fromJson: _parseDynamicToInt) int perPage,
      @JsonKey(fromJson: _parseDynamicToInt) int? to,
      @JsonKey(fromJson: _parseDynamicToInt) int total});
}

/// @nodoc
class __$$SingleItemMetaImplCopyWithImpl<$Res>
    extends _$SingleItemMetaCopyWithImpl<$Res, _$SingleItemMetaImpl>
    implements _$$SingleItemMetaImplCopyWith<$Res> {
  __$$SingleItemMetaImplCopyWithImpl(
      _$SingleItemMetaImpl _value, $Res Function(_$SingleItemMetaImpl) _then)
      : super(_value, _then);

  /// Create a copy of SingleItemMeta
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPage = null,
    Object? from = freezed,
    Object? lastPage = null,
    Object? links = null,
    Object? path = null,
    Object? perPage = null,
    Object? to = freezed,
    Object? total = null,
  }) {
    return _then(_$SingleItemMetaImpl(
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      from: freezed == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as int?,
      lastPage: null == lastPage
          ? _value.lastPage
          : lastPage // ignore: cast_nullable_to_non_nullable
              as int,
      links: null == links
          ? _value._links
          : links // ignore: cast_nullable_to_non_nullable
              as List<SingleItemMetaLink>,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      perPage: null == perPage
          ? _value.perPage
          : perPage // ignore: cast_nullable_to_non_nullable
              as int,
      to: freezed == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as int?,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SingleItemMetaImpl
    with DiagnosticableTreeMixin
    implements _SingleItemMeta {
  const _$SingleItemMetaImpl(
      {@JsonKey(name: 'current_page', fromJson: _parseDynamicToInt)
      required this.currentPage,
      @JsonKey(fromJson: _parseDynamicToInt) required this.from,
      @JsonKey(name: 'last_page', fromJson: _parseDynamicToInt)
      required this.lastPage,
      required final List<SingleItemMetaLink> links,
      required this.path,
      @JsonKey(name: 'per_page', fromJson: _parseDynamicToInt)
      required this.perPage,
      @JsonKey(fromJson: _parseDynamicToInt) required this.to,
      @JsonKey(fromJson: _parseDynamicToInt) required this.total})
      : _links = links;

  factory _$SingleItemMetaImpl.fromJson(Map<String, dynamic> json) =>
      _$$SingleItemMetaImplFromJson(json);

  @override
  @JsonKey(name: 'current_page', fromJson: _parseDynamicToInt)
  final int currentPage;
  @override
  @JsonKey(fromJson: _parseDynamicToInt)
  final int? from;
  @override
  @JsonKey(name: 'last_page', fromJson: _parseDynamicToInt)
  final int lastPage;
  final List<SingleItemMetaLink> _links;
  @override
  List<SingleItemMetaLink> get links {
    if (_links is EqualUnmodifiableListView) return _links;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_links);
  }

  @override
  final String path;
  @override
  @JsonKey(name: 'per_page', fromJson: _parseDynamicToInt)
  final int perPage;
  @override
  @JsonKey(fromJson: _parseDynamicToInt)
  final int? to;
  @override
  @JsonKey(fromJson: _parseDynamicToInt)
  final int total;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SingleItemMeta(currentPage: $currentPage, from: $from, lastPage: $lastPage, links: $links, path: $path, perPage: $perPage, to: $to, total: $total)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SingleItemMeta'))
      ..add(DiagnosticsProperty('currentPage', currentPage))
      ..add(DiagnosticsProperty('from', from))
      ..add(DiagnosticsProperty('lastPage', lastPage))
      ..add(DiagnosticsProperty('links', links))
      ..add(DiagnosticsProperty('path', path))
      ..add(DiagnosticsProperty('perPage', perPage))
      ..add(DiagnosticsProperty('to', to))
      ..add(DiagnosticsProperty('total', total));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SingleItemMetaImpl &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.from, from) || other.from == from) &&
            (identical(other.lastPage, lastPage) ||
                other.lastPage == lastPage) &&
            const DeepCollectionEquality().equals(other._links, _links) &&
            (identical(other.path, path) || other.path == path) &&
            (identical(other.perPage, perPage) || other.perPage == perPage) &&
            (identical(other.to, to) || other.to == to) &&
            (identical(other.total, total) || other.total == total));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, currentPage, from, lastPage,
      const DeepCollectionEquality().hash(_links), path, perPage, to, total);

  /// Create a copy of SingleItemMeta
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SingleItemMetaImplCopyWith<_$SingleItemMetaImpl> get copyWith =>
      __$$SingleItemMetaImplCopyWithImpl<_$SingleItemMetaImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SingleItemMetaImplToJson(
      this,
    );
  }
}

abstract class _SingleItemMeta implements SingleItemMeta {
  const factory _SingleItemMeta(
          {@JsonKey(name: 'current_page', fromJson: _parseDynamicToInt)
          required final int currentPage,
          @JsonKey(fromJson: _parseDynamicToInt) required final int? from,
          @JsonKey(name: 'last_page', fromJson: _parseDynamicToInt)
          required final int lastPage,
          required final List<SingleItemMetaLink> links,
          required final String path,
          @JsonKey(name: 'per_page', fromJson: _parseDynamicToInt)
          required final int perPage,
          @JsonKey(fromJson: _parseDynamicToInt) required final int? to,
          @JsonKey(fromJson: _parseDynamicToInt) required final int total}) =
      _$SingleItemMetaImpl;

  factory _SingleItemMeta.fromJson(Map<String, dynamic> json) =
      _$SingleItemMetaImpl.fromJson;

  @override
  @JsonKey(name: 'current_page', fromJson: _parseDynamicToInt)
  int get currentPage;
  @override
  @JsonKey(fromJson: _parseDynamicToInt)
  int? get from;
  @override
  @JsonKey(name: 'last_page', fromJson: _parseDynamicToInt)
  int get lastPage;
  @override
  List<SingleItemMetaLink> get links;
  @override
  String get path;
  @override
  @JsonKey(name: 'per_page', fromJson: _parseDynamicToInt)
  int get perPage;
  @override
  @JsonKey(fromJson: _parseDynamicToInt)
  int? get to;
  @override
  @JsonKey(fromJson: _parseDynamicToInt)
  int get total;

  /// Create a copy of SingleItemMeta
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SingleItemMetaImplCopyWith<_$SingleItemMetaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SingleItemMetaLink _$SingleItemMetaLinkFromJson(Map<String, dynamic> json) {
  return _SingleItemMetaLink.fromJson(json);
}

/// @nodoc
mixin _$SingleItemMetaLink {
  @JsonKey(fromJson: _parseDynamicToString)
  String? get url => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _parseDynamicToString)
  String get label => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _parseDynamicToInt)
  int? get page => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _parseDynamicToBool)
  bool get active => throw _privateConstructorUsedError;

  /// Serializes this SingleItemMetaLink to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SingleItemMetaLink
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SingleItemMetaLinkCopyWith<SingleItemMetaLink> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SingleItemMetaLinkCopyWith<$Res> {
  factory $SingleItemMetaLinkCopyWith(
          SingleItemMetaLink value, $Res Function(SingleItemMetaLink) then) =
      _$SingleItemMetaLinkCopyWithImpl<$Res, SingleItemMetaLink>;
  @useResult
  $Res call(
      {@JsonKey(fromJson: _parseDynamicToString) String? url,
      @JsonKey(fromJson: _parseDynamicToString) String label,
      @JsonKey(fromJson: _parseDynamicToInt) int? page,
      @JsonKey(fromJson: _parseDynamicToBool) bool active});
}

/// @nodoc
class _$SingleItemMetaLinkCopyWithImpl<$Res, $Val extends SingleItemMetaLink>
    implements $SingleItemMetaLinkCopyWith<$Res> {
  _$SingleItemMetaLinkCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SingleItemMetaLink
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = freezed,
    Object? label = null,
    Object? page = freezed,
    Object? active = null,
  }) {
    return _then(_value.copyWith(
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SingleItemMetaLinkImplCopyWith<$Res>
    implements $SingleItemMetaLinkCopyWith<$Res> {
  factory _$$SingleItemMetaLinkImplCopyWith(_$SingleItemMetaLinkImpl value,
          $Res Function(_$SingleItemMetaLinkImpl) then) =
      __$$SingleItemMetaLinkImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(fromJson: _parseDynamicToString) String? url,
      @JsonKey(fromJson: _parseDynamicToString) String label,
      @JsonKey(fromJson: _parseDynamicToInt) int? page,
      @JsonKey(fromJson: _parseDynamicToBool) bool active});
}

/// @nodoc
class __$$SingleItemMetaLinkImplCopyWithImpl<$Res>
    extends _$SingleItemMetaLinkCopyWithImpl<$Res, _$SingleItemMetaLinkImpl>
    implements _$$SingleItemMetaLinkImplCopyWith<$Res> {
  __$$SingleItemMetaLinkImplCopyWithImpl(_$SingleItemMetaLinkImpl _value,
      $Res Function(_$SingleItemMetaLinkImpl) _then)
      : super(_value, _then);

  /// Create a copy of SingleItemMetaLink
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = freezed,
    Object? label = null,
    Object? page = freezed,
    Object? active = null,
  }) {
    return _then(_$SingleItemMetaLinkImpl(
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SingleItemMetaLinkImpl
    with DiagnosticableTreeMixin
    implements _SingleItemMetaLink {
  const _$SingleItemMetaLinkImpl(
      {@JsonKey(fromJson: _parseDynamicToString) this.url,
      @JsonKey(fromJson: _parseDynamicToString) required this.label,
      @JsonKey(fromJson: _parseDynamicToInt) this.page,
      @JsonKey(fromJson: _parseDynamicToBool) required this.active});

  factory _$SingleItemMetaLinkImpl.fromJson(Map<String, dynamic> json) =>
      _$$SingleItemMetaLinkImplFromJson(json);

  @override
  @JsonKey(fromJson: _parseDynamicToString)
  final String? url;
  @override
  @JsonKey(fromJson: _parseDynamicToString)
  final String label;
  @override
  @JsonKey(fromJson: _parseDynamicToInt)
  final int? page;
  @override
  @JsonKey(fromJson: _parseDynamicToBool)
  final bool active;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SingleItemMetaLink(url: $url, label: $label, page: $page, active: $active)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SingleItemMetaLink'))
      ..add(DiagnosticsProperty('url', url))
      ..add(DiagnosticsProperty('label', label))
      ..add(DiagnosticsProperty('page', page))
      ..add(DiagnosticsProperty('active', active));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SingleItemMetaLinkImpl &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.active, active) || other.active == active));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, url, label, page, active);

  /// Create a copy of SingleItemMetaLink
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SingleItemMetaLinkImplCopyWith<_$SingleItemMetaLinkImpl> get copyWith =>
      __$$SingleItemMetaLinkImplCopyWithImpl<_$SingleItemMetaLinkImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SingleItemMetaLinkImplToJson(
      this,
    );
  }
}

abstract class _SingleItemMetaLink implements SingleItemMetaLink {
  const factory _SingleItemMetaLink(
          {@JsonKey(fromJson: _parseDynamicToString) final String? url,
          @JsonKey(fromJson: _parseDynamicToString) required final String label,
          @JsonKey(fromJson: _parseDynamicToInt) final int? page,
          @JsonKey(fromJson: _parseDynamicToBool) required final bool active}) =
      _$SingleItemMetaLinkImpl;

  factory _SingleItemMetaLink.fromJson(Map<String, dynamic> json) =
      _$SingleItemMetaLinkImpl.fromJson;

  @override
  @JsonKey(fromJson: _parseDynamicToString)
  String? get url;
  @override
  @JsonKey(fromJson: _parseDynamicToString)
  String get label;
  @override
  @JsonKey(fromJson: _parseDynamicToInt)
  int? get page;
  @override
  @JsonKey(fromJson: _parseDynamicToBool)
  bool get active;

  /// Create a copy of SingleItemMetaLink
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SingleItemMetaLinkImplCopyWith<_$SingleItemMetaLinkImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
