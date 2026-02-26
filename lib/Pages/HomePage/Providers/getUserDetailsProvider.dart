import 'package:flutter/foundation.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Models/userDetailsModel.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Services/UserDetailsService/userDetailsService.dart';
import 'package:logger/logger.dart';

class UserDetailsProvider with ChangeNotifier {
  final UserDetailsService _userDetailsService = UserDetailsService();
  final Logger logger = Logger();

  // State variables - Cache-based
  final Map<String, UserDetails> _userCache = {};
  final Map<String, bool> _verifiedCache = {};
  final Map<String, bool> _verifiedDealerCache = {};
  final Map<String, bool> _loadingState = {};
  final Map<String, String?> _errorCache = {};

  // Getters
  bool isLoading(String userId) => _loadingState[userId] ?? false;
  String? getErrorMessage(String userId) => _errorCache[userId];
  bool isVerified(String userId) => _verifiedCache[userId] ?? false;
  bool isVerifiedDealer(String userId) => _verifiedDealerCache[userId] ?? false;
  UserDetails? getUserDetails(String userId) => _userCache[userId];
  int getItemsCount(String userId) => _userCache[userId]?.itemsCount ?? 0;

  // Clear all state
  void clearState() {
    _userCache.clear();
    _verifiedCache.clear();
    _verifiedDealerCache.clear();
    _loadingState.clear();
    _errorCache.clear();
    notifyListeners();
  }

  // Fetch user details for a specific user ID
  Future<void> fetchUserDetails(String userId) async {
    if (_loadingState[userId] == true) return;

    logger.w('🔍 [PROVIDER] fetchUserDetails called for: $userId');

    _loadingState[userId] = true;
    _errorCache[userId] = null;
    notifyListeners();

    try {
      final result = await _userDetailsService.getUserDetails(userId);

      if (result['success'] == true) {
        final details = result['user'] as UserDetails;
        _userCache[userId] = details;
        _verifiedCache[userId] = (result['verified'] as bool?) ?? false;
        _verifiedDealerCache[userId] =
            (result['verified_dealer'] as bool?) ?? false;
        _errorCache[userId] = null;
        logger.w('✅ [PROVIDER SUCCESS] User details cached for $userId');
      } else {
        _errorCache[userId] =
            result['message'] as String? ?? 'Unknown error occurred';
        logger.e(
          '❌ [PROVIDER ERROR] Service error for $userId: ${_errorCache[userId]}',
        );
      }
    } catch (e) {
      _errorCache[userId] = 'Failed to fetch user details: $e';
      logger.e('❌ [PROVIDER ERROR] Exception for $userId: $e');
    } finally {
      _loadingState[userId] = false;
      notifyListeners();
    }
  }

  // Check if user details exist in cache
  bool hasUserDetails(String userId) {
    return _userCache.containsKey(userId);
  }

  // Refresh user details
  Future<void> refreshUserDetails(String userId) async {
    _loadingState.remove(userId);
    await fetchUserDetails(userId);
  }

  // Get formatted ads count text
  String getFormattedAdsCount(String userId) {
    final count = getItemsCount(userId);
    if (count == 0) return 'No Ads';
    if (count == 1) return '1 Ad';
    return '$count Ads';
  }
}
