import 'package:freezed_annotation/freezed_annotation.dart';

part 'makeModel.freezed.dart';
part 'makeModel.g.dart';

@freezed
class MakeResponse with _$MakeResponse {
  const factory MakeResponse({
    required List<Make> data,
    required PaginationLinks links,
    required PaginationMeta meta,
  }) = _MakeResponse;

  factory MakeResponse.fromJson(Map<String, dynamic> json) =>
      _$MakeResponseFromJson(json);
}

@freezed
class Make with _$Make {
  const factory Make({
    required int id,
    @JsonKey(name: 'user_id') int? userId,
    required String name,
    required String slug,
    String? image,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'updated_at') required String updatedAt,
  }) = _Make;

  factory Make.fromJson(Map<String, dynamic> json) => _$MakeFromJson(json);
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
    @JsonKey(name: 'current_page') required int currentPage,
    required int from,
    @JsonKey(name: 'last_page') required int lastPage,
    required List<PaginationLink> links,
    required String path,
    @JsonKey(name: 'per_page') required int perPage,
    required int to,
    required int total,
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