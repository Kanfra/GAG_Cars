import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'trendingMakeModel.freezed.dart';
part 'trendingMakeModel.g.dart';

// If you want to keep the TrendingMake name but match the API structure
@freezed
class TrendingMake with _$TrendingMake {
  const factory TrendingMake({
    @JsonKey(fromJson: _safeParseInt) required int id,
    @JsonKey(name: 'user_id', fromJson: _safeParseString) String? userId,
    @JsonKey(fromJson: _safeParseStringWithDefault) required String name,
    @JsonKey(fromJson: _safeParseStringWithDefault) required String slug,
    @JsonKey(fromJson: _safeParseString) String? image,
    @JsonKey(name: 'created_at', fromJson: _safeParseStringWithDefault) required String createdAt,
    @JsonKey(name: 'updated_at', fromJson: _safeParseStringWithDefault) required String updatedAt,
    @JsonKey(name: 'items_count', fromJson: _safeParseIntWithDefault) required int itemsCount,
    @JsonKey(name: 'brand_models', fromJson: _safeParseBrandModelList) required List<BrandModel> brandModels,
  }) = _TrendingMake;

  factory TrendingMake.fromJson(Map<String, dynamic> json) => _$TrendingMakeFromJson(json);
}

// Brand Model (Car Model)
@freezed
class BrandModel with _$BrandModel {
  const factory BrandModel({
    @JsonKey(fromJson: _safeParseInt) required int id,
    @JsonKey(name: 'brand_id', fromJson: _safeParseInt) required int brandId,
    @JsonKey(fromJson: _safeParseStringWithDefault) required String name,
    @JsonKey(fromJson: _safeParseStringWithDefault) required String slug,
    @JsonKey(name: 'created_at', fromJson: _safeParseStringWithDefault) required String createdAt,
    @JsonKey(name: 'updated_at', fromJson: _safeParseStringWithDefault) required String updatedAt,
  }) = _BrandModel;

  factory BrandModel.fromJson(Map<String, dynamic> json) => _$BrandModelFromJson(json);
}

// Main Response - Updated to work with your fetchTrendingMakes function
@freezed
class TrendingMakeResponse with _$TrendingMakeResponse {
  const factory TrendingMakeResponse({
    @JsonKey(fromJson: _safeParseTrendingMakeList) required List<TrendingMake> data,
    @JsonKey(fromJson: _safeParsePaginationLinks) required PaginationLinks links,
    @JsonKey(fromJson: _safeParsePaginationMeta) required PaginationMeta meta,
  }) = _TrendingMakeResponse;

  factory TrendingMakeResponse.fromJson(Map<String, dynamic> json) => _$TrendingMakeResponseFromJson(json);
}

// Pagination Models (keeping your existing pagination structure)
@freezed
class PaginationLinks with _$PaginationLinks {
  const factory PaginationLinks({
    @JsonKey(fromJson: _safeParseStringWithDefault) required String first,
    @JsonKey(fromJson: _safeParseStringWithDefault) required String last,
    @JsonKey(fromJson: _safeParseString) String? prev,
    @JsonKey(fromJson: _safeParseString) String? next,
  }) = _PaginationLinks;

  factory PaginationLinks.fromJson(Map<String, dynamic> json) => _$PaginationLinksFromJson(json);
}

@freezed
class PaginationMeta with _$PaginationMeta {
  const factory PaginationMeta({
    @JsonKey(name: 'current_page', fromJson: _safeParseIntWithDefault) required int currentPage,
    @JsonKey(fromJson: _safeParseIntWithDefault) required int from,
    @JsonKey(name: 'last_page', fromJson: _safeParseIntWithDefault) required int lastPage,
    @JsonKey(fromJson: _safeParsePaginationMetaLinkList) required List<PaginationMetaLink> links,
    @JsonKey(fromJson: _safeParseStringWithDefault) required String path,
    @JsonKey(name: 'per_page', fromJson: _safeParseIntWithDefault) required int perPage,
    @JsonKey(fromJson: _safeParseIntWithDefault) required int to,
    @JsonKey(fromJson: _safeParseIntWithDefault) required int total,
  }) = _PaginationMeta;

  factory PaginationMeta.fromJson(Map<String, dynamic> json) => _$PaginationMetaFromJson(json);
}

@freezed
class PaginationMetaLink with _$PaginationMetaLink {
  const factory PaginationMetaLink({
    @JsonKey(fromJson: _safeParseString) String? url,
    @JsonKey(fromJson: _safeParseStringWithDefault) required String label,
    @JsonKey(fromJson: _safeParseBoolWithDefault) required bool active,
  }) = _PaginationMetaLink;

  factory PaginationMetaLink.fromJson(Map<String, dynamic> json) => _$PaginationMetaLinkFromJson(json);
}

// Helper functions for safe parsing
int _safeParseInt(dynamic value) => _safeParseIntWithDefault(value, 0);

int _safeParseIntWithDefault(dynamic value, [int defaultValue = 0]) {
  if (value == null) return defaultValue;
  if (value is int) return value;
  if (value is String) return int.tryParse(value) ?? defaultValue;
  if (value is double) return value.toInt();
  return defaultValue;
}

String? _safeParseString(dynamic value) {
  if (value == null) return null;
  return value.toString();
}

String _safeParseStringWithDefault(dynamic value, [String defaultValue = '']) {
  if (value == null) return defaultValue;
  return value.toString();
}

bool _safeParseBoolWithDefault(dynamic value, [bool defaultValue = false]) {
  if (value == null) return defaultValue;
  if (value is bool) return value;
  if (value is int) return value != 0;
  if (value is String) {
    return value.toLowerCase() == 'true' || value == '1';
  }
  return defaultValue;
}

List<TrendingMake> _safeParseTrendingMakeList(dynamic value) {
  if (value == null) return [];
  if (value is! List) return [];
  
  return value.map((item) {
    try {
      return TrendingMake.fromJson(item as Map<String, dynamic>);
    } catch (e) {
      return TrendingMake(
        id: 0,
        name: 'Error Brand',
        slug: 'error',
        createdAt: '',
        updatedAt: '',
        itemsCount: 0,
        brandModels: [],
      );
    }
  }).toList();
}

List<BrandModel> _safeParseBrandModelList(dynamic value) {
  if (value == null) return [];
  if (value is! List) return [];
  
  return value.map((item) {
    try {
      return BrandModel.fromJson(item as Map<String, dynamic>);
    } catch (e) {
      return BrandModel(
        id: 0,
        brandId: 0,
        name: 'Error Model',
        slug: 'error',
        createdAt: '',
        updatedAt: '',
      );
    }
  }).toList();
}

PaginationLinks _safeParsePaginationLinks(dynamic value) {
  try {
    return PaginationLinks.fromJson(value as Map<String, dynamic>);
  } catch (e) {
    return PaginationLinks(
      first: '',
      last: '',
    );
  }
}

PaginationMeta _safeParsePaginationMeta(dynamic value) {
  try {
    return PaginationMeta.fromJson(value as Map<String, dynamic>);
  } catch (e) {
    return PaginationMeta(
      currentPage: 1,
      from: 0,
      lastPage: 1,
      links: [],
      path: '',
      perPage: 10,
      to: 0,
      total: 0,
    );
  }
}

List<PaginationMetaLink> _safeParsePaginationMetaLinkList(dynamic value) {
  if (value == null) return [];
  if (value is! List) return [];
  
  return value.map((item) {
    try {
      return PaginationMetaLink.fromJson(item as Map<String, dynamic>);
    } catch (e) {
      return PaginationMetaLink(
        label: 'Error',
        active: false,
      );
    }
  }).toList();
}

// Extension methods for utility functions
extension TrendingMakeExtensions on TrendingMake {
  String get displayName => name;
  
  String get formattedSlug => slug.replaceAll('-', ' ').toUpperCase();
  
  bool get hasImage => image != null && image!.isNotEmpty;
  
  DateTime? get parsedCreatedAt {
    try {
      return DateTime.tryParse(createdAt);
    } catch (e) {
      return null;
    }
  }
  
  DateTime? get parsedUpdatedAt {
    try {
      return DateTime.tryParse(updatedAt);
    } catch (e) {
      return null;
    }
  }
  
  bool get hasItems => itemsCount > 0;
  
  bool get hasModels => brandModels.isNotEmpty;
  
  List<BrandModel> get sortedModelsByName => List<BrandModel>.from(brandModels)
    ..sort((a, b) => a.name.compareTo(b.name));
  
  List<BrandModel> searchModels(String query) {
    if (query.isEmpty) return brandModels;
    final lowercaseQuery = query.toLowerCase();
    return brandModels.where((model) => 
      model.name.toLowerCase().contains(lowercaseQuery) ||
      model.slug.toLowerCase().contains(lowercaseQuery)
    ).toList();
  }
  
  // Get first model or null
  BrandModel? get firstModel => brandModels.isNotEmpty ? brandModels.first : null;
  
  // Get model names as list
  List<String> get modelNames => brandModels.map((model) => model.name).toList();
}

extension BrandModelExtensions on BrandModel {
  String get displayName => name;
  
  String get formattedSlug => slug.replaceAll('-', ' ').toUpperCase();
  
  DateTime? get parsedCreatedAt {
    try {
      return DateTime.tryParse(createdAt);
    } catch (e) {
      return null;
    }
  }
  
  DateTime? get parsedUpdatedAt {
    try {
      return DateTime.tryParse(updatedAt);
    } catch (e) {
      return null;
    }
  }
  
  bool get isRecentlyUpdated {
    final updated = parsedUpdatedAt;
    if (updated == null) return false;
    return DateTime.now().difference(updated).inDays < 30;
  }
}

extension TrendingMakeResponseExtensions on TrendingMakeResponse {
  bool get hasData => data.isNotEmpty;
  
  bool get hasNextPage => links.next != null;
  
  bool get hasPrevPage => links.prev != null;
  
  int get totalPages => meta.lastPage;
  
  int get currentPage => meta.currentPage;
  
  bool get isFirstPage => currentPage == 1;
  
  bool get isLastPage => currentPage >= totalPages;
  
  int get itemsPerPage => meta.perPage;
  
  int get totalItems => meta.total;
  
  List<TrendingMake> get sortedByName => List<TrendingMake>.from(data)
    ..sort((a, b) => a.name.compareTo(b.name));
  
  List<TrendingMake> get sortedByItemsCount => List<TrendingMake>.from(data)
    ..sort((a, b) => b.itemsCount.compareTo(a.itemsCount));
  
  List<TrendingMake> get brandsWithItems => data.where((brand) => brand.itemsCount > 0).toList();
  
  List<TrendingMake> searchBrands(String query) {
    if (query.isEmpty) return data;
    final lowercaseQuery = query.toLowerCase();
    return data.where((brand) => 
      brand.name.toLowerCase().contains(lowercaseQuery) ||
      brand.slug.toLowerCase().contains(lowercaseQuery)
    ).toList();
  }
  
  List<BrandModel> getAllModels() {
    return data.expand((brand) => brand.brandModels).toList();
  }
  
  List<BrandModel> searchAllModels(String query) {
    if (query.isEmpty) return getAllModels();
    final lowercaseQuery = query.toLowerCase();
    return getAllModels().where((model) => 
      model.name.toLowerCase().contains(lowercaseQuery) ||
      model.slug.toLowerCase().contains(lowercaseQuery)
    ).toList();
  }
  
  Map<int, TrendingMake> get brandsById {
    return {for (var brand in data) brand.id: brand};
  }
  
  TrendingMake? findBrandById(int id) {
    try {
      return data.firstWhere((brand) => brand.id == id);
    } catch (e) {
      return null;
    }
  }
  
  List<BrandModel> findModelsByBrandId(int brandId) {
    final brand = findBrandById(brandId);
    return brand?.brandModels ?? [];
  }
  
  // Get only brands that have items (for trending makes display)
  List<TrendingMake> get trendingBrands => data.where((brand) => brand.itemsCount > 0).toList();
}

// Custom converter for handling API responses
class TrendingMakeConverter {
  static TrendingMakeResponse fromJson(Map<String, dynamic> json) {
    try {
      return TrendingMakeResponse.fromJson(json);
    } catch (e) {
      // Fallback for different response structures
      if (json.containsKey('data') && json['data'] is List) {
        return TrendingMakeResponse(
          data: _safeParseTrendingMakeList(json['data']),
          links: PaginationLinks(first: '', last: ''),
          meta: PaginationMeta(
            currentPage: 1,
            from: 0,
            lastPage: 1,
            links: [],
            path: '',
            perPage: 10,
            to: 0,
            total: 0,
          ),
        );
      }
      rethrow;
    }
  }
}