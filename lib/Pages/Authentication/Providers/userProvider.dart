// providers/userProvider.dart
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
  
  bool get isLoading => _isLoading;
  String? get error => _error;
  bool get isVerified => _isVerified;
  bool get isVerifiedDealer => _isVerifiedDealer;

  UserModel? get user => _user;

  // UPDATED METHOD: Update user profile with Cloudinary integration
  Future<UserModel> updateUserProfile({
    File? profileImage,
    String? userName,
    String? phoneNumber,
    String? email,
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
      );

      // Update local state with the new user data
      _user = updatedUser;
      
      // Refresh complete user data from API to get updated verification status
      await _refreshUserDataAfterUpdate();
      
      return updatedUser;

    } catch (e) {
      _error = e.toString();
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
    } catch (e) {
      // Silently fail, we still have the updated user from the update call
      print('Failed to refresh user data after update: $e');
    }
  }

  // NEW METHOD: Fetch updated user profile from API
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
      
    } catch (e) {
      _error = e.toString();
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Update user (called after login/auth) - MODIFIED to handle AuthResponseModel
  Future<void> setUserFromAuth(AuthResponseModel authResponse) async {
    _isLoading = true;
    _error = null;
    notifyListeners();
    
    try {
      _user = authResponse.user;
      _isVerified = authResponse.verified ?? false;
      _isVerifiedDealer = authResponse.verifiedDealer ?? false;
      
      await _saveUserDataToStorage(authResponse);
      await Future.delayed(const Duration(milliseconds: 500));
    } catch (e) {
      _error = e.toString();
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Update user with UserModel (backward compatibility)
  Future<void> setUser(UserModel user) async {
    _isLoading = true;
    _error = null;
    notifyListeners();
    
    try {
      _user = user;
      // For backward compatibility, set verified status to false
      _isVerified = false;
      _isVerifiedDealer = false;
      
      await _saveUserToStorage(user);
      await Future.delayed(const Duration(milliseconds: 500));
    } catch (e) {
      _error = e.toString();
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Helper method to save complete user data to secure storage
  Future<void> _saveUserDataToStorage(AuthResponseModel authResponse) async {
    try {
      const storage = FlutterSecureStorage();
      final userData = {
        'user': authResponse.user.toJson(),
        'verified': authResponse.verified,
        'verified_dealer': authResponse.verifiedDealer,
      };
      await storage.write(
        key: 'user_complete_data',
        value: jsonEncode(userData),
      );
    } catch (e) {
      print('Failed to save user data to storage: $e');
    }
  }

  // Helper method to save user to secure storage (backward compatibility)
  Future<void> _saveUserToStorage(UserModel user) async {
    try {
      const storage = FlutterSecureStorage();
      await storage.write(
        key: 'user_data',
        value: jsonEncode(user.toJson()),
      );
    } catch (e) {
      print('Failed to save user to storage: $e');
    }
  }

  // Load user data from storage on app start
  Future<void> loadUserFromStorage() async {
    try {
      const storage = FlutterSecureStorage();
      final userDataString = await storage.read(key: 'user_complete_data');
      
      if (userDataString != null) {
        final userData = jsonDecode(userDataString);
        final authResponse = AuthResponseModel.fromJson(userData);
        
        _user = authResponse.user;
        _isVerified = authResponse.verified ?? false;
        _isVerifiedDealer = authResponse.verifiedDealer ?? false;
        notifyListeners();
      }
    } catch (e) {
      print('Failed to load user from storage: $e');
    }
  }

  // Update verification status (can be called when admin verifies user)
  void updateVerificationStatus({bool? verified, bool? verifiedDealer}) {
    if (verified != null) _isVerified = verified;
    if (verifiedDealer != null) _isVerifiedDealer = verifiedDealer;
    notifyListeners();
  }

  void clearError() {
    _error = null;
    notifyListeners();
  }

  void clearUser() {
    _user = null;
    _isVerified = false;
    _isVerifiedDealer = false;
    notifyListeners();
    
    // Clear storage
    const storage = FlutterSecureStorage();
    storage.delete(key: 'user_complete_data');
    storage.delete(key: 'user_data');
  }

  bool get isPaidSeller => _user?.isPaidSeller ?? false;
  
  // NEW: Check if user can access dealer features
  bool get canAccessDealerFeatures => _isVerifiedDealer;
  
  // NEW: Check if user is fully verified
  bool get isFullyVerified => _isVerified;
}