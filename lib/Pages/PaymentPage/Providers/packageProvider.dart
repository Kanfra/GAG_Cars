import 'package:flutter/foundation.dart';
import 'package:gag_cars_frontend/Pages/PaymentPage/Models/packageModel.dart';
import 'package:gag_cars_frontend/Pages/PaymentPage/Services/PackageService/packageService.dart';

class PackageProvider with ChangeNotifier {
  final PackageService _packageService = PackageService();
  
  List<Package> _packages = [];
  bool _isLoading = false;
  String? _error;
  int? _currentCategoryId;

  List<Package> get packages => _packages;
  bool get isLoading => _isLoading;
  String? get error => _error;
  int? get currentCategoryId => _currentCategoryId;

  Future<void> getPackages({required int categoryId}) async {
    _isLoading = true;
    _error = null;
    _currentCategoryId = categoryId;
    notifyListeners();

    try {
      _packages = await _packageService.getPackages(categoryId: categoryId);
      _error = null;
    } catch (e) {
      _error = e.toString();
      _packages = [];
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void clearError() {
    _error = null;
    notifyListeners();
  }

  void clearPackages() {
    _packages.clear();
    _currentCategoryId = null;
    notifyListeners();
  }

  // Get packages filtered by type
  List<Package> getUploadPackages() {
    return _packages.where((package) => package.packageType == 'upload').toList();
  }

  List<Package> getPromotionPackages() {
    return _packages.where((package) => package.packageType == 'promotion').toList();
  }

  // Get package by ID
  Package? getPackageById(String packageId) {
    try {
      return _packages.firstWhere((package) => package.id == packageId);
    } catch (e) {
      return null;
    }
  }
}