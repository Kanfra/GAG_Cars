// providers/userProvider.dart
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gag_cars_frontend/Pages/Authentication/Models/user_model.dart';
import 'package:gag_cars_frontend/Pages/Authentication/Services/authService.dart';
import 'dart:io';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserProvider with ChangeNotifier {
  UserModel? _user;
  bool _isLoading = false;
  String? _error;
  
  bool get isLoading => _isLoading;
  String? get error => _error;

  UserModel? get user => _user == null
      ? null
      : UserModel(
          name: _user!.name,
          email: _user!.email,
          phoneNumber: _user!.phoneNumber,
          paidSeller: _user!.paidSeller,
          emailVerifiedAt: _user!.emailVerifiedAt,
          countryId: _user!.countryId,
          stateId: _user!.stateId,
          profileImage: _user!.profileImage,
          createdAt: _user!.createdAt,
          updatedAt: _user!.updatedAt,
        );

  // NEW METHOD: Update user profile with Cloudinary integration
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
        currentUser: _user!, // Pass current user from provider
        profileImage: profileImage,
        userName: userName,
        phoneNumber: phoneNumber,
        email: email,
      );

      // Update local state with the new user data
      _user = updatedUser;
      return updatedUser;
      // Save updated user to secure storage
      // await _saveUserToStorage(updatedUser);

    } catch (e) {
      _error = e.toString();
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Update user (called after login/auth) - KEEP EXISTING
  Future<void> setUser(UserModel user) async {
    _isLoading = true;
    _error = null;
    notifyListeners();
    try {
      _user = user;
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

  // Helper method to save user to secure storage
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

  void clearError() {
    _error = null;
    notifyListeners();
  }

  void clearUser() {
    _user = null;
    notifyListeners();
  }

  bool get isPaidSeller => _user?.isPaidSeller ?? false;
}
