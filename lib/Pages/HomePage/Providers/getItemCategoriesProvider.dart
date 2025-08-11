import 'package:flutter/material.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Models/itemCategoryModel.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Services/ItemCategoryService/itemCategoryService.dart';

class ItemCategoriesProvider with ChangeNotifier {
  final ItemCategoryService _service;

  ItemCategoriesProvider(this._service);

  ItemCategoryResponse? _categories;
  bool _isLoading = false;
  String? _error;
  bool _isNotifying = false;

  ItemCategoryResponse? get categories => _categories;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> getAllCategories() async {
    _isLoading = true;
    _error = null;
    _safeNotify();

    try {
      _categories = await _service.getAllCategories();
      _error = null;
    } catch (e) {
      _error = e.toString();
      _categories = null;
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

  void clearError() {
    _error = null;
    _safeNotify();
  }
}