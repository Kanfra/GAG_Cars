import 'package:freezed_annotation/freezed_annotation.dart';

part 'notificationModel.freezed.dart';
part 'notificationModel.g.dart';

// Add this to your NotificationModel class (optional)
@freezed
class NotificationModel with _$NotificationModel {
  const factory NotificationModel({
    required int id,
    required String title,
    required String message,
    @JsonKey(name: 'is_read') @Default(false) bool isRead,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'notification_type') required String notificationType,
  }) = _NotificationModel;

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationModelFromJson(json);

  // Add this empty factory method for convenience
  factory NotificationModel.empty() => NotificationModel(
        id: -1,
        title: '',
        message: '',
        isRead: true,
        createdAt: '',
        notificationType: '',
      );
}