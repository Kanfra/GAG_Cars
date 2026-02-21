import 'package:flutter/material.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Models/broadcastModel.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Services/BroadcastService/broadcastService.dart';

class BroadcastProvider with ChangeNotifier {
  final BroadcastService _broadcastService = BroadcastService();
  
  List<BroadcastModel> _broadcasts = [];
  bool _isLoading = false;
  bool _hasError = false;
  String _errorMessage = '';
  int _currentPage = 1;
  bool _hasMore = true;

  List<BroadcastModel> get broadcasts => _broadcasts;
  bool get isLoading => _isLoading;
  bool get hasError => _hasError;
  String get errorMessage => _errorMessage;
  bool get hasMore => _hasMore;

  BroadcastProvider() {
    fetchBroadcasts();
  }

  Future<void> fetchBroadcasts({bool isRefresh = false}) async {
    if (isRefresh) {
      _currentPage = 1;
      _hasMore = true;
      _broadcasts.clear();
    }

    if (_isLoading || (!_hasMore && _broadcasts.isNotEmpty)) {
      return;
    }

    _isLoading = true;
    _hasError = false;
    _errorMessage = '';
    notifyListeners();

    try {
      final response = await _broadcastService.getBroadcasts(page: _currentPage);
      
      if (isRefresh) {
        _broadcasts = response.data;
      } else {
        _broadcasts.addAll(response.data);
      }
      
      // Check if there are more pages
      _hasMore = response.links.next != null;
      _currentPage++;
      
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      _hasError = true;
      _errorMessage = e.toString();
      notifyListeners();
    }
  }

  Future<void> loadMoreBroadcasts() async {
    if (!_hasMore || _isLoading) return;
    await fetchBroadcasts();
  }

  Future<void> refreshBroadcasts() async {
    await fetchBroadcasts(isRefresh: true);
  }

  // Get broadcast by ID
  BroadcastModel? getBroadcastById(String id) {
    try {
      return _broadcasts.firstWhere((broadcast) => broadcast.id == id);
    } catch (e) {
      return null;
    }
  }

  // Clear all broadcasts
  void clearBroadcasts() {
    _broadcasts.clear();
    _currentPage = 1;
    _hasMore = true;
    notifyListeners();
  }
}