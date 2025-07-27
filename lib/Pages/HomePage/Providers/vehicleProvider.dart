import 'package:flutter/material.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Models/brandModelModel.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Models/makeModel.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Services/HomeService/brandModelService.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Services/HomeService/makeService.dart';
import 'package:logger/logger.dart';

class VehicleProvider with ChangeNotifier {
  final MakeService _makeService;
  final BrandModelService _brandModelService;
  final Logger logger = Logger();

  // State variables
  List<Make> _makes = [];
  List<BrandModel> _brandModels = [];
  bool _isLoadingMakes = false;
  bool _isLoadingModels = false;
  String _errorMessage = '';
  bool _hasError = false;
  Make? _selectedMake;

  // Getters
  List<Make> get makes => _makes;
  List<BrandModel> get brandModels => _brandModels;
  bool get isLoadingMakes => _isLoadingMakes;
  bool get isLoadingModels => _isLoadingModels;
  String get errorMessage => _errorMessage;
  bool get hasError => _hasError;
  Make? get selectedMake => _selectedMake;

  VehicleProvider(this._makeService, this._brandModelService);

  Future<void> fetchMakes() async {
    _isLoadingMakes = true;
    _errorMessage = '';
    _hasError = false;
    notifyListeners();

    try {
      _makes = await _makeService.fetchMakes();
      // Clear any previous selection when fetching new makes
      _selectedMake = null;
      _brandModels = [];
    } catch (e, stackTrace) {
      _handleError('Failed to load vehicle makes', e, stackTrace);
    } finally {
      _isLoadingMakes = false;
      notifyListeners();
    }
  }

  Future<void> fetchBrandModels(int makeId) async {
    if (makeId <= 0) return; // Validate makeId is positive

    _isLoadingModels = true;
    _errorMessage = '';
    _hasError = false;
    notifyListeners();

    try {
      _brandModels = await _brandModelService.fetchBrandModels(brandId: makeId);
      // Update selected make
      _selectedMake = _makes.firstWhere((make) => make.id == makeId.toString());
    } catch (e, stackTrace) {
      _handleError('Failed to load brand models for make ID $makeId', e, stackTrace);
    } finally {
      _isLoadingModels = false;
      notifyListeners();
    }
  }

  void _handleError(String message, dynamic error, StackTrace stackTrace) {
    _errorMessage = message;
    _hasError = true;
    logger.e(
      'Vehicle data loading failed',
      error: error,
      stackTrace: stackTrace,
    );
  }

  Future<void> retryFailedRequest() async {
    if (!_hasError) return;
    if (_selectedMake != null) {
      await fetchBrandModels(_selectedMake!.id); // Convert string ID to int
    } else {
      await fetchMakes();
    }
  }

  void clearError() {
    _hasError = false;
    _errorMessage = '';
    notifyListeners();
  }

  void clearBrandModels() {
    _brandModels = [];
    _selectedMake = null;
    notifyListeners();
  }
}