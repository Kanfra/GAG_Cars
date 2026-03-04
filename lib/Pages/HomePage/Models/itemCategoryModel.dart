class ItemCategoryResponse {
  final List<ItemCategory> data;
  final CategoryPaginationLinks links;
  final CategoryPaginationMeta meta;

  ItemCategoryResponse({
    required this.data,
    required this.links,
    required this.meta,
  });

  factory ItemCategoryResponse.fromJson(Map<String, dynamic> json) {
    return ItemCategoryResponse(
      data: (json['data'] as List? ?? [])
          .map((item) => ItemCategory.fromJson(item))
          .toList(),
      links: CategoryPaginationLinks.fromJson(json['links'] ?? {}),
      meta: CategoryPaginationMeta.fromJson(json['meta'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data.map((e) => e.toJson()).toList(),
      'links': links.toJson(),
      'meta': meta.toJson(),
    };
  }
}

class ItemCategory {
  final int id;
  final int? userId;
  final int? parentId;
  final String name;
  final String slug;
  final String? description;
  final List<String> features;
  final String image;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool requireMake;
  final bool requireModel;
  final List<ItemField> itemFields;

  ItemCategory({
    required this.id,
    this.userId,
    this.parentId,
    required this.name,
    required this.slug,
    this.description,
    required this.features,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
    required this.requireMake,
    required this.requireModel,
    required this.itemFields,
  });

  factory ItemCategory.fromJson(Map<String, dynamic> json) {
    return ItemCategory(
      id: _parseInt(json['id']),
      userId: _parseNullableInt(json['user_id']),
      parentId: _parseNullableInt(json['parent_id']),
      name: json['name']?.toString() ?? '',
      slug: json['slug']?.toString() ?? '',
      description: json['description']?.toString(),
      features: _parseStringList(json['features']),
      image: json['image']?.toString() ?? '',
      createdAt: DateTime.tryParse(json['created_at']?.toString() ?? '') ?? DateTime.now(),
      updatedAt: DateTime.tryParse(json['updated_at']?.toString() ?? '') ?? DateTime.now(),
      requireMake: _boolFromInt(json['require_make']),
      requireModel: _boolFromInt(json['require_model']),
      itemFields: (json['item_fields'] as List? ?? [])
          .map((field) => ItemField.fromJson(field))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'parent_id': parentId,
      'name': name,
      'slug': slug,
      'description': description,
      'features': features,
      'image': image,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'require_make': requireMake ? 1 : 0,
      'require_model': requireModel ? 1 : 0,
      'item_fields': itemFields.map((e) => e.toJson()).toList(),
    };
  }
}

class ItemField {
  final int id;
  final String name;
  final String label;
  final String type;
  final bool required;
  final bool unique;
  final bool nullable;
  final List<dynamic> options;
  final DateTime createdAt;
  final DateTime updatedAt;
  final ItemFieldPivot pivot;

  ItemField({
    required this.id,
    required this.name,
    required this.label,
    required this.type,
    required this.required,
    required this.unique,
    required this.nullable,
    required this.options,
    required this.createdAt,
    required this.updatedAt,
    required this.pivot,
  });

  factory ItemField.fromJson(Map<String, dynamic> json) {
    return ItemField(
      id: _parseInt(json['id']),
      name: json['name']?.toString() ?? '',
      label: json['label']?.toString() ?? '',
      type: json['type']?.toString() ?? '',
      required: _boolFromInt(json['required']),
      unique: _boolFromInt(json['unique']),
      nullable: _boolFromInt(json['nullable']),
      options: json['options'] as List? ?? [],
      createdAt: DateTime.tryParse(json['created_at']?.toString() ?? '') ?? DateTime.now(),
      updatedAt: DateTime.tryParse(json['updated_at']?.toString() ?? '') ?? DateTime.now(),
      pivot: ItemFieldPivot.fromJson(json['pivot'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'label': label,
      'type': type,
      'required': required ? 1 : 0,
      'unique': unique ? 1 : 0,
      'nullable': nullable ? 1 : 0,
      'options': options,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'pivot': pivot.toJson(),
    };
  }
}

class ItemFieldPivot {
  final int categoryId;
  final int itemFieldId;
  final int highlight;

  ItemFieldPivot({
    required this.categoryId,
    required this.itemFieldId,
    required this.highlight,
  });

  factory ItemFieldPivot.fromJson(Map<String, dynamic> json) {
    return ItemFieldPivot(
      categoryId: _parseInt(json['category_id']),
      itemFieldId: _parseInt(json['item_field_id']),
      highlight: _parseInt(json['highlight']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'category_id': categoryId,
      'item_field_id': itemFieldId,
      'highlight': highlight,
    };
  }
}

class CategoryPaginationLinks {
  final String? first;
  final String? last;
  final String? prev;
  final String? next;

  CategoryPaginationLinks({
    this.first,
    this.last,
    this.prev,
    this.next,
  });

  factory CategoryPaginationLinks.fromJson(Map<String, dynamic> json) {
    return CategoryPaginationLinks(
      first: json['first']?.toString(),
      last: json['last']?.toString(),
      prev: json['prev']?.toString(),
      next: json['next']?.toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'first': first,
      'last': last,
      'prev': prev,
      'next': next,
    };
  }
}

class CategoryPaginationMeta {
  final int currentPage;
  final int from;
  final int lastPage;
  final List<CategoryPaginationLink> links;
  final String path;
  final int perPage;
  final int to;
  final int total;

  CategoryPaginationMeta({
    required this.currentPage,
    required this.from,
    required this.lastPage,
    required this.links,
    required this.path,
    required this.perPage,
    required this.to,
    required this.total,
  });

  factory CategoryPaginationMeta.fromJson(Map<String, dynamic> json) {
    return CategoryPaginationMeta(
      currentPage: _parseInt(json['current_page']),
      from: _parseInt(json['from']),
      lastPage: _parseInt(json['last_page']),
      links: (json['links'] as List? ?? [])
          .map((item) => CategoryPaginationLink.fromJson(item))
          .toList(),
      path: json['path']?.toString() ?? '',
      perPage: _parseInt(json['per_page']),
      to: _parseInt(json['to']),
      total: _parseInt(json['total']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'current_page': currentPage,
      'from': from,
      'last_page': lastPage,
      'links': links.map((e) => e.toJson()).toList(),
      'path': path,
      'per_page': perPage,
      'to': to,
      'total': total,
    };
  }
}

class CategoryPaginationLink {
  final String? url;
  final String label;
  final bool active;

  CategoryPaginationLink({
    this.url,
    required this.label,
    required this.active,
  });

  factory CategoryPaginationLink.fromJson(Map<String, dynamic> json) {
    return CategoryPaginationLink(
      url: json['url']?.toString(),
      label: json['label']?.toString() ?? '',
      active: json['active'] == true,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'url': url,
      'label': label,
      'active': active,
    };
  }
}

// ---------------------
// Helper functions
// ---------------------

int _parseInt(dynamic value) {
  if (value == null) return 0;
  if (value is int) return value;
  if (value is String) return int.tryParse(value) ?? 0;
  if (value is num) return value.toInt();
  return 0;
}

int? _parseNullableInt(dynamic value) {
  if (value == null) return null;
  if (value is int) return value;
  if (value is String) return int.tryParse(value);
  if (value is num) return value.toInt();
  return null;
}

bool _boolFromInt(dynamic value) {
  if (value is bool) return value;
  if (value is int) return value != 0;  // any non-zero = required/visible
  if (value is String) return value != '0' && value.isNotEmpty;
  return false;
}

List<String> _parseStringList(dynamic value) {
  if (value == null) return [];
  if (value is List) {
    return value.map((e) => e?.toString() ?? '').toList();
  }
  return [];
}
