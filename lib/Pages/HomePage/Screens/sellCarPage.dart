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
import 'package:gag_cars_frontend/Pages/HomePage/Models/brandModelModel.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Models/makeModel.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Models/vehicleModel.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Providers/vehicleProvider.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Services/VehicleService/vehicleService.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

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
  String? selectedSteerPosition;
  List<String> steerPositionOptions = ['Option 1', 'Option 2', 'Option 3', 'Option 4'];
  String? selectedEngineCapacity;
  List<String> engineCapacityOptions = ['1.0', '2.0', '3.0'];
  String? selectedTransmission;
  List<String> transmissionOptions = ['Automatic', 'Manual'];
  String? selectedBuildType;
  List<String> buildTypeOptions = ['Option 1', 'Option 2', 'Option 3', 'Option 4'];
  String? selectedMileage;
  List<String> mileageOptions = ['Option 1', 'Option 2', 'Option 3', 'Option 4'];

  List<XFile> selectedImages = [];
  final ImagePicker picker = ImagePicker();
  int? selectedMakeId;
  String? selectedModel;
  final logger = Logger();
  Position? _currentPosition;

  @override
  void initState() {
    super.initState();
    // Fetch makes when the page loads
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final vehicleProvider = Provider.of<VehicleProvider>(context, listen: false);
      vehicleProvider.fetchMakes();
    });
  }

  @override
  void dispose() {
    _vehicleNameController.dispose();
    _mileageController.dispose();
    _priceController.dispose();
    _numberOfPassengersController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  Future<void> sellCarFunction() async {
    final vehicle = VehicleModel(
      user_id: "",
      vehicle_id: "",
      vehicleName: _vehicleNameController.text, 
      vehicleType: vehicleType, 
      condition: condition, 
      year: year, 
      make: selectedMakeId ?? null, 
      model: selectedModel ?? "", 
      location: VehicleLocation(latitude: _currentPosition!.latitude, longitude: _currentPosition!.longitude), 
      price: _priceController.text, 
      steerPosition: selectedSteerPosition!, 
      engineCapacity: selectedEngineCapacity!, 
      transmission: selectedTransmission!, 
      color: VehicleColor(hex: _colorController.text, name: _colorController.text), 
      buildType: selectedBuildType!, 
      mileage: selectedMileage!, 
      numberOfPassengers: int.tryParse(_numberOfPassengersController.text) ?? 0, 
      features: selectedFeatures,
      description: _descriptionController.text,
      images: []
    );
    
    await VehicleService.uploadVehicle(
      vehicle: vehicle, 
      imageFiles: selectedImages,
    );
  }

  Future<void> _formValidation() async {
    if (_formKey.currentState!.validate()) {
      if(vehicleType.isEmpty){
        showSnackbar(
          backgroundColor: ColorGlobalVariables.whiteColor, 
          title: "Please select vehicle type", 
          isForFormValidation: false
        );
        return;
      }
      if(condition.isEmpty){
        showSnackbar(
          backgroundColor: ColorGlobalVariables.whiteColor, 
          title: "Please select condition", 
          isForFormValidation: false
        );
        return;
      }
      if(selectedMakeId == null){
        showSnackbar(
          backgroundColor: ColorGlobalVariables.whiteColor, 
          title: "Please select vehicle make", 
          isForFormValidation: false
        );
        return;
      }
      if(selectedModel == null || selectedModel!.isEmpty){
        showSnackbar(
          backgroundColor: ColorGlobalVariables.whiteColor, 
          title: "Please select vehicle model", 
          isForFormValidation: false
        );
        return;
      }
      if(_currentPosition == null){
        showSnackbar(
          backgroundColor: ColorGlobalVariables.whiteColor, 
          title: "Please select vehicle location", 
          isForFormValidation: false
        );
        return;
      }
      if(selectedBuildType == null || selectedBuildType == ""){
        showSnackbar(
          backgroundColor: ColorGlobalVariables.whiteColor, 
          title: "Please select build type", 
          isForFormValidation: false,
        );
        return;
      }
      if(selectedMileage == null || selectedMileage == ""){
        showSnackbar(
          backgroundColor: ColorGlobalVariables.whiteColor, 
          title: "Please select mileage", 
          isForFormValidation: false
        );
        return;
      }
      if(selectedFeatures.isEmpty){
        showSnackbar(
          backgroundColor: ColorGlobalVariables.whiteColor, 
          title: "Please select features", 
          isForFormValidation: false
        );
        return;
      }
      if(selectedImages.isEmpty){
        showSnackbar(
          backgroundColor: ColorGlobalVariables.whiteColor, 
          title: "Please upload at least 2 images and at most 4 images", 
          isForFormValidation: false
        );
        return;
      }
      
      await sellCarFunction();
    } else {
      showSnackbar(
        backgroundColor: ColorGlobalVariables.whiteColor, 
        title: 'Please correct the errors in the form', 
        isForFormValidation: false
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final vehicleProvider = Provider.of<VehicleProvider>(context);

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
                          child: TitleWithTextformfieldComponent(
                            title: 'Make', 
                            fontWeight: FontWeight.w500, 
                            textColor: ColorGlobalVariables.blackColor, 
                            obscureText: false, 
                            textInputType: TextInputType.text, 
                            hintText: vehicleProvider.selectedMake?.name ?? "Select Make",
                            isTitleWithContainerWidgetRequired: true,
                            fieldWidth: double.infinity,
                            isSuffixIconRequired: false, 
                            isPrefixIconRequired: false, 
                            isFieldHeightRequired: false, 
                            onTitleWithContainerWidgetClickFunction: () {
                              if (vehicleProvider.isLoadingMakes) return;
                              
                              _showMakeSelectionDialog(
                                context: context,
                                makes: vehicleProvider.makes,
                                onSelected: (make) async {
                                  setState(() {
                                    selectedMakeId = make.id;
                                    selectedModel = null;
                                  });
                                  await vehicleProvider.fetchBrandModels(make.id);
                                }
                              );
                            }
                          ),
                        ),
                        const SizedBox(width: 20),
                        // model
                        Expanded(
                          child: TitleWithTextformfieldComponent(
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
                              if (vehicleProvider.selectedMake == null) {
                                showSnackbar(
                                  backgroundColor: ColorGlobalVariables.whiteColor, 
                                  isForFormValidation: false,
                                  title: 'Select a Make first'
                                );
                                return;
                              }
                              
                              if (vehicleProvider.isLoadingModels) return;
                              
                              _showModelSelectionDialog(
                                context: context,
                                models: vehicleProvider.brandModels,
                                onSelected: (model) {
                                  setState(() {
                                    selectedModel = model.name;
                                  });
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
                            hintText: _currentPosition == null ? "Search Location" : "Latitude: ${_currentPosition?.latitude}, Longitude: ${_currentPosition?.longitude}", 
                            isSuffixIconRequired: false, 
                            isPrefixIconRequired: false, 
                            isFieldHeightRequired: false, 
                            isTitleWithContainerWidgetRequired: true,
                            onTitleWithContainerWidgetClickFunction: (){
                              _getLocation();
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
                            hintText: selectedSteerPosition ?? "left", 
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
                      buttonBackgroundColor: Colors.red, 
                      onClickFunction: () => _formValidation(),
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

  Future<void> _getLocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      showSnackbar(
        backgroundColor: ColorGlobalVariables.whiteColor,
        isForFormValidation: false,
        title: 'Location services are disabled. Please enable them.'
      );
      return;
    }

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
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high
      );

      setState(() {
        _currentPosition = position;
      });

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

  Future<void> _showMakeSelectionDialog({
    required BuildContext context, 
    required List<Make> makes,
    required void Function(Make) onSelected,
  }) async {
    final selected = await showDialog<Make>(
      context: context, 
      builder: (BuildContext context) {
        return SimpleDialog(
          title: TextMedium(
            title: 'Select Make', 
            fontWeight: FontWeight.normal, 
            textColor: ColorGlobalVariables.blackColor
          ),
          children: makes.map((make) {
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
    required List<BrandModel> models,
    required void Function(BrandModel) onSelected,
  }) async {
    final selected = await showDialog<BrandModel>(
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
                  title: model!.name, 
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

  void showSnackbar({
    required Color backgroundColor,
    required String title,
    required bool isForFormValidation,
    Color? textColor,
  }) {
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