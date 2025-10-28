import 'package:flutter/material.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Models/notificationModel.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Providers/getNotificationsProvider.dart';
import 'package:get/get.dart';
import 'package:gag_cars_frontend/GlobalVariables/colorGlobalVariables.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  bool _isMarkingAllAsRead = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadData();
    });
  }

  Future<void> _loadData() async {
    final provider = Provider.of<NotificationProvider>(context, listen: false);
    await provider.fetchNotifications();
  }

  void _onRefresh() async {
    await _loadData();
  }

  Future<void> _markAllAsRead(NotificationProvider provider) async {
    setState(() {
      _isMarkingAllAsRead = true;
    });
    
    try {
      await provider.markAllAsRead();
    } catch (e) {
      // Error is already handled in the provider
    } finally {
      setState(() {
        _isMarkingAllAsRead = false;
      });
    }
  }

  String _formatDate(String dateString) {
    try {
      final date = DateTime.parse(dateString).toLocal();
      final now = DateTime.now();
      final difference = now.difference(date);

      if (difference.inMinutes < 1) {
        return 'Just now';
      } else if (difference.inHours < 1) {
        return '${difference.inMinutes}m ago';
      } else if (difference.inDays < 1) {
        return '${difference.inHours}h ago';
      } else if (difference.inDays < 7) {
        return '${difference.inDays}d ago';
      } else {
        return DateFormat('MMM d, yyyy').format(date);
      }
    } catch (e) {
      return dateString;
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    
    return Scaffold(
      backgroundColor: isDarkMode ? const Color(0xFF303030) : Colors.grey[50],
      appBar: AppBar(
        title: Text(
          'Notifications',
          style: TextStyle(
            color: isDarkMode ? Colors.white : ColorGlobalVariables.brownColor,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: isDarkMode ? const Color(0xFF424242) : Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back, 
            color: isDarkMode ? Colors.white : Colors.black87
          ),
          onPressed: () => Get.back(),
        ),
        actions: [
          Consumer<NotificationProvider>(
            builder: (context, provider, child) {
              final hasUnread = provider.notifications.any((n) => !n.isRead);
              
              if (provider.notifications.isNotEmpty && hasUnread) {
                return _isMarkingAllAsRead
                    ? Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              isDarkMode ? Colors.white : ColorGlobalVariables.brownColor
                            ),
                          ),
                        ),
                      )
                    : TextButton.icon(
                        onPressed: () => _markAllAsRead(provider),
                        icon: Icon(
                          Icons.done_all, 
                          size: 20,
                          color: isDarkMode ? Colors.white70 : ColorGlobalVariables.brownColor,
                        ),
                        label: Text(
                          'Mark all as read',
                          style: TextStyle(
                            color: isDarkMode ? Colors.white70 : ColorGlobalVariables.brownColor,
                          ),
                        ),
                        style: TextButton.styleFrom(
                          foregroundColor: isDarkMode ? Colors.white70 : ColorGlobalVariables.brownColor,
                        ),
                      );
              }
              return SizedBox();
            },
          ),
        ],
      ),
      body: Consumer<NotificationProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading && provider.notifications.isEmpty) {
            return _buildLoadingState(isDarkMode);
          }

          if (provider.errorMessage.isNotEmpty && provider.notifications.isEmpty) {
            return _buildErrorState(provider, isDarkMode);
          }

          if (provider.notifications.isEmpty) {
            return _buildEmptyState(isDarkMode);
          }

          return RefreshIndicator(
            onRefresh: () async => _onRefresh(),
            backgroundColor: isDarkMode ? const Color(0xFF424242) : Colors.white,
            color: isDarkMode ? Colors.white70 : ColorGlobalVariables.brownColor,
            child: ListView.builder(
              itemCount: provider.notifications.length,
              itemBuilder: (context, index) {
                final notification = provider.notifications[index];
                return _NotificationItem(
                  notification: notification,
                  onTap: () async {
                    // Show immediate visual feedback
                    final currentProvider = Provider.of<NotificationProvider>(context, listen: false);
                    await currentProvider.markAsRead(notification.id);
                  },
                  formatDate: _formatDate,
                  isDarkMode: isDarkMode,
                );
              },
            ),
          );
        },
      ),
    );
  }

  Widget _buildLoadingState(bool isDarkMode) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(
              isDarkMode ? Colors.white70 : ColorGlobalVariables.brownColor
            ),
          ),
          SizedBox(height: 16),
          Text(
            'Loading notifications...',
            style: TextStyle(
              color: isDarkMode ? Colors.white70 : Colors.grey[600],
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorState(NotificationProvider provider, bool isDarkMode) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline, 
            size: 64, 
            color: isDarkMode ? Colors.grey[500] : Colors.grey[400]
          ),
          SizedBox(height: 16),
          Text(
            provider.errorMessage,
            style: TextStyle(
              color: isDarkMode ? Colors.white70 : Colors.grey[600], 
              fontSize: 16
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: provider.retryFailedRequest,
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorGlobalVariables.brownColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
            child: Text('Try Again', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState(bool isDarkMode) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.notifications_off, 
            size: 80, 
            color: isDarkMode ? Colors.grey[600] : Colors.grey[300]
          ),
          SizedBox(height: 16),
          Text(
            'No notifications yet',
            style: TextStyle(
              color: isDarkMode ? Colors.white70 : Colors.grey[600],
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'We\'ll notify you when something arrives',
            style: TextStyle(
              color: isDarkMode ? Colors.white60 : Colors.grey[500],
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}

class _NotificationItem extends StatelessWidget {
  final NotificationModel notification;
  final VoidCallback onTap;
  final String Function(String) formatDate;
  final bool isDarkMode;

  const _NotificationItem({
    required this.notification,
    required this.onTap,
    required this.formatDate,
    required this.isDarkMode,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      elevation: isDarkMode ? 2 : 1,
      color: isDarkMode ? const Color(0xFF424242) : Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        contentPadding: EdgeInsets.all(16),
        leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: _getNotificationColor(notification.notificationType).withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(
            _getNotificationIcon(notification.notificationType),
            color: _getNotificationColor(notification.notificationType),
            size: 20,
          ),
        ),
        title: Text(
          notification.title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: notification.isRead ? FontWeight.normal : FontWeight.bold,
            color: notification.isRead 
              ? (isDarkMode ? Colors.white70 : Colors.grey[700])
              : (isDarkMode ? Colors.white : Colors.black87),
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 4),
            Text(
              notification.message,
              style: TextStyle(
                fontSize: 14,
                color: notification.isRead 
                  ? (isDarkMode ? Colors.white60 : Colors.grey[600])
                  : (isDarkMode ? Colors.white70 : Colors.grey[800]),
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 8),
            Text(
              formatDate(notification.createdAt),
              style: TextStyle(
                fontSize: 12,
                color: isDarkMode ? Colors.white54 : Colors.grey[500],
              ),
            ),
          ],
        ),
        trailing: notification.isRead
            ? null
            : Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
              ),
        onTap: onTap,
      ),
    );
  }

  Color _getNotificationColor(String type) {
    switch (type.toLowerCase()) {
      case 'promotion':
      case 'offer':
        return Colors.orange;
      case 'alert':
      case 'warning':
        return Colors.red;
      case 'info':
      case 'information':
        return Colors.blue;
      case 'success':
        return Colors.green;
      default:
        return ColorGlobalVariables.brownColor;
    }
  }

  IconData _getNotificationIcon(String type) {
    switch (type.toLowerCase()) {
      case 'promotion':
      case 'offer':
        return Icons.local_offer;
      case 'alert':
      case 'warning':
        return Icons.warning;
      case 'info':
      case 'information':
        return Icons.info;
      case 'success':
        return Icons.check_circle;
      default:
        return Icons.notifications;
    }
  }
}