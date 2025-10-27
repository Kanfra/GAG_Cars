import 'package:flutter/material.dart';
import 'package:gag_cars_frontend/GeneralComponents/AtillahComponents/messagetile.dart';
import 'package:gag_cars_frontend/GlobalVariables/colorGlobalVariables.dart';
import 'package:gag_cars_frontend/Routes/routeClass.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';

class MessagesPage extends StatefulWidget {
  const MessagesPage({super.key});

  @override
  State<MessagesPage> createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> {
  final TextEditingController _searchController = TextEditingController();
  final List<Message> _messages = [
    Message(
      id: '1',
      sender: 'Alice Johnson',
      image: "https://images.unsplash.com/photo-1494790108755-2616b612b786?w=150&h=150&fit=crop&crop=face",
      content: 'Hello! I\'m interested in the Toyota Camry you listed. Is it still available?',
      sentAt: DateTime.now().subtract(const Duration(minutes: 3)),
      isOnline: true,
      unreadCount: 2,
      productImage: "https://images.unsplash.com/photo-1621135802920-133df287f89c?w=100&h=100&fit=crop",
    ),
    Message(
      id: '2',
      sender: 'Robert Chen',
      image: "https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=150&h=150&fit=crop&crop=face",
      content: 'Can we schedule a test drive for the Honda Civic? What times work for you?',
      sentAt: DateTime.now().subtract(const Duration(hours: 1)),
      isOnline: false,
      unreadCount: 1,
      productImage: "https://images.unsplash.com/photo-1580273916550-e323be2ae537?w=100&h=100&fit=crop",
    ),
    Message(
      id: '3',
      sender: 'Sarah Miller',
      image: "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=150&h=150&fit=crop&crop=face",
      content: 'Thanks for the detailed photos! The BMW looks amazing. What\'s your best price?',
      sentAt: DateTime.now().subtract(const Duration(hours: 2)),
      isOnline: true,
      unreadCount: 0,
      productImage: "https://images.unsplash.com/photo-1555215695-3004980ad54e?w=100&h=100&fit=crop",
    ),
    Message(
      id: '4',
      sender: 'David Kim',
      image: "https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=150&h=150&fit=crop&crop=face",
      content: 'I\'d like to make an offer on the Mercedes-Benz. Are you available to chat?',
      sentAt: DateTime.now().subtract(const Duration(days: 1)),
      isOnline: false,
      unreadCount: 0,
      productImage: "https://images.unsplash.com/photo-1563720223485-83c33bf5c8d9?w=100&h=100&fit=crop",
    ),
    Message(
      id: '5',
      sender: 'Mike Thompson',
      image: "https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=150&h=150&fit=crop&crop=face",
      content: 'The Ford Mustang looks perfect! Can you share the service history?',
      sentAt: DateTime.now().subtract(const Duration(days: 2)),
      isOnline: true,
      unreadCount: 3,
      productImage: "https://images.unsplash.com/photo-1544636331-e26879cd4d9b?w=100&h=100&fit=crop",
    ),
  ];

  List<Message> _filteredMessages = [];
  String _selectedCategory = 'All';

  @override
  void initState() {
    super.initState();
    _filteredMessages = _messages;
    _searchController.addListener(_filterMessages);
  }

  void _filterMessages() {
    final query = _searchController.text.toLowerCase();
    
    setState(() {
      if (query.isEmpty) {
        _filteredMessages = _messages;
      } else {
        _filteredMessages = _messages.where((message) {
          return message.sender.toLowerCase().contains(query) ||
                 message.content.toLowerCase().contains(query);
        }).toList();
      }
    });
  }

  void _onCategorySelected(String category) {
    setState(() {
      _selectedCategory = category;
      
      switch (category) {
        case 'All':
          _filteredMessages = _messages;
          break;
        case 'Unread':
          _filteredMessages = _messages.where((msg) => msg.unreadCount > 0).toList();
          break;
        case 'Important':
          _filteredMessages = _messages.where((msg) => msg.sender == 'Sarah Miller' || msg.sender == 'David Kim').toList();
          break;
        case 'Groups':
          _filteredMessages = []; // No groups in this example
          break;
      }
    });
  }

  void _navigateToChat(Message message) {
    Get.toNamed(
      RouteClass.getChatPage(),
      arguments: {
        'chatId': message.id,
        'recipientId': message.id,
        'recipientName': message.sender,
        'recipientImage': message.image,
        'productId': message.id, // In real app, use actual product ID
        'productImage': message.productImage,
      },
    );
  }

  void _startNewChat() {
    // TODO: Implement new chat functionality
    Get.snackbar(
      'New Chat',
      'Start a new conversation feature coming soon!',
      backgroundColor: ColorGlobalVariables.brownColor,
      colorText: Colors.white,
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: _buildAppBar(theme),
      body: Column(
        children: [
          // Search Bar
          _buildSearchBar(theme),
          
          // Categories
          _buildCategoryTabs(theme),
          
          // Messages List
          _buildMessagesList(theme),
        ],
      ),
      
      // Floating Action Button
      floatingActionButton: _buildFloatingActionButton(),
    );
  }

  AppBar _buildAppBar(ThemeData theme) {
    return AppBar(
      backgroundColor: theme.appBarTheme.backgroundColor ?? Colors.white,
      elevation: 1,
      title: Text(
        "Messages",
        style: TextStyle(
          color: theme.appBarTheme.foregroundColor ?? ColorGlobalVariables.brownColor,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
      actions: [
        IconButton(
          icon: Icon(Icons.more_vert, color: theme.iconTheme.color ?? Colors.black54),
          onPressed: () => _showOptionsMenu(theme),
        ),
      ],
    );
  }

  Widget _buildSearchBar(ThemeData theme) {
    final isDarkMode = theme.brightness == Brightness.dark;
    
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: TextFormField(
          controller: _searchController,
          decoration: InputDecoration(
            hintText: "Search conversations...",
            hintStyle: TextStyle(
              color: isDarkMode ? Colors.grey[400] : Colors.grey[500], 
              fontSize: 16
            ),
            prefixIcon: Icon(
              Icons.search_rounded, 
              color: isDarkMode ? Colors.grey[400] : Colors.grey[500], 
              size: 24
            ),
            suffixIcon: _searchController.text.isNotEmpty
                ? IconButton(
                    icon: Icon(
                      Icons.clear_rounded, 
                      color: isDarkMode ? Colors.grey[400] : Colors.grey[500], 
                      size: 20
                    ),
                    onPressed: () {
                      _searchController.clear();
                      _filterMessages();
                    },
                  )
                : null,
            fillColor: theme.cardColor,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          ),
          style: TextStyle(
            color: theme.textTheme.titleLarge?.color, 
            fontSize: 16
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryTabs(ThemeData theme) {
    final categories = ['All', 'Unread', 'Important', 'Groups'];
    final isDarkMode = theme.brightness == Brightness.dark;
    
    return SizedBox(
      height: 50,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: categories.map((category) {
          return _buildCategoryItem(category, theme, isDarkMode);
        }).toList(),
      ),
    );
  }

  Widget _buildCategoryItem(String category, ThemeData theme, bool isDarkMode) {
    final isActive = _selectedCategory == category;
    
    return Container(
      margin: const EdgeInsets.only(right: 12),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () => _onCategorySelected(category),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: isActive ? ColorGlobalVariables.brownColor : theme.cardColor,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: isActive ? ColorGlobalVariables.brownColor : isDarkMode ? Colors.grey[700]! : Colors.grey[300]!,
                width: 1.5,
              ),
              boxShadow: [
                if (!isActive)
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  ),
              ],
            ),
            child: Center(
              child: Text(
                category,
                style: TextStyle(
                  color: isActive ? Colors.white : theme.textTheme.bodyMedium?.color,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMessagesList(ThemeData theme) {
    final isDarkMode = theme.brightness == Brightness.dark;
    
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: theme.cardColor,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 15,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
          child: _filteredMessages.isEmpty
              ? _buildEmptyState(theme)
              : ListView.separated(
                  padding: const EdgeInsets.only(top: 8, bottom: 16),
                  itemCount: _filteredMessages.length,
                  separatorBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Divider(
                      height: 1,
                      thickness: 1,
                      color: isDarkMode ? Colors.grey[700] : Colors.grey[200],
                    ),
                  ),
                  itemBuilder: (context, index) {
                    final message = _filteredMessages[index];
                    return _buildMessageTile(message, theme);
                  },
                ),
        ),
      ),
    );
  }

  Widget _buildEmptyState(ThemeData theme) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.chat_bubble_outline_rounded,
            size: 80,
            color: theme.iconTheme.color,
          ),
          const SizedBox(height: 16),
          Text(
            _selectedCategory == 'Groups' ? 'No group chats' : 'No messages found',
            style: TextStyle(
              color: theme.textTheme.bodyMedium?.color,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            _selectedCategory == 'Groups' 
                ? 'Start a group conversation with multiple people'
                : 'Start a conversation by messaging a seller or buyer',
            style: TextStyle(
              color: theme.textTheme.bodySmall?.color,
              fontSize: 14,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildMessageTile(Message message, ThemeData theme) {
    final isDarkMode = theme.brightness == Brightness.dark;
    
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => _navigateToChat(message),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Avatar with Online Status
              Stack(
                children: [
                  Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: message.isOnline ? Colors.green : isDarkMode ? Colors.grey[600]! : Colors.grey[300]!,
                        width: 2,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(28),
                      child: _buildUserImage(message.image, theme),
                    ),
                  ),
                  if (message.isOnline)
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: Container(
                        width: 14,
                        height: 14,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: theme.cardColor,
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              
              const SizedBox(width: 12),
              
              // Message Content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          message.sender,
                          style: TextStyle(
                            color: theme.textTheme.titleLarge?.color,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          _formatTime(message.sentAt),
                          style: TextStyle(
                            color: theme.textTheme.bodySmall?.color,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    
                    const SizedBox(height: 4),
                    
                    Text(
                      message.content,
                      style: TextStyle(
                        color: theme.textTheme.bodyMedium?.color,
                        fontSize: 14,
                        height: 1.4,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    
                    const SizedBox(height: 8),
                    
                    // Product Preview (if available)
                    if (message.productImage != null)
                      Row(
                        children: [
                          Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: isDarkMode ? Colors.grey[700] : Colors.grey[100],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(4),
                              child: _buildProductImage(message.productImage!, theme),
                            ),
                          ),
                          const SizedBox(width: 6),
                          Text(
                            'Vehicle Listing',
                            style: TextStyle(
                              color: ColorGlobalVariables.brownColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
              
              // Unread Badge
              if (message.unreadCount > 0) ...[
                const SizedBox(width: 12),
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color: ColorGlobalVariables.brownColor,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      message.unreadCount > 9 ? '9+' : message.unreadCount.toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUserImage(String imageUrl, ThemeData theme) {
    final isDarkMode = theme.brightness == Brightness.dark;
    
    if (imageUrl.startsWith('http')) {
      return CachedNetworkImage(
        imageUrl: imageUrl,
        fit: BoxFit.cover,
        placeholder: (context, url) => Container(
          color: isDarkMode ? Colors.grey[800] : Colors.grey[200],
          child: Icon(Icons.person, color: isDarkMode ? Colors.grey[500] : Colors.grey[400]),
        ),
        errorWidget: (context, url, error) => Container(
          color: isDarkMode ? Colors.grey[800] : Colors.grey[200],
          child: Icon(Icons.person, color: isDarkMode ? Colors.grey[500] : Colors.grey[400]),
        ),
      );
    } else {
      return Container(
        color: isDarkMode ? Colors.grey[800] : Colors.grey[200],
        child: Icon(Icons.person, color: isDarkMode ? Colors.grey[500] : Colors.grey[400]),
      );
    }
  }

  Widget _buildProductImage(String imageUrl, ThemeData theme) {
    final isDarkMode = theme.brightness == Brightness.dark;
    
    if (imageUrl.startsWith('http')) {
      return CachedNetworkImage(
        imageUrl: imageUrl,
        fit: BoxFit.cover,
        placeholder: (context, url) => Container(
          color: isDarkMode ? Colors.grey[700] : Colors.grey[200],
          child: Icon(Icons.car_rental, color: isDarkMode ? Colors.grey[500] : Colors.grey[400], size: 12),
        ),
        errorWidget: (context, url, error) => Container(
          color: isDarkMode ? Colors.grey[700] : Colors.grey[200],
          child: Icon(Icons.car_rental, color: isDarkMode ? Colors.grey[500] : Colors.grey[400], size: 12),
        ),
      );
    } else {
      return Container(
        color: isDarkMode ? Colors.grey[700] : Colors.grey[200],
        child: Icon(Icons.car_rental, color: isDarkMode ? Colors.grey[500] : Colors.grey[400], size: 12),
      );
    }
  }

  Widget _buildFloatingActionButton() {
    return FloatingActionButton(
      backgroundColor: ColorGlobalVariables.brownColor,
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Icon(Icons.edit_rounded, color: Colors.white, size: 24),
      onPressed: _startNewChat,
    );
  }

  void _showOptionsMenu(ThemeData theme) {
    final isDarkMode = theme.brightness == Brightness.dark;
    
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          margin: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: theme.cardColor,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 20,
                offset: Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Header
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: theme.dividerColor,
                      width: 1,
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: ColorGlobalVariables.brownColor.withOpacity(0.1),
                      child: Icon(
                        Icons.message_rounded,
                        color: ColorGlobalVariables.brownColor,
                      ),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Message Options',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: theme.textTheme.titleLarge?.color,
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            'Manage your conversations',
                            style: TextStyle(
                              fontSize: 12,
                              color: theme.textTheme.bodyMedium?.color,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              
              // Options
              ListTile(
                leading: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    Icons.notifications,
                    color: Colors.blue,
                    size: 20,
                  ),
                ),
                title: Text(
                  'Notification Settings',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: theme.textTheme.titleLarge?.color,
                  ),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 16,
                  color: theme.iconTheme.color,
                ),
                onTap: () {
                  Navigator.pop(context);
                  // TODO: Implement notification settings
                },
              ),
              
              ListTile(
                leading: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.green.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    Icons.archive,
                    color: Colors.green,
                    size: 20,
                  ),
                ),
                title: Text(
                  'Archived Chats',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: theme.textTheme.titleLarge?.color,
                  ),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 16,
                  color: theme.iconTheme.color,
                ),
                onTap: () {
                  Navigator.pop(context);
                  // TODO: Implement archived chats
                },
              ),
              
              // Close Button
              Padding(
                padding: EdgeInsets.all(16),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isDarkMode ? Colors.grey[800] : Colors.grey[100],
                      foregroundColor: isDarkMode ? Colors.grey[300] : Colors.grey[700],
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: Text('Close'),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  String _formatTime(DateTime timestamp) {
    final now = DateTime.now();
    final difference = now.difference(timestamp);
    
    if (difference.inMinutes < 1) {
      return 'Now';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes}m';
    } else if (difference.inHours < 24) {
      return '${difference.inHours}h';
    } else if (difference.inDays < 7) {
      return '${difference.inDays}d';
    } else {
      return '${timestamp.day}/${timestamp.month}';
    }
  }
}

// Extended Message Model
class Message {
  final String id;
  final String sender;
  final String image;
  final String content;
  final DateTime sentAt;
  final bool isOnline;
  final int unreadCount;
  final String? productImage;

  Message({
    required this.id,
    required this.sender,
    required this.image,
    required this.content,
    required this.sentAt,
    required this.isOnline,
    this.unreadCount = 0,
    this.productImage,
  });
}