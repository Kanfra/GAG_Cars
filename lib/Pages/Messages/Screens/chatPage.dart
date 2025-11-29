import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:gag_cars_frontend/GlobalVariables/colorGlobalVariables.dart';
import 'package:gag_cars_frontend/Pages/Messages/Models/chatMessagesModel.dart';
import 'package:gag_cars_frontend/Pages/Messages/Providers/messagesProvider.dart';
import 'package:gag_cars_frontend/Pages/Messages/Services/ChatService/chatService.dart';
import 'package:gag_cars_frontend/Pages/Authentication/Providers/userProvider.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:logger/Logger.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:url_launcher/url_launcher.dart';

class ChatPage extends StatefulWidget {
  final Map<String, dynamic> allJson;

  const ChatPage({
    super.key,
    required this.allJson,
  });

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final FocusNode _messageFocusNode = FocusNode();
  final Logger _logger = Logger();
  final ImagePicker _imagePicker = ImagePicker();

  String get _contactId => widget.allJson['contactId'] ?? '';
  String get _contactName => widget.allJson['contactName'] ?? 'Unknown User';
  String get _contactImage => widget.allJson['contactImage'] ?? '';
  String get _contactPhone => widget.allJson['contactPhone'] ?? '';

  bool _isSending = false;
  bool _showScrollToBottom = false;
  final double _scrollThreshold = 100.0;
  bool _isFirstLoad = true;
  bool _showEmojiPicker = false;
  File? _selectedImage;

  @override
  void initState() {
    super.initState();
    _logger.i('ChatPage initialized with contact: $_contactName ($_contactId)');
    
    _messageController.addListener(_onMessageTextChanged);
    _scrollController.addListener(_onScroll);
    
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_contactId.isNotEmpty) {
        _logger.i('Loading messages for contact: $_contactId');
        context.read<MessagesProvider>().loadMessages(_contactId).then((_) {
          if (_isFirstLoad) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              _scrollToBottom();
              _isFirstLoad = false;
            });
          }
        });
      } else {
        _logger.e('No contact ID provided!');
      }
    });
  }

  void _onScroll() {
    if (!_scrollController.hasClients) return;

    final shouldShowScrollToBottom = 
        _scrollController.offset < _scrollController.position.maxScrollExtent - _scrollThreshold;
    
    if (shouldShowScrollToBottom != _showScrollToBottom) {
      setState(() {
        _showScrollToBottom = shouldShowScrollToBottom;
      });
    }

    // Auto-load more messages when scrolling near the top
    if (_scrollController.offset <= _scrollController.position.minScrollExtent + 100 &&
        !context.read<MessagesProvider>().isLoading(_contactId) &&
        context.read<MessagesProvider>().hasMore(_contactId)) {
      _logger.d('Near top, auto-loading older messages');
      _loadMoreMessages();
    }
  }

  void _onMessageTextChanged() {
    setState(() {});
  }

  Future<void> _pickImage() async {
    try {
      final XFile? pickedFile = await _imagePicker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 1920,
        maxHeight: 1080,
        imageQuality: 85,
      );

      if (pickedFile != null) {
        setState(() {
          _selectedImage = File(pickedFile.path);
          _showEmojiPicker = false;
        });
        _messageFocusNode.unfocus();
        
        _logger.i('Image selected: ${pickedFile.path}');
      }
    } catch (e) {
      _logger.e('Error picking image: $e');
      Get.snackbar(
        'Error',
        'Failed to pick image: ${e.toString()}',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  void _removeSelectedImage() {
    setState(() {
      _selectedImage = null;
    });
  }

  void _sendMessage() async {
    final messageText = _messageController.text.trim();
    
    _logger.i('Send button pressed. Message: "$messageText", Contact ID: "$_contactId", Has Image: ${_selectedImage != null}');
    
    if (messageText.isEmpty && _selectedImage == null) {
      _logger.w('Send attempted with empty message and no image');
      return;
    }
    
    if (_contactId.isEmpty) {
      _logger.e('Cannot send message: No contact ID');
      Get.snackbar(
        'Error',
        'Cannot send message: No contact selected',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    // Clear input fields
    _messageController.clear();
    final tempImage = _selectedImage;
    setState(() { 
      _isSending = true;
      _showEmojiPicker = false;
      _selectedImage = null;
    });
    _messageFocusNode.unfocus();

    try {
      _logger.i('Starting to send message...');
      
      final temporaryMsgId = DateTime.now().millisecondsSinceEpoch.toString();
      
      await ChatService.sendMessage(
        toId: _contactId,
        message: messageText,
        temporaryMsgId: temporaryMsgId,
        imageFile: tempImage,
      );
      
      _logger.i('Message sent successfully, refreshing messages...');
      await context.read<MessagesProvider>().refreshMessages(_contactId);
      
      _logger.i('Messages refreshed successfully');
      
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _scrollToBottom();
      });
      
    } catch (e) {
      _logger.e('Error sending message: $e', error: e);
      
      // Restore the message and image if sending failed
      _messageController.text = messageText;
      setState(() {
        _selectedImage = tempImage;
      });
      
      Get.snackbar(
        'Error',
        'Failed to send message: ${e.toString()}',
        backgroundColor: Colors.red,
        colorText: Colors.white,
        duration: Duration(seconds: 4),
      );
    } finally {
      setState(() { _isSending = false; });
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

  void _loadMoreMessages() {
    if (_contactId.isNotEmpty) {
      _logger.i('Loading more messages for contact: $_contactId');
      context.read<MessagesProvider>().loadMoreMessages(_contactId);
    }
  }

  void _toggleEmojiPicker() {
    setState(() {
      _showEmojiPicker = !_showEmojiPicker;
    });
    if (!_showEmojiPicker) {
      _messageFocusNode.requestFocus();
    }
  }

  void _onEmojiSelected(Category? category, Emoji emoji) {
    final text = _messageController.text;
    final selection = _messageController.selection;
    final newText = text.replaceRange(
      selection.start,
      selection.end,
      emoji.emoji,
    );
    _messageController.text = newText;
    _messageController.selection = TextSelection.collapsed(
      offset: selection.start + emoji.emoji.length,
    );
  }

  Future<void> _makeCall() async {
    _logger.i('Make call button pressed for phone: $_contactPhone');
    
    if (_contactPhone.isEmpty) {
      Get.snackbar(
        'Error',
        'No phone number available for $_contactName',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    final cleanPhoneNumber = _contactPhone.replaceAll(RegExp(r'[^\d+]'), '');
    
    if (cleanPhoneNumber.isEmpty) {
      Get.snackbar(
        'Error',
        'Invalid phone number format',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    final phoneUrl = 'tel:$cleanPhoneNumber';
    
    try {
      _logger.i('Launching phone dialer with URL: $phoneUrl');
      
      if (await canLaunchUrl(Uri.parse(phoneUrl))) {
        await launchUrl(Uri.parse(phoneUrl));
        _logger.i('Phone dialer launched successfully');
      } else {
        throw 'Could not launch phone dialer';
      }
    } catch (e) {
      _logger.e('Error launching phone dialer: $e');
      Get.snackbar(
        'Error',
        'Could not make a call. Please check if your device supports phone calls.',
        backgroundColor: Colors.red,
        colorText: Colors.white,
        duration: Duration(seconds: 3),
      );
    }
  }

  void _showOptionsMenu() {
    _logger.i('Options menu opened');
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          margin: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: isDarkMode ? const Color(0xFF424242) : Colors.white,
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
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: isDarkMode ? const Color(0xFF616161) : Colors.grey[200]!,
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
                              color: isDarkMode ? Colors.white : Colors.black87,
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            'Additional chat actions',
                            style: TextStyle(
                              fontSize: 12,
                              color: isDarkMode ? Colors.white70 : Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              
              // Make a Call option
              ListTile(
                leading: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.green.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(Icons.phone, color: Colors.green, size: 20),
                ),
                title: Text(
                  'Make a Call',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: isDarkMode ? Colors.white : Colors.black87,
                  ),
                ),
                subtitle: _contactPhone.isNotEmpty 
                    ? Text(
                        _contactPhone,
                        style: TextStyle(
                          color: isDarkMode ? Colors.green[200] : Colors.green[600],
                          fontSize: 12,
                        ),
                      )
                    : null,
                trailing: Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 16,
                  color: isDarkMode ? Colors.white70 : Colors.grey[400],
                ),
                onTap: () {
                  Navigator.pop(context);
                  _makeCall();
                },
              ),
              
              // Send Message option
              ListTile(
                leading: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(Icons.message, color: Colors.blue, size: 20),
                ),
                title: Text(
                  'Send Message',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: isDarkMode ? Colors.white : Colors.black87,
                  ),
                ),
                subtitle: _contactPhone.isNotEmpty 
                    ? Text(
                        'SMS to $_contactPhone',
                        style: TextStyle(
                          color: isDarkMode ? Colors.blue[200] : Colors.blue[600],
                          fontSize: 12,
                        ),
                      )
                    : null,
                trailing: Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 16,
                  color: isDarkMode ? Colors.white70 : Colors.grey[400],
                ),
                onTap: () {
                  Navigator.pop(context);
                  _sendSMS();
                },
              ),
              
              Padding(
                padding: EdgeInsets.all(16),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      _logger.i('Options menu closed');
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isDarkMode ? const Color(0xFF616161) : Colors.grey[100],
                      foregroundColor: isDarkMode ? Colors.white70 : Colors.grey[700],
                      elevation: 0,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
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

  Future<void> _sendSMS() async {
    if (_contactPhone.isEmpty) {
      Get.snackbar(
        'Error',
        'No phone number available for $_contactName',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    final cleanPhoneNumber = _contactPhone.replaceAll(RegExp(r'[^\d+]'), '');
    final smsUrl = 'sms:$cleanPhoneNumber';
    
    try {
      if (await canLaunchUrl(Uri.parse(smsUrl))) {
        await launchUrl(Uri.parse(smsUrl));
        _logger.i('SMS app launched successfully');
      } else {
        throw 'Could not launch SMS app';
      }
    } catch (e) {
      _logger.e('Error launching SMS app: $e');
      Get.snackbar(
        'Error',
        'Could not open messaging app',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    
    return Scaffold(
      backgroundColor: isDarkMode ? const Color(0xFF303030) : Colors.white,
      appBar: _buildAppBar(isDarkMode),
      body: GestureDetector(
        onTap: () {
          if (_showEmojiPicker) {
            setState(() {
              _showEmojiPicker = false;
            });
          }
          _messageFocusNode.unfocus();
        },
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: _contactId.isEmpty 
                      ? _buildNoContactSelected(isDarkMode)
                      : _buildChatMessages(isDarkMode),
                ),
                
                // Selected image preview
                if (_selectedImage != null)
                  _buildImagePreview(isDarkMode),
                
                if (_showEmojiPicker)
                  SizedBox(
                    height: 250,
                    child: EmojiPicker(
                      onEmojiSelected: _onEmojiSelected,
                      config: Config(
                        height: 256,
                        checkPlatformCompatibility: true,
                        emojiViewConfig: EmojiViewConfig(
                          emojiSizeMax: 32.0,
                        ),
                        categoryViewConfig: CategoryViewConfig(
                          backgroundColor: isDarkMode ? const Color(0xFF424242) : const Color(0xFFF0F0F0),
                          indicatorColor: ColorGlobalVariables.brownColor,
                          iconColor: Colors.grey,
                          iconColorSelected: ColorGlobalVariables.brownColor,
                          backspaceColor: ColorGlobalVariables.brownColor,
                          categoryIcons: const CategoryIcons(),
                        ),
                        bottomActionBarConfig: BottomActionBarConfig(
                          backgroundColor: isDarkMode ? const Color(0xFF424242) : const Color(0xFFF0F0F0),
                        ),
                      ),
                    ),
                  ),
                _buildMessageInput(isDarkMode),
              ],
            ),
            
            // Custom scroll to bottom button - No Hero widget
            if (_showScrollToBottom)
              Positioned(
                bottom: _getScrollToBottomPosition(),
                right: 20,
                child: _buildCustomScrollButton(isDarkMode),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildCustomScrollButton(bool isDarkMode) {
    return Material(
      color: ColorGlobalVariables.brownColor,
      borderRadius: BorderRadius.circular(25),
      elevation: 4,
      child: InkWell(
        borderRadius: BorderRadius.circular(25),
        onTap: _scrollToBottom,
        child: Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
          ),
          child: Icon(
            Icons.arrow_downward_rounded,
            color: Colors.white,
            size: 20,
          ),
        ),
      ),
    );
  }

  double _getScrollToBottomPosition() {
    double basePosition = 80;
    if (_selectedImage != null) basePosition += 120;
    if (_showEmojiPicker) basePosition += 250;
    return basePosition;
  }

  Widget _buildImagePreview(bool isDarkMode) {
    return Container(
      height: 120,
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isDarkMode ? const Color(0xFF424242) : Colors.grey[50],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isDarkMode ? const Color(0xFF616161) : Colors.grey[300]!,
        ),
      ),
      child: Row(
        children: [
          // Image preview
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: FileImage(_selectedImage!),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Image Ready to Send',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: isDarkMode ? Colors.white : Colors.black87,
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Tap send to share this image',
                  style: TextStyle(
                    color: isDarkMode ? Colors.white70 : Colors.grey[600],
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            icon: Icon(Icons.close, color: isDarkMode ? Colors.white70 : Colors.grey[600]),
            onPressed: _removeSelectedImage,
          ),
        ],
      ),
    );
  }

  AppBar _buildAppBar(bool isDarkMode) {
    return AppBar(
      backgroundColor: isDarkMode ? const Color(0xFF424242) : Colors.white,
      elevation: 1,
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: isDarkMode ? Colors.white : Colors.black87),
        onPressed: () {
          _logger.i('Back button pressed');
          Get.back();
        },
      ),
      title: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: isDarkMode ? Colors.grey[600]! : Colors.grey,
                width: 2,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: _buildContactImage(isDarkMode),
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _contactName,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: isDarkMode ? Colors.white : Colors.black87,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  _contactPhone.isNotEmpty ? _contactPhone : 'No phone number',
                  style: TextStyle(
                    fontSize: 12,
                    color: _contactPhone.isNotEmpty 
                        ? (isDarkMode ? Colors.green[400]! : Colors.green[600]!)
                        : (isDarkMode ? Colors.grey[400]! : Colors.grey),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      actions: [
        // Phone call button
        IconButton(
          icon: Icon(
            Icons.phone,
            color: _contactPhone.isNotEmpty 
                ? ColorGlobalVariables.brownColor 
                : (isDarkMode ? Colors.grey[600]! : Colors.grey[400]!),
          ),
          onPressed: _contactPhone.isNotEmpty ? _makeCall : null,
          tooltip: _contactPhone.isNotEmpty ? 'Call $_contactPhone' : 'No phone number',
        ),
        // Options menu button
        IconButton(
          icon: Icon(Icons.more_vert, color: isDarkMode ? Colors.white70 : Colors.black54),
          onPressed: _showOptionsMenu,
        ),
      ],
    );
  }

  Widget _buildContactImage(bool isDarkMode) {
    if (_contactImage.isNotEmpty && _contactImage.startsWith('http')) {
      return CachedNetworkImage(
        imageUrl: _contactImage,
        fit: BoxFit.cover,
        placeholder: (context, url) => Container(
          color: isDarkMode ? const Color(0xFF424242) : Colors.grey[200],
          child: Icon(Icons.person, color: isDarkMode ? Colors.grey[400] : Colors.grey[400]),
        ),
        errorWidget: (context, url, error) => Container(
          color: isDarkMode ? const Color(0xFF424242) : Colors.grey[200],
          child: Icon(Icons.person, color: isDarkMode ? Colors.grey[400] : Colors.grey[400]),
        ),
      );
    } else {
      return Container(
        color: isDarkMode ? const Color(0xFF424242) : Colors.grey[200],
        child: Icon(Icons.person, color: isDarkMode ? Colors.grey[400] : Colors.grey[400], size: 24),
      );
    }
  }

  Widget _buildNoContactSelected(bool isDarkMode) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.chat_bubble_outline_rounded,
            size: 80,
            color: isDarkMode ? Colors.white70 : Colors.grey[400],
          ),
          SizedBox(height: 16),
          Text(
            'No Contact Selected',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: isDarkMode ? Colors.white : Colors.black87,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Please select a contact to start chatting',
            style: TextStyle(
              color: isDarkMode ? Colors.white70 : Colors.grey[600],
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChatMessages(bool isDarkMode) {
    return Consumer2<UserProvider, MessagesProvider>(
      builder: (context, userProvider, messagesProvider, child) {
        final currentUser = userProvider.user;
        final currentUserId = currentUser?.id;
        
        final messages = messagesProvider.getMessages(_contactId);
        final isLoading = messagesProvider.isLoading(_contactId);
        final error = messagesProvider.getError(_contactId);
        final hasMore = messagesProvider.hasMore(_contactId);

        if (currentUserId == null) {
          return _buildUserNotLoggedIn(isDarkMode);
        }

        if (isLoading && messages.isEmpty) {
          return _buildLoadingState(isDarkMode);
        }

        if (error != null && messages.isEmpty) {
          return _buildErrorState(error, isDarkMode);
        }

        if (messages.isEmpty) {
          return _buildEmptyChatState(isDarkMode);
        }

        final sortedMessages = List<ChatMessage>.from(messages)
          ..sort((a, b) => DateTime.parse(a.createdAt).compareTo(DateTime.parse(b.createdAt)));

        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: isDarkMode
                  ? [const Color(0xFF424242), const Color(0xFF303030)]
                  : [Colors.grey[50]!, Colors.grey[100]!],
            ),
          ),
          child: Stack(
            children: [
              if (isLoading && messages.isNotEmpty)
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.all(8),
                    color: isDarkMode ? Colors.black26 : Colors.white54,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor: AlwaysStoppedAnimation<Color>(ColorGlobalVariables.brownColor),
                          ),
                        ),
                        SizedBox(width: 8),
                        Text(
                          'Loading older messages...',
                          style: TextStyle(
                            color: isDarkMode ? Colors.white70 : Colors.grey[600],
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

              ListView.builder(
                controller: _scrollController,
                reverse: false,
                padding: EdgeInsets.only(
                  top: (isLoading && messages.isNotEmpty) ? 40 : 16,
                  bottom: 16,
                  left: 16,
                  right: 16,
                ),
                itemCount: sortedMessages.length,
                itemBuilder: (context, index) {
                  final message = sortedMessages[index];
                  final isSentByMe = message.fromId == currentUserId;
                  
                  return ChatBubble(
                    message: message,
                    isSentByMe: isSentByMe,
                    showAvatar: _shouldShowAvatar(sortedMessages, index, isSentByMe),
                    isDarkMode: isDarkMode,
                    contactImage: _contactImage,
                    currentUserImage: currentUser?.profileImage ?? currentUser?.avatar,
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildEmptyChatState(bool isDarkMode) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              color: isDarkMode ? const Color(0xFF424242) : Colors.grey[100],
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.chat_bubble_outline_rounded,
              size: 50,
              color: isDarkMode ? Colors.white60 : Colors.grey[400],
            ),
          ),
          SizedBox(height: 24),
          Text(
            'Start a Conversation',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: isDarkMode ? Colors.white : Colors.black87,
            ),
          ),
          SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Text(
              'Send the first message to $_contactName to start your conversation',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: isDarkMode ? Colors.white70 : Colors.grey[600],
                fontSize: 14,
                height: 1.5,
              ),
            ),
          ),
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.all(16),
            margin: EdgeInsets.symmetric(horizontal: 40),
            decoration: BoxDecoration(
              color: isDarkMode ? const Color(0xFF424242) : Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: isDarkMode ? const Color(0xFF616161) : Colors.grey[200]!,
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.lightbulb_outline_rounded,
                  color: ColorGlobalVariables.brownColor,
                  size: 20,
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'Tip: You can share images and emojis to make your conversation more engaging',
                    style: TextStyle(
                      color: isDarkMode ? Colors.white70 : Colors.grey[600],
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUserNotLoggedIn(bool isDarkMode) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline_rounded,
            size: 64,
            color: isDarkMode ? Colors.white70 : Colors.grey[600],
          ),
          SizedBox(height: 16),
          Text(
            'Not Logged In',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: isDarkMode ? Colors.white : Colors.black87,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Please log in to view messages',
            style: TextStyle(
              color: isDarkMode ? Colors.white70 : Colors.grey[600],
              fontSize: 14,
            ),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              Get.offAllNamed('/login');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorGlobalVariables.brownColor,
            ),
            child: Text(
              'Go to Login',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  bool _shouldShowAvatar(List<ChatMessage> messages, int index, bool isCurrentMessageSentByMe) {
    if (index == messages.length - 1) return true;
    
    final currentMessage = messages[index];
    final nextMessage = messages[index + 1];
    
    final isNextMessageSentByMe = nextMessage.fromId == _getCurrentUserId();
    
    return isCurrentMessageSentByMe != isNextMessageSentByMe ||
        DateTime.parse(nextMessage.createdAt).difference(DateTime.parse(currentMessage.createdAt)).inMinutes > 5;
  }

  String? _getCurrentUserId() {
    final userProvider = context.read<UserProvider>();
    return userProvider.user?.id;
  }

  Widget _buildLoadingState(bool isDarkMode) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 40,
            height: 40,
            child: CircularProgressIndicator(
              strokeWidth: 3,
              valueColor: AlwaysStoppedAnimation<Color>(ColorGlobalVariables.brownColor),
            ),
          ),
          SizedBox(height: 16),
          Text(
            'Loading conversation...',
            style: TextStyle(
              color: isDarkMode ? Colors.white70 : Colors.grey[600],
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorState(String error, bool isDarkMode) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline_rounded,
            size: 64,
            color: isDarkMode ? Colors.white70 : Colors.grey[600],
          ),
          SizedBox(height: 16),
          Text(
            'Failed to load messages',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: isDarkMode ? Colors.white : Colors.black87,
            ),
          ),
          SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Text(
              error,
              style: TextStyle(
                color: isDarkMode ? Colors.white70 : Colors.grey[600],
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              context.read<MessagesProvider>().refreshMessages(_contactId);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorGlobalVariables.brownColor,
            ),
            child: Text(
              'Try Again',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageInput(bool isDarkMode) {
    final hasText = _messageController.text.trim().isNotEmpty;
    final hasImage = _selectedImage != null;
    final canSend = (hasText || hasImage) && !_isSending && _contactId.isNotEmpty;

    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDarkMode ? const Color(0xFF424242) : Colors.white,
        border: Border(
          top: BorderSide(color: isDarkMode ? const Color(0xFF616161) : Colors.grey[200]!),
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
          // Image picker button
          IconButton(
            icon: Icon(
              Icons.photo_library, 
              color: isDarkMode ? Colors.white70 : Colors.grey[600]
            ),
            onPressed: _pickImage,
          ),
          
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: isDarkMode ? const Color(0xFF303030) : Colors.grey[50],
                borderRadius: BorderRadius.circular(25),
              ),
              child: TextField(
                controller: _messageController,
                focusNode: _messageFocusNode,
                decoration: InputDecoration(
                  hintText: hasImage ? 'Add a caption...' : 'Type a message...',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  hintStyle: TextStyle(color: isDarkMode ? Colors.white60 : Colors.grey[500]),
                ),
                style: TextStyle(
                  color: isDarkMode ? Colors.white : Colors.black87,
                ),
                maxLines: 5,
                minLines: 1,
                textInputAction: TextInputAction.send,
                onSubmitted: (_) {
                  if (canSend) _sendMessage();
                },
              ),
            ),
          ),
          
          SizedBox(width: 8),
          
          // Emoji button
          IconButton(
            icon: Icon(
              _showEmojiPicker ? Icons.keyboard : Icons.emoji_emotions_outlined,
              color: _showEmojiPicker 
                  ? ColorGlobalVariables.brownColor 
                  : (isDarkMode ? Colors.white70 : Colors.grey[600]),
            ),
            onPressed: _toggleEmojiPicker,
          ),
          
          SizedBox(width: 4),
          
          // Send button
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: canSend ? ColorGlobalVariables.brownColor : (isDarkMode ? const Color(0xFF616161) : Colors.grey[300]),
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
              onPressed: canSend ? _sendMessage : null,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _messageController.removeListener(_onMessageTextChanged);
    _scrollController.removeListener(_onScroll);
    _messageController.dispose();
    _scrollController.dispose();
    _messageFocusNode.dispose();
    super.dispose();
  }
}

class ChatBubble extends StatefulWidget {
  final ChatMessage message;
  final bool isSentByMe;
  final bool showAvatar;
  final bool isDarkMode;
  final String contactImage;
  final String? currentUserImage;

  const ChatBubble({
    super.key,
    required this.message,
    required this.isSentByMe,
    required this.showAvatar,
    required this.isDarkMode,
    required this.contactImage,
    required this.currentUserImage,
  });

  @override
  State<ChatBubble> createState() => _ChatBubbleState();
}

class _ChatBubbleState extends State<ChatBubble> {
  bool get _isImageMessage => ChatService.isImageMessage(widget.message.body);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: widget.isSentByMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!widget.isSentByMe && widget.showAvatar)
            Container(
              width: 32,
              height: 32,
              margin: EdgeInsets.only(right: 8),
              child: _buildContactAvatar(),
            )
          else if (!widget.isSentByMe)
            SizedBox(width: 40),
          
          Flexible(
            child: Column(
              crossAxisAlignment: widget.isSentByMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              children: [
                Container(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.75,
                  ),
                  padding: EdgeInsets.all(_isImageMessage ? 8 : 16),
                  decoration: BoxDecoration(
                    color: widget.isSentByMe 
                        ? ColorGlobalVariables.brownColor
                        : (widget.isDarkMode ? const Color(0xFF424242) : Colors.white),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                      bottomLeft: widget.isSentByMe ? Radius.circular(20) : Radius.circular(4),
                      bottomRight: widget.isSentByMe ? Radius.circular(4) : Radius.circular(20),
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
                      if (_isImageMessage)
                        // Improved Image message
                        _buildImageMessage()
                      else if (widget.message.body.isNotEmpty)
                        // Text message
                        Text(
                          widget.message.body,
                          style: TextStyle(
                            color: widget.isSentByMe ? Colors.white : (widget.isDarkMode ? Colors.white : Colors.black87),
                            fontSize: 14,
                            height: 1.4,
                          ),
                        ),
                      
                      SizedBox(height: 4),
                      
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            _formatTime(DateTime.parse(widget.message.createdAt)),
                            style: TextStyle(
                              color: widget.isSentByMe ? Colors.white70 : (widget.isDarkMode ? Colors.white60 : Colors.grey[500]),
                              fontSize: 10,
                            ),
                          ),
                          if (widget.isSentByMe) ...[
                            SizedBox(width: 4),
                            Icon(
                              widget.message.seen == 1 ? Icons.done_all : Icons.done,
                              size: 12,
                              color: widget.message.seen == 1 ? Colors.blue[200] : Colors.white70,
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
          
          if (widget.isSentByMe && widget.showAvatar)
            Container(
              width: 32,
              height: 32,
              margin: EdgeInsets.only(left: 8),
              child: _buildMyAvatar(),
            )
          else if (widget.isSentByMe)
            SizedBox(width: 40),
        ],
      ),
    );
  }

  Widget _buildImageMessage() {
    return GestureDetector(
      onTap: () {
        _showEnhancedImageDialog(context, widget.message.body);
      },
      child: Container(
        width: 200,
        height: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: widget.isDarkMode ? Colors.black26 : Colors.grey[100],
        ),
        child: Stack(
          children: [
            // Image
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                imageUrl: widget.message.body,
                fit: BoxFit.cover,
                width: 200,
                height: 150,
                placeholder: (context, url) => Container(
                  color: widget.isDarkMode ? Colors.black26 : Colors.grey[100],
                  child: Center(
                    child: SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          widget.isDarkMode ? Colors.white60 : Colors.grey[400]!,
                        ),
                      ),
                    ),
                  ),
                ),
                errorWidget: (context, url, error) => Container(
                  color: widget.isDarkMode ? Colors.black26 : Colors.grey[100],
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.broken_image_rounded,
                          color: widget.isDarkMode ? Colors.white60 : Colors.grey[400]!,
                          size: 40,
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Failed to load',
                          style: TextStyle(
                            color: widget.isDarkMode ? Colors.white60 : Colors.grey[400]!,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            
            // Image overlay with icon
            Positioned(
              top: 4,
              right: 4,
              child: Container(
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  Icons.photo,
                  color: Colors.white,
                  size: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showEnhancedImageDialog(BuildContext context, String imageUrl) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: 'Close',
      barrierColor: Colors.black87,
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (context, animation, secondaryAnimation) {
        return EnhancedImageView(
          imageUrl: imageUrl,
          onClose: () => Navigator.of(context).pop(),
        );
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: ScaleTransition(
            scale: animation.drive(
              Tween<double>(begin: 0.8, end: 1.0).chain(
                CurveTween(curve: Curves.easeOutBack),
              ),
            ),
            child: child,
          ),
        );
      },
    );
  }

  Widget _buildContactAvatar() {
    if (widget.contactImage.isNotEmpty && widget.contactImage.startsWith('http')) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: CachedNetworkImage(
          imageUrl: widget.contactImage,
          fit: BoxFit.cover,
          placeholder: (context, url) => _buildDefaultAvatar(),
          errorWidget: (context, url, error) => _buildDefaultAvatar(),
        ),
      );
    } else {
      return _buildDefaultAvatar();
    }
  }

  Widget _buildMyAvatar() {
    if (widget.currentUserImage != null && widget.currentUserImage!.isNotEmpty && widget.currentUserImage!.startsWith('http')) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: CachedNetworkImage(
          imageUrl: widget.currentUserImage!,
          fit: BoxFit.cover,
          placeholder: (context, url) => _buildDefaultAvatar(),
          errorWidget: (context, url, error) => _buildDefaultAvatar(),
        ),
      );
    } else {
      return _buildDefaultAvatar();
    }
  }

  Widget _buildDefaultAvatar() {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: widget.isDarkMode ? const Color(0xFF616161) : Colors.grey[300],
      ),
      child: Icon(Icons.person, size: 18, color: widget.isDarkMode ? Colors.grey[400] : Colors.grey[600]),
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

class EnhancedImageView extends StatefulWidget {
  final String imageUrl;
  final VoidCallback onClose;

  const EnhancedImageView({
    super.key,
    required this.imageUrl,
    required this.onClose,
  });

  @override
  State<EnhancedImageView> createState() => _EnhancedImageViewState();
}

class _EnhancedImageViewState extends State<EnhancedImageView> {
  final TransformationController _transformationController = TransformationController();
  TapDownDetails? _doubleTapDetails;

  void _handleDoubleTap() {
    if (_transformationController.value != Matrix4.identity()) {
      _transformationController.value = Matrix4.identity();
    } else {
      final position = _doubleTapDetails?.localPosition ?? Offset.zero;
      _transformationController.value = Matrix4.identity()
        ..translate(-position.dx * 2, -position.dy * 2)
        ..scale(3.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          // Background with blur effect
          Container(
            color: Colors.black87,
          ),

          // Interactive image viewer
          Center(
            child: InteractiveViewer(
              transformationController: _transformationController,
              minScale: 0.1,
              maxScale: 5.0,
              child: GestureDetector(
                onDoubleTapDown: (details) => _doubleTapDetails = details,
                onDoubleTap: _handleDoubleTap,
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.95,
                    maxHeight: MediaQuery.of(context).size.height * 0.85,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black45,
                        blurRadius: 20,
                        spreadRadius: 5,
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: CachedNetworkImage(
                      imageUrl: widget.imageUrl,
                      fit: BoxFit.contain,
                      placeholder: (context, url) => Container(
                        color: Colors.black26,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 40,
                                height: 40,
                                child: CircularProgressIndicator(
                                  strokeWidth: 3,
                                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                                ),
                              ),
                              SizedBox(height: 16),
                              Text(
                                'Loading Image...',
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      errorWidget: (context, url, error) => Container(
                        color: Colors.black26,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.broken_image_rounded,
                                color: Colors.white60,
                                size: 60,
                              ),
                              SizedBox(height: 16),
                              Text(
                                'Failed to load image',
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Please check your connection',
                                style: TextStyle(
                                  color: Colors.white60,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Close button
          Positioned(
            top: MediaQuery.of(context).padding.top + 20,
            right: 20,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black54,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: Icon(Icons.close, color: Colors.white, size: 28),
                onPressed: widget.onClose,
              ),
            ),
          ),

          // Zoom instructions
          Positioned(
            bottom: MediaQuery.of(context).padding.bottom + 20,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.zoom_in, color: Colors.white70, size: 16),
                    SizedBox(width: 8),
                    Text(
                      'Pinch to zoom • Double tap to reset',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _transformationController.dispose();
    super.dispose();
  }
}