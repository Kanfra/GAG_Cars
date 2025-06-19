// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'authWithEmailModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AuthWithEmailModel _$AuthWithEmailModelFromJson(Map<String, dynamic> json) {
  return _AuthWithEmailModel.fromJson(json);
}

/// @nodoc
mixin _$AuthWithEmailModel {
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String? get phoneNumber => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;
  String? get profileImage => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;

  /// Serializes this AuthWithEmailModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AuthWithEmailModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AuthWithEmailModelCopyWith<AuthWithEmailModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthWithEmailModelCopyWith<$Res> {
  factory $AuthWithEmailModelCopyWith(
          AuthWithEmailModel value, $Res Function(AuthWithEmailModel) then) =
      _$AuthWithEmailModelCopyWithImpl<$Res, AuthWithEmailModel>;
  @useResult
  $Res call(
      {String name,
      String email,
      String password,
      String? phoneNumber,
      String? id,
      String? profileImage,
      DateTime? createdAt});
}

/// @nodoc
class _$AuthWithEmailModelCopyWithImpl<$Res, $Val extends AuthWithEmailModel>
    implements $AuthWithEmailModelCopyWith<$Res> {
  _$AuthWithEmailModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthWithEmailModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? email = null,
    Object? password = null,
    Object? phoneNumber = freezed,
    Object? id = freezed,
    Object? profileImage = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      profileImage: freezed == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AuthWithEmailModelImplCopyWith<$Res>
    implements $AuthWithEmailModelCopyWith<$Res> {
  factory _$$AuthWithEmailModelImplCopyWith(_$AuthWithEmailModelImpl value,
          $Res Function(_$AuthWithEmailModelImpl) then) =
      __$$AuthWithEmailModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String email,
      String password,
      String? phoneNumber,
      String? id,
      String? profileImage,
      DateTime? createdAt});
}

/// @nodoc
class __$$AuthWithEmailModelImplCopyWithImpl<$Res>
    extends _$AuthWithEmailModelCopyWithImpl<$Res, _$AuthWithEmailModelImpl>
    implements _$$AuthWithEmailModelImplCopyWith<$Res> {
  __$$AuthWithEmailModelImplCopyWithImpl(_$AuthWithEmailModelImpl _value,
      $Res Function(_$AuthWithEmailModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthWithEmailModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? email = null,
    Object? password = null,
    Object? phoneNumber = freezed,
    Object? id = freezed,
    Object? profileImage = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$AuthWithEmailModelImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      profileImage: freezed == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AuthWithEmailModelImpl implements _AuthWithEmailModel {
  const _$AuthWithEmailModelImpl(
      {required this.name,
      required this.email,
      required this.password,
      this.phoneNumber,
      this.id,
      this.profileImage,
      this.createdAt});

  factory _$AuthWithEmailModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AuthWithEmailModelImplFromJson(json);

  @override
  final String name;
  @override
  final String email;
  @override
  final String password;
  @override
  final String? phoneNumber;
  @override
  final String? id;
  @override
  final String? profileImage;
  @override
  final DateTime? createdAt;

  @override
  String toString() {
    return 'AuthWithEmailModel(name: $name, email: $email, password: $password, phoneNumber: $phoneNumber, id: $id, profileImage: $profileImage, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthWithEmailModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.profileImage, profileImage) ||
                other.profileImage == profileImage) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, email, password,
      phoneNumber, id, profileImage, createdAt);

  /// Create a copy of AuthWithEmailModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthWithEmailModelImplCopyWith<_$AuthWithEmailModelImpl> get copyWith =>
      __$$AuthWithEmailModelImplCopyWithImpl<_$AuthWithEmailModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AuthWithEmailModelImplToJson(
      this,
    );
  }
}

abstract class _AuthWithEmailModel implements AuthWithEmailModel {
  const factory _AuthWithEmailModel(
      {required final String name,
      required final String email,
      required final String password,
      final String? phoneNumber,
      final String? id,
      final String? profileImage,
      final DateTime? createdAt}) = _$AuthWithEmailModelImpl;

  factory _AuthWithEmailModel.fromJson(Map<String, dynamic> json) =
      _$AuthWithEmailModelImpl.fromJson;

  @override
  String get name;
  @override
  String get email;
  @override
  String get password;
  @override
  String? get phoneNumber;
  @override
  String? get id;
  @override
  String? get profileImage;
  @override
  DateTime? get createdAt;

  /// Create a copy of AuthWithEmailModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthWithEmailModelImplCopyWith<_$AuthWithEmailModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
