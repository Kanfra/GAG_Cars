// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chatMessagesModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChatMessageResponse {

 int get total;@JsonKey(name: 'last_page') int get lastPage;@JsonKey(name: 'last_message_id') String get lastMessageId; List<ChatMessage> get messages;
/// Create a copy of ChatMessageResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatMessageResponseCopyWith<ChatMessageResponse> get copyWith => _$ChatMessageResponseCopyWithImpl<ChatMessageResponse>(this as ChatMessageResponse, _$identity);

  /// Serializes this ChatMessageResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatMessageResponse&&(identical(other.total, total) || other.total == total)&&(identical(other.lastPage, lastPage) || other.lastPage == lastPage)&&(identical(other.lastMessageId, lastMessageId) || other.lastMessageId == lastMessageId)&&const DeepCollectionEquality().equals(other.messages, messages));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,total,lastPage,lastMessageId,const DeepCollectionEquality().hash(messages));

@override
String toString() {
  return 'ChatMessageResponse(total: $total, lastPage: $lastPage, lastMessageId: $lastMessageId, messages: $messages)';
}


}

/// @nodoc
abstract mixin class $ChatMessageResponseCopyWith<$Res>  {
  factory $ChatMessageResponseCopyWith(ChatMessageResponse value, $Res Function(ChatMessageResponse) _then) = _$ChatMessageResponseCopyWithImpl;
@useResult
$Res call({
 int total,@JsonKey(name: 'last_page') int lastPage,@JsonKey(name: 'last_message_id') String lastMessageId, List<ChatMessage> messages
});




}
/// @nodoc
class _$ChatMessageResponseCopyWithImpl<$Res>
    implements $ChatMessageResponseCopyWith<$Res> {
  _$ChatMessageResponseCopyWithImpl(this._self, this._then);

  final ChatMessageResponse _self;
  final $Res Function(ChatMessageResponse) _then;

/// Create a copy of ChatMessageResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? total = null,Object? lastPage = null,Object? lastMessageId = null,Object? messages = null,}) {
  return _then(_self.copyWith(
total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,lastPage: null == lastPage ? _self.lastPage : lastPage // ignore: cast_nullable_to_non_nullable
as int,lastMessageId: null == lastMessageId ? _self.lastMessageId : lastMessageId // ignore: cast_nullable_to_non_nullable
as String,messages: null == messages ? _self.messages : messages // ignore: cast_nullable_to_non_nullable
as List<ChatMessage>,
  ));
}

}


/// Adds pattern-matching-related methods to [ChatMessageResponse].
extension ChatMessageResponsePatterns on ChatMessageResponse {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChatMessageResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChatMessageResponse() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChatMessageResponse value)  $default,){
final _that = this;
switch (_that) {
case _ChatMessageResponse():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChatMessageResponse value)?  $default,){
final _that = this;
switch (_that) {
case _ChatMessageResponse() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int total, @JsonKey(name: 'last_page')  int lastPage, @JsonKey(name: 'last_message_id')  String lastMessageId,  List<ChatMessage> messages)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChatMessageResponse() when $default != null:
return $default(_that.total,_that.lastPage,_that.lastMessageId,_that.messages);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int total, @JsonKey(name: 'last_page')  int lastPage, @JsonKey(name: 'last_message_id')  String lastMessageId,  List<ChatMessage> messages)  $default,) {final _that = this;
switch (_that) {
case _ChatMessageResponse():
return $default(_that.total,_that.lastPage,_that.lastMessageId,_that.messages);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int total, @JsonKey(name: 'last_page')  int lastPage, @JsonKey(name: 'last_message_id')  String lastMessageId,  List<ChatMessage> messages)?  $default,) {final _that = this;
switch (_that) {
case _ChatMessageResponse() when $default != null:
return $default(_that.total,_that.lastPage,_that.lastMessageId,_that.messages);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChatMessageResponse implements ChatMessageResponse {
  const _ChatMessageResponse({required this.total, @JsonKey(name: 'last_page') required this.lastPage, @JsonKey(name: 'last_message_id') required this.lastMessageId, required final  List<ChatMessage> messages}): _messages = messages;
  factory _ChatMessageResponse.fromJson(Map<String, dynamic> json) => _$ChatMessageResponseFromJson(json);

@override final  int total;
@override@JsonKey(name: 'last_page') final  int lastPage;
@override@JsonKey(name: 'last_message_id') final  String lastMessageId;
 final  List<ChatMessage> _messages;
@override List<ChatMessage> get messages {
  if (_messages is EqualUnmodifiableListView) return _messages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_messages);
}


/// Create a copy of ChatMessageResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatMessageResponseCopyWith<_ChatMessageResponse> get copyWith => __$ChatMessageResponseCopyWithImpl<_ChatMessageResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChatMessageResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatMessageResponse&&(identical(other.total, total) || other.total == total)&&(identical(other.lastPage, lastPage) || other.lastPage == lastPage)&&(identical(other.lastMessageId, lastMessageId) || other.lastMessageId == lastMessageId)&&const DeepCollectionEquality().equals(other._messages, _messages));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,total,lastPage,lastMessageId,const DeepCollectionEquality().hash(_messages));

@override
String toString() {
  return 'ChatMessageResponse(total: $total, lastPage: $lastPage, lastMessageId: $lastMessageId, messages: $messages)';
}


}

/// @nodoc
abstract mixin class _$ChatMessageResponseCopyWith<$Res> implements $ChatMessageResponseCopyWith<$Res> {
  factory _$ChatMessageResponseCopyWith(_ChatMessageResponse value, $Res Function(_ChatMessageResponse) _then) = __$ChatMessageResponseCopyWithImpl;
@override @useResult
$Res call({
 int total,@JsonKey(name: 'last_page') int lastPage,@JsonKey(name: 'last_message_id') String lastMessageId, List<ChatMessage> messages
});




}
/// @nodoc
class __$ChatMessageResponseCopyWithImpl<$Res>
    implements _$ChatMessageResponseCopyWith<$Res> {
  __$ChatMessageResponseCopyWithImpl(this._self, this._then);

  final _ChatMessageResponse _self;
  final $Res Function(_ChatMessageResponse) _then;

/// Create a copy of ChatMessageResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? total = null,Object? lastPage = null,Object? lastMessageId = null,Object? messages = null,}) {
  return _then(_ChatMessageResponse(
total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,lastPage: null == lastPage ? _self.lastPage : lastPage // ignore: cast_nullable_to_non_nullable
as int,lastMessageId: null == lastMessageId ? _self.lastMessageId : lastMessageId // ignore: cast_nullable_to_non_nullable
as String,messages: null == messages ? _self._messages : messages // ignore: cast_nullable_to_non_nullable
as List<ChatMessage>,
  ));
}


}


/// @nodoc
mixin _$ChatMessage {

 String get id;@JsonKey(name: 'from_id') String get fromId;@JsonKey(name: 'to_id') String get toId; String get body; String? get attachment; int get seen;@JsonKey(name: 'created_at') String get createdAt;@JsonKey(name: 'updated_at') String get updatedAt;
/// Create a copy of ChatMessage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatMessageCopyWith<ChatMessage> get copyWith => _$ChatMessageCopyWithImpl<ChatMessage>(this as ChatMessage, _$identity);

  /// Serializes this ChatMessage to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatMessage&&(identical(other.id, id) || other.id == id)&&(identical(other.fromId, fromId) || other.fromId == fromId)&&(identical(other.toId, toId) || other.toId == toId)&&(identical(other.body, body) || other.body == body)&&(identical(other.attachment, attachment) || other.attachment == attachment)&&(identical(other.seen, seen) || other.seen == seen)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,fromId,toId,body,attachment,seen,createdAt,updatedAt);

@override
String toString() {
  return 'ChatMessage(id: $id, fromId: $fromId, toId: $toId, body: $body, attachment: $attachment, seen: $seen, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $ChatMessageCopyWith<$Res>  {
  factory $ChatMessageCopyWith(ChatMessage value, $Res Function(ChatMessage) _then) = _$ChatMessageCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'from_id') String fromId,@JsonKey(name: 'to_id') String toId, String body, String? attachment, int seen,@JsonKey(name: 'created_at') String createdAt,@JsonKey(name: 'updated_at') String updatedAt
});




}
/// @nodoc
class _$ChatMessageCopyWithImpl<$Res>
    implements $ChatMessageCopyWith<$Res> {
  _$ChatMessageCopyWithImpl(this._self, this._then);

  final ChatMessage _self;
  final $Res Function(ChatMessage) _then;

/// Create a copy of ChatMessage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? fromId = null,Object? toId = null,Object? body = null,Object? attachment = freezed,Object? seen = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,fromId: null == fromId ? _self.fromId : fromId // ignore: cast_nullable_to_non_nullable
as String,toId: null == toId ? _self.toId : toId // ignore: cast_nullable_to_non_nullable
as String,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String,attachment: freezed == attachment ? _self.attachment : attachment // ignore: cast_nullable_to_non_nullable
as String?,seen: null == seen ? _self.seen : seen // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ChatMessage].
extension ChatMessagePatterns on ChatMessage {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChatMessage value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChatMessage() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChatMessage value)  $default,){
final _that = this;
switch (_that) {
case _ChatMessage():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChatMessage value)?  $default,){
final _that = this;
switch (_that) {
case _ChatMessage() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'from_id')  String fromId, @JsonKey(name: 'to_id')  String toId,  String body,  String? attachment,  int seen, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'updated_at')  String updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChatMessage() when $default != null:
return $default(_that.id,_that.fromId,_that.toId,_that.body,_that.attachment,_that.seen,_that.createdAt,_that.updatedAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'from_id')  String fromId, @JsonKey(name: 'to_id')  String toId,  String body,  String? attachment,  int seen, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'updated_at')  String updatedAt)  $default,) {final _that = this;
switch (_that) {
case _ChatMessage():
return $default(_that.id,_that.fromId,_that.toId,_that.body,_that.attachment,_that.seen,_that.createdAt,_that.updatedAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'from_id')  String fromId, @JsonKey(name: 'to_id')  String toId,  String body,  String? attachment,  int seen, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'updated_at')  String updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _ChatMessage() when $default != null:
return $default(_that.id,_that.fromId,_that.toId,_that.body,_that.attachment,_that.seen,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChatMessage implements ChatMessage {
  const _ChatMessage({required this.id, @JsonKey(name: 'from_id') required this.fromId, @JsonKey(name: 'to_id') required this.toId, required this.body, required this.attachment, required this.seen, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'updated_at') required this.updatedAt});
  factory _ChatMessage.fromJson(Map<String, dynamic> json) => _$ChatMessageFromJson(json);

@override final  String id;
@override@JsonKey(name: 'from_id') final  String fromId;
@override@JsonKey(name: 'to_id') final  String toId;
@override final  String body;
@override final  String? attachment;
@override final  int seen;
@override@JsonKey(name: 'created_at') final  String createdAt;
@override@JsonKey(name: 'updated_at') final  String updatedAt;

/// Create a copy of ChatMessage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatMessageCopyWith<_ChatMessage> get copyWith => __$ChatMessageCopyWithImpl<_ChatMessage>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChatMessageToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatMessage&&(identical(other.id, id) || other.id == id)&&(identical(other.fromId, fromId) || other.fromId == fromId)&&(identical(other.toId, toId) || other.toId == toId)&&(identical(other.body, body) || other.body == body)&&(identical(other.attachment, attachment) || other.attachment == attachment)&&(identical(other.seen, seen) || other.seen == seen)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,fromId,toId,body,attachment,seen,createdAt,updatedAt);

@override
String toString() {
  return 'ChatMessage(id: $id, fromId: $fromId, toId: $toId, body: $body, attachment: $attachment, seen: $seen, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$ChatMessageCopyWith<$Res> implements $ChatMessageCopyWith<$Res> {
  factory _$ChatMessageCopyWith(_ChatMessage value, $Res Function(_ChatMessage) _then) = __$ChatMessageCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'from_id') String fromId,@JsonKey(name: 'to_id') String toId, String body, String? attachment, int seen,@JsonKey(name: 'created_at') String createdAt,@JsonKey(name: 'updated_at') String updatedAt
});




}
/// @nodoc
class __$ChatMessageCopyWithImpl<$Res>
    implements _$ChatMessageCopyWith<$Res> {
  __$ChatMessageCopyWithImpl(this._self, this._then);

  final _ChatMessage _self;
  final $Res Function(_ChatMessage) _then;

/// Create a copy of ChatMessage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? fromId = null,Object? toId = null,Object? body = null,Object? attachment = freezed,Object? seen = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_ChatMessage(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,fromId: null == fromId ? _self.fromId : fromId // ignore: cast_nullable_to_non_nullable
as String,toId: null == toId ? _self.toId : toId // ignore: cast_nullable_to_non_nullable
as String,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String,attachment: freezed == attachment ? _self.attachment : attachment // ignore: cast_nullable_to_non_nullable
as String?,seen: null == seen ? _self.seen : seen // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
