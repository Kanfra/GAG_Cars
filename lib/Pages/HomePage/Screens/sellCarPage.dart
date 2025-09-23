import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

// Import your custom components and models here
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/Appbar/customAppbarOne.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/Buttons/customElevatedButton.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/Buttons/customTextButton.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/Checkboxes/roundCheckBox.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/Checkboxes/textCheckBox.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/Text/textMedium.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/Text/textSmall.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/customIcon.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/titleWithRowComponent.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/titleWithTextFormFieldComponent.dart';
import 'package:gag_cars_frontend/GlobalVariables/colorGlobalVariables.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Models/makeAndModelModel.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Models/itemsModel.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Providers/makeAndModelProvider.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Services/VehicleService/vehicleService.dart';
import 'package:gag_cars_frontend/Routes/routeClass.dart';
import 'package:gag_cars_frontend/Utils/WidgetUtils/widgetUtils.dart';

class SellCarPage extends StatefulWidget {
  const SellCarPage({super.key});

  @override
  State<SellCarPage> createState() => _SellCarPageState();
}

class _SellCarPageState extends State<SellCarPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _vehicleNameController = TextEditingController();
  final TextEditingController _mileageController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _numberOfPassengersController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _colorController = TextEditingController();

  bool isCarSelected = false;
  bool isSpaSelected = false;
  bool isMotobikeSelected = false;
  bool isShipSelected = false;
  String vehicleType = "";

  bool isNewSelected = false;
  bool isUsedSelected = false;
  String condition = "";

  bool isAlarmSelected = false;
  bool isCruiseControlSelected = false;
  bool isBluetoothSelected = false;
  bool isFrontParkingSensorSelected = false;
  List<String> features = ['Alarm', 'Cruise Control', 'Bluetooth', 'Front Parking Sensor']; 
  List<String> selectedFeatures = [];

  int year = 2000;
  Color color = Colors.transparent;
  String? selectedLocation;
  Position? _currentPosition;
  String? selectedSteerPosition;
  List<String> steerPositionOptions = ['Left', 'Right'];
  String? selectedEngineCapacity;
  List<String> engineCapacityOptions = ['1.0', '1.5', '2.0', '2.5', '3.0', '3.5', '4.0'];
  String? selectedTransmission;
  List<String> transmissionOptions = ['Automatic', 'Manual'];
  String? selectedBuildType;
  List<String> buildTypeOptions = ['Sedan', 'SUV', 'Hatchback', 'Coupe', 'Convertible', 'Truck'];
  String? selectedMileage;
  List<String> mileageOptions = ['0-10,000 km', '10,001-50,000 km', '50,001-100,000 km', '100,001+ km'];

  List<XFile> selectedImages = [];
  final ImagePicker picker = ImagePicker();
  Map<String?, dynamic>? selectedMakeAndModels;
  String? selectedModel;
  bool isLoadingMake = false;
  final logger = Logger();

  bool _isSelling = false; 

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final notifier = Provider.of<MakeAndModelProvider>(context, listen: false);
      notifier.fetchMakesWithModels().then((_) {
        setState(() {
          isLoadingMake = false;
        });
      }).catchError((error) {
        setState(() {
          isLoadingMake = false;
        });
        logger.e("Error loading makes: $error");
      });
    });
  }

  @override
  void dispose() {
    _vehicleNameController.dispose();
    _mileageController.dispose();
    _priceController.dispose();
    _numberOfPassengersController.dispose();
    _descriptionController.dispose();
    _colorController.dispose();
    super.dispose();
  }

  Future<void> sellCarFunction() async {
    final requestBody = {
  "user_id": "", // Make sure you have this value
  "brand_model_id": selectedModel != null ? int.tryParse(selectedModel!) ?? 0 : 0,
  "brand_id": selectedMakeAndModels?['id'] ?? 0,
  "category_id": 1, // Assuming this is correct for your vehicleType
  "name": _vehicleNameController.text,
  "slug": _vehicleNameController.text.toLowerCase().replaceAll(' ', '-'),
  "description": _descriptionController.text,
  "images": [],
  // uploadedImageUrls.join(','), // Convert list to comma-separated string
  "location": selectedLocation ?? '',
  "serial_number": "", // You'll need to get this value or generate it
  "condition": condition.toLowerCase(),
  "status": "active",
  "price": _priceController.text,
  "mileage": selectedMileage ?? '',
  "warranty": "0", // API expects string
  "warranty_expiration": "", // You'll need to calculate this if applicable
  // Omit fields not in the API spec:
  // - steerPosition
  // - engineCapacity
  // - transmission
  // - color
  // - buildType
  // - numberOfPassengers
  // - features
  // - brand
  // - category
};
    
    await VehicleService.uploadVehicle(
      requestBody: requestBody,
    );
  }

  Future<void> _formValidation() async {
    if (_formKey.currentState!.validate()) {
      if(vehicleType.isEmpty){
        showCustomSnackBar(
          backgroundColor: ColorGlobalVariables.redColor, 
          title: "Error", 
          message: 'Please select vehicle type'
        );
        return;
      }
      if(condition.isEmpty){
        showCustomSnackBar(
          backgroundColor: ColorGlobalVariables.redColor, 
          title: "Error", 
          message: 'Please select condition'
        );
        return;
      }
      if(selectedMakeAndModels == null){
        showCustomSnackBar(
          backgroundColor: ColorGlobalVariables.redColor, 
          title: "Error",
          message: 'Please select vehicle make' 
        );
        return;
      }
      if(selectedModel == null || selectedModel!.isEmpty){
        showCustomSnackBar(
          backgroundColor: ColorGlobalVariables.redColor, 
          title: "Error",
          message: 'Please select vehicle model' 
        );
        return;
      }
      if(_currentPosition == null && selectedLocation == null){
        showCustomSnackBar(
          backgroundColor: ColorGlobalVariables.redColor, 
          title: "Error",
          message: 'Please select vehicle location' 
        );
        return;
      }
      if(selectedBuildType == null || selectedBuildType == ""){
        showCustomSnackBar( 
          backgroundColor: ColorGlobalVariables.redColor, 
          title: "Error",
          message: 'Please select build type' 
        );
        return;
      }
      if(selectedMileage == null || selectedMileage == ""){
        showCustomSnackBar(
          backgroundColor: ColorGlobalVariables.redColor, 
          title: "Error",
          message: 'Please select mileage' 
        );
        return;
      }
      if(selectedFeatures.isEmpty){
        showCustomSnackBar(
          backgroundColor: ColorGlobalVariables.redColor, 
          title: "Error", 
          message: 'Please select features'
        );
        return;
      }
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
  Widget build(BuildContext context) {
    final makeModelNotifier = Provider.of<MakeAndModelProvider>(context);
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CustomAppbar(
        onLeadingIconClickFunction: (){}, 
        isLeadingWidgetExist: ColorGlobalVariables.trueValue,
        leadingIconData: Icons.arrow_back_ios, 
        appbarBackgroundColor: ColorGlobalVariables.whiteColor,
        titleText: ''
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Container(
            width: screenSize.width,
            height: screenSize.height,
            decoration: BoxDecoration(
              color: ColorGlobalVariables.whiteColor,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  // vehicle name
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TitleWithTextformfieldComponent(
                      title: "Vehicle Name", 
                      fontWeight: FontWeight.w500, 
                      textColor: ColorGlobalVariables.blackColor, 
                      obscureText: ColorGlobalVariables.falseValue, 
                      textInputType: TextInputType.text, 
                      editingController: _vehicleNameController, 
                      hintText: 'Enter name', 
                      fieldWidth: double.infinity,
                      isSuffixIconRequired: ColorGlobalVariables.falseValue, 
                      isPrefixIconRequired: ColorGlobalVariables.falseValue, 
                      isFieldHeightRequired: ColorGlobalVariables.falseValue, 
                      isTitleWithContainerWidgetRequired: false,
                      validatorFunction: (value){
                        if(value == null || value.isEmpty){
                          return "Please enter vehicle name";
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  // type of vehicle
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TitleWithRowComponent(
                      title: "Type of Vehicle", 
                      fontWeight: FontWeight.w500, 
                      textColor: ColorGlobalVariables.blackColor, 
                      children: [ 
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // car 
                            RoundCheckBox(
                              checkboxTextType: "Car", 
                              isChecked: isCarSelected, 
                              isIconAtFrontRequired: false,
                              onTap: (){
                                setState(() {
                                  isCarSelected = true;
                                  isSpaSelected = false;
                                  isMotobikeSelected = false;
                                  isShipSelected = false;
                                  vehicleType = "Car";
                                });
                              },
                            ),
                            // spa
                            RoundCheckBox(
                              checkboxTextType: "Spa", 
                              isChecked: isSpaSelected, 
                              isIconAtFrontRequired: false,
                              onTap: (){
                                setState(() {
                                  isCarSelected = false;
                                  isSpaSelected = true;
                                  isMotobikeSelected = false;
                                  isShipSelected = false;
                                  vehicleType = "Spa";
                                });
                              },
                            ),
                            // motobike
                            RoundCheckBox(
                              checkboxTextType: "Motobike", 
                              isChecked: isMotobikeSelected, 
                              isIconAtFrontRequired: false,
                              onTap: (){
                                setState(() {
                                  isCarSelected = false;
                                  isSpaSelected = false;
                                  isMotobikeSelected = true;
                                  isShipSelected = false;
                                  vehicleType = "Motobike";
                                });
                              },
                            ),
                            // ship
                            RoundCheckBox(
                              checkboxTextType: "Ship", 
                              isChecked: isShipSelected, 
                              isIconAtFrontRequired: false,
                              onTap: (){
                                setState(() {
                                  isCarSelected = false;
                                  isSpaSelected = false;
                                  isMotobikeSelected = false;
                                  isShipSelected = true;
                                  vehicleType = "Ship";
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  // row for condition and year
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // condition
                        Expanded(
                          child: TitleWithRowComponent(
                            title: 'Condition', 
                            fontWeight: FontWeight.w500, 
                            textColor: ColorGlobalVariables.blackColor, 
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  // new
                                  RoundCheckBox(
                                    checkboxTextType: "New", 
                                    isChecked: isNewSelected, 
                                    isIconAtFrontRequired: false,
                                    onTap: (){
                                      setState(() {
                                        isNewSelected = true;
                                        isUsedSelected = false;
                                        condition = "New";
                                      });
                                    },
                                  ),
                                  // used
                                  RoundCheckBox(
                                    checkboxTextType: "Used", 
                                    isChecked: isUsedSelected, 
                                    isIconAtFrontRequired: false,
                                    onTap: (){
                                      setState(() {
                                        isNewSelected = false;
                                        isUsedSelected = true;
                                        condition = "Used";
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ]
                          ),
                        ),
                        const SizedBox(width: 20),
                        // year
                        Expanded(
                          child: TitleWithTextformfieldComponent(
                            title: "Year", 
                            fontWeight: FontWeight.w500,
                            fieldWidth: double.infinity, 
                            textColor: ColorGlobalVariables.blackColor, 
                            obscureText: ColorGlobalVariables.falseValue, 
                            textInputType: TextInputType.datetime,
                            hintText: year.toString(), 
                            isSuffixIconRequired: false, 
                            isPrefixIconRequired: false, 
                            isFieldHeightRequired: false, 
                            isTitleWithContainerWidgetRequired: true,
                            onTitleWithContainerWidgetClickFunction: (){
                              _showYearPicker();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  // row for make and model
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        // make
                        Expanded(
                          child: isLoadingMake ? const Center(
                            child: SpinKitDoubleBounce(
                              color: ColorGlobalVariables.brownColor,
                              size: 40,
                            ),
                          ) : TitleWithTextformfieldComponent(
                            title: 'Make', 
                            fontWeight: FontWeight.w500, 
                            textColor: ColorGlobalVariables.blackColor, 
                            obscureText: false, 
                            textInputType: TextInputType.text, 
                            hintText: selectedMakeAndModels?['name'] ?? "Select Make",
                            isTitleWithContainerWidgetRequired: true,
                            fieldWidth: double.infinity,
                            isSuffixIconRequired: false, 
                            isPrefixIconRequired: false, 
                            isFieldHeightRequired: false, 
                            onTitleWithContainerWidgetClickFunction: () {
                              _showMakeSelectionDialog(
                                context: context,
                                makes: makeModelNotifier.makes,
                                onSelected: (make) async {
                                  setState(() {
                                    selectedMakeAndModels = {
                                      'name': make.name,
                                      'id': make.id,
                                      'brand_models': makeModelNotifier.getModelsForMake(make.id),
                                    };
                                  });
                                }
                              );
                            }
                          ),
                        ),
                        const SizedBox(width: 20),
                        // model
                        Expanded(
                          child: isLoadingMake ? const Center(
                            child: SpinKitDoubleBounce(
                              color: ColorGlobalVariables.brownColor,
                              size: 40,
                            ),
                          ) : TitleWithTextformfieldComponent(
                            title: 'Model', 
                            fontWeight: FontWeight.w500, 
                            textColor: ColorGlobalVariables.blackColor, 
                            obscureText: false, 
                            textInputType: TextInputType.text, 
                            hintText: selectedModel ?? "Select Model",
                            fieldWidth: double.infinity,
                            isSuffixIconRequired: false, 
                            isPrefixIconRequired: false, 
                            isFieldHeightRequired: false, 
                            isTitleWithContainerWidgetRequired: true,
                            onTitleWithContainerWidgetClickFunction: () {
                              if (selectedMakeAndModels == null) {
                                showCustomSnackBar(
                                  backgroundColor: ColorGlobalVariables.redColor,
                                  message: 'Select a Make first', 
                                  title: 'Error'
                                );
                                return;
                              }
                              _showModelSelectionDialog(
                                context: context,
                                models: selectedMakeAndModels?['brand_models'],
                                onSelected: (model) {
                                  setState(() {
                                    selectedModel = model;
                                  });
                                  logger.i("Selected model: $selectedModel");
                                }
                              );
                            }
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  // row for location and price
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
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
                    ),
                  ),
                  const SizedBox(height: 20),
                  // row for steer position and engine capacity
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        // steer position
                        Expanded(
                          child: TitleWithTextformfieldComponent(
                            title: 'Steer Position', 
                            fontWeight: FontWeight.w500, 
                            fieldWidth: double.infinity,
                            textColor: ColorGlobalVariables.blackColor, 
                            obscureText: false, 
                            textInputType: TextInputType.text,
                            hintText: selectedSteerPosition ?? "Left", 
                            isSuffixIconRequired: false, 
                            isPrefixIconRequired: false, 
                            isFieldHeightRequired: false, 
                            isTitleWithContainerWidgetRequired: true,
                            onTitleWithContainerWidgetClickFunction: () => _showSelectionDialog(
                              context: context,  
                              options: steerPositionOptions,
                              onSelected: (selected){
                                setState(() {
                                  selectedSteerPosition = selected;
                                });
                              }
                            )
                          ),
                        ),
                        const SizedBox(width: 20),
                        // engine capacity
                        Expanded(
                          child: TitleWithTextformfieldComponent(
                            title: 'Engine Capacity', 
                            fontWeight: FontWeight.w500,
                            fieldWidth: double.infinity, 
                            textColor: ColorGlobalVariables.blackColor, 
                            obscureText: false, 
                            textInputType: TextInputType.number, 
                            hintText: selectedEngineCapacity ?? "1.5", 
                            isSuffixIconRequired: false, 
                            isPrefixIconRequired: false, 
                            isFieldHeightRequired: false, 
                            isTitleWithContainerWidgetRequired: true,
                            onTitleWithContainerWidgetClickFunction: () => _showSelectionDialog(
                              context: context,  
                              options: engineCapacityOptions,
                              onSelected: (selected){
                                setState(() {
                                  selectedEngineCapacity = selected;
                                });
                              }
                            )
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  // row for transmission and color
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        // transmission
                        Expanded(
                          child: TitleWithTextformfieldComponent(
                            title: "Transmission", 
                            fieldWidth: double.infinity,
                            fontWeight: FontWeight.w500, 
                            textColor: ColorGlobalVariables.blackColor, 
                            obscureText: false, 
                            textInputType: TextInputType.text, 
                            hintText: selectedTransmission ?? "Automatic", 
                            isSuffixIconRequired: false, 
                            isPrefixIconRequired: false, 
                            isFieldHeightRequired: false, 
                            isTitleWithContainerWidgetRequired: true,
                            onTitleWithContainerWidgetClickFunction: () => _showSelectionDialog(
                              context: context,  
                              options: transmissionOptions,
                              onSelected: (selected){
                                setState(() {
                                  selectedTransmission = selected;
                                });
                              }
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        // color
                        Expanded(
                          child: TitleWithTextformfieldComponent(
                            title: 'Color', 
                            fontWeight: FontWeight.w500,
                            fieldWidth: double.infinity, 
                            textColor: Colors.black, 
                            obscureText: false, 
                            textInputType: TextInputType.text, 
                            editingController: _colorController, 
                            hintText: _colorController.text, 
                            isSuffixIconRequired: false, 
                            isPrefixIconRequired: false, 
                            isFieldHeightRequired: false, 
                            isTitleWithContainerWidgetRequired: true,
                            onTitleWithContainerWidgetClickFunction: (){
                              _showColorPicker();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  // row for build type and mileage
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        // build type
                        Expanded(
                          child: TitleWithTextformfieldComponent(
                            title: "Build Type", 
                            fontWeight: FontWeight.w500,
                            fieldWidth: double.infinity, 
                            textColor: ColorGlobalVariables.blackColor, 
                            obscureText: false, 
                            textInputType: TextInputType.text, 
                            hintText: selectedBuildType ?? "Sedan", 
                            isSuffixIconRequired: false, 
                            isPrefixIconRequired: false, 
                            isFieldHeightRequired: false, 
                            isTitleWithContainerWidgetRequired: true,
                            onTitleWithContainerWidgetClickFunction: () => _showSelectionDialog(
                              context: context,  
                              options: buildTypeOptions,
                              onSelected: (selected){
                                setState(() {
                                  selectedBuildType = selected;
                                });
                              }
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        // mileage
                        Expanded(
                          child: TitleWithTextformfieldComponent(
                            title: 'Mileage', 
                            fieldWidth: double.infinity,
                            fontWeight: FontWeight.w500, 
                            textColor: Colors.black, 
                            obscureText: false, 
                            textInputType: TextInputType.text, 
                            editingController: _mileageController, 
                            hintText: selectedMileage ?? "", 
                            isSuffixIconRequired: false, 
                            isPrefixIconRequired: false, 
                            isFieldHeightRequired: false, 
                            isTitleWithContainerWidgetRequired: true,
                            onTitleWithContainerWidgetClickFunction: () => _showSelectionDialog(
                              context: context,  
                              options: mileageOptions,
                              onSelected: (selected){
                                setState(() {
                                  selectedMileage = selected;
                                });
                              }
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  // number of passengers
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Expanded(
                          child: TitleWithTextformfieldComponent(
                            title: 'Number of Passengers', 
                            fontWeight: FontWeight.w500, 
                            textColor: ColorGlobalVariables.blackColor, 
                            obscureText: false, 
                            fieldWidth: double.infinity,
                            textInputType: TextInputType.number, 
                            editingController: _numberOfPassengersController, 
                            hintText: "4", 
                            isSuffixIconRequired: false, 
                            isPrefixIconRequired: false, 
                            isFieldHeightRequired: false, 
                            isTitleWithContainerWidgetRequired: false,
                            validatorFunction: (value){
                              if(value == null || value.isEmpty){
                                return "No of passengers required";
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(child: SizedBox(width: double.infinity))
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  // features
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TitleWithRowComponent(
                      title: "Features", 
                      fontWeight: FontWeight.w500, 
                      textColor: ColorGlobalVariables.blackColor, 
                      children: [
                        // first row
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // alarm
                            Expanded(
                              child: TextCheckBox(
                                checkBoxIconColor: ColorGlobalVariables.greenColor,
                                checkboxTextType: 'Alarm', 
                                isChecked: selectedFeatures.contains('Alarm'), 
                                isIconAtFrontRequired: false,
                                onTap: (){
                                  setState(() {
                                    _toggleFeature('Alarm');
                                  });
                                },
                              ),
                            ),
                            const SizedBox(width: 20),
                            // cruise control
                            Expanded(
                              child: TextCheckBox(
                                checkboxTextType: 'Cruise Control', 
                                checkBoxIconColor: ColorGlobalVariables.greenColor,
                                isChecked: selectedFeatures.contains('Cruise Control'), 
                                isIconAtFrontRequired: false,
                                onTap: (){
                                  setState(() {
                                    _toggleFeature('Cruise Control');
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        // second row
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // alarm
                            Expanded(
                              child: TextCheckBox(
                                checkboxTextType: 'Bluetooth', 
                                checkBoxIconColor: ColorGlobalVariables.greenColor,
                                isChecked: selectedFeatures.contains('Bluetooth'), 
                                isIconAtFrontRequired: false,
                                onTap: (){
                                  setState(() {
                                    _toggleFeature('Bluetooth');
                                  });
                                },
                              ),
                            ),
                            const SizedBox(width: 20),
                            // cruise control
                            Expanded(
                              child: TextCheckBox(
                                checkboxTextType: 'Front Parking Sensor', 
                                checkBoxIconColor: ColorGlobalVariables.greenColor,
                                isChecked: selectedFeatures.contains('Front Parking Sensor'), 
                                isIconAtFrontRequired: false,
                                onTap: (){
                                  setState(() {
                                    _toggleFeature('Front Parking Sensor');
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ]
                    ),
                  ),
                  const SizedBox(height: 20),
                  // description
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TitleWithTextformfieldComponent(
                      title: "Description", 
                      fontWeight: FontWeight.w500, 
                      textColor: ColorGlobalVariables.blackColor, 
                      obscureText: false, 
                      textInputType: TextInputType.text, 
                      editingController: _descriptionController, 
                      hintText: 'Write description about your car', 
                      fieldWidth: double.infinity,
                      isSuffixIconRequired: false, 
                      isPrefixIconRequired: false, 
                      isFieldHeightRequired: true, 
                      isTitleWithContainerWidgetRequired: false,
                      validatorFunction: (value){
                        if(value == null || value.isEmpty){
                          return "Please enter your description";
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  // button for upload images
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
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
                        const SizedBox(height: 20),
                        // images
                        GestureDetector(
                          onTap: () => _pickImages(),
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 15),
                            width: double.infinity,
                            height: 280,
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
                                            image: selectedImages.isEmpty ? null : DecorationImage(
                                              image: FileImage(File(selectedImages[0].path)),
                                              fit: BoxFit.cover,
                                              colorFilter: ColorFilter.mode(
                                                Colors.black.withOpacity(0.7), 
                                                BlendMode.darken
                                              )
                                            ),
                                          ),
                                          child: selectedImages.isEmpty ? CustomIcon(
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
                                          image: selectedImages.isEmpty ? null : DecorationImage(
                                            image: FileImage(File(selectedImages[1].path)),
                                            fit: BoxFit.cover,
                                            colorFilter: ColorFilter.mode(
                                              Colors.black.withOpacity(0.7), 
                                              BlendMode.darken
                                            )
                                          ),
                                        ),
                                        child: selectedImages.isEmpty ? CustomIcon(
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
                                          image: selectedImages.isEmpty ? null : DecorationImage(
                                            image: FileImage(File(selectedImages[2].path)),
                                            fit: BoxFit.cover,
                                            colorFilter: ColorFilter.mode(
                                              Colors.black.withOpacity(0.7), 
                                              BlendMode.darken
                                            )
                                          ),
                                        ),
                                        child: selectedImages.isEmpty ? CustomIcon(
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
                                        image: selectedImages.isEmpty ? null : DecorationImage(
                                          image: FileImage(File(selectedImages[3].path)),
                                          fit: BoxFit.cover,
                                          colorFilter: ColorFilter.mode(
                                            Colors.black.withOpacity(0.7), 
                                            BlendMode.darken
                                          )
                                        ),
                                      ),
                                      child: selectedImages.isEmpty ? CustomIcon(
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
                    ),
                  ),
                  const SizedBox(height: 20),
                  // sell car button
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: CustomElevatedButton(
                      buttonTextType: "Sell Car", 
                      textTypeColor: ColorGlobalVariables.whiteColor, 
                      buttonVerticalPadding: 15,
                      borderRadius: 8,
                      isFullButtonWidthRequired: true, 
                      buttonBackgroundColor: _isSelling ? ColorGlobalVariables.greyColor : ColorGlobalVariables.redColor, 
                      onClickFunction: _isSelling ? (){
                        showCustomSnackBar(
                          title: 'Message',
                          message: 'Please hold on',
                          backgroundColor: ColorGlobalVariables.blueColor
                        );
                      } : () => _formValidation(),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _showMakeSelectionDialog({
    required BuildContext context, 
    required List<VehicleMake>? makes,
    required void Function(VehicleMake) onSelected,
  }) async {
    final selected = await showDialog<VehicleMake>(
      context: context, 
      builder: (BuildContext context) {
        return SimpleDialog(
          title: TextMedium(
            title: 'Select Make', 
            fontWeight: FontWeight.normal, 
            textColor: ColorGlobalVariables.blackColor
          ),
          children: makes?.map((make) {
            return SimpleDialogOption(
              onPressed: (){
                Navigator.pop(context, make);
              },
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: TextSmall(
                  title: make.name, 
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

Future<void> _showModelSelectionDialog({
  required BuildContext context, 
  required List<dynamic> models,
  required void Function(String selected) onSelected,
}) async {
  final selected = await showDialog<VehicleModel>(
    context: context, 
    builder: (BuildContext context) {
      return SimpleDialog(
        title: TextMedium(
          title: 'Select Model', 
          fontWeight: FontWeight.normal, 
          textColor: ColorGlobalVariables.blackColor
        ),
        children: models.map((model) {
          return SimpleDialogOption(
            onPressed: (){
              Navigator.pop(context, model);
            },
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: TextSmall(
                title: model.name, 
                fontWeight: FontWeight.normal, 
                textColor: ColorGlobalVariables.blackColor
              ),
            ),
          );
        }).toList(),
      );
    });

  if (selected != null) {
    onSelected(selected.name); // Pass the name instead of the whole object
  }
}

  Future<void> _showSelectionDialog({
    required BuildContext context, 
    required List options,
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
          children: options.map((option) {
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

  void _changeColor(Color color) {
    setState(() {
      color = color;
      _colorController.text = colorToHex(color);
    });
  }

  String colorToHex(Color color) {
    return "#${color.value.toRadixString(16).padLeft(8,'0').toUpperCase()}";
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
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: TextSmall(
                title: 'Maximum of 4 images allowed', 
                fontWeight: FontWeight.w500, 
                textColor: ColorGlobalVariables.redColor
              )
            )
          );
        }
      });
    } catch(e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: TextSmall(
            title: "Error picking images: $e", 
            fontWeight: FontWeight.w500, 
            textColor: ColorGlobalVariables.redColor,
          ),
        )
      );
    }
  }

  void _toggleFeature(String feature) {
    if(selectedFeatures.contains(feature)){
      selectedFeatures.remove(feature);
    } else {
      selectedFeatures.add(feature);
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
}
