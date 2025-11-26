import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gag_cars_frontend/Pages/Authentication/Models/user_model.dart';
import 'package:gag_cars_frontend/Pages/Authentication/Models/auth_response_model.dart';
import 'package:gag_cars_frontend/Pages/Authentication/Services/authService.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserProvider with ChangeNotifier {
  UserModel? _user;
  bool _isLoading = false;
  String? _error;
  bool _isVerified = false;
  bool _isVerifiedDealer = false;
  
  // Storage keys
  static const String _userCompleteDataKey = 'user_complete_data';
  static const String _userDataKey = 'user_data';
  static const String _tokenKey = 'auth_token';
  
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  // Getters
  UserModel? get user => _user;
  bool get isLoading => _isLoading;
  String? get error => _error;
  bool get isVerified => _isVerified;
  bool get isVerifiedDealer => _isVerifiedDealer;
  bool get isPaidSeller => _user?.isPaidSeller ?? false;
  bool get canAccessDealerFeatures => _isVerifiedDealer;
  bool get isFullyVerified => _isVerified;
  bool get isLoggedIn => _user != null;

  // Set user from AuthResponseModel (complete data including verification status)
  Future<void> setUserFromAuth(AuthResponseModel authResponse) async {
    _isLoading = true;
    _error = null;
    notifyListeners();
    
    try {
      _user = authResponse.user;
      _isVerified = authResponse.verified ?? false;
      _isVerifiedDealer = authResponse.verifiedDealer ?? false;
      
      await _saveUserDataToStorage(authResponse);
      
      // Log successful user update
      debugPrint('✅ UserProvider: User data updated successfully');
      debugPrint('✅ UserProvider: User verified: $_isVerified');
      debugPrint('✅ UserProvider: Dealer verified: $_isVerifiedDealer');
      debugPrint('✅ UserProvider: User name: ${_user?.name}');
      debugPrint('✅ UserProvider: User email: ${_user?.email}');
      
    } catch (e) {
      _error = 'Failed to set user data: ${e.toString()}';
      debugPrint('❌ UserProvider Error: $_error');
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Set user with UserModel (backward compatibility - use setUserFromAuth when possible)
  Future<void> setUser(UserModel user) async {
    _isLoading = true;
    _error = null;
    notifyListeners();
    
    try {
      _user = user;
      // For backward compatibility, try to load verification status from storage
      await _loadVerificationStatusFromStorage();
      
      debugPrint('🔄 UserProvider: User set (basic data)');
      debugPrint('🔄 UserProvider: User name: ${_user?.name}');
      
      await _saveUserToStorage(user);
      
    } catch (e) {
      _error = 'Failed to set user: ${e.toString()}';
      debugPrint('❌ UserProvider Error: $_error');
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Update user profile with Cloudinary integration
  Future<UserModel> updateUserProfile({
    File? profileImage,
    String? userName,
    String? phoneNumber,
    String? email,
    int? countryId,
  }) async {
    if (_user == null) {
      throw Exception('No user logged in');
    }

    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      // Call the service with current user from provider
      final updatedUser = await AuthService.updateUserProfile(
        currentUser: _user!,
        profileImage: profileImage,
        userName: userName,
        phoneNumber: phoneNumber,
        email: email,
        countryId: countryId,
      );

      // Update local state with the new user data
      _user = updatedUser;
      
      debugPrint('✅ UserProvider: Profile updated successfully');
      debugPrint('✅ UserProvider: New user name: ${_user?.name}');
      
      // Refresh complete user data from API to get updated verification status
      await _refreshUserDataAfterUpdate();
      
      return updatedUser;

    } catch (e) {
      _error = 'Profile update failed: ${e.toString()}';
      debugPrint('❌ UserProvider Error: $_error');
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Fetch updated user profile from API
  Future<void> fetchUserProfile() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final authResponse = await AuthService.getAuthUserProfile();
      
      // Update user data
      _user = authResponse.user;
      _isVerified = authResponse.verified ?? false;
      _isVerifiedDealer = authResponse.verifiedDealer ?? false;
      
      // Save to storage
      await _saveUserDataToStorage(authResponse);
      
      debugPrint('✅ UserProvider: User profile fetched successfully');
      debugPrint('✅ UserProvider: User verified: $_isVerified');
      debugPrint('✅ UserProvider: Dealer verified: $_isVerifiedDealer');
      
    } catch (e) {
      _error = 'Failed to fetch user profile: ${e.toString()}';
      debugPrint('❌ UserProvider Error: $_error');
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Helper method to refresh user data after profile update
  Future<void> _refreshUserDataAfterUpdate() async {
    try {
      final authResponse = await AuthService.getAuthUserProfile();
      _user = authResponse.user;
      _isVerified = authResponse.verified ?? false;
      _isVerifiedDealer = authResponse.verifiedDealer ?? false;
      
      await _saveUserDataToStorage(authResponse);
      
      debugPrint('✅ UserProvider: User data refreshed after update');
      debugPrint('✅ UserProvider: Verification status - User: $_isVerified, Dealer: $_isVerifiedDealer');
      
    } catch (e) {
      // Silently fail, we still have the updated user from the update call
      debugPrint('⚠️ UserProvider: Failed to refresh user data after update: $e');
    }
  }

  // Helper method to save complete user data to secure storage
  Future<void> _saveUserDataToStorage(AuthResponseModel authResponse) async {
    try {
      final userData = {
        'user': authResponse.user.toJson(),
        'verified': authResponse.verified,
        'verified_dealer': authResponse.verifiedDealer,
        'timestamp': DateTime.now().toIso8601String(),
      };
      
      await _storage.write(
        key: _userCompleteDataKey,
        value: jsonEncode(userData),
      );
      
      debugPrint('💾 UserProvider: Complete user data saved to storage');
    } catch (e) {
      debugPrint('❌ UserProvider: Failed to save user data to storage: $e');
    }
  }

  // Helper method to save user to secure storage (backward compatibility)
  Future<void> _saveUserToStorage(UserModel user) async {
    try {
      await _storage.write(
        key: _userDataKey,
        value: jsonEncode(user.toJson()),
      );
      
      debugPrint('💾 UserProvider: Basic user data saved to storage');
    } catch (e) {
      debugPrint('❌ UserProvider: Failed to save user to storage: $e');
    }
  }

  // Load verification status from storage (for backward compatibility)
  Future<void> _loadVerificationStatusFromStorage() async {
    try {
      final userDataString = await _storage.read(key: _userCompleteDataKey);
      
      if (userDataString != null) {
        final userData = jsonDecode(userDataString);
        _isVerified = userData['verified'] ?? false;
        _isVerifiedDealer = userData['verified_dealer'] ?? false;
        
        debugPrint('📥 UserProvider: Verification status loaded from storage');
        debugPrint('📥 UserProvider: User verified: $_isVerified, Dealer verified: $_isVerifiedDealer');
      }
    } catch (e) {
      debugPrint('⚠️ UserProvider: Failed to load verification status from storage: $e');
    }
  }

  // Load user data from storage on app start
  Future<void> loadUserFromStorage() async {
    _isLoading = true;
    notifyListeners();
    
    try {
      // First try to load complete user data
      final userDataString = await _storage.read(key: _userCompleteDataKey);
      
      if (userDataString != null) {
        final userData = jsonDecode(userDataString);
        final authResponse = AuthResponseModel.fromJson(userData);
        
        _user = authResponse.user;
        _isVerified = authResponse.verified ?? false;
        _isVerifiedDealer = authResponse.verifiedDealer ?? false;
        
        debugPrint('✅ UserProvider: Complete user data loaded from storage');
        debugPrint('✅ UserProvider: User: ${_user?.name}');
        debugPrint('✅ UserProvider: Verified: $_isVerified, Dealer Verified: $_isVerifiedDealer');
        
      } else {
        // Fallback to basic user data for backward compatibility
        final basicUserDataString = await _storage.read(key: _userDataKey);
        
        if (basicUserDataString != null) {
          final userData = jsonDecode(basicUserDataString);
          _user = UserModel.fromJson(userData);
          await _loadVerificationStatusFromStorage();
          
          debugPrint('🔄 UserProvider: Basic user data loaded from storage');
          debugPrint('🔄 UserProvider: User: ${_user?.name}');
        } else {
          debugPrint('ℹ️ UserProvider: No user data found in storage');
        }
      }
    } catch (e) {
      debugPrint('❌ UserProvider: Failed to load user from storage: $e');
      _error = 'Failed to load user data: ${e.toString()}';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Update verification status (can be called when admin verifies user)
  void updateVerificationStatus({bool? verified, bool? verifiedDealer}) {
    bool changed = false;
    
    if (verified != null && _isVerified != verified) {
      _isVerified = verified;
      changed = true;
      debugPrint('✅ UserProvider: User verification status updated: $_isVerified');
    }
    
    if (verifiedDealer != null && _isVerifiedDealer != verifiedDealer) {
      _isVerifiedDealer = verifiedDealer;
      changed = true;
      debugPrint('✅ UserProvider: Dealer verification status updated: $_isVerifiedDealer');
    }
    
    if (changed) {
      // Save updated verification status to storage
      if (_user != null) {
        final authResponse = AuthResponseModel(
          user: _user!,
          verified: _isVerified,
          verifiedDealer: _isVerifiedDealer,
        );
        _saveUserDataToStorage(authResponse);
      }
      notifyListeners();
    }
  }

  // Clear error
  void clearError() {
    _error = null;
    notifyListeners();
  }

  // Clear user data (logout)
  Future<void> clearUser() async {
    _user = null;
    _isVerified = false;
    _isVerifiedDealer = false;
    _error = null;
    
    debugPrint('🗑️ UserProvider: User data cleared');
    
    // Clear storage
    try {
      await _storage.delete(key: _userCompleteDataKey);
      await _storage.delete(key: _userDataKey);
      await _storage.delete(key: _tokenKey);
      
      debugPrint('🗑️ UserProvider: Storage cleared');
    } catch (e) {
      debugPrint('⚠️ UserProvider: Failed to clear storage: $e');
    }
    
    notifyListeners();
  }

  // Check if user has specific permission/role
  // bool hasPermission(String permission) {
  //   // Implement permission logic based on your requirements
  //   return _user?.roles?.contains(permission) ?? false;
  // }

  // Get user display name
  String get displayName {
    return _user?.name ?? 'Guest User';
  }

  // Get user email
  String get userEmail {
    return _user?.email ?? 'No email';
  }

  // Get user phone
  String get userPhone {
    return _user?.phoneNumber ?? 'No phone';
  }

  // Get profile image URL
  String? get profileImageUrl {
    return _user?.profileImage;
  }

  // Check if user profile is complete
  bool get isProfileComplete {
    return _user?.name.isNotEmpty == true &&
           _user?.email.isNotEmpty == true &&
           _user?.phoneNumber?.isNotEmpty == true;
  }

  // Force refresh user data from server
  Future<void> forceRefresh() async {
    if (_user != null) {
      await fetchUserProfile();
    }
  }
}