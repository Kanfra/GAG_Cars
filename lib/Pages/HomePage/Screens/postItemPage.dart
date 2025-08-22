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
import 'package:gag_cars_frontend/Routes/routeClass.dart';
import 'package:gag_cars_frontend/Utils/WidgetUtils/widgetUtils.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class PostItemPage extends StatefulWidget {
  const PostItemPage({super.key});

  @override
  State<PostItemPage> createState() => _PostItemPageState();
}

class _PostItemPageState extends State<PostItemPage> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
  bool _isSelling = false;

  // for selected items from options
  Map<String?, dynamic> selectedFields = {};

  // sell car function
    Future<void> sellCarFunction() async {
    if(_colorController.text.toString().trim().isNotEmpty){
       selectedFields['color'] = _colorController.text.toString().trim();
      }
    if(year.toString().isNotEmpty){
      selectedFields['year'] = year.toString().trim();
    }

    final normalizedFields = selectedFields.map((key, value) => 
      MapEntry(key?.toLowerCase().replaceAll(' ', '_'), value));

    // converting XFiles to files before sending
    List<File> imageFiles = await Future.wait(
      selectedImages.map((xFile) async => File(xFile.path))
    );
    final requestBody = {
      'category_id': selectedCategory?.id,
      'brand_id': selectedMake?["id"],
      'brand_model_id': selectedModel?.id, 
      'name': _itemNameController.text.toString(),
      'slug': createSlug(name: _itemNameController.text.toString().trim(), isUniqueRandomSlugRequiredOrTimestampSlug: ColorGlobalVariables.trueValue),
      ...normalizedFields,
      'location': selectedLocation,
      'price': _priceController.text.toString(),
      'description': _itemDescriptionController.text.toString(),
      'features': selectedFeatures ?? [],
      'images': imageFiles // sending List<File> instead of List<XFile>
    };
    // if()
    logger.i("Request body: $requestBody");
    
    await VehicleService.uploadVehicle(
      requestBody: requestBody,
    );
  }

  // form validation function
    Future<void> _formValidation() async {
    if (_formKey.currentState!.validate()) {
      // if(selectedFields.containsKey('Condition') && selectedFields['Condition']!.isEmpty){
      //   showCustomSnackBar(
      //     backgroundColor: ColorGlobalVariables.redColor, 
      //     title: "Error", 
      //     message: 'Please select ${selectedFields['Condition']}'
      //   );
      //   return;
      // }
      // if(selectedFields.containsKey('Build Type') && selectedFields['Build Type']!.isEmpty){
      //   showCustomSnackBar(
      //     backgroundColor: ColorGlobalVariables.redColor, 
      //     title: "Error", 
      //     message: 'Please select ${selectedFields['Build Type']}'
      //   );
      //   return;
      // }
      if(selectedImages.isEmpty || selectedImages.length < 2){
        showCustomSnackBar(
          backgroundColor: ColorGlobalVariables.redColor, 
          title: "Error",
          message: 'Please upload at least 2 images and at most 4 images', 
        );
        return;
      }
      setState((){
        _isSelling = true;
      });
      try{
        await sellCarFunction();
        showCustomSnackBar(
          backgroundColor: ColorGlobalVariables.greenColor,
          title: 'Success',
          message: 'Vehicle listed successfully'
        );

        // optionally reset form or navigate away
        // _formKey.currentState?.reset();
        // Navigate.pop(context);
      }catch(e){
        showCustomSnackBar(
          backgroundColor: ColorGlobalVariables.redColor,
          title: 'Error',
          message: 'Failed to list vehicle: ${e.toString()}'
        );
      } finally{
        setState(() {
          _isSelling = false;
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
    } catch (e) {
      logger.e("Error loading initial data: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to load data: ${e.toString()}'))
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final categoriesProvider = Provider.of<ItemCategoriesProvider>(context);
    final makeModelProvider = Provider.of<MakeAndModelProvider>(context);
    // logger.i("Selected category at build: ${selectedCategory}");
    // logger.i("Selected features: ${selectedFeatures}");
    logger.i("Selected make: $selectedMake and Selected model: $selectedModel");

    return Scaffold(
      appBar: CustomAppbar(
        onLeadingIconClickFunction: () => Navigator.pop(context),
        isLeadingWidgetExist: true,
        leadingIconData: Icons.arrow_back_ios,
        titleText: 'Post New Item',
      ),   
      body: (categoriesProvider.isLoading && makeModelProvider.isLoading)
          ? const Center(child: CircularProgressIndicator(),)
          : (categoriesProvider.error != null || makeModelProvider.error != null) ? _buildErrorView(categoriesProvider, makeModelProvider) : _buildMainContent(screenSize, categoriesProvider, makeModelProvider),
      //  
    );
  }

  Widget _buildLoadingIndicator() {
    return const Center(
      child: SpinKitDoubleBounce(
        color: ColorGlobalVariables.brownColor,
        size: 40,
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
    return SingleChildScrollView(
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
                  const SizedBox(height: 15),
                  _buildTextField(
                    title: "Vehicle Name",
                    hintText: "Enter name",
                    controller: _itemNameController,
                  ),
                  const SizedBox(height: 15,),
                  _buildMakeModelRow(makeModelProvider),
                  const SizedBox(height: 15),
                  _buildFormFieldsGrid(),
                  const SizedBox(height: 15),
                  _buildGoogleLocationAndPrice(),
                  const SizedBox(height: 15),
                  _buildFeatures(),
                  selectedCategory!.features.isEmpty ? const SizedBox() : const SizedBox(height: 15),
                  // description
                  _buildTextField(
                    title: "Description",
                    hintText: "Enter description",
                    isFieldHeightRequired: ColorGlobalVariables.trueValue,
                    controller: _itemDescriptionController,
                  ),
                  const SizedBox(height: 10),
                  _buildImagePickerSection(),
                  const SizedBox(height: 20,),
                  _buildSellButton(),
                  const SizedBox(height: 20,),
                ],
              ) : Container(
                padding: const EdgeInsets.symmetric(horizontal: 20,),
                height: screenSize.height*0.3,
                child: Center(
                  child: TextSmall(
                    title: "Select a Category", 
                    fontWeight: FontWeight.normal, 
                    textColor: ColorGlobalVariables.blackColor
                    ),
                ),
              ),
            ],
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            categoriesProvider.error ?? makeModelProvider.error ?? 'Unknown error',
            style: const TextStyle(color: Colors.red),
          ),
          ElevatedButton(
            onPressed: _loadInitialData,
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryField(ItemCategoriesProvider provider) {
    return TitleWithTextformfieldComponent(
      title: 'Category',
      hintText: selectedCategory?.name ?? "Select a Category",
      onTitleWithContainerWidgetClickFunction: () {
        _showCategorySelectionDialog(provider.categories?.data ?? []);
      }, 
      fontWeight: FontWeight.w500, 
      textColor: ColorGlobalVariables.blackColor, 
      obscureText: false, 
      isTitleWithContainerWidgetRequired: true, 
      isSuffixIconRequired: false, 
      isPrefixIconRequired: false, 
      isFieldHeightRequired: false,
      // ... other parameters from your original implementation
    );
  }

  Widget _buildMakeModelRow(MakeAndModelProvider provider) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: TitleWithTextformfieldComponent(
            title: 'Make',
            hintText: selectedMake?['name'] ?? "Select Make",
            onTitleWithContainerWidgetClickFunction: () {
              _showMakeSelectionDialog(provider.makes ?? []);
            },
            fontWeight: FontWeight.w500, 
            textColor: ColorGlobalVariables.blackColor, 
            obscureText: false,  
            isTitleWithContainerWidgetRequired: true, 
            isSuffixIconRequired: false, 
            isPrefixIconRequired: false, 
            isFieldHeightRequired: false,
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: TitleWithTextformfieldComponent(
            title: 'Model',
            hintText: selectedModel?.name ?? "Select Model",
            onTitleWithContainerWidgetClickFunction: () {
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
            fontWeight: FontWeight.w500, 
            textColor: ColorGlobalVariables.blackColor, 
            obscureText: false, 
            isTitleWithContainerWidgetRequired: true, 
            isSuffixIconRequired: false, 
            isPrefixIconRequired: false, 
            isFieldHeightRequired: false,
          ),
        ),
      ],
    );
  }
  // function for sell button
  Widget _buildSellButton(){
    return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: CustomButton(
                      isLoading: _isSelling, 
                      buttonName: 'Sell Car',
                      backgroundColor: ColorGlobalVariables.brownColor,
                      onPressed: _isSelling ? (){
                        showCustomSnackBar(
                          title: 'Message',
                          message: 'Please hold on',
                          backgroundColor: ColorGlobalVariables.blueColor
                        );
                      } : () => _formValidation(),
                    ),
                  );
  }
  Widget _buildFormFieldsGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 15,
        childAspectRatio: 1.7,
      ),
      itemCount: selectedCategory?.itemFields.length,
      itemBuilder: (context, index) {
        final field = selectedCategory?.itemFields[index];
        // setState(() {
        //   getFields = field;
        // });
      // logger.i("Get item fields from api: $getFields");
        return TitleWithTextformfieldComponent(
          title: field!.label,
          hintText: (field.options == null || field.options!.isEmpty) ? (field.label.toLowerCase().trim() == "color" ? _colorController.text : field.label.toLowerCase().trim() == "year" ? year.toString() : selectedFields[field.name] ?? "Select ${field.label}") : selectedFields[field.name] ?? "Select ${field.label}",
          onTitleWithContainerWidgetClickFunction: () {
            // _showFieldInputDialog(field.name);
              // (field.options == null || field.options!.isEmpty) ? field.label.toLowerCase().trim() == "color" ? _showColorPicker() : field.label.toLowerCase().trim() == "year" ? _showYearPicker() : _showFieldInputDialog(field.label, field.name) : _showSelectionDialog(
              // context: context, 
              // options: field.options, 
              // onSelected: (selected){
              //   setState(() {
              //     selectedFields[field.name] = selected;
              //   });
              // }
              // );

              // has no option but needs input field 
              if(field.type == "string" || field.type == "number"){
                _showFieldInputDialog(field.label, field.name, field.type);
                return;
              }
              // holds options
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

              // if year exist
              if(field.type == "year"){
                _showYearPicker();
                return;
              }

              // if json exist color
              if(field.type == "json"){
                _showColorPicker();
                return;
              }
          }, 
        fontWeight: FontWeight.w500,
        fieldWidth: double.infinity, 
        textColor: ColorGlobalVariables.blackColor, 
        obscureText: ColorGlobalVariables.falseValue, 
        isTitleWithContainerWidgetRequired: true, 
        isSuffixIconRequired: false, 
        isPrefixIconRequired: false, 
        isFieldHeightRequired: false,
        );
      },
    );
  }

  Widget _buildGoogleLocationAndPrice(){
    return Row(
            children: [
              // location
              Expanded(
                child: TitleWithTextformfieldComponent(
                  title: 'Location', 
                  fontWeight: FontWeight.w500,
                  fieldWidth: double.infinity, 
                  textColor: ColorGlobalVariables.blackColor, 
                  obscureText: false, 
                  overflow: TextOverflow.ellipsis,
                  textInputType: TextInputType.text, 
                  hintText: _currentPosition != null 
                    ? "Lat: ${_currentPosition!.latitude.toStringAsFixed(4)}, Lng: ${_currentPosition!.longitude.toStringAsFixed(4)}"
                    : selectedLocation ?? "Search Location", 
                  isSuffixIconRequired: false, 
                  isPrefixIconRequired: false, 
                  isFieldHeightRequired: false, 
                  isTitleWithContainerWidgetRequired: true,
                  onTitleWithContainerWidgetClickFunction: () async {
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
                ),
              ),
              const SizedBox(width: 20),
              // price
              Expanded(
                child: TitleWithTextformfieldComponent(
                  title: 'Price', 
                  fontWeight: FontWeight.w500,
                  fieldWidth: double.infinity, 
                  textColor: ColorGlobalVariables.blackColor, 
                  obscureText: false, 
                  textInputType: TextInputType.number, 
                  editingController: _priceController, 
                  hintText: 'Enter price', 
                  isSuffixIconRequired: false, 
                  isPrefixIconRequired: false, 
                  isFieldHeightRequired: false, 
                  isTitleWithContainerWidgetRequired: false,
                  validatorFunction: (value){
                    if(value == null || value.isEmpty){
                      return "Please enter price";
                    }
                    return null;
                  },
                ),
              ),
            ],
          );
  }

  Widget _buildFeatures(){
  return selectedCategory!.features.isEmpty ? const SizedBox() :TitleWithRowComponent(
  title: 'Features', 
  fontWeight: FontWeight.w500,
  textColor: ColorGlobalVariables.blackColor,
  children: [
    Wrap(
        spacing: 8.0,
        runSpacing: 8.0,
        alignment: WrapAlignment.start,
        children: List.generate(
        selectedCategory!.features.length,
        (index)=> TextCheckBox(
                    checkBoxIconColor: ColorGlobalVariables.greenColor,
                    checkboxTextType: selectedCategory!.features[index], 
                    isChecked: selectedFeatures.contains(selectedCategory!.features[index]), 
                    isIconAtFrontRequired: false,
                    onTap: (){
                      setState(() {
                        _toggleFeature(selectedCategory!.features[index]);
                      });
                    },
                  ),
                ),),
  ],
  );
  }

  Widget _buildTextField({required String title, required String hintText, required TextEditingController controller, bool isFieldHeightRequired = false}){
    return TitleWithTextformfieldComponent(
      title: title, 
      fontWeight: FontWeight.w500, 
      textColor: ColorGlobalVariables.blackColor, 
      obscureText: ColorGlobalVariables.falseValue, 
      textInputType: TextInputType.text, 
      editingController: controller, 
      hintText: hintText, 
      fieldWidth: double.infinity,
      isSuffixIconRequired: ColorGlobalVariables.falseValue, 
      isPrefixIconRequired: ColorGlobalVariables.falseValue, 
      isFieldHeightRequired: isFieldHeightRequired, 
      isTitleWithContainerWidgetRequired: false,
      validatorFunction: (value){
        if(value == null || value.isEmpty){
          return "Please enter vehicle name";
        }
        return null;
      },
    );
  }
  Widget _buildImagePickerSection() {
    return // button for upload images
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //row product images text and clear button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Product Images
              TextSmall(
                title: "Product Images", 
                fontWeight: FontWeight.w500, 
                textColor: ColorGlobalVariables.blackColor,
              ),
              // clear images
              CustomTextButton(
                buttonTextType: "Clear Images", 
                textTypeColor: ColorGlobalVariables.maroonColor, 
                isFullButtonWidthRequired: false, 
                buttonBackgroundColor: Colors.transparent, 
                onClickFunction: (){
                  setState(() {
                    selectedImages = [];
                  });
                }
              ),
            ],
          ),
          const SizedBox(height: 5),
          // images
          GestureDetector(
            onTap: () => _pickImages(),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              width: double.infinity,
              height: 250,
              child: Row(
                children: [
                  // first column for images
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 4,
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: ColorGlobalVariables.textFieldColor,
                              borderRadius: BorderRadius.circular(12),
                              image: selectedImages.isNotEmpty ? DecorationImage(
                                image: FileImage(File(selectedImages[0].path)),
                                fit: BoxFit.cover,
                                colorFilter: ColorFilter.mode(
                                  Colors.black.withOpacity(0.7), 
                                  BlendMode.darken
                                )
                              ) : null,
                            ),
                            child: selectedImages.length <= 0 ? CustomIcon(
                              iconData: Icons.photo_library, 
                              isFaIcon: false, 
                              iconSize: 60,
                              iconColor: ColorGlobalVariables.blueColor
                            ) : null,
                          )),
                      const SizedBox(height: 15),
                      Expanded(
                        flex: 2,
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: ColorGlobalVariables.textFieldColor,
                            borderRadius: BorderRadius.circular(12),
                            image: selectedImages.length > 1 ? DecorationImage(
                              image: FileImage(File(selectedImages[1].path)),
                              fit: BoxFit.cover,
                              colorFilter: ColorFilter.mode(
                                Colors.black.withOpacity(0.7), 
                                BlendMode.darken
                              )
                            ) : null,
                          ),
                          child: selectedImages.length <= 1 ? CustomIcon(
                            iconData: Icons.photo, 
                            isFaIcon: false, 
                            iconSize: 50,
                            iconColor: ColorGlobalVariables.blueColor
                          ) : null,
                        )),
                    ],
                  )
                ),
                const SizedBox(width: 15),
                // second column for images
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: ColorGlobalVariables.textFieldColor,
                            borderRadius: BorderRadius.circular(12),
                            image: selectedImages.length > 2 ? DecorationImage(
                              image: FileImage(File(selectedImages[2].path)),
                              fit: BoxFit.cover,
                              colorFilter: ColorFilter.mode(
                                Colors.black.withOpacity(0.7), 
                                BlendMode.darken
                              )
                            ) : null,
                          ),
                          child: selectedImages.length <= 2 ? CustomIcon(
                            iconData: Icons.photo, 
                            isFaIcon: false, 
                            iconSize: 60,
                            iconColor: ColorGlobalVariables.blueColor
                          ) : null,
                        )),
                    const SizedBox(height: 15),
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: ColorGlobalVariables.textFieldColor,
                          borderRadius: BorderRadius.circular(12),
                          image: selectedImages.length > 3 ? DecorationImage(
                            image: FileImage(File(selectedImages[3].path)),
                            fit: BoxFit.cover,
                            colorFilter: ColorFilter.mode(
                              Colors.black.withOpacity(0.7), 
                              BlendMode.darken
                            )
                          ) : null,
                        ),
                        child: selectedImages.length <= 3 ? CustomIcon(
                          iconData: Icons.photo, 
                          isFaIcon: false, 
                          iconSize: 50,
                          iconColor: ColorGlobalVariables.blueColor
                        ) : null,
                      )),
                    ],
                  )
                ),
              ],
            ),
          ),),
        ],
      );
  }

  Future<void> _showCategorySelectionDialog(List<ItemCategory> categories) async {
    final selected = await showDialog<ItemCategory>(
      context: context,
      builder: (context) => SimpleDialog(
        title: const Text('Select Category'),
        children: categories.map((category) {
          return SimpleDialogOption(
            onPressed: () => Navigator.pop(context, category),
            child: Text(category.name),
          );
        }).toList(),
      ),
    );

    if (selected != null) {
      setState(() {
        selectedCategory = selected;
        selectedFields = {};
        // Reset make/model when category changes
        selectedMake = null;
        selectedModel = null;
      });
    }
  }

  Future<void> _showMakeSelectionDialog(List<VehicleMake> makes) async {
    final selected = await showDialog<VehicleMake>(
      context: context,
      builder: (context) => SimpleDialog(
        title: const Text('Select Make'),
        children: makes.map((make) {
          return SimpleDialogOption(
            onPressed: () => Navigator.pop(context, make),
            child: Text(make.name),
          );
        }).toList(),
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
      builder: (context) => SimpleDialog(
        title: const Text('Select Model'),
        children: models.map((model) {
          return SimpleDialogOption(
            onPressed: () => Navigator.pop(context, model),
            child: Text(model.name),
          );
        }).toList(),
      ),
    );

    if (selected != null) {
      setState(() => selectedModel = selected);
    }
  }

Future<void> _showFieldInputDialog(String fieldLabel, String fieldName, String fieldType) async {
  // Initialize controller with existing value if available
  final controller = TextEditingController();

  final result = await showDialog<String>(
    context: context,
    builder: (context) => AlertDialog(
      title: Text('Enter $fieldLabel'),
      content: TextField(
        controller: controller,
        keyboardType: fieldType == "string" ? TextInputType.text : TextInputType.number,
        decoration: InputDecoration(
          hintText: "Enter $fieldLabel",
          // Show current value as hint if exists
          labelText: selectedFields[fieldName],
        ),
        autofocus: true,  // Auto-focus keyboard
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        TextButton(
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
  );

  if (result != null && result.isNotEmpty) {
    setState(() {
      selectedFields[fieldName] = result;
      // Special handling for color field if needed
      // if (fieldLabel.toLowerCase() == 'color') {
      //   _colorController.text = result;
      // }
    });
    // logger.i("Updated $fieldLabel: $result");
  }
}

    Future<void> _showSelectionDialog({
    required BuildContext context, 
    required List<dynamic>? options,
    required void Function(String) onSelected,
  }) async {
    final selected = await showDialog<String>(
      context: context, 
      builder: (BuildContext context) {
        return SimpleDialog(
          title: TextMedium(
            title: 'Select an option', 
            fontWeight: FontWeight.normal, 
            textColor: ColorGlobalVariables.blackColor
          ),
          children: options?.map((option) {
            return SimpleDialogOption(
              onPressed: (){
                Navigator.pop(context, option);
              },
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: TextSmall(
                  title: option, 
                  fontWeight: FontWeight.normal, 
                  textColor: ColorGlobalVariables.blackColor
                ),
              ),
            );
          }).toList(),
        );
      });

    if (selected != null) {
      onSelected(selected);
    }
  }

  // Future<void> _submitForm() async {
  //   if (!_formKey.currentState!.validate()) return;
  //   if (selectedCategory == null) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(content: Text('Please select a category')),
  //     );
  //     return;
  //   }
  //   if (selectedMake == null || selectedModel == null) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(content: Text('Please select make and model')),
  //     );
  //     return;
  //   }

  //   setState(() => _isLoading = true);
  //   try {
  //     // TODO: Implement your form submission logic here
  //     // logger.i('Submitting form with data: ${{
  //     //   'category': selectedCategory!.name,
  //     //   'make': selectedMake!['name'],
  //     //   'model': selectedModel!.name,
  //     //   'fields': fieldValues,
  //     //   'images': selectedImages.length,
  //     // }}', );

  //     // Simulate API call
  //     await Future.delayed(const Duration(seconds: 2));

  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(content: Text('Item posted successfully!')),
  //     );
  //     Navigator.pop(context);
  //   } catch (e) {
  //     logger.e('Error submitting form: $e');
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text('Failed to post item: ${e.toString()}')),
  //     );
  //   } finally {
  //     setState(() => _isLoading = false);
  //   }
  // }

Future<void> _pickImages() async {
    try {
      final List<XFile> pickedFiles = await picker.pickMultiImage(
        maxWidth: 1000,
        maxHeight: 1000,
        imageQuality: 85,
      );

      setState(() {
        selectedImages.addAll(pickedFiles);
        if(selectedImages.length > 4){
          selectedImages = selectedImages.sublist(0,4);
          showCustomSnackBar(
            title: 'Error',
            message: 'Maximum of 4 images allowed',
            textColor: ColorGlobalVariables.whiteColor,
          );
        }
      });
    } catch(e) {
      showCustomSnackBar(
        title: 'Error',
        message: 'Error picking images: $e',
        textColor: ColorGlobalVariables.whiteColor,
      );
    }
  }
 
   void _showColorPicker() {
    showDialog(
      context: context, 
      builder: (BuildContext context) {
        return AlertDialog(
          title: const TextSmall(
            title: "Pick a color", 
            fontWeight: FontWeight.w500, 
            textColor: ColorGlobalVariables.blackColor
          ),
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: color, 
              onColorChanged: _changeColor,
              showLabel: true,
              pickerAreaHeightPercent: 0.8,
              enableAlpha: true,
              displayThumbColor: true,
            ),
          ),
          actions: [
            CustomTextButton(
              buttonTextType: "OK", 
              textTypeColor: ColorGlobalVariables.whiteColor, 
              isFullButtonWidthRequired: false, 
              buttonBackgroundColor: ColorGlobalVariables.greyColor, 
              onClickFunction: (){
                Navigator.of(context).pop();
              }
            ),
          ],
        );
      }
    );
  }

   void _changeColor(Color color) {
    setState(() {
      color = color;
      _colorController.text = colorToHex(color);
    });
  }

  String colorToHex(Color color) {
    return "#${color.value.toRadixString(16).padLeft(8,'0').toUpperCase()}";
  }
 void _toggleFeature(String feature) {
    if(selectedFeatures.contains(feature)){
      selectedFeatures.remove(feature);
    } else {
      selectedFeatures.add(feature);
    }
  }

    void _showYearPicker() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: SizedBox(
          height: 300,
          width: 300,
          child: SfDateRangePicker(
            view: DateRangePickerView.decade,
            initialSelectedDate: DateTime(year),
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
      )
    );
  }

}