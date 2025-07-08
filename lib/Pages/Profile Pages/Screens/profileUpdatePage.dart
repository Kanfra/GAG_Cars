import 'package:flutter/material.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/Text/textExtraSmall.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/Text/textSmall.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/customImage.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/titleWithTextFormFieldComponent.dart';
import 'package:gag_cars_frontend/GlobalVariables/colorGlobalVariables.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../GeneralComponents/EdemComponents/Appbar/customAppbarOne.dart';
import '../../../GeneralComponents/EdemComponents/Buttons/customTextButton.dart';
import '../../../GeneralComponents/EdemComponents/TextFormFields/customTextFormField.dart';

class ProfileUpdatePage extends StatefulWidget {
  const ProfileUpdatePage({super.key});

  @override
  State<ProfileUpdatePage> createState() => _ProfileUpdatePageState();
}

class _ProfileUpdatePageState extends State<ProfileUpdatePage> {
  final TextEditingController nameController = TextEditingController() ;
  final TextEditingController phoneController = TextEditingController() ;
  final TextEditingController emailController = TextEditingController() ;
  @override
  void dispose(){
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
          appBar: CustomAppbar(onLeadingIconClickFunction: (){
            Get.back();
          },
              isLeadingWidgetExist: true,
              leadingIconData: Icons.arrow_back_ios_new_outlined,
              titleText: "Profile Update",
              centerTitle: true,
                      ),
          body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            width: size.width,
            height: size.height,
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                const SizedBox(height: 15,),
                                // container for stack
                                SizedBox(
                                  width: 105,
                                  height: 110,
                                  child: Stack(
                                    clipBehavior: Clip.none,
                                    children: [
                                      CustomImage(
                                        imagePath: "assets/images/gordon_image_temporary.png", 
                                        isAssetImage: true, 
                                        imageHeight: 100,
                                        imageWidth: 100,
                                        imageBorderRadius: 50,
                                        isImageBorderRadiusRequired: true,
                                        ),
                                      Positioned(
                                        top: 4,
                                        right: 0, // Adjusted to avoid overflow
                                        child: GestureDetector(
                                          onTap: () {},
                                          child: Container(
                                            padding: const EdgeInsets.all(2.0),
                                            decoration: BoxDecoration(
                                              shape: BoxShape.rectangle,
                                              border: Border.all(
                                                color: ColorGlobalVariables.blackColor,
                                                width: 1,
                                              ),
                                              borderRadius: BorderRadius.circular(5),
                                            ),
                                            child: const Icon(
                                              Icons.mode_edit_outline_outlined,
                                              size: 18,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 10),
                                // user name text
                                TextSmall(
                                  title: "Gordon Auto Garage", 
                                  fontWeight: FontWeight.w500, 
                                  overflow: TextOverflow.ellipsis,
                                  textColor: ColorGlobalVariables.blackColor,
                                  ),
                                const SizedBox(height: 2,),
                                TextExtraSmall(
                                  title: "joined: 1st January 2025", 
                                  textColor: ColorGlobalVariables.blackColor
                                  ),
                              ],
                            ),
                          ],
                        ),
                                
                                
                        const SizedBox(height: 30,),
                        // name
                        TitleWithTextformfieldComponent(
                          title: 'Name', 
                          fontWeight: FontWeight.w500, 
                          textColor: ColorGlobalVariables.blackColor, 
                          obscureText: false, 
                          textInputType: TextInputType.text,
                          isTitleWithContainerWidgetRequired: true, 
                          hintText:  "Gordon Auto Garage", 
                          isSuffixIconRequired: false, 
                          isPrefixIconRequired: false, 
                          isFieldHeightRequired: false,
                          ),
                        const SizedBox(height: 20,),
                        // phone number
                        TitleWithTextformfieldComponent(
                          title: 'Phone Number', 
                          fontWeight: FontWeight.w500, 
                          textColor: ColorGlobalVariables.blackColor, 
                          obscureText: false, 
                          textInputType: TextInputType.text,
                          isTitleWithContainerWidgetRequired: true, 
                          hintText:  "0240296342", 
                          isSuffixIconRequired: false, 
                          isPrefixIconRequired: false, 
                          isFieldHeightRequired: false,
                          ),
                        const SizedBox(height: 20,),
                        // email
                        TitleWithTextformfieldComponent(
                          title: 'Email', 
                          fontWeight: FontWeight.w500, 
                          textColor: ColorGlobalVariables.blackColor, 
                          obscureText: false, 
                          textInputType: TextInputType.text,
                          isTitleWithContainerWidgetRequired: true, 
                          hintText:  "Iammrosman@gmail.com", 
                          isSuffixIconRequired: false, 
                          isPrefixIconRequired: false, 
                          isFieldHeightRequired: false,
                          ),
                        const SizedBox(height: 20,),
                      ],
                    ),
                  ),
                ),
                // update button
                CustomTextButton(buttonTextType: "Update",
                    textTypeColor: ColorGlobalVariables.whiteColor,
                    isFullButtonWidthRequired: true,
                    buttonBackgroundColor: ColorGlobalVariables.brownColor,
                    buttonVerticalPadding: 18,
                    onClickFunction: () {  },
                  ),
                const SizedBox(height: 30,),
              ],
            ),
          ),
        )
    );
  }
}
