import 'package:freezed_annotation/freezed_annotation.dart';

part 'postResponse.freezed.dart';
part 'postResponse.g.dart';

@freezed
class Post with _$Post {
  const factory Post({
    required int id,
    required String title,
    required String content,
    required String image,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _Post;

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
}

@freezed
class PaginationLink with _$PaginationLink {
  const factory PaginationLink({
    required String? url,
    required String label,
    required bool active,
  }) = _PaginationLink;

  factory PaginationLink.fromJson(Map<String, dynamic> json) => _$PaginationLinkFromJson(json);
}

@freezed
class Links with _$Links {
  const factory Links({
    required String first,
    required String last,
    required String? prev,
    required String? next,
  }) = _Links;

  factory Links.fromJson(Map<String, dynamic> json) => _$LinksFromJson(json);
}

@freezed
class Meta with _$Meta {
  const factory Meta({
    @JsonKey(name: 'current_page') required int currentPage,
    required int? from,
    @JsonKey(name: 'last_page') required int lastPage,
    required List<PaginationLink> links,
    required String path,
    @JsonKey(name: 'per_page') required int perPage,
    required int? to,
    required int total,
  }) = _Meta;

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);
}

@freezed
class PostsResponse with _$PostsResponse {
  const factory PostsResponse({
    required List<Post> data,
    required Links links,
    required Meta meta,
  }) = _PostsResponse;

  factory PostsResponse.fromJson(Map<String, dynamic> json) => _$PostsResponseFromJson(json);
}