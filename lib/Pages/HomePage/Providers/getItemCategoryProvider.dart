import 'package:flutter/foundation.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Models/categoriesModel.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Services/ItemCategoryService/itemCategoryService.dart';

class CategoryDetailProvider with ChangeNotifier {
  // State for detailed category data (with fields)
  Map<int, DetailedCategory> _categoryDetails = {};
  Map<int, bool> _loadingStates = {};
  Map<int, String> _errorStates = {};
  bool _isLoading = false;

  // Getters
  Map<int, DetailedCategory> get categoryDetails => _categoryDetails;
  bool get isLoading => _isLoading;
  
  bool isCategoryLoading(int categoryId) => _loadingStates[categoryId] ?? false;
  String? getCategoryError(int categoryId) => _errorStates[categoryId];
  DetailedCategory? getCategoryDetail(int categoryId) => _categoryDetails[categoryId];

  // Fetch detailed category with fields
  Future<void> fetchCategoryDetail(int categoryId) async {
    if (_categoryDetails.containsKey(categoryId)) return;

    // Use microtask to avoid notifying during build
    Future.microtask(() {
      _loadingStates[categoryId] = true;
      _errorStates.remove(categoryId);
      _isLoading = true;
      notifyListeners();
    });

    try {
      final DetailedCategory category = (await ItemCategoryService().getCategoryById(categoryId)) as DetailedCategory;
      
      Future.microtask(() {
        _categoryDetails[categoryId] = category;
        _errorStates.remove(categoryId);
        _loadingStates[categoryId] = false;
        _isLoading = false;
        notifyListeners();
      });
    } catch (e) {
      Future.microtask(() {
        _errorStates[categoryId] = 'Failed to load category details: $e';
        _loadingStates[categoryId] = false;
        _isLoading = false;
        notifyListeners();
      });
    }
  }

  // Build highlights using category field configuration
  List<Map<String, String>> buildHighlights(int categoryId, Map<String, dynamic> item) {
    final category = _categoryDetails[categoryId];
    
    // If no detailed category data, use defaults
    if (category == null || category.highlightedFields.isEmpty) {
      return _getDefaultHighlights(item);
    }

    final List<Map<String, String>> highlights = [];
    
    for (final field in category.highlightedFields) {
      final fieldValue = item[field.name]?.toString();
      if (fieldValue != null && fieldValue.isNotEmpty && fieldValue != 'null') {
        highlights.add({
          'title': field.label,
          'value': _formatFieldValue(field, fieldValue),
        });
      }
    }

    return highlights.isNotEmpty ? highlights : _getDefaultHighlights(item);
  }

  // Build specifications using category field configuration
  List<Map<String, String>> buildSpecifications(int categoryId, Map<String, dynamic> item) {
    final category = _categoryDetails[categoryId];
    
    // If no detailed category data, use defaults
    if (category == null || category.itemFields.isEmpty) {
      return _getDefaultSpecifications(item);
    }

    final List<Map<String, String>> specifications = [];
    final highlightedFieldNames = category.highlightedFields.map((f) => f.name).toSet();
    
    for (final field in category.itemFields) {
      // Skip fields that are highlighted
      if (highlightedFieldNames.contains(field.name)) continue;

      final fieldValue = item[field.name]?.toString();
      if (fieldValue != null && fieldValue.isNotEmpty && fieldValue != 'null') {
        specifications.add({
          'title': field.label,
          'value': _formatFieldValue(field, fieldValue),
        });
      }
    }

    return specifications.isNotEmpty ? specifications : _getDefaultSpecifications(item);
  }

  // Safe method to extract values from dynamic objects (NO REFLECTION)
  String? _safeGetString(dynamic obj, String key) {
    if (obj == null) return null;
    
    if (obj is Map<String, dynamic>) {
      final value = obj[key];
      return value?.toString();
    }
    
    // For custom objects, use toString parsing instead of reflection
    try {
      final stringRep = obj.toString();
      // Try to extract value from string representation
      return _extractValueFromString(stringRep, key);
    } catch (e) {
      return null;
    }
  }

  // Extract value from string representation (for Freezed objects)
  String? _extractValueFromString(String str, String key) {
    try {
      final pattern = RegExp('$key:\\s*([^,)]+)');
      final match = pattern.firstMatch(str);
      if (match != null) {
        String value = match.group(1)!.trim();
        // Remove quotes if present
        if (value.startsWith('"') && value.endsWith('"')) {
          value = value.substring(1, value.length - 1);
        } else if (value.startsWith("'") && value.endsWith("'")) {
          value = value.substring(1, value.length - 1);
        }
        return value;
      }
    } catch (e) {
      // Ignore errors
    }
    return null;
  }

  // Default fallbacks - SAFELY ACCESSING DATA
  List<Map<String, String>> _getDefaultHighlights(Map<String, dynamic> item) {
    final List<Map<String, String>> highlights = [];
    
    if (item['year'] != null) {
      highlights.add({'title': 'Model Year', 'value': item['year'].toString()});
    }
    if (item['mileage'] != null) {
      highlights.add({'title': 'Mileage', 'value': '${item['mileage']} km'});
    }
    if (item['engine_capacity'] != null) {
      highlights.add({'title': 'Engine', 'value': '${item['engine_capacity']} L'});
    }
    
    return highlights.isNotEmpty ? highlights : [
      {'title': 'Model Year', 'value': 'N/A'},
      {'title': 'Mileage', 'value': 'N/A'},
      {'title': 'Engine', 'value': 'N/A'},
    ];
  }

  List<Map<String, String>> _getDefaultSpecifications(Map<String, dynamic> item) {
    final List<Map<String, String>> specs = [];
    
    final categoryName = _safeGetString(item['category'], 'name');
    if (categoryName != null) {
      specs.add({'title': 'Make', 'value': categoryName});
    }
    
    final modelName = _safeGetString(item['brand_model'], 'name');
    if (modelName != null) {
      specs.add({'title': 'Model', 'value': modelName});
    }
    
    if (item['color'] != null) {
      specs.add({'title': 'Color', 'value': item['color'].toString()});
    }
    
    return specs.isNotEmpty ? specs : [
      {'title': 'Make', 'value': 'N/A'},
      {'title': 'Model', 'value': 'N/A'},
      {'title': 'Color', 'value': 'N/A'},
    ];
  }

  String _formatFieldValue(ItemField field, String value) {
    switch (field.name) {
      case 'mileage': return '$value km';
      case 'engine_capacity': return '$value L';
      case 'number_of_passengers': return '$value seats';
      default:
        if (field.type == 'enum' && field.options is Map) {
          return (field.options as Map)[value]?.toString() ?? value;
        }
        return value;
    }
  }

  void clearCache() {
    _categoryDetails.clear();
    _loadingStates.clear();
    _errorStates.clear();
    notifyListeners();
  }

  void clearCategory(int categoryId) {
    _categoryDetails.remove(categoryId);
    _loadingStates.remove(categoryId);
    _errorStates.remove(categoryId);
    notifyListeners();
  }
}