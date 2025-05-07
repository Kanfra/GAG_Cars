import 'package:flutter/material.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/Appbar/customAppbarOne.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/Buttons/customElevatedButton.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/Buttons/customTextButton.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/Checkboxes/roundCheckBox.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/Checkboxes/textCheckBox.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/Links/links.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/titleWithRowComponent.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/titleWithTextFormFieldComponent.dart';
import 'package:gag_cars_frontend/GlobalVariables/colorGlobalVariables.dart';

class SellCarPage extends StatefulWidget {
  const SellCarPage({super.key});

  @override
  State<SellCarPage> createState() => _SellCarPageState();
}

class _SellCarPageState extends State<SellCarPage> {
  TextEditingController _vehicleNameController = TextEditingController();
  TextEditingController _yearController = TextEditingController();
  TextEditingController _makeController = TextEditingController();
  TextEditingController _modelController = TextEditingController();
  TextEditingController _mileageController = TextEditingController();
  TextEditingController _locationController = TextEditingController();
  TextEditingController _priceController = TextEditingController();
  TextEditingController _steerPositionController = TextEditingController();
  TextEditingController _engineCapacityController = TextEditingController();
  TextEditingController _transmissionController = TextEditingController();
  TextEditingController _colorController = TextEditingController();
  TextEditingController _buildTypeController = TextEditingController();
  TextEditingController _numberOfPassengersController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

  // String car ="Car";
  // String spa = "Spa";
  // String motobike = "Motobike";
  // String ship = "Ship";
  bool isCarSelected = false;
  bool isSpaSelected = false;
  bool isMotobikeSelected = false;
  bool isShipSelected = false;
  String vehicleType = "";

  // String nnew = "New";
  // String used = "Used";
  bool isNewSelected = false;
  bool isUsedSelected = false;
  String condition = "";

  // String alarm = "Alarm";
  // String cruiseControl = "Cruise Control";
  // String bluetooth = "Bluetooth";
  // String frontParkingSensor = "Front Parking Sensor";
  bool isAlarmSelected = false;
  bool isCruiseControlSelected = false;
  bool isBluetoothSelected = false;
  bool isFrontParkingSensorSelected = false;
  List<String> features = [];


  @override
  void dispose() {
    // TODO: implement dispose
    _vehicleNameController.dispose();
    _yearController.dispose();
    _makeController.dispose();
    _modelController.dispose();
    _mileageController.dispose();
    _locationController.dispose();
    _priceController.dispose();
    _steerPositionController.dispose();
    _engineCapacityController.dispose();
    _transmissionController.dispose();
    _colorController.dispose();
    _buildTypeController.dispose();
    _numberOfPassengersController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
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
                    isFieldHeightRequired: ColorGlobalVariables.falseValue
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
                            textInputType: TextInputType.datetime, // number 
                            editingController: _yearController, 
                            hintText: "Enter Year", 
                            //fieldWidth: double.infinity,
                            isSuffixIconRequired: false, 
                            isPrefixIconRequired: false, 
                            isFieldHeightRequired: false,
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
                          editingController: _makeController, 
                          hintText: 'Select Make', 
                          fieldWidth: double.infinity,
                          isSuffixIconRequired: false, 
                          isPrefixIconRequired: false, 
                          isFieldHeightRequired: false
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
                        editingController: _modelController, 
                        hintText: 'Select Model', 
                        fieldWidth: double.infinity,
                        isSuffixIconRequired: false, 
                        isPrefixIconRequired: false, 
                        isFieldHeightRequired: false
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
                          textInputType: TextInputType.text, 
                          editingController: _locationController, 
                          hintText: 'Search Location', 
                          isSuffixIconRequired: false, 
                          isPrefixIconRequired: false, 
                          isFieldHeightRequired: false
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
                          isFieldHeightRequired: false
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
                          editingController: _steerPositionController, 
                          hintText: 'left', 
                          isSuffixIconRequired: false, 
                          isPrefixIconRequired: false, 
                          isFieldHeightRequired: false
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
                          editingController: _engineCapacityController, 
                          hintText: '1.5', 
                          isSuffixIconRequired: false, 
                          isPrefixIconRequired: false, 
                          isFieldHeightRequired: false,
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
                          editingController: _transmissionController, 
                          hintText: 'Automatic', 
                          isSuffixIconRequired: false, 
                          isPrefixIconRequired: false, 
                          isFieldHeightRequired: false,
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
                          hintText: "", 
                          isSuffixIconRequired: false, 
                          isPrefixIconRequired: false, 
                          isFieldHeightRequired: false
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
                          editingController: _buildTypeController, 
                          hintText: 'Sedan', 
                          isSuffixIconRequired: false, 
                          isPrefixIconRequired: false, 
                          isFieldHeightRequired: false,
                          ),
                        ),
                      const SizedBox(width: 20,),
                      // color
                       Expanded(
                        child: TitleWithTextformfieldComponent(
                          title: 'Mileage', 
                          fieldWidth: double.infinity,
                          fontWeight: FontWeight.w500, 
                          textColor: Colors.black, 
                          obscureText: false, 
                          textInputType: TextInputType.text, 
                          editingController: _mileageController, 
                          hintText: "", 
                          isSuffixIconRequired: false, 
                          isPrefixIconRequired: false, 
                          isFieldHeightRequired: false
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
                          isFieldHeightRequired: false
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
                              checkboxTextType: 'Alarm', 
                              isChecked: isAlarmSelected, 
                              isIconAtFrontRequired: false,
                              onTap: (){
                                isAlarmSelected = !isAlarmSelected;
                              },
                              ),
                          ),
                          const SizedBox(width: 20,),
                          // cruise control
                          Expanded(
                            child: TextCheckBox(
                              checkboxTextType: 'Cruise Control', 
                              isChecked: isCruiseControlSelected, 
                              isIconAtFrontRequired: false,
                              onTap: (){},
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
                              isChecked: isBluetoothSelected, 
                              isIconAtFrontRequired: false,
                              onTap: (){},
                              ),
                          ),
                          const SizedBox(width: 20,),
                          // cruise control
                          Expanded(
                            child: TextCheckBox(
                              checkboxTextType: 'Front Parking Sensor', 
                              isChecked: isFrontParkingSensorSelected, 
                              isIconAtFrontRequired: false,
                              onTap: (){},
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
                    //maxLines: 4,
                    ),
                ),
                const SizedBox(height: 20,),
                // button for upload images
                Links(
                  linkTextType: 'Upload images/Video', 
                  linkTextColor: ColorGlobalVariables.blackColor, 
                  isTextSmall: true,
                  iconSize: 40,
                  borderColor: ColorGlobalVariables.buttonColor,
                  linkFontWeight: FontWeight.w500,
                  textDecoration: TextDecoration.none,
                  iconData: Icons.image, // upload, add_photo_alternate, cloud_upload, (fontawesome: upload, image, fileImage, cameraRetro, cloudUploadAlt) 
                  isIconWidgetRequiredAtEnd: false, 
                  isIconWidgetRequiredAtFront: true, 
                  onClickFunction: (){}
                  ),
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
                    buttonBackgroundColor: Colors.red, onClickFunction: () {  },
                    //ColorGlobalVariables.brownColor
                    ),
                ),
                const SizedBox(height: 20,),
              ],
              ),
          ),
        ),
        ),
    );
  }
}