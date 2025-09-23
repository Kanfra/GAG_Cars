// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verifyDealerModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VerificationRequestImpl _$$VerificationRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$VerificationRequestImpl(
      document_type: json['document_type'] as String,
      document_number: json['document_number'] as String,
      document_front: json['document_front'] as String,
      document_back: json['document_back'] as String,
      selfie: json['selfie'] as String,
      status: json['status'] as String?,
      comment: json['comment'] as String?,
      verified_by: json['verified_by'] as String?,
      rejected_by: json['rejected_by'] as String?,
      approved_at: json['approved_at'] as String?,
      rejected_at: json['rejected_at'] as String?,
    );

Map<String, dynamic> _$$VerificationRequestImplToJson(
        _$VerificationRequestImpl instance) =>
    <String, dynamic>{
      'document_type': instance.document_type,
      'document_number': instance.document_number,
      'document_front': instance.document_front,
      'document_back': instance.document_back,
      'selfie': instance.selfie,
      'status': instance.status,
      'comment': instance.comment,
      'verified_by': instance.verified_by,
      'rejected_by': instance.rejected_by,
      'approved_at': instance.approved_at,
      'rejected_at': instance.rejected_at,
    };

_$VerificationResponseImpl _$$VerificationResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$VerificationResponseImpl(
      success: json['success'] as bool,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : VerificationData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$VerificationResponseImplToJson(
        _$VerificationResponseImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

_$VerificationDataImpl _$$VerificationDataImplFromJson(
        Map<String, dynamic> json) =>
    _$VerificationDataImpl(
      id: (json['id'] as num).toInt(),
      document_type: json['document_type'] as String,
      document_number: json['document_number'] as String,
      document_front: json['document_front'] as String,
      document_back: json['document_back'] as String,
      selfie: json['selfie'] as String,
      status: json['status'] as String,
      comment: json['comment'] as String?,
      verified_by: json['verified_by'] as String?,
      rejected_by: json['rejected_by'] as String?,
      approved_at: json['approved_at'] as String?,
      rejected_at: json['rejected_at'] as String?,
      created_at: json['created_at'] as String,
      updated_at: json['updated_at'] as String,
    );

Map<String, dynamic> _$$VerificationDataImplToJson(
        _$VerificationDataImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'document_type': instance.document_type,
      'document_number': instance.document_number,
      'document_front': instance.document_front,
      'document_back': instance.document_back,
      'selfie': instance.selfie,
      'status': instance.status,
      'comment': instance.comment,
      'verified_by': instance.verified_by,
      'rejected_by': instance.rejected_by,
      'approved_at': instance.approved_at,
      'rejected_at': instance.rejected_at,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
    };
