import 'package:flutter/material.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Models/notificationModel.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Services/NotificationService/notificationService.dart';

class NotificationProvider with ChangeNotifier {
  List<NotificationModel> _notifications = [];
  bool _isLoading = false;
  String _errorMessage = '';
  int _unreadCount = 0;

  List<NotificationModel> get notifications => _notifications;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;
  int get unreadCount => _unreadCount;

  Future<void> fetchNotifications() async {
    try {
      _isLoading = true;
      _errorMessage = '';
      notifyListeners();

      final notificationService = NotificationService();
      final response = await notificationService.getNotifications();
      
      // Convert the list to List<NotificationModel> with safe parsing
      _notifications = response.map((item) {
        if (item is Map<String, dynamic>) {
          return NotificationModel.fromJson(item);
        } else {
          throw FormatException('Invalid notification data format: $item');
        }
      }).toList();

      // Update unread count
      _updateUnreadCount();
      
      _errorMessage = '';
    } catch (e) {
      _errorMessage = e.toString();
      _notifications = [];
      _unreadCount = 0;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> refreshUnreadCount() async {
    try {
      final notificationService = NotificationService();
      final count = await notificationService.getUnreadCount();
      _unreadCount = count;
      notifyListeners();
    } catch (e) {
      // Silently fail for unread count updates but log it
      debugPrint('Error refreshing unread count: $e');
      // Fallback to local calculation
      _updateUnreadCount();
    }
  }

  Future<void> markAsRead(int notificationId) async {
    try {
      final notificationService = NotificationService();
      final success = await notificationService.markAsRead(notificationId.toString());
      
      if (success) {
        final index = _notifications.indexWhere((n) => n.id == notificationId);
        if (index != -1) {
          _notifications[index] = _notifications[index].copyWith(isRead: true);
          _updateUnreadCount();
          notifyListeners();
        }
      }
    } catch (e) {
      debugPrint('Error marking notification as read: $e');
      // Fallback to local update even if API call fails
      final index = _notifications.indexWhere((n) => n.id == notificationId);
      if (index != -1) {
        _notifications[index] = _notifications[index].copyWith(isRead: true);
        _updateUnreadCount();
        notifyListeners();
      }
    }
  }

  Future<void> markAllAsRead() async {
    try {
      final notificationService = NotificationService();
      
      // Mark each notification as read individually via API
      for (final notification in _notifications.where((n) => !n.isRead)) {
        await notificationService.markAsRead(notification.id.toString());
      }
      
      // Update local state
      _notifications = _notifications.map((notification) {
        return notification.copyWith(isRead: true);
      }).toList();
      
      _unreadCount = 0;
      notifyListeners();
    } catch (e) {
      debugPrint('Error marking all as read: $e');
      // Fallback to local update
      _notifications = _notifications.map((notification) {
        return notification.copyWith(isRead: true);
      }).toList();
      
      _unreadCount = 0;
      notifyListeners();
    }
  }

  Future<void> clearAllNotifications() async {
    try {
      final notificationService = NotificationService();
      final success = await notificationService.clearAllNotifications();
      
      if (success) {
        _notifications = [];
        _unreadCount = 0;
        notifyListeners();
      }
    } catch (e) {
      debugPrint('Error clearing all notifications: $e');
      // Fallback to local clear
      _notifications = [];
      _unreadCount = 0;
      notifyListeners();
    }
  }

  Future<NotificationModel?> getNotificationById(int id) async {
    try {
      // First try to find in local list
      final localNotification = _notifications.firstWhere(
        (n) => n.id == id,
        orElse: () => _createEmptyNotification(),
      );

      if (localNotification.id != -1) {
        return localNotification;
      }

      // If not found locally, try to fetch from service
      final notificationService = NotificationService();
      final notificationData = await notificationService.getNotificationById(id.toString());
      
      if (notificationData != null) {
        return NotificationModel.fromJson(notificationData);
      }
      
      return null;
    } catch (e) {
      debugPrint('Error getting notification by ID: $e');
      return null;
    }
  }

  void retryFailedRequest() {
    fetchNotifications();
  }

  void clearError() {
    _errorMessage = '';
    notifyListeners();
  }

  // Helper method to update unread count from local notifications
  void _updateUnreadCount() {
    _unreadCount = _notifications.where((n) => !n.isRead).length;
  }

  // Add a new notification (useful for push notifications)
  void addNotification(NotificationModel notification) {
    _notifications.insert(0, notification); // Add to top
    if (!notification.isRead) {
      _unreadCount++;
    }
    notifyListeners();
  }

  // Remove a specific notification
  void removeNotification(int notificationId) {
    final notification = _notifications.firstWhere(
      (n) => n.id == notificationId,
      orElse: () => _createEmptyNotification(),
    );
    
    if (notification.id != -1) {
      _notifications.removeWhere((n) => n.id == notificationId);
      if (!notification.isRead) {
        _unreadCount = _unreadCount > 0 ? _unreadCount - 1 : 0;
      }
      notifyListeners();
    }
  }

  // Check if there are any notifications
  bool get hasNotifications => _notifications.isNotEmpty;

  // Get only unread notifications
  List<NotificationModel> get unreadNotifications =>
      _notifications.where((n) => !n.isRead).toList();

  // Get only read notifications
  List<NotificationModel> get readNotifications =>
      _notifications.where((n) => n.isRead).toList();

  // Helper method to create an empty notification for fallback
  NotificationModel _createEmptyNotification() {
    return NotificationModel(
      id: -1,
      title: '',
      message: '',
      isRead: true,
      createdAt: '',
      notificationType: '',
    );
  }

  // Get notifications by type
  List<NotificationModel> getNotificationsByType(String type) {
    return _notifications.where((n) => n.notificationType == type).toList();
  }

  // Get latest notifications (most recent first)
  List<NotificationModel> get latestNotifications {
    return List.from(_notifications)..sort((a, b) => b.createdAt.compareTo(a.createdAt));
  }

  // Check if a specific notification exists
  bool hasNotification(int notificationId) {
    return _notifications.any((n) => n.id == notificationId);
  }
}