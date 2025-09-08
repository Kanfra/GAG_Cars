import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/Appbar/customAppbarOne.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/Buttons/customElevatedButton.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/Buttons/customTextButton.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/Checkboxes/textCheckBox.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/Text/textMedium.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/Text/textSmall.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/customIcon.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/titleWithRowComponent.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/titleWithTextFormFieldComponent.dart';
import 'package:gag_cars_frontend/GeneralComponents/KwekuComponents/buttons/custom_button.dart';
import 'package:gag_cars_frontend/GlobalVariables/colorGlobalVariables.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Models/itemCategoryModel.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Models/makeAndModelModel.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Providers/getItemCategoriesProvider.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Providers/makeAndModelProvider.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Services/VehicleService/vehicleService.dart';
import 'package:gag_cars_frontend/Pages/Profile%20Pages/Screens/myListingPage.dart';
import 'package:gag_cars_frontend/Routes/routeClass.dart';
import 'package:gag_cars_frontend/Utils/WidgetUtils/widgetUtils.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

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

  // textformfield controllers
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _itemNameController = TextEditingController();
  final TextEditingController _itemDescriptionController = TextEditingController();
  final TextEditingController _colorController = TextEditingController();

  final Logger logger = Logger();
  
  // Color
  Color color = Colors.transparent;

  // image picker
  List<XFile> selectedImages = [];
  final ImagePicker picker = ImagePicker();
  
  // Location
  String? selectedLocation;
  Position? _currentPosition;

  // selected make and model
  Map<String, dynamic>? selectedMake;
  VehicleModel? selectedModel;

  // selected category
  ItemCategory? selectedCategory;

  // selected features
  List<String> selectedFeatures = [];

  // selected year
  int year = 2000;
  
  // page loading data from api
  bool _isLoading = false;
  bool _isUpdating = false;

  // for selected items from options
  Map<String?, dynamic> selectedFields = {};

  // update car function
Future<void> updateCarFunction() async {
  if(_colorController.text.toString().trim().isNotEmpty){
    selectedFields['color'] = _colorController.text.toString().trim();
  }
  if(year.toString().isNotEmpty){
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
      allImages.add(File(xFile.path));
    }
  }
  
  final Map<String?, dynamic> requestBody = {
    'id': listing['id'],
    'category_id': selectedCategory?.id,
    'brand_id': selectedMake?["id"],
    'brand_model_id': selectedModel?.id, 
    'name': _itemNameController.text.toString(),
    'slug': listing['slug'], // Keep the same slug for update
    ...normalizedFields,
    'location': selectedLocation,
    'price': _priceController.text.toString(),
    'description': _itemDescriptionController.text.toString(),
    'features': selectedFeatures ?? [],
    'images': allImages // This contains mix of URLs (strings) and Files
  };
  
  logger.i("Update request body: $requestBody");
  
  await VehicleService.updateVehicle(
    requestBody: requestBody,
  );
}

  // form validation function
  Future<void> _formValidation() async {
  if (_formKey.currentState!.validate()) {
    if(selectedImages.isEmpty || selectedImages.length < 2){
      showCustomSnackBar(
        backgroundColor: ColorGlobalVariables.redColor, 
        title: "Error",
        message: 'Please upload at least 2 images and at most 4 images', 
      );
      return;
    }
    setState(() {
      _isUpdating = true;
    });
    try{
      await updateCarFunction();
      showCustomSnackBar(
        backgroundColor: ColorGlobalVariables.greenColor,
        title: 'Success',
        message: 'Vehicle updated successfully'
      );

      // Navigate back after successful update
      // Navigator.pop(context);
      Get.offUntil(
        GetPageRoute(page: () => MyListingPage()),
        (route) => route.isFirst, // This keeps the very first route (usually home)
      );
    } catch(e){
      String errorMessage = 'Failed to update vehicle';
      
      // Handle specific error types
      if (e.toString().contains('Unauthorized')) {
        errorMessage = 'Session expired. Please login again.';
      } else if (e.toString().contains('Forbidden')) {
        errorMessage = 'You don\'t have permission to update this vehicle.';
      } else if (e.toString().contains('Validation failed')) {
        errorMessage = e.toString().replaceFirst('Exception: ', '');
      } else if (e.toString().contains('Cloudinary')) {
        errorMessage = 'Failed to upload images. Please try again.';
      }
      
      showCustomSnackBar(
        backgroundColor: ColorGlobalVariables.redColor,
        title: 'Error',
        message: errorMessage
      );
    } finally{
      setState(() {
        _isUpdating = false;
      });
    }
  } else {
    showCustomSnackBar(
      backgroundColor: ColorGlobalVariables.redColor, 
      title: 'Error',
      message: 'Please correct the errors in the form' 
    );
  }
}

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
    } catch (e) {
      logger.e("Error loading initial data: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to load data: ${e.toString()}'))
      );
    } finally {
      setState(() => _isLoading = false);
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
    year = int.tryParse(listing['year']?.toString() ?? '2000') ?? 2000;
    
    // Set color
    if (listing['color'] != null) {
      _colorController.text = listing['color'];
      try {
        color = _parseColorFromHex(listing['color']);
      } catch (e) {
        logger.e("Error parsing color: $e");
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

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final categoriesProvider = Provider.of<ItemCategoriesProvider>(context);
    final makeModelProvider = Provider.of<MakeAndModelProvider>(context);

    return Scaffold(
      appBar: CustomAppbar(
        onLeadingIconClickFunction: () => Navigator.pop(context),
        isLeadingWidgetExist: true,
        leadingIconData: Icons.arrow_back_ios,
        titleText: 'Update Item',
        centerTitle: true,
        titleTextColor: ColorGlobalVariables.brownColor,
      ),   
      body: _isLoading
          ? _buildLoadingIndicator()
          : (categoriesProvider.error != null || makeModelProvider.error != null) 
            ? _buildErrorView(categoriesProvider, makeModelProvider) 
            : _buildMainContent(screenSize, categoriesProvider, makeModelProvider),
    );
  }

  Widget _buildLoadingIndicator() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SpinKitDoubleBounce(
            color: ColorGlobalVariables.brownColor,
            size: 40,
          ),
          const SizedBox(height: 16),
          Text(
            'Loading vehicle details...',
            style: TextStyle(
              color: ColorGlobalVariables.brownColor,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMainContent(
    Size screenSize,
    ItemCategoriesProvider categoriesProvider,
    MakeAndModelProvider makeModelProvider,
  ) {
    if (categoriesProvider.error != null || makeModelProvider.error != null) {
      return _buildErrorView(categoriesProvider, makeModelProvider);
    }
    
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
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 20),
                _buildCategoryField(categoriesProvider),
                selectedCategory != null ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    _buildTextField(
                      title: "Vehicle Name",
                      hintText: "Enter name",
                      controller: _itemNameController,
                    ),
                    const SizedBox(height: 20),
                    _buildMakeModelRow(makeModelProvider),
                    const SizedBox(height: 20),
                    _buildFormFieldsGrid(),
                    const SizedBox(height: 20),
                    _buildGoogleLocationAndPrice(),
                    const SizedBox(height: 20),
                    _buildFeatures(),
                    selectedCategory!.features.isEmpty ? const SizedBox() : const SizedBox(height: 20),
                    // description
                    _buildTextField(
                      title: "Description",
                      hintText: "Enter description",
                      isFieldHeightRequired: true,
                      controller: _itemDescriptionController,
                    ),
                    const SizedBox(height: 20),
                    _buildImagePickerSection(),
                    const SizedBox(height: 30),
                    _buildUpdateButton(),
                    const SizedBox(height: 30),
                  ],
                ) : Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  height: screenSize.height*0.3,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.category,
                          size: 50,
                          color: ColorGlobalVariables.brownColor.withOpacity(0.5),
                        ),
                        const SizedBox(height: 16),
                        TextSmall(
                          title: "Select a Category to continue", 
                          fontWeight: FontWeight.normal, 
                          textColor: ColorGlobalVariables.blackColor
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
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
            Icon(
              Icons.error_outline,
              size: 60,
              color: ColorGlobalVariables.redColor,
            ),
            const SizedBox(height: 20),
            Text(
              categoriesProvider.error ?? makeModelProvider.error ?? 'Unknown error occurred',
              style: TextStyle(
                color: ColorGlobalVariables.blackColor,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _loadInitialData,
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorGlobalVariables.brownColor,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryField(ItemCategoriesProvider provider) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TitleWithTextformfieldComponent(
        title: 'Category',
        hintText: selectedCategory?.name ?? "Select a Category",
        onTitleWithContainerWidgetClickFunction: () {
          _showCategorySelectionDialog(provider.categories?.data ?? []);
        }, 
        fontWeight: FontWeight.w600, 
        textColor: ColorGlobalVariables.blackColor, 
        obscureText: false, 
        isTitleWithContainerWidgetRequired: true, 
        isSuffixIconRequired: true, 
        suffixIconData: Icons.arrow_drop_down,
        isPrefixIconRequired: false, 
        isFieldHeightRequired: false,
      ),
    );
  }

  Widget _buildMakeModelRow(MakeAndModelProvider provider) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
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
            color: ColorGlobalVariables.blackColor,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: () {
            _showMakeSelectionDialog(provider.makes ?? []);
          },
          child: Container(
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: ColorGlobalVariables.textFieldColor,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: Colors.grey.shade300,
                width: 1,
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
                        : Colors.grey.shade500,
                    ),
                  ),
                ),
                Icon(
                  Icons.arrow_drop_down,
                  color: Colors.grey.shade500,
                ),
              ],
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
            color: ColorGlobalVariables.blackColor,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: () {
            if (selectedMake == null) {
              showCustomSnackBar(
                title: "Error",
                message: "Select a Make first",
                backgroundColor: ColorGlobalVariables.redColor,
                textColor: ColorGlobalVariables.whiteColor,
              );
              return;
            }
            _showModelSelectionDialog(provider.getModelsForMake(selectedMake!['id']));
          },
          child: Container(
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: ColorGlobalVariables.textFieldColor,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: Colors.grey.shade300,
                width: 1,
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
                        : Colors.grey.shade500,
                    ),
                  ),
                ),
                Icon(
                  Icons.arrow_drop_down,
                  color: Colors.grey.shade500,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildUpdateButton(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: ColorGlobalVariables.brownColor.withOpacity(0.3),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: CustomButton(
          isLoading: _isUpdating, 
          buttonName: 'Update Item',
          backgroundColor: ColorGlobalVariables.brownColor,
          textColor: ColorGlobalVariables.whiteColor,
          height: 55,
          borderRadius: 12,
          fontSize: 16,
          fontWeight: FontWeight.w600,
          onPressed: _isUpdating ? (){
            showCustomSnackBar(
              title: 'Message',
              message: 'Please hold on',
              backgroundColor: ColorGlobalVariables.blueColor
            );
          } : () => _formValidation(),
        ),
      ),
    );
  }

  Widget _buildFormFieldsGrid() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 1.7,
        ),
        itemCount: selectedCategory?.itemFields.length,
        itemBuilder: (context, index) {
          final field = selectedCategory?.itemFields[index];
          final currentValue = selectedFields[field!.name] ?? 
            (field.label.toLowerCase().trim() == "color" ? _colorController.text : 
             field.label.toLowerCase().trim() == "year" ? year.toString() : "");

          return _buildFormFieldItem(field, currentValue);
        },
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
            color: ColorGlobalVariables.blackColor,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: () {
            if(field.type == "string" || field.type == "number"){
              _showFieldInputDialog(field.label, field.name, field.type, currentValue);
              return;
            }
            if(field.type == "enum"){
              _showSelectionDialog(
                context: context, 
                options: field.options, 
                onSelected: (selected){
                  setState(() {
                    selectedFields[field.name] = selected;
                  });
                }
              );
              return;
            }
            if(field.type == "year"){
              _showYearPicker();
              return;
            }
            if(field.type == "json"){
              _showColorPicker();
              return;
            }
          },
          child: Container(
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: ColorGlobalVariables.textFieldColor,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: Colors.grey.shade300,
                width: 1,
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
                        : Colors.grey.shade500,
                    ),
                  ),
                ),
                Icon(
                  Icons.arrow_drop_down,
                  color: Colors.grey.shade500,
                  size: 24,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildGoogleLocationAndPrice(){
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: _buildLocationField(),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: _buildPriceField(),
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
            color: ColorGlobalVariables.blackColor,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: () async {
            final result = await Get.toNamed(
              RouteClass.getLocationSearchPage(),
            );
            if (result != null) {
              setState(() {
                _currentPosition = result['position'];
                selectedLocation = result['locationName'];
              });
            }
          },
          child: Container(
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: ColorGlobalVariables.textFieldColor,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: Colors.grey.shade300,
                width: 1,
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.location_on,
                  color: Colors.grey.shade500,
                  size: 20,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    selectedLocation ?? "Search Location",
                    style: TextStyle(
                      color: selectedLocation != null 
                        ? ColorGlobalVariables.blackColor 
                        : Colors.grey.shade500,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPriceField() {
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
          height: 50,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: ColorGlobalVariables.textFieldColor,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: Colors.grey.shade300,
              width: 1,
            ),
          ),
          child: Row(
            children: [
              Text(
                '\$',
                style: TextStyle(
                  color: Colors.grey.shade500,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: TextFormField(
                  controller: _priceController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter price',
                  ),
                  style: TextStyle(
                    color: ColorGlobalVariables.blackColor,
                  ),
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return "Please enter price";
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

  Widget _buildFeatures(){
    return selectedCategory!.features.isEmpty ? const SizedBox() : Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Features',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: ColorGlobalVariables.blackColor,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: List.generate(
              selectedCategory!.features.length,
              (index) => _buildFeatureChip(selectedCategory!.features[index]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureChip(String feature) {
    final isSelected = selectedFeatures.contains(feature);
    
    return GestureDetector(
      onTap: () {
        setState(() {
          _toggleFeature(feature);
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? ColorGlobalVariables.brownColor : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? ColorGlobalVariables.brownColor : Colors.grey.shade300,
            width: 1,
          ),
        ),
        child: Text(
          feature,
          style: TextStyle(
            color: isSelected ? Colors.white : ColorGlobalVariables.blackColor,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({required String title, required String hintText, required TextEditingController controller, bool isFieldHeightRequired = false}){
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: ColorGlobalVariables.blackColor,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 12),
          Container(
            decoration: BoxDecoration(
              color: ColorGlobalVariables.textFieldColor,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: Colors.grey.shade300,
                width: 1,
              ),
            ),
            child: TextFormField(
              controller: controller,
              maxLines: isFieldHeightRequired ? 4 : 1,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hintText,
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              ),
              style: TextStyle(
                color: ColorGlobalVariables.blackColor,
              ),
              validator: (value){
                if(value == null || value.isEmpty){
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

  Widget _buildImagePickerSection() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Vehicle Images",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: ColorGlobalVariables.blackColor,
                  fontSize: 16,
                ),
              ),
              if (selectedImages.isNotEmpty)
                GestureDetector(
                  onTap: (){
                    setState(() {
                      selectedImages = [];
                    });
                  },
                  child: Text(
                    "Clear All",
                    style: TextStyle(
                      color: ColorGlobalVariables.maroonColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            "Tap to add images (2-4 required)",
            style: TextStyle(
              color: Colors.grey.shade600,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 16),
          GestureDetector(
            onTap: () => _pickImages(),
            child: Container(
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Colors.grey.shade300,
                  width: 1,
                  style: BorderStyle.solid,
                ),
              ),
              child: selectedImages.isEmpty 
                ? _buildEmptyImageState()
                : _buildImageGrid(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyImageState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.photo_library,
            size: 40,
            color: Colors.grey.shade400,
          ),
          const SizedBox(height: 8),
          Text(
            "Tap to add images",
            style: TextStyle(
              color: Colors.grey.shade500,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImageGrid() {
    return GridView.builder(
      padding: const EdgeInsets.all(8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: 4,
      itemBuilder: (context, index) {
        return _buildImageContainer(index);
      },
    );
  }

  Widget _buildImageContainer(int index) {
    final hasImage = selectedImages.length > index;
    final isNetworkImage = hasImage && selectedImages[index].path.startsWith('http');
    
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Colors.grey.shade300,
          width: 1,
        ),
      ),
      child: Stack(
        children: [
          if (hasImage)
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image(
                image: isNetworkImage 
                  ? NetworkImage(selectedImages[index].path) 
                  : FileImage(File(selectedImages[index].path)) as ImageProvider,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
            )
          else
            Container(
              color: Colors.grey.shade100,
              child: Center(
                child: Icon(
                  Icons.add_photo_alternate,
                  color: Colors.grey.shade400,
                  size: 24,
                ),
              ),
            ),
          
          if (hasImage)
            Positioned(
              top: 4,
              right: 4,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    selectedImages.removeAt(index);
                  });
                },
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.6),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.close,
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

  Future<void> _showCategorySelectionDialog(List<ItemCategory> categories) async {
    final selected = await showDialog<ItemCategory>(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                'Select Category',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: ColorGlobalVariables.blackColor,
                ),
              ),
            ),
            const Divider(height: 1),
            SizedBox(
              height: 300,
              width: double.infinity,
              child: ListView.builder(
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final category = categories[index];
                  return ListTile(
                    title: Text(category.name),
                    onTap: () => Navigator.pop(context, category),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );

    if (selected != null) {
      setState(() {
        selectedCategory = selected;
        selectedFields = {};
        selectedMake = null;
        selectedModel = null;
      });
    }
  }

  Future<void> _showMakeSelectionDialog(List<VehicleMake> makes) async {
    final selected = await showDialog<VehicleMake>(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                'Select Make',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: ColorGlobalVariables.blackColor,
                ),
              ),
            ),
            const Divider(height: 1),
            SizedBox(
              height: 300,
              width: double.infinity,
              child: ListView.builder(
                itemCount: makes.length,
                itemBuilder: (context, index) {
                  final make = makes[index];
                  return ListTile(
                    title: Text(make.name),
                    onTap: () => Navigator.pop(context, make),
                  );
                },
              ),
            ),
          ],
        ),
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
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                'Select Model',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: ColorGlobalVariables.blackColor,
                ),
              ),
            ),
            const Divider(height: 1),
            SizedBox(
              height: 300,
              width: double.infinity,
              child: ListView.builder(
                itemCount: models.length,
                itemBuilder: (context, index) {
                  final model = models[index];
                  return ListTile(
                    title: Text(model.name),
                    onTap: () => Navigator.pop(context, model),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );

    if (selected != null) {
      setState(() => selectedModel = selected);
    }
  }

  Future<void> _showFieldInputDialog(String fieldLabel, String fieldName, String fieldType, String currentValue) async {
    final controller = TextEditingController(text: currentValue);

    await showDialog<String>(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Enter $fieldLabel',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: ColorGlobalVariables.blackColor,
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: controller,
                keyboardType: fieldType == "string" ? TextInputType.text : TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Enter $fieldLabel",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                autofocus: true,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Cancel'),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () {
                      if (controller.text.trim().isNotEmpty) {
                        setState(() {
                          selectedFields[fieldName] = controller.text.toString().trim();
                        });
                        Navigator.pop(context, controller.text.trim());
                      }
                    },
                    child: const Text('OK'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _showSelectionDialog({
    required BuildContext context, 
    required List<dynamic>? options,
    required void Function(String) onSelected,
  }) async {
    final selected = await showDialog<String>(
      context: context, 
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  'Select an option',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: ColorGlobalVariables.blackColor,
                  ),
                ),
              ),
              const Divider(height: 1),
              SizedBox(
                height: 300,
                child: ListView.builder(
                  itemCount: options?.length ?? 0,
                  itemBuilder: (context, index) {
                    final option = options![index];
                    return ListTile(
                      title: Text(option.toString()),
                      onTap: () => Navigator.pop(context, option.toString()),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      });

    if (selected != null) {
      onSelected(selected);
    }
  }

  Future<void> _pickImages() async {
    try {
      final List<XFile> pickedFiles = await picker.pickMultiImage(
        maxWidth: 1000,
        maxHeight: 1000,
        imageQuality: 85,
      );

      if (pickedFiles != null && pickedFiles.isNotEmpty) {
        setState(() {
          selectedImages.addAll(pickedFiles);
          if(selectedImages.length > 4){
            selectedImages = selectedImages.sublist(0,4);
            showCustomSnackBar(
              title: 'Maximum Reached',
              message: 'Maximum of 4 images allowed',
              backgroundColor: ColorGlobalVariables.blueColor
            );
          }
        });
      }
    } catch(e) {
      showCustomSnackBar(
        title: 'Error',
        message: 'Error picking images: $e',
        backgroundColor: ColorGlobalVariables.redColor
      );
    }
  }
 
  void _showColorPicker() {
    showDialog(
      context: context, 
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Pick a color",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: ColorGlobalVariables.blackColor,
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 300,
                  child: ColorPicker(
                    pickerColor: color, 
                    onColorChanged: _changeColor,
                    showLabel: true,
                    pickerAreaHeightPercent: 0.8,
                    enableAlpha: true,
                    displayThumbColor: true,
                    portraitOnly: true,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('Cancel'),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('OK'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      }
    );
  }

  void _changeColor(Color newColor) {
    setState(() {
      color = newColor;
      _colorController.text = colorToHex(newColor);
    });
  }

  String colorToHex(Color color) {
    return "#${color.value.toRadixString(16).padLeft(8,'0').toUpperCase()}";
  }

  void _toggleFeature(String feature) {
    setState(() {
      if(selectedFeatures.contains(feature)){
        selectedFeatures.remove(feature);
      } else {
        selectedFeatures.add(feature);
      }
    });
  }

  void _showYearPicker() {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: SizedBox(
          height: 400,
          width: 300,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  'Select Year',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: ColorGlobalVariables.blackColor,
                  ),
                ),
              ),
              const Divider(height: 1),
              Expanded(
                child: SfDateRangePicker(
                  view: DateRangePickerView.decade,
                  initialSelectedDate: DateTime(year),
                  selectionColor: ColorGlobalVariables.brownColor,
                  onSelectionChanged: (args){
                    if(args.value is DateTime){
                      setState(() {
                        year = (args.value as DateTime).year;
                      });
                      Navigator.pop(context);
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}