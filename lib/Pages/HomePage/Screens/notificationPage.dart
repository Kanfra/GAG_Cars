import 'package:flutter/material.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Models/broadcastModel.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Providers/getBroadcastProvider.dart';
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
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadData();
    });
  }

  Future<void> _loadData() async {
    final provider = Provider.of<BroadcastProvider>(context, listen: false);
    await provider.fetchBroadcasts();
  }

  void _onRefresh() async {
    await _loadData();
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
          'Broadcast Messages',
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
      ),
      body: Consumer<BroadcastProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading && provider.broadcasts.isEmpty) {
            return _buildLoadingState(isDarkMode);
          }

          if (provider.hasError && provider.broadcasts.isEmpty) {
            return _buildErrorState(provider, isDarkMode);
          }

          if (provider.broadcasts.isEmpty) {
            return _buildEmptyState(isDarkMode);
          }

          return RefreshIndicator(
            onRefresh: () async => _onRefresh(),
            backgroundColor: isDarkMode ? const Color(0xFF424242) : Colors.white,
            color: isDarkMode ? Colors.white70 : ColorGlobalVariables.brownColor,
            child: ListView.builder(
              itemCount: provider.broadcasts.length,
              itemBuilder: (context, index) {
                final broadcast = provider.broadcasts[index];
                return _BroadcastItem(
                  broadcast: broadcast,
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
            'Loading broadcast messages...',
            style: TextStyle(
              color: isDarkMode ? Colors.white70 : Colors.grey[600],
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorState(BroadcastProvider provider, bool isDarkMode) {
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
            onPressed: provider.refreshBroadcasts,
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
            Icons.broadcast_on_personal, 
            size: 80, 
            color: isDarkMode ? Colors.grey[600] : Colors.grey[300]
          ),
          SizedBox(height: 16),
          Text(
            'No broadcast messages yet',
            style: TextStyle(
              color: isDarkMode ? Colors.white70 : Colors.grey[600],
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Broadcast messages will appear here',
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

class _BroadcastItem extends StatelessWidget {
  final BroadcastModel broadcast;
  final String Function(String) formatDate;
  final bool isDarkMode;

  const _BroadcastItem({
    required this.broadcast,
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
            color: _getBroadcastColor(broadcast.target).withValues(alpha: 0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(
            _getBroadcastIcon(broadcast.target),
            color: _getBroadcastColor(broadcast.target),
            size: 20,
          ),
        ),
        title: Text(
          broadcast.subject,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: isDarkMode ? Colors.white : Colors.black87,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 4),
            Text(
              broadcast.message,
              style: TextStyle(
                fontSize: 14,
                color: isDarkMode ? Colors.white70 : Colors.grey[800],
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Text(
                  formatDate(broadcast.createdAt.toIso8601String()),
                  style: TextStyle(
                    fontSize: 12,
                    color: isDarkMode ? Colors.white54 : Colors.grey[500],
                  ),
                ),
                SizedBox(width: 16),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: _getBroadcastColor(broadcast.target).withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    broadcast.target.toUpperCase(),
                    style: TextStyle(
                      fontSize: 10,
                      color: _getBroadcastColor(broadcast.target),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          size: 16,
          color: isDarkMode ? Colors.white54 : Colors.grey[500],
        ),
        onTap: () {
          // Show broadcast details in a dialog
          showDialog(
            context: context,
            builder: (context) => _BroadcastDetailDialog(
              broadcast: broadcast,
              formatDate: formatDate,
              isDarkMode: isDarkMode,
            ),
          );
        },
      ),
    );
  }

  Color _getBroadcastColor(String target) {
    switch (target.toLowerCase()) {
      case 'all':
        return Colors.blue;
      case 'users':
        return Colors.green;
      case 'verified':
        return Colors.orange;
      default:
        return ColorGlobalVariables.brownColor;
    }
  }

  IconData _getBroadcastIcon(String target) {
    switch (target.toLowerCase()) {
      case 'all':
        return Icons.public;
      case 'users':
        return Icons.person;
      case 'verified':
        return Icons.verified;
      default:
        return Icons.broadcast_on_personal;
    }
  }
}

class _BroadcastDetailDialog extends StatelessWidget {
  final BroadcastModel broadcast;
  final String Function(String) formatDate;
  final bool isDarkMode;

  const _BroadcastDetailDialog({
    required this.broadcast,
    required this.formatDate,
    required this.isDarkMode,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: isDarkMode ? const Color(0xFF424242) : Colors.white,
      title: Row(
        children: [
          Icon(
            _getBroadcastIcon(broadcast.target),
            color: _getBroadcastColor(broadcast.target),
            size: 24,
          ),
          SizedBox(width: 12),
          Expanded(
            child: Text(
              broadcast.subject,
              style: TextStyle(
                color: isDarkMode ? Colors.white : Colors.black87,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              broadcast.message,
              style: TextStyle(
                color: isDarkMode ? Colors.white70 : Colors.grey[800],
                fontSize: 16,
                height: 1.5,
              ),
            ),
            SizedBox(height: 16),
            Divider(
              color: isDarkMode ? Colors.grey[600] : Colors.grey[300],
            ),
            Row(
              children: [
                Icon(
                  Icons.calendar_today,
                  size: 16,
                  color: isDarkMode ? Colors.white54 : Colors.grey[500],
                ),
                SizedBox(width: 8),
                Text(
                  'Sent: ${formatDate(broadcast.createdAt.toIso8601String())}',
                  style: TextStyle(
                    color: isDarkMode ? Colors.white54 : Colors.grey[500],
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            SizedBox(height: 4),
            Row(
              children: [
                Icon(
                  Icons.person,
                  size: 16,
                  color: isDarkMode ? Colors.white54 : Colors.grey[500],
                ),
                SizedBox(width: 8),
                Text(
                  'From: ${broadcast.user.name}',
                  style: TextStyle(
                    color: isDarkMode ? Colors.white54 : Colors.grey[500],
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            SizedBox(height: 4),
            Row(
              children: [
                Icon(
                  Icons.location_city,
                  size: 16,
                  color: isDarkMode ? Colors.white54 : Colors.grey[500],
                ),
                SizedBox(width: 8),
                Text(
                  'Country: ${broadcast.country.name}',
                  style: TextStyle(
                    color: isDarkMode ? Colors.white54 : Colors.grey[500],
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(
            'Close',
            style: TextStyle(
              color: isDarkMode ? Colors.white70 : Colors.grey[700],
            ),
          ),
        ),
      ],
    );
  }

  Color _getBroadcastColor(String target) {
    switch (target.toLowerCase()) {
      case 'all':
        return Colors.blue;
      case 'users':
        return Colors.green;
      case 'verified':
        return Colors.orange;
      default:
        return ColorGlobalVariables.brownColor;
    }
  }

  IconData _getBroadcastIcon(String target) {
    switch (target.toLowerCase()) {
      case 'all':
        return Icons.public;
      case 'users':
        return Icons.person;
      case 'verified':
        return Icons.verified;
      default:
        return Icons.broadcast_on_personal;
    }
  }
}
