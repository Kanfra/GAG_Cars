import 'package:freezed_annotation/freezed_annotation.dart';

part 'makeAndModelModel.freezed.dart';
part 'makeAndModelModel.g.dart';

@freezed
class MakeAndModelResponse with _$MakeAndModelResponse {
  const factory MakeAndModelResponse({
    required List<VehicleMake> data,
    required PaginationLinks links,
    required PaginationMeta meta,
  }) = _MakeAndModelResponse;

  factory MakeAndModelResponse.fromJson(Map<String, dynamic> json) =>
      _$MakeAndModelResponseFromJson(json);
}

@freezed
class VehicleMake with _$VehicleMake {
  const factory VehicleMake({
    @JsonKey(fromJson: _parseInt) required int id,
    @JsonKey(name: 'user_id', fromJson: _parseInt) int? userId,
    required String name,
    required String slug,
    String? image,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
    @JsonKey(name: 'brand_models') required List<VehicleModel> models,
  }) = _VehicleMake;

  factory VehicleMake.fromJson(Map<String, dynamic> json) =>
      _$VehicleMakeFromJson(json);
}

@freezed
class VehicleModel with _$VehicleModel {
  const factory VehicleModel({
    @JsonKey(fromJson: _parseInt) required int id,
    @JsonKey(name: 'brand_id', fromJson: _parseInt) required int makeId,
    required String name,
    required String slug,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _VehicleModel;

  factory VehicleModel.fromJson(Map<String, dynamic> json) =>
      _$VehicleModelFromJson(json);
}

@freezed
class PaginationLinks with _$PaginationLinks {
  const factory PaginationLinks({
    required String first,
    required String last,
    required String? prev,
    required String? next,
  }) = _PaginationLinks;

  factory PaginationLinks.fromJson(Map<String, dynamic> json) =>
      _$PaginationLinksFromJson(json);
}

@freezed
class PaginationMeta with _$PaginationMeta {
  const factory PaginationMeta({
    @JsonKey(name: 'current_page', fromJson: _parseInt) required int currentPage,
    @JsonKey(fromJson: _parseInt) required int from,
    @JsonKey(name: 'last_page', fromJson: _parseInt) required int lastPage,
    required List<PaginationLink> links,
    required String path,
    @JsonKey(name: 'per_page', fromJson: _parseInt) required int perPage,
    @JsonKey(fromJson: _parseInt) required int to,
    @JsonKey(fromJson: _parseInt) required int total,
  }) = _PaginationMeta;

  factory PaginationMeta.fromJson(Map<String, dynamic> json) =>
      _$PaginationMetaFromJson(json);
}

@freezed
class PaginationLink with _$PaginationLink {
  const factory PaginationLink({
    required String? url,
    required String label,
    required bool active,
  }) = _PaginationLink;

  factory PaginationLink.fromJson(Map<String, dynamic> json) =>
      _$PaginationLinkFromJson(json);
}

// Fixed helper function
int _parseInt(dynamic value) {
  if (value == null) return 0;
  if (value is int) return value;
  if (value is String) return int.tryParse(value) ?? 0;
  if (value is num) return value.toInt();
  
  // Fallback for any unexpected type
  return 0;
}