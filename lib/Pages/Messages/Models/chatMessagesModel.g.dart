// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chatMessagesModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChatMessageResponse _$ChatMessageResponseFromJson(Map<String, dynamic> json) =>
    _ChatMessageResponse(
      total: (json['total'] as num).toInt(),
      lastPage: (json['last_page'] as num).toInt(),
      lastMessageId: json['last_message_id'] as String,
      messages: (json['messages'] as List<dynamic>)
          .map((e) => ChatMessage.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ChatMessageResponseToJson(
  _ChatMessageResponse instance,
) => <String, dynamic>{
  'total': instance.total,
  'last_page': instance.lastPage,
  'last_message_id': instance.lastMessageId,
  'messages': instance.messages,
};

_ChatMessage _$ChatMessageFromJson(Map<String, dynamic> json) => _ChatMessage(
  id: json['id'] as String,
  fromId: json['from_id'] as String,
  toId: json['to_id'] as String,
  body: json['body'] as String,
  attachment: json['attachment'] as String?,
  seen: (json['seen'] as num).toInt(),
  createdAt: json['created_at'] as String,
  updatedAt: json['updated_at'] as String,
);

Map<String, dynamic> _$ChatMessageToJson(_ChatMessage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'from_id': instance.fromId,
      'to_id': instance.toId,
      'body': instance.body,
      'attachment': instance.attachment,
      'seen': instance.seen,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
