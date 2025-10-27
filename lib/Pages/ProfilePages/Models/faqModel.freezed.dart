// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'faqModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FaqResponse _$FaqResponseFromJson(Map<String, dynamic> json) {
  return _FaqResponse.fromJson(json);
}

/// @nodoc
mixin _$FaqResponse {
  List<Faq> get data => throw _privateConstructorUsedError;
  FaqLinks get links => throw _privateConstructorUsedError;
  FaqMeta get meta => throw _privateConstructorUsedError;

  /// Serializes this FaqResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FaqResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FaqResponseCopyWith<FaqResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FaqResponseCopyWith<$Res> {
  factory $FaqResponseCopyWith(
          FaqResponse value, $Res Function(FaqResponse) then) =
      _$FaqResponseCopyWithImpl<$Res, FaqResponse>;
  @useResult
  $Res call({List<Faq> data, FaqLinks links, FaqMeta meta});

  $FaqLinksCopyWith<$Res> get links;
  $FaqMetaCopyWith<$Res> get meta;
}

/// @nodoc
class _$FaqResponseCopyWithImpl<$Res, $Val extends FaqResponse>
    implements $FaqResponseCopyWith<$Res> {
  _$FaqResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FaqResponse
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
              as List<Faq>,
      links: null == links
          ? _value.links
          : links // ignore: cast_nullable_to_non_nullable
              as FaqLinks,
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as FaqMeta,
    ) as $Val);
  }

  /// Create a copy of FaqResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FaqLinksCopyWith<$Res> get links {
    return $FaqLinksCopyWith<$Res>(_value.links, (value) {
      return _then(_value.copyWith(links: value) as $Val);
    });
  }

  /// Create a copy of FaqResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FaqMetaCopyWith<$Res> get meta {
    return $FaqMetaCopyWith<$Res>(_value.meta, (value) {
      return _then(_value.copyWith(meta: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FaqResponseImplCopyWith<$Res>
    implements $FaqResponseCopyWith<$Res> {
  factory _$$FaqResponseImplCopyWith(
          _$FaqResponseImpl value, $Res Function(_$FaqResponseImpl) then) =
      __$$FaqResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Faq> data, FaqLinks links, FaqMeta meta});

  @override
  $FaqLinksCopyWith<$Res> get links;
  @override
  $FaqMetaCopyWith<$Res> get meta;
}

/// @nodoc
class __$$FaqResponseImplCopyWithImpl<$Res>
    extends _$FaqResponseCopyWithImpl<$Res, _$FaqResponseImpl>
    implements _$$FaqResponseImplCopyWith<$Res> {
  __$$FaqResponseImplCopyWithImpl(
      _$FaqResponseImpl _value, $Res Function(_$FaqResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of FaqResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? links = null,
    Object? meta = null,
  }) {
    return _then(_$FaqResponseImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Faq>,
      links: null == links
          ? _value.links
          : links // ignore: cast_nullable_to_non_nullable
              as FaqLinks,
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as FaqMeta,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FaqResponseImpl implements _FaqResponse {
  const _$FaqResponseImpl(
      {required final List<Faq> data, required this.links, required this.meta})
      : _data = data;

  factory _$FaqResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$FaqResponseImplFromJson(json);

  final List<Faq> _data;
  @override
  List<Faq> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  final FaqLinks links;
  @override
  final FaqMeta meta;

  @override
  String toString() {
    return 'FaqResponse(data: $data, links: $links, meta: $meta)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FaqResponseImpl &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.links, links) || other.links == links) &&
            (identical(other.meta, meta) || other.meta == meta));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_data), links, meta);

  /// Create a copy of FaqResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FaqResponseImplCopyWith<_$FaqResponseImpl> get copyWith =>
      __$$FaqResponseImplCopyWithImpl<_$FaqResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FaqResponseImplToJson(
      this,
    );
  }
}

abstract class _FaqResponse implements FaqResponse {
  const factory _FaqResponse(
      {required final List<Faq> data,
      required final FaqLinks links,
      required final FaqMeta meta}) = _$FaqResponseImpl;

  factory _FaqResponse.fromJson(Map<String, dynamic> json) =
      _$FaqResponseImpl.fromJson;

  @override
  List<Faq> get data;
  @override
  FaqLinks get links;
  @override
  FaqMeta get meta;

  /// Create a copy of FaqResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FaqResponseImplCopyWith<_$FaqResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Faq _$FaqFromJson(Map<String, dynamic> json) {
  return _Faq.fromJson(json);
}

/// @nodoc
mixin _$Faq {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  String get userId => throw _privateConstructorUsedError;
  String get question => throw _privateConstructorUsedError;
  String get answer => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  List<String> get tags => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  @JsonKey(name: 'category_id')
  int get categoryId => throw _privateConstructorUsedError;
  FaqUser get user => throw _privateConstructorUsedError;
  FaqCategory get category => throw _privateConstructorUsedError;

  /// Serializes this Faq to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Faq
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FaqCopyWith<Faq> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FaqCopyWith<$Res> {
  factory $FaqCopyWith(Faq value, $Res Function(Faq) then) =
      _$FaqCopyWithImpl<$Res, Faq>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'user_id') String userId,
      String question,
      String answer,
      String status,
      List<String> tags,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt,
      String? image,
      @JsonKey(name: 'category_id') int categoryId,
      FaqUser user,
      FaqCategory category});

  $FaqUserCopyWith<$Res> get user;
  $FaqCategoryCopyWith<$Res> get category;
}

/// @nodoc
class _$FaqCopyWithImpl<$Res, $Val extends Faq> implements $FaqCopyWith<$Res> {
  _$FaqCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Faq
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
    Object? user = null,
    Object? category = null,
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
              as List<String>,
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
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as FaqUser,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as FaqCategory,
    ) as $Val);
  }

  /// Create a copy of Faq
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FaqUserCopyWith<$Res> get user {
    return $FaqUserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }

  /// Create a copy of Faq
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FaqCategoryCopyWith<$Res> get category {
    return $FaqCategoryCopyWith<$Res>(_value.category, (value) {
      return _then(_value.copyWith(category: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FaqImplCopyWith<$Res> implements $FaqCopyWith<$Res> {
  factory _$$FaqImplCopyWith(_$FaqImpl value, $Res Function(_$FaqImpl) then) =
      __$$FaqImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'user_id') String userId,
      String question,
      String answer,
      String status,
      List<String> tags,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt,
      String? image,
      @JsonKey(name: 'category_id') int categoryId,
      FaqUser user,
      FaqCategory category});

  @override
  $FaqUserCopyWith<$Res> get user;
  @override
  $FaqCategoryCopyWith<$Res> get category;
}

/// @nodoc
class __$$FaqImplCopyWithImpl<$Res> extends _$FaqCopyWithImpl<$Res, _$FaqImpl>
    implements _$$FaqImplCopyWith<$Res> {
  __$$FaqImplCopyWithImpl(_$FaqImpl _value, $Res Function(_$FaqImpl) _then)
      : super(_value, _then);

  /// Create a copy of Faq
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
    Object? user = null,
    Object? category = null,
  }) {
    return _then(_$FaqImpl(
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
              as List<String>,
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
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as FaqUser,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as FaqCategory,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FaqImpl implements _Faq {
  const _$FaqImpl(
      {required this.id,
      @JsonKey(name: 'user_id') required this.userId,
      required this.question,
      required this.answer,
      required this.status,
      required final List<String> tags,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') required this.updatedAt,
      required this.image,
      @JsonKey(name: 'category_id') required this.categoryId,
      required this.user,
      required this.category})
      : _tags = tags;

  factory _$FaqImpl.fromJson(Map<String, dynamic> json) =>
      _$$FaqImplFromJson(json);

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
  final List<String> _tags;
  @override
  List<String> get tags {
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
  final FaqUser user;
  @override
  final FaqCategory category;

  @override
  String toString() {
    return 'Faq(id: $id, userId: $userId, question: $question, answer: $answer, status: $status, tags: $tags, createdAt: $createdAt, updatedAt: $updatedAt, image: $image, categoryId: $categoryId, user: $user, category: $category)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FaqImpl &&
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
                other.categoryId == categoryId) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.category, category) ||
                other.category == category));
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
      categoryId,
      user,
      category);

  /// Create a copy of Faq
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FaqImplCopyWith<_$FaqImpl> get copyWith =>
      __$$FaqImplCopyWithImpl<_$FaqImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FaqImplToJson(
      this,
    );
  }
}

abstract class _Faq implements Faq {
  const factory _Faq(
      {required final String id,
      @JsonKey(name: 'user_id') required final String userId,
      required final String question,
      required final String answer,
      required final String status,
      required final List<String> tags,
      @JsonKey(name: 'created_at') required final DateTime createdAt,
      @JsonKey(name: 'updated_at') required final DateTime updatedAt,
      required final String? image,
      @JsonKey(name: 'category_id') required final int categoryId,
      required final FaqUser user,
      required final FaqCategory category}) = _$FaqImpl;

  factory _Faq.fromJson(Map<String, dynamic> json) = _$FaqImpl.fromJson;

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
  List<String> get tags;
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
  @override
  FaqUser get user;
  @override
  FaqCategory get category;

  /// Create a copy of Faq
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FaqImplCopyWith<_$FaqImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FaqUser _$FaqUserFromJson(Map<String, dynamic> json) {
  return _FaqUser.fromJson(json);
}

/// @nodoc
mixin _$FaqUser {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  @JsonKey(name: 'email_verified_at')
  DateTime? get emailVerifiedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'paid_seller')
  int get paidSeller => throw _privateConstructorUsedError;
  @JsonKey(name: 'deleted_at')
  DateTime? get deletedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'country_id')
  int? get countryId => throw _privateConstructorUsedError;
  @JsonKey(name: 'state_id')
  int? get stateId => throw _privateConstructorUsedError;
  @JsonKey(name: 'profile_photo')
  String? get profilePhoto => throw _privateConstructorUsedError;
  @JsonKey(name: 'uploads_left')
  int? get uploadsLeft => throw _privateConstructorUsedError;
  @JsonKey(name: 'active_status')
  int get activeStatus => throw _privateConstructorUsedError;
  String get avatar => throw _privateConstructorUsedError;
  @JsonKey(name: 'dark_mode')
  int get darkMode => throw _privateConstructorUsedError;
  @JsonKey(name: 'messenger_color')
  String get messengerColor => throw _privateConstructorUsedError;

  /// Serializes this FaqUser to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FaqUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FaqUserCopyWith<FaqUser> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FaqUserCopyWith<$Res> {
  factory $FaqUserCopyWith(FaqUser value, $Res Function(FaqUser) then) =
      _$FaqUserCopyWithImpl<$Res, FaqUser>;
  @useResult
  $Res call(
      {String id,
      String name,
      String email,
      String? phone,
      @JsonKey(name: 'email_verified_at') DateTime? emailVerifiedAt,
      @JsonKey(name: 'paid_seller') int paidSeller,
      @JsonKey(name: 'deleted_at') DateTime? deletedAt,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt,
      @JsonKey(name: 'country_id') int? countryId,
      @JsonKey(name: 'state_id') int? stateId,
      @JsonKey(name: 'profile_photo') String? profilePhoto,
      @JsonKey(name: 'uploads_left') int? uploadsLeft,
      @JsonKey(name: 'active_status') int activeStatus,
      String avatar,
      @JsonKey(name: 'dark_mode') int darkMode,
      @JsonKey(name: 'messenger_color') String messengerColor});
}

/// @nodoc
class _$FaqUserCopyWithImpl<$Res, $Val extends FaqUser>
    implements $FaqUserCopyWith<$Res> {
  _$FaqUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FaqUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = null,
    Object? phone = freezed,
    Object? emailVerifiedAt = freezed,
    Object? paidSeller = null,
    Object? deletedAt = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? countryId = freezed,
    Object? stateId = freezed,
    Object? profilePhoto = freezed,
    Object? uploadsLeft = freezed,
    Object? activeStatus = null,
    Object? avatar = null,
    Object? darkMode = null,
    Object? messengerColor = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      emailVerifiedAt: freezed == emailVerifiedAt
          ? _value.emailVerifiedAt
          : emailVerifiedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      paidSeller: null == paidSeller
          ? _value.paidSeller
          : paidSeller // ignore: cast_nullable_to_non_nullable
              as int,
      deletedAt: freezed == deletedAt
          ? _value.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      countryId: freezed == countryId
          ? _value.countryId
          : countryId // ignore: cast_nullable_to_non_nullable
              as int?,
      stateId: freezed == stateId
          ? _value.stateId
          : stateId // ignore: cast_nullable_to_non_nullable
              as int?,
      profilePhoto: freezed == profilePhoto
          ? _value.profilePhoto
          : profilePhoto // ignore: cast_nullable_to_non_nullable
              as String?,
      uploadsLeft: freezed == uploadsLeft
          ? _value.uploadsLeft
          : uploadsLeft // ignore: cast_nullable_to_non_nullable
              as int?,
      activeStatus: null == activeStatus
          ? _value.activeStatus
          : activeStatus // ignore: cast_nullable_to_non_nullable
              as int,
      avatar: null == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String,
      darkMode: null == darkMode
          ? _value.darkMode
          : darkMode // ignore: cast_nullable_to_non_nullable
              as int,
      messengerColor: null == messengerColor
          ? _value.messengerColor
          : messengerColor // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FaqUserImplCopyWith<$Res> implements $FaqUserCopyWith<$Res> {
  factory _$$FaqUserImplCopyWith(
          _$FaqUserImpl value, $Res Function(_$FaqUserImpl) then) =
      __$$FaqUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String email,
      String? phone,
      @JsonKey(name: 'email_verified_at') DateTime? emailVerifiedAt,
      @JsonKey(name: 'paid_seller') int paidSeller,
      @JsonKey(name: 'deleted_at') DateTime? deletedAt,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt,
      @JsonKey(name: 'country_id') int? countryId,
      @JsonKey(name: 'state_id') int? stateId,
      @JsonKey(name: 'profile_photo') String? profilePhoto,
      @JsonKey(name: 'uploads_left') int? uploadsLeft,
      @JsonKey(name: 'active_status') int activeStatus,
      String avatar,
      @JsonKey(name: 'dark_mode') int darkMode,
      @JsonKey(name: 'messenger_color') String messengerColor});
}

/// @nodoc
class __$$FaqUserImplCopyWithImpl<$Res>
    extends _$FaqUserCopyWithImpl<$Res, _$FaqUserImpl>
    implements _$$FaqUserImplCopyWith<$Res> {
  __$$FaqUserImplCopyWithImpl(
      _$FaqUserImpl _value, $Res Function(_$FaqUserImpl) _then)
      : super(_value, _then);

  /// Create a copy of FaqUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = null,
    Object? phone = freezed,
    Object? emailVerifiedAt = freezed,
    Object? paidSeller = null,
    Object? deletedAt = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? countryId = freezed,
    Object? stateId = freezed,
    Object? profilePhoto = freezed,
    Object? uploadsLeft = freezed,
    Object? activeStatus = null,
    Object? avatar = null,
    Object? darkMode = null,
    Object? messengerColor = null,
  }) {
    return _then(_$FaqUserImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      emailVerifiedAt: freezed == emailVerifiedAt
          ? _value.emailVerifiedAt
          : emailVerifiedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      paidSeller: null == paidSeller
          ? _value.paidSeller
          : paidSeller // ignore: cast_nullable_to_non_nullable
              as int,
      deletedAt: freezed == deletedAt
          ? _value.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      countryId: freezed == countryId
          ? _value.countryId
          : countryId // ignore: cast_nullable_to_non_nullable
              as int?,
      stateId: freezed == stateId
          ? _value.stateId
          : stateId // ignore: cast_nullable_to_non_nullable
              as int?,
      profilePhoto: freezed == profilePhoto
          ? _value.profilePhoto
          : profilePhoto // ignore: cast_nullable_to_non_nullable
              as String?,
      uploadsLeft: freezed == uploadsLeft
          ? _value.uploadsLeft
          : uploadsLeft // ignore: cast_nullable_to_non_nullable
              as int?,
      activeStatus: null == activeStatus
          ? _value.activeStatus
          : activeStatus // ignore: cast_nullable_to_non_nullable
              as int,
      avatar: null == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String,
      darkMode: null == darkMode
          ? _value.darkMode
          : darkMode // ignore: cast_nullable_to_non_nullable
              as int,
      messengerColor: null == messengerColor
          ? _value.messengerColor
          : messengerColor // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FaqUserImpl implements _FaqUser {
  const _$FaqUserImpl(
      {required this.id,
      required this.name,
      required this.email,
      required this.phone,
      @JsonKey(name: 'email_verified_at') required this.emailVerifiedAt,
      @JsonKey(name: 'paid_seller') required this.paidSeller,
      @JsonKey(name: 'deleted_at') required this.deletedAt,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') required this.updatedAt,
      @JsonKey(name: 'country_id') required this.countryId,
      @JsonKey(name: 'state_id') required this.stateId,
      @JsonKey(name: 'profile_photo') required this.profilePhoto,
      @JsonKey(name: 'uploads_left') required this.uploadsLeft,
      @JsonKey(name: 'active_status') required this.activeStatus,
      required this.avatar,
      @JsonKey(name: 'dark_mode') required this.darkMode,
      @JsonKey(name: 'messenger_color') required this.messengerColor});

  factory _$FaqUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$FaqUserImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String email;
  @override
  final String? phone;
  @override
  @JsonKey(name: 'email_verified_at')
  final DateTime? emailVerifiedAt;
  @override
  @JsonKey(name: 'paid_seller')
  final int paidSeller;
  @override
  @JsonKey(name: 'deleted_at')
  final DateTime? deletedAt;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;
  @override
  @JsonKey(name: 'country_id')
  final int? countryId;
  @override
  @JsonKey(name: 'state_id')
  final int? stateId;
  @override
  @JsonKey(name: 'profile_photo')
  final String? profilePhoto;
  @override
  @JsonKey(name: 'uploads_left')
  final int? uploadsLeft;
  @override
  @JsonKey(name: 'active_status')
  final int activeStatus;
  @override
  final String avatar;
  @override
  @JsonKey(name: 'dark_mode')
  final int darkMode;
  @override
  @JsonKey(name: 'messenger_color')
  final String messengerColor;

  @override
  String toString() {
    return 'FaqUser(id: $id, name: $name, email: $email, phone: $phone, emailVerifiedAt: $emailVerifiedAt, paidSeller: $paidSeller, deletedAt: $deletedAt, createdAt: $createdAt, updatedAt: $updatedAt, countryId: $countryId, stateId: $stateId, profilePhoto: $profilePhoto, uploadsLeft: $uploadsLeft, activeStatus: $activeStatus, avatar: $avatar, darkMode: $darkMode, messengerColor: $messengerColor)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FaqUserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.emailVerifiedAt, emailVerifiedAt) ||
                other.emailVerifiedAt == emailVerifiedAt) &&
            (identical(other.paidSeller, paidSeller) ||
                other.paidSeller == paidSeller) &&
            (identical(other.deletedAt, deletedAt) ||
                other.deletedAt == deletedAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.countryId, countryId) ||
                other.countryId == countryId) &&
            (identical(other.stateId, stateId) || other.stateId == stateId) &&
            (identical(other.profilePhoto, profilePhoto) ||
                other.profilePhoto == profilePhoto) &&
            (identical(other.uploadsLeft, uploadsLeft) ||
                other.uploadsLeft == uploadsLeft) &&
            (identical(other.activeStatus, activeStatus) ||
                other.activeStatus == activeStatus) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            (identical(other.darkMode, darkMode) ||
                other.darkMode == darkMode) &&
            (identical(other.messengerColor, messengerColor) ||
                other.messengerColor == messengerColor));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      email,
      phone,
      emailVerifiedAt,
      paidSeller,
      deletedAt,
      createdAt,
      updatedAt,
      countryId,
      stateId,
      profilePhoto,
      uploadsLeft,
      activeStatus,
      avatar,
      darkMode,
      messengerColor);

  /// Create a copy of FaqUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FaqUserImplCopyWith<_$FaqUserImpl> get copyWith =>
      __$$FaqUserImplCopyWithImpl<_$FaqUserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FaqUserImplToJson(
      this,
    );
  }
}

abstract class _FaqUser implements FaqUser {
  const factory _FaqUser(
      {required final String id,
      required final String name,
      required final String email,
      required final String? phone,
      @JsonKey(name: 'email_verified_at')
      required final DateTime? emailVerifiedAt,
      @JsonKey(name: 'paid_seller') required final int paidSeller,
      @JsonKey(name: 'deleted_at') required final DateTime? deletedAt,
      @JsonKey(name: 'created_at') required final DateTime createdAt,
      @JsonKey(name: 'updated_at') required final DateTime updatedAt,
      @JsonKey(name: 'country_id') required final int? countryId,
      @JsonKey(name: 'state_id') required final int? stateId,
      @JsonKey(name: 'profile_photo') required final String? profilePhoto,
      @JsonKey(name: 'uploads_left') required final int? uploadsLeft,
      @JsonKey(name: 'active_status') required final int activeStatus,
      required final String avatar,
      @JsonKey(name: 'dark_mode') required final int darkMode,
      @JsonKey(name: 'messenger_color')
      required final String messengerColor}) = _$FaqUserImpl;

  factory _FaqUser.fromJson(Map<String, dynamic> json) = _$FaqUserImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get email;
  @override
  String? get phone;
  @override
  @JsonKey(name: 'email_verified_at')
  DateTime? get emailVerifiedAt;
  @override
  @JsonKey(name: 'paid_seller')
  int get paidSeller;
  @override
  @JsonKey(name: 'deleted_at')
  DateTime? get deletedAt;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt;
  @override
  @JsonKey(name: 'country_id')
  int? get countryId;
  @override
  @JsonKey(name: 'state_id')
  int? get stateId;
  @override
  @JsonKey(name: 'profile_photo')
  String? get profilePhoto;
  @override
  @JsonKey(name: 'uploads_left')
  int? get uploadsLeft;
  @override
  @JsonKey(name: 'active_status')
  int get activeStatus;
  @override
  String get avatar;
  @override
  @JsonKey(name: 'dark_mode')
  int get darkMode;
  @override
  @JsonKey(name: 'messenger_color')
  String get messengerColor;

  /// Create a copy of FaqUser
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FaqUserImplCopyWith<_$FaqUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FaqCategory _$FaqCategoryFromJson(Map<String, dynamic> json) {
  return _FaqCategory.fromJson(json);
}

/// @nodoc
mixin _$FaqCategory {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get slug => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this FaqCategory to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FaqCategory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FaqCategoryCopyWith<FaqCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FaqCategoryCopyWith<$Res> {
  factory $FaqCategoryCopyWith(
          FaqCategory value, $Res Function(FaqCategory) then) =
      _$FaqCategoryCopyWithImpl<$Res, FaqCategory>;
  @useResult
  $Res call(
      {int id,
      String name,
      String slug,
      String? description,
      String status,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt});
}

/// @nodoc
class _$FaqCategoryCopyWithImpl<$Res, $Val extends FaqCategory>
    implements $FaqCategoryCopyWith<$Res> {
  _$FaqCategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FaqCategory
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FaqCategoryImplCopyWith<$Res>
    implements $FaqCategoryCopyWith<$Res> {
  factory _$$FaqCategoryImplCopyWith(
          _$FaqCategoryImpl value, $Res Function(_$FaqCategoryImpl) then) =
      __$$FaqCategoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String slug,
      String? description,
      String status,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt});
}

/// @nodoc
class __$$FaqCategoryImplCopyWithImpl<$Res>
    extends _$FaqCategoryCopyWithImpl<$Res, _$FaqCategoryImpl>
    implements _$$FaqCategoryImplCopyWith<$Res> {
  __$$FaqCategoryImplCopyWithImpl(
      _$FaqCategoryImpl _value, $Res Function(_$FaqCategoryImpl) _then)
      : super(_value, _then);

  /// Create a copy of FaqCategory
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
  }) {
    return _then(_$FaqCategoryImpl(
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FaqCategoryImpl implements _FaqCategory {
  const _$FaqCategoryImpl(
      {required this.id,
      required this.name,
      required this.slug,
      required this.description,
      required this.status,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') required this.updatedAt});

  factory _$FaqCategoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$FaqCategoryImplFromJson(json);

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
  String toString() {
    return 'FaqCategory(id: $id, name: $name, slug: $slug, description: $description, status: $status, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FaqCategoryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, slug, description, status, createdAt, updatedAt);

  /// Create a copy of FaqCategory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FaqCategoryImplCopyWith<_$FaqCategoryImpl> get copyWith =>
      __$$FaqCategoryImplCopyWithImpl<_$FaqCategoryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FaqCategoryImplToJson(
      this,
    );
  }
}

abstract class _FaqCategory implements FaqCategory {
  const factory _FaqCategory(
          {required final int id,
          required final String name,
          required final String slug,
          required final String? description,
          required final String status,
          @JsonKey(name: 'created_at') required final DateTime createdAt,
          @JsonKey(name: 'updated_at') required final DateTime updatedAt}) =
      _$FaqCategoryImpl;

  factory _FaqCategory.fromJson(Map<String, dynamic> json) =
      _$FaqCategoryImpl.fromJson;

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

  /// Create a copy of FaqCategory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FaqCategoryImplCopyWith<_$FaqCategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FaqLinks _$FaqLinksFromJson(Map<String, dynamic> json) {
  return _FaqLinks.fromJson(json);
}

/// @nodoc
mixin _$FaqLinks {
  String get first => throw _privateConstructorUsedError;
  String get last => throw _privateConstructorUsedError;
  String? get prev => throw _privateConstructorUsedError;
  String? get next => throw _privateConstructorUsedError;

  /// Serializes this FaqLinks to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FaqLinks
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FaqLinksCopyWith<FaqLinks> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FaqLinksCopyWith<$Res> {
  factory $FaqLinksCopyWith(FaqLinks value, $Res Function(FaqLinks) then) =
      _$FaqLinksCopyWithImpl<$Res, FaqLinks>;
  @useResult
  $Res call({String first, String last, String? prev, String? next});
}

/// @nodoc
class _$FaqLinksCopyWithImpl<$Res, $Val extends FaqLinks>
    implements $FaqLinksCopyWith<$Res> {
  _$FaqLinksCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FaqLinks
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
abstract class _$$FaqLinksImplCopyWith<$Res>
    implements $FaqLinksCopyWith<$Res> {
  factory _$$FaqLinksImplCopyWith(
          _$FaqLinksImpl value, $Res Function(_$FaqLinksImpl) then) =
      __$$FaqLinksImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String first, String last, String? prev, String? next});
}

/// @nodoc
class __$$FaqLinksImplCopyWithImpl<$Res>
    extends _$FaqLinksCopyWithImpl<$Res, _$FaqLinksImpl>
    implements _$$FaqLinksImplCopyWith<$Res> {
  __$$FaqLinksImplCopyWithImpl(
      _$FaqLinksImpl _value, $Res Function(_$FaqLinksImpl) _then)
      : super(_value, _then);

  /// Create a copy of FaqLinks
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? first = null,
    Object? last = null,
    Object? prev = freezed,
    Object? next = freezed,
  }) {
    return _then(_$FaqLinksImpl(
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
class _$FaqLinksImpl implements _FaqLinks {
  const _$FaqLinksImpl(
      {required this.first,
      required this.last,
      required this.prev,
      required this.next});

  factory _$FaqLinksImpl.fromJson(Map<String, dynamic> json) =>
      _$$FaqLinksImplFromJson(json);

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
    return 'FaqLinks(first: $first, last: $last, prev: $prev, next: $next)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FaqLinksImpl &&
            (identical(other.first, first) || other.first == first) &&
            (identical(other.last, last) || other.last == last) &&
            (identical(other.prev, prev) || other.prev == prev) &&
            (identical(other.next, next) || other.next == next));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, first, last, prev, next);

  /// Create a copy of FaqLinks
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FaqLinksImplCopyWith<_$FaqLinksImpl> get copyWith =>
      __$$FaqLinksImplCopyWithImpl<_$FaqLinksImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FaqLinksImplToJson(
      this,
    );
  }
}

abstract class _FaqLinks implements FaqLinks {
  const factory _FaqLinks(
      {required final String first,
      required final String last,
      required final String? prev,
      required final String? next}) = _$FaqLinksImpl;

  factory _FaqLinks.fromJson(Map<String, dynamic> json) =
      _$FaqLinksImpl.fromJson;

  @override
  String get first;
  @override
  String get last;
  @override
  String? get prev;
  @override
  String? get next;

  /// Create a copy of FaqLinks
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FaqLinksImplCopyWith<_$FaqLinksImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FaqMeta _$FaqMetaFromJson(Map<String, dynamic> json) {
  return _FaqMeta.fromJson(json);
}

/// @nodoc
mixin _$FaqMeta {
  @JsonKey(name: 'current_page')
  int get currentPage => throw _privateConstructorUsedError;
  int get from => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_page')
  int get lastPage => throw _privateConstructorUsedError;
  List<FaqMetaLink> get links => throw _privateConstructorUsedError;
  String get path => throw _privateConstructorUsedError;
  @JsonKey(name: 'per_page')
  int get perPage => throw _privateConstructorUsedError;
  int get to => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;

  /// Serializes this FaqMeta to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FaqMeta
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FaqMetaCopyWith<FaqMeta> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FaqMetaCopyWith<$Res> {
  factory $FaqMetaCopyWith(FaqMeta value, $Res Function(FaqMeta) then) =
      _$FaqMetaCopyWithImpl<$Res, FaqMeta>;
  @useResult
  $Res call(
      {@JsonKey(name: 'current_page') int currentPage,
      int from,
      @JsonKey(name: 'last_page') int lastPage,
      List<FaqMetaLink> links,
      String path,
      @JsonKey(name: 'per_page') int perPage,
      int to,
      int total});
}

/// @nodoc
class _$FaqMetaCopyWithImpl<$Res, $Val extends FaqMeta>
    implements $FaqMetaCopyWith<$Res> {
  _$FaqMetaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FaqMeta
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
              as List<FaqMetaLink>,
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
abstract class _$$FaqMetaImplCopyWith<$Res> implements $FaqMetaCopyWith<$Res> {
  factory _$$FaqMetaImplCopyWith(
          _$FaqMetaImpl value, $Res Function(_$FaqMetaImpl) then) =
      __$$FaqMetaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'current_page') int currentPage,
      int from,
      @JsonKey(name: 'last_page') int lastPage,
      List<FaqMetaLink> links,
      String path,
      @JsonKey(name: 'per_page') int perPage,
      int to,
      int total});
}

/// @nodoc
class __$$FaqMetaImplCopyWithImpl<$Res>
    extends _$FaqMetaCopyWithImpl<$Res, _$FaqMetaImpl>
    implements _$$FaqMetaImplCopyWith<$Res> {
  __$$FaqMetaImplCopyWithImpl(
      _$FaqMetaImpl _value, $Res Function(_$FaqMetaImpl) _then)
      : super(_value, _then);

  /// Create a copy of FaqMeta
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
    return _then(_$FaqMetaImpl(
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
              as List<FaqMetaLink>,
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
class _$FaqMetaImpl implements _FaqMeta {
  const _$FaqMetaImpl(
      {@JsonKey(name: 'current_page') required this.currentPage,
      required this.from,
      @JsonKey(name: 'last_page') required this.lastPage,
      required final List<FaqMetaLink> links,
      required this.path,
      @JsonKey(name: 'per_page') required this.perPage,
      required this.to,
      required this.total})
      : _links = links;

  factory _$FaqMetaImpl.fromJson(Map<String, dynamic> json) =>
      _$$FaqMetaImplFromJson(json);

  @override
  @JsonKey(name: 'current_page')
  final int currentPage;
  @override
  final int from;
  @override
  @JsonKey(name: 'last_page')
  final int lastPage;
  final List<FaqMetaLink> _links;
  @override
  List<FaqMetaLink> get links {
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
    return 'FaqMeta(currentPage: $currentPage, from: $from, lastPage: $lastPage, links: $links, path: $path, perPage: $perPage, to: $to, total: $total)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FaqMetaImpl &&
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

  /// Create a copy of FaqMeta
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FaqMetaImplCopyWith<_$FaqMetaImpl> get copyWith =>
      __$$FaqMetaImplCopyWithImpl<_$FaqMetaImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FaqMetaImplToJson(
      this,
    );
  }
}

abstract class _FaqMeta implements FaqMeta {
  const factory _FaqMeta(
      {@JsonKey(name: 'current_page') required final int currentPage,
      required final int from,
      @JsonKey(name: 'last_page') required final int lastPage,
      required final List<FaqMetaLink> links,
      required final String path,
      @JsonKey(name: 'per_page') required final int perPage,
      required final int to,
      required final int total}) = _$FaqMetaImpl;

  factory _FaqMeta.fromJson(Map<String, dynamic> json) = _$FaqMetaImpl.fromJson;

  @override
  @JsonKey(name: 'current_page')
  int get currentPage;
  @override
  int get from;
  @override
  @JsonKey(name: 'last_page')
  int get lastPage;
  @override
  List<FaqMetaLink> get links;
  @override
  String get path;
  @override
  @JsonKey(name: 'per_page')
  int get perPage;
  @override
  int get to;
  @override
  int get total;

  /// Create a copy of FaqMeta
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FaqMetaImplCopyWith<_$FaqMetaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FaqMetaLink _$FaqMetaLinkFromJson(Map<String, dynamic> json) {
  return _FaqMetaLink.fromJson(json);
}

/// @nodoc
mixin _$FaqMetaLink {
  String? get url => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;
  int? get page => throw _privateConstructorUsedError;
  bool get active => throw _privateConstructorUsedError;

  /// Serializes this FaqMetaLink to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FaqMetaLink
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FaqMetaLinkCopyWith<FaqMetaLink> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FaqMetaLinkCopyWith<$Res> {
  factory $FaqMetaLinkCopyWith(
          FaqMetaLink value, $Res Function(FaqMetaLink) then) =
      _$FaqMetaLinkCopyWithImpl<$Res, FaqMetaLink>;
  @useResult
  $Res call({String? url, String label, int? page, bool active});
}

/// @nodoc
class _$FaqMetaLinkCopyWithImpl<$Res, $Val extends FaqMetaLink>
    implements $FaqMetaLinkCopyWith<$Res> {
  _$FaqMetaLinkCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FaqMetaLink
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
abstract class _$$FaqMetaLinkImplCopyWith<$Res>
    implements $FaqMetaLinkCopyWith<$Res> {
  factory _$$FaqMetaLinkImplCopyWith(
          _$FaqMetaLinkImpl value, $Res Function(_$FaqMetaLinkImpl) then) =
      __$$FaqMetaLinkImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? url, String label, int? page, bool active});
}

/// @nodoc
class __$$FaqMetaLinkImplCopyWithImpl<$Res>
    extends _$FaqMetaLinkCopyWithImpl<$Res, _$FaqMetaLinkImpl>
    implements _$$FaqMetaLinkImplCopyWith<$Res> {
  __$$FaqMetaLinkImplCopyWithImpl(
      _$FaqMetaLinkImpl _value, $Res Function(_$FaqMetaLinkImpl) _then)
      : super(_value, _then);

  /// Create a copy of FaqMetaLink
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = freezed,
    Object? label = null,
    Object? page = freezed,
    Object? active = null,
  }) {
    return _then(_$FaqMetaLinkImpl(
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
class _$FaqMetaLinkImpl implements _FaqMetaLink {
  const _$FaqMetaLinkImpl(
      {required this.url,
      required this.label,
      required this.page,
      required this.active});

  factory _$FaqMetaLinkImpl.fromJson(Map<String, dynamic> json) =>
      _$$FaqMetaLinkImplFromJson(json);

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
    return 'FaqMetaLink(url: $url, label: $label, page: $page, active: $active)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FaqMetaLinkImpl &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.active, active) || other.active == active));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, url, label, page, active);

  /// Create a copy of FaqMetaLink
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FaqMetaLinkImplCopyWith<_$FaqMetaLinkImpl> get copyWith =>
      __$$FaqMetaLinkImplCopyWithImpl<_$FaqMetaLinkImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FaqMetaLinkImplToJson(
      this,
    );
  }
}

abstract class _FaqMetaLink implements FaqMetaLink {
  const factory _FaqMetaLink(
      {required final String? url,
      required final String label,
      required final int? page,
      required final bool active}) = _$FaqMetaLinkImpl;

  factory _FaqMetaLink.fromJson(Map<String, dynamic> json) =
      _$FaqMetaLinkImpl.fromJson;

  @override
  String? get url;
  @override
  String get label;
  @override
  int? get page;
  @override
  bool get active;

  /// Create a copy of FaqMetaLink
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FaqMetaLinkImplCopyWith<_$FaqMetaLinkImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
