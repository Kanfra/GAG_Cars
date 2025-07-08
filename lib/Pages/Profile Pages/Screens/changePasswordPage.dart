import 'package:flutter/material.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/Appbar/customAppbarOne.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/Buttons/customElevatedButton.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/titleWithTextFormFieldComponent.dart';
import 'package:gag_cars_frontend/GlobalVariables/colorGlobalVariables.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {

  // form validation
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
        centerTitle: ColorGlobalVariables.trueValue, 
        titleText: "Security",
        ),
      body: Form(
        key: _formKey,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20,),
          width: screenSize.width,
          height: screenSize.height,
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 30,),
                      // old password
                      TitleWithTextformfieldComponent(
                        title: "Old Password", 
                        fontWeight: FontWeight.w500, 
                        textColor: ColorGlobalVariables.blackColor, 
                        obscureText: ColorGlobalVariables.falseValue, 
                        isTitleWithContainerWidgetRequired: true,
                        fieldWidth: double.infinity, 
                        hintText: "Enter old password", 
                        isSuffixIconRequired: ColorGlobalVariables.falseValue, 
                        isPrefixIconRequired: ColorGlobalVariables.falseValue, 
                        isFieldHeightRequired: ColorGlobalVariables.falseValue,
                        ),
                        const SizedBox(height: 20),
                        // new password
                        TitleWithTextformfieldComponent(
                        title: "New Password", 
                        fontWeight: FontWeight.w500, 
                        textColor: ColorGlobalVariables.blackColor, 
                        obscureText: ColorGlobalVariables.falseValue, 
                        isTitleWithContainerWidgetRequired: true,
                        fieldWidth: double.infinity, 
                        hintText: "Enter new password", 
                        isSuffixIconRequired: ColorGlobalVariables.falseValue, 
                        isPrefixIconRequired: ColorGlobalVariables.falseValue, 
                        isFieldHeightRequired: ColorGlobalVariables.falseValue,
                        ),
                        const SizedBox(height: 20,),
                        // confirm new password
                        TitleWithTextformfieldComponent(
                        title: "Confirm New Password", 
                        fontWeight: FontWeight.w500, 
                        textColor: ColorGlobalVariables.blackColor, 
                        obscureText: ColorGlobalVariables.falseValue, 
                        isTitleWithContainerWidgetRequired: true,
                        fieldWidth: double.infinity, 
                        hintText: "Confirm new password", 
                        isSuffixIconRequired: ColorGlobalVariables.falseValue, 
                        isPrefixIconRequired: ColorGlobalVariables.falseValue, 
                        isFieldHeightRequired: ColorGlobalVariables.falseValue,
                        ),
                        const SizedBox(height: 20,),
                    ],
                  ),
                ),
              ),
              // const SizedBox(height: 20),
              CustomElevatedButton(
                    buttonTextType: "Change Password", 
                    textTypeColor: ColorGlobalVariables.whiteColor, 
                    buttonVerticalPadding: 18,
                    isFullButtonWidthRequired: true, 
                    buttonBackgroundColor: ColorGlobalVariables.brownColor, 
                    onClickFunction: (){}
                    ),
              const SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );
  }
}