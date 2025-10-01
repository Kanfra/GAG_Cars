import 'package:flutter/foundation.dart';
import 'package:gag_cars_frontend/Pages/ProfilePages/Models/countryModel.dart';
import 'package:gag_cars_frontend/Pages/ProfilePages/Services/CountryService/countryService.dart';

class CountryProvider with ChangeNotifier {
  final CountryService _countryService = CountryService();
  
  List<Country> _countries = [];
  bool _isLoading = false;
  bool _hasError = false;
  String? _errorMessage;
  bool _isInitialized = false;
  Country? _selectedCountry; // Add this

  // Getters
  List<Country> get countries => _countries;
  bool get isLoading => _isLoading;
  bool get hasError => _hasError;
  String? get errorMessage => _errorMessage;
  bool get isInitialized => _isInitialized;
  Country? get selectedCountry => _selectedCountry; // Add this

  // Add this method to set selected country
  void setSelectedCountry(Country country) {
    _selectedCountry = country;
    notifyListeners();
  }

  // Get country by ID
  Country? getCountryById(int id) {
    try {
      return _countries.firstWhere((country) => country.id == id);
    } catch (e) {
      return null;
    }
  }

  // Get country by ISO2 code
  Country? getCountryByIso2(String iso2) {
    try {
      return _countries.firstWhere((country) => country.iso2 == iso2.toUpperCase());
    } catch (e) {
      return null;
    }
  }

  // Get country by name
  Country? getCountryByName(String name) {
    try {
      return _countries.firstWhere((country) => 
        country.name.toLowerCase() == name.toLowerCase());
    } catch (e) {
      return null;
    }
  }

  // Get countries sorted by name
  List<Country> get countriesSortedByName {
    final sortedList = List<Country>.from(_countries);
    sortedList.sort((a, b) => a.name.compareTo(b.name));
    return sortedList;
  }

  // Load countries from API
  Future<void> loadCountries() async {
    if (_isLoading) return;

    _isLoading = true;
    _hasError = false;
    _errorMessage = null;
    notifyListeners();

    try {
      final response = await _countryService.fetchCountries();
      _countries = response.data;
      _isInitialized = true;
      _hasError = false;
      _errorMessage = null;
    } on ApiException catch (e) {
      _hasError = true;
      _errorMessage = e.message;
      
      if (e.statusCode == 401) {
        _errorMessage = 'Session expired. Please login again.';
      }
    } catch (e) {
      _hasError = true;
      _errorMessage = 'Failed to load countries. Please try again.';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Refresh countries (force reload)
  Future<void> refreshCountries() async {
    _isInitialized = false;
    await loadCountries();
  }

  // Clear error state
  void clearError() {
    _hasError = false;
    _errorMessage = null;
    notifyListeners();
  }

  // Clear all data (useful for logout)
  void clearData() {
    _countries = [];
    _isLoading = false;
    _hasError = false;
    _errorMessage = null;
    _isInitialized = false;
    _selectedCountry = null; // Add this
    notifyListeners();
  }
}