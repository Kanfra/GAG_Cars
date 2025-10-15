import 'package:freezed_annotation/freezed_annotation.dart';

part 'faqModels.freezed.dart';
part 'faqModels.g.dart';

@freezed
class FaqResponse with _$FaqResponse {
  const factory FaqResponse({
    required List<Faq> data,
    required FaqLinks links,
    required FaqMeta meta,
  }) = _FaqResponse;

  factory FaqResponse.fromJson(Map<String, dynamic> json) =>
      _$FaqResponseFromJson(json);
}

@freezed
class Faq with _$Faq {
  const factory Faq({
    required String id,
    @JsonKey(name: 'user_id') required String userId,
    required String question,
    required String answer,
    required String status,
    required List<String> tags,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
    required String? image,
    @JsonKey(name: 'category_id') required int categoryId,
    required FaqUser user,
    required FaqCategory category,
  }) = _Faq;

  factory Faq.fromJson(Map<String, dynamic> json) => _$FaqFromJson(json);
}

@freezed
class FaqUser with _$FaqUser {
  const factory FaqUser({
    required String id,
    required String name,
    required String email,
    required String? phone,
    @JsonKey(name: 'email_verified_at') required DateTime? emailVerifiedAt,
    @JsonKey(name: 'paid_seller') required int paidSeller,
    @JsonKey(name: 'deleted_at') required DateTime? deletedAt,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
    @JsonKey(name: 'country_id') required int? countryId,
    @JsonKey(name: 'state_id') required int? stateId,
    @JsonKey(name: 'profile_photo') required String? profilePhoto,
    @JsonKey(name: 'uploads_left') required int? uploadsLeft,
    @JsonKey(name: 'active_status') required int activeStatus,
    required String avatar,
    @JsonKey(name: 'dark_mode') required int darkMode,
    @JsonKey(name: 'messenger_color') required String messengerColor,
  }) = _FaqUser;

  factory FaqUser.fromJson(Map<String, dynamic> json) =>
      _$FaqUserFromJson(json);
}

@freezed
class FaqCategory with _$FaqCategory {
  const factory FaqCategory({
    required int id,
    required String name,
    required String slug,
    required String? description,
    required String status,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _FaqCategory;

  factory FaqCategory.fromJson(Map<String, dynamic> json) =>
      _$FaqCategoryFromJson(json);
}

@freezed
class FaqLinks with _$FaqLinks {
  const factory FaqLinks({
    required String first,
    required String last,
    required String? prev,
    required String? next,
  }) = _FaqLinks;

  factory FaqLinks.fromJson(Map<String, dynamic> json) =>
      _$FaqLinksFromJson(json);
}

@freezed
class FaqMeta with _$FaqMeta {
  const factory FaqMeta({
    @JsonKey(name: 'current_page') required int currentPage,
    required int from,
    @JsonKey(name: 'last_page') required int lastPage,
    required List<FaqMetaLink> links,
    required String path,
    @JsonKey(name: 'per_page') required int perPage,
    required int to,
    required int total,
  }) = _FaqMeta;

  factory FaqMeta.fromJson(Map<String, dynamic> json) =>
      _$FaqMetaFromJson(json);
}

@freezed
class FaqMetaLink with _$FaqMetaLink {
  const factory FaqMetaLink({
    required String? url,
    required String label,
    required int? page,
    required bool active,
  }) = _FaqMetaLink;

  factory FaqMetaLink.fromJson(Map<String, dynamic> json) =>
      _$FaqMetaLinkFromJson(json);
}