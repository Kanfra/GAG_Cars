import 'dart:convert';
import 'package:gag_cars_frontend/Pages/Authentication/Services/authService.dart';
import 'package:gag_cars_frontend/Utils/ApiUtils/apiEnpoints.dart';
import 'package:gag_cars_frontend/Utils/ApiUtils/apiUtils.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class NotificationService {
  final logger = Logger();
  
  Future<List<dynamic>> getNotifications() async {
    try {
      final token = await AuthService.getToken();
      final response = await http.get(
        Uri.parse('$baseApiUrl${ApiEndpoint.notifications}'),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final dynamic responseData = json.decode(response.body);
        
        // Handle both cases: direct list OR list inside 'data' field
        if (responseData is List) {
          logger.i("✅ Success: Loaded ${responseData.length} notifications");
          return responseData;
        } else if (responseData is Map<String, dynamic> && responseData.containsKey('data')) {
          final data = responseData['data'];
          if (data is List) {
            logger.i("✅ Success: Loaded ${data.length} notifications from data field");
            return data;
          } else {
            throw FormatException('Data field is not a list: $data');
          }
        } else {
          throw FormatException('Unexpected response format: ${response.body}');
        }
      } else if (response.statusCode == 401) {
        logger.w("⚠️ Unauthorized access to notifications");
        throw Exception('Unauthorized: Please login again');
      } else if (response.statusCode == 404) {
        logger.w("⚠️ Notifications endpoint not found");
        throw Exception('Notifications service unavailable');
      } else {
        logger.e("❌ Server error: ${response.statusCode} - ${response.body}");
        throw Exception('Failed to load notifications: ${response.statusCode}');
      }
    } catch (e) {
      logger.e("🚨 Network error: $e");
      throw Exception('Network error: $e');
    }
  }

  // Simple method to get unread count
  Future<int> getUnreadCount() async {
    try {
      final notifications = await getNotifications();
      
      if (notifications.isEmpty) {
        logger.i("📭 No notifications found");
        return 0;
      }
      
      // Count unread notifications (assuming there's an 'is_read' field)
      int unreadCount = 0;
      for (var notification in notifications) {
        if (notification is Map<String, dynamic>) {
          // Handle different possible field names for read status
          final isRead = notification['is_read'] ?? 
                         notification['isRead'] ?? 
                         notification['read'] ?? 
                         true;
          if (isRead == false) {
            unreadCount++;
          }
        }
      }
      logger.i('📬 Unread Count: $unreadCount');
      return unreadCount;
    } catch (e) {
      logger.e("🚨 Error getting unread count: $e");
      return 0; // Return 0 on error to avoid breaking the UI
    }
  }

  // Optional: Mark notification as read
  Future<bool> markAsRead(String notificationId) async {
    try {
      final token = await AuthService.getToken();
      final response = await http.put(
        Uri.parse('$baseApiUrl${ApiEndpoint.notifications}/$notificationId/read'),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        logger.i("✅ Notification $notificationId marked as read");
        return true;
      } else {
        logger.e("❌ Failed to mark notification as read: ${response.statusCode}");
        return false;
      }
    } catch (e) {
      logger.e("🚨 Error marking notification as read: $e");
      return false;
    }
  }

  // Optional: Get notification by ID
  Future<Map<String, dynamic>?> getNotificationById(String id) async {
    try {
      final notifications = await getNotifications();
      
      for (var notification in notifications) {
        if (notification is Map<String, dynamic>) {
          final notificationId = notification['id']?.toString() ?? 
                                notification['_id']?.toString();
          if (notificationId == id) {
            return notification;
          }
        }
      }
      return null;
    } catch (e) {
      logger.e("🚨 Error getting notification by ID: $e");
      return null;
    }
  }

  // Optional: Clear all notifications
  Future<bool> clearAllNotifications() async {
    try {
      final token = await AuthService.getToken();
      final response = await http.delete(
        Uri.parse('$baseApiUrl${ApiEndpoint.notifications}'),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        logger.i("✅ All notifications cleared");
        return true;
      } else {
        logger.e("❌ Failed to clear notifications: ${response.statusCode}");
        return false;
      }
    } catch (e) {
      logger.e("🚨 Error clearing notifications: $e");
      return false;
    }
  }
}