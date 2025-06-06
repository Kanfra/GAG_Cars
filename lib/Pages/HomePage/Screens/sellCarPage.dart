import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as DatePicker;
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/Appbar/customAppbarOne.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/Buttons/customElevatedButton.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/Buttons/customTextButton.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/Checkboxes/roundCheckBox.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/Checkboxes/textCheckBox.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/Links/links.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/Text/textMedium.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/Text/textSmall.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/customIcon.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/titleWithRowComponent.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/titleWithTextFormFieldComponent.dart';
import 'package:gag_cars_frontend/GlobalVariables/colorGlobalVariables.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class SellCarPage extends StatefulWidget {
  const SellCarPage({super.key});

  @override
  State<SellCarPage> createState() => _SellCarPageState();
}

class _SellCarPageState extends State<SellCarPage> {
  //
  
  // for validation
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _vehicleNameController = TextEditingController();
  final TextEditingController _mileageController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  //TextEditingController _engineCapacityController = TextEditingController();
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

  // year
  int year = 2000;

  // color
  Color color = Colors.transparent;

  // location
  String? selectedLocation;

  // steer position
  String? selectedSteerPosition;
  List<String> steerPositionOptions = ['Option 1', 'Option 2', 'Option 3', 'Option 4'];

  // engine capacity
  String? selectedEngineCapacity;
  List<String> engineCapacityOptions = ['1.0', '2.0', '3.0'];

  // transmission
  String? selectedTransmission;
  List<String> transmissionOptions = ['Automatic', 'Manual'];

  // buildType
  String? selectedBuildType;
  List<String> buildTypeOptions = ['Option 1', 'Option 2', 'Option 3', 'Option 4'];

  // mileage
  String? selectedMileage;
  List<String> mileageOptions = ['Option 1', 'Option 2', 'Option 3', 'Option 4'];


  // image list
  List<XFile> selectedImages = [];
  final ImagePicker picker = ImagePicker();

  // make and model list
  List<Map<String, dynamic>> makeAndModels = [
    {
      "make": "Toyota",
      "model": ["Corolla", "Camry", "Highlander"],
    },
    {
      "make": "Kia",
      "model": ["Sorento", "Morning", "Picanto"],
    },
    {
      "make": "Mercedes Benz",
      "model": ["C250", "C300", "GLE"],
    },
  ]; 

  // selectedMakeModelMap
  Map<String, dynamic>? selectedMakeAndModelMap; // get selected make from here
  // selectedModel
  String? selectedModel; // get selected model from here

  Future<void> sellCarFunction() async {
    // send some images to online store and receive it subsequent http string
    final selectedImageString = [];

    // request for token

    // gather data to body (Table name Vehicle)
    final Map<String, dynamic> body = {
        // "user_id": "",
        // "vehicle_id": "",
        "vehicle_name": _vehicleNameController.text, //string
        "vehicle_type": vehicleType, //string
        "condition": condition,  // string
        "year": year,  // number
        "make": selectedMakeAndModelMap?["make"],  //string
        "model": selectedModel,  //string
        "location": {
          "latitude": _currentPosition!.latitude,  // number
          "longitude": _currentPosition!.longitude, // number
          // "address":   // string or null
        },
        "price": _priceController.text,  // string
        "steer_position": selectedSteerPosition,  // string
        "engine_capacity": selectedEngineCapacity,  // string
        "transmission": selectedTransmission,   // string
        "color": {
          "hex": _colorController.text,  // string
          "name": _colorController.text,  // string
        },
        "build_type": selectedBuildType, // string
        "mileage": selectedMileage, // string
        "number_of_passengers": _numberOfPassengersController.text,  // number
        "features": selectedFeatures.map((e)=>e).toList(), // ["string"]
        "description": _descriptionController.text,  // string
        "images": selectedImageString.map((e)=>e).toList(), // ["string"]
        // "created_at": 
      };

      // create the post request

      // handle http status response and feedback
  }

  // test here
   void _formValidation() {
    if (_formKey.currentState!.validate()) {
      // vehicle type test
      if(vehicleType.isEmpty){
        showSnackbar(
          backgroundColor: ColorGlobalVariables.whiteColor, 
          title: "Please select vehicle type", 
          isForFormValidation: false
          );
          return;
      }
      // condition test
      if(condition.isEmpty){
        showSnackbar(
          backgroundColor: ColorGlobalVariables.whiteColor, 
          title: "Please select condition", 
          isForFormValidation: false
          );
          return;
      }
      // make test
      if(selectedMakeAndModelMap == null || selectedMakeAndModelMap!["make"].isEmpty){
        showSnackbar(
          backgroundColor: ColorGlobalVariables.whiteColor, 
          title: "Please select vehicle make", 
          isForFormValidation: false
          );
          return;
      }
      // model test
      if(selectedModel == null || selectedModel!.isEmpty){
        showSnackbar(
          backgroundColor: ColorGlobalVariables.whiteColor, 
          title: "Please select vehicle model", 
          isForFormValidation: false
          );
          return;
      }
      // current position test
      if(_currentPosition == null){
        showSnackbar(
          backgroundColor: ColorGlobalVariables.whiteColor, 
          title: "Please select vehicle location", 
          isForFormValidation: false
          );
          return;
      }
      // Steer position
      // Engine cpapacity
      // Transmission
      // Color

      // BuildType
      if(selectedBuildType == null || selectedBuildType == ""){
        showSnackbar(
          backgroundColor: ColorGlobalVariables.whiteColor, 
          title: "Please select build type", 
          isForFormValidation: false,
          );
          return;
      }
      // Mileage
      if(selectedMileage == null || selectedMileage == ""){
        showSnackbar(
          backgroundColor: ColorGlobalVariables.whiteColor, 
          title: "Please select mileage", 
          isForFormValidation: false
          );
          return;
      }
      // Features
      if(selectedFeatures.isEmpty){
        showSnackbar(
          backgroundColor: ColorGlobalVariables.whiteColor, 
          title: "Please select features", 
          isForFormValidation: false
          );
          return;
      }
      // Images
      if(selectedImages.isEmpty){
        showSnackbar(
          backgroundColor: ColorGlobalVariables.whiteColor, 
          title: "Please upload at least 2 images and at most 4 images", 
          isForFormValidation: false
          );
          return;
      }
      print("All validations passed");
    }
    else{
      showSnackbar(
        backgroundColor: ColorGlobalVariables.whiteColor, 
        title: 'Please correct the errors in the form', 
        isForFormValidation: false
        );
    }
  }


  // for terminal works
  final logger = Logger();  

  @override
  void dispose() {
    // TODO: implement dispose
    _vehicleNameController.dispose();
    _mileageController.dispose();
    _priceController.dispose();
    _numberOfPassengersController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    logger.i("color: ${_colorController.text}");
    logger.i("year: $year");
    logger.i("vehicle type: $vehicleType");
    logger.i("condition: $condition");
    logger.i("selectedMakeAndModelMap $selectedMakeAndModelMap");
    logger.i("selectedModel: $selectedModel");
    logger.i("selected features: $selectedFeatures");
    for(int i = 0; i<selectedImages.length; i++){
      logger.i("selected images: ${selectedImages[i].path}");
    }
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
                  const SizedBox(height: 20,),
                  // vehicle name
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20,),
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
                  const SizedBox(height: 20,),
                  // type of vehicle
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20,),
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
                        // condition
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
                  const SizedBox(height: 20,),
                  // row for conditon and year
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20,),
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
                          const SizedBox(width: 20,),
                          // year
                          Expanded(
                            child: TitleWithTextformfieldComponent(
                              title: "Year", 
                              fontWeight: FontWeight.w500,
                              fieldWidth: double.infinity, 
                              textColor: ColorGlobalVariables.blackColor, 
                              obscureText: ColorGlobalVariables.falseValue, 
                              textInputType: TextInputType.datetime, // numbe 
                              hintText: year.toString(), 
                              isSuffixIconRequired: false, 
                              isPrefixIconRequired: false, 
                              isFieldHeightRequired: false, 
                              isTitleWithContainerWidgetRequired: true,
                              onTitleWithContainerWidgetClickFunction: (){
                                // will be displaying alertDialog here
                                _showYearPicker();
                                 },
                              ),
                          ),
                        ],
                      ),
                  ),
                  const SizedBox(height: 20,),
                  // row for make and model
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20,),
                    child: Row(
                      children: [
                        // make
                        Expanded(
                          child: TitleWithTextformfieldComponent(
                            title: 'Make', 
                            fontWeight: FontWeight.w500, 
                            textColor: ColorGlobalVariables.blackColor, 
                            obscureText: false, 
                            textInputType: TextInputType.text, 
                            hintText: selectedMakeAndModelMap == null ? "" : selectedMakeAndModelMap?["make"]!, 
                            isTitleWithContainerWidgetRequired: true,
                            fieldWidth: double.infinity,
                            isSuffixIconRequired: false, 
                            isPrefixIconRequired: false, 
                            isFieldHeightRequired: false, 
                            onTitleWithContainerWidgetClickFunction: () => _showMakeModelDialog(
                                context: context,  
                                options: makeAndModels,
                                onSelected: (selected){
                                  selectedMakeAndModelMap = selected;
                                  selectedModel = null;
                                  //logger.i("selectedMakeAndModelMap $selectedMakeAndModelMap");
                                  setState(() {});
                                }
                                )
                      
                            ),
                        ),
                      const SizedBox(width: 20,),
                      //  model
                      Expanded(
                        child: TitleWithTextformfieldComponent(
                          title: 'Model', 
                          fontWeight: FontWeight.w500, 
                          textColor: ColorGlobalVariables.blackColor, 
                          obscureText: false, 
                          textInputType: TextInputType.text, 
                          hintText: selectedModel == null ? "Select a Model" : selectedModel!, 
                          fieldWidth: double.infinity,
                          isSuffixIconRequired: false, 
                          isPrefixIconRequired: false, 
                          isFieldHeightRequired: false, 
                          isTitleWithContainerWidgetRequired: true,
                          onTitleWithContainerWidgetClickFunction: () {
                            if(selectedMakeAndModelMap != null){
                               _showSelectionDialog(
                                context: context,  
                                options: selectedMakeAndModelMap?['model'],
                                onSelected: (selected){
                                  setState(() {
                                    selectedModel = selected;
                                  });
                                }
                                );
                              }else{
                                 showSnackbar(
                                  backgroundColor: ColorGlobalVariables.whiteColor, 
                                  isForFormValidation: false,
                                  title: 'Select a Make first'
                                  );
                                  logger.e("Select a Make first");
                            
                              }
                             
                                }
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20,),
                  // // mileage
                  // Align(
                  //   alignment: Alignment.centerLeft,
                  //   child: TitleWithTextformfieldComponent(
                  //     title: title, 
                  //     fontWeight: fontWeight, 
                  //     textColor: textColor, 
                  //     obscureText: obscureText, 
                  //     textInputType: textInputType, 
                  //     editingController: editingController, 
                  //     hintText: hintText, 
                  //     isSuffixIconRequired: isSuffixIconRequired, 
                  //     isPrefixIconRequired: isPrefixIconRequired, 
                  //     isFieldHeightRequired: isFieldHeightRequired
                  //     ),
                  // ),
                  // const SizedBox(height: 15,),
                  // row for location and price
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20,),
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
                            hintText: _currentPosition == null ? "Search Location" : "Latitude: ${_currentPosition?.latitude}, Longitude: ${_currentPosition?.longitude}", 
                            isSuffixIconRequired: false, 
                            isPrefixIconRequired: false, 
                            isFieldHeightRequired: false, 
                            isTitleWithContainerWidgetRequired: true,
                            onTitleWithContainerWidgetClickFunction: (){
                              // show google map location search
                              _getLocation();
                            },
                            ),
                        ),
                        const SizedBox(width: 20,),
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
                  const SizedBox(height: 20,),
                  // row for steer position and engine capacity
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20,),
                    child: Row(
                      children: [
                        // steer postion
                        Expanded(
                          child: TitleWithTextformfieldComponent(
                            title: 'Steer Position', 
                            fontWeight: FontWeight.w500, 
                            fieldWidth: double.infinity,
                            textColor: ColorGlobalVariables.blackColor, 
                            obscureText: false, 
                            textInputType: TextInputType.text,
                            hintText: selectedSteerPosition == null ? "left" : selectedSteerPosition!, 
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
                        const SizedBox(width: 20,),
                        // engine capacity
                         Expanded(
                          child: TitleWithTextformfieldComponent(
                            title: 'Engine Capacity', 
                            fontWeight: FontWeight.w500,
                            fieldWidth: double.infinity, 
                            textColor: ColorGlobalVariables.blackColor, 
                            obscureText: false, 
                            textInputType: TextInputType.number, 
                            hintText: selectedEngineCapacity == null ? "1.5" : selectedEngineCapacity!, 
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
                  const SizedBox(height: 15,),
                  // row for transmission and color
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20,),
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
                            //editingController: _transmissionController, 
                            hintText: selectedTransmission == null ? "Automatic" : selectedTransmission!, 
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
                        const SizedBox(width: 20,),
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
                              // some color palette here
                              _showColorPicker();
                            },
                            ),
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20,),
                  // row for build type and mileage
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20,),
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
                            //editingController: _buildTypeController, 
                            hintText: selectedBuildType == null ? "Sedan" : selectedBuildType!, 
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
                        const SizedBox(width: 20,),
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
                            hintText: selectedMileage == null ? "" : selectedMileage!, 
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
                  const SizedBox(height: 20,),
                  // number of passengers
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20,),
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
                        const SizedBox(width: 20,),
                        Expanded(child: SizedBox(width: double.infinity,))
                      ],
                    ),
                  ),
                  const SizedBox(height: 20,),
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
                            const SizedBox(width: 20,),
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
                        const SizedBox(height: 10,),
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
                            const SizedBox(width: 20,),
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
                  const SizedBox(height: 20,),
                  // description
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20,),
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
                      //maxLines: 4,
                      ),
                  ),
                  const SizedBox(height: 20,),
                  // button for upload images
                  // Selected images grid
                  //selectedImages.isNotEmpty ? 
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15,),
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
                      const SizedBox(height: 20,),
                      // images
                      GestureDetector(
                        onTap: () => _pickImages(),
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 15,),
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
                                    const SizedBox(height: 15,),
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
                              const SizedBox(width: 15,),
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
                                    const SizedBox(height: 15,),
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
                        ),
                      ),
                      ],
                    ),
                  ),
                  //: 
                  // Links(
                  //   linkTextType: 'Upload images/Video', 
                  //   linkTextColor: ColorGlobalVariables.blackColor, 
                  //   isTextSmall: true,
                  //   iconSize: 40,
                  //   borderColor: ColorGlobalVariables.buttonColor,
                  //   linkFontWeight: FontWeight.w500,
                  //   textDecoration: TextDecoration.none,
                  //   iconData: Icons.image, // upload, add_photo_alternate, cloud_upload, (fontawesome: upload, image, fileImage, cameraRetro, cloudUploadAlt) 
                  //   isIconWidgetRequiredAtEnd: false, 
                  //   isIconWidgetRequiredAtFront: true, 
                  //   onClickFunction: (){}
                  //   ),
            
                  const SizedBox(height: 20,),
                  // sell car button
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20,),
                    child: CustomElevatedButton(
                      buttonTextType: "Sell Car", 
                      textTypeColor: ColorGlobalVariables.whiteColor, 
                      buttonVerticalPadding: 15,
                      borderRadius: 8,
                      isFullButtonWidthRequired: true, 
                      buttonBackgroundColor: Colors.red, onClickFunction: () => _formValidation(),
                      //ColorGlobalVariables.brownColor
                      ),
                  ),
                  const SizedBox(height: 20,),
                ],
                ),
            ),
          ),
        ),
        ),
    );
  }

  // 
  Position? _currentPosition;

  Future<void> _getLocation() async {
  bool serviceEnabled;
  LocationPermission permission;
  
  // Check if location services are enabled
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    showSnackbar(
      backgroundColor: ColorGlobalVariables.whiteColor,
      isForFormValidation: false,
      title: 'Location services are disabled. Please enable them.'
    );
    return;
  }

  // Check location permissions
  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.deniedForever) {
    showSnackbar(
      backgroundColor: ColorGlobalVariables.whiteColor,
      isForFormValidation: false,
      title: 'Location permissions are permanently denied. Please enable them in app settings.'
    );
    return;
  }

  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission != LocationPermission.whileInUse && permission != LocationPermission.always) {
      showSnackbar(
        backgroundColor: ColorGlobalVariables.whiteColor,
        isForFormValidation: false,
        title: 'Location permissions are denied'
      );
      return;
    }
  }

  try {
    // Get the current position
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high
    );

    // Update the state with the new position
    setState(() {
      _currentPosition = position;
    });

    // Optional: You could also show a snackbar to confirm the location was updated
    showSnackbar(
      backgroundColor: ColorGlobalVariables.whiteColor,
      isForFormValidation: false,
      title: 'Location updated to your current position'
    );

  } catch (e) {
    showSnackbar(
      backgroundColor: ColorGlobalVariables.whiteColor,
      isForFormValidation: false,
      title: 'Error getting location: ${e.toString()}'
    );
  }
}

  // for make alertDialog
  Future<void> _showMakeModelDialog({
    required BuildContext context, 
    required List<Map<String, dynamic>> options,
    required void Function(Map<String,dynamic>) onSelected,
    }) async {
    final selected = await showDialog<Map<String, dynamic>>(
      context: context, 
      builder: (BuildContext context) {
        return SimpleDialog(
          title: TextMedium(
            title: 'Select an option', 
            fontWeight: FontWeight.normal, 
            textColor: ColorGlobalVariables.blackColor
            ),
          children: options.map(
            (option){
              return SimpleDialogOption(
                onPressed: (){
                  Navigator.pop(context, option);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: TextSmall(
                    title: option['make'], 
                    fontWeight: FontWeight.normal, 
                    textColor: ColorGlobalVariables.blackColor
                    ),
                  ),
              );
            }
            ).toList(),
        );
      });

      if(selected != null){
        onSelected(selected);
        // setState(() {
        //   selectedOption = selected;
        // });
      }
  }
  
  // for general alertDialog
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
          children: options.map(
            (option){
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
            }
            ).toList(),
        );
      });

      if(selected != null){
        onSelected(selected);
        // setState(() {
        //   selectedOption = selected;
        // });
      }
  }
  // change color function
  void _changeColor(Color color){
    setState(() {
      color = color;
      _colorController.text = colorToHex(color);
    });
  }

  // to use later
  String colorToHex(Color color){
    return "#${color.value.toRadixString(16).padLeft(8,'0').toUpperCase()}";
  }

  // show year picker
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

  // Validation function
 


  // show snackbar
  void showSnackbar({
    required Color backgroundColor,
    required String title,
    required bool isForFormValidation,
    Color? textColor,
  }){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: backgroundColor,
        elevation: 1,
        content: TextSmall(
          title: isForFormValidation ? "Please enter a/an $title" : title, 
          fontWeight: FontWeight.w500, 
          textColor: textColor ?? ColorGlobalVariables.redColor,
          )
        )
    );
  }
  // pick images
  Future<void> _pickImages() async {
    try{
      final List<XFile> pickedFiles = await picker.pickMultiImage(
        maxWidth: 1000,
        maxHeight: 1000,
        imageQuality: 85,
      );

      if(pickedFiles != null){
        setState(() {
          // combine existing images with new ones
          selectedImages.addAll(pickedFiles);
          // ensuring we don't exceed 4 images
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
      }
    }catch(e){
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

  // toggle feature for features
  void _toggleFeature(String feature){
    if(selectedFeatures.contains(feature)){
      selectedFeatures.remove(feature);
    }else{
      selectedFeatures.add(feature);
    }
  }

  // show color picker
  void _showColorPicker(){
    showDialog(
      context: context, 
      builder: (BuildContext context){
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
            // okay button
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