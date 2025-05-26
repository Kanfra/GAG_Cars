import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/Appbar/customAppbarOne.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/IconButtons/customRoundIconButton.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/Links/links.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/Text/textExtraSmall.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/Text/textMedium.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/Text/textSmall.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/TextFormFields/customTextFormField.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/customIcon.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/customImage.dart';
import 'package:gag_cars_frontend/GlobalVariables/colorGlobalVariables.dart';
import 'package:gag_cars_frontend/GlobalVariables/imageStringGlobalVariables.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final TextEditingController searchEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CustomAppbar(
        onLeadingIconClickFunction: (){}, 
        isLeadingWidgetExist: ColorGlobalVariables.trueValue, 
        leadingIconData: FontAwesomeIcons.bars, 
        leadingIconSize: 18,
        leadingButtonSize: 35,
        appbarBackgroundColor: Colors.white,
        titleText: "GAGcars",
        elevation: 10,
        titleTextColor: ColorGlobalVariables.redColor,
        centerTitle: ColorGlobalVariables.trueValue,
        actions: [
          const SizedBox(width: 5,),
          // globe icon button
          CustomRoundIconButton(
            iconData: FontAwesomeIcons.globe, 
            buttonSize: 35,
            iconSize: 18,
            isBorderSlightlyCurved: ColorGlobalVariables.falseValue, 
            onIconButtonClickFunction: (){}
            ),
          const SizedBox(width: 3,),
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
          //CustomRoundIconButton(iconData: iconData, isBorderSlightlyCurved: isBorderSlightlyCurved, onIconButtonClickFunction: onIconButtonClickFunction)
          const SizedBox(width: 5,),
        ],
        ),
      body: SafeArea(
        child: Container(
          color: Colors.white,
          width: screenSize.width,
          height: screenSize.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                  suffixIconData: FontAwesomeIcons.sliders,
                  onSuffixIconClickFunction: (){},
                   
                  isSuffixIconRequired: ColorGlobalVariables.trueValue, 
                  isPrefixIconRequired: ColorGlobalVariables.trueValue, 
                  editingController: searchEditingController, 
                  isFieldHeightRequired: ColorGlobalVariables.falseValue,
                  ),
              ),
              const SizedBox(height: 5,),
              // scrollability starts from here
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                
                      // column for trending makes
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // row for trending makes and view all
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15,),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextMedium(
                                  title: 'Trending Makes', 
                                  fontWeight: FontWeight.w500, 
                                  textColor: ColorGlobalVariables.blackColor,
                                  ),
                                Links(
                                  linkTextType: 'View All', 
                                  linkTextColor: ColorGlobalVariables.blackColor, 
                                  isTextSmall: ColorGlobalVariables.trueValue, 
                                  textDecoration: TextDecoration.none,
                                  linkFontWeight: FontWeight.w500,
                                  isIconWidgetRequiredAtEnd: ColorGlobalVariables.falseValue, 
                                  isIconWidgetRequiredAtFront: ColorGlobalVariables.falseValue, 
                                  onClickFunction: (){}
                                  ),
                                                  
                              ],
                            ),
                          ),
                          const SizedBox(height: 3,),
                          // row for trending makes images
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CustomImage(
                                imagePath: '${ImageStringGlobalVariables.imagePath}tesla_temporary.png', 
                                isAssetImage: ColorGlobalVariables.trueValue,
                                isImageBorderRadiusRequired: false,
                                imageWidth: 40,
                                imageHeight: 40,
                                ),
                              CustomImage(
                                imagePath: '${ImageStringGlobalVariables.imagePath}renault_temporary.png', 
                                isAssetImage: ColorGlobalVariables.trueValue,
                                isImageBorderRadiusRequired: false,
                                imageWidth: 40,
                                imageHeight: 40,
                                ),
                              CustomImage(
                                imagePath: '${ImageStringGlobalVariables.imagePath}mazda_temporary.png', 
                                isAssetImage: ColorGlobalVariables.trueValue,
                                isImageBorderRadiusRequired: false,
                                imageWidth: 40,
                                imageHeight: 40,
                                ),
                              CustomImage(
                                imagePath: '${ImageStringGlobalVariables.imagePath}nissan_temporary.png', 
                                isAssetImage: ColorGlobalVariables.trueValue,
                                isImageBorderRadiusRequired: false,
                                imageWidth: 40,
                                imageHeight: 40,
                                ),
                              CustomImage(
                                imagePath: '${ImageStringGlobalVariables.imagePath}jeep_temporary.png', 
                                isAssetImage: ColorGlobalVariables.trueValue,
                                isImageBorderRadiusRequired: false,
                                imageWidth: 40,
                                imageHeight: 40,
                                ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          // horizontal scroll for other container images
                          Container(
                            alignment: Alignment.center,
                            height: 92,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 2, bottom: 2),
                              child: ListView.builder(
                                itemCount: trendingMakes.length,
                                //shrinkWrap: false,
                                shrinkWrap: ColorGlobalVariables.trueValue,
                                primary: ColorGlobalVariables.falseValue,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index){
                                  final trendingMake = trendingMakes[index];
                                  return Padding(
                                    padding: const EdgeInsets.only(top: 1, bottom: 1, right: 12,),
                                    child: Container(
                                      padding: const EdgeInsets.all(2),
                                      //margin: const EdgeInsets.only(right: 12,),
                                      width: 90,
                                      height: 90,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(8),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey,
                                            spreadRadius: 0.1,
                                            blurRadius: 0.1,
                                            offset: Offset(0.1, 0.1)
                                          )
                                        ]
                                        // border: Border.all(
                                        //   color: ColorGlobalVariables.blackColor,
                                        //   width: 0.1
                                        // )
                                      ),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          // icon type
                                          CustomIcon(
                                            iconData: trendingMake["icon"], 
                                            isFaIcon: false, 
                                            iconColor: ColorGlobalVariables.blackColor
                                            ),
                                          const SizedBox(height: 2,),
                                          TextSmall(
                                            title: trendingMake["name"], 
                                            fontWeight: FontWeight.normal, 
                                            textAlign: TextAlign.center,
                                            textColor: ColorGlobalVariables.blackColor,
                                            ),
                                        ],
                                      ),
                                    ),
                                  );
                                }
                                ),
                            ),
                          ),
                        ]
                      ),
                      const SizedBox(height: 15,),
                      // column for special offers
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15,),
                            child: TextMedium(
                              title: 'Special Offers', 
                              fontWeight: FontWeight.w500, 
                              textColor: ColorGlobalVariables.blackColor
                              ),
                          ),
                          const SizedBox(height: 5,),
                          SizedBox(
                            height: 151,
                            child: ListView.builder(
                              itemCount: specialOffers.length,
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: ColorGlobalVariables.trueValue,
                              primary: ColorGlobalVariables.falseValue,
                              itemBuilder: (context, index){
                                final specialOffer = specialOffers[index];
                                return Padding(
                                  padding: const EdgeInsets.only(top: 1, bottom: 1, right: 15,),
                                  child: Container(
                                    padding: const EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 12),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey,
                                          blurRadius: 0.1,
                                          spreadRadius: 0.1,
                                          offset: Offset(0.1, 0.1),
                                        )
                                      ],
                                    ),
                                    child: Container(
                                      //padding: const EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 8),
                                      width: screenSize.width*0.7,
                                      height: 150,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            Colors.transparent,
                                            Colors.black.withOpacity(0.6), // Darkens the bottom
                                          ],
                                          stops: [0.6, 1], 
                                        ),
                                        image: DecorationImage(
                                          image: AssetImage(specialOffer["image"]),
                                          fit: BoxFit.cover,
                                        ),
                                        // border: Border.all(
                                        //   color: ColorGlobalVariables.blackColor,
                                        //   width: 0.5
                                        // )
                                      ),
                                      child: Stack(
                                        children: [
                                          // discount section
                                          Positioned(
                                            left: 0,
                                            top: 5,
                                            child: Container(
                                              padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                                              decoration: BoxDecoration(
                                                color: ColorGlobalVariables.greyColor.withOpacity(0.5),
                                                borderRadius: BorderRadius.circular(5),
                                              ),
                                              child: TextSmall(
                                                title: "${specialOffer["discount"].toString()}% discount", 
                                                fontWeight: FontWeight.normal, 
                                                textColor: ColorGlobalVariables.blackColor
                                                ),
                                            ),
                                            ),
                                          // other image logo
                                          Positioned(
                                            right: 8,
                                            bottom: 8,
                                            child: CustomImage(
                                              imagePath: specialOffer["logo"], 
                                              isAssetImage: ColorGlobalVariables.trueValue, 
                                              isImageBorderRadiusRequired: ColorGlobalVariables.falseValue,
                                              ),
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
                      const SizedBox(height: 15,),
                      // column for recommended
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15,),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextMedium(
                              title: 'Recommended', 
                              fontWeight: FontWeight.w500, 
                              textColor: ColorGlobalVariables.blackColor,
                              ),
                            Row(
                              children: [
                                // vertical position button
                                CustomRoundIconButton(
                                  iconData: Icons.list, 
                                  isBorderSlightlyCurved: ColorGlobalVariables.trueValue, 
                                  onIconButtonClickFunction: (){}
                                  ),
                                const SizedBox(width: 3,),
                                // horizontal position button
                                CustomRoundIconButton(
                                  iconData: Icons.grid_view, 
                                  isBorderSlightlyCurved: ColorGlobalVariables.trueValue, 
                                  onIconButtonClickFunction: (){}
                                  ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 5,),
                      //gridview builder here
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
                      
                    ],
                    ),
                ),
              ),

            ],
            ),
        ),
        ),
      );
  }

  List<Map<String, dynamic>> trendingMakes = [
    {
      "icon": Icons.construction,
      "name": "Accessories & Parts"
    },
    {
      "icon": FontAwesomeIcons.motorcycle,
      "name": "Motorbikes"
    },
    {
      "icon": Icons.agriculture,
      "name": "Agricultural Machinery"
    },
    {
      "icon": FontAwesomeIcons.truck,
      "name": "Trucks"
    },
  ];

  List<Map<String, dynamic>> specialOffers = [
    {
      "discount": 5,
      "image": "${ImageStringGlobalVariables.imagePath}black_car_temporary.png",
      "logo": "${ImageStringGlobalVariables.imagePath}honda_temporary.png"
    },
    {
      "discount": 7,
      "image": "${ImageStringGlobalVariables.imagePath}bmw_temporary.png",
      "logo": "${ImageStringGlobalVariables.imagePath}honda_temporary.png"
    },
  ];

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