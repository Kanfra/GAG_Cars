import 'package:freezed_annotation/freezed_annotation.dart';

part 'verifyDealerModel.freezed.dart';
part 'verifyDealerModel.g.dart';

// Request Model (what you send to API)
@freezed
class VerificationRequest with _$VerificationRequest {
  const factory VerificationRequest({
    String? document_type,
    String? document_number,
    // String? dealer_name,  // Temporarily commented out
    // String? location,     // Temporarily commented out
    required String document_front,
    required String document_back,
    required String selfie,
    // String? company_registration_document,  // Temporarily commented out
    String? status,
    String? comment,
    String? verified_by,
    String? rejected_by,
    String? approved_at,
    String? rejected_at,
  }) = _VerificationRequest;

  factory VerificationRequest.fromJson(Map<String, dynamic> json) =>
      _$VerificationRequestFromJson(json);
}

// Response Model (what you get from API) - UPDATED
@freezed
class VerificationResponse with _$VerificationResponse {
  const factory VerificationResponse({
    required bool success,
    String? message,
    VerificationData? data,
    String? error, // Added this field to match your service
  }) = _VerificationResponse;

  factory VerificationResponse.fromJson(Map<String, dynamic> json) =>
      _$VerificationResponseFromJson(json);
}

// Nested Data Model
@freezed
class VerificationData with _$VerificationData {
  const factory VerificationData({
    required int id,
    String? document_type,
    String? document_number,
    // String? dealer_name,  // Temporarily commented out
    // String? location,     // Temporarily commented out
    required String document_front,
    required String document_back,
    required String selfie,
    String? status,
    // String? company_registration_document,  // Temporarily commented out
    String? comment,
    String? verified_by,
    String? rejected_by,
    String? approved_at,
    String? rejected_at,
    String? created_at,
    String? updated_at,
  }) = _VerificationData;

  factory VerificationData.fromJson(Map<String, dynamic> json) =>
      _$VerificationDataFromJson(json);
}