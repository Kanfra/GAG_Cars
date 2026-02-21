class BroadcastModel {
  final String id;
  final String userId;
  final int countryId;
  final String subject;
  final String message;
  final String image;
  final String status;
  final String scheduledAt;
  final String target;
  final DateTime createdAt;
  final DateTime updatedAt;
  final UserModel user;
  final CountryModel country;

  BroadcastModel({
    required this.id,
    required this.userId,
    required this.countryId,
    required this.subject,
    required this.message,
    required this.image,
    required this.status,
    required this.scheduledAt,
    required this.target,
    required this.createdAt,
    required this.updatedAt,
    required this.user,
    required this.country,
  });

  factory BroadcastModel.fromJson(Map<String, dynamic> json) {
    return BroadcastModel(
      id: json['id'] ?? '',
      userId: json['user_id'] ?? '',
      countryId: json['country_id'] ?? 0,
      subject: json['subject'] ?? '',
      message: json['message'] ?? '',
      image: json['image'] ?? '',
      status: json['status'] ?? '',
      scheduledAt: json['scheduled_at'] ?? '',
      target: json['target'] ?? '',
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      user: UserModel.fromJson(json['user'] ?? {}),
      country: CountryModel.fromJson(json['country'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'country_id': countryId,
      'subject': subject,
      'message': message,
      'image': image,
      'status': status,
      'scheduled_at': scheduledAt,
      'target': target,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'user': user.toJson(),
      'country': country.toJson(),
    };
  }
}

class UserModel {
  final String id;
  final String name;
  final String email;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
    };
  }
}

class CountryModel {
  final int id;
  final String name;

  CountryModel({
    required this.id,
    required this.name,
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}

class BroadcastResponseModel {
  final List<BroadcastModel> data;
  final LinksModel links;
  final MetaModel meta;

  BroadcastResponseModel({
    required this.data,
    required this.links,
    required this.meta,
  });

  factory BroadcastResponseModel.fromJson(Map<String, dynamic> json) {
    return BroadcastResponseModel(
      data: (json['data'] as List? ?? [])
          .map((item) => BroadcastModel.fromJson(item))
          .toList(),
      links: LinksModel.fromJson(json['links'] ?? {}),
      meta: MetaModel.fromJson(json['meta'] ?? {}),
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

class LinksModel {
  final String first;
  final String last;
  final String? prev;
  final String? next;

  LinksModel({
    required this.first,
    required this.last,
    this.prev,
    this.next,
  });

  factory LinksModel.fromJson(Map<String, dynamic> json) {
    return LinksModel(
      first: json['first'] ?? '',
      last: json['last'] ?? '',
      prev: json['prev'],
      next: json['next'],
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

class MetaModel {
  final int currentPage;
  final int from;
  final int lastPage;
  final List<LinkItemModel> links;
  final String path;
  final int perPage;
  final int to;
  final int total;

  MetaModel({
    required this.currentPage,
    required this.from,
    required this.lastPage,
    required this.links,
    required this.path,
    required this.perPage,
    required this.to,
    required this.total,
  });

  factory MetaModel.fromJson(Map<String, dynamic> json) {
    return MetaModel(
      currentPage: json['current_page'] ?? 0,
      from: json['from'] ?? 0,
      lastPage: json['last_page'] ?? 0,
      links: (json['links'] as List? ?? [])
          .map((item) => LinkItemModel.fromJson(item))
          .toList(),
      path: json['path'] ?? '',
      perPage: json['per_page'] ?? 0,
      to: json['to'] ?? 0,
      total: json['total'] ?? 0,
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

class LinkItemModel {
  final String? url;
  final String label;
  final int? page;
  final bool active;

  LinkItemModel({
    this.url,
    required this.label,
    this.page,
    required this.active,
  });

  factory LinkItemModel.fromJson(Map<String, dynamic> json) {
    return LinkItemModel(
      url: json['url'],
      label: json['label'] ?? '',
      page: json['page'],
      active: json['active'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'url': url,
      'label': label,
      'page': page,
      'active': active,
    };
  }
}