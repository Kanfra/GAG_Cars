import 'package:flutter/material.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/Appbar/customAppbarOne.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/IconButtons/customRoundIconButton.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/Text/textExtraSmall.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/Text/textMedium.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/Text/textSmall.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/customIcon.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/customImage.dart';
import 'package:gag_cars_frontend/GlobalVariables/colorGlobalVariables.dart';
import 'package:gag_cars_frontend/GlobalVariables/imageStringGlobalVariables.dart';
import 'package:get/get.dart';

class MyListingsPage extends StatefulWidget {
  const MyListingsPage({super.key});

  @override
  State<MyListingsPage> createState() => _MyListingsPageState();
}

class _MyListingsPageState extends State<MyListingsPage> {
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
        titleText: "Gordon Auto Garage's listings",
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
            color: ColorGlobalVariables.whiteColor,
          ),
          child: //gridview builder here
          GridView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: recommendeds.length,
          shrinkWrap: ColorGlobalVariables.trueValue,
          primary: ColorGlobalVariables.falseValue,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 2 items per row
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
            childAspectRatio: 0.75, // Adjust based on your card's height
          ),
          itemBuilder: (context, index) {
            final recommended = recommendeds[index];
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              height: 245,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 0.1,
                    spreadRadius: 0.1,
                    offset: Offset(0.1, 0.1),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      CustomImage(
                        imagePath: recommended["productImage"], 
                        isAssetImage: true, 
                        isImageBorderRadiusRequired: true,
                        imageBorderRadius: 8,
                        imageHeight: 120,
                        imageWidth: double.infinity,
                        fit: BoxFit.cover,
                        ),
                      // product type
                      Positioned(
                        top: 3, left: 4,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 4),
                          decoration: BoxDecoration(
                            color: ColorGlobalVariables.textFieldColor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: RotatedBox(
                            quarterTurns: 1,
                            child: TextSmall(
                              title: recommended["productType"], 
                              fontWeight: FontWeight.normal, 
                              textColor: ColorGlobalVariables.blackColor
                              ),
                          ),
                        ),
                      ),
                    // liked icon
                    Positioned(
                      top: 3, right: 4,
                      child: CustomIcon(
                        iconData: recommended["isLiked"]  ? Icons.favorite : Icons.favorite_border_outlined, 
                        isFaIcon: false, 
                        iconSize: 25,
                        iconColor: recommended["isLiked"] ? ColorGlobalVariables.redColor : ColorGlobalVariables.fadedBlackColor,
                        ),
                    ),
                    ],
                  ),
                  const SizedBox(height: 8,),
                  // row for product name and product nature
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: TextSmall(
                          title: recommended["productName"], 
                          fontWeight: FontWeight.normal, 
                          overflow: TextOverflow.ellipsis,
                          textColor: ColorGlobalVariables.blackColor
                          ),
                      ),
                      const SizedBox(width: 4,),
                      TextSmall(
                        title: recommended["productNature"], 
                        fontWeight: FontWeight.normal, 
                        textColor: ColorGlobalVariables.blackColor
                        ),
                    ],
                  ),
                  const SizedBox(height: 2,),
                  // row for product cost  and milleage
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: TextMedium(
                          title: "GH₵${recommended["cost"]}", 
                          fontWeight: FontWeight.w500, 
                          textColor: ColorGlobalVariables.redColor,
                          ),
                      ),
                      const SizedBox(width: 4,),
                      Row(
                        children: [
                          CustomIcon(
                            iconData: Icons.speed, 
                            isFaIcon: false, 
                            iconColor: ColorGlobalVariables.blackColor
                            ),
                          const SizedBox(width: 2,),
                          TextSmall(
                            title: "${recommended["mileage"]} km", 
                            fontWeight: FontWeight.normal, 
                            textColor: ColorGlobalVariables.blackColor
                            ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 12,),
                  // row for product logo product, driveType and location
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // product logo
                      recommended["productLogo"].isEmpty ? const SizedBox(width: 16,) : CustomImage(
                        imagePath: recommended["productLogo"], 
                        isAssetImage: true, 
                        imageHeight: 25,
                        imageWidth: 25,
                        isImageBorderRadiusRequired: false
                        ),
                      // row for icon and driveType
                      Row(
                        children: [
                          CustomIcon(
                            iconData: Icons.settings,
                            isFaIcon: false, 
                            iconSize: 16,
                            iconColor: ColorGlobalVariables.blackColor
                            ),
                          const SizedBox(width: 2,),
                          TextExtraSmall(
                            title: recommended["driveType"], 
                            fontWeight: FontWeight.normal, 
                            textColor: ColorGlobalVariables.blackColor,
                            ),
                        ],
                      ),
                      //row for icon and location
                      Row(
                        children: [
                          CustomIcon(
                            iconData: Icons.location_on, 
                            isFaIcon: false, 
                            iconColor: ColorGlobalVariables.redColor
                            ),
                          const SizedBox(width: 2,),
                          TextExtraSmall(
                            title: recommended["location"], 
                            fontWeight: FontWeight.normal, 
                            textColor: ColorGlobalVariables.blackColor
                            ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            );
          },
        ),
        ),
        ),
    );
  }

  List<Map<String, dynamic>> recommendeds = [
    {
      "productImage": "${ImageStringGlobalVariables.imagePath}honda_civic_temporary.png",
      "productType": "featured",
      "productNature": "New",
      "isLiked": false,
      "cost": "400,000",
      "productName": "BMW 8 Series",
      "mileage": 3,
      "productLogo": "${ImageStringGlobalVariables.imagePath}bmw_logo_temporary.png",
      "driveType": "Automatic",
      "location": "Accra"
    },
     {
      "productImage": "${ImageStringGlobalVariables.imagePath}black_car_temporary.png",
      "productType": "featured",
      "productNature": "New",
      "isLiked": true,
      "cost": "600,000",
      "productName": "Mercedes Benz GCL 300",
      "mileage": 2,
      "productLogo": "${ImageStringGlobalVariables.imagePath}mercedes_logo_temporary.png",
      "driveType": "Automatic",
      "location": "Accra"
    },
     {
      "productImage": "${ImageStringGlobalVariables.imagePath}kollter_electric_motorbike_temporary.png",
      "productType": "featured",
      "productNature": "New",
      "isLiked": true,
      "cost": "400,000",
      "productName": "BMW Bike",
      "mileage": 2000,
      "productLogo": "${ImageStringGlobalVariables.imagePath}bmw_logo_temporary.png",
      "driveType": "Automatic",
      "location": "Accra"
    },
     {
      "productImage": "${ImageStringGlobalVariables.imagePath}honda_civic_temporary.png",
      "productType": "featured",
      "productNature": "New",
      "isLiked": true,
      "cost": "170,000",
      "productName": "Honda Civic Sport",
      "mileage": 3,
      "productLogo": "${ImageStringGlobalVariables.imagePath}honda_temporary.png",
      "driveType": "Automatic",
      "location": "Accra"
    },
     {
      "productImage": "${ImageStringGlobalVariables.imagePath}ford_temporary.png",
      "productType": "featured",
      "productNature": "New",
      "isLiked": true,
      "cost": "400,000",
      "productName": "Ford Ranger",
      "mileage": 3,
      "productLogo": "${ImageStringGlobalVariables.imagePath}bmw_logo_temporary.png",
      "driveType": "Automatic",
      "location": "Accra"
    },
     {
      "productImage": "${ImageStringGlobalVariables.imagePath}driving_mirror_temporary.png",
      "productType": "featured",
      "productNature": "Used",
      "isLiked": false,
      "cost": "2,000",
      "productName": "Corolla Side Mirror",
      "mileage": 3,
      "productLogo": "",
      "driveType": "Automatic",
      "location": "Accra"
    }
  ];
}
