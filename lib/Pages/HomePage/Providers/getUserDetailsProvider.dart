import 'package:flutter/foundation.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Models/userDetailsModel.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Services/UserDetailsService/userDetailsService.dart';
import 'package:logger/logger.dart';

class UserDetailsProvider with ChangeNotifier {
  final UserDetailsService _userDetailsService = UserDetailsService();
  final Logger logger = Logger();
  
  // State variables
  UserDetails? _userDetails;
  bool _isLoading = false;
  String? _errorMessage;
  bool _isVerified = false;
  bool _isVerifiedDealer = false;

  // Getters
  UserDetails? get userDetails => _userDetails;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  bool get hasError => _errorMessage != null;
  bool get isVerified => _isVerified;
  bool get isVerifiedDealer => _isVerifiedDealer;
  bool get isLoggedIn => _userDetails != null;
  int get itemsCount => _userDetails?.itemsCount ?? 0;

  // Clear all state
  void clearState() {
    _userDetails = null;
    _isLoading = false;
    _errorMessage = null;
    _isVerified = false;
    _isVerifiedDealer = false;
    notifyListeners();
  }

  // Clear only error state
  void clearError() {
    _errorMessage = null;
    notifyListeners();
  }

  // Fetch user details with comprehensive debugging
  Future<void> fetchUserDetails(String userId) async {
    if (_isLoading) return;
    
    logger.w('🔍 [PROVIDER START] fetchUserDetails called for: $userId');
    logger.w('🔍 [PROVIDER DEBUG] Current _userDetails: $_userDetails');
    logger.w('🔍 [PROVIDER DEBUG] Current itemsCount: ${_userDetails?.itemsCount}');
    
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final result = await _userDetailsService.getUserDetails(userId);
      
      logger.w('🔍 [PROVIDER] Service result received: ${result['success']}');
      logger.w('🔍 [PROVIDER DEBUG] Full result keys: ${result.keys}');
      
      if (result['success'] == true) {
        _userDetails = result['user'] as UserDetails;
        
        // 🔍 COMPREHENSIVE DEBUGGING: Check what we received from service
        logger.w('🔍 [PROVIDER DEBUG] UserDetails received from service: $_userDetails');
        logger.w('🔍 [PROVIDER DEBUG] ItemsCount from service: ${_userDetails?.itemsCount}');
        logger.w('🔍 [PROVIDER DEBUG] User ID from service: ${_userDetails?.id}');
        logger.w('🔍 [PROVIDER DEBUG] Full UserDetails object: $_userDetails');
        
        // Use safe casting with fallbacks
        _isVerified = (result['verified'] as bool?) ?? false;
        _isVerifiedDealer = (result['verified_dealer'] as bool?) ?? false;
        
        logger.w('🔍 [PROVIDER DEBUG] Final _isVerified: $_isVerified');
        logger.w('🔍 [PROVIDER DEBUG] Final _isVerifiedDealer: $_isVerifiedDealer');
        logger.w('🔍 [PROVIDER DEBUG] Final itemsCount in provider: ${_userDetails?.itemsCount}');
        
        _errorMessage = null;
        logger.w('✅ [PROVIDER SUCCESS] User details updated successfully');
      } else {
        _errorMessage = result['message'] as String? ?? 'Unknown error occurred';
        _isVerified = false;
        _isVerifiedDealer = false;
        logger.e('❌ [PROVIDER ERROR] Service returned error: $_errorMessage');
      }
    } catch (e) {
      _errorMessage = 'Failed to fetch user details: $e';
      _userDetails = null;
      _isVerified = false;
      _isVerifiedDealer = false;
      logger.e('❌ [PROVIDER ERROR] Exception caught: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
      logger.w('🔍 [PROVIDER END] fetchUserDetails completed for: $userId');
      logger.w('🔍 [PROVIDER FINAL] Current itemsCount: $itemsCount');
    }
  }

  // Update user details locally
  void updateUserDetails(UserDetails newDetails) {
    logger.w('🔍 [PROVIDER] updateUserDetails called');
    logger.w('🔍 [PROVIDER DEBUG] Old itemsCount: ${_userDetails?.itemsCount}');
    logger.w('🔍 [PROVIDER DEBUG] New itemsCount: ${newDetails.itemsCount}');
    
    _userDetails = newDetails;
    notifyListeners();
  }

  // Update verification status
  void updateVerificationStatus({bool? verified, bool? verifiedDealer}) {
    if (verified != null) _isVerified = verified;
    if (verifiedDealer != null) _isVerifiedDealer = verifiedDealer;
    notifyListeners();
  }

  // Update items count
  void updateItemsCount(int count) {
    logger.w('🔍 [PROVIDER] updateItemsCount called with: $count');
    logger.w('🔍 [PROVIDER DEBUG] Current itemsCount: ${_userDetails?.itemsCount}');
    
    if (_userDetails != null) {
      _userDetails = _userDetails!.copyWith(itemsCount: count);
      logger.w('🔍 [PROVIDER DEBUG] Updated itemsCount: ${_userDetails?.itemsCount}');
    }
    notifyListeners();
  }

  // Check if user details exist for a specific user
  bool hasUserDetails(String userId) {
    final hasDetails = _userDetails != null && _userDetails!.id == userId;
    logger.w('🔍 [PROVIDER] hasUserDetails for $userId: $hasDetails');
    return hasDetails;
  }

  // Refresh user details
  Future<void> refreshUserDetails(String userId) async {
    logger.w('🔍 [PROVIDER] refreshUserDetails called for: $userId');
    await fetchUserDetails(userId);
  }

  // Get formatted ads count text
  String get formattedAdsCount {
    final count = itemsCount;
    logger.w('🔍 [PROVIDER] formattedAdsCount called, count: $count');
    
    if (count == 0) return 'No Ads';
    if (count == 1) return '1 Ad';
    return '$count Ads';
  }
}