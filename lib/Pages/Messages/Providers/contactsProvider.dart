// providers/contacts_provider.dart
import 'package:flutter/foundation.dart';
import 'package:gag_cars_frontend/Pages/Messages/Models/chatContactModel.dart';
import 'package:gag_cars_frontend/Pages/Messages/Services/ChatService/chatService.dart';

class ContactsProvider with ChangeNotifier {
  List<ChatContact> _contacts = [];
  bool _isLoading = false;
  String? _error;
  
  // Getters
  List<ChatContact> get contacts => _contacts;
  bool get isLoading => _isLoading;
  String? get error => _error;
  bool get hasError => _error != null;

  // Load contacts with better error handling
  Future<void> loadContacts() async {
    try {
      _isLoading = true;
      _error = null;
      notifyListeners();

      final response = await ChatService.getContacts();
      
      // Safe handling of the response
      if (response.contacts != null) {
        _contacts = response.contacts;
      } else {
        _contacts = [];
        _error = 'No contacts found';
      }
      
    } catch (e) {
      _error = 'Failed to load contacts: ${e.toString()}';
      _contacts = []; // Clear contacts on error
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Refresh contacts
  Future<void> refreshContacts() async {
    await loadContacts();
  }

  // Clear contacts and error
  void clear() {
    _contacts.clear();
    _error = null;
    notifyListeners();
  }

  // Search contacts by name or phone
  List<ChatContact> searchContacts(String query) {
    if (query.isEmpty) return _contacts;
    
    return _contacts.where((contact) {
      final name = contact.name.toLowerCase();
      final phone = contact.phone.toLowerCase();
      final searchQuery = query.toLowerCase();
      
      return name.contains(searchQuery) || phone.contains(searchQuery);
    }).toList();
  }
}