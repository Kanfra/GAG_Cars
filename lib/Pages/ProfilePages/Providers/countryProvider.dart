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
  Country? _selectedCountry;

  // Getters
  List<Country> get countries => List.unmodifiable(_countries);
  bool get isLoading => _isLoading;
  bool get hasError => _hasError;
  String? get errorMessage => _errorMessage;
  bool get isInitialized => _isInitialized;
  Country? get selectedCountry => _selectedCountry;

  // Set selected country
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
      return _countries.firstWhere((country) => 
        country.iso2.toLowerCase() == iso2.toLowerCase());
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

  // Get country by phone code
  Country? getCountryByPhoneCode(String phoneCode) {
    try {
      // Remove + sign if present for comparison
      final cleanPhoneCode = phoneCode.startsWith('+') ? phoneCode.substring(1) : phoneCode;
      return _countries.firstWhere((country) => 
        country.phoneCode == cleanPhoneCode);
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

  // Get countries with popular ones first (Ghana, Nigeria, etc.)
  List<Country> get countriesWithPopularFirst {
    final popularCountryCodes = ['GH', 'NG', 'US', 'GB', 'CA', 'KE', 'ZA'];
    final sortedList = List<Country>.from(_countries);
    
    sortedList.sort((a, b) {
      final aIndex = popularCountryCodes.indexOf(a.iso2);
      final bIndex = popularCountryCodes.indexOf(b.iso2);
      
      // If both are in popular list, sort by popular list order
      if (aIndex != -1 && bIndex != -1) {
        return aIndex.compareTo(bIndex);
      }
      // If only one is in popular list, popular one comes first
      if (aIndex != -1) return -1;
      if (bIndex != -1) return 1;
      
      // Otherwise sort alphabetically
      return a.name.compareTo(b.name);
    });
    
    return sortedList;
  }

  // Load countries from API with better error handling
  Future<void> loadCountries({bool forceRefresh = false}) async {
    // If already loading, return
    if (_isLoading) return;
    
    // If already initialized and not forcing refresh, return
    if (_isInitialized && !forceRefresh) return;

    _isLoading = true;
    _hasError = false;
    _errorMessage = null;
    notifyListeners();

    try {
      final countriesList = await _countryService.fetchCountries();
      
      // Validate response data
      if (countriesList.isNotEmpty) {
        _countries = countriesList;
        _isInitialized = true;
        _hasError = false;
        _errorMessage = null;
        
        // Auto-select Ghana if available and no country is selected
        if (_selectedCountry == null) {
          final ghana = getCountryByIso2('GH');
          if (ghana != null) {
            _selectedCountry = ghana;
          }
        }
      } else {
        _hasError = true;
        _errorMessage = 'No countries data available';
      }
    } on ApiException catch (e) {
      _hasError = true;
      _errorMessage = e.message;
      
      // Handle specific error cases
      if (e.statusCode == 401) {
        _errorMessage = 'Session expired. Please login again.';
      } else if (e.statusCode == 404) {
        _errorMessage = 'Countries endpoint not found.';
      } else if (e.statusCode >= 500) {
        _errorMessage = 'Server error. Please try again later.';
      }
    } catch (e) {
      _hasError = true;
      _errorMessage = 'Failed to load countries: ${e.toString()}';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Initialize countries if not already loaded
  Future<void> ensureCountriesLoaded() async {
    if (!_isInitialized && !_isLoading) {
      await loadCountries();
    }
  }

  // Refresh countries (force reload)
  Future<void> refreshCountries() async {
    await loadCountries(forceRefresh: true);
  }

  // Clear error state
  void clearError() {
    if (_hasError) {
      _hasError = false;
      _errorMessage = null;
      notifyListeners();
    }
  }

  // Clear all data (useful for logout)
  void clearData() {
    _countries = [];
    _isLoading = false;
    _hasError = false;
    _errorMessage = null;
    _isInitialized = false;
    _selectedCountry = null;
    notifyListeners();
  }

  // Get formatted phone code (with + sign)
  String getFormattedPhoneCode(Country country) {
    return '+${country.phoneCode}';
  }

  // Get display text for country (for dropdowns)
  String getCountryDisplayText(Country country) {
    return '${country.name} (+${country.phoneCode})';
  }

  // Check if a country exists
  bool countryExists(String iso2) {
    return _countries.any((country) => country.iso2.toLowerCase() == iso2.toLowerCase());
  }

  // Get countries filtered by search term
  List<Country> searchCountries(String searchTerm) {
    if (searchTerm.isEmpty) return countriesSortedByName;
    
    final lowerSearchTerm = searchTerm.toLowerCase();
    return _countries.where((country) {
      return country.name.toLowerCase().contains(lowerSearchTerm) ||
             country.iso2.toLowerCase().contains(lowerSearchTerm) ||
             country.phoneCode.contains(searchTerm) ||
             country.iso3.toLowerCase().contains(lowerSearchTerm);
    }).toList();
  }
}