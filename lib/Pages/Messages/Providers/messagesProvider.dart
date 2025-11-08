// providers/messages_provider.dart
import 'package:flutter/foundation.dart';
import 'package:gag_cars_frontend/Pages/Messages/Models/chatMessagesModel.dart';
import 'package:gag_cars_frontend/Pages/Messages/Services/ChatService/chatService.dart';

class MessagesProvider with ChangeNotifier {
  // Structure: Contact ID -> Messages List
  final Map<String, List<ChatMessage>> _messagesByContact = {};
  final Map<String, bool> _isLoadingByContact = {};
  final Map<String, String?> _errorByContact = {};
  final Map<String, int> _currentPageByContact = {};
  final Map<String, bool> _hasMoreByContact = {};

  // Getters
  List<ChatMessage> getMessages(String contactId) => _messagesByContact[contactId] ?? [];
  bool isLoading(String contactId) => _isLoadingByContact[contactId] ?? false;
  String? getError(String contactId) => _errorByContact[contactId];
  bool hasMore(String contactId) => _hasMoreByContact[contactId] ?? true;
  int getCurrentPage(String contactId) => _currentPageByContact[contactId] ?? 1;

  // Load messages for a contact (with pagination)
  Future<void> loadMessages(String contactId, {bool loadMore = false}) async {
    try {
      // Initialize state for this contact if first time
      _initializeContactState(contactId);

      _isLoadingByContact[contactId] = true;
      _errorByContact[contactId] = null;
      notifyListeners();

      final currentPage = _currentPageByContact[contactId]!;
      final pageToLoad = loadMore ? currentPage + 1 : 1;

      // FIXED: Now passing contactId to fetchMessages
      final response = await ChatService.fetchMessages(
        contactId: contactId, // REQUIRED: Pass the contact ID
        page: pageToLoad,
        perPage: 20,
      );

      if (loadMore) {
        // Append to existing messages (for lazy loading)
        _messagesByContact[contactId] = [
          ..._messagesByContact[contactId]!,
          ...response.messages
        ];
      } else {
        // Replace messages (first load or refresh)
        _messagesByContact[contactId] = response.messages;
      }

      // Update pagination state
      _currentPageByContact[contactId] = pageToLoad;
      _hasMoreByContact[contactId] = response.messages.length >= 20; // If we got less than perPage, no more messages
      
    } catch (e) {
      _errorByContact[contactId] = e.toString();
    } finally {
      _isLoadingByContact[contactId] = false;
      notifyListeners();
    }
  }

  // Load more messages (for infinite scroll/lazy loading)
  Future<void> loadMoreMessages(String contactId) async {
    if (hasMore(contactId) && !isLoading(contactId)) {
      await loadMessages(contactId, loadMore: true);
    }
  }

  // Refresh messages (reset to page 1)
  Future<void> refreshMessages(String contactId) async {
    await loadMessages(contactId, loadMore: false);
  }

  // Add a new message to the conversation (for real-time updates)
  void addNewMessage(String contactId, ChatMessage message) {
    _initializeContactState(contactId);
    _messagesByContact[contactId] = [
      ..._messagesByContact[contactId]!,
      message
    ];
    notifyListeners();
  }

  // Mark messages as read for a contact
  void markMessagesAsRead(String contactId) {
    final messages = _messagesByContact[contactId];
    if (messages != null) {
      // Create new list with updated seen status
      _messagesByContact[contactId] = messages.map((message) {
        // Only update messages that are from the other person and unread
        if (message.fromId != contactId && message.seen == 0) {
          return message.copyWith(seen: 1);
        }
        return message;
      }).toList();
      notifyListeners();
    }
  }

  // Clear messages for a specific contact
  void clearMessages(String contactId) {
    _messagesByContact.remove(contactId);
    _isLoadingByContact.remove(contactId);
    _errorByContact.remove(contactId);
    _currentPageByContact.remove(contactId);
    _hasMoreByContact.remove(contactId);
    notifyListeners();
  }

  // Clear all messages
  void clearAllMessages() {
    _messagesByContact.clear();
    _isLoadingByContact.clear();
    _errorByContact.clear();
    _currentPageByContact.clear();
    _hasMoreByContact.clear();
    notifyListeners();
  }

  // Initialize state for a new contact
  void _initializeContactState(String contactId) {
    if (!_messagesByContact.containsKey(contactId)) {
      _messagesByContact[contactId] = [];
      _isLoadingByContact[contactId] = false;
      _errorByContact[contactId] = null;
      _currentPageByContact[contactId] = 1;
      _hasMoreByContact[contactId] = true;
    }
  }

  // Get unread count for a contact
  int getUnreadCount(String contactId) {
    final messages = _messagesByContact[contactId] ?? [];
    return messages.where((message) => message.seen == 0).length;
  }

  // Check if a contact has any messages
  bool hasMessages(String contactId) {
    return _messagesByContact.containsKey(contactId) && 
           _messagesByContact[contactId]!.isNotEmpty;
  }

  // Get the last message for a contact (for contacts list preview)
  ChatMessage? getLastMessage(String contactId) {
    final messages = _messagesByContact[contactId];
    return messages != null && messages.isNotEmpty ? messages.last : null;
  }
}