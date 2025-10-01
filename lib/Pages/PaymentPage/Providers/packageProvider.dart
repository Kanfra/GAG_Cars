import 'package:flutter/foundation.dart';
import 'package:gag_cars_frontend/Pages/PaymentPage/Models/packageModel.dart';
import 'package:gag_cars_frontend/Pages/PaymentPage/Services/PackageService/packageService.dart';

class PackageProvider with ChangeNotifier {
  final PackageService _packageService = PackageService();
  
  List<Package> _packages = [];
  bool _isLoading = false;
  String? _error;

  List<Package> get packages => _packages;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> getPackages() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final response = await _packageService.getPackages();
      _packages = response.data;
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
}