import 'package:flutter/foundation.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Models/categoriesModel.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Services/ItemCategoryService/itemCategoryService.dart';

class CategoryDetailProvider with ChangeNotifier {
  // State for detailed category data (with fields)
  final Map<int, DetailedCategory> _categoryDetails = {};
  final Map<int, bool> _loadingStates = {};
  final Map<int, String> _errorStates = {};
  bool _isLoading = false;

  // Getters
  Map<int, DetailedCategory> get categoryDetails => _categoryDetails;
  bool get isLoading => _isLoading;

  bool isCategoryLoading(int categoryId) => _loadingStates[categoryId] ?? false;
  String? getCategoryError(int categoryId) => _errorStates[categoryId];
  DetailedCategory? getCategoryDetail(int categoryId) =>
      _categoryDetails[categoryId];

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
      final DetailedCategory category =
          (await ItemCategoryService().getCategoryById(categoryId))
              as DetailedCategory;

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
  List<Map<String, String>> buildHighlights(
    int categoryId,
    Map<String, dynamic> item,
  ) {
    final category = _categoryDetails[categoryId];

    // If no detailed category data, use defaults
    if (category == null || category.itemFields.isEmpty) {
      return _getDefaultHighlights(item);
    }

    final flattenedItem = _getFlattenedItemData(item);
    final List<Map<String, String>> highlights = [];

    // Use item_fields from the category to determine what is a highlight
    // based on pivot.highlight == 1
    for (final field in category.itemFields) {
      final isHighlight = field.pivot?['highlight'] == 1;
      if (!isHighlight) continue;

      String? displayValue;
      final label = field.label.toLowerCase();

      // STRICT HANDLERS for Make and Model
      if (label == 'make') {
        // Pull ONLY from brand name, no fallback
        displayValue = _safeGetString(item['brand'], 'name') ?? '';
      } else if (label == 'model') {
        // PRIMARY: Second word of full title for accuracy
        final itemName = item['name']?.toString() ?? '';
        final parts = itemName.split(' ').where((p) => p.isNotEmpty).toList();
        if (parts.length > 1) {
          displayValue = parts[1];
        } else {
          // SECONDARY: brand_model name
          displayValue = _safeGetString(item['brand_model'], 'name') ?? '';
        }
      } else {
        // Standard lookup for other fields
        displayValue = flattenedItem[field.name.toLowerCase()]?.toString();
      }

      // Add to list, allowing empty strings but handling null/N/A
      if (displayValue != null && displayValue != 'null') {
        highlights.add({
          'title': field.label,
          'value': _formatFieldValue(field, displayValue),
        });
      }
    }

    return highlights.isNotEmpty ? highlights : _getDefaultHighlights(item);
  }

  // Build specifications using category field configuration
  List<Map<String, String>> buildSpecifications(
    int categoryId,
    Map<String, dynamic> item,
  ) {
    final category = _categoryDetails[categoryId];

    // If no detailed category data, use defaults
    if (category == null || category.itemFields.isEmpty) {
      return _getDefaultSpecifications(item);
    }

    final flattenedItem = _getFlattenedItemData(item);
    final List<Map<String, String>> specifications = [];

    // Use item_fields from the category to determine what is a specification
    // based on pivot.highlight == 0
    for (final field in category.itemFields) {
      final isHighlight = field.pivot?['highlight'] == 1;
      // If it's a highlight, it doesn't go in specs
      if (isHighlight) continue;

      String? displayValue;
      final label = field.label.toLowerCase();

      // STRICT HANDLERS for Make and Model
      if (label == 'make') {
        // Pull ONLY from brand name, no fallback
        displayValue = _safeGetString(item['brand'], 'name') ?? '';
      } else if (label == 'model') {
        // PRIMARY: Second word of full title for accuracy
        final itemName = item['name']?.toString() ?? '';
        final parts = itemName.split(' ').where((p) => p.isNotEmpty).toList();
        if (parts.length > 1) {
          displayValue = parts[1];
        } else {
          // SECONDARY: brand_model name
          displayValue = _safeGetString(item['brand_model'], 'name') ?? '';
        }
      } else {
        // Standard lookup for other fields
        displayValue = flattenedItem[field.name.toLowerCase()]?.toString();
      }

      // Add to list, allowing empty strings but handling null/N/A
      if (displayValue != null && displayValue != 'null') {
        specifications.add({
          'title': field.label,
          'value': _formatFieldValue(field, displayValue),
        });
      }
    }

    return specifications.isNotEmpty
        ? specifications
        : _getDefaultSpecifications(item);
  }

  // Robustly extract all possible key-value pairs into a single flat map
  Map<String, dynamic> _getFlattenedItemData(Map<String, dynamic> item) {
    final Map<String, dynamic> flatMap = {};

    // 1. Process top-level keys
    item.forEach((key, value) {
      // Skip large nested objects, but keep their primitive values
      if (value is Map || value is List) return;
      flatMap[key.toLowerCase()] = value;
    });

    // 2. Process special nested objects known to have primitive values
    _processNestedObject(item['brand'], flatMap);
    _processNestedObject(item['brand_model'], flatMap);
    _processNestedObject(item['category'], flatMap);

    return flatMap;
  }

  void _processNestedObject(dynamic obj, Map<String, dynamic> flatMap) {
    if (obj == null) return;
    if (obj is Map<String, dynamic>) {
      obj.forEach((key, value) {
        if (value is Map || value is List) return;
        // Don't overwrite existing top-level keys if they exist
        if (!flatMap.containsKey(key.toLowerCase())) {
          flatMap[key.toLowerCase()] = value;
        }
      });
    }
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
      highlights.add({
        'title': 'Engine',
        'value': '${item['engine_capacity']} L',
      });
    }

    return highlights.isNotEmpty
        ? highlights
        : [
            {'title': 'Model Year', 'value': ''},
            {'title': 'Mileage', 'value': ''},
            {'title': 'Engine', 'value': ''},
          ];
  }

  List<Map<String, String>> _getDefaultSpecifications(
    Map<String, dynamic> item,
  ) {
    final List<Map<String, String>> specs = [];
    final itemName = item['name']?.toString() ?? '';
    final nameParts = itemName.split(' ').where((p) => p.isNotEmpty).toList();

    // 1. Make (STRICT: Brand Object name ONLY)
    specs.add({
      'title': 'Make',
      'value': _safeGetString(item['brand'], 'name') ?? '',
    });

    // 2. Model (PRIMARY: Second word of title)
    if (nameParts.length > 1) {
      specs.add({'title': 'Model', 'value': nameParts[1]});
    } else {
      specs.add({
        'title': 'Model',
        'value': _safeGetString(item['brand_model'], 'name') ?? '',
      });
    }

    // 3. Color
    if (item['color'] != null) {
      specs.add({'title': 'Color', 'value': item['color'].toString()});
    }

    return specs.isNotEmpty
        ? specs
        : [
            {'title': 'Make', 'value': ''},
            {'title': 'Model', 'value': ''},
            {'title': 'Color', 'value': ''},
          ];
  }

  String _formatFieldValue(ItemField field, String value) {
    switch (field.name) {
      case 'mileage':
        return '$value km';
      case 'engine_capacity':
        return '$value L';
      case 'number_of_passengers':
        return '$value seats';
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
