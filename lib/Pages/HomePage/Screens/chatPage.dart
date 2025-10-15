import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:gag_cars_frontend/GlobalVariables/colorGlobalVariables.dart';
import 'package:gag_cars_frontend/Utils/ApiUtils/apiEnpoints.dart';
import 'package:get/get.dart';
import 'package:logger/Logger.dart';
import 'package:gag_cars_frontend/Routes/routeClass.dart';

class ChatPage extends StatefulWidget {
  final String? chatId;
  final String? recipientId;
  final String? recipientName;
  final String? recipientImage;
  final String? productId;
  final String? productImage;

  const ChatPage({
    Key? key,
    this.chatId,
    this.recipientId,
    this.recipientName,
    this.recipientImage,
    this.productId,
    this.productImage,
  }) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final FocusNode _messageFocusNode = FocusNode();
  final Logger _logger = Logger();

  List<ChatMessage> _messages = [];
  bool _isLoading = true;
  bool _isSending = false;
  bool _isOnline = true;

  @override
  void initState() {
    super.initState();
    _loadChatHistory();
    _setupWebSocketConnection();
  }

  void _loadChatHistory() async {
    try {
      // Simulate API call to load chat history
      await Future.delayed(Duration(milliseconds: 500));
      
      setState(() {
        _messages = [
          ChatMessage(
            id: '1',
            senderId: widget.recipientId ?? 'user2',
            senderName: widget.recipientName ?? 'John Doe',
            content: 'Hi! I\'m interested in your vehicle. Is it still available?',
            timestamp: DateTime.now().subtract(Duration(minutes: 10)),
            type: MessageType.text,
            isSent: true,
            isRead: true,
          ),
          ChatMessage(
            id: '2',
            senderId: 'current_user',
            senderName: 'You',
            content: 'Yes, it\'s still available! Would you like to schedule a viewing?',
            timestamp: DateTime.now().subtract(Duration(minutes: 8)),
            type: MessageType.text,
            isSent: true,
            isRead: true,
          ),
          ChatMessage(
            id: '3',
            senderId: widget.recipientId ?? 'user2',
            senderName: widget.recipientName ?? 'John Doe',
            content: 'That would be great! What times work for you this week?',
            timestamp: DateTime.now().subtract(Duration(minutes: 5)),
            type: MessageType.text,
            isSent: true,
            isRead: true,
          ),
          ChatMessage(
            id: '4',
            senderId: 'current_user',
            senderName: 'You',
            content: 'I\'m free on Wednesday and Friday afternoons. Would either of those work?',
            timestamp: DateTime.now().subtract(Duration(minutes: 2)),
            type: MessageType.text,
            isSent: true,
            isRead: false,
          ),
        ];
        _isLoading = false;
      });
      
      // Scroll to bottom after loading
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _scrollToBottom();
      });
    } catch (e) {
      _logger.e('Error loading chat history: $e');
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _setupWebSocketConnection() {
    // TODO: Implement WebSocket connection for real-time messaging
    _logger.i('Setting up WebSocket connection for chat: ${widget.chatId}');
  }

  void _sendMessage() async {
    if (_messageController.text.trim().isEmpty) return;

    final messageText = _messageController.text.trim();
    _messageController.clear();

    final newMessage = ChatMessage(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      senderId: 'current_user',
      senderName: 'You',
      content: messageText,
      timestamp: DateTime.now(),
      type: MessageType.text,
      isSent: false,
      isRead: false,
    );

    setState(() {
      _messages.add(newMessage);
      _isSending = true;
    });

    _scrollToBottom();

    try {
      // Simulate API call to send message
      await Future.delayed(Duration(milliseconds: 500));
      
      setState(() {
        // _messages.last.isSent = true;
        // _isSending = false;
      });

      // Simulate reply after 2 seconds
      Future.delayed(Duration(seconds: 2), () {
        if (mounted) {
          final replyMessage = ChatMessage(
            id: DateTime.now().millisecondsSinceEpoch.toString(),
            senderId: widget.recipientId ?? 'user2',
            senderName: widget.recipientName ?? 'John Doe',
            content: _generateAutoReply(messageText),
            timestamp: DateTime.now(),
            type: MessageType.text,
            isSent: true,
            isRead: false,
          );

          setState(() {
            _messages.add(replyMessage);
          });
          _scrollToBottom();
        }
      });

    } catch (e) {
      _logger.e('Error sending message: $e');
      setState(() {
        // _messages.last.isSent = false;
        _isSending = false;
      });
      
      // Show error message
      Get.snackbar(
        'Error',
        'Failed to send message. Please try again.',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  String _generateAutoReply(String message) {
    final lowerMessage = message.toLowerCase();
    
    if (lowerMessage.contains('price') || lowerMessage.contains('cost')) {
      return 'The price is negotiable. What\'s your budget range?';
    } else if (lowerMessage.contains('available') || lowerMessage.contains('still')) {
      return 'Yes, it\'s still available. Would you like to see it in person?';
    } else if (lowerMessage.contains('meet') || lowerMessage.contains('location')) {
      return 'I\'m located in Accra. We can meet at a public place that works for both of us.';
    } else if (lowerMessage.contains('condition') || lowerMessage.contains('state')) {
      return 'The vehicle is in excellent condition with full service history.';
    } else {
      return 'Thanks for your message! I\'ll get back to you shortly.';
    }
  }

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  void _showProductDetails() {
    if (widget.productId != null) {
      Get.toNamed(
        RouteClass.getDetailPage(),
        arguments: {
          'productId': widget.productId,
          'type': 'details',
        },
      );
    }
  }

  void _makeCall() {
    // TODO: Implement call functionality
    Get.snackbar(
      'Call',
      'Calling ${widget.recipientName}...',
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );
  }

  void _showOptionsMenu() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          margin: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
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
                      color: Colors.grey[200]!,
                      width: 1,
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: ColorGlobalVariables.brownColor.withOpacity(0.1),
                      child: Icon(
                        Icons.chat,
                        color: ColorGlobalVariables.brownColor,
                      ),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Chat Options',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            'Additional chat actions',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              
              // Options
              if (widget.productId != null)
                ListTile(
                  leading: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.blue.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(
                      Icons.car_rental,
                      color: Colors.blue,
                      size: 20,
                    ),
                  ),
                  title: Text(
                    'View Product Details',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 16,
                    color: Colors.grey[400],
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    _showProductDetails();
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
                    Icons.phone,
                    color: Colors.green,
                    size: 20,
                  ),
                ),
                title: Text(
                  'Make a Call',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 16,
                  color: Colors.grey[400],
                ),
                onTap: () {
                  Navigator.pop(context);
                  _makeCall();
                },
              ),
              
              ListTile(
                leading: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.orange.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    Icons.report,
                    color: Colors.orange,
                    size: 20,
                  ),
                ),
                title: Text(
                  'Report User',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 16,
                  color: Colors.grey[400],
                ),
                onTap: () {
                  Navigator.pop(context);
                  _reportUser();
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
                      backgroundColor: Colors.grey[100],
                      foregroundColor: Colors.grey[700],
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

  void _reportUser() {
    // TODO: Implement user reporting
    Get.snackbar(
      'Report',
      'Reporting feature coming soon',
      backgroundColor: Colors.orange,
      colorText: Colors.white,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: Column(
        children: [
          if (widget.productId != null) _buildProductPreview(),
          Expanded(
            child: _isLoading ? _buildLoadingState() : _buildChatMessages(),
          ),
          _buildMessageInput(),
        ],
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 1,
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.black87),
        onPressed: () => Get.back(),
      ),
      title: Row(
        children: [
          // Recipient Avatar
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: _isOnline ? Colors.green : Colors.grey,
                width: 2,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: _buildRecipientImage(),
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.recipientName ?? 'Unknown User',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  _isOnline ? 'Online' : 'Offline',
                  style: TextStyle(
                    fontSize: 12,
                    color: _isOnline ? Colors.green : Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.phone, color: ColorGlobalVariables.brownColor),
          onPressed: _makeCall,
        ),
        IconButton(
          icon: Icon(Icons.more_vert, color: Colors.black54),
          onPressed: _showOptionsMenu,
        ),
      ],
    );
  }

  Widget _buildRecipientImage() {
    final imageUrl = widget.recipientImage;
    
    if (imageUrl != null && imageUrl.isNotEmpty && !imageUrl.contains('assets/')) {
      return CachedNetworkImage(
        imageUrl: getImageUrl(imageUrl, null),
        fit: BoxFit.cover,
        placeholder: (context, url) => Container(
          color: Colors.grey[200],
          child: Icon(Icons.person, color: Colors.grey[400]),
        ),
        errorWidget: (context, url, error) => Container(
          color: Colors.grey[200],
          child: Icon(Icons.person, color: Colors.grey[400]),
        ),
      );
    } else {
      return Container(
        color: Colors.grey[200],
        child: Icon(Icons.person, color: Colors.grey[400], size: 24),
      );
    }
  }

  Widget _buildProductPreview() {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        border: Border(
          bottom: BorderSide(color: Colors.grey[200]!),
        ),
      ),
      child: Row(
        children: [
          // Product Image
          GestureDetector(
            onTap: _showProductDetails,
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: _buildProductImage(),
              ),
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Vehicle Listing',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Tap to view details',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.arrow_forward_ios_rounded,
            size: 16,
            color: Colors.grey[400],
          ),
        ],
      ),
    );
  }

  Widget _buildProductImage() {
    final imageUrl = widget.productImage;
    
    if (imageUrl != null && imageUrl.isNotEmpty && !imageUrl.contains('assets/')) {
      return CachedNetworkImage(
        imageUrl: getImageUrl(imageUrl, null),
        fit: BoxFit.cover,
        placeholder: (context, url) => Container(
          color: Colors.grey[200],
          child: Icon(Icons.car_rental, color: Colors.grey[400]),
        ),
        errorWidget: (context, url, error) => Container(
          color: Colors.grey[200],
          child: Icon(Icons.car_rental, color: Colors.grey[400]),
        ),
      );
    } else {
      return Container(
        color: Colors.grey[200],
        child: Icon(Icons.car_rental, color: Colors.grey[400], size: 24),
      );
    }
  }

  Widget _buildLoadingState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(ColorGlobalVariables.brownColor),
          ),
          SizedBox(height: 16),
          Text(
            'Loading conversation...',
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChatMessages() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.grey[50]!,
            Colors.grey[100]!,
          ],
        ),
      ),
      child: ListView.builder(
        controller: _scrollController,
        padding: EdgeInsets.all(16),
        itemCount: _messages.length,
        itemBuilder: (context, index) {
          final message = _messages[index];
          final isCurrentUser = message.senderId == 'current_user';
          
          return ChatBubble(
            message: message,
            isCurrentUser: isCurrentUser,
            showAvatar: _shouldShowAvatar(index),
          );
        },
      ),
    );
  }

  bool _shouldShowAvatar(int index) {
    if (index == 0) return true;
    
    final currentMessage = _messages[index];
    final previousMessage = _messages[index - 1];
    
    return currentMessage.senderId != previousMessage.senderId ||
        currentMessage.timestamp.difference(previousMessage.timestamp).inMinutes > 5;
  }

  Widget _buildMessageInput() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: Colors.grey[200]!),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Attachment Button
          IconButton(
            icon: Icon(Icons.attach_file, color: Colors.grey[600]),
            onPressed: () {
              // TODO: Implement file attachment
              Get.snackbar(
                'Coming Soon',
                'File attachment feature will be available soon',
                backgroundColor: Colors.blue,
                colorText: Colors.white,
              );
            },
          ),
          
          // Message Input Field
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: Colors.grey[300]!),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _messageController,
                      focusNode: _messageFocusNode,
                      decoration: InputDecoration(
                        hintText: 'Type a message...',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                        hintStyle: TextStyle(color: Colors.grey[500]),
                      ),
                      maxLines: 5,
                      minLines: 1,
                      textInputAction: TextInputAction.send,
                      onSubmitted: (_) => _sendMessage(),
                    ),
                  ),
                  
                  // Emoji Button
                  IconButton(
                    icon: Icon(Icons.emoji_emotions_outlined, color: Colors.grey[600]),
                    onPressed: () {
                      // TODO: Implement emoji picker
                      _messageFocusNode.requestFocus();
                    },
                  ),
                ],
              ),
            ),
          ),
          
          // Send Button
          SizedBox(width: 8),
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _messageController.text.trim().isEmpty
                  ? Colors.grey[300]
                  : ColorGlobalVariables.brownColor,
            ),
            child: IconButton(
              icon: _isSending
                  ? SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                    )
                  : Icon(Icons.send, color: Colors.white),
              onPressed: _messageController.text.trim().isEmpty || _isSending
                  ? null
                  : _sendMessage,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    _messageFocusNode.dispose();
    super.dispose();
  }
}

// Chat Message Model
class ChatMessage {
  final String id;
  final String senderId;
  final String senderName;
  final String content;
  final DateTime timestamp;
  final MessageType type;
  final bool isSent;
  final bool isRead;

  ChatMessage({
    required this.id,
    required this.senderId,
    required this.senderName,
    required this.content,
    required this.timestamp,
    required this.type,
    required this.isSent,
    required this.isRead,
  });
}

enum MessageType {
  text,
  image,
  file,
  system,
}

// Chat Bubble Widget
class ChatBubble extends StatelessWidget {
  final ChatMessage message;
  final bool isCurrentUser;
  final bool showAvatar;

  const ChatBubble({
    Key? key,
    required this.message,
    required this.isCurrentUser,
    required this.showAvatar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: isCurrentUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!isCurrentUser && showAvatar)
            Container(
              width: 32,
              height: 32,
              margin: EdgeInsets.only(right: 8),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey[300],
              ),
              child: Icon(Icons.person, size: 18, color: Colors.grey[600]),
            )
          else if (!isCurrentUser)
            SizedBox(width: 40),
          
          Flexible(
            child: Column(
              crossAxisAlignment: isCurrentUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              children: [
                if (showAvatar && !isCurrentUser)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4, left: 12),
                    child: Text(
                      message.senderName,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[600],
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                
                Container(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.75,
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    color: isCurrentUser 
                        ? ColorGlobalVariables.brownColor
                        : Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                      bottomLeft: isCurrentUser ? Radius.circular(20) : Radius.circular(4),
                      bottomRight: isCurrentUser ? Radius.circular(4) : Radius.circular(20),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        message.content,
                        style: TextStyle(
                          color: isCurrentUser ? Colors.white : Colors.black87,
                          fontSize: 14,
                          height: 1.4,
                        ),
                      ),
                      SizedBox(height: 4),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            _formatTime(message.timestamp),
                            style: TextStyle(
                              color: isCurrentUser ? Colors.white70 : Colors.grey[500],
                              fontSize: 10,
                            ),
                          ),
                          if (isCurrentUser) ...[
                            SizedBox(width: 4),
                            Icon(
                              message.isRead ? Icons.done_all : Icons.done,
                              size: 12,
                              color: message.isRead ? Colors.blue[200] : Colors.white70,
                            ),
                          ],
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          
          if (isCurrentUser && showAvatar)
            Container(
              width: 32,
              height: 32,
              margin: EdgeInsets.only(left: 8),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey[300],
              ),
              child: Icon(Icons.person, size: 18, color: Colors.grey[600]),
            )
          else if (isCurrentUser)
            SizedBox(width: 40),
        ],
      ),
    );
  }

  String _formatTime(DateTime timestamp) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final messageDate = DateTime(timestamp.year, timestamp.month, timestamp.day);
    
    if (messageDate == today) {
      return '${timestamp.hour.toString().padLeft(2, '0')}:${timestamp.minute.toString().padLeft(2, '0')}';
    } else if (messageDate == today.subtract(Duration(days: 1))) {
      return 'Yesterday ${timestamp.hour.toString().padLeft(2, '0')}:${timestamp.minute.toString().padLeft(2, '0')}';
    } else {
      return '${timestamp.day}/${timestamp.month}/${timestamp.year} ${timestamp.hour.toString().padLeft(2, '0')}:${timestamp.minute.toString().padLeft(2, '0')}';
    }
  }
}

// Helper function to get image URL (same as in your HomePage)
String getImageUrl(String? imagePath, String? defaultAsset) {
  if (imagePath == null || imagePath.isEmpty) {
    return '';
  }
  
  if (imagePath.startsWith('http')) {
    return imagePath;
  }
  
  return '${ApiEndpoint.baseImageUrl}$imagePath';
}