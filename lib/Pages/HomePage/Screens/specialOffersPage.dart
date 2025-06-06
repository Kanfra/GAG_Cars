import 'package:flutter/material.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/Appbar/customAppbarOne.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/DotSeparator/dotSeparator.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/IconButtons/customRoundIconButton.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/Text/customRichtext.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/TextFormFields/customTextFormField.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/customImage.dart';
import 'package:gag_cars_frontend/GlobalVariables/colorGlobalVariables.dart';
import 'package:gag_cars_frontend/GlobalVariables/imageStringGlobalVariables.dart';
import 'package:get/get.dart';

class SpecialOffersPage extends StatefulWidget {
  const SpecialOffersPage({super.key});

  @override
  State<SpecialOffersPage> createState() => _SpecialOffersPageState();
}

class _SpecialOffersPageState extends State<SpecialOffersPage> {
  final TextEditingController searchEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CustomAppbar(
        onLeadingIconClickFunction: (){
          Get.back();
        }, 
        isLeadingWidgetExist: ColorGlobalVariables.trueValue, 
        leadingIconData: Icons.arrow_back_ios,
        appbarBackgroundColor: ColorGlobalVariables.whiteColor,
        leadingIconDataColor: ColorGlobalVariables.fadedBlackColor,
        titleText: "Special Offers",
        titleTextColor: ColorGlobalVariables.redColor,
        centerTitle: ColorGlobalVariables.trueValue,
        actions: [
          const SizedBox(width: 5,),
          // bell notification icon
          Stack(
            children: [
              CustomRoundIconButton(
                iconData: Icons.notifications, 
                iconSize: 18,
                buttonSize: 35,
                isBorderSlightlyCurved: ColorGlobalVariables.falseValue, 
                onIconButtonClickFunction: (){}
                ),
              Positioned(
                right: 2,
                top: 3,
                child: Container(
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors.red, // Dot color
                    shape: BoxShape.circle,
                  ),
                  constraints: BoxConstraints(
                    minWidth: 8,
                    minHeight: 8,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 5,),
        ],
      ),
      body: SafeArea(
        child: Container(
          width: screenSize.width,
          height: screenSize.height,
          decoration: BoxDecoration(
            color: ColorGlobalVariables.whiteColor
          ),
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // some search bar will be here
               const SizedBox(height: 10,),
              // search textformfield
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20,),
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
                  //suffixIconData: FontAwesomeIcons.sliders,
                  //onSuffixIconClickFunction: (){},
                   
                  isSuffixIconRequired: ColorGlobalVariables.falseValue, 
                  isPrefixIconRequired: ColorGlobalVariables.trueValue, 
                  editingController: searchEditingController, 
                  isFieldHeightRequired: ColorGlobalVariables.falseValue,
                  ),
              ),
              const SizedBox(height: 40,),
              Expanded(
                child: ListView.builder(
                  itemCount: specialOffers.length,
                  primary: false,
                  shrinkWrap: true,
                  itemBuilder: (context, index){
                    final specialOffer = specialOffers[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                      child: Container(
                        padding: const EdgeInsets.only(left: 15, right: 8, top: 25, bottom: 8),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: ColorGlobalVariables.textFieldColor,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: ColorGlobalVariables.greyColor,
                            width: 0.1
                          )
                        ),
                        child: Column(
                          //mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // row for text side and image side
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // column for text side
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomRichtext(
                                      firstTextTitle: "${specialOffer["percentage"]}% ", 
                                      firstTextColor: ColorGlobalVariables.blackColor, 
                                      firstTextSize: 25, 
                                      overflow: TextOverflow.visible, 
                                      firstTextFontWeight: FontWeight.bold, 
                                      textspans: [
                                        TextSpan(
                                          text: "off\n",
                                          style: TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                        TextSpan(
                                          text: "Week Deals!\n\n",
                                          style: TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                        TextSpan(
                                          text: "GH₵ ${specialOffer["price"]}",
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: ColorGlobalVariables.redColor,
                                            fontWeight: FontWeight.normal
                                          ),
                                        )
                                      ],
                                      ),
                                  ],
                                ),
                                // image side
                                CustomImage(
                                  imagePath: specialOffer["image"], 
                                  isAssetImage: true, 
                                  imageHeight: 180,
                                  imageWidth: 180,
                                  isImageBorderRadiusRequired: false
                                  ),
                              ],
                            ),
                            // row for one horizontal line and three dots
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // horizontal line
                                Container(
                                  height: 3,
                                  width: 12,
                                  decoration: BoxDecoration(
                                    color: ColorGlobalVariables.blackColor
                                  ),
                                ),
                                const SizedBox(width: 4,),
                                DotSeparator(
                                  dotSize: 4,
                                ),
                                const SizedBox(width: 4,),
                                DotSeparator(
                                  dotSize: 4,
                                ),
                                const SizedBox(width: 4,),
                                DotSeparator(
                                  dotSize: 4,
                                ),
                              ],
                              )
                          ],
                        ),
                      ),
                    );
                  }
                  ),
              ),
            ],
          ),
        ),
        ),
    );
  }

  // special offers
  List<Map<String, dynamic>> specialOffers = [
    {
      "percentage": 20,
      "image": "${ImageStringGlobalVariables.imagePath}red_sport_car_temporary.png",
      "price": "600,000"
    },
    {
      "percentage": 10,
      "image": "${ImageStringGlobalVariables.imagePath}mercedes_image_temporary.png",
      "price": "320,000"
    },
  ];
}