// models/chat_message_model.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chatMessagesModel.freezed.dart';
part 'chatMessagesModel.g.dart';

@freezed
class ChatMessageResponse with _$ChatMessageResponse {
  const factory ChatMessageResponse({
    required int total,
    @JsonKey(name: 'last_page') required int lastPage,
    @JsonKey(name: 'last_message_id') required String lastMessageId,
    required List<ChatMessage> messages,
  }) = _ChatMessageResponse;

  factory ChatMessageResponse.fromJson(Map<String, dynamic> json) =>
      _$ChatMessageResponseFromJson(json);
}

@freezed
class ChatMessage with _$ChatMessage {
  const factory ChatMessage({
    required String id,
    @JsonKey(name: 'from_id') required String fromId,
    @JsonKey(name: 'to_id') required String toId,
    required String body,
    required String? attachment,
    required int seen,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'updated_at') required String updatedAt,
  }) = _ChatMessage;

  factory ChatMessage.fromJson(Map<String, dynamic> json) =>
      _$ChatMessageFromJson(json);
}