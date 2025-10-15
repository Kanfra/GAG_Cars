import 'package:freezed_annotation/freezed_annotation.dart';

part 'faqCategoryModel.freezed.dart';
part 'faqCategoryModel.g.dart';

@freezed
class FaqCategoryResponse with _$FaqCategoryResponse {
  const factory FaqCategoryResponse({
    required List<FaqCategoryWithFaqs> data,
    required FaqCategoryLinks links,
    required FaqCategoryMeta meta,
  }) = _FaqCategoryResponse;

  factory FaqCategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$FaqCategoryResponseFromJson(json);
}

@freezed
class FaqCategoryWithFaqs with _$FaqCategoryWithFaqs {
  const factory FaqCategoryWithFaqs({
    required int id,
    required String name,
    required String slug,
    required String? description,
    required String status,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
    @JsonKey(name: 'faqs_count') required int faqsCount,
    required List<FaqItem> faqs,
  }) = _FaqCategoryWithFaqs;

  factory FaqCategoryWithFaqs.fromJson(Map<String, dynamic> json) =>
      _$FaqCategoryWithFaqsFromJson(json);
}

@freezed
class FaqItem with _$FaqItem {
  const factory FaqItem({
    required String id,
    @JsonKey(name: 'user_id') required String userId,
    required String question,
    required String answer,
    required String status,
    required List<dynamic> tags,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
    required String? image,
    @JsonKey(name: 'category_id') required int categoryId,
  }) = _FaqItem;

  factory FaqItem.fromJson(Map<String, dynamic> json) =>
      _$FaqItemFromJson(json);
}

@freezed
class FaqCategoryLinks with _$FaqCategoryLinks {
  const factory FaqCategoryLinks({
    required String first,
    required String last,
    required String? prev,
    required String? next,
  }) = _FaqCategoryLinks;

  factory FaqCategoryLinks.fromJson(Map<String, dynamic> json) =>
      _$FaqCategoryLinksFromJson(json);
}

@freezed
class FaqCategoryMeta with _$FaqCategoryMeta {
  const factory FaqCategoryMeta({
    @JsonKey(name: 'current_page') required int currentPage,
    required int from,
    @JsonKey(name: 'last_page') required int lastPage,
    required List<FaqCategoryMetaLink> links,
    required String path,
    @JsonKey(name: 'per_page') required int perPage,
    required int to,
    required int total,
  }) = _FaqCategoryMeta;

  factory FaqCategoryMeta.fromJson(Map<String, dynamic> json) =>
      _$FaqCategoryMetaFromJson(json);
}

@freezed
class FaqCategoryMetaLink with _$FaqCategoryMetaLink {
  const factory FaqCategoryMetaLink({
    required String? url,
    required String label,
    required int? page,
    required bool active,
  }) = _FaqCategoryMetaLink;

  factory FaqCategoryMetaLink.fromJson(Map<String, dynamic> json) =>
      _$FaqCategoryMetaLinkFromJson(json);
}