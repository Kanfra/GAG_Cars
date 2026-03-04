// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verifyDealerModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VerificationRequest {

 String? get document_type; String? get document_number; String? get dealership_name;// Temporarily commented out
 String? get address;// Temporarily commented out
 String get document_front; String get document_back; String get selfie; String? get verification_type; String? get dealership_registration_document;// Temporarily commented out
 String? get status; String? get comment; String? get verified_by; String? get rejected_by; String? get approved_at; String? get rejected_at;
/// Create a copy of VerificationRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VerificationRequestCopyWith<VerificationRequest> get copyWith => _$VerificationRequestCopyWithImpl<VerificationRequest>(this as VerificationRequest, _$identity);

  /// Serializes this VerificationRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VerificationRequest&&(identical(other.document_type, document_type) || other.document_type == document_type)&&(identical(other.document_number, document_number) || other.document_number == document_number)&&(identical(other.dealership_name, dealership_name) || other.dealership_name == dealership_name)&&(identical(other.address, address) || other.address == address)&&(identical(other.document_front, document_front) || other.document_front == document_front)&&(identical(other.document_back, document_back) || other.document_back == document_back)&&(identical(other.selfie, selfie) || other.selfie == selfie)&&(identical(other.verification_type, verification_type) || other.verification_type == verification_type)&&(identical(other.dealership_registration_document, dealership_registration_document) || other.dealership_registration_document == dealership_registration_document)&&(identical(other.status, status) || other.status == status)&&(identical(other.comment, comment) || other.comment == comment)&&(identical(other.verified_by, verified_by) || other.verified_by == verified_by)&&(identical(other.rejected_by, rejected_by) || other.rejected_by == rejected_by)&&(identical(other.approved_at, approved_at) || other.approved_at == approved_at)&&(identical(other.rejected_at, rejected_at) || other.rejected_at == rejected_at));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,document_type,document_number,dealership_name,address,document_front,document_back,selfie,verification_type,dealership_registration_document,status,comment,verified_by,rejected_by,approved_at,rejected_at);

@override
String toString() {
  return 'VerificationRequest(document_type: $document_type, document_number: $document_number, dealership_name: $dealership_name, address: $address, document_front: $document_front, document_back: $document_back, selfie: $selfie, verification_type: $verification_type, dealership_registration_document: $dealership_registration_document, status: $status, comment: $comment, verified_by: $verified_by, rejected_by: $rejected_by, approved_at: $approved_at, rejected_at: $rejected_at)';
}


}

/// @nodoc
abstract mixin class $VerificationRequestCopyWith<$Res>  {
  factory $VerificationRequestCopyWith(VerificationRequest value, $Res Function(VerificationRequest) _then) = _$VerificationRequestCopyWithImpl;
@useResult
$Res call({
 String? document_type, String? document_number, String? dealership_name, String? address, String document_front, String document_back, String selfie, String? verification_type, String? dealership_registration_document, String? status, String? comment, String? verified_by, String? rejected_by, String? approved_at, String? rejected_at
});




}
/// @nodoc
class _$VerificationRequestCopyWithImpl<$Res>
    implements $VerificationRequestCopyWith<$Res> {
  _$VerificationRequestCopyWithImpl(this._self, this._then);

  final VerificationRequest _self;
  final $Res Function(VerificationRequest) _then;

/// Create a copy of VerificationRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? document_type = freezed,Object? document_number = freezed,Object? dealership_name = freezed,Object? address = freezed,Object? document_front = null,Object? document_back = null,Object? selfie = null,Object? verification_type = freezed,Object? dealership_registration_document = freezed,Object? status = freezed,Object? comment = freezed,Object? verified_by = freezed,Object? rejected_by = freezed,Object? approved_at = freezed,Object? rejected_at = freezed,}) {
  return _then(_self.copyWith(
document_type: freezed == document_type ? _self.document_type : document_type // ignore: cast_nullable_to_non_nullable
as String?,document_number: freezed == document_number ? _self.document_number : document_number // ignore: cast_nullable_to_non_nullable
as String?,dealership_name: freezed == dealership_name ? _self.dealership_name : dealership_name // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,document_front: null == document_front ? _self.document_front : document_front // ignore: cast_nullable_to_non_nullable
as String,document_back: null == document_back ? _self.document_back : document_back // ignore: cast_nullable_to_non_nullable
as String,selfie: null == selfie ? _self.selfie : selfie // ignore: cast_nullable_to_non_nullable
as String,verification_type: freezed == verification_type ? _self.verification_type : verification_type // ignore: cast_nullable_to_non_nullable
as String?,dealership_registration_document: freezed == dealership_registration_document ? _self.dealership_registration_document : dealership_registration_document // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,comment: freezed == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String?,verified_by: freezed == verified_by ? _self.verified_by : verified_by // ignore: cast_nullable_to_non_nullable
as String?,rejected_by: freezed == rejected_by ? _self.rejected_by : rejected_by // ignore: cast_nullable_to_non_nullable
as String?,approved_at: freezed == approved_at ? _self.approved_at : approved_at // ignore: cast_nullable_to_non_nullable
as String?,rejected_at: freezed == rejected_at ? _self.rejected_at : rejected_at // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [VerificationRequest].
extension VerificationRequestPatterns on VerificationRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VerificationRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VerificationRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VerificationRequest value)  $default,){
final _that = this;
switch (_that) {
case _VerificationRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VerificationRequest value)?  $default,){
final _that = this;
switch (_that) {
case _VerificationRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? document_type,  String? document_number,  String? dealership_name,  String? address,  String document_front,  String document_back,  String selfie,  String? verification_type,  String? dealership_registration_document,  String? status,  String? comment,  String? verified_by,  String? rejected_by,  String? approved_at,  String? rejected_at)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VerificationRequest() when $default != null:
return $default(_that.document_type,_that.document_number,_that.dealership_name,_that.address,_that.document_front,_that.document_back,_that.selfie,_that.verification_type,_that.dealership_registration_document,_that.status,_that.comment,_that.verified_by,_that.rejected_by,_that.approved_at,_that.rejected_at);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? document_type,  String? document_number,  String? dealership_name,  String? address,  String document_front,  String document_back,  String selfie,  String? verification_type,  String? dealership_registration_document,  String? status,  String? comment,  String? verified_by,  String? rejected_by,  String? approved_at,  String? rejected_at)  $default,) {final _that = this;
switch (_that) {
case _VerificationRequest():
return $default(_that.document_type,_that.document_number,_that.dealership_name,_that.address,_that.document_front,_that.document_back,_that.selfie,_that.verification_type,_that.dealership_registration_document,_that.status,_that.comment,_that.verified_by,_that.rejected_by,_that.approved_at,_that.rejected_at);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? document_type,  String? document_number,  String? dealership_name,  String? address,  String document_front,  String document_back,  String selfie,  String? verification_type,  String? dealership_registration_document,  String? status,  String? comment,  String? verified_by,  String? rejected_by,  String? approved_at,  String? rejected_at)?  $default,) {final _that = this;
switch (_that) {
case _VerificationRequest() when $default != null:
return $default(_that.document_type,_that.document_number,_that.dealership_name,_that.address,_that.document_front,_that.document_back,_that.selfie,_that.verification_type,_that.dealership_registration_document,_that.status,_that.comment,_that.verified_by,_that.rejected_by,_that.approved_at,_that.rejected_at);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VerificationRequest implements VerificationRequest {
  const _VerificationRequest({this.document_type, this.document_number, this.dealership_name, this.address, required this.document_front, required this.document_back, required this.selfie, this.verification_type, this.dealership_registration_document, this.status, this.comment, this.verified_by, this.rejected_by, this.approved_at, this.rejected_at});
  factory _VerificationRequest.fromJson(Map<String, dynamic> json) => _$VerificationRequestFromJson(json);

@override final  String? document_type;
@override final  String? document_number;
@override final  String? dealership_name;
// Temporarily commented out
@override final  String? address;
// Temporarily commented out
@override final  String document_front;
@override final  String document_back;
@override final  String selfie;
@override final  String? verification_type;
@override final  String? dealership_registration_document;
// Temporarily commented out
@override final  String? status;
@override final  String? comment;
@override final  String? verified_by;
@override final  String? rejected_by;
@override final  String? approved_at;
@override final  String? rejected_at;

/// Create a copy of VerificationRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VerificationRequestCopyWith<_VerificationRequest> get copyWith => __$VerificationRequestCopyWithImpl<_VerificationRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VerificationRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VerificationRequest&&(identical(other.document_type, document_type) || other.document_type == document_type)&&(identical(other.document_number, document_number) || other.document_number == document_number)&&(identical(other.dealership_name, dealership_name) || other.dealership_name == dealership_name)&&(identical(other.address, address) || other.address == address)&&(identical(other.document_front, document_front) || other.document_front == document_front)&&(identical(other.document_back, document_back) || other.document_back == document_back)&&(identical(other.selfie, selfie) || other.selfie == selfie)&&(identical(other.verification_type, verification_type) || other.verification_type == verification_type)&&(identical(other.dealership_registration_document, dealership_registration_document) || other.dealership_registration_document == dealership_registration_document)&&(identical(other.status, status) || other.status == status)&&(identical(other.comment, comment) || other.comment == comment)&&(identical(other.verified_by, verified_by) || other.verified_by == verified_by)&&(identical(other.rejected_by, rejected_by) || other.rejected_by == rejected_by)&&(identical(other.approved_at, approved_at) || other.approved_at == approved_at)&&(identical(other.rejected_at, rejected_at) || other.rejected_at == rejected_at));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,document_type,document_number,dealership_name,address,document_front,document_back,selfie,verification_type,dealership_registration_document,status,comment,verified_by,rejected_by,approved_at,rejected_at);

@override
String toString() {
  return 'VerificationRequest(document_type: $document_type, document_number: $document_number, dealership_name: $dealership_name, address: $address, document_front: $document_front, document_back: $document_back, selfie: $selfie, verification_type: $verification_type, dealership_registration_document: $dealership_registration_document, status: $status, comment: $comment, verified_by: $verified_by, rejected_by: $rejected_by, approved_at: $approved_at, rejected_at: $rejected_at)';
}


}

/// @nodoc
abstract mixin class _$VerificationRequestCopyWith<$Res> implements $VerificationRequestCopyWith<$Res> {
  factory _$VerificationRequestCopyWith(_VerificationRequest value, $Res Function(_VerificationRequest) _then) = __$VerificationRequestCopyWithImpl;
@override @useResult
$Res call({
 String? document_type, String? document_number, String? dealership_name, String? address, String document_front, String document_back, String selfie, String? verification_type, String? dealership_registration_document, String? status, String? comment, String? verified_by, String? rejected_by, String? approved_at, String? rejected_at
});




}
/// @nodoc
class __$VerificationRequestCopyWithImpl<$Res>
    implements _$VerificationRequestCopyWith<$Res> {
  __$VerificationRequestCopyWithImpl(this._self, this._then);

  final _VerificationRequest _self;
  final $Res Function(_VerificationRequest) _then;

/// Create a copy of VerificationRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? document_type = freezed,Object? document_number = freezed,Object? dealership_name = freezed,Object? address = freezed,Object? document_front = null,Object? document_back = null,Object? selfie = null,Object? verification_type = freezed,Object? dealership_registration_document = freezed,Object? status = freezed,Object? comment = freezed,Object? verified_by = freezed,Object? rejected_by = freezed,Object? approved_at = freezed,Object? rejected_at = freezed,}) {
  return _then(_VerificationRequest(
document_type: freezed == document_type ? _self.document_type : document_type // ignore: cast_nullable_to_non_nullable
as String?,document_number: freezed == document_number ? _self.document_number : document_number // ignore: cast_nullable_to_non_nullable
as String?,dealership_name: freezed == dealership_name ? _self.dealership_name : dealership_name // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,document_front: null == document_front ? _self.document_front : document_front // ignore: cast_nullable_to_non_nullable
as String,document_back: null == document_back ? _self.document_back : document_back // ignore: cast_nullable_to_non_nullable
as String,selfie: null == selfie ? _self.selfie : selfie // ignore: cast_nullable_to_non_nullable
as String,verification_type: freezed == verification_type ? _self.verification_type : verification_type // ignore: cast_nullable_to_non_nullable
as String?,dealership_registration_document: freezed == dealership_registration_document ? _self.dealership_registration_document : dealership_registration_document // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,comment: freezed == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String?,verified_by: freezed == verified_by ? _self.verified_by : verified_by // ignore: cast_nullable_to_non_nullable
as String?,rejected_by: freezed == rejected_by ? _self.rejected_by : rejected_by // ignore: cast_nullable_to_non_nullable
as String?,approved_at: freezed == approved_at ? _self.approved_at : approved_at // ignore: cast_nullable_to_non_nullable
as String?,rejected_at: freezed == rejected_at ? _self.rejected_at : rejected_at // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$VerificationResponse {

 bool get success; String? get message; VerificationData? get data; String? get error;
/// Create a copy of VerificationResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VerificationResponseCopyWith<VerificationResponse> get copyWith => _$VerificationResponseCopyWithImpl<VerificationResponse>(this as VerificationResponse, _$identity);

  /// Serializes this VerificationResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VerificationResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data)&&(identical(other.error, error) || other.error == error));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,data,error);

@override
String toString() {
  return 'VerificationResponse(success: $success, message: $message, data: $data, error: $error)';
}


}

/// @nodoc
abstract mixin class $VerificationResponseCopyWith<$Res>  {
  factory $VerificationResponseCopyWith(VerificationResponse value, $Res Function(VerificationResponse) _then) = _$VerificationResponseCopyWithImpl;
@useResult
$Res call({
 bool success, String? message, VerificationData? data, String? error
});


$VerificationDataCopyWith<$Res>? get data;

}
/// @nodoc
class _$VerificationResponseCopyWithImpl<$Res>
    implements $VerificationResponseCopyWith<$Res> {
  _$VerificationResponseCopyWithImpl(this._self, this._then);

  final VerificationResponse _self;
  final $Res Function(VerificationResponse) _then;

/// Create a copy of VerificationResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? message = freezed,Object? data = freezed,Object? error = freezed,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as VerificationData?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of VerificationResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VerificationDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $VerificationDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [VerificationResponse].
extension VerificationResponsePatterns on VerificationResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VerificationResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VerificationResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VerificationResponse value)  $default,){
final _that = this;
switch (_that) {
case _VerificationResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VerificationResponse value)?  $default,){
final _that = this;
switch (_that) {
case _VerificationResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success,  String? message,  VerificationData? data,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VerificationResponse() when $default != null:
return $default(_that.success,_that.message,_that.data,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success,  String? message,  VerificationData? data,  String? error)  $default,) {final _that = this;
switch (_that) {
case _VerificationResponse():
return $default(_that.success,_that.message,_that.data,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success,  String? message,  VerificationData? data,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _VerificationResponse() when $default != null:
return $default(_that.success,_that.message,_that.data,_that.error);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VerificationResponse implements VerificationResponse {
  const _VerificationResponse({required this.success, this.message, this.data, this.error});
  factory _VerificationResponse.fromJson(Map<String, dynamic> json) => _$VerificationResponseFromJson(json);

@override final  bool success;
@override final  String? message;
@override final  VerificationData? data;
@override final  String? error;

/// Create a copy of VerificationResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VerificationResponseCopyWith<_VerificationResponse> get copyWith => __$VerificationResponseCopyWithImpl<_VerificationResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VerificationResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VerificationResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data)&&(identical(other.error, error) || other.error == error));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,data,error);

@override
String toString() {
  return 'VerificationResponse(success: $success, message: $message, data: $data, error: $error)';
}


}

/// @nodoc
abstract mixin class _$VerificationResponseCopyWith<$Res> implements $VerificationResponseCopyWith<$Res> {
  factory _$VerificationResponseCopyWith(_VerificationResponse value, $Res Function(_VerificationResponse) _then) = __$VerificationResponseCopyWithImpl;
@override @useResult
$Res call({
 bool success, String? message, VerificationData? data, String? error
});


@override $VerificationDataCopyWith<$Res>? get data;

}
/// @nodoc
class __$VerificationResponseCopyWithImpl<$Res>
    implements _$VerificationResponseCopyWith<$Res> {
  __$VerificationResponseCopyWithImpl(this._self, this._then);

  final _VerificationResponse _self;
  final $Res Function(_VerificationResponse) _then;

/// Create a copy of VerificationResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? message = freezed,Object? data = freezed,Object? error = freezed,}) {
  return _then(_VerificationResponse(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as VerificationData?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of VerificationResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VerificationDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $VerificationDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$VerificationData {

 int get id; String? get document_type; String? get document_number; String? get dealership_name;// Temporarily commented out
 String? get address;// Temporarily commented out
 String get document_front; String get document_back; String get selfie; String? get status; String? get dealership_registration_document;// Temporarily commented out
 String? get comment; String? get verified_by; String? get verification_type; String? get rejected_by; String? get approved_at; String? get rejected_at; String? get created_at; String? get updated_at;
/// Create a copy of VerificationData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VerificationDataCopyWith<VerificationData> get copyWith => _$VerificationDataCopyWithImpl<VerificationData>(this as VerificationData, _$identity);

  /// Serializes this VerificationData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VerificationData&&(identical(other.id, id) || other.id == id)&&(identical(other.document_type, document_type) || other.document_type == document_type)&&(identical(other.document_number, document_number) || other.document_number == document_number)&&(identical(other.dealership_name, dealership_name) || other.dealership_name == dealership_name)&&(identical(other.address, address) || other.address == address)&&(identical(other.document_front, document_front) || other.document_front == document_front)&&(identical(other.document_back, document_back) || other.document_back == document_back)&&(identical(other.selfie, selfie) || other.selfie == selfie)&&(identical(other.status, status) || other.status == status)&&(identical(other.dealership_registration_document, dealership_registration_document) || other.dealership_registration_document == dealership_registration_document)&&(identical(other.comment, comment) || other.comment == comment)&&(identical(other.verified_by, verified_by) || other.verified_by == verified_by)&&(identical(other.verification_type, verification_type) || other.verification_type == verification_type)&&(identical(other.rejected_by, rejected_by) || other.rejected_by == rejected_by)&&(identical(other.approved_at, approved_at) || other.approved_at == approved_at)&&(identical(other.rejected_at, rejected_at) || other.rejected_at == rejected_at)&&(identical(other.created_at, created_at) || other.created_at == created_at)&&(identical(other.updated_at, updated_at) || other.updated_at == updated_at));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,document_type,document_number,dealership_name,address,document_front,document_back,selfie,status,dealership_registration_document,comment,verified_by,verification_type,rejected_by,approved_at,rejected_at,created_at,updated_at);

@override
String toString() {
  return 'VerificationData(id: $id, document_type: $document_type, document_number: $document_number, dealership_name: $dealership_name, address: $address, document_front: $document_front, document_back: $document_back, selfie: $selfie, status: $status, dealership_registration_document: $dealership_registration_document, comment: $comment, verified_by: $verified_by, verification_type: $verification_type, rejected_by: $rejected_by, approved_at: $approved_at, rejected_at: $rejected_at, created_at: $created_at, updated_at: $updated_at)';
}


}

/// @nodoc
abstract mixin class $VerificationDataCopyWith<$Res>  {
  factory $VerificationDataCopyWith(VerificationData value, $Res Function(VerificationData) _then) = _$VerificationDataCopyWithImpl;
@useResult
$Res call({
 int id, String? document_type, String? document_number, String? dealership_name, String? address, String document_front, String document_back, String selfie, String? status, String? dealership_registration_document, String? comment, String? verified_by, String? verification_type, String? rejected_by, String? approved_at, String? rejected_at, String? created_at, String? updated_at
});




}
/// @nodoc
class _$VerificationDataCopyWithImpl<$Res>
    implements $VerificationDataCopyWith<$Res> {
  _$VerificationDataCopyWithImpl(this._self, this._then);

  final VerificationData _self;
  final $Res Function(VerificationData) _then;

/// Create a copy of VerificationData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? document_type = freezed,Object? document_number = freezed,Object? dealership_name = freezed,Object? address = freezed,Object? document_front = null,Object? document_back = null,Object? selfie = null,Object? status = freezed,Object? dealership_registration_document = freezed,Object? comment = freezed,Object? verified_by = freezed,Object? verification_type = freezed,Object? rejected_by = freezed,Object? approved_at = freezed,Object? rejected_at = freezed,Object? created_at = freezed,Object? updated_at = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,document_type: freezed == document_type ? _self.document_type : document_type // ignore: cast_nullable_to_non_nullable
as String?,document_number: freezed == document_number ? _self.document_number : document_number // ignore: cast_nullable_to_non_nullable
as String?,dealership_name: freezed == dealership_name ? _self.dealership_name : dealership_name // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,document_front: null == document_front ? _self.document_front : document_front // ignore: cast_nullable_to_non_nullable
as String,document_back: null == document_back ? _self.document_back : document_back // ignore: cast_nullable_to_non_nullable
as String,selfie: null == selfie ? _self.selfie : selfie // ignore: cast_nullable_to_non_nullable
as String,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,dealership_registration_document: freezed == dealership_registration_document ? _self.dealership_registration_document : dealership_registration_document // ignore: cast_nullable_to_non_nullable
as String?,comment: freezed == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String?,verified_by: freezed == verified_by ? _self.verified_by : verified_by // ignore: cast_nullable_to_non_nullable
as String?,verification_type: freezed == verification_type ? _self.verification_type : verification_type // ignore: cast_nullable_to_non_nullable
as String?,rejected_by: freezed == rejected_by ? _self.rejected_by : rejected_by // ignore: cast_nullable_to_non_nullable
as String?,approved_at: freezed == approved_at ? _self.approved_at : approved_at // ignore: cast_nullable_to_non_nullable
as String?,rejected_at: freezed == rejected_at ? _self.rejected_at : rejected_at // ignore: cast_nullable_to_non_nullable
as String?,created_at: freezed == created_at ? _self.created_at : created_at // ignore: cast_nullable_to_non_nullable
as String?,updated_at: freezed == updated_at ? _self.updated_at : updated_at // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [VerificationData].
extension VerificationDataPatterns on VerificationData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VerificationData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VerificationData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VerificationData value)  $default,){
final _that = this;
switch (_that) {
case _VerificationData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VerificationData value)?  $default,){
final _that = this;
switch (_that) {
case _VerificationData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String? document_type,  String? document_number,  String? dealership_name,  String? address,  String document_front,  String document_back,  String selfie,  String? status,  String? dealership_registration_document,  String? comment,  String? verified_by,  String? verification_type,  String? rejected_by,  String? approved_at,  String? rejected_at,  String? created_at,  String? updated_at)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VerificationData() when $default != null:
return $default(_that.id,_that.document_type,_that.document_number,_that.dealership_name,_that.address,_that.document_front,_that.document_back,_that.selfie,_that.status,_that.dealership_registration_document,_that.comment,_that.verified_by,_that.verification_type,_that.rejected_by,_that.approved_at,_that.rejected_at,_that.created_at,_that.updated_at);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String? document_type,  String? document_number,  String? dealership_name,  String? address,  String document_front,  String document_back,  String selfie,  String? status,  String? dealership_registration_document,  String? comment,  String? verified_by,  String? verification_type,  String? rejected_by,  String? approved_at,  String? rejected_at,  String? created_at,  String? updated_at)  $default,) {final _that = this;
switch (_that) {
case _VerificationData():
return $default(_that.id,_that.document_type,_that.document_number,_that.dealership_name,_that.address,_that.document_front,_that.document_back,_that.selfie,_that.status,_that.dealership_registration_document,_that.comment,_that.verified_by,_that.verification_type,_that.rejected_by,_that.approved_at,_that.rejected_at,_that.created_at,_that.updated_at);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String? document_type,  String? document_number,  String? dealership_name,  String? address,  String document_front,  String document_back,  String selfie,  String? status,  String? dealership_registration_document,  String? comment,  String? verified_by,  String? verification_type,  String? rejected_by,  String? approved_at,  String? rejected_at,  String? created_at,  String? updated_at)?  $default,) {final _that = this;
switch (_that) {
case _VerificationData() when $default != null:
return $default(_that.id,_that.document_type,_that.document_number,_that.dealership_name,_that.address,_that.document_front,_that.document_back,_that.selfie,_that.status,_that.dealership_registration_document,_that.comment,_that.verified_by,_that.verification_type,_that.rejected_by,_that.approved_at,_that.rejected_at,_that.created_at,_that.updated_at);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VerificationData implements VerificationData {
  const _VerificationData({required this.id, this.document_type, this.document_number, this.dealership_name, this.address, required this.document_front, required this.document_back, required this.selfie, this.status, this.dealership_registration_document, this.comment, this.verified_by, this.verification_type, this.rejected_by, this.approved_at, this.rejected_at, this.created_at, this.updated_at});
  factory _VerificationData.fromJson(Map<String, dynamic> json) => _$VerificationDataFromJson(json);

@override final  int id;
@override final  String? document_type;
@override final  String? document_number;
@override final  String? dealership_name;
// Temporarily commented out
@override final  String? address;
// Temporarily commented out
@override final  String document_front;
@override final  String document_back;
@override final  String selfie;
@override final  String? status;
@override final  String? dealership_registration_document;
// Temporarily commented out
@override final  String? comment;
@override final  String? verified_by;
@override final  String? verification_type;
@override final  String? rejected_by;
@override final  String? approved_at;
@override final  String? rejected_at;
@override final  String? created_at;
@override final  String? updated_at;

/// Create a copy of VerificationData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VerificationDataCopyWith<_VerificationData> get copyWith => __$VerificationDataCopyWithImpl<_VerificationData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VerificationDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VerificationData&&(identical(other.id, id) || other.id == id)&&(identical(other.document_type, document_type) || other.document_type == document_type)&&(identical(other.document_number, document_number) || other.document_number == document_number)&&(identical(other.dealership_name, dealership_name) || other.dealership_name == dealership_name)&&(identical(other.address, address) || other.address == address)&&(identical(other.document_front, document_front) || other.document_front == document_front)&&(identical(other.document_back, document_back) || other.document_back == document_back)&&(identical(other.selfie, selfie) || other.selfie == selfie)&&(identical(other.status, status) || other.status == status)&&(identical(other.dealership_registration_document, dealership_registration_document) || other.dealership_registration_document == dealership_registration_document)&&(identical(other.comment, comment) || other.comment == comment)&&(identical(other.verified_by, verified_by) || other.verified_by == verified_by)&&(identical(other.verification_type, verification_type) || other.verification_type == verification_type)&&(identical(other.rejected_by, rejected_by) || other.rejected_by == rejected_by)&&(identical(other.approved_at, approved_at) || other.approved_at == approved_at)&&(identical(other.rejected_at, rejected_at) || other.rejected_at == rejected_at)&&(identical(other.created_at, created_at) || other.created_at == created_at)&&(identical(other.updated_at, updated_at) || other.updated_at == updated_at));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,document_type,document_number,dealership_name,address,document_front,document_back,selfie,status,dealership_registration_document,comment,verified_by,verification_type,rejected_by,approved_at,rejected_at,created_at,updated_at);

@override
String toString() {
  return 'VerificationData(id: $id, document_type: $document_type, document_number: $document_number, dealership_name: $dealership_name, address: $address, document_front: $document_front, document_back: $document_back, selfie: $selfie, status: $status, dealership_registration_document: $dealership_registration_document, comment: $comment, verified_by: $verified_by, verification_type: $verification_type, rejected_by: $rejected_by, approved_at: $approved_at, rejected_at: $rejected_at, created_at: $created_at, updated_at: $updated_at)';
}


}

/// @nodoc
abstract mixin class _$VerificationDataCopyWith<$Res> implements $VerificationDataCopyWith<$Res> {
  factory _$VerificationDataCopyWith(_VerificationData value, $Res Function(_VerificationData) _then) = __$VerificationDataCopyWithImpl;
@override @useResult
$Res call({
 int id, String? document_type, String? document_number, String? dealership_name, String? address, String document_front, String document_back, String selfie, String? status, String? dealership_registration_document, String? comment, String? verified_by, String? verification_type, String? rejected_by, String? approved_at, String? rejected_at, String? created_at, String? updated_at
});




}
/// @nodoc
class __$VerificationDataCopyWithImpl<$Res>
    implements _$VerificationDataCopyWith<$Res> {
  __$VerificationDataCopyWithImpl(this._self, this._then);

  final _VerificationData _self;
  final $Res Function(_VerificationData) _then;

/// Create a copy of VerificationData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? document_type = freezed,Object? document_number = freezed,Object? dealership_name = freezed,Object? address = freezed,Object? document_front = null,Object? document_back = null,Object? selfie = null,Object? status = freezed,Object? dealership_registration_document = freezed,Object? comment = freezed,Object? verified_by = freezed,Object? verification_type = freezed,Object? rejected_by = freezed,Object? approved_at = freezed,Object? rejected_at = freezed,Object? created_at = freezed,Object? updated_at = freezed,}) {
  return _then(_VerificationData(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,document_type: freezed == document_type ? _self.document_type : document_type // ignore: cast_nullable_to_non_nullable
as String?,document_number: freezed == document_number ? _self.document_number : document_number // ignore: cast_nullable_to_non_nullable
as String?,dealership_name: freezed == dealership_name ? _self.dealership_name : dealership_name // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,document_front: null == document_front ? _self.document_front : document_front // ignore: cast_nullable_to_non_nullable
as String,document_back: null == document_back ? _self.document_back : document_back // ignore: cast_nullable_to_non_nullable
as String,selfie: null == selfie ? _self.selfie : selfie // ignore: cast_nullable_to_non_nullable
as String,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,dealership_registration_document: freezed == dealership_registration_document ? _self.dealership_registration_document : dealership_registration_document // ignore: cast_nullable_to_non_nullable
as String?,comment: freezed == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String?,verified_by: freezed == verified_by ? _self.verified_by : verified_by // ignore: cast_nullable_to_non_nullable
as String?,verification_type: freezed == verification_type ? _self.verification_type : verification_type // ignore: cast_nullable_to_non_nullable
as String?,rejected_by: freezed == rejected_by ? _self.rejected_by : rejected_by // ignore: cast_nullable_to_non_nullable
as String?,approved_at: freezed == approved_at ? _self.approved_at : approved_at // ignore: cast_nullable_to_non_nullable
as String?,rejected_at: freezed == rejected_at ? _self.rejected_at : rejected_at // ignore: cast_nullable_to_non_nullable
as String?,created_at: freezed == created_at ? _self.created_at : created_at // ignore: cast_nullable_to_non_nullable
as String?,updated_at: freezed == updated_at ? _self.updated_at : updated_at // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
