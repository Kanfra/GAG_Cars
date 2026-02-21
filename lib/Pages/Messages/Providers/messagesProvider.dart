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
  List<ChatMessage> getMessages(String contactId) =>
      _messagesByContact[contactId] ?? [];
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
          ...response.messages,
        ];
      } else {
        // Replace messages (first load or refresh)
        _messagesByContact[contactId] = response.messages;
      }

      // Update pagination state
      _currentPageByContact[contactId] = pageToLoad;
      _hasMoreByContact[contactId] =
          response.messages.length >=
          20; // If we got less than perPage, no more messages
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

  // Sync latest messages (for polling/real-time)
  Future<void> syncMessages(String contactId) async {
    try {
      _initializeContactState(contactId);

      // Fetch latest page (page 1) to see if there are new messages
      final response = await ChatService.fetchMessages(
        contactId: contactId,
        page: 1,
        perPage: 20,
      );

      final currentMessages = _messagesByContact[contactId] ?? [];
      final List<ChatMessage> updatedMessages = List.from(currentMessages);
      bool hasChanges = false;

      for (var serverMsg in response.messages) {
        // 1. Check if we already have this exact ID (Server ID match)
        final existingIndex = updatedMessages.indexWhere(
          (m) => m.id == serverMsg.id,
        );

        if (existingIndex != -1) {
          // Already have it, skip or update if needed
          continue;
        }

        // 2. Check for optimistic match (Temporary ID but same content & near time)
        // Find a message from ME, with same body, same attachment, within last 60 seconds
        final optimisticIndex = updatedMessages.indexWhere((m) {
          if (m.fromId != serverMsg.fromId)
            return false; // Must be from same sender
          if (m.body != serverMsg.body) return false; // Must have same body
          // if (m.attachment != serverMsg.attachment) return false; // Optional: strict attachment check

          // Time check: Server time vs Local time (allow 60s skew/delay)
          final serverTime = DateTime.tryParse(serverMsg.createdAt);
          final localTime = DateTime.tryParse(m.createdAt);

          if (serverTime == null || localTime == null) return false;

          final diff = serverTime.difference(localTime).inSeconds.abs();
          return diff < 60; // Match if within 1 minute
        });

        if (optimisticIndex != -1) {
          // Found an optimistic match! Replace it with the real server message
          // This prevents the duplicate
          updatedMessages[optimisticIndex] = serverMsg;
          hasChanges = true;
        } else {
          // It's a brand new message, add it
          updatedMessages.add(serverMsg);
          hasChanges = true;
        }
      }

      if (hasChanges) {
        _messagesByContact[contactId] = updatedMessages;
        notifyListeners();
      }
    } catch (e) {
      debugPrint('Error syncing messages: $e');
    }
  }

  // Add a new message to the conversation (for real-time updates/optimistic UI)
  void addNewMessage(String contactId, ChatMessage message) {
    _initializeContactState(contactId);

    // Check if message already exists (to avoid duplicates from polling/optimistic mix)
    final exists = _messagesByContact[contactId]!.any(
      (m) => m.id == message.id,
    );
    if (!exists) {
      _messagesByContact[contactId] = [
        ..._messagesByContact[contactId]!,
        message,
      ];
      notifyListeners();
    }
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
