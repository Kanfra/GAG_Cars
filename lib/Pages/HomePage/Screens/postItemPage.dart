import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gag_cars_frontend/GlobalVariables/colorGlobalVariables.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Models/itemCategoryModel.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Models/makeAndModelModel.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Providers/getItemCategoriesProvider.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Providers/makeAndModelProvider.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Services/CanUploadItemService/canUploadItemService.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Services/VehicleService/vehicleService.dart';
import 'package:gag_cars_frontend/Routes/routeClass.dart';
import 'package:gag_cars_frontend/Utils/WidgetUtils/widgetUtils.dart';
import 'package:gag_cars_frontend/Pages/Authentication/Providers/userProvider.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/Logger.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PostItemPage extends StatefulWidget {
  final bool hasPendingUpload;
  const PostItemPage({
    super.key,
    this.hasPendingUpload = false,
  });

  @override
  State<PostItemPage> createState() => _PostItemPageState();
}

class _PostItemPageState extends State<PostItemPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Controllers
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _itemNameController = TextEditingController();
  final TextEditingController _itemDescriptionController = TextEditingController();
  final TextEditingController _colorController = TextEditingController();

  final Logger logger = Logger();
  
  // State variables
  String selectedColorName = '';
  Color selectedColor = Colors.blue;
  List<XFile> selectedImages = [];
  final ImagePicker picker = ImagePicker();
  String? selectedLocation;
  Position? _currentPosition;
  Map<String, dynamic>? selectedMake;
  VehicleModel? selectedModel;
  ItemCategory? selectedCategory;
  List<String> selectedFeatures = [];
  int year = DateTime.now().year;
  
  // Loading states
  bool _isLoading = false;
  bool _isUploading = false;
  bool _isCheckingUpload = false;

  // Form fields
  Map<String, dynamic> selectedFields = {};

  // Image constants
  static const int minImagesRequired = 4;
  static const int maxImagesAllowed = 10;

  // Predefined colors with names - SAME AS EDIT ITEM PAGE
  final List<Map<String, dynamic>> colorOptions = [
    {'name': 'Red', 'color': Colors.red, 'value': '#FF0000'},
    {'name': 'Dark Red', 'color': Colors.red[700]!, 'value': '#B71C1C'},
    {'name': 'Light Red', 'color': Colors.red[300]!, 'value': '#EF5350'},
    {'name': 'Crimson', 'color': Color(0xFFDC143C), 'value': '#DC143C'},
    {'name': 'Maroon', 'color': Color(0xFF800000), 'value': '#800000'},
    
    {'name': 'Blue', 'color': Colors.blue, 'value': '#2196F3'},
    {'name': 'Dark Blue', 'color': Colors.blue[700]!, 'value': '#1976D2'},
    {'name': 'Light Blue', 'color': Colors.blue[300]!, 'value': '#64B5F6'},
    {'name': 'Navy Blue', 'color': Color(0xFF000080), 'value': '#000080'},
    {'name': 'Sky Blue', 'color': Color(0xFF87CEEB), 'value': '#87CEEB'},
    
    {'name': 'Green', 'color': Colors.green, 'value': '#4CAF50'},
    {'name': 'Dark Green', 'color': Colors.green[700]!, 'value': '#388E3C'},
    {'name': 'Light Green', 'color': Colors.green[300]!, 'value': '#81C784'},
    {'name': 'Forest Green', 'color': Color(0xFF228B22), 'value': '#228B22'},
    {'name': 'Lime Green', 'color': Color(0xFF32CD32), 'value': '#32CD32'},
    
    {'name': 'Yellow', 'color': Colors.yellow, 'value': '#FFEB3B'},
    {'name': 'Gold', 'color': Color(0xFFFFD700), 'value': '#FFD700'},
    {'name': 'Light Yellow', 'color': Colors.yellow[300]!, 'value': '#FFF176'},
    {'name': 'Amber', 'color': Colors.amber, 'value': '#FFC107'},
    
    {'name': 'Orange', 'color': Colors.orange, 'value': '#FF9800'},
    {'name': 'Dark Orange', 'color': Colors.orange[700]!, 'value': '#F57C00'},
    {'name': 'Light Orange', 'color': Colors.orange[300]!, 'value': '#FFB74D'},
    
    {'name': 'Purple', 'color': Colors.purple, 'value': '#9C27B0'},
    {'name': 'Dark Purple', 'color': Colors.purple[700]!, 'value': '#7B1FA2'},
    {'name': 'Light Purple', 'color': Colors.purple[300]!, 'value': '#BA68C8'},
    {'name': 'Violet', 'color': Color(0xFFEE82EE), 'value': '#EE82EE'},
    
    {'name': 'Pink', 'color': Colors.pink, 'value': '#E91E63'},
    {'name': 'Hot Pink', 'color': Color(0xFFFF69B4), 'value': '#FF69B4'},
    {'name': 'Light Pink', 'color': Colors.pink[300]!, 'value': '#F06292'},
    
    {'name': 'Brown', 'color': Colors.brown, 'value': '#795548'},
    {'name': 'Dark Brown', 'color': Colors.brown[700]!, 'value': '#5D4037'},
    {'name': 'Light Brown', 'color': Colors.brown[300]!, 'value': '#A1887F'},
    {'name': 'Tan', 'color': Color(0xFFD2B48C), 'value': '#D2B48C'},
    
    {'name': 'Gray', 'color': Colors.grey, 'value': '#9E9E9E'},
    {'name': 'Dark Gray', 'color': Colors.grey[700]!, 'value': '#616161'},
    {'name': 'Light Gray', 'color': Colors.grey[300]!, 'value': '#E0E0E0'},
    {'name': 'Silver', 'color': Color(0xFFC0C0C0), 'value': '#C0C0C0'},
    {'name': 'Charcoal', 'color': Color(0xFF36454F), 'value': '#36454F'},
    
    {'name': 'Black', 'color': Colors.black, 'value': '#000000'},
    {'name': 'White', 'color': Colors.white, 'value': '#FFFFFF'},
    {'name': 'Ivory', 'color': Color(0xFFFFFFF0), 'value': '#FFFFF0'},
    {'name': 'Beige', 'color': Color(0xFFF5F5DC), 'value': '#F5F5DC'},
    
    {'name': 'Teal', 'color': Colors.teal, 'value': '#009688'},
    {'name': 'Cyan', 'color': Colors.cyan, 'value': '#00BCD4'},
    {'name': 'Turquoise', 'color': Color(0xFF40E0D0), 'value': '#40E0D0'},
    
    {'name': 'Indigo', 'color': Colors.indigo, 'value': '#3F51B5'},
    {'name': 'Magenta', 'color': Color(0xFFFF00FF), 'value': '#FF00FF'},
    {'name': 'Lavender', 'color': Color(0xFFE6E6FA), 'value': '#E6E6FA'},
    {'name': 'Mint', 'color': Color(0xFF98FB98), 'value': '#98FB98'},
    {'name': 'Olive', 'color': Color(0xFF808000), 'value': '#808000'},
    {'name': 'Coral', 'color': Color(0xFFFF7F50), 'value': '#FF7F50'},
    {'name': 'Salmon', 'color': Color(0xFFFA8072), 'value': '#FA8072'},
    {'name': 'Peach', 'color': Color(0xFFFFDAB9), 'value': '#FFDAB9'},
    {'name': 'Burgundy', 'color': Color(0xFF800020), 'value': '#800020'},
    {'name': 'Mustard', 'color': Color(0xFFFFDB58), 'value': '#FFDB58'},
  ];

  @override
  void initState() {
    super.initState();
    _loadInitialData();
  }

  @override
  void dispose() {
    _priceController.dispose();
    _itemNameController.dispose();
    _itemDescriptionController.dispose();
    _colorController.dispose();
    super.dispose();
  }

  // Theme helper methods
  bool get _isDarkMode => Theme.of(context).brightness == Brightness.dark;
  
  Color _getBackgroundColor() {
    return _isDarkMode ? const Color(0xFF303030) : const Color(0xFFFAFAFA);
  }
  
  Color _getCardColor() {
    return _isDarkMode ? const Color(0xFF424242) : Colors.white;
  }
  
  Color _getTextColor() {
    return _isDarkMode ? const Color(0xB3FFFFFF) : const Color(0xDD000000);
  }
  
  Color _getHintTextColor() {
    return _isDarkMode ? const Color(0x66FFFFFF) : const Color(0x8A000000);
  }
  
  Color _getBorderColor() {
    return _isDarkMode ? const Color(0xFF616161) : const Color(0xFFE0E0E0);
  }
  
  Color _getInputBackgroundColor() {
    return _isDarkMode ? const Color(0xFF424242) : const Color(0xFFF5F5F5);
  }
  
  Color _getDialogBackgroundColor() {
    return _isDarkMode ? const Color(0xFF424242) : Colors.white;
  }
  
  Color _getDialogSurfaceColor() {
    return _isDarkMode ? const Color(0xFF303030) : const Color(0xFFFAFAFA);
  }

  Future<void> _loadInitialData() async {
    logger.i("Loading initial data...");
    setState(() => _isLoading = true);
    try {
      final itemCategoriesProvider = Provider.of<ItemCategoriesProvider>(context, listen: false);
      final makeModelProvider = Provider.of<MakeAndModelProvider>(context, listen: false);
      
      await Future.wait([
        itemCategoriesProvider.getAllCategories(),
        makeModelProvider.fetchMakesWithModels(),
      ]);
      logger.i("Initial data loaded successfully");
    } catch (e) {
      _showErrorSnackBar('Failed to load data: ${e.toString()}');
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  Future<Map<String, dynamic>> _checkCanUpload() async {
    if (mounted) {
      setState(() => _isCheckingUpload = true);
    }
    
    try {
      if (selectedCategory?.id == null) {
        return {
          'can_upload': false,
          'reason': 'No category selected',
          'error': 'Please select a category first'
        };
      }

      final canUploadService = CanUploadItemService();
      final result = await canUploadService.checkCanUpload(
        categoryId: selectedCategory!.id,
      );
      
      final bool canUpload = result['can_upload'] ?? false;
      final String reason = result['reason'] ?? 'No reason provided';
      
      return {
        'can_upload': canUpload,
        'reason': reason,
        'error': null
      };
      
    } catch (e) {
      String errorMessage = 'Unable to verify upload permissions';
      
      if (e.toString().contains('Unauthorized')) {
        errorMessage = 'Please login again to continue';
      } else if (e.toString().contains('Network error')) {
        errorMessage = 'Please check your internet connection';
      }
      
      return {
        'can_upload': false,
        'reason': 'Service unavailable',
        'error': errorMessage
      };
    } finally {
      if (mounted) {
        setState(() => _isCheckingUpload = false);
      }
    }
  }

  Map<String, dynamic> _prepareVehicleData() {
    Map<String, dynamic> normalizedFields = {};
    
    if (_colorController.text.trim().isNotEmpty) {
      normalizedFields['color'] = _colorController.text.trim();
    }
    
    if (year.toString().isNotEmpty) {
      normalizedFields['year'] = year.toString().trim();
    }

    normalizedFields.addAll(selectedFields.map((key, value) => 
      MapEntry(key.toLowerCase().replaceAll(' ', '_'), value)));

    return {
      'category_id': selectedCategory?.id,
      'brand_id': selectedMake?["id"],
      'brand_model_id': selectedModel?.id, 
      'name': _itemNameController.text.trim(),
      'slug': _createSlug(_itemNameController.text.trim()),
      ...normalizedFields,
      'location': selectedLocation,
      'price': _priceController.text.trim(),
      'description': _itemDescriptionController.text.trim(),
      'features': selectedFeatures,
      'images': selectedImages.map((xFile) => xFile.path).toList(),
    };
  }

  Future<void> _uploadVehicleWithData(Map<String, dynamic> vehicleData) async {
    logger.i("Starting vehicle upload with prepared data...");
    
    try {
      // Process and validate images
      List<File> imageFiles = [];
      for (var imagePath in vehicleData['images']) {
        final file = File(imagePath.toString());
        if (await file.exists()) {
          imageFiles.add(file);
        } else {
          throw Exception('One or more selected images are no longer available');
        }
      }

      if (imageFiles.length < minImagesRequired) { 
        throw Exception('At least $minImagesRequired valid images are required');
      }

      // Prepare final request body
      final requestBody = {
        'category_id': vehicleData['category_id'],
        'brand_id': vehicleData['brand_id'],
        'brand_model_id': vehicleData['brand_model_id'], 
        'name': vehicleData['name'],
        'slug': vehicleData['slug'],
        ...vehicleData,
        'location': vehicleData['location'],
        'price': vehicleData['price'],
        'description': vehicleData['description'],
        'features': vehicleData['features'],
        'images': imageFiles
      };
      
      await VehicleService.uploadVehicle(requestBody: requestBody);
      
      logger.i("Vehicle uploaded successfully");
      
    } catch (e) {
      logger.e("Error in _uploadVehicleWithData: $e");
      rethrow;
    }
  }

  Future<void> _storeVehicleDataForLater() async {
    final vehicleData = _prepareVehicleData();
    final prefs = await SharedPreferences.getInstance();
    
    // Store both the data and a flag
    await prefs.setString('pending_vehicle_data', json.encode(vehicleData));
    await prefs.setBool('pending_upload', true);
    
    logger.i("Vehicle data stored for later upload");
  }

  Future<void> _navigateToPromotionsPage() async {
    await _storeVehicleDataForLater();
    
    // Navigate to promotions page
    final result = await Get.toNamed(
      RouteClass.getPromotionsPage(),
      arguments: {
        'type': 'upload',
      },
    );
    
    // Handle payment result - if payment was successful, the upload will happen in WebViewPaymentPage
    // No need to process anything here as the flow continues in WebViewPaymentPage
    if (result == true && mounted) {
      logger.i("Payment completed, upload should be in progress");
    }
  }

  void _navigateToMyListings() {
    Get.offAllNamed(RouteClass.getMyListingPage());
  }

  String _createSlug(String name) {
    return '${name.toLowerCase().replaceAll(' ', '-')}-${DateTime.now().millisecondsSinceEpoch}';
  }

  bool _validateRequiredFields() {
    if (selectedCategory == null) {
      _showErrorSnackBar('Please select a category');
      return false;
    }
    
    if (selectedMake == null) {
      _showErrorSnackBar('Please select a vehicle make');
      return false;
    }
    
    if (selectedModel == null) {
      _showErrorSnackBar('Please select a vehicle model');
      return false;
    }
    
    if (selectedLocation == null) {
      _showErrorSnackBar('Please select a location');
      return false;
    }
    
    return true;
  }

  void _showErrorSnackBar(String message) {
    showCustomSnackBar(
      backgroundColor: ColorGlobalVariables.redColor,
      title: "Error",
      message: message
    );
  }

  void _showSuccessSnackBar(String message) {
    showCustomSnackBar(
      backgroundColor: ColorGlobalVariables.greenColor,
      title: "Success",
      message: message
    );
  }

  void _clearAllFormFields() {
    logger.i("Clearing all form fields after successful upload...");
    
    _priceController.clear();
    _itemNameController.clear();
    _itemDescriptionController.clear();
    _colorController.clear();
    
    setState(() {
      selectedColorName = '';
      selectedColor = Colors.blue;
      selectedImages = [];
      selectedLocation = null;
      _currentPosition = null;
      selectedMake = null;
      selectedModel = null;
      selectedCategory = null;
      selectedFeatures = [];
      year = DateTime.now().year;
      selectedFields = {};
    });
    
    _formKey.currentState?.reset();
    
    logger.i("All form fields cleared successfully after upload");
  }

  Future<void> _formValidation() async {
    if (!_formKey.currentState!.validate()) {
      _showErrorSnackBar('Please correct the errors in the form');
      return;
    }

    if (selectedImages.length < minImagesRequired || selectedImages.length > maxImagesAllowed) {
      _showErrorSnackBar('Please upload between $minImagesRequired and $maxImagesAllowed images');
      return;
    }
    
    if (!_validateRequiredFields()) {
      return;
    }
    
    setState(() => _isUploading = true);
    
    try {
      final uploadCheckResult = await _checkCanUpload();
      final bool canUpload = uploadCheckResult['can_upload'] ?? false;
      final String? error = uploadCheckResult['error'];
      
      if (error != null) {
        _showErrorSnackBar(error);
        return;
      }
      
      if (canUpload) {
        // Free category - direct upload
        logger.i("Free category - uploading directly");
        final vehicleData = _prepareVehicleData();
        await _uploadVehicleWithData(vehicleData);
        
        _showSuccessSnackBar('Vehicle listed successfully');
        _clearAllFormFields();
        _navigateToMyListings();
        
      } else {
        // Premium category - payment required
        logger.i("Premium category - navigating to payment");
        _showSuccessSnackBar("Purchase an upload package to list in this category");
        await _navigateToPromotionsPage();
      }
    } catch (e) {
      String errorMessage = 'Failed to process your request';
      
      if (e.toString().contains('Unauthorized')) {
        errorMessage = 'Please login again to continue';
      } else if (e.toString().contains('Network error')) {
        errorMessage = 'Please check your internet connection';
      }
      
      _showErrorSnackBar('$errorMessage: ${e.toString()}');
    } finally {
      if (mounted) {
        setState(() => _isUploading = false);
      }
    }
  }

  // =============================================
  // FIXED COLOR PICKER - WITH DARK THEME SUPPORT
  // =============================================

  void _showSimpleColorPicker() {
    final searchController = TextEditingController();
    final filteredColors = ValueNotifier<List<Map<String, dynamic>>>(colorOptions);
    final dialogSelectedColorName = ValueNotifier<String>(selectedColorName);
    final dialogSelectedColor = ValueNotifier<Color>(selectedColor);

    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: _getDialogBackgroundColor(),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(28),
        ),
        elevation: 25,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.7,
            maxWidth: MediaQuery.of(context).size.width * 0.9,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Header Section
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      ColorGlobalVariables.brownColor.withOpacity(0.15),
                      ColorGlobalVariables.brownColor.withOpacity(0.08),
                    ],
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(28),
                    topRight: Radius.circular(28),
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            ColorGlobalVariables.brownColor,
                            ColorGlobalVariables.brownColor.withOpacity(0.7),
                          ],
                        ),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: ColorGlobalVariables.brownColor.withOpacity(0.4),
                            blurRadius: 15,
                            offset: const Offset(0, 6),
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.palette_rounded,
                        color: Colors.white,
                        size: 28,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Select Color',
                      style: TextStyle(
                        color: _getTextColor(),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Choose from common color names',
                      style: TextStyle(
                        color: _getHintTextColor(),
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),

              // Selected Color Preview
              ValueListenableBuilder<String>(
                valueListenable: dialogSelectedColorName,
                builder: (context, colorName, child) {
                  return ValueListenableBuilder<Color>(
                    valueListenable: dialogSelectedColor,
                    builder: (context, color, child) {
                      if (colorName.isEmpty) return const SizedBox();
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: _getInputBackgroundColor(),
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: _getBorderColor(),
                              width: 1.5,
                            ),
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: color,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: _getBorderColor(),
                                    width: 2,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      blurRadius: 6,
                                      offset: const Offset(0, 3),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Selected Color',
                                      style: TextStyle(
                                        color: _getHintTextColor(),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const SizedBox(height: 2),
                                    Text(
                                      colorName,
                                      style: TextStyle(
                                        color: _getTextColor(),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),

              // Search Section
              Padding(
                padding: const EdgeInsets.all(16),
                child: Container(
                  decoration: BoxDecoration(
                    color: _getInputBackgroundColor(),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.08),
                        blurRadius: 8,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                      hintText: 'Search colors... (e.g., red, blue, dark)',
                      prefixIcon: Container(
                        margin: const EdgeInsets.all(12),
                        child: Icon(
                          Icons.search_rounded, 
                          color: ColorGlobalVariables.brownColor,
                          size: 20,
                        ),
                      ),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                      hintStyle: TextStyle(
                        color: _getHintTextColor(),
                        fontSize: 14,
                      ),
                    ),
                    style: TextStyle(
                      color: _getTextColor(),
                      fontSize: 14,
                    ),
                    onChanged: (value) {
                      filteredColors.value = colorOptions.where((color) {
                        final colorName = color['name'].toString().toLowerCase();
                        return colorName.contains(value.toLowerCase());
                      }).toList();
                    },
                  ),
                ),
              ),

              // Colors Grid
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: ValueListenableBuilder<List<Map<String, dynamic>>>(
                    valueListenable: filteredColors,
                    builder: (context, filteredColors, child) {
                      if (filteredColors.isEmpty) {
                        return _buildColorEmptyState();
                      }
                      
                      return ValueListenableBuilder<String>(
                        valueListenable: dialogSelectedColorName,
                        builder: (context, selectedName, child) {
                          return GridView.builder(
                            padding: const EdgeInsets.only(bottom: 16),
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 8,
                              mainAxisSpacing: 8,
                              childAspectRatio: 0.85,
                            ),
                            itemCount: filteredColors.length,
                            itemBuilder: (context, index) {
                              final colorOption = filteredColors[index];
                              final isSelected = selectedName == colorOption['name'];
                              
                              return _buildColorOptionItem(
                                colorOption, 
                                isSelected,
                                onTap: () {
                                  dialogSelectedColorName.value = colorOption['name'];
                                  dialogSelectedColor.value = colorOption['color'];
                                }
                              );
                            },
                          );
                        },
                      );
                    },
                  ),
                ),
              ),

              // Footer Section
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: _getInputBackgroundColor(),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(28),
                    bottomRight: Radius.circular(28),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: _getBorderColor(),
                          width: 1.5,
                        ),
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(14),
                          onTap: () => Navigator.pop(context),
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                            child: Text(
                              'Cancel',
                              style: TextStyle(
                                color: _getHintTextColor(),
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    ValueListenableBuilder<String>(
                      valueListenable: dialogSelectedColorName,
                      builder: (context, colorName, child) {
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                ColorGlobalVariables.brownColor,
                                ColorGlobalVariables.brownColor.withOpacity(0.8),
                              ],
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: ColorGlobalVariables.brownColor.withOpacity(0.4),
                                blurRadius: 8,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(14),
                              onTap: () {
                                if (colorName.isNotEmpty) {
                                  setState(() {
                                    selectedColorName = colorName;
                                    selectedColor = dialogSelectedColor.value;
                                    _colorController.text = colorName;
                                    
                                    // Also update the selectedFields for the form field
                                    for (final field in selectedCategory?.itemFields ?? []) {
                                      if (field.label.toLowerCase().contains("color")) {
                                        selectedFields[field.name] = colorName;
                                      }
                                    }
                                  });
                                  Navigator.pop(context);
                                }
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 12),
                                child: Text(
                                  'Confirm',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildColorOptionItem(
    Map<String, dynamic> colorOption, 
    bool isSelected, {
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: _getCardColor(),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isSelected ? ColorGlobalVariables.brownColor : _getBorderColor(),
              width: isSelected ? 2.5 : 1.2,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 6,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: colorOption['color'],
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: _getBorderColor(),
                    width: 1.5,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: isSelected
                    ? Icon(
                        Icons.check_rounded,
                        color: _getContrastColor(colorOption['color']),
                        size: 18,
                      )
                    : null,
              ),
              const SizedBox(height: 6),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Text(
                  colorOption['name'],
                  style: TextStyle(
                    color: _getTextColor(),
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildColorEmptyState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                color: _getInputBackgroundColor(),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.color_lens_rounded,
                size: 35,
                color: _getHintTextColor(),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'No colors found',
              style: TextStyle(
                color: _getHintTextColor(),
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              'Try searching with different keywords',
              style: TextStyle(
                color: _getHintTextColor(),
                fontSize: 13,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  // =============================================
  // FIXED YEAR PICKER - WITH DARK THEME SUPPORT
  // =============================================

  void _showBeautifulYearPicker() {
    final currentYear = DateTime.now().year;
    final years = List.generate(50, (index) => currentYear - index);
    final dialogSelectedYear = ValueNotifier<int>(year);

    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: _getDialogBackgroundColor(),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(28),
        ),
        elevation: 25,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.8,
            maxWidth: MediaQuery.of(context).size.width * 0.9,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(28),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      ColorGlobalVariables.brownColor.withOpacity(0.15),
                      ColorGlobalVariables.brownColor.withOpacity(0.08),
                    ],
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(28),
                    topRight: Radius.circular(28),
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            ColorGlobalVariables.brownColor,
                            ColorGlobalVariables.brownColor.withOpacity(0.7),
                          ],
                        ),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: ColorGlobalVariables.brownColor.withOpacity(0.4),
                            blurRadius: 15,
                            offset: const Offset(0, 6),
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.calendar_today_rounded,
                        color: Colors.white,
                        size: 36,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Select Year',
                      style: TextStyle(
                        color: _getTextColor(),
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Choose the manufacturing year of your vehicle',
                      style: TextStyle(
                        color: _getHintTextColor(),
                        fontSize: 15,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    decoration: BoxDecoration(
                      color: _getCardColor(),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: _getBorderColor(),
                        width: 2,
                      ),
                    ),
                    child: ValueListenableBuilder<int>(
                      valueListenable: dialogSelectedYear,
                      builder: (context, selectedYear, child) {
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemCount: years.length,
                          itemBuilder: (context, index) {
                            final yearValue = years[index];
                            final isSelected = selectedYear == yearValue;
                            
                            return Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () {
                                  dialogSelectedYear.value = yearValue;
                                },
                                borderRadius: BorderRadius.circular(12),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
                                  decoration: BoxDecoration(
                                    color: isSelected 
                                        ? ColorGlobalVariables.brownColor.withOpacity(0.1)
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(12),
                                    border: isSelected
                                        ? Border.all(
                                            color: ColorGlobalVariables.brownColor,
                                            width: 2,
                                          )
                                        : null,
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 40,
                                        height: 40,
                                        decoration: BoxDecoration(
                                          color: isSelected
                                              ? ColorGlobalVariables.brownColor
                                              : _getInputBackgroundColor(),
                                          shape: BoxShape.circle,
                                        ),
                                        child: Icon(
                                          isSelected ? Icons.check_rounded : Icons.calendar_today_rounded,
                                          color: isSelected ? Colors.white : _getHintTextColor(),
                                          size: 20,
                                        ),
                                      ),
                                      const SizedBox(width: 16),
                                      Expanded(
                                        child: Text(
                                          yearValue.toString(),
                                          style: TextStyle(
                                            color: isSelected 
                                                ? ColorGlobalVariables.brownColor
                                                : _getTextColor(),
                                            fontSize: 18,
                                            fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                      if (isSelected)
                                        Icon(
                                          Icons.check_circle_rounded,
                                          color: ColorGlobalVariables.brownColor,
                                          size: 24,
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
              ),
              
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: _getInputBackgroundColor(),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(28),
                    bottomRight: Radius.circular(28),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: _getBorderColor(),
                          width: 1.5,
                        ),
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(16),
                          onTap: () => Navigator.pop(context),
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
                            child: Text(
                              'Cancel',
                              style: TextStyle(
                                color: _getHintTextColor(),
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    ValueListenableBuilder<int>(
                      valueListenable: dialogSelectedYear,
                      builder: (context, selectedYear, child) {
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                ColorGlobalVariables.brownColor,
                                ColorGlobalVariables.brownColor.withOpacity(0.8),
                              ],
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: ColorGlobalVariables.brownColor.withOpacity(0.4),
                                blurRadius: 12,
                                offset: const Offset(0, 6),
                              ),
                            ],
                          ),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(16),
                              onTap: () {
                                setState(() {
                                  year = selectedYear;
                                  
                                  // Also update the selectedFields for the form field
                                  for (final field in selectedCategory?.itemFields ?? []) {
                                    if (field.label.toLowerCase().contains("year")) {
                                      selectedFields[field.name] = selectedYear.toString();
                                    }
                                  }
                                });
                                Navigator.pop(context);
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
                                child: Text(
                                  'Confirm',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _getContrastColor(Color backgroundColor) {
    final luminance = (0.299 * backgroundColor.red + 0.587 * backgroundColor.green + 0.114 * backgroundColor.blue) / 255;
    return luminance > 0.5 ? Colors.black : Colors.white;
  }

  // ========== UI BUILDING METHODS ==========

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: _isDarkMode ? const Color(0xFF424242) : Colors.white,
      elevation: 0,
      title: Text(
        'Post New Item',
        style: TextStyle(
          color: _isDarkMode ? Colors.white : ColorGlobalVariables.brownColor,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
    );
  }

  Widget _buildLoadingIndicator() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: ColorGlobalVariables.brownColor.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: const SpinKitDoubleBounce(
              color: ColorGlobalVariables.brownColor,
              size: 50,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Loading Categories...',
            style: TextStyle(
              color: ColorGlobalVariables.brownColor,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMainContent() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: _isDarkMode 
              ? [
                  const Color(0xFF303030),
                  const Color(0xFF424242),
                ]
              : [
                  Colors.white,
                  Colors.grey.shade50,
                ],
        ),
      ),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    _buildCategoryField(),
                    const SizedBox(height: 20),
                    if (selectedCategory != null) ..._buildFormFields(),
                  ],
                ),
              ),
            ),
            if (selectedCategory != null) _buildUploadButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryField() {
    final provider = Provider.of<ItemCategoriesProvider>(context);
    
    return Container(
      decoration: BoxDecoration(
        color: _getCardColor(),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 20,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () => _showCategorySelectionDialog(provider.categories?.data ?? []),
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        ColorGlobalVariables.brownColor.withOpacity(0.2),
                        ColorGlobalVariables.brownColor.withOpacity(0.1),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Icon(
                    Icons.category_rounded,
                    color: ColorGlobalVariables.brownColor,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Category',
                        style: TextStyle(
                          color: _getHintTextColor(),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        selectedCategory?.name ?? "Select a Category",
                        style: TextStyle(
                          color: selectedCategory != null 
                            ? _getTextColor() 
                            : _getHintTextColor(),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.arrow_drop_down_rounded,
                  color: _getHintTextColor(),
                  size: 24,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildFormFields() {
    final makeModelProvider = Provider.of<MakeAndModelProvider>(context);
    
    return [
      _buildTextField(
        title: "${selectedCategory?.name ?? 'Item'} Name",
        hintText: "Enter ${selectedCategory?.name.toLowerCase() ?? 'item'} name",
        controller: _itemNameController,
        icon: Icons.directions_car_rounded,
      ),
      const SizedBox(height: 20),
      _buildMakeModelRow(makeModelProvider),
      const SizedBox(height: 20),
      _buildFormFieldsGrid(),
      const SizedBox(height: 20),
      _buildLocationAndPrice(),
      const SizedBox(height: 20),
      _buildFeatures(),
      const SizedBox(height: 20),
      _buildTextField(
        title: "Description",
        hintText: "Enter description",
        isFieldHeightRequired: true,
        controller: _itemDescriptionController,
        icon: Icons.description_rounded,
      ),
      const SizedBox(height: 20),
      _buildImagePickerSection(),
      const SizedBox(height: 20),
    ];
  }

  Widget _buildTextField({
    required String title,
    required String hintText,
    required TextEditingController controller,
    bool isFieldHeightRequired = false,
    required IconData icon,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: _getCardColor(),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 20,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      ColorGlobalVariables.brownColor.withOpacity(0.2),
                      ColorGlobalVariables.brownColor.withOpacity(0.1),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  icon,
                  color: ColorGlobalVariables.brownColor,
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),
              Text(
                title,
                style: TextStyle(
                  color: _getTextColor(),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            decoration: BoxDecoration(
              color: _getInputBackgroundColor(),
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: _getBorderColor(),
                width: 1.5,
              ),
            ),
            child: TextFormField(
              controller: controller,
              maxLines: isFieldHeightRequired ? 4 : 1,
              style: TextStyle(
                color: _getTextColor(),
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hintText,
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                hintStyle: TextStyle(
                  color: _getHintTextColor(),
                  fontSize: 15,
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter $title";
                }
                return null;
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMakeModelRow(MakeAndModelProvider provider) {
    return Container(
      decoration: BoxDecoration(
        color: _getCardColor(),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 20,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      ColorGlobalVariables.brownColor.withOpacity(0.2),
                      ColorGlobalVariables.brownColor.withOpacity(0.1),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  Icons.business_center_rounded,
                  color: ColorGlobalVariables.brownColor,
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),
              Text(
                "Make & Model",
                style: TextStyle(
                  color: _getTextColor(),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _buildMakeField(provider),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildModelField(provider),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMakeField(MakeAndModelProvider provider) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Make',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: _getTextColor(),
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 8),
        Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(15),
            onTap: () => _showMakeSelectionDialog(provider.makes ?? []),
            child: Container(
              height: 56,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: _getInputBackgroundColor(),
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: _getBorderColor(),
                  width: 1.5,
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      selectedMake?['name'] ?? "Select Make",
                      style: TextStyle(
                        color: selectedMake != null 
                          ? _getTextColor() 
                          : _getHintTextColor(),
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.arrow_drop_down_rounded,
                    color: _getHintTextColor(),
                    size: 24,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildModelField(MakeAndModelProvider provider) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Model',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: _getTextColor(),
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 8),
        Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(15),
            onTap: () {
              if (selectedMake == null) {
                _showErrorSnackBar("Select a Make first");
                return;
              }
              _showModelSelectionDialog(provider.getModelsForMake(selectedMake!['id']));
            },
            child: Container(
              height: 56,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: _getInputBackgroundColor(),
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: _getBorderColor(),
                  width: 1.5,
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      selectedModel?.name ?? "Select Model",
                      style: TextStyle(
                        color: selectedModel != null 
                          ? _getTextColor() 
                          : _getHintTextColor(),
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.arrow_drop_down_rounded,
                    color: _getHintTextColor(),
                    size: 24,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFormFieldsGrid() {
    final itemFields = selectedCategory?.itemFields ?? [];
    if (itemFields.isEmpty) return const SizedBox();

    return Container(
      decoration: BoxDecoration(
        color: _getCardColor(),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 20,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      ColorGlobalVariables.brownColor.withOpacity(0.2),
                      ColorGlobalVariables.brownColor.withOpacity(0.1),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  Icons.tune_rounded,
                  color: ColorGlobalVariables.brownColor,
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),
              Text(
                "${selectedCategory?.name ?? 'Item'} Details",
                style: TextStyle(
                  color: _getTextColor(),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 1.7,
            ),
            itemCount: itemFields.length,
            itemBuilder: (context, index) {
              final field = itemFields[index];
              final currentValue = selectedFields[field.name] ?? 
                (field.label.toLowerCase().contains("color") ? _colorController.text : 
                 field.label.toLowerCase().contains("year") ? year.toString() : "");

              return _buildFormFieldItem(field, currentValue);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildFormFieldItem(ItemField field, String currentValue) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          field.label,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: _getTextColor(),
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 8),
        Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: () {
              if (field.type == "string" || field.type == "number") {
                _showFieldInputDialog(field.label, field.name, field.type);
              } else if (field.type == "enum") {
                _showSelectionDialog(field.options ?? [], field.name);
              } else if (field.type == "year") {
                _showBeautifulYearPicker();
              } else if (field.type == "json") {
                _showSimpleColorPicker(); // Use the fixed color picker
              }
            },
            child: Container(
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: _getInputBackgroundColor(),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: _getBorderColor(),
                  width: 1.5,
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      currentValue.isNotEmpty ? currentValue : "Select ${field.label}",
                      style: TextStyle(
                        color: currentValue.isNotEmpty 
                          ? _getTextColor() 
                          : _getHintTextColor(),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.arrow_drop_down_rounded,
                    color: _getHintTextColor(),
                    size: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLocationAndPrice() {
    return Container(
      decoration: BoxDecoration(
        color: _getCardColor(),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 20,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      ColorGlobalVariables.brownColor.withOpacity(0.2),
                      ColorGlobalVariables.brownColor.withOpacity(0.1),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  Icons.location_on_rounded,
                  color: ColorGlobalVariables.brownColor,
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),
              Text(
                "Location & Price",
                style: TextStyle(
                  color: _getTextColor(),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _buildLocationField(),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildPriceField(context),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLocationField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Location',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: _getTextColor(),
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 8),
        Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(15),
            onTap: () async {
              final result = await Get.toNamed(RouteClass.getLocationSearchPage());
              if (result != null && mounted) {
                setState(() {
                  _currentPosition = result['position'];
                  selectedLocation = result['locationName'];
                });
              }
            },
            child: Container(
              height: 56,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: _getInputBackgroundColor(),
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: _getBorderColor(),
                  width: 1.5,
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.location_on_rounded,
                    color: _getHintTextColor(),
                    size: 20,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      selectedLocation ?? "Search Location",
                      style: TextStyle(
                        color: selectedLocation != null 
                          ? _getTextColor() 
                          : _getHintTextColor(),
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPriceField(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Price',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: _getTextColor(),
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          height: 56,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: _getInputBackgroundColor(),
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: _getBorderColor(),
              width: 1.5,
            ),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: ColorGlobalVariables.brownColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  userProvider.user?.countryCurrencySymbol ?? '',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: TextFormField(
                  controller: _priceController,
                  keyboardType: TextInputType.number,
                  style: TextStyle(
                    color: _getTextColor(),
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter price',
                    hintStyle: TextStyle(
                      color: _getHintTextColor(),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter price";
                    }
                    if (double.tryParse(value) == null) {
                      return "Please enter a valid price";
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFeatures() {
    final hasFeatures = selectedCategory?.features.isNotEmpty ?? false;
    if (!hasFeatures) return const SizedBox();
    
    return Container(
      decoration: BoxDecoration(
        color: _getCardColor(),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 20,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      ColorGlobalVariables.brownColor.withOpacity(0.2),
                      ColorGlobalVariables.brownColor.withOpacity(0.1),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  Icons.featured_play_list_rounded,
                  color: ColorGlobalVariables.brownColor,
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),
              Text(
                'Features',
                style: TextStyle(
                  color: _getTextColor(),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: selectedCategory!.features.map((feature) => _buildFeatureChip(feature)).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureChip(String feature) {
    final isSelected = selectedFeatures.contains(feature);
    
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(25),
        onTap: () => setState(() => _toggleFeature(feature)),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          decoration: BoxDecoration(
            gradient: isSelected 
                ? LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      ColorGlobalVariables.brownColor,
                      ColorGlobalVariables.brownColor.withOpacity(0.8),
                    ],
                  )
                : null,
            color: isSelected ? null : _getCardColor(),
            borderRadius: BorderRadius.circular(25),
            border: Border.all(
              color: isSelected ? ColorGlobalVariables.brownColor : _getBorderColor(),
              width: 2,
            ),
          ),
          child: Text(
            feature,
            style: TextStyle(
              color: isSelected ? Colors.white : _getTextColor(),
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildImagePickerSection() {
    return Container(
      decoration: BoxDecoration(
        color: _getCardColor(),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 20,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      ColorGlobalVariables.brownColor.withOpacity(0.2),
                      ColorGlobalVariables.brownColor.withOpacity(0.1),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  Icons.photo_library_rounded,
                  color: ColorGlobalVariables.brownColor,
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),
              Text(
                "${selectedCategory?.name ?? 'Item'} Images",
                style: TextStyle(
                  color: _getTextColor(),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            "Tap to add images ($minImagesRequired-$maxImagesAllowed required)",
            style: TextStyle(
              color: _getHintTextColor(),
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 16),
          Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(20),
              onTap: _pickImages,
              child: Container(
                height: 240,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: _getInputBackgroundColor(),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: _getBorderColor(),
                    width: 2,
                  ),
                ),
                child: selectedImages.isEmpty 
                  ? _buildEmptyImageState()
                  : _buildImageGrid(),
              ),
            ),
          ),
          if (selectedImages.isNotEmpty) ...[
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${selectedImages.length}/$maxImagesAllowed images selected',
                  style: TextStyle(
                    color: selectedImages.length >= minImagesRequired 
                      ? ColorGlobalVariables.greenColor 
                      : ColorGlobalVariables.redColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(12),
                    onTap: () => setState(() => selectedImages = []),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: ColorGlobalVariables.redColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: ColorGlobalVariables.redColor,
                          width: 1,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.delete_outline_rounded,
                            color: ColorGlobalVariables.redColor,
                            size: 18,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            "Clear All",
                            style: TextStyle(
                              color: ColorGlobalVariables.redColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildEmptyImageState() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.add_photo_alternate_rounded,
          size: 50,
          color: _getHintTextColor(),
        ),
        const SizedBox(height: 12),
        Text(
          "Tap to Add Images",
          style: TextStyle(
            color: _getHintTextColor(),
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          "$minImagesRequired-$maxImagesAllowed images required",
          style: TextStyle(
            color: _getHintTextColor(),
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  Widget _buildImageGrid() {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 1.0,
      ),
      itemCount: maxImagesAllowed,
      itemBuilder: (context, index) {
        return _buildImageContainer(index);
      },
    );
  }

  Widget _buildImageContainer(int index) {
    final hasImage = index < selectedImages.length;
    final canAddMore = selectedImages.length < maxImagesAllowed;
    
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: _getBorderColor(),
          width: 2,
        ),
      ),
      child: Stack(
        children: [
          if (hasImage)
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.file(
                File(selectedImages[index].path),
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
            )
          else if (index == selectedImages.length && canAddMore)
            Container(
              color: _getInputBackgroundColor(),
              child: Center(
                child: Icon(
                  Icons.add_photo_alternate_rounded,
                  color: _getHintTextColor(),
                  size: 32,
                ),
              ),
            )
          else
            Container(
              color: _getInputBackgroundColor(),
            ),
          
          if (hasImage)
            Positioned(
              top: 4,
              right: 4,
              child: GestureDetector(
                onTap: () => setState(() => selectedImages.removeAt(index)),
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.7),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.close_rounded,
                    color: Colors.white,
                    size: 16,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildUploadButton() {
    final isProcessing = _isUploading || _isCheckingUpload;
    final hasEnoughImages = selectedImages.length >= minImagesRequired;
    
    return SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: (isProcessing || !hasEnoughImages) 
                  ? Colors.grey.withOpacity(0.4)
                  : ColorGlobalVariables.brownColor.withOpacity(0.4),
                blurRadius: 20,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(20),
              onTap: (isProcessing || !hasEnoughImages) ? null : _formValidation,
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                  gradient: (isProcessing || !hasEnoughImages) 
                    ? LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.grey,
                          Colors.grey.shade600,
                        ],
                      )
                    : LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          ColorGlobalVariables.brownColor,
                          ColorGlobalVariables.brownColor.withOpacity(0.8),
                        ],
                      ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: isProcessing
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Text(
                              _isCheckingUpload ? 'Checking...' : 'Uploading...',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.check_circle_outline_rounded,
                              color: Colors.white,
                              size: 22,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'Upload ${selectedCategory?.name ?? 'Item'}',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final categoriesProvider = Provider.of<ItemCategoriesProvider>(context);
    final makeModelProvider = Provider.of<MakeAndModelProvider>(context);

    return Scaffold(
      backgroundColor: _getBackgroundColor(),
      appBar: _buildAppBar(),
      body: _isLoading
          ? _buildLoadingIndicator()
          : (categoriesProvider.error != null || makeModelProvider.error != null) 
            ? _buildErrorView(categoriesProvider, makeModelProvider) 
            : _buildMainContent(),
    );
  }

  Widget _buildErrorView(
    ItemCategoriesProvider categoriesProvider,
    MakeAndModelProvider makeModelProvider,
  ) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: ColorGlobalVariables.redColor.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.error_outline_rounded,
                size: 50,
                color: ColorGlobalVariables.redColor,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Unable to Load Data',
              style: TextStyle(
                color: _getTextColor(),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              categoriesProvider.error ?? makeModelProvider.error ?? 'Unknown error occurred',
              style: TextStyle(
                color: _getHintTextColor(),
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: ColorGlobalVariables.brownColor.withOpacity(0.3),
                    blurRadius: 15,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(20),
                  onTap: _loadInitialData,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          ColorGlobalVariables.brownColor,
                          ColorGlobalVariables.brownColor.withOpacity(0.8),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      'Try Again',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ========== HELPER METHODS ==========

  void _toggleFeature(String feature) {
    setState(() {
      if (selectedFeatures.contains(feature)) {
        selectedFeatures.remove(feature);
      } else {
        selectedFeatures.add(feature);
      }
    });
  }

  Future<void> _pickImages() async {
    try {
      final List<XFile> pickedFiles = await picker.pickMultiImage(
        maxWidth: 1000,
        maxHeight: 1000,
        imageQuality: 85,
      );

      if (pickedFiles.isNotEmpty) {
        setState(() {
          final availableSlots = maxImagesAllowed - selectedImages.length;
          if (availableSlots > 0) {
            final filesToAdd = pickedFiles.length > availableSlots 
                ? pickedFiles.sublist(0, availableSlots)
                : pickedFiles;
            selectedImages.addAll(filesToAdd);
            
            if (pickedFiles.length > availableSlots) {
              _showErrorSnackBar('Maximum of $maxImagesAllowed images allowed. Added $availableSlots images.');
            }
          } else {
            _showErrorSnackBar('Maximum of $maxImagesAllowed images reached');
          }
        });
      }
    } catch (e) {
      _showErrorSnackBar('Error picking images: $e');
    }
  }

  // ========== DIALOG METHODS ==========

  Future<void> _showCategorySelectionDialog(List<ItemCategory> categories) async {
    final selected = await showDialog<ItemCategory>(
      context: context,
      builder: (context) => _buildSearchableDialog(
        title: 'Select Category',
        subtitle: 'Choose a category for your vehicle listing',
        icon: Icons.category_rounded,
        items: categories,
        itemBuilder: (category) => category.name ?? 'Unnamed Category',
      ),
    );

    if (selected != null) {
      setState(() {
        selectedCategory = selected;
        selectedFields = {};
        selectedMake = null;
        selectedModel = null;
        selectedFeatures = [];
      });
    }
  }

  Future<void> _showMakeSelectionDialog(List<VehicleMake> makes) async {
    final selected = await showDialog<VehicleMake>(
      context: context,
      builder: (context) => _buildSearchableDialog(
        title: 'Select Make',
        subtitle: 'Choose your vehicle manufacturer',
        icon: Icons.business_center_rounded,
        items: makes,
        itemBuilder: (make) => make.name,
      ),
    );

    if (selected != null) {
      setState(() {
        selectedMake = {'id': selected.id, 'name': selected.name};
        selectedModel = null;
      });
    }
  }

  Future<void> _showModelSelectionDialog(List<VehicleModel>? models) async {
    if (models == null || models.isEmpty) return;

    final selected = await showDialog<VehicleModel>(
      context: context,
      builder: (context) => _buildSearchableDialog(
        title: 'Select Model',
        subtitle: 'Choose your vehicle model',
        icon: Icons.directions_car_rounded,
        items: models,
        itemBuilder: (model) => model.name,
      ),
    );

    if (selected != null) {
      setState(() => selectedModel = selected);
    }
  }

  Widget _buildSearchableDialog<T>({
    required String title,
    required String subtitle,
    required IconData icon,
    required List<T> items,
    required String Function(T) itemBuilder,
  }) {
    final searchController = TextEditingController();
    final filteredItems = ValueNotifier<List<T>>(items);

    return Dialog(
      backgroundColor: _getDialogBackgroundColor(),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.8,
          maxWidth: MediaQuery.of(context).size.width * 0.9,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(28),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    ColorGlobalVariables.brownColor.withOpacity(0.15),
                    ColorGlobalVariables.brownColor.withOpacity(0.08),
                  ],
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(28),
                  topRight: Radius.circular(28),
                ),
              ),
              child: Column(
                children: [
                  Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          ColorGlobalVariables.brownColor,
                          ColorGlobalVariables.brownColor.withOpacity(0.7),
                        ],
                      ),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      icon,
                      color: Colors.white,
                      size: 32,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    title,
                    style: TextStyle(
                      color: _getTextColor(),
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: _getHintTextColor(),
                      fontSize: 15,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(24),
              child: Container(
                decoration: BoxDecoration(
                  color: _getInputBackgroundColor(),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextField(
                  controller: searchController,
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    prefixIcon: Icon(Icons.search_rounded, color: ColorGlobalVariables.brownColor),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                    hintStyle: TextStyle(
                      color: _getHintTextColor(),
                    ),
                  ),
                  style: TextStyle(
                    color: _getTextColor(),
                  ),
                  onChanged: (value) {
                    filteredItems.value = items.where((item) {
                      return itemBuilder(item).toLowerCase().contains(value.toLowerCase());
                    }).toList();
                  },
                ),
              ),
            ),

            Expanded(
              child: ValueListenableBuilder<List<T>>(
                valueListenable: filteredItems,
                builder: (context, filteredItems, child) {
                  return ListView.separated(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    itemCount: filteredItems.length,
                    separatorBuilder: (context, index) => Divider(
                      height: 1,
                      color: _getBorderColor(),
                    ),
                    itemBuilder: (context, index) {
                      final item = filteredItems[index];
                      return Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () => Navigator.pop(context, item),
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 12),
                            child: Row(
                              children: [
                                Container(
                                  width: 48,
                                  height: 48,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        ColorGlobalVariables.brownColor.withOpacity(0.15),
                                        ColorGlobalVariables.brownColor.withOpacity(0.08),
                                      ],
                                    ),
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                  child: Icon(
                                    Icons.check_circle_outline_rounded,
                                    color: ColorGlobalVariables.brownColor,
                                    size: 24,
                                  ),
                                ),
                                const SizedBox(width: 18),
                                Expanded(
                                  child: Text(
                                    itemBuilder(item),
                                    style: TextStyle(
                                      color: _getTextColor(),
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),

            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: _getInputBackgroundColor(),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(28),
                  bottomRight: Radius.circular(28),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text(
                      'Cancel',
                      style: TextStyle(
                        color: _getHintTextColor(),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showSelectionDialog(List<dynamic> options, String fieldName) async {
    final selected = await showDialog<String>(
      context: context,
      builder: (context) => _buildSearchableDialog(
        title: 'Select Option',
        subtitle: 'Choose from available options',
        icon: Icons.list_alt_rounded,
        items: options.map((e) => e.toString()).toList(),
        itemBuilder: (item) => item,
      ),
    );

    if (selected != null) {
      setState(() => selectedFields[fieldName] = selected);
    }
  }

  Future<void> _showFieldInputDialog(String fieldLabel, String fieldName, String fieldType) async {
    final controller = TextEditingController(text: selectedFields[fieldName]?.toString() ?? '');

    await showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: _getDialogBackgroundColor(),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
        child: Container(
          constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.85),
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      ColorGlobalVariables.brownColor,
                      ColorGlobalVariables.brownColor.withOpacity(0.7),
                    ],
                  ),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.edit_rounded,
                  color: Colors.white,
                  size: 36,
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'Enter $fieldLabel',
                style: TextStyle(
                  color: _getTextColor(),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 28),
              
              Container(
                decoration: BoxDecoration(
                  color: _getInputBackgroundColor(),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: _getBorderColor()),
                ),
                child: TextField(
                  controller: controller,
                  keyboardType: fieldType == "number" ? TextInputType.number : TextInputType.text,
                  style: TextStyle(
                    color: _getTextColor(),
                  ),
                  decoration: InputDecoration(
                    hintText: "Enter $fieldLabel",
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    hintStyle: TextStyle(
                      color: _getHintTextColor(),
                    ),
                  ),
                  autofocus: true,
                ),
              ),
              const SizedBox(height: 32),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text(
                      'Cancel',
                      style: TextStyle(
                        color: _getHintTextColor(),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: () {
                      if (controller.text.trim().isNotEmpty) {
                        setState(() => selectedFields[fieldName] = controller.text.trim());
                        Navigator.pop(context);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorGlobalVariables.brownColor,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    ),
                    child: Text(
                      'Confirm',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}