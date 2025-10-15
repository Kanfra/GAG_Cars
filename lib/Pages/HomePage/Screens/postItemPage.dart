import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gag_cars_frontend/GlobalVariables/colorGlobalVariables.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Models/itemCategoryModel.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Models/makeAndModelModel.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Providers/getItemCategoriesProvider.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Providers/makeAndModelProvider.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Services/CanUploadItemService/canUploadItemService.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Services/VehicleService/vehicleService.dart';
import 'package:gag_cars_frontend/Pages/ProfilePages/Screens/myListingPage.dart';
import 'package:gag_cars_frontend/Routes/routeClass.dart';
import 'package:gag_cars_frontend/Utils/WidgetUtils/widgetUtils.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/Logger.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class PostItemPage extends StatefulWidget {
  const PostItemPage({super.key});

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
  Color color = Colors.blue;
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
  bool _isSelling = false;
  bool _isCheckingUpload = false;

  // Form fields
  Map<String, dynamic> selectedFields = {};

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

  Future<Map<String, dynamic>> _checkCanUpload() async {
    logger.i("Checking upload permissions...");
    
    if (mounted) {
      setState(() => _isCheckingUpload = true);
    }
    
    try {
      if (selectedCategory?.slug == null) {
        return {
          'can_upload': false,
          'reason': 'No category selected',
          'error': 'Please select a category first'
        };
      }

      final canUploadService = CanUploadItemService();
      final result = await canUploadService.checkCanUpload(
        categorySlug: selectedCategory!.slug!,
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
      String reason = 'Service unavailable';
      
      if (e.toString().contains('Unauthorized')) {
        errorMessage = 'Please login again to continue';
      } else if (e.toString().contains('Network error')) {
        errorMessage = 'Please check your internet connection';
      }
      
      return {
        'can_upload': false,
        'reason': reason,
        'error': errorMessage
      };
    } finally {
      if (mounted) {
        setState(() => _isCheckingUpload = false);
      }
    }
  }

  Future<void> sellCarFunction() async {
    logger.i("Starting vehicle upload...");
    
    try {
      if (!_validateRequiredFields()) {
        throw Exception('Please fill all required fields');
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

      // Process images
      List<File> imageFiles = [];
      for (var xFile in selectedImages) {
        final file = File(xFile.path);
        if (await file.exists()) {
          imageFiles.add(file);
        } else {
          throw Exception('One or more selected images are invalid');
        }
      }

      if (imageFiles.length < 2) {
        throw Exception('At least 2 valid images are required');
      }

      // Prepare request body
      final requestBody = {
        'category_id': selectedCategory!.id,
        'brand_id': selectedMake!["id"],
        'brand_model_id': selectedModel!.id, 
        'name': _itemNameController.text.trim(),
        'slug': _createSlug(_itemNameController.text.trim()),
        ...normalizedFields,
        'location': selectedLocation,
        'price': _priceController.text.trim(),
        'description': _itemDescriptionController.text.trim(),
        'features': selectedFeatures,
        'images': imageFiles
      };
      
      await VehicleService.uploadVehicle(requestBody: requestBody);
      
      logger.i("Vehicle uploaded successfully");
      
    } catch (e) {
      logger.e("Error in sellCarFunction: $e");
      rethrow;
    }
  }

  String _createSlug(String name) {
    return name.toLowerCase().replaceAll(' ', '-') + '-${DateTime.now().millisecondsSinceEpoch}';
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

    if (selectedImages.isEmpty || selectedImages.length < 2) {
      _showErrorSnackBar('Please upload at least 2 images and at most 4 images');
      return;
    }
    
    if (!_validateRequiredFields()) {
      return;
    }
    
    setState(() => _isSelling = true);
    
    try {
      final uploadCheckResult = await _checkCanUpload();
      final bool canUpload = uploadCheckResult['can_upload'] ?? false;
      final String? error = uploadCheckResult['error'];
      
      if (error != null) {
        _showErrorSnackBar(error);
        return;
      }
      
      if (canUpload) {
        await sellCarFunction();
        
        showCustomSnackBar(
          backgroundColor: ColorGlobalVariables.greenColor,
          title: 'Success',
          message: 'Vehicle listed successfully'
        );

        if (mounted) {
         Get.offNamedUntil(
          RouteClass.getMyListingPage(),
        (route) => route.isFirst, // This keeps the very first route (usually home)
      );
          // Navigator.pushNamedAndRemoveUntil(
          //   context, 
          //   RouteClass.getMyListingPage(), 
          //   (route) => false
          // );
        }
      } else {
        final String reason = uploadCheckResult['reason'] ?? 'Unknown reason';
        showCustomSnackBar(
          backgroundColor: ColorGlobalVariables.blueColor,
          title: 'Upload Restricted',
          message: reason
        );
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
        setState(() => _isSelling = false);
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
      // leading: 
      title: Text(
        'Post New Item',
        style: TextStyle(
          color: ColorGlobalVariables.brownColor,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
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
              // Help action
              Get.toNamed(
                RouteClass.getHelpCenterPage(),
              );
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
            'Loading Categories...',
            style: TextStyle(
              color: ColorGlobalVariables.brownColor,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Getting everything ready for you',
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
            if (selectedCategory != null) _buildBeautifulSellButton(),
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
                _showBeautifulFieldInputDialog(field.label, field.name, field.type);
              } else if (field.type == "enum") {
                _showBeautifulSelectionDialog(field.options ?? [], field.name);
              } else if (field.type == "year") {
                _showBeautifulYearPicker();
              } else if (field.type == "json") {
                _showFixedColorPicker();
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
            "Tap to add images (2-4 required)",
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
                height: 200,
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
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
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
          "2-4 images required",
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
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemCount: 4,
      itemBuilder: (context, index) {
        return _buildBeautifulImageContainer(index);
      },
    );
  }

  Widget _buildBeautifulImageContainer(int index) {
    final hasImage = index < selectedImages.length;
    
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
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
              borderRadius: BorderRadius.circular(16),
              child: Image.file(
                File(selectedImages[index].path),
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
            )
          else
            Container(
              color: Colors.grey[100],
              child: Center(
                child: Icon(
                  Icons.add_photo_alternate_rounded,
                  color: Colors.grey[400],
                  size: 32,
                ),
              ),
            ),
          
          if (hasImage)
            Positioned(
              top: 6,
              right: 6,
              child: GestureDetector(
                onTap: () => setState(() => selectedImages.removeAt(index)),
                child: Container(
                  padding: const EdgeInsets.all(6),
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
                    size: 18,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildBeautifulSellButton() {
    final isProcessing = _isSelling || _isCheckingUpload;
    
    return SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: ColorGlobalVariables.brownColor.withOpacity(0.4),
                blurRadius: 20,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(20),
              onTap: isProcessing ? null : _formValidation,
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                  gradient: isProcessing 
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
                              _isCheckingUpload ? 'Checking Permissions...' : 'Uploading Vehicle...',
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
                              'Sell Vehicle',
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
  // FIXED COLOR PICKER DIALOG - NO OVERFLOW
  // =============================================

  void _showFixedColorPicker() {
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
                        Icons.palette_rounded,
                        color: Colors.white,
                        size: 32,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Pick a Color',
                      style: TextStyle(
                        color: ColorGlobalVariables.blackColor,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Choose your preferred color',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),

              // Color Preview
              Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  padding: const EdgeInsets.all(16),
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
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: color,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Colors.grey[400]!,
                            width: 2,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 8,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Selected Color',
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              _colorController.text.isNotEmpty ? _colorController.text : 'No color selected',
                              style: TextStyle(
                                color: ColorGlobalVariables.blackColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Color Picker with Scrollable Container
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: Colors.grey[300]!,
                          width: 2,
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(14),
                        child: ColorPicker(
                          pickerColor: color,
                          onColorChanged: (newColor) {
                            setState(() {
                              color = newColor;
                              _colorController.text = _colorToHex(newColor);
                            });
                          },
                          showLabel: true,
                          pickerAreaHeightPercent: 0.7,
                          enableAlpha: true,
                          displayThumbColor: true,
                          portraitOnly: true,
                          pickerAreaBorderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(14),
                            topRight: Radius.circular(14),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              // Footer Section
              Container(
                padding: const EdgeInsets.all(20),
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
                          onTap: () => Navigator.pop(context),
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
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Other dialog methods remain the same...
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
            // Header
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

            // Search Section
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

            // Results Section
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

            // Footer
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

  Future<void> _showBeautifulFieldInputDialog(String fieldLabel, String fieldName, String fieldType) async {
    final controller = TextEditingController(text: selectedFields[fieldName]?.toString() ?? '');

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
              // Header
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
              
              // Input Field
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
              
              // Buttons
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

  void _showBeautifulYearPicker() {
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
              // Header
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
              
              // Year Picker
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Colors.grey[300]!,
                        width: 2,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(18),
                      child: SfDateRangePicker(
                        view: DateRangePickerView.decade,
                        initialSelectedDate: DateTime(year),
                        selectionColor: ColorGlobalVariables.brownColor,
                        selectionTextStyle: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        selectionShape: DateRangePickerSelectionShape.rectangle,
                        selectionRadius: 12,
                        onSelectionChanged: (args) {
                          if (args.value is DateTime) {
                            setState(() {
                              year = (args.value as DateTime).year;
                            });
                            Navigator.pop(context);
                          }
                        },
                      ),
                    ),
                  ),
                ),
              ),
              
              // Footer
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
      ),
    );
  }

  String _colorToHex(Color color) {
    return "#${color.value.toRadixString(16).padLeft(8, '0').toUpperCase()}";
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
          selectedImages.addAll(pickedFiles);
          if (selectedImages.length > 4) {
            selectedImages = selectedImages.sublist(0, 4);
            _showErrorSnackBar('Maximum of 4 images allowed');
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