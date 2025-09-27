// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verifyDealerModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

VerificationRequest _$VerificationRequestFromJson(Map<String, dynamic> json) {
  return _VerificationRequest.fromJson(json);
}

/// @nodoc
mixin _$VerificationRequest {
  String? get document_type => throw _privateConstructorUsedError;
  String? get document_number =>
      throw _privateConstructorUsedError; // String? dealer_name,  // Temporarily commented out
// String? location,     // Temporarily commented out
  String get document_front => throw _privateConstructorUsedError;
  String get document_back => throw _privateConstructorUsedError;
  String get selfie =>
      throw _privateConstructorUsedError; // String? company_registration_document,  // Temporarily commented out
  String? get status => throw _privateConstructorUsedError;
  String? get comment => throw _privateConstructorUsedError;
  String? get verified_by => throw _privateConstructorUsedError;
  String? get rejected_by => throw _privateConstructorUsedError;
  String? get approved_at => throw _privateConstructorUsedError;
  String? get rejected_at => throw _privateConstructorUsedError;

  /// Serializes this VerificationRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VerificationRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VerificationRequestCopyWith<VerificationRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerificationRequestCopyWith<$Res> {
  factory $VerificationRequestCopyWith(
          VerificationRequest value, $Res Function(VerificationRequest) then) =
      _$VerificationRequestCopyWithImpl<$Res, VerificationRequest>;
  @useResult
  $Res call(
      {String? document_type,
      String? document_number,
      String document_front,
      String document_back,
      String selfie,
      String? status,
      String? comment,
      String? verified_by,
      String? rejected_by,
      String? approved_at,
      String? rejected_at});
}

/// @nodoc
class _$VerificationRequestCopyWithImpl<$Res, $Val extends VerificationRequest>
    implements $VerificationRequestCopyWith<$Res> {
  _$VerificationRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VerificationRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? document_type = freezed,
    Object? document_number = freezed,
    Object? document_front = null,
    Object? document_back = null,
    Object? selfie = null,
    Object? status = freezed,
    Object? comment = freezed,
    Object? verified_by = freezed,
    Object? rejected_by = freezed,
    Object? approved_at = freezed,
    Object? rejected_at = freezed,
  }) {
    return _then(_value.copyWith(
      document_type: freezed == document_type
          ? _value.document_type
          : document_type // ignore: cast_nullable_to_non_nullable
              as String?,
      document_number: freezed == document_number
          ? _value.document_number
          : document_number // ignore: cast_nullable_to_non_nullable
              as String?,
      document_front: null == document_front
          ? _value.document_front
          : document_front // ignore: cast_nullable_to_non_nullable
              as String,
      document_back: null == document_back
          ? _value.document_back
          : document_back // ignore: cast_nullable_to_non_nullable
              as String,
      selfie: null == selfie
          ? _value.selfie
          : selfie // ignore: cast_nullable_to_non_nullable
              as String,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      comment: freezed == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
      verified_by: freezed == verified_by
          ? _value.verified_by
          : verified_by // ignore: cast_nullable_to_non_nullable
              as String?,
      rejected_by: freezed == rejected_by
          ? _value.rejected_by
          : rejected_by // ignore: cast_nullable_to_non_nullable
              as String?,
      approved_at: freezed == approved_at
          ? _value.approved_at
          : approved_at // ignore: cast_nullable_to_non_nullable
              as String?,
      rejected_at: freezed == rejected_at
          ? _value.rejected_at
          : rejected_at // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VerificationRequestImplCopyWith<$Res>
    implements $VerificationRequestCopyWith<$Res> {
  factory _$$VerificationRequestImplCopyWith(_$VerificationRequestImpl value,
          $Res Function(_$VerificationRequestImpl) then) =
      __$$VerificationRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? document_type,
      String? document_number,
      String document_front,
      String document_back,
      String selfie,
      String? status,
      String? comment,
      String? verified_by,
      String? rejected_by,
      String? approved_at,
      String? rejected_at});
}

/// @nodoc
class __$$VerificationRequestImplCopyWithImpl<$Res>
    extends _$VerificationRequestCopyWithImpl<$Res, _$VerificationRequestImpl>
    implements _$$VerificationRequestImplCopyWith<$Res> {
  __$$VerificationRequestImplCopyWithImpl(_$VerificationRequestImpl _value,
      $Res Function(_$VerificationRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of VerificationRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? document_type = freezed,
    Object? document_number = freezed,
    Object? document_front = null,
    Object? document_back = null,
    Object? selfie = null,
    Object? status = freezed,
    Object? comment = freezed,
    Object? verified_by = freezed,
    Object? rejected_by = freezed,
    Object? approved_at = freezed,
    Object? rejected_at = freezed,
  }) {
    return _then(_$VerificationRequestImpl(
      document_type: freezed == document_type
          ? _value.document_type
          : document_type // ignore: cast_nullable_to_non_nullable
              as String?,
      document_number: freezed == document_number
          ? _value.document_number
          : document_number // ignore: cast_nullable_to_non_nullable
              as String?,
      document_front: null == document_front
          ? _value.document_front
          : document_front // ignore: cast_nullable_to_non_nullable
              as String,
      document_back: null == document_back
          ? _value.document_back
          : document_back // ignore: cast_nullable_to_non_nullable
              as String,
      selfie: null == selfie
          ? _value.selfie
          : selfie // ignore: cast_nullable_to_non_nullable
              as String,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      comment: freezed == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
      verified_by: freezed == verified_by
          ? _value.verified_by
          : verified_by // ignore: cast_nullable_to_non_nullable
              as String?,
      rejected_by: freezed == rejected_by
          ? _value.rejected_by
          : rejected_by // ignore: cast_nullable_to_non_nullable
              as String?,
      approved_at: freezed == approved_at
          ? _value.approved_at
          : approved_at // ignore: cast_nullable_to_non_nullable
              as String?,
      rejected_at: freezed == rejected_at
          ? _value.rejected_at
          : rejected_at // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VerificationRequestImpl implements _VerificationRequest {
  const _$VerificationRequestImpl(
      {this.document_type,
      this.document_number,
      required this.document_front,
      required this.document_back,
      required this.selfie,
      this.status,
      this.comment,
      this.verified_by,
      this.rejected_by,
      this.approved_at,
      this.rejected_at});

  factory _$VerificationRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$VerificationRequestImplFromJson(json);

  @override
  final String? document_type;
  @override
  final String? document_number;
// String? dealer_name,  // Temporarily commented out
// String? location,     // Temporarily commented out
  @override
  final String document_front;
  @override
  final String document_back;
  @override
  final String selfie;
// String? company_registration_document,  // Temporarily commented out
  @override
  final String? status;
  @override
  final String? comment;
  @override
  final String? verified_by;
  @override
  final String? rejected_by;
  @override
  final String? approved_at;
  @override
  final String? rejected_at;

  @override
  String toString() {
    return 'VerificationRequest(document_type: $document_type, document_number: $document_number, document_front: $document_front, document_back: $document_back, selfie: $selfie, status: $status, comment: $comment, verified_by: $verified_by, rejected_by: $rejected_by, approved_at: $approved_at, rejected_at: $rejected_at)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerificationRequestImpl &&
            (identical(other.document_type, document_type) ||
                other.document_type == document_type) &&
            (identical(other.document_number, document_number) ||
                other.document_number == document_number) &&
            (identical(other.document_front, document_front) ||
                other.document_front == document_front) &&
            (identical(other.document_back, document_back) ||
                other.document_back == document_back) &&
            (identical(other.selfie, selfie) || other.selfie == selfie) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.verified_by, verified_by) ||
                other.verified_by == verified_by) &&
            (identical(other.rejected_by, rejected_by) ||
                other.rejected_by == rejected_by) &&
            (identical(other.approved_at, approved_at) ||
                other.approved_at == approved_at) &&
            (identical(other.rejected_at, rejected_at) ||
                other.rejected_at == rejected_at));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      document_type,
      document_number,
      document_front,
      document_back,
      selfie,
      status,
      comment,
      verified_by,
      rejected_by,
      approved_at,
      rejected_at);

  /// Create a copy of VerificationRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VerificationRequestImplCopyWith<_$VerificationRequestImpl> get copyWith =>
      __$$VerificationRequestImplCopyWithImpl<_$VerificationRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VerificationRequestImplToJson(
      this,
    );
  }
}

abstract class _VerificationRequest implements VerificationRequest {
  const factory _VerificationRequest(
      {final String? document_type,
      final String? document_number,
      required final String document_front,
      required final String document_back,
      required final String selfie,
      final String? status,
      final String? comment,
      final String? verified_by,
      final String? rejected_by,
      final String? approved_at,
      final String? rejected_at}) = _$VerificationRequestImpl;

  factory _VerificationRequest.fromJson(Map<String, dynamic> json) =
      _$VerificationRequestImpl.fromJson;

  @override
  String? get document_type;
  @override
  String?
      get document_number; // String? dealer_name,  // Temporarily commented out
// String? location,     // Temporarily commented out
  @override
  String get document_front;
  @override
  String get document_back;
  @override
  String
      get selfie; // String? company_registration_document,  // Temporarily commented out
  @override
  String? get status;
  @override
  String? get comment;
  @override
  String? get verified_by;
  @override
  String? get rejected_by;
  @override
  String? get approved_at;
  @override
  String? get rejected_at;

  /// Create a copy of VerificationRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VerificationRequestImplCopyWith<_$VerificationRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

VerificationResponse _$VerificationResponseFromJson(Map<String, dynamic> json) {
  return _VerificationResponse.fromJson(json);
}

/// @nodoc
mixin _$VerificationResponse {
  bool get success => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  VerificationData? get data => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  /// Serializes this VerificationResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VerificationResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VerificationResponseCopyWith<VerificationResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerificationResponseCopyWith<$Res> {
  factory $VerificationResponseCopyWith(VerificationResponse value,
          $Res Function(VerificationResponse) then) =
      _$VerificationResponseCopyWithImpl<$Res, VerificationResponse>;
  @useResult
  $Res call(
      {bool success, String? message, VerificationData? data, String? error});

  $VerificationDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$VerificationResponseCopyWithImpl<$Res,
        $Val extends VerificationResponse>
    implements $VerificationResponseCopyWith<$Res> {
  _$VerificationResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VerificationResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = freezed,
    Object? data = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as VerificationData?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of VerificationResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VerificationDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $VerificationDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$VerificationResponseImplCopyWith<$Res>
    implements $VerificationResponseCopyWith<$Res> {
  factory _$$VerificationResponseImplCopyWith(_$VerificationResponseImpl value,
          $Res Function(_$VerificationResponseImpl) then) =
      __$$VerificationResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool success, String? message, VerificationData? data, String? error});

  @override
  $VerificationDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$VerificationResponseImplCopyWithImpl<$Res>
    extends _$VerificationResponseCopyWithImpl<$Res, _$VerificationResponseImpl>
    implements _$$VerificationResponseImplCopyWith<$Res> {
  __$$VerificationResponseImplCopyWithImpl(_$VerificationResponseImpl _value,
      $Res Function(_$VerificationResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of VerificationResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = freezed,
    Object? data = freezed,
    Object? error = freezed,
  }) {
    return _then(_$VerificationResponseImpl(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as VerificationData?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VerificationResponseImpl implements _VerificationResponse {
  const _$VerificationResponseImpl(
      {required this.success, this.message, this.data, this.error});

  factory _$VerificationResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$VerificationResponseImplFromJson(json);

  @override
  final bool success;
  @override
  final String? message;
  @override
  final VerificationData? data;
  @override
  final String? error;

  @override
  String toString() {
    return 'VerificationResponse(success: $success, message: $message, data: $data, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerificationResponseImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.error, error) || other.error == error));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success, message, data, error);

  /// Create a copy of VerificationResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VerificationResponseImplCopyWith<_$VerificationResponseImpl>
      get copyWith =>
          __$$VerificationResponseImplCopyWithImpl<_$VerificationResponseImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VerificationResponseImplToJson(
      this,
    );
  }
}

abstract class _VerificationResponse implements VerificationResponse {
  const factory _VerificationResponse(
      {required final bool success,
      final String? message,
      final VerificationData? data,
      final String? error}) = _$VerificationResponseImpl;

  factory _VerificationResponse.fromJson(Map<String, dynamic> json) =
      _$VerificationResponseImpl.fromJson;

  @override
  bool get success;
  @override
  String? get message;
  @override
  VerificationData? get data;
  @override
  String? get error;

  /// Create a copy of VerificationResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VerificationResponseImplCopyWith<_$VerificationResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

VerificationData _$VerificationDataFromJson(Map<String, dynamic> json) {
  return _VerificationData.fromJson(json);
}

/// @nodoc
mixin _$VerificationData {
  int get id => throw _privateConstructorUsedError;
  String? get document_type => throw _privateConstructorUsedError;
  String? get document_number =>
      throw _privateConstructorUsedError; // String? dealer_name,  // Temporarily commented out
// String? location,     // Temporarily commented out
  String get document_front => throw _privateConstructorUsedError;
  String get document_back => throw _privateConstructorUsedError;
  String get selfie => throw _privateConstructorUsedError;
  String? get status =>
      throw _privateConstructorUsedError; // String? company_registration_document,  // Temporarily commented out
  String? get comment => throw _privateConstructorUsedError;
  String? get verified_by => throw _privateConstructorUsedError;
  String? get rejected_by => throw _privateConstructorUsedError;
  String? get approved_at => throw _privateConstructorUsedError;
  String? get rejected_at => throw _privateConstructorUsedError;
  String? get created_at => throw _privateConstructorUsedError;
  String? get updated_at => throw _privateConstructorUsedError;

  /// Serializes this VerificationData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VerificationData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VerificationDataCopyWith<VerificationData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerificationDataCopyWith<$Res> {
  factory $VerificationDataCopyWith(
          VerificationData value, $Res Function(VerificationData) then) =
      _$VerificationDataCopyWithImpl<$Res, VerificationData>;
  @useResult
  $Res call(
      {int id,
      String? document_type,
      String? document_number,
      String document_front,
      String document_back,
      String selfie,
      String? status,
      String? comment,
      String? verified_by,
      String? rejected_by,
      String? approved_at,
      String? rejected_at,
      String? created_at,
      String? updated_at});
}

/// @nodoc
class _$VerificationDataCopyWithImpl<$Res, $Val extends VerificationData>
    implements $VerificationDataCopyWith<$Res> {
  _$VerificationDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VerificationData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? document_type = freezed,
    Object? document_number = freezed,
    Object? document_front = null,
    Object? document_back = null,
    Object? selfie = null,
    Object? status = freezed,
    Object? comment = freezed,
    Object? verified_by = freezed,
    Object? rejected_by = freezed,
    Object? approved_at = freezed,
    Object? rejected_at = freezed,
    Object? created_at = freezed,
    Object? updated_at = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      document_type: freezed == document_type
          ? _value.document_type
          : document_type // ignore: cast_nullable_to_non_nullable
              as String?,
      document_number: freezed == document_number
          ? _value.document_number
          : document_number // ignore: cast_nullable_to_non_nullable
              as String?,
      document_front: null == document_front
          ? _value.document_front
          : document_front // ignore: cast_nullable_to_non_nullable
              as String,
      document_back: null == document_back
          ? _value.document_back
          : document_back // ignore: cast_nullable_to_non_nullable
              as String,
      selfie: null == selfie
          ? _value.selfie
          : selfie // ignore: cast_nullable_to_non_nullable
              as String,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      comment: freezed == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
      verified_by: freezed == verified_by
          ? _value.verified_by
          : verified_by // ignore: cast_nullable_to_non_nullable
              as String?,
      rejected_by: freezed == rejected_by
          ? _value.rejected_by
          : rejected_by // ignore: cast_nullable_to_non_nullable
              as String?,
      approved_at: freezed == approved_at
          ? _value.approved_at
          : approved_at // ignore: cast_nullable_to_non_nullable
              as String?,
      rejected_at: freezed == rejected_at
          ? _value.rejected_at
          : rejected_at // ignore: cast_nullable_to_non_nullable
              as String?,
      created_at: freezed == created_at
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as String?,
      updated_at: freezed == updated_at
          ? _value.updated_at
          : updated_at // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VerificationDataImplCopyWith<$Res>
    implements $VerificationDataCopyWith<$Res> {
  factory _$$VerificationDataImplCopyWith(_$VerificationDataImpl value,
          $Res Function(_$VerificationDataImpl) then) =
      __$$VerificationDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String? document_type,
      String? document_number,
      String document_front,
      String document_back,
      String selfie,
      String? status,
      String? comment,
      String? verified_by,
      String? rejected_by,
      String? approved_at,
      String? rejected_at,
      String? created_at,
      String? updated_at});
}

/// @nodoc
class __$$VerificationDataImplCopyWithImpl<$Res>
    extends _$VerificationDataCopyWithImpl<$Res, _$VerificationDataImpl>
    implements _$$VerificationDataImplCopyWith<$Res> {
  __$$VerificationDataImplCopyWithImpl(_$VerificationDataImpl _value,
      $Res Function(_$VerificationDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of VerificationData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? document_type = freezed,
    Object? document_number = freezed,
    Object? document_front = null,
    Object? document_back = null,
    Object? selfie = null,
    Object? status = freezed,
    Object? comment = freezed,
    Object? verified_by = freezed,
    Object? rejected_by = freezed,
    Object? approved_at = freezed,
    Object? rejected_at = freezed,
    Object? created_at = freezed,
    Object? updated_at = freezed,
  }) {
    return _then(_$VerificationDataImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      document_type: freezed == document_type
          ? _value.document_type
          : document_type // ignore: cast_nullable_to_non_nullable
              as String?,
      document_number: freezed == document_number
          ? _value.document_number
          : document_number // ignore: cast_nullable_to_non_nullable
              as String?,
      document_front: null == document_front
          ? _value.document_front
          : document_front // ignore: cast_nullable_to_non_nullable
              as String,
      document_back: null == document_back
          ? _value.document_back
          : document_back // ignore: cast_nullable_to_non_nullable
              as String,
      selfie: null == selfie
          ? _value.selfie
          : selfie // ignore: cast_nullable_to_non_nullable
              as String,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      comment: freezed == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
      verified_by: freezed == verified_by
          ? _value.verified_by
          : verified_by // ignore: cast_nullable_to_non_nullable
              as String?,
      rejected_by: freezed == rejected_by
          ? _value.rejected_by
          : rejected_by // ignore: cast_nullable_to_non_nullable
              as String?,
      approved_at: freezed == approved_at
          ? _value.approved_at
          : approved_at // ignore: cast_nullable_to_non_nullable
              as String?,
      rejected_at: freezed == rejected_at
          ? _value.rejected_at
          : rejected_at // ignore: cast_nullable_to_non_nullable
              as String?,
      created_at: freezed == created_at
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as String?,
      updated_at: freezed == updated_at
          ? _value.updated_at
          : updated_at // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VerificationDataImpl implements _VerificationData {
  const _$VerificationDataImpl(
      {required this.id,
      this.document_type,
      this.document_number,
      required this.document_front,
      required this.document_back,
      required this.selfie,
      this.status,
      this.comment,
      this.verified_by,
      this.rejected_by,
      this.approved_at,
      this.rejected_at,
      this.created_at,
      this.updated_at});

  factory _$VerificationDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$VerificationDataImplFromJson(json);

  @override
  final int id;
  @override
  final String? document_type;
  @override
  final String? document_number;
// String? dealer_name,  // Temporarily commented out
// String? location,     // Temporarily commented out
  @override
  final String document_front;
  @override
  final String document_back;
  @override
  final String selfie;
  @override
  final String? status;
// String? company_registration_document,  // Temporarily commented out
  @override
  final String? comment;
  @override
  final String? verified_by;
  @override
  final String? rejected_by;
  @override
  final String? approved_at;
  @override
  final String? rejected_at;
  @override
  final String? created_at;
  @override
  final String? updated_at;

  @override
  String toString() {
    return 'VerificationData(id: $id, document_type: $document_type, document_number: $document_number, document_front: $document_front, document_back: $document_back, selfie: $selfie, status: $status, comment: $comment, verified_by: $verified_by, rejected_by: $rejected_by, approved_at: $approved_at, rejected_at: $rejected_at, created_at: $created_at, updated_at: $updated_at)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerificationDataImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.document_type, document_type) ||
                other.document_type == document_type) &&
            (identical(other.document_number, document_number) ||
                other.document_number == document_number) &&
            (identical(other.document_front, document_front) ||
                other.document_front == document_front) &&
            (identical(other.document_back, document_back) ||
                other.document_back == document_back) &&
            (identical(other.selfie, selfie) || other.selfie == selfie) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.verified_by, verified_by) ||
                other.verified_by == verified_by) &&
            (identical(other.rejected_by, rejected_by) ||
                other.rejected_by == rejected_by) &&
            (identical(other.approved_at, approved_at) ||
                other.approved_at == approved_at) &&
            (identical(other.rejected_at, rejected_at) ||
                other.rejected_at == rejected_at) &&
            (identical(other.created_at, created_at) ||
                other.created_at == created_at) &&
            (identical(other.updated_at, updated_at) ||
                other.updated_at == updated_at));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      document_type,
      document_number,
      document_front,
      document_back,
      selfie,
      status,
      comment,
      verified_by,
      rejected_by,
      approved_at,
      rejected_at,
      created_at,
      updated_at);

  /// Create a copy of VerificationData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VerificationDataImplCopyWith<_$VerificationDataImpl> get copyWith =>
      __$$VerificationDataImplCopyWithImpl<_$VerificationDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VerificationDataImplToJson(
      this,
    );
  }
}

abstract class _VerificationData implements VerificationData {
  const factory _VerificationData(
      {required final int id,
      final String? document_type,
      final String? document_number,
      required final String document_front,
      required final String document_back,
      required final String selfie,
      final String? status,
      final String? comment,
      final String? verified_by,
      final String? rejected_by,
      final String? approved_at,
      final String? rejected_at,
      final String? created_at,
      final String? updated_at}) = _$VerificationDataImpl;

  factory _VerificationData.fromJson(Map<String, dynamic> json) =
      _$VerificationDataImpl.fromJson;

  @override
  int get id;
  @override
  String? get document_type;
  @override
  String?
      get document_number; // String? dealer_name,  // Temporarily commented out
// String? location,     // Temporarily commented out
  @override
  String get document_front;
  @override
  String get document_back;
  @override
  String get selfie;
  @override
  String?
      get status; // String? company_registration_document,  // Temporarily commented out
  @override
  String? get comment;
  @override
  String? get verified_by;
  @override
  String? get rejected_by;
  @override
  String? get approved_at;
  @override
  String? get rejected_at;
  @override
  String? get created_at;
  @override
  String? get updated_at;

  /// Create a copy of VerificationData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VerificationDataImplCopyWith<_$VerificationDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
