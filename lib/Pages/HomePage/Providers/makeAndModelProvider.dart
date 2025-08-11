import 'package:flutter/material.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Models/makeAndModelModel.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Services/MakeAndModelService/makeAndModelService.dart';

class MakeAndModelProvider extends ChangeNotifier {
  final MakeAndModelService _service;
  
  // State variables
  MakeAndModelResponse? _response; // Store full response
  bool _isLoading = false;
  String? _error;
  bool _isNotifying = false;

  MakeAndModelProvider(this._service);

  // Getters
  List<VehicleMake>? get makes => _response?.data; // Access data from response
  bool get isLoading => _isLoading;
  String? get error => _error;
  MakeAndModelResponse? get response => _response;

  Future<void> fetchMakesWithModels() async {
    _isLoading = true;
    _error = null;
    _safeNotify();

    try {
      _response = await _service.fetchMakesWithModels();
    } catch (e) {
      _error = e.toString();
      _response = null;
    } finally {
      _isLoading = false;
      _safeNotify();
    }
  }

  void _safeNotify(){
    if(_isNotifying) return;
    _isNotifying = true;
    WidgetsBinding.instance.addPostFrameCallback((_){
      _isNotifying = false;
      if(hasListeners){
        notifyListeners();
      }
    });
  }

  // Helper method to get models for a specific make
  List<VehicleModel>? getModelsForMake(int makeId) {
    if (makes == null) return null;
    try {
      return makes!.firstWhere((make) => make.id == makeId).models;
    } catch (_) {
      return null;
    }
  }
}