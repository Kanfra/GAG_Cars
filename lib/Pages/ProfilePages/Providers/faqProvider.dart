import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'package:gag_cars_frontend/Pages/Authentication/Services/authService.dart';
import 'package:gag_cars_frontend/Utils/ApiUtils/apiEnpoints.dart';
import 'package:gag_cars_frontend/Utils/ApiUtils/apiUtils.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class FaqProvider with ChangeNotifier {
  final Logger logger = Logger();
  
  List<dynamic> _categories = [];
  List<dynamic> get categories => _categories;
  
  int _selectedCategoryIndex = 0;
  int get selectedCategoryIndex => _selectedCategoryIndex;
  
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  
  String? _error;
  String? get error => _error;
  
  final List<int> _expandedQuestionIndices = [];
  List<int> get expandedQuestionIndices => _expandedQuestionIndices;

  // Get category names for tabs
  List<String> get categoryNames {
    return _categories.map<String>((category) => category['name'] as String).toList();
  }

  // Get FAQs for selected category
  List<dynamic> get currentCategoryFaqs {
    if (_categories.isEmpty) return [];
    return _categories[_selectedCategoryIndex]['faqs'] as List<dynamic>;
  }

  Future<void> loadFaqCategories() async {
    try {
      _setLoading(true);
      _error = null;
      
      final token = await AuthService.getToken();
      
      final response = await http.get(
        Uri.parse('$baseApiUrl${ApiEndpoint.faqCategories}'),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        logger.i("FAQ categories fetched successfully");
        
        // Filter only active categories
        _categories = (responseData['data'] as List)
            .where((category) => category['status'] == 'active')
            .toList();
        
        notifyListeners();
      } else if (response.statusCode == 401) {
        throw Exception('Unauthorized: Invalid or expired token');
      } else {
        throw Exception('Failed to load FAQ categories. Status: ${response.statusCode}');
      }
    } catch (e) {
      _error = e.toString();
      logger.e("Failed to fetch FAQ categories: $e");
      notifyListeners();
    } finally {
      _setLoading(false);
    }
  }

  void selectCategory(int index) {
    if (index >= 0 && index < _categories.length) {
      _selectedCategoryIndex = index;
      _expandedQuestionIndices.clear();
      notifyListeners();
    }
  }

  void toggleQuestionExpansion(int index) {
    if (_expandedQuestionIndices.contains(index)) {
      _expandedQuestionIndices.remove(index);
    } else {
      _expandedQuestionIndices.add(index);
    }
    notifyListeners();
  }

  bool isQuestionExpanded(int index) {
    return _expandedQuestionIndices.contains(index);
  }

  void _setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  void retry() {
    loadFaqCategories();
  }
}