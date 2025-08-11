// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'itemCategoryModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ItemCategoryResponse _$ItemCategoryResponseFromJson(Map<String, dynamic> json) {
  return _ItemCategoryResponse.fromJson(json);
}

/// @nodoc
mixin _$ItemCategoryResponse {
  List<ItemCategory> get data => throw _privateConstructorUsedError;
  PaginationLinks get links => throw _privateConstructorUsedError;
  PaginationMeta get meta => throw _privateConstructorUsedError;

  /// Serializes this ItemCategoryResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ItemCategoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ItemCategoryResponseCopyWith<ItemCategoryResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemCategoryResponseCopyWith<$Res> {
  factory $ItemCategoryResponseCopyWith(ItemCategoryResponse value,
          $Res Function(ItemCategoryResponse) then) =
      _$ItemCategoryResponseCopyWithImpl<$Res, ItemCategoryResponse>;
  @useResult
  $Res call(
      {List<ItemCategory> data, PaginationLinks links, PaginationMeta meta});

  $PaginationLinksCopyWith<$Res> get links;
  $PaginationMetaCopyWith<$Res> get meta;
}

/// @nodoc
class _$ItemCategoryResponseCopyWithImpl<$Res,
        $Val extends ItemCategoryResponse>
    implements $ItemCategoryResponseCopyWith<$Res> {
  _$ItemCategoryResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ItemCategoryResponse
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
              as List<ItemCategory>,
      links: null == links
          ? _value.links
          : links // ignore: cast_nullable_to_non_nullable
              as PaginationLinks,
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as PaginationMeta,
    ) as $Val);
  }

  /// Create a copy of ItemCategoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PaginationLinksCopyWith<$Res> get links {
    return $PaginationLinksCopyWith<$Res>(_value.links, (value) {
      return _then(_value.copyWith(links: value) as $Val);
    });
  }

  /// Create a copy of ItemCategoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PaginationMetaCopyWith<$Res> get meta {
    return $PaginationMetaCopyWith<$Res>(_value.meta, (value) {
      return _then(_value.copyWith(meta: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ItemCategoryResponseImplCopyWith<$Res>
    implements $ItemCategoryResponseCopyWith<$Res> {
  factory _$$ItemCategoryResponseImplCopyWith(_$ItemCategoryResponseImpl value,
          $Res Function(_$ItemCategoryResponseImpl) then) =
      __$$ItemCategoryResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<ItemCategory> data, PaginationLinks links, PaginationMeta meta});

  @override
  $PaginationLinksCopyWith<$Res> get links;
  @override
  $PaginationMetaCopyWith<$Res> get meta;
}

/// @nodoc
class __$$ItemCategoryResponseImplCopyWithImpl<$Res>
    extends _$ItemCategoryResponseCopyWithImpl<$Res, _$ItemCategoryResponseImpl>
    implements _$$ItemCategoryResponseImplCopyWith<$Res> {
  __$$ItemCategoryResponseImplCopyWithImpl(_$ItemCategoryResponseImpl _value,
      $Res Function(_$ItemCategoryResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of ItemCategoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? links = null,
    Object? meta = null,
  }) {
    return _then(_$ItemCategoryResponseImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<ItemCategory>,
      links: null == links
          ? _value.links
          : links // ignore: cast_nullable_to_non_nullable
              as PaginationLinks,
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as PaginationMeta,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ItemCategoryResponseImpl implements _ItemCategoryResponse {
  const _$ItemCategoryResponseImpl(
      {required final List<ItemCategory> data,
      required this.links,
      required this.meta})
      : _data = data;

  factory _$ItemCategoryResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ItemCategoryResponseImplFromJson(json);

  final List<ItemCategory> _data;
  @override
  List<ItemCategory> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  final PaginationLinks links;
  @override
  final PaginationMeta meta;

  @override
  String toString() {
    return 'ItemCategoryResponse(data: $data, links: $links, meta: $meta)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ItemCategoryResponseImpl &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.links, links) || other.links == links) &&
            (identical(other.meta, meta) || other.meta == meta));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_data), links, meta);

  /// Create a copy of ItemCategoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ItemCategoryResponseImplCopyWith<_$ItemCategoryResponseImpl>
      get copyWith =>
          __$$ItemCategoryResponseImplCopyWithImpl<_$ItemCategoryResponseImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ItemCategoryResponseImplToJson(
      this,
    );
  }
}

abstract class _ItemCategoryResponse implements ItemCategoryResponse {
  const factory _ItemCategoryResponse(
      {required final List<ItemCategory> data,
      required final PaginationLinks links,
      required final PaginationMeta meta}) = _$ItemCategoryResponseImpl;

  factory _ItemCategoryResponse.fromJson(Map<String, dynamic> json) =
      _$ItemCategoryResponseImpl.fromJson;

  @override
  List<ItemCategory> get data;
  @override
  PaginationLinks get links;
  @override
  PaginationMeta get meta;

  /// Create a copy of ItemCategoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ItemCategoryResponseImplCopyWith<_$ItemCategoryResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ItemCategory _$ItemCategoryFromJson(Map<String, dynamic> json) {
  return _ItemCategory.fromJson(json);
}

/// @nodoc
mixin _$ItemCategory {
  @JsonKey(fromJson: _parseInt)
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id', fromJson: _parseNullableInt)
  int? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'parent_id', fromJson: _parseNullableInt)
  int? get parentId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get slug => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  List<String> get features => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'item_fields')
  List<ItemField> get itemFields => throw _privateConstructorUsedError;

  /// Serializes this ItemCategory to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ItemCategory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ItemCategoryCopyWith<ItemCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemCategoryCopyWith<$Res> {
  factory $ItemCategoryCopyWith(
          ItemCategory value, $Res Function(ItemCategory) then) =
      _$ItemCategoryCopyWithImpl<$Res, ItemCategory>;
  @useResult
  $Res call(
      {@JsonKey(fromJson: _parseInt) int id,
      @JsonKey(name: 'user_id', fromJson: _parseNullableInt) int? userId,
      @JsonKey(name: 'parent_id', fromJson: _parseNullableInt) int? parentId,
      String name,
      String slug,
      String description,
      List<String> features,
      String image,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt,
      @JsonKey(name: 'item_fields') List<ItemField> itemFields});
}

/// @nodoc
class _$ItemCategoryCopyWithImpl<$Res, $Val extends ItemCategory>
    implements $ItemCategoryCopyWith<$Res> {
  _$ItemCategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ItemCategory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = freezed,
    Object? parentId = freezed,
    Object? name = null,
    Object? slug = null,
    Object? description = null,
    Object? features = null,
    Object? image = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? itemFields = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      parentId: freezed == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as int?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      slug: null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      features: null == features
          ? _value.features
          : features // ignore: cast_nullable_to_non_nullable
              as List<String>,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      itemFields: null == itemFields
          ? _value.itemFields
          : itemFields // ignore: cast_nullable_to_non_nullable
              as List<ItemField>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ItemCategoryImplCopyWith<$Res>
    implements $ItemCategoryCopyWith<$Res> {
  factory _$$ItemCategoryImplCopyWith(
          _$ItemCategoryImpl value, $Res Function(_$ItemCategoryImpl) then) =
      __$$ItemCategoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(fromJson: _parseInt) int id,
      @JsonKey(name: 'user_id', fromJson: _parseNullableInt) int? userId,
      @JsonKey(name: 'parent_id', fromJson: _parseNullableInt) int? parentId,
      String name,
      String slug,
      String description,
      List<String> features,
      String image,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt,
      @JsonKey(name: 'item_fields') List<ItemField> itemFields});
}

/// @nodoc
class __$$ItemCategoryImplCopyWithImpl<$Res>
    extends _$ItemCategoryCopyWithImpl<$Res, _$ItemCategoryImpl>
    implements _$$ItemCategoryImplCopyWith<$Res> {
  __$$ItemCategoryImplCopyWithImpl(
      _$ItemCategoryImpl _value, $Res Function(_$ItemCategoryImpl) _then)
      : super(_value, _then);

  /// Create a copy of ItemCategory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = freezed,
    Object? parentId = freezed,
    Object? name = null,
    Object? slug = null,
    Object? description = null,
    Object? features = null,
    Object? image = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? itemFields = null,
  }) {
    return _then(_$ItemCategoryImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      parentId: freezed == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as int?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      slug: null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      features: null == features
          ? _value._features
          : features // ignore: cast_nullable_to_non_nullable
              as List<String>,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      itemFields: null == itemFields
          ? _value._itemFields
          : itemFields // ignore: cast_nullable_to_non_nullable
              as List<ItemField>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$ItemCategoryImpl extends _ItemCategory {
  const _$ItemCategoryImpl(
      {@JsonKey(fromJson: _parseInt) required this.id,
      @JsonKey(name: 'user_id', fromJson: _parseNullableInt) this.userId,
      @JsonKey(name: 'parent_id', fromJson: _parseNullableInt) this.parentId,
      required this.name,
      required this.slug,
      required this.description,
      required final List<String> features,
      required this.image,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') required this.updatedAt,
      @JsonKey(name: 'item_fields') required final List<ItemField> itemFields})
      : _features = features,
        _itemFields = itemFields,
        super._();

  factory _$ItemCategoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$ItemCategoryImplFromJson(json);

  @override
  @JsonKey(fromJson: _parseInt)
  final int id;
  @override
  @JsonKey(name: 'user_id', fromJson: _parseNullableInt)
  final int? userId;
  @override
  @JsonKey(name: 'parent_id', fromJson: _parseNullableInt)
  final int? parentId;
  @override
  final String name;
  @override
  final String slug;
  @override
  final String description;
  final List<String> _features;
  @override
  List<String> get features {
    if (_features is EqualUnmodifiableListView) return _features;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_features);
  }

  @override
  final String image;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;
  final List<ItemField> _itemFields;
  @override
  @JsonKey(name: 'item_fields')
  List<ItemField> get itemFields {
    if (_itemFields is EqualUnmodifiableListView) return _itemFields;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_itemFields);
  }

  @override
  String toString() {
    return 'ItemCategory(id: $id, userId: $userId, parentId: $parentId, name: $name, slug: $slug, description: $description, features: $features, image: $image, createdAt: $createdAt, updatedAt: $updatedAt, itemFields: $itemFields)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ItemCategoryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.parentId, parentId) ||
                other.parentId == parentId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._features, _features) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            const DeepCollectionEquality()
                .equals(other._itemFields, _itemFields));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      parentId,
      name,
      slug,
      description,
      const DeepCollectionEquality().hash(_features),
      image,
      createdAt,
      updatedAt,
      const DeepCollectionEquality().hash(_itemFields));

  /// Create a copy of ItemCategory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ItemCategoryImplCopyWith<_$ItemCategoryImpl> get copyWith =>
      __$$ItemCategoryImplCopyWithImpl<_$ItemCategoryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ItemCategoryImplToJson(
      this,
    );
  }
}

abstract class _ItemCategory extends ItemCategory {
  const factory _ItemCategory(
      {@JsonKey(fromJson: _parseInt) required final int id,
      @JsonKey(name: 'user_id', fromJson: _parseNullableInt) final int? userId,
      @JsonKey(name: 'parent_id', fromJson: _parseNullableInt)
      final int? parentId,
      required final String name,
      required final String slug,
      required final String description,
      required final List<String> features,
      required final String image,
      @JsonKey(name: 'created_at') required final DateTime createdAt,
      @JsonKey(name: 'updated_at') required final DateTime updatedAt,
      @JsonKey(name: 'item_fields')
      required final List<ItemField> itemFields}) = _$ItemCategoryImpl;
  const _ItemCategory._() : super._();

  factory _ItemCategory.fromJson(Map<String, dynamic> json) =
      _$ItemCategoryImpl.fromJson;

  @override
  @JsonKey(fromJson: _parseInt)
  int get id;
  @override
  @JsonKey(name: 'user_id', fromJson: _parseNullableInt)
  int? get userId;
  @override
  @JsonKey(name: 'parent_id', fromJson: _parseNullableInt)
  int? get parentId;
  @override
  String get name;
  @override
  String get slug;
  @override
  String get description;
  @override
  List<String> get features;
  @override
  String get image;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt;
  @override
  @JsonKey(name: 'item_fields')
  List<ItemField> get itemFields;

  /// Create a copy of ItemCategory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ItemCategoryImplCopyWith<_$ItemCategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ItemField _$ItemFieldFromJson(Map<String, dynamic> json) {
  return _ItemField.fromJson(json);
}

/// @nodoc
mixin _$ItemField {
  @JsonKey(fromJson: _parseInt)
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _boolFromInt)
  bool get required => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _boolFromInt)
  bool get unique => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _boolFromInt)
  bool get nullable => throw _privateConstructorUsedError;
  List<dynamic>? get options => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt => throw _privateConstructorUsedError;
  ItemFieldPivot get pivot => throw _privateConstructorUsedError;

  /// Serializes this ItemField to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ItemField
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ItemFieldCopyWith<ItemField> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemFieldCopyWith<$Res> {
  factory $ItemFieldCopyWith(ItemField value, $Res Function(ItemField) then) =
      _$ItemFieldCopyWithImpl<$Res, ItemField>;
  @useResult
  $Res call(
      {@JsonKey(fromJson: _parseInt) int id,
      String name,
      String label,
      String type,
      @JsonKey(fromJson: _boolFromInt) bool required,
      @JsonKey(fromJson: _boolFromInt) bool unique,
      @JsonKey(fromJson: _boolFromInt) bool nullable,
      List<dynamic>? options,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt,
      ItemFieldPivot pivot});

  $ItemFieldPivotCopyWith<$Res> get pivot;
}

/// @nodoc
class _$ItemFieldCopyWithImpl<$Res, $Val extends ItemField>
    implements $ItemFieldCopyWith<$Res> {
  _$ItemFieldCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ItemField
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? label = null,
    Object? type = null,
    Object? required = null,
    Object? unique = null,
    Object? nullable = null,
    Object? options = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? pivot = null,
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
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      required: null == required
          ? _value.required
          : required // ignore: cast_nullable_to_non_nullable
              as bool,
      unique: null == unique
          ? _value.unique
          : unique // ignore: cast_nullable_to_non_nullable
              as bool,
      nullable: null == nullable
          ? _value.nullable
          : nullable // ignore: cast_nullable_to_non_nullable
              as bool,
      options: freezed == options
          ? _value.options
          : options // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      pivot: null == pivot
          ? _value.pivot
          : pivot // ignore: cast_nullable_to_non_nullable
              as ItemFieldPivot,
    ) as $Val);
  }

  /// Create a copy of ItemField
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ItemFieldPivotCopyWith<$Res> get pivot {
    return $ItemFieldPivotCopyWith<$Res>(_value.pivot, (value) {
      return _then(_value.copyWith(pivot: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ItemFieldImplCopyWith<$Res>
    implements $ItemFieldCopyWith<$Res> {
  factory _$$ItemFieldImplCopyWith(
          _$ItemFieldImpl value, $Res Function(_$ItemFieldImpl) then) =
      __$$ItemFieldImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(fromJson: _parseInt) int id,
      String name,
      String label,
      String type,
      @JsonKey(fromJson: _boolFromInt) bool required,
      @JsonKey(fromJson: _boolFromInt) bool unique,
      @JsonKey(fromJson: _boolFromInt) bool nullable,
      List<dynamic>? options,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt,
      ItemFieldPivot pivot});

  @override
  $ItemFieldPivotCopyWith<$Res> get pivot;
}

/// @nodoc
class __$$ItemFieldImplCopyWithImpl<$Res>
    extends _$ItemFieldCopyWithImpl<$Res, _$ItemFieldImpl>
    implements _$$ItemFieldImplCopyWith<$Res> {
  __$$ItemFieldImplCopyWithImpl(
      _$ItemFieldImpl _value, $Res Function(_$ItemFieldImpl) _then)
      : super(_value, _then);

  /// Create a copy of ItemField
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? label = null,
    Object? type = null,
    Object? required = null,
    Object? unique = null,
    Object? nullable = null,
    Object? options = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? pivot = null,
  }) {
    return _then(_$ItemFieldImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      required: null == required
          ? _value.required
          : required // ignore: cast_nullable_to_non_nullable
              as bool,
      unique: null == unique
          ? _value.unique
          : unique // ignore: cast_nullable_to_non_nullable
              as bool,
      nullable: null == nullable
          ? _value.nullable
          : nullable // ignore: cast_nullable_to_non_nullable
              as bool,
      options: freezed == options
          ? _value._options
          : options // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      pivot: null == pivot
          ? _value.pivot
          : pivot // ignore: cast_nullable_to_non_nullable
              as ItemFieldPivot,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$ItemFieldImpl extends _ItemField {
  const _$ItemFieldImpl(
      {@JsonKey(fromJson: _parseInt) required this.id,
      required this.name,
      required this.label,
      required this.type,
      @JsonKey(fromJson: _boolFromInt) required this.required,
      @JsonKey(fromJson: _boolFromInt) required this.unique,
      @JsonKey(fromJson: _boolFromInt) required this.nullable,
      final List<dynamic>? options,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') required this.updatedAt,
      required this.pivot})
      : _options = options,
        super._();

  factory _$ItemFieldImpl.fromJson(Map<String, dynamic> json) =>
      _$$ItemFieldImplFromJson(json);

  @override
  @JsonKey(fromJson: _parseInt)
  final int id;
  @override
  final String name;
  @override
  final String label;
  @override
  final String type;
  @override
  @JsonKey(fromJson: _boolFromInt)
  final bool required;
  @override
  @JsonKey(fromJson: _boolFromInt)
  final bool unique;
  @override
  @JsonKey(fromJson: _boolFromInt)
  final bool nullable;
  final List<dynamic>? _options;
  @override
  List<dynamic>? get options {
    final value = _options;
    if (value == null) return null;
    if (_options is EqualUnmodifiableListView) return _options;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;
  @override
  final ItemFieldPivot pivot;

  @override
  String toString() {
    return 'ItemField(id: $id, name: $name, label: $label, type: $type, required: $required, unique: $unique, nullable: $nullable, options: $options, createdAt: $createdAt, updatedAt: $updatedAt, pivot: $pivot)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ItemFieldImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.required, required) ||
                other.required == required) &&
            (identical(other.unique, unique) || other.unique == unique) &&
            (identical(other.nullable, nullable) ||
                other.nullable == nullable) &&
            const DeepCollectionEquality().equals(other._options, _options) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.pivot, pivot) || other.pivot == pivot));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      label,
      type,
      required,
      unique,
      nullable,
      const DeepCollectionEquality().hash(_options),
      createdAt,
      updatedAt,
      pivot);

  /// Create a copy of ItemField
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ItemFieldImplCopyWith<_$ItemFieldImpl> get copyWith =>
      __$$ItemFieldImplCopyWithImpl<_$ItemFieldImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ItemFieldImplToJson(
      this,
    );
  }
}

abstract class _ItemField extends ItemField {
  const factory _ItemField(
      {@JsonKey(fromJson: _parseInt) required final int id,
      required final String name,
      required final String label,
      required final String type,
      @JsonKey(fromJson: _boolFromInt) required final bool required,
      @JsonKey(fromJson: _boolFromInt) required final bool unique,
      @JsonKey(fromJson: _boolFromInt) required final bool nullable,
      final List<dynamic>? options,
      @JsonKey(name: 'created_at') required final DateTime createdAt,
      @JsonKey(name: 'updated_at') required final DateTime updatedAt,
      required final ItemFieldPivot pivot}) = _$ItemFieldImpl;
  const _ItemField._() : super._();

  factory _ItemField.fromJson(Map<String, dynamic> json) =
      _$ItemFieldImpl.fromJson;

  @override
  @JsonKey(fromJson: _parseInt)
  int get id;
  @override
  String get name;
  @override
  String get label;
  @override
  String get type;
  @override
  @JsonKey(fromJson: _boolFromInt)
  bool get required;
  @override
  @JsonKey(fromJson: _boolFromInt)
  bool get unique;
  @override
  @JsonKey(fromJson: _boolFromInt)
  bool get nullable;
  @override
  List<dynamic>? get options;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt;
  @override
  ItemFieldPivot get pivot;

  /// Create a copy of ItemField
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ItemFieldImplCopyWith<_$ItemFieldImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ItemFieldPivot _$ItemFieldPivotFromJson(Map<String, dynamic> json) {
  return _ItemFieldPivot.fromJson(json);
}

/// @nodoc
mixin _$ItemFieldPivot {
  @JsonKey(name: 'category_id', fromJson: _parseInt)
  int get categoryId => throw _privateConstructorUsedError;
  @JsonKey(name: 'item_field_id', fromJson: _parseInt)
  int get itemFieldId => throw _privateConstructorUsedError;

  /// Serializes this ItemFieldPivot to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ItemFieldPivot
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ItemFieldPivotCopyWith<ItemFieldPivot> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemFieldPivotCopyWith<$Res> {
  factory $ItemFieldPivotCopyWith(
          ItemFieldPivot value, $Res Function(ItemFieldPivot) then) =
      _$ItemFieldPivotCopyWithImpl<$Res, ItemFieldPivot>;
  @useResult
  $Res call(
      {@JsonKey(name: 'category_id', fromJson: _parseInt) int categoryId,
      @JsonKey(name: 'item_field_id', fromJson: _parseInt) int itemFieldId});
}

/// @nodoc
class _$ItemFieldPivotCopyWithImpl<$Res, $Val extends ItemFieldPivot>
    implements $ItemFieldPivotCopyWith<$Res> {
  _$ItemFieldPivotCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ItemFieldPivot
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryId = null,
    Object? itemFieldId = null,
  }) {
    return _then(_value.copyWith(
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int,
      itemFieldId: null == itemFieldId
          ? _value.itemFieldId
          : itemFieldId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ItemFieldPivotImplCopyWith<$Res>
    implements $ItemFieldPivotCopyWith<$Res> {
  factory _$$ItemFieldPivotImplCopyWith(_$ItemFieldPivotImpl value,
          $Res Function(_$ItemFieldPivotImpl) then) =
      __$$ItemFieldPivotImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'category_id', fromJson: _parseInt) int categoryId,
      @JsonKey(name: 'item_field_id', fromJson: _parseInt) int itemFieldId});
}

/// @nodoc
class __$$ItemFieldPivotImplCopyWithImpl<$Res>
    extends _$ItemFieldPivotCopyWithImpl<$Res, _$ItemFieldPivotImpl>
    implements _$$ItemFieldPivotImplCopyWith<$Res> {
  __$$ItemFieldPivotImplCopyWithImpl(
      _$ItemFieldPivotImpl _value, $Res Function(_$ItemFieldPivotImpl) _then)
      : super(_value, _then);

  /// Create a copy of ItemFieldPivot
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryId = null,
    Object? itemFieldId = null,
  }) {
    return _then(_$ItemFieldPivotImpl(
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int,
      itemFieldId: null == itemFieldId
          ? _value.itemFieldId
          : itemFieldId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ItemFieldPivotImpl extends _ItemFieldPivot {
  const _$ItemFieldPivotImpl(
      {@JsonKey(name: 'category_id', fromJson: _parseInt)
      required this.categoryId,
      @JsonKey(name: 'item_field_id', fromJson: _parseInt)
      required this.itemFieldId})
      : super._();

  factory _$ItemFieldPivotImpl.fromJson(Map<String, dynamic> json) =>
      _$$ItemFieldPivotImplFromJson(json);

  @override
  @JsonKey(name: 'category_id', fromJson: _parseInt)
  final int categoryId;
  @override
  @JsonKey(name: 'item_field_id', fromJson: _parseInt)
  final int itemFieldId;

  @override
  String toString() {
    return 'ItemFieldPivot(categoryId: $categoryId, itemFieldId: $itemFieldId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ItemFieldPivotImpl &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.itemFieldId, itemFieldId) ||
                other.itemFieldId == itemFieldId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, categoryId, itemFieldId);

  /// Create a copy of ItemFieldPivot
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ItemFieldPivotImplCopyWith<_$ItemFieldPivotImpl> get copyWith =>
      __$$ItemFieldPivotImplCopyWithImpl<_$ItemFieldPivotImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ItemFieldPivotImplToJson(
      this,
    );
  }
}

abstract class _ItemFieldPivot extends ItemFieldPivot {
  const factory _ItemFieldPivot(
      {@JsonKey(name: 'category_id', fromJson: _parseInt)
      required final int categoryId,
      @JsonKey(name: 'item_field_id', fromJson: _parseInt)
      required final int itemFieldId}) = _$ItemFieldPivotImpl;
  const _ItemFieldPivot._() : super._();

  factory _ItemFieldPivot.fromJson(Map<String, dynamic> json) =
      _$ItemFieldPivotImpl.fromJson;

  @override
  @JsonKey(name: 'category_id', fromJson: _parseInt)
  int get categoryId;
  @override
  @JsonKey(name: 'item_field_id', fromJson: _parseInt)
  int get itemFieldId;

  /// Create a copy of ItemFieldPivot
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ItemFieldPivotImplCopyWith<_$ItemFieldPivotImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PaginationLinks _$PaginationLinksFromJson(Map<String, dynamic> json) {
  return _PaginationLinks.fromJson(json);
}

/// @nodoc
mixin _$PaginationLinks {
  String get first => throw _privateConstructorUsedError;
  String get last => throw _privateConstructorUsedError;
  String? get prev => throw _privateConstructorUsedError;
  String? get next => throw _privateConstructorUsedError;

  /// Serializes this PaginationLinks to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaginationLinks
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaginationLinksCopyWith<PaginationLinks> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginationLinksCopyWith<$Res> {
  factory $PaginationLinksCopyWith(
          PaginationLinks value, $Res Function(PaginationLinks) then) =
      _$PaginationLinksCopyWithImpl<$Res, PaginationLinks>;
  @useResult
  $Res call({String first, String last, String? prev, String? next});
}

/// @nodoc
class _$PaginationLinksCopyWithImpl<$Res, $Val extends PaginationLinks>
    implements $PaginationLinksCopyWith<$Res> {
  _$PaginationLinksCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaginationLinks
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
abstract class _$$PaginationLinksImplCopyWith<$Res>
    implements $PaginationLinksCopyWith<$Res> {
  factory _$$PaginationLinksImplCopyWith(_$PaginationLinksImpl value,
          $Res Function(_$PaginationLinksImpl) then) =
      __$$PaginationLinksImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String first, String last, String? prev, String? next});
}

/// @nodoc
class __$$PaginationLinksImplCopyWithImpl<$Res>
    extends _$PaginationLinksCopyWithImpl<$Res, _$PaginationLinksImpl>
    implements _$$PaginationLinksImplCopyWith<$Res> {
  __$$PaginationLinksImplCopyWithImpl(
      _$PaginationLinksImpl _value, $Res Function(_$PaginationLinksImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaginationLinks
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? first = null,
    Object? last = null,
    Object? prev = freezed,
    Object? next = freezed,
  }) {
    return _then(_$PaginationLinksImpl(
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
class _$PaginationLinksImpl extends _PaginationLinks {
  const _$PaginationLinksImpl(
      {required this.first,
      required this.last,
      required this.prev,
      required this.next})
      : super._();

  factory _$PaginationLinksImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaginationLinksImplFromJson(json);

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
    return 'PaginationLinks(first: $first, last: $last, prev: $prev, next: $next)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaginationLinksImpl &&
            (identical(other.first, first) || other.first == first) &&
            (identical(other.last, last) || other.last == last) &&
            (identical(other.prev, prev) || other.prev == prev) &&
            (identical(other.next, next) || other.next == next));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, first, last, prev, next);

  /// Create a copy of PaginationLinks
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaginationLinksImplCopyWith<_$PaginationLinksImpl> get copyWith =>
      __$$PaginationLinksImplCopyWithImpl<_$PaginationLinksImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaginationLinksImplToJson(
      this,
    );
  }
}

abstract class _PaginationLinks extends PaginationLinks {
  const factory _PaginationLinks(
      {required final String first,
      required final String last,
      required final String? prev,
      required final String? next}) = _$PaginationLinksImpl;
  const _PaginationLinks._() : super._();

  factory _PaginationLinks.fromJson(Map<String, dynamic> json) =
      _$PaginationLinksImpl.fromJson;

  @override
  String get first;
  @override
  String get last;
  @override
  String? get prev;
  @override
  String? get next;

  /// Create a copy of PaginationLinks
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaginationLinksImplCopyWith<_$PaginationLinksImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PaginationMeta _$PaginationMetaFromJson(Map<String, dynamic> json) {
  return _PaginationMeta.fromJson(json);
}

/// @nodoc
mixin _$PaginationMeta {
  @JsonKey(name: 'current_page', fromJson: _parseInt)
  int get currentPage => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _parseInt)
  int get from => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_page', fromJson: _parseInt)
  int get lastPage => throw _privateConstructorUsedError;
  List<PaginationLink> get links => throw _privateConstructorUsedError;
  String get path => throw _privateConstructorUsedError;
  @JsonKey(name: 'per_page', fromJson: _parseInt)
  int get perPage => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _parseInt)
  int get to => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _parseInt)
  int get total => throw _privateConstructorUsedError;

  /// Serializes this PaginationMeta to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaginationMeta
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaginationMetaCopyWith<PaginationMeta> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginationMetaCopyWith<$Res> {
  factory $PaginationMetaCopyWith(
          PaginationMeta value, $Res Function(PaginationMeta) then) =
      _$PaginationMetaCopyWithImpl<$Res, PaginationMeta>;
  @useResult
  $Res call(
      {@JsonKey(name: 'current_page', fromJson: _parseInt) int currentPage,
      @JsonKey(fromJson: _parseInt) int from,
      @JsonKey(name: 'last_page', fromJson: _parseInt) int lastPage,
      List<PaginationLink> links,
      String path,
      @JsonKey(name: 'per_page', fromJson: _parseInt) int perPage,
      @JsonKey(fromJson: _parseInt) int to,
      @JsonKey(fromJson: _parseInt) int total});
}

/// @nodoc
class _$PaginationMetaCopyWithImpl<$Res, $Val extends PaginationMeta>
    implements $PaginationMetaCopyWith<$Res> {
  _$PaginationMetaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaginationMeta
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
              as List<PaginationLink>,
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
abstract class _$$PaginationMetaImplCopyWith<$Res>
    implements $PaginationMetaCopyWith<$Res> {
  factory _$$PaginationMetaImplCopyWith(_$PaginationMetaImpl value,
          $Res Function(_$PaginationMetaImpl) then) =
      __$$PaginationMetaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'current_page', fromJson: _parseInt) int currentPage,
      @JsonKey(fromJson: _parseInt) int from,
      @JsonKey(name: 'last_page', fromJson: _parseInt) int lastPage,
      List<PaginationLink> links,
      String path,
      @JsonKey(name: 'per_page', fromJson: _parseInt) int perPage,
      @JsonKey(fromJson: _parseInt) int to,
      @JsonKey(fromJson: _parseInt) int total});
}

/// @nodoc
class __$$PaginationMetaImplCopyWithImpl<$Res>
    extends _$PaginationMetaCopyWithImpl<$Res, _$PaginationMetaImpl>
    implements _$$PaginationMetaImplCopyWith<$Res> {
  __$$PaginationMetaImplCopyWithImpl(
      _$PaginationMetaImpl _value, $Res Function(_$PaginationMetaImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaginationMeta
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
    return _then(_$PaginationMetaImpl(
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
              as List<PaginationLink>,
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
class _$PaginationMetaImpl extends _PaginationMeta {
  const _$PaginationMetaImpl(
      {@JsonKey(name: 'current_page', fromJson: _parseInt)
      required this.currentPage,
      @JsonKey(fromJson: _parseInt) required this.from,
      @JsonKey(name: 'last_page', fromJson: _parseInt) required this.lastPage,
      required final List<PaginationLink> links,
      required this.path,
      @JsonKey(name: 'per_page', fromJson: _parseInt) required this.perPage,
      @JsonKey(fromJson: _parseInt) required this.to,
      @JsonKey(fromJson: _parseInt) required this.total})
      : _links = links,
        super._();

  factory _$PaginationMetaImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaginationMetaImplFromJson(json);

  @override
  @JsonKey(name: 'current_page', fromJson: _parseInt)
  final int currentPage;
  @override
  @JsonKey(fromJson: _parseInt)
  final int from;
  @override
  @JsonKey(name: 'last_page', fromJson: _parseInt)
  final int lastPage;
  final List<PaginationLink> _links;
  @override
  List<PaginationLink> get links {
    if (_links is EqualUnmodifiableListView) return _links;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_links);
  }

  @override
  final String path;
  @override
  @JsonKey(name: 'per_page', fromJson: _parseInt)
  final int perPage;
  @override
  @JsonKey(fromJson: _parseInt)
  final int to;
  @override
  @JsonKey(fromJson: _parseInt)
  final int total;

  @override
  String toString() {
    return 'PaginationMeta(currentPage: $currentPage, from: $from, lastPage: $lastPage, links: $links, path: $path, perPage: $perPage, to: $to, total: $total)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaginationMetaImpl &&
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

  /// Create a copy of PaginationMeta
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaginationMetaImplCopyWith<_$PaginationMetaImpl> get copyWith =>
      __$$PaginationMetaImplCopyWithImpl<_$PaginationMetaImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaginationMetaImplToJson(
      this,
    );
  }
}

abstract class _PaginationMeta extends PaginationMeta {
  const factory _PaginationMeta(
          {@JsonKey(name: 'current_page', fromJson: _parseInt)
          required final int currentPage,
          @JsonKey(fromJson: _parseInt) required final int from,
          @JsonKey(name: 'last_page', fromJson: _parseInt)
          required final int lastPage,
          required final List<PaginationLink> links,
          required final String path,
          @JsonKey(name: 'per_page', fromJson: _parseInt)
          required final int perPage,
          @JsonKey(fromJson: _parseInt) required final int to,
          @JsonKey(fromJson: _parseInt) required final int total}) =
      _$PaginationMetaImpl;
  const _PaginationMeta._() : super._();

  factory _PaginationMeta.fromJson(Map<String, dynamic> json) =
      _$PaginationMetaImpl.fromJson;

  @override
  @JsonKey(name: 'current_page', fromJson: _parseInt)
  int get currentPage;
  @override
  @JsonKey(fromJson: _parseInt)
  int get from;
  @override
  @JsonKey(name: 'last_page', fromJson: _parseInt)
  int get lastPage;
  @override
  List<PaginationLink> get links;
  @override
  String get path;
  @override
  @JsonKey(name: 'per_page', fromJson: _parseInt)
  int get perPage;
  @override
  @JsonKey(fromJson: _parseInt)
  int get to;
  @override
  @JsonKey(fromJson: _parseInt)
  int get total;

  /// Create a copy of PaginationMeta
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaginationMetaImplCopyWith<_$PaginationMetaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PaginationLink _$PaginationLinkFromJson(Map<String, dynamic> json) {
  return _PaginationLink.fromJson(json);
}

/// @nodoc
mixin _$PaginationLink {
  String? get url => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;
  bool get active => throw _privateConstructorUsedError;

  /// Serializes this PaginationLink to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaginationLink
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaginationLinkCopyWith<PaginationLink> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginationLinkCopyWith<$Res> {
  factory $PaginationLinkCopyWith(
          PaginationLink value, $Res Function(PaginationLink) then) =
      _$PaginationLinkCopyWithImpl<$Res, PaginationLink>;
  @useResult
  $Res call({String? url, String label, bool active});
}

/// @nodoc
class _$PaginationLinkCopyWithImpl<$Res, $Val extends PaginationLink>
    implements $PaginationLinkCopyWith<$Res> {
  _$PaginationLinkCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaginationLink
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = freezed,
    Object? label = null,
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
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaginationLinkImplCopyWith<$Res>
    implements $PaginationLinkCopyWith<$Res> {
  factory _$$PaginationLinkImplCopyWith(_$PaginationLinkImpl value,
          $Res Function(_$PaginationLinkImpl) then) =
      __$$PaginationLinkImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? url, String label, bool active});
}

/// @nodoc
class __$$PaginationLinkImplCopyWithImpl<$Res>
    extends _$PaginationLinkCopyWithImpl<$Res, _$PaginationLinkImpl>
    implements _$$PaginationLinkImplCopyWith<$Res> {
  __$$PaginationLinkImplCopyWithImpl(
      _$PaginationLinkImpl _value, $Res Function(_$PaginationLinkImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaginationLink
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = freezed,
    Object? label = null,
    Object? active = null,
  }) {
    return _then(_$PaginationLinkImpl(
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaginationLinkImpl extends _PaginationLink {
  const _$PaginationLinkImpl(
      {required this.url, required this.label, required this.active})
      : super._();

  factory _$PaginationLinkImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaginationLinkImplFromJson(json);

  @override
  final String? url;
  @override
  final String label;
  @override
  final bool active;

  @override
  String toString() {
    return 'PaginationLink(url: $url, label: $label, active: $active)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaginationLinkImpl &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.active, active) || other.active == active));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, url, label, active);

  /// Create a copy of PaginationLink
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaginationLinkImplCopyWith<_$PaginationLinkImpl> get copyWith =>
      __$$PaginationLinkImplCopyWithImpl<_$PaginationLinkImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaginationLinkImplToJson(
      this,
    );
  }
}

abstract class _PaginationLink extends PaginationLink {
  const factory _PaginationLink(
      {required final String? url,
      required final String label,
      required final bool active}) = _$PaginationLinkImpl;
  const _PaginationLink._() : super._();

  factory _PaginationLink.fromJson(Map<String, dynamic> json) =
      _$PaginationLinkImpl.fromJson;

  @override
  String? get url;
  @override
  String get label;
  @override
  bool get active;

  /// Create a copy of PaginationLink
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaginationLinkImplCopyWith<_$PaginationLinkImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
