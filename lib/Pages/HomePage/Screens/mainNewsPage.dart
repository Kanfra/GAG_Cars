import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/Appbar/customAppbarOne.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/DotSeparator/dotSeparator.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/IconButtons/customRoundIconButton.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/Text/textExtraSmall.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/Text/textLarge.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/Text/textSmall.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/customIcon.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/customImage.dart';
import 'package:gag_cars_frontend/GlobalVariables/colorGlobalVariables.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class MainNewsPage extends StatefulWidget {

  final Map<String, dynamic> allJson; 
  const MainNewsPage({
    required this.allJson,
    super.key
    });

  @override
  State<MainNewsPage> createState() => _MainNewsPageState();
}

class _MainNewsPageState extends State<MainNewsPage> {
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
        leadingIconDataColor: ColorGlobalVariables.fadedBlackColor,
        titleText: 'GAG News',
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
        child: SizedBox(
          width: screenSize.width,
          height: screenSize.height,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 30,),
                    //image
                    CustomImage(
                      imagePath: widget.allJson["imagePath"],
                      imageHeight: 250,
                      imageWidth: double.infinity, 
                      imageBorderRadius: 12,
                      isAssetImage: true, 
                      fit: BoxFit.cover,
                      isImageBorderRadiusRequired: ColorGlobalVariables.trueValue,
                      ),
                    const SizedBox(height: 8,),
                    // header
                    TextLarge(
                      title: widget.allJson["imageHeader"], 
                      fontWeight: FontWeight.bold, 
                      textColor: ColorGlobalVariables.blackColor
                      ),
                    const SizedBox(height: 8,),
                    // row for profile image and profile details
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // row for profile image and name
                        Row(
                          children: [
                            // profile image
                        CustomImage(
                          imagePath: widget.allJson["userImage"],
                          fit: BoxFit.cover, 
                          isAssetImage: true, // temporary for now 
                          isImageBorderRadiusRequired: ColorGlobalVariables.trueValue
                          ),
                        const SizedBox(width: 8,),
                        // profile name
                        TextSmall(
                          title: "By ${widget.allJson["userType"]}", 
                          fontWeight: FontWeight.normal, 
                          textColor: ColorGlobalVariables.blackColor
                          ),
                          ],
                        ),
                        // time posted
                        TextSmall(
                          title: widget.allJson["timePosted"], 
                          fontWeight: FontWeight.normal, 
                          textColor: ColorGlobalVariables.blackColor
                          ),
                      ],
                    ),
                    const SizedBox(height: 10,),
                    // details
                    TextSmall(
                      title: widget.allJson["imageDetail"],
                      //maxLines: 2,
                      //overflow: TextOverflow.ellipsis, 
                      fontWeight: FontWeight.normal, 
                      textColor: ColorGlobalVariables.blackColor
                      ),
                    const SizedBox(height: 8,),
                    //row for icons and comment, likes section
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // icons section
                        Row(
                          children: [
                            // love
                            GestureDetector(
                              onTap: (){},
                              child: CustomIcon(
                                iconData: Icons.favorite_outline, 
                                isFaIcon: false, 
                                iconSize: 24,
                                iconColor: ColorGlobalVariables.redColor
                                ),
                            ),
                            const SizedBox(width: 10,),
                            // message
                            GestureDetector(
                              onTap: (){},
                              child: CustomIcon(
                                iconData: Icons.message_outlined, 
                                iconSize: 24,
                                isFaIcon: ColorGlobalVariables.falseValue, 
                                iconColor: ColorGlobalVariables.fadedBlackColor
                                ),
                            ),
                            const SizedBox(width: 10,),
                            // upload
                            GestureDetector(
                              onTap: (){},
                              child: CustomIcon(
                                iconData: FontAwesomeIcons.upload, 
                                iconSize: 24,
                                isFaIcon: true, 
                                iconColor: ColorGlobalVariables.fadedBlackColor
                                ),
                            ),
                          ],
                        ),
                        // comments, likes section
                        Row(
                          children: [
                            // comment
                            TextExtraSmall(
                              title: "${widget.allJson["noOfComments"]} Comments ", 
                              textColor: ColorGlobalVariables.fadedBlackColor
                              ),
                            //const SizedBox(width: 1,),
                            DotSeparator(),
                            //const SizedBox(width: 1,),
                            // likes
                            TextExtraSmall(
                              title: " ${widget.allJson["noOfLikes"]}k Likes", 
                              textColor: ColorGlobalVariables.fadedBlackColor
                              ),
                          ],
                        ),
                      ],
                    ),
                  
                  ],
                  ),
            ),
          ),
        ),
        ),
    );
  }
}