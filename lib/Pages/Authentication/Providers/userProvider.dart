import 'package:flutter/material.dart';
import 'package:gag_cars_frontend/Pages/Authentication/Models/user_model.dart';

class UserProvider with ChangeNotifier {
  UserModel? _user;
  bool _isLoading = false;
  String? _error;
  
  bool get isLoading => _isLoading;
  String? get error => _error;

  // Expose user data WITHOUT `id` and with cleaned-up fields
  UserModel? get user => _user == null
      ? null
      : UserModel(
          name: _user!.name,
          email: _user!.email,
          phoneNumber: _user!.phoneNumber,
          paidSeller: _user!.paidSeller, // Preserve paid_seller
          emailVerifiedAt: _user!.emailVerifiedAt,
          countryId: _user!.countryId,
          stateId: _user!.stateId,
          profileImage: _user!.profileImage,
          createdAt: _user!.createdAt,
          updatedAt: _user!.updatedAt,
          // ⚠️ `id` and `password` are intentionally omitted
        );

  // Update user (called after login/auth)
  Future<void> setUser(UserModel user) async {
    _isLoading = true;
    _error = null;
    notifyListeners();
    try{
      _user = user;
      await Future.delayed(const Duration(milliseconds: 500));
    } catch(e){
      _error = e.toString();
      rethrow;
    } finally{
      _isLoading = false;
      notifyListeners();
    }
  }

  void clearError(){
    _error = null;
    notifyListeners();
  }

  // Clear user (logout)
  void clearUser() {
    _user = null;
    notifyListeners();
  }

  // Helper getter for UI
  bool get isPaidSeller => _user?.isPaidSeller ?? false;
}