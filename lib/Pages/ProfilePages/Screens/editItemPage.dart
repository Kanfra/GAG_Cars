import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gag_cars_frontend/GlobalVariables/colorGlobalVariables.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Models/itemCategoryModel.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Models/makeAndModelModel.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Providers/getItemCategoriesProvider.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Providers/makeAndModelProvider.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Services/VehicleService/vehicleService.dart';
import 'package:gag_cars_frontend/Pages/ProfilePages/Screens/myListingPage.dart';
import 'package:gag_cars_frontend/Routes/routeClass.dart';
import 'package:gag_cars_frontend/Utils/WidgetUtils/widgetUtils.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/Logger.dart';
import 'package:provider/provider.dart';

class EditItemPage extends StatefulWidget {
  final Map<String, dynamic> allJson;
  const EditItemPage({
    super.key,
    required this.allJson,
  });

  @override
  State<EditItemPage> createState() => _EditItemPageState();
}

class _EditItemPageState extends State<EditItemPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late final Map<String, dynamic> listing;

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
  bool _isUpdating = false;

  // Form fields
  Map<String, dynamic> selectedFields = {};

  // Image constants
  static const int minImagesRequired = 4;
  static const int maxImagesAllowed = 10;

  // Predefined colors with names
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
    listing = widget.allJson['listing'];
    logger.w("listing data at editItemPage: $listing");
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

  Future<void> _loadInitialData() async {
    logger.i("Loading initial data for editing...");
    setState(() => _isLoading = true);
    try {
      final itemCategoriesProvider = Provider.of<ItemCategoriesProvider>(context, listen: false);
      final makeModelProvider = Provider.of<MakeAndModelProvider>(context, listen: false);
      
      await Future.wait([
        itemCategoriesProvider.getAllCategories(),
        makeModelProvider.fetchMakesWithModels(),
      ]);
      
      // After loading data, populate the form with listing data
      _populateFormWithListingData(itemCategoriesProvider, makeModelProvider);
      logger.i("Initial data loaded successfully for editing");
    } catch (e) {
      logger.e("Error loading initial data: $e");
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to load data: ${e.toString()}'))
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  void _populateFormWithListingData(
    ItemCategoriesProvider categoriesProvider, 
    MakeAndModelProvider makeModelProvider
  ) {
    // Set category
    final categoryId = listing['category_id'];
    if (categoriesProvider.categories?.data != null && categoryId != null) {
      try {
        selectedCategory = categoriesProvider.categories!.data
            .firstWhere((category) => category.id == categoryId);
      } catch (e) {
        logger.e("Category not found: $e");
        selectedCategory = null;
      }
    }
    
    // Set make and model
    final makeId = listing['brand_id'];
    final modelId = listing['brand_model_id'];
    
    if (makeId != null && makeModelProvider.makes != null) {
      try {
        final make = makeModelProvider.makes!.firstWhere((make) => make.id == makeId);
        selectedMake = {'id': make.id, 'name': make.name};
        
        if (modelId != null) {
          final models = makeModelProvider.getModelsForMake(makeId);
          if (models != null) {
            try {
              selectedModel = models.firstWhere((model) => model.id == modelId);
            } catch (e) {
              logger.e("Model not found: $e");
              selectedModel = null;
            }
          }
        }
      } catch (e) {
        logger.e("Make not found: $e");
        selectedMake = null;
      }
    }
    
    // Set text fields
    _itemNameController.text = listing['name'] ?? '';
    _itemDescriptionController.text = listing['description'] ?? '';
    _priceController.text = listing['price']?.toString() ?? '';
    
    // Set location
    selectedLocation = listing['location'];
    
    // Set year
    year = int.tryParse(listing['year']?.toString() ?? DateTime.now().year.toString()) ?? DateTime.now().year;
    
    // Set color
    if (listing['color'] != null) {
      _colorController.text = listing['color'];
      selectedColorName = listing['color'];
      try {
        selectedColor = _parseColorFromHex(listing['color']);
      } catch (e) {
        logger.e("Error parsing color: $e");
        selectedColor = Colors.blue;
      }
    }
    
    // Set features
    if (listing['features'] is List) {
      selectedFeatures = List<String>.from(listing['features']);
    }
    
    // Set item fields from the listing
    if (selectedCategory != null && selectedCategory!.itemFields.isNotEmpty) {
      for (final field in selectedCategory!.itemFields) {
        final fieldKey = field.name.toLowerCase().replaceAll(' ', '_');
        if (listing.containsKey(fieldKey) && listing[fieldKey] != null) {
          selectedFields[field.name] = listing[fieldKey].toString();
        }
      }
    }
    
    // Set images (if they are URLs from the listing)
    if (listing['images'] is List) {
      selectedImages.clear();
      for (final imageUrl in listing['images']) {
        selectedImages.add(XFile(imageUrl.toString()));
      }
    }
  }

  Color _parseColorFromHex(String hexColor) {
    hexColor = hexColor.replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return Color(int.parse(hexColor, radix: 16));
  }

  Future<void> updateCarFunction() async {
    logger.i("Starting vehicle update...");
    
    try {
      if (!_validateRequiredFields()) {
        throw Exception('Please fill all required fields');
      }

      // Validate image count
      if (selectedImages.length < minImagesRequired) {
        throw Exception('At least $minImagesRequired images are required');
      }

      // Process form data
      if (_colorController.text.trim().isNotEmpty) {
        selectedFields['color'] = _colorController.text.trim();
      }
      
      if (year.toString().isNotEmpty) {
        selectedFields['year'] = year.toString().trim();
      }

      final normalizedFields = selectedFields.map((key, value) => 
        MapEntry(key?.toLowerCase().replaceAll(' ', '_'), value));

      // Process images: separate existing URLs from new files
      List<dynamic> allImages = [];
      
      for (final xFile in selectedImages) {
        if (xFile.path.startsWith('http')) {
          // This is an existing image URL from the server
          allImages.add(xFile.path);
        } else {
          // This is a new image file that needs to be uploaded
          final file = File(xFile.path);
          if (await file.exists()) {
            allImages.add(file);
          } else {
            throw Exception('One or more selected images are invalid');
          }
        }
      }

      if (allImages.length < minImagesRequired) {
        throw Exception('At least $minImagesRequired valid images are required');
      }

      // Prepare request body
      final requestBody = {
        'id': listing['id'],
        'category_id': selectedCategory!.id,
        'brand_id': selectedMake!["id"],
        'brand_model_id': selectedModel!.id, 
        'name': _itemNameController.text.trim(),
        'slug': listing['slug'], // Keep the same slug for update
        ...normalizedFields,
        'location': selectedLocation,
        'price': _priceController.text.trim(),
        'description': _itemDescriptionController.text.trim(),
        'features': selectedFeatures,
        'images': allImages // This contains mix of URLs (strings) and Files
      };
      
      logger.i("Update request body prepared");
      
      await VehicleService.updateVehicle(requestBody: requestBody);
      
      logger.i("Vehicle updated successfully");
      
    } catch (e) {
      logger.e("Error in updateCarFunction: $e");
      rethrow;
    }
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

  Future<void> _formValidation() async {
    if (!_formKey.currentState!.validate()) {
      _showErrorSnackBar('Please correct the errors in the form');
      return;
    }

    // Updated validation for 4-10 images
    if (selectedImages.length < minImagesRequired) {
      _showErrorSnackBar('Please upload at least $minImagesRequired images and at most $maxImagesAllowed images');
      return;
    }
    
    if (!_validateRequiredFields()) {
      return;
    }
    
    setState(() => _isUpdating = true);
    
    try {
      // Attempt to update the vehicle
      await updateCarFunction();
      
      // Only show success if update was truly successful
      showCustomSnackBar(
        backgroundColor: ColorGlobalVariables.greenColor,
        title: 'Success',
        message: 'Vehicle updated successfully'
      );

      // Navigate back after successful update
      if (mounted) {
        Get.offUntil(
          GetPageRoute(page: () => MyListingPage()),
          (route) => route.isFirst,
        );
      }
    } catch (e) {
      String errorMessage = 'Failed to update your vehicle';
      
      if (e.toString().contains('Unauthorized')) {
        errorMessage = 'Please login again to continue';
      } else if (e.toString().contains('Network error')) {
        errorMessage = 'Please check your internet connection';
      } else if (e.toString().contains('Forbidden')) {
        errorMessage = 'You don\'t have permission to update this vehicle.';
      } else if (e.toString().contains('Validation failed')) {
        errorMessage = e.toString().replaceFirst('Exception: ', '');
      } else if (e.toString().contains('Cloudinary')) {
        errorMessage = 'Failed to upload images. Please try again.';
      }
      
      _showErrorSnackBar('$errorMessage: ${e.toString()}');
      
      // DO NOT clear form fields on error
      logger.e("Update failed - form fields preserved for user to fix issues");
    } finally {
      if (mounted) {
        setState(() => _isUpdating = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final categoriesProvider = Provider.of<ItemCategoriesProvider>(context);
    final makeModelProvider = Provider.of<MakeAndModelProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildBeautifulAppBar(),
      body: _isLoading
          ? _buildBeautifulLoadingIndicator()
          : (categoriesProvider.error != null || makeModelProvider.error != null) 
            ? _buildBeautifulErrorView(categoriesProvider, makeModelProvider) 
            : _buildBeautifulMainContent(),
    );
  }

  AppBar _buildBeautifulAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: Text(
        'Update Item',
        style: TextStyle(
          color: ColorGlobalVariables.brownColor,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios_rounded,
          color: ColorGlobalVariables.brownColor,
        ),
        onPressed: () => Navigator.pop(context),
      ),
      actions: [
        Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.grey[50],
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: IconButton(
            icon: Icon(
              Icons.help_outline_rounded,
              color: Colors.grey[600],
              size: 20,
            ),
            onPressed: () {
              Get.toNamed(RouteClass.getHelpCenterPage());
            },
          ),
        ),
      ],
    );
  }

  Widget _buildBeautifulLoadingIndicator() {
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
              boxShadow: [
                BoxShadow(
                  color: ColorGlobalVariables.brownColor.withOpacity(0.2),
                  blurRadius: 15,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: const SpinKitDoubleBounce(
              color: ColorGlobalVariables.brownColor,
              size: 50,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Loading Vehicle Details...',
            style: TextStyle(
              color: ColorGlobalVariables.brownColor,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Getting everything ready for editing',
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBeautifulMainContent() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
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
                    _buildBeautifulCategoryField(),
                    const SizedBox(height: 20),
                    if (selectedCategory != null) ..._buildBeautifulFormFields(),
                  ],
                ),
              ),
            ),
            if (selectedCategory != null) _buildBeautifulUpdateButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildBeautifulCategoryField() {
    final provider = Provider.of<ItemCategoriesProvider>(context);
    
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
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
          onTap: () => _showBeautifulCategorySelectionDialog(provider.categories?.data ?? []),
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
                          color: Colors.grey[600],
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        selectedCategory?.name ?? "Select a Category",
                        style: TextStyle(
                          color: selectedCategory != null 
                            ? ColorGlobalVariables.blackColor 
                            : Colors.grey[400],
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.grey[50],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    Icons.arrow_drop_down_rounded,
                    color: Colors.grey[500],
                    size: 24,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildBeautifulFormFields() {
    final makeModelProvider = Provider.of<MakeAndModelProvider>(context);
    
    return [
      _buildBeautifulTextField(
        title: "Vehicle Name",
        hintText: "Enter vehicle name",
        controller: _itemNameController,
        icon: Icons.directions_car_rounded,
      ),
      const SizedBox(height: 20),
      _buildBeautifulMakeModelRow(makeModelProvider),
      const SizedBox(height: 20),
      _buildBeautifulFormFieldsGrid(),
      const SizedBox(height: 20),
      _buildBeautifulLocationAndPrice(),
      const SizedBox(height: 20),
      _buildBeautifulFeatures(),
      const SizedBox(height: 20),
      _buildBeautifulTextField(
        title: "Description",
        hintText: "Enter description",
        isFieldHeightRequired: true,
        controller: _itemDescriptionController,
        icon: Icons.description_rounded,
      ),
      const SizedBox(height: 20),
      _buildBeautifulImagePickerSection(),
      const SizedBox(height: 20),
    ];
  }

  Widget _buildBeautifulTextField({
    required String title,
    required String hintText,
    required TextEditingController controller,
    bool isFieldHeightRequired = false,
    required IconData icon,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
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
                  color: ColorGlobalVariables.blackColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[50],
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: Colors.grey[300]!,
                width: 1.5,
              ),
            ),
            child: TextFormField(
              controller: controller,
              maxLines: isFieldHeightRequired ? 4 : 1,
              style: TextStyle(
                color: ColorGlobalVariables.blackColor,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hintText,
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                hintStyle: TextStyle(
                  color: Colors.grey[500],
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

  Widget _buildBeautifulMakeModelRow(MakeAndModelProvider provider) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
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
                  color: ColorGlobalVariables.blackColor,
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
                child: _buildBeautifulMakeField(provider),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildBeautifulModelField(provider),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBeautifulMakeField(MakeAndModelProvider provider) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Make',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: ColorGlobalVariables.blackColor,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 8),
        Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(15),
            onTap: () => _showBeautifulMakeSelectionDialog(provider.makes ?? []),
            child: Container(
              height: 56,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: Colors.grey[300]!,
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
                          ? ColorGlobalVariables.blackColor 
                          : Colors.grey[500],
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.arrow_drop_down_rounded,
                    color: Colors.grey[500],
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

  Widget _buildBeautifulModelField(MakeAndModelProvider provider) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Model',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: ColorGlobalVariables.blackColor,
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
              _showBeautifulModelSelectionDialog(provider.getModelsForMake(selectedMake!['id']));
            },
            child: Container(
              height: 56,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: Colors.grey[300]!,
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
                          ? ColorGlobalVariables.blackColor 
                          : Colors.grey[500],
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.arrow_drop_down_rounded,
                    color: Colors.grey[500],
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

  Widget _buildBeautifulFormFieldsGrid() {
    final itemFields = selectedCategory?.itemFields ?? [];
    if (itemFields.isEmpty) return const SizedBox();

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
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
                "Vehicle Details",
                style: TextStyle(
                  color: ColorGlobalVariables.blackColor,
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

              return _buildBeautifulFormFieldItem(field, currentValue);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildBeautifulFormFieldItem(ItemField field, String currentValue) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          field.label,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: ColorGlobalVariables.blackColor,
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
                _showBeautifulFieldInputDialog(field.label, field.name, field.type, currentValue);
              } else if (field.type == "enum") {
                _showBeautifulSelectionDialog(field.options ?? [], field.name);
              } else if (field.type == "year") {
                _showBeautifulYearPicker();
              } else if (field.type == "json") {
                _showSimpleColorPicker();
              }
            },
            child: Container(
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Colors.grey[300]!,
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
                          ? ColorGlobalVariables.blackColor 
                          : Colors.grey[500],
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.arrow_drop_down_rounded,
                    color: Colors.grey[500],
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

  Widget _buildBeautifulLocationAndPrice() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
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
                  color: ColorGlobalVariables.blackColor,
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
                child: _buildBeautifulLocationField(),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildBeautifulPriceField(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBeautifulLocationField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Location',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: ColorGlobalVariables.blackColor,
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
                color: Colors.grey[50],
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: Colors.grey[300]!,
                  width: 1.5,
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.location_on_rounded,
                    color: Colors.grey[500],
                    size: 20,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      selectedLocation ?? "Search Location",
                      style: TextStyle(
                        color: selectedLocation != null 
                          ? ColorGlobalVariables.blackColor 
                          : Colors.grey[500],
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

  Widget _buildBeautifulPriceField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Price',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: ColorGlobalVariables.blackColor,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          height: 56,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.grey[50],
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: Colors.grey[300]!,
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
                  'GH₵',
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
                    color: ColorGlobalVariables.blackColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter price',
                    hintStyle: TextStyle(
                      color: Colors.grey,
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

  Widget _buildBeautifulFeatures() {
    final hasFeatures = selectedCategory?.features?.isNotEmpty ?? false;
    if (!hasFeatures) return const SizedBox();
    
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
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
                  color: ColorGlobalVariables.blackColor,
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
            children: selectedCategory!.features!.map((feature) => _buildBeautifulFeatureChip(feature)).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildBeautifulFeatureChip(String feature) {
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
            color: isSelected ? null : Colors.white,
            borderRadius: BorderRadius.circular(25),
            border: Border.all(
              color: isSelected ? ColorGlobalVariables.brownColor : Colors.grey[300]!,
              width: 2,
            ),
            boxShadow: [
              if (isSelected)
                BoxShadow(
                  color: ColorGlobalVariables.brownColor.withOpacity(0.3),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                )
              else
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
            ],
          ),
          child: Text(
            feature,
            style: TextStyle(
              color: isSelected ? Colors.white : ColorGlobalVariables.blackColor,
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBeautifulImagePickerSection() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
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
                "Vehicle Images",
                style: TextStyle(
                  color: ColorGlobalVariables.blackColor,
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
              color: Colors.grey[600],
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
                  color: Colors.grey[50],
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.grey[300]!,
                    width: 2,
                    style: BorderStyle.solid,
                  ),
                ),
                child: selectedImages.isEmpty 
                  ? _buildBeautifulEmptyImageState()
                  : _buildBeautifulImageGrid(),
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

  Widget _buildBeautifulEmptyImageState() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.add_photo_alternate_rounded,
          size: 50,
          color: Colors.grey[400],
        ),
        const SizedBox(height: 12),
        Text(
          "Tap to Add Images",
          style: TextStyle(
            color: Colors.grey[500],
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          "$minImagesRequired-$maxImagesAllowed images required",
          style: TextStyle(
            color: Colors.grey[400],
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  Widget _buildBeautifulImageGrid() {
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
        return _buildBeautifulImageContainer(index);
      },
    );
  }

  Widget _buildBeautifulImageContainer(int index) {
    final hasImage = index < selectedImages.length;
    final isNetworkImage = hasImage && selectedImages[index].path.startsWith('http');
    final canAddMore = selectedImages.length < maxImagesAllowed;
    
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.grey[300]!,
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        children: [
          if (hasImage)
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image(
                image: isNetworkImage 
                  ? NetworkImage(selectedImages[index].path) 
                  : FileImage(File(selectedImages[index].path)) as ImageProvider,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
            )
          else if (index == selectedImages.length && canAddMore)
            Container(
              color: Colors.grey[100],
              child: Center(
                child: Icon(
                  Icons.add_photo_alternate_rounded,
                  color: Colors.grey[400],
                  size: 32,
                ),
              ),
            )
          else
            Container(
              color: Colors.grey[50],
              child: Center(
                child: Icon(
                  Icons.block_rounded,
                  color: Colors.grey[300],
                  size: 24,
                ),
              ),
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
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 6,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Icon(
                    Icons.close_rounded,
                    color: Colors.white,
                    size: 16,
                  ),
                ),
              ),
            ),

          // Image counter badge
          if (hasImage)
            Positioned(
              bottom: 4,
              left: 4,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  '${index + 1}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildBeautifulUpdateButton() {
    final isProcessing = _isUpdating;
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
                              'Updating Vehicle...',
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
                              'Update Vehicle',
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

  Widget _buildBeautifulErrorView(
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
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 15,
                    offset: const Offset(0, 5),
                  ),
                ],
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
                color: ColorGlobalVariables.blackColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              categoriesProvider.error ?? makeModelProvider.error ?? 'Unknown error occurred',
              style: TextStyle(
                color: Colors.grey[600],
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

  // =============================================
  // FIXED COLOR PICKER - PROPERLY UPDATES FORM FIELD
  // =============================================

  void _showSimpleColorPicker() {
    final searchController = TextEditingController();
    final filteredColors = ValueNotifier<List<Map<String, dynamic>>>(colorOptions);
    final dialogSelectedColorName = ValueNotifier<String>(selectedColorName);
    final dialogSelectedColor = ValueNotifier<Color>(selectedColor);

    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.white,
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
                        color: ColorGlobalVariables.blackColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Choose from common color names',
                      style: TextStyle(
                        color: Colors.grey[600],
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
                            color: Colors.grey[50],
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: Colors.grey[300]!,
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
                                    color: Colors.grey[400]!,
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
                                        color: Colors.grey[600],
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const SizedBox(height: 2),
                                    Text(
                                      colorName,
                                      style: TextStyle(
                                        color: ColorGlobalVariables.blackColor,
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
                    color: Colors.grey[50],
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
                        color: Colors.grey[500],
                        fontSize: 14,
                      ),
                    ),
                    style: TextStyle(
                      color: ColorGlobalVariables.blackColor,
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
                  color: Colors.grey[50],
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
                          color: Colors.grey[400]!,
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
                                color: Colors.grey[700],
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
                                  // FIX: Update the form state when color is selected
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
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isSelected ? ColorGlobalVariables.brownColor : Colors.grey[300]!,
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
                    color: Colors.grey[400]!,
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
                    color: ColorGlobalVariables.blackColor,
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
                color: Colors.grey[100],
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.color_lens_rounded,
                size: 35,
                color: Colors.grey[400],
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'No colors found',
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              'Try searching with different keywords',
              style: TextStyle(
                color: Colors.grey[500],
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
  // FIXED YEAR PICKER - PROPERLY UPDATES FORM FIELD
  // =============================================

  void _showBeautifulYearPicker() {
    final currentYear = DateTime.now().year;
    final years = List.generate(50, (index) => currentYear - index);
    final dialogSelectedYear = ValueNotifier<int>(year);

    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.white,
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
                        color: ColorGlobalVariables.blackColor,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Choose the manufacturing year of your vehicle',
                      style: TextStyle(
                        color: Colors.grey[600],
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
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: Colors.grey[300]!,
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
                                              : Colors.grey[200],
                                          shape: BoxShape.circle,
                                        ),
                                        child: Icon(
                                          isSelected ? Icons.check_rounded : Icons.calendar_today_rounded,
                                          color: isSelected ? Colors.white : Colors.grey[600],
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
                                                : ColorGlobalVariables.blackColor,
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
                  color: Colors.grey[50],
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
                          color: Colors.grey[400]!,
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
                                color: Colors.grey[700],
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
                                // FIX: Update the form state when year is selected
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

  Future<void> _showBeautifulCategorySelectionDialog(List<ItemCategory> categories) async {
    final selected = await showDialog<ItemCategory>(
      context: context,
      builder: (context) => _buildPremiumSearchableDialog(
        title: 'Select Category',
        subtitle: 'Choose a category for your vehicle listing',
        icon: Icons.category_rounded,
        items: categories,
        itemBuilder: (category) => category.name ?? 'Unnamed Category',
        onItemSelected: (category) => Navigator.pop(context, category),
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

  Future<void> _showBeautifulMakeSelectionDialog(List<VehicleMake> makes) async {
    final selected = await showDialog<VehicleMake>(
      context: context,
      builder: (context) => _buildPremiumSearchableDialog(
        title: 'Select Make',
        subtitle: 'Choose your vehicle manufacturer',
        icon: Icons.business_center_rounded,
        items: makes,
        itemBuilder: (make) => make.name,
        onItemSelected: (make) => Navigator.pop(context, make),
      ),
    );

    if (selected != null) {
      setState(() {
        selectedMake = {'id': selected.id, 'name': selected.name};
        selectedModel = null;
      });
    }
  }

  Future<void> _showBeautifulModelSelectionDialog(List<VehicleModel>? models) async {
    if (models == null || models.isEmpty) return;

    final selected = await showDialog<VehicleModel>(
      context: context,
      builder: (context) => _buildPremiumSearchableDialog(
        title: 'Select Model',
        subtitle: 'Choose your vehicle model',
        icon: Icons.directions_car_rounded,
        items: models,
        itemBuilder: (model) => model.name,
        onItemSelected: (model) => Navigator.pop(context, model),
      ),
    );

    if (selected != null) {
      setState(() => selectedModel = selected);
    }
  }

  Widget _buildPremiumSearchableDialog<T>({
    required String title,
    required String subtitle,
    required IconData icon,
    required List<T> items,
    required String Function(T) itemBuilder,
    required Function(T) onItemSelected,
  }) {
    final searchController = TextEditingController();
    final filteredItems = ValueNotifier<List<T>>(items);

    return Dialog(
      backgroundColor: Colors.white,
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
              width: double.infinity,
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
                      boxShadow: [
                        BoxShadow(
                          color: ColorGlobalVariables.brownColor.withOpacity(0.4),
                          blurRadius: 15,
                          offset: const Offset(0, 6),
                        ),
                      ],
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
                      color: ColorGlobalVariables.blackColor,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: Colors.grey[600],
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
                  color: Colors.grey[50],
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: TextField(
                  controller: searchController,
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    prefixIcon: Container(
                      margin: const EdgeInsets.all(14),
                      child: Icon(
                        Icons.search_rounded, 
                        color: ColorGlobalVariables.brownColor,
                        size: 22,
                      ),
                    ),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                    hintStyle: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 16,
                    ),
                  ),
                  style: TextStyle(
                    color: ColorGlobalVariables.blackColor,
                    fontSize: 16,
                  ),
                  onChanged: (value) {
                    filteredItems.value = items.where((item) {
                      final itemName = itemBuilder(item).toLowerCase();
                      return itemName.contains(value.toLowerCase());
                    }).toList();
                  },
                ),
              ),
            ),

            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(28),
                    bottomRight: Radius.circular(28),
                  ),
                ),
                child: ValueListenableBuilder<List<T>>(
                  valueListenable: filteredItems,
                  builder: (context, filteredItems, child) {
                    if (filteredItems.isEmpty) {
                      return _buildPremiumEmptyState();
                    }
                    
                    return ListView.separated(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      itemCount: filteredItems.length,
                      separatorBuilder: (context, index) => Divider(
                        height: 1,
                        color: Colors.grey[200],
                        indent: 20,
                        endIndent: 20,
                      ),
                      itemBuilder: (context, index) {
                        final item = filteredItems[index];
                        return Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () => onItemSelected(item),
                            borderRadius: BorderRadius.circular(16),
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
                                        color: ColorGlobalVariables.blackColor,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  Icon(
                                    Icons.chevron_right_rounded,
                                    color: Colors.grey[400],
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

            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.grey[50],
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
                        color: Colors.grey[400]!,
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
                              color: Colors.grey[700],
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                          ),
                        ),
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

  Widget _buildPremiumEmptyState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(50),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.grey[100],
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.search_off_rounded,
                size: 50,
                color: Colors.grey[400],
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'No results found',
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'Try searching with different keywords',
              style: TextStyle(
                color: Colors.grey[500],
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showBeautifulSelectionDialog(List<dynamic> options, String fieldName) async {
    final selected = await showDialog<String>(
      context: context,
      builder: (context) => _buildPremiumSearchableDialog(
        title: 'Select Option',
        subtitle: 'Choose from available options',
        icon: Icons.list_alt_rounded,
        items: options.map((e) => e.toString()).toList(),
        itemBuilder: (item) => item,
        onItemSelected: (item) => Navigator.pop(context, item),
      ),
    );

    if (selected != null) {
      setState(() {
        selectedFields[fieldName] = selected;
      });
    }
  }

  Future<void> _showBeautifulFieldInputDialog(String fieldLabel, String fieldName, String fieldType, String currentValue) async {
    final controller = TextEditingController(text: currentValue);

    await showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(28),
        ),
        elevation: 25,
        child: Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.85,
          ),
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
                  boxShadow: [
                    BoxShadow(
                      color: ColorGlobalVariables.brownColor.withOpacity(0.3),
                      blurRadius: 12,
                      offset: const Offset(0, 6),
                    ),
                  ],
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
                  color: ColorGlobalVariables.blackColor,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Please provide the $fieldLabel details',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 15,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 28),
              
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[50],
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.grey[300]!,
                    width: 2,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: TextField(
                  controller: controller,
                  keyboardType: fieldType == "number" ? TextInputType.number : TextInputType.text,
                  style: TextStyle(
                    color: ColorGlobalVariables.blackColor,
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),
                  decoration: InputDecoration(
                    hintText: "Enter $fieldLabel",
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    hintStyle: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 16,
                    ),
                  ),
                  autofocus: true,
                ),
              ),
              const SizedBox(height: 32),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: Colors.grey[400]!,
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
                              color: Colors.grey[700],
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Container(
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
                          if (controller.text.trim().isNotEmpty) {
                            setState(() {
                              selectedFields[fieldName] = controller.text.trim();
                            });
                            Navigator.pop(context);
                          }
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
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
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

  void _toggleFeature(String feature) {
    setState(() {
      if (selectedFeatures.contains(feature)) {
        selectedFeatures.remove(feature);
      } else {
        selectedFeatures.add(feature);
      }
    });
  }
}