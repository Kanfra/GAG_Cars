import 'package:flutter/material.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/Appbar/customAppbarOne.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/Text/textLarge.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/Text/textSmall.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/TextFormFields/customTextFormField.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/customIcon.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/customImage.dart';
import 'package:gag_cars_frontend/GlobalVariables/colorGlobalVariables.dart';
import 'package:gag_cars_frontend/GlobalVariables/imageStringGlobalVariables.dart';

class AllMakesPage extends StatefulWidget {
  const AllMakesPage({super.key});

  @override
  State<AllMakesPage> createState() => _AllMakesPageState();
}

class _AllMakesPageState extends State<AllMakesPage> {
  final TextEditingController _searchEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CustomAppbar(
        onLeadingIconClickFunction: (){}, 
        isLeadingWidgetExist: ColorGlobalVariables.trueValue,
        leadingIconData: Icons.arrow_back_ios, 
        appbarBackgroundColor: ColorGlobalVariables.whiteColor,
        titleText: 'All Makes',
        titleTextColor: ColorGlobalVariables.brownColor,
        centerTitle: ColorGlobalVariables.trueValue,
        ),
      body: SafeArea(
        child: Container(
          width: screenSize.width,
          height: screenSize.height,
          decoration: BoxDecoration(
            color: ColorGlobalVariables.whiteColor
          ),
          child: Column(
            children: [
              const SizedBox(height: 10,),
              // search textformfield
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15,),
                child: CustomTextFormField(
                  obscureText: ColorGlobalVariables.falseValue, 
                  textInputType: TextInputType.text, 
                  hintText: 'Search', 
                  cursorColor: ColorGlobalVariables.fadedBlackColor,
                  fillColor: ColorGlobalVariables.textFieldColor,
                  enabledBorderColor: ColorGlobalVariables.textFieldDeeperShadeColor,
                  focusedBorderColor: ColorGlobalVariables.textFieldDeeperShadeColor,
                  prefixIconData: Icons.search,
                  fieldWidth: double.infinity,
                  fieldHeight: 14,
                  suffixIconData: Icons.mic, // other flutter icon (fiber_manual_record,) or fontAwesome(solidCircleDot, microphoneLines)
                  onSuffixIconClickFunction: (){},
                   
                  isSuffixIconRequired: ColorGlobalVariables.trueValue, 
                  isPrefixIconRequired: ColorGlobalVariables.trueValue, 
                  editingController: _searchEditingController, 
                  isFieldHeightRequired: ColorGlobalVariables.falseValue,
                  ),
              ),
              const SizedBox(height: 5,),
              Expanded(
                child: ListView.builder(
            itemCount: allMakes.length,
            shrinkWrap: true,
            primary: false,
            itemBuilder: (context, index){
              final allMake = allMakes[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                child: Card(
                  shadowColor: Colors.grey,
                  elevation: 1,
                  color: ColorGlobalVariables.whiteColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // logo
                        CustomImage(
                          imagePath: allMake['vehicleLogo'], 
                          isAssetImage: true, 
                          isImageBorderRadiusRequired: false
                          ),
                        // column vehicle name and total number available
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // vehicle name
                            TextLarge(
                              title: allMake['vehicleName'], 
                              fontWeight: FontWeight.bold, 
                              textColor: ColorGlobalVariables.blackColor
                              ),
                            // number of uploads
                            TextSmall(
                              title: "${allMake['noOfCarsAvailable'].toString()} cars available", 
                              fontWeight: FontWeight.normal, 
                              textColor: ColorGlobalVariables.fadedBlackColor
                              ),
                          ],
                          ),
                        // forward arrow icon
                        CustomIcon(
                          iconData: Icons.arrow_forward_ios, // arrow_forward, arrow_right 
                          isFaIcon: false, 
                          iconColor: ColorGlobalVariables.fadedBlackColor
                          ),
                        
                      ],
                    ),
                  ),
                ),
              );
            }
            ),
                ),
            ],
            ),
        )
        ),
    );
  }

  List<Map<String, dynamic>> allMakes = [
    {
      "vehicleLogo": "${ImageStringGlobalVariables.imagePath}acura_logo_temporary.png",
      "vehicleName": "Acura",
      "noOfCarsAvailable": 74
    },
     {
      "vehicleLogo": "${ImageStringGlobalVariables.imagePath}audi_logo_temporary.png",
      "vehicleName": "Audi",
      "noOfCarsAvailable": 32
    },
     {
      "vehicleLogo": "${ImageStringGlobalVariables.imagePath}bentley_logo_temporary.png",
      "vehicleName": "Bentley",
      "noOfCarsAvailable": 14
    },
     {
      "vehicleLogo": "${ImageStringGlobalVariables.imagePath}bmw_logo_temporary.png",
      "vehicleName": "BMW",
      "noOfCarsAvailable": 26
    },
     {
      "vehicleLogo": "${ImageStringGlobalVariables.imagePath}daewoo_logo_temporary.png",
      "vehicleName": "Daewoo",
      "noOfCarsAvailable": 41
    },
     {
      "vehicleLogo": "${ImageStringGlobalVariables.imagePath}ferrari_logo_temporary.png",
      "vehicleName": "Ferrari",
      "noOfCarsAvailable": 23
    },
     {
      "vehicleLogo": "${ImageStringGlobalVariables.imagePath}ford_temporary.png",
      "vehicleName": "Ford",
      "noOfCarsAvailable": 94
    },
     {
      "vehicleLogo": "${ImageStringGlobalVariables.imagePath}honda_temporary.png",
      "vehicleName": "Honda",
      "noOfCarsAvailable": 78
    },
  ];
}