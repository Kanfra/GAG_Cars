// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'faqCategoryModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FaqCategoryResponse _$FaqCategoryResponseFromJson(Map<String, dynamic> json) {
  return _FaqCategoryResponse.fromJson(json);
}

/// @nodoc
mixin _$FaqCategoryResponse {
  List<FaqCategoryWithFaqs> get data => throw _privateConstructorUsedError;
  FaqCategoryLinks get links => throw _privateConstructorUsedError;
  FaqCategoryMeta get meta => throw _privateConstructorUsedError;

  /// Serializes this FaqCategoryResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FaqCategoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FaqCategoryResponseCopyWith<FaqCategoryResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FaqCategoryResponseCopyWith<$Res> {
  factory $FaqCategoryResponseCopyWith(
          FaqCategoryResponse value, $Res Function(FaqCategoryResponse) then) =
      _$FaqCategoryResponseCopyWithImpl<$Res, FaqCategoryResponse>;
  @useResult
  $Res call(
      {List<FaqCategoryWithFaqs> data,
      FaqCategoryLinks links,
      FaqCategoryMeta meta});

  $FaqCategoryLinksCopyWith<$Res> get links;
  $FaqCategoryMetaCopyWith<$Res> get meta;
}

/// @nodoc
class _$FaqCategoryResponseCopyWithImpl<$Res, $Val extends FaqCategoryResponse>
    implements $FaqCategoryResponseCopyWith<$Res> {
  _$FaqCategoryResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FaqCategoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? links = null,
    Object? meta = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<FaqCategoryWithFaqs>,
      links: null == links
          ? _value.links
          : links // ignore: cast_nullable_to_non_nullable
              as FaqCategoryLinks,
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as FaqCategoryMeta,
    ) as $Val);
  }

  /// Create a copy of FaqCategoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FaqCategoryLinksCopyWith<$Res> get links {
    return $FaqCategoryLinksCopyWith<$Res>(_value.links, (value) {
      return _then(_value.copyWith(links: value) as $Val);
    });
  }

  /// Create a copy of FaqCategoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FaqCategoryMetaCopyWith<$Res> get meta {
    return $FaqCategoryMetaCopyWith<$Res>(_value.meta, (value) {
      return _then(_value.copyWith(meta: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FaqCategoryResponseImplCopyWith<$Res>
    implements $FaqCategoryResponseCopyWith<$Res> {
  factory _$$FaqCategoryResponseImplCopyWith(_$FaqCategoryResponseImpl value,
          $Res Function(_$FaqCategoryResponseImpl) then) =
      __$$FaqCategoryResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<FaqCategoryWithFaqs> data,
      FaqCategoryLinks links,
      FaqCategoryMeta meta});

  @override
  $FaqCategoryLinksCopyWith<$Res> get links;
  @override
  $FaqCategoryMetaCopyWith<$Res> get meta;
}

/// @nodoc
class __$$FaqCategoryResponseImplCopyWithImpl<$Res>
    extends _$FaqCategoryResponseCopyWithImpl<$Res, _$FaqCategoryResponseImpl>
    implements _$$FaqCategoryResponseImplCopyWith<$Res> {
  __$$FaqCategoryResponseImplCopyWithImpl(_$FaqCategoryResponseImpl _value,
      $Res Function(_$FaqCategoryResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of FaqCategoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? links = null,
    Object? meta = null,
  }) {
    return _then(_$FaqCategoryResponseImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<FaqCategoryWithFaqs>,
      links: null == links
          ? _value.links
          : links // ignore: cast_nullable_to_non_nullable
              as FaqCategoryLinks,
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as FaqCategoryMeta,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FaqCategoryResponseImpl implements _FaqCategoryResponse {
  const _$FaqCategoryResponseImpl(
      {required final List<FaqCategoryWithFaqs> data,
      required this.links,
      required this.meta})
      : _data = data;

  factory _$FaqCategoryResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$FaqCategoryResponseImplFromJson(json);

  final List<FaqCategoryWithFaqs> _data;
  @override
  List<FaqCategoryWithFaqs> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  final FaqCategoryLinks links;
  @override
  final FaqCategoryMeta meta;

  @override
  String toString() {
    return 'FaqCategoryResponse(data: $data, links: $links, meta: $meta)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FaqCategoryResponseImpl &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.links, links) || other.links == links) &&
            (identical(other.meta, meta) || other.meta == meta));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_data), links, meta);

  /// Create a copy of FaqCategoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FaqCategoryResponseImplCopyWith<_$FaqCategoryResponseImpl> get copyWith =>
      __$$FaqCategoryResponseImplCopyWithImpl<_$FaqCategoryResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FaqCategoryResponseImplToJson(
      this,
    );
  }
}

abstract class _FaqCategoryResponse implements FaqCategoryResponse {
  const factory _FaqCategoryResponse(
      {required final List<FaqCategoryWithFaqs> data,
      required final FaqCategoryLinks links,
      required final FaqCategoryMeta meta}) = _$FaqCategoryResponseImpl;

  factory _FaqCategoryResponse.fromJson(Map<String, dynamic> json) =
      _$FaqCategoryResponseImpl.fromJson;

  @override
  List<FaqCategoryWithFaqs> get data;
  @override
  FaqCategoryLinks get links;
  @override
  FaqCategoryMeta get meta;

  /// Create a copy of FaqCategoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FaqCategoryResponseImplCopyWith<_$FaqCategoryResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FaqCategoryWithFaqs _$FaqCategoryWithFaqsFromJson(Map<String, dynamic> json) {
  return _FaqCategoryWithFaqs.fromJson(json);
}

/// @nodoc
mixin _$FaqCategoryWithFaqs {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get slug => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'faqs_count')
  int get faqsCount => throw _privateConstructorUsedError;
  List<FaqItem> get faqs => throw _privateConstructorUsedError;

  /// Serializes this FaqCategoryWithFaqs to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FaqCategoryWithFaqs
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FaqCategoryWithFaqsCopyWith<FaqCategoryWithFaqs> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FaqCategoryWithFaqsCopyWith<$Res> {
  factory $FaqCategoryWithFaqsCopyWith(
          FaqCategoryWithFaqs value, $Res Function(FaqCategoryWithFaqs) then) =
      _$FaqCategoryWithFaqsCopyWithImpl<$Res, FaqCategoryWithFaqs>;
  @useResult
  $Res call(
      {int id,
      String name,
      String slug,
      String? description,
      String status,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt,
      @JsonKey(name: 'faqs_count') int faqsCount,
      List<FaqItem> faqs});
}

/// @nodoc
class _$FaqCategoryWithFaqsCopyWithImpl<$Res, $Val extends FaqCategoryWithFaqs>
    implements $FaqCategoryWithFaqsCopyWith<$Res> {
  _$FaqCategoryWithFaqsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FaqCategoryWithFaqs
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? slug = null,
    Object? description = freezed,
    Object? status = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? faqsCount = null,
    Object? faqs = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      slug: null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      faqsCount: null == faqsCount
          ? _value.faqsCount
          : faqsCount // ignore: cast_nullable_to_non_nullable
              as int,
      faqs: null == faqs
          ? _value.faqs
          : faqs // ignore: cast_nullable_to_non_nullable
              as List<FaqItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FaqCategoryWithFaqsImplCopyWith<$Res>
    implements $FaqCategoryWithFaqsCopyWith<$Res> {
  factory _$$FaqCategoryWithFaqsImplCopyWith(_$FaqCategoryWithFaqsImpl value,
          $Res Function(_$FaqCategoryWithFaqsImpl) then) =
      __$$FaqCategoryWithFaqsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String slug,
      String? description,
      String status,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt,
      @JsonKey(name: 'faqs_count') int faqsCount,
      List<FaqItem> faqs});
}

/// @nodoc
class __$$FaqCategoryWithFaqsImplCopyWithImpl<$Res>
    extends _$FaqCategoryWithFaqsCopyWithImpl<$Res, _$FaqCategoryWithFaqsImpl>
    implements _$$FaqCategoryWithFaqsImplCopyWith<$Res> {
  __$$FaqCategoryWithFaqsImplCopyWithImpl(_$FaqCategoryWithFaqsImpl _value,
      $Res Function(_$FaqCategoryWithFaqsImpl) _then)
      : super(_value, _then);

  /// Create a copy of FaqCategoryWithFaqs
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? slug = null,
    Object? description = freezed,
    Object? status = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? faqsCount = null,
    Object? faqs = null,
  }) {
    return _then(_$FaqCategoryWithFaqsImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      slug: null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      faqsCount: null == faqsCount
          ? _value.faqsCount
          : faqsCount // ignore: cast_nullable_to_non_nullable
              as int,
      faqs: null == faqs
          ? _value._faqs
          : faqs // ignore: cast_nullable_to_non_nullable
              as List<FaqItem>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FaqCategoryWithFaqsImpl implements _FaqCategoryWithFaqs {
  const _$FaqCategoryWithFaqsImpl(
      {required this.id,
      required this.name,
      required this.slug,
      required this.description,
      required this.status,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') required this.updatedAt,
      @JsonKey(name: 'faqs_count') required this.faqsCount,
      required final List<FaqItem> faqs})
      : _faqs = faqs;

  factory _$FaqCategoryWithFaqsImpl.fromJson(Map<String, dynamic> json) =>
      _$$FaqCategoryWithFaqsImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String slug;
  @override
  final String? description;
  @override
  final String status;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;
  @override
  @JsonKey(name: 'faqs_count')
  final int faqsCount;
  final List<FaqItem> _faqs;
  @override
  List<FaqItem> get faqs {
    if (_faqs is EqualUnmodifiableListView) return _faqs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_faqs);
  }

  @override
  String toString() {
    return 'FaqCategoryWithFaqs(id: $id, name: $name, slug: $slug, description: $description, status: $status, createdAt: $createdAt, updatedAt: $updatedAt, faqsCount: $faqsCount, faqs: $faqs)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FaqCategoryWithFaqsImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.faqsCount, faqsCount) ||
                other.faqsCount == faqsCount) &&
            const DeepCollectionEquality().equals(other._faqs, _faqs));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      slug,
      description,
      status,
      createdAt,
      updatedAt,
      faqsCount,
      const DeepCollectionEquality().hash(_faqs));

  /// Create a copy of FaqCategoryWithFaqs
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FaqCategoryWithFaqsImplCopyWith<_$FaqCategoryWithFaqsImpl> get copyWith =>
      __$$FaqCategoryWithFaqsImplCopyWithImpl<_$FaqCategoryWithFaqsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FaqCategoryWithFaqsImplToJson(
      this,
    );
  }
}

abstract class _FaqCategoryWithFaqs implements FaqCategoryWithFaqs {
  const factory _FaqCategoryWithFaqs(
      {required final int id,
      required final String name,
      required final String slug,
      required final String? description,
      required final String status,
      @JsonKey(name: 'created_at') required final DateTime createdAt,
      @JsonKey(name: 'updated_at') required final DateTime updatedAt,
      @JsonKey(name: 'faqs_count') required final int faqsCount,
      required final List<FaqItem> faqs}) = _$FaqCategoryWithFaqsImpl;

  factory _FaqCategoryWithFaqs.fromJson(Map<String, dynamic> json) =
      _$FaqCategoryWithFaqsImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get slug;
  @override
  String? get description;
  @override
  String get status;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt;
  @override
  @JsonKey(name: 'faqs_count')
  int get faqsCount;
  @override
  List<FaqItem> get faqs;

  /// Create a copy of FaqCategoryWithFaqs
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FaqCategoryWithFaqsImplCopyWith<_$FaqCategoryWithFaqsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FaqItem _$FaqItemFromJson(Map<String, dynamic> json) {
  return _FaqItem.fromJson(json);
}

/// @nodoc
mixin _$FaqItem {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  String get userId => throw _privateConstructorUsedError;
  String get question => throw _privateConstructorUsedError;
  String get answer => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  List<dynamic> get tags => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  @JsonKey(name: 'category_id')
  int get categoryId => throw _privateConstructorUsedError;

  /// Serializes this FaqItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FaqItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FaqItemCopyWith<FaqItem> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FaqItemCopyWith<$Res> {
  factory $FaqItemCopyWith(FaqItem value, $Res Function(FaqItem) then) =
      _$FaqItemCopyWithImpl<$Res, FaqItem>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'user_id') String userId,
      String question,
      String answer,
      String status,
      List<dynamic> tags,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt,
      String? image,
      @JsonKey(name: 'category_id') int categoryId});
}

/// @nodoc
class _$FaqItemCopyWithImpl<$Res, $Val extends FaqItem>
    implements $FaqItemCopyWith<$Res> {
  _$FaqItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FaqItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? question = null,
    Object? answer = null,
    Object? status = null,
    Object? tags = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? image = freezed,
    Object? categoryId = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      answer: null == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FaqItemImplCopyWith<$Res> implements $FaqItemCopyWith<$Res> {
  factory _$$FaqItemImplCopyWith(
          _$FaqItemImpl value, $Res Function(_$FaqItemImpl) then) =
      __$$FaqItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'user_id') String userId,
      String question,
      String answer,
      String status,
      List<dynamic> tags,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt,
      String? image,
      @JsonKey(name: 'category_id') int categoryId});
}

/// @nodoc
class __$$FaqItemImplCopyWithImpl<$Res>
    extends _$FaqItemCopyWithImpl<$Res, _$FaqItemImpl>
    implements _$$FaqItemImplCopyWith<$Res> {
  __$$FaqItemImplCopyWithImpl(
      _$FaqItemImpl _value, $Res Function(_$FaqItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of FaqItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? question = null,
    Object? answer = null,
    Object? status = null,
    Object? tags = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? image = freezed,
    Object? categoryId = null,
  }) {
    return _then(_$FaqItemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      answer: null == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FaqItemImpl implements _FaqItem {
  const _$FaqItemImpl(
      {required this.id,
      @JsonKey(name: 'user_id') required this.userId,
      required this.question,
      required this.answer,
      required this.status,
      required final List<dynamic> tags,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') required this.updatedAt,
      required this.image,
      @JsonKey(name: 'category_id') required this.categoryId})
      : _tags = tags;

  factory _$FaqItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$FaqItemImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'user_id')
  final String userId;
  @override
  final String question;
  @override
  final String answer;
  @override
  final String status;
  final List<dynamic> _tags;
  @override
  List<dynamic> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;
  @override
  final String? image;
  @override
  @JsonKey(name: 'category_id')
  final int categoryId;

  @override
  String toString() {
    return 'FaqItem(id: $id, userId: $userId, question: $question, answer: $answer, status: $status, tags: $tags, createdAt: $createdAt, updatedAt: $updatedAt, image: $image, categoryId: $categoryId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FaqItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.question, question) ||
                other.question == question) &&
            (identical(other.answer, answer) || other.answer == answer) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      question,
      answer,
      status,
      const DeepCollectionEquality().hash(_tags),
      createdAt,
      updatedAt,
      image,
      categoryId);

  /// Create a copy of FaqItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FaqItemImplCopyWith<_$FaqItemImpl> get copyWith =>
      __$$FaqItemImplCopyWithImpl<_$FaqItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FaqItemImplToJson(
      this,
    );
  }
}

abstract class _FaqItem implements FaqItem {
  const factory _FaqItem(
          {required final String id,
          @JsonKey(name: 'user_id') required final String userId,
          required final String question,
          required final String answer,
          required final String status,
          required final List<dynamic> tags,
          @JsonKey(name: 'created_at') required final DateTime createdAt,
          @JsonKey(name: 'updated_at') required final DateTime updatedAt,
          required final String? image,
          @JsonKey(name: 'category_id') required final int categoryId}) =
      _$FaqItemImpl;

  factory _FaqItem.fromJson(Map<String, dynamic> json) = _$FaqItemImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'user_id')
  String get userId;
  @override
  String get question;
  @override
  String get answer;
  @override
  String get status;
  @override
  List<dynamic> get tags;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt;
  @override
  String? get image;
  @override
  @JsonKey(name: 'category_id')
  int get categoryId;

  /// Create a copy of FaqItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FaqItemImplCopyWith<_$FaqItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FaqCategoryLinks _$FaqCategoryLinksFromJson(Map<String, dynamic> json) {
  return _FaqCategoryLinks.fromJson(json);
}

/// @nodoc
mixin _$FaqCategoryLinks {
  String get first => throw _privateConstructorUsedError;
  String get last => throw _privateConstructorUsedError;
  String? get prev => throw _privateConstructorUsedError;
  String? get next => throw _privateConstructorUsedError;

  /// Serializes this FaqCategoryLinks to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FaqCategoryLinks
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FaqCategoryLinksCopyWith<FaqCategoryLinks> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FaqCategoryLinksCopyWith<$Res> {
  factory $FaqCategoryLinksCopyWith(
          FaqCategoryLinks value, $Res Function(FaqCategoryLinks) then) =
      _$FaqCategoryLinksCopyWithImpl<$Res, FaqCategoryLinks>;
  @useResult
  $Res call({String first, String last, String? prev, String? next});
}

/// @nodoc
class _$FaqCategoryLinksCopyWithImpl<$Res, $Val extends FaqCategoryLinks>
    implements $FaqCategoryLinksCopyWith<$Res> {
  _$FaqCategoryLinksCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FaqCategoryLinks
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? first = null,
    Object? last = null,
    Object? prev = freezed,
    Object? next = freezed,
  }) {
    return _then(_value.copyWith(
      first: null == first
          ? _value.first
          : first // ignore: cast_nullable_to_non_nullable
              as String,
      last: null == last
          ? _value.last
          : last // ignore: cast_nullable_to_non_nullable
              as String,
      prev: freezed == prev
          ? _value.prev
          : prev // ignore: cast_nullable_to_non_nullable
              as String?,
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FaqCategoryLinksImplCopyWith<$Res>
    implements $FaqCategoryLinksCopyWith<$Res> {
  factory _$$FaqCategoryLinksImplCopyWith(_$FaqCategoryLinksImpl value,
          $Res Function(_$FaqCategoryLinksImpl) then) =
      __$$FaqCategoryLinksImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String first, String last, String? prev, String? next});
}

/// @nodoc
class __$$FaqCategoryLinksImplCopyWithImpl<$Res>
    extends _$FaqCategoryLinksCopyWithImpl<$Res, _$FaqCategoryLinksImpl>
    implements _$$FaqCategoryLinksImplCopyWith<$Res> {
  __$$FaqCategoryLinksImplCopyWithImpl(_$FaqCategoryLinksImpl _value,
      $Res Function(_$FaqCategoryLinksImpl) _then)
      : super(_value, _then);

  /// Create a copy of FaqCategoryLinks
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? first = null,
    Object? last = null,
    Object? prev = freezed,
    Object? next = freezed,
  }) {
    return _then(_$FaqCategoryLinksImpl(
      first: null == first
          ? _value.first
          : first // ignore: cast_nullable_to_non_nullable
              as String,
      last: null == last
          ? _value.last
          : last // ignore: cast_nullable_to_non_nullable
              as String,
      prev: freezed == prev
          ? _value.prev
          : prev // ignore: cast_nullable_to_non_nullable
              as String?,
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FaqCategoryLinksImpl implements _FaqCategoryLinks {
  const _$FaqCategoryLinksImpl(
      {required this.first,
      required this.last,
      required this.prev,
      required this.next});

  factory _$FaqCategoryLinksImpl.fromJson(Map<String, dynamic> json) =>
      _$$FaqCategoryLinksImplFromJson(json);

  @override
  final String first;
  @override
  final String last;
  @override
  final String? prev;
  @override
  final String? next;

  @override
  String toString() {
    return 'FaqCategoryLinks(first: $first, last: $last, prev: $prev, next: $next)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FaqCategoryLinksImpl &&
            (identical(other.first, first) || other.first == first) &&
            (identical(other.last, last) || other.last == last) &&
            (identical(other.prev, prev) || other.prev == prev) &&
            (identical(other.next, next) || other.next == next));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, first, last, prev, next);

  /// Create a copy of FaqCategoryLinks
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FaqCategoryLinksImplCopyWith<_$FaqCategoryLinksImpl> get copyWith =>
      __$$FaqCategoryLinksImplCopyWithImpl<_$FaqCategoryLinksImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FaqCategoryLinksImplToJson(
      this,
    );
  }
}

abstract class _FaqCategoryLinks implements FaqCategoryLinks {
  const factory _FaqCategoryLinks(
      {required final String first,
      required final String last,
      required final String? prev,
      required final String? next}) = _$FaqCategoryLinksImpl;

  factory _FaqCategoryLinks.fromJson(Map<String, dynamic> json) =
      _$FaqCategoryLinksImpl.fromJson;

  @override
  String get first;
  @override
  String get last;
  @override
  String? get prev;
  @override
  String? get next;

  /// Create a copy of FaqCategoryLinks
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FaqCategoryLinksImplCopyWith<_$FaqCategoryLinksImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FaqCategoryMeta _$FaqCategoryMetaFromJson(Map<String, dynamic> json) {
  return _FaqCategoryMeta.fromJson(json);
}

/// @nodoc
mixin _$FaqCategoryMeta {
  @JsonKey(name: 'current_page')
  int get currentPage => throw _privateConstructorUsedError;
  int get from => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_page')
  int get lastPage => throw _privateConstructorUsedError;
  List<FaqCategoryMetaLink> get links => throw _privateConstructorUsedError;
  String get path => throw _privateConstructorUsedError;
  @JsonKey(name: 'per_page')
  int get perPage => throw _privateConstructorUsedError;
  int get to => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;

  /// Serializes this FaqCategoryMeta to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FaqCategoryMeta
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FaqCategoryMetaCopyWith<FaqCategoryMeta> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FaqCategoryMetaCopyWith<$Res> {
  factory $FaqCategoryMetaCopyWith(
          FaqCategoryMeta value, $Res Function(FaqCategoryMeta) then) =
      _$FaqCategoryMetaCopyWithImpl<$Res, FaqCategoryMeta>;
  @useResult
  $Res call(
      {@JsonKey(name: 'current_page') int currentPage,
      int from,
      @JsonKey(name: 'last_page') int lastPage,
      List<FaqCategoryMetaLink> links,
      String path,
      @JsonKey(name: 'per_page') int perPage,
      int to,
      int total});
}

/// @nodoc
class _$FaqCategoryMetaCopyWithImpl<$Res, $Val extends FaqCategoryMeta>
    implements $FaqCategoryMetaCopyWith<$Res> {
  _$FaqCategoryMetaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FaqCategoryMeta
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPage = null,
    Object? from = null,
    Object? lastPage = null,
    Object? links = null,
    Object? path = null,
    Object? perPage = null,
    Object? to = null,
    Object? total = null,
  }) {
    return _then(_value.copyWith(
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      from: null == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as int,
      lastPage: null == lastPage
          ? _value.lastPage
          : lastPage // ignore: cast_nullable_to_non_nullable
              as int,
      links: null == links
          ? _value.links
          : links // ignore: cast_nullable_to_non_nullable
              as List<FaqCategoryMetaLink>,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      perPage: null == perPage
          ? _value.perPage
          : perPage // ignore: cast_nullable_to_non_nullable
              as int,
      to: null == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FaqCategoryMetaImplCopyWith<$Res>
    implements $FaqCategoryMetaCopyWith<$Res> {
  factory _$$FaqCategoryMetaImplCopyWith(_$FaqCategoryMetaImpl value,
          $Res Function(_$FaqCategoryMetaImpl) then) =
      __$$FaqCategoryMetaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'current_page') int currentPage,
      int from,
      @JsonKey(name: 'last_page') int lastPage,
      List<FaqCategoryMetaLink> links,
      String path,
      @JsonKey(name: 'per_page') int perPage,
      int to,
      int total});
}

/// @nodoc
class __$$FaqCategoryMetaImplCopyWithImpl<$Res>
    extends _$FaqCategoryMetaCopyWithImpl<$Res, _$FaqCategoryMetaImpl>
    implements _$$FaqCategoryMetaImplCopyWith<$Res> {
  __$$FaqCategoryMetaImplCopyWithImpl(
      _$FaqCategoryMetaImpl _value, $Res Function(_$FaqCategoryMetaImpl) _then)
      : super(_value, _then);

  /// Create a copy of FaqCategoryMeta
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPage = null,
    Object? from = null,
    Object? lastPage = null,
    Object? links = null,
    Object? path = null,
    Object? perPage = null,
    Object? to = null,
    Object? total = null,
  }) {
    return _then(_$FaqCategoryMetaImpl(
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      from: null == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as int,
      lastPage: null == lastPage
          ? _value.lastPage
          : lastPage // ignore: cast_nullable_to_non_nullable
              as int,
      links: null == links
          ? _value._links
          : links // ignore: cast_nullable_to_non_nullable
              as List<FaqCategoryMetaLink>,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      perPage: null == perPage
          ? _value.perPage
          : perPage // ignore: cast_nullable_to_non_nullable
              as int,
      to: null == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FaqCategoryMetaImpl implements _FaqCategoryMeta {
  const _$FaqCategoryMetaImpl(
      {@JsonKey(name: 'current_page') required this.currentPage,
      required this.from,
      @JsonKey(name: 'last_page') required this.lastPage,
      required final List<FaqCategoryMetaLink> links,
      required this.path,
      @JsonKey(name: 'per_page') required this.perPage,
      required this.to,
      required this.total})
      : _links = links;

  factory _$FaqCategoryMetaImpl.fromJson(Map<String, dynamic> json) =>
      _$$FaqCategoryMetaImplFromJson(json);

  @override
  @JsonKey(name: 'current_page')
  final int currentPage;
  @override
  final int from;
  @override
  @JsonKey(name: 'last_page')
  final int lastPage;
  final List<FaqCategoryMetaLink> _links;
  @override
  List<FaqCategoryMetaLink> get links {
    if (_links is EqualUnmodifiableListView) return _links;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_links);
  }

  @override
  final String path;
  @override
  @JsonKey(name: 'per_page')
  final int perPage;
  @override
  final int to;
  @override
  final int total;

  @override
  String toString() {
    return 'FaqCategoryMeta(currentPage: $currentPage, from: $from, lastPage: $lastPage, links: $links, path: $path, perPage: $perPage, to: $to, total: $total)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FaqCategoryMetaImpl &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.from, from) || other.from == from) &&
            (identical(other.lastPage, lastPage) ||
                other.lastPage == lastPage) &&
            const DeepCollectionEquality().equals(other._links, _links) &&
            (identical(other.path, path) || other.path == path) &&
            (identical(other.perPage, perPage) || other.perPage == perPage) &&
            (identical(other.to, to) || other.to == to) &&
            (identical(other.total, total) || other.total == total));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, currentPage, from, lastPage,
      const DeepCollectionEquality().hash(_links), path, perPage, to, total);

  /// Create a copy of FaqCategoryMeta
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FaqCategoryMetaImplCopyWith<_$FaqCategoryMetaImpl> get copyWith =>
      __$$FaqCategoryMetaImplCopyWithImpl<_$FaqCategoryMetaImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FaqCategoryMetaImplToJson(
      this,
    );
  }
}

abstract class _FaqCategoryMeta implements FaqCategoryMeta {
  const factory _FaqCategoryMeta(
      {@JsonKey(name: 'current_page') required final int currentPage,
      required final int from,
      @JsonKey(name: 'last_page') required final int lastPage,
      required final List<FaqCategoryMetaLink> links,
      required final String path,
      @JsonKey(name: 'per_page') required final int perPage,
      required final int to,
      required final int total}) = _$FaqCategoryMetaImpl;

  factory _FaqCategoryMeta.fromJson(Map<String, dynamic> json) =
      _$FaqCategoryMetaImpl.fromJson;

  @override
  @JsonKey(name: 'current_page')
  int get currentPage;
  @override
  int get from;
  @override
  @JsonKey(name: 'last_page')
  int get lastPage;
  @override
  List<FaqCategoryMetaLink> get links;
  @override
  String get path;
  @override
  @JsonKey(name: 'per_page')
  int get perPage;
  @override
  int get to;
  @override
  int get total;

  /// Create a copy of FaqCategoryMeta
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FaqCategoryMetaImplCopyWith<_$FaqCategoryMetaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FaqCategoryMetaLink _$FaqCategoryMetaLinkFromJson(Map<String, dynamic> json) {
  return _FaqCategoryMetaLink.fromJson(json);
}

/// @nodoc
mixin _$FaqCategoryMetaLink {
  String? get url => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;
  int? get page => throw _privateConstructorUsedError;
  bool get active => throw _privateConstructorUsedError;

  /// Serializes this FaqCategoryMetaLink to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FaqCategoryMetaLink
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FaqCategoryMetaLinkCopyWith<FaqCategoryMetaLink> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FaqCategoryMetaLinkCopyWith<$Res> {
  factory $FaqCategoryMetaLinkCopyWith(
          FaqCategoryMetaLink value, $Res Function(FaqCategoryMetaLink) then) =
      _$FaqCategoryMetaLinkCopyWithImpl<$Res, FaqCategoryMetaLink>;
  @useResult
  $Res call({String? url, String label, int? page, bool active});
}

/// @nodoc
class _$FaqCategoryMetaLinkCopyWithImpl<$Res, $Val extends FaqCategoryMetaLink>
    implements $FaqCategoryMetaLinkCopyWith<$Res> {
  _$FaqCategoryMetaLinkCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FaqCategoryMetaLink
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = freezed,
    Object? label = null,
    Object? page = freezed,
    Object? active = null,
  }) {
    return _then(_value.copyWith(
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FaqCategoryMetaLinkImplCopyWith<$Res>
    implements $FaqCategoryMetaLinkCopyWith<$Res> {
  factory _$$FaqCategoryMetaLinkImplCopyWith(_$FaqCategoryMetaLinkImpl value,
          $Res Function(_$FaqCategoryMetaLinkImpl) then) =
      __$$FaqCategoryMetaLinkImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? url, String label, int? page, bool active});
}

/// @nodoc
class __$$FaqCategoryMetaLinkImplCopyWithImpl<$Res>
    extends _$FaqCategoryMetaLinkCopyWithImpl<$Res, _$FaqCategoryMetaLinkImpl>
    implements _$$FaqCategoryMetaLinkImplCopyWith<$Res> {
  __$$FaqCategoryMetaLinkImplCopyWithImpl(_$FaqCategoryMetaLinkImpl _value,
      $Res Function(_$FaqCategoryMetaLinkImpl) _then)
      : super(_value, _then);

  /// Create a copy of FaqCategoryMetaLink
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = freezed,
    Object? label = null,
    Object? page = freezed,
    Object? active = null,
  }) {
    return _then(_$FaqCategoryMetaLinkImpl(
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FaqCategoryMetaLinkImpl implements _FaqCategoryMetaLink {
  const _$FaqCategoryMetaLinkImpl(
      {required this.url,
      required this.label,
      required this.page,
      required this.active});

  factory _$FaqCategoryMetaLinkImpl.fromJson(Map<String, dynamic> json) =>
      _$$FaqCategoryMetaLinkImplFromJson(json);

  @override
  final String? url;
  @override
  final String label;
  @override
  final int? page;
  @override
  final bool active;

  @override
  String toString() {
    return 'FaqCategoryMetaLink(url: $url, label: $label, page: $page, active: $active)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FaqCategoryMetaLinkImpl &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.active, active) || other.active == active));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, url, label, page, active);

  /// Create a copy of FaqCategoryMetaLink
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FaqCategoryMetaLinkImplCopyWith<_$FaqCategoryMetaLinkImpl> get copyWith =>
      __$$FaqCategoryMetaLinkImplCopyWithImpl<_$FaqCategoryMetaLinkImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FaqCategoryMetaLinkImplToJson(
      this,
    );
  }
}

abstract class _FaqCategoryMetaLink implements FaqCategoryMetaLink {
  const factory _FaqCategoryMetaLink(
      {required final String? url,
      required final String label,
      required final int? page,
      required final bool active}) = _$FaqCategoryMetaLinkImpl;

  factory _FaqCategoryMetaLink.fromJson(Map<String, dynamic> json) =
      _$FaqCategoryMetaLinkImpl.fromJson;

  @override
  String? get url;
  @override
  String get label;
  @override
  int? get page;
  @override
  bool get active;

  /// Create a copy of FaqCategoryMetaLink
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FaqCategoryMetaLinkImplCopyWith<_$FaqCategoryMetaLinkImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
