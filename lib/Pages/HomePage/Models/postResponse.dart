import 'package:freezed_annotation/freezed_annotation.dart';

part 'postResponse.freezed.dart';
part 'postResponse.g.dart';

@freezed
class Category with _$Category {
  const factory Category({
    required int id,
    @JsonKey(name: 'user_id') required String? userId,
    @JsonKey(name: 'parent_id') required int? parentId,
    required String name,
    required String slug,
    required String? description,
    required String? image,
    required String status,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);
}

@freezed
class Post with _$Post {
  const factory Post({
    required String id,
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'country_id') required int countryId,
    required String title,
    required String? slug,
    required String? description,
    required String image,
    required String status,
    required String content,
    required List<dynamic> tags,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
    @JsonKey(name: 'category_id') required int categoryId,
    required Category category,
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