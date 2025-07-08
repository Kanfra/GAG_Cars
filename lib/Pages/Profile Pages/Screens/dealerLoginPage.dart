import 'package:flutter/material.dart';
import 'package:gag_cars_frontend/GlobalVariables/colorGlobalVariables.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../GeneralComponents/EdemComponents/Appbar/customAppbarOne.dart';
import '../../../GeneralComponents/EdemComponents/Buttons/customTextButton.dart';
import '../../../GeneralComponents/EdemComponents/TextFormFields/CustomBorderTextField.dart';
import '../../../GeneralComponents/EdemComponents/TextFormFields/customTextFormField.dart';

class DealerLoginPage extends StatefulWidget {
  const DealerLoginPage({super.key});

  @override
  State<DealerLoginPage> createState() => _DealerLoginPageState();
}

class _DealerLoginPageState extends State<DealerLoginPage> {
  final TextEditingController garageName = TextEditingController();
  final TextEditingController location = TextEditingController();
  final TextEditingController takeSelfie = TextEditingController();
  final TextEditingController nationalID = TextEditingController();
  final TextEditingController companyDocuments = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: CustomAppbar(
              onLeadingIconClickFunction: (){
                Get.back();
              },
              isLeadingWidgetExist: true,
              leadingIconData: Icons.arrow_back_ios_new_outlined,
              titleText: "Dealer Login",
              centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 25,right: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    alignment: Alignment.topLeft,
                    child: const Text("Are you a dealer? Do you have a garage that you want to upload your entire car collection? We will need some documentation to process your reques",
                    textAlign: TextAlign.start
                    ),
                  ),
                  const SizedBox(height: 30,),
                  const Text("Garage / Dealership Name",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
               CustomTextFormField(
                   obscureText: false,
                   textInputType: TextInputType.phone,
                   hintText: "Garage Name",
                   isSuffixIconRequired: false,
                   isPrefixIconRequired: false,
                   editingController: garageName,
                   isFieldHeightRequired: true,
                    fieldWidth: double.infinity,
                    maxLines: 1,
                    minLines: 1,

               ),
                  const Text("Location",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                  CustomTextFormField(
                    obscureText: false,
                    textInputType: TextInputType.phone,
                    hintText: "Location",
                    isSuffixIconRequired: false,
                    isPrefixIconRequired: false,
                    editingController: location,
                    isFieldHeightRequired: true,
                    fieldWidth: double.infinity,
                    maxLines: 1,
                    minLines: 1,
                  ),
                  const Text("Take Selfie",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                  CustomBorderTextFormField(
                      obscureText: false,
                      textInputType: TextInputType.phone,
                      hintText: "",
                      isSuffixIconRequired: false,
                      isPrefixIconRequired: true,
                      prefixIconData: Icons.camera_alt_outlined,
                      editingController: takeSelfie,
                      isFieldHeightRequired: true,
                       fieldWidth: double.infinity,
                  ),
                  const Text("Upload National ID",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                  CustomBorderTextFormField(
                    obscureText: false,
                    textInputType: TextInputType.phone,
                    hintText: "No File Selected",
                    hintTextColor:ColorGlobalVariables.blackColor ,
                    isSuffixIconRequired: false,
                    isPrefixIconRequired: true,
                    prefixIconData: Icons.camera_alt_outlined,
                    editingController: nationalID,
                    isFieldHeightRequired: true,
                    fieldWidth: double.infinity,
                    maxLines: 1,
                    minLines: 1,
                  ),
                  const Text("Upload Company Registration Document",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                  CustomTextFormField(
                    obscureText: false,
                    textInputType: TextInputType.phone,
                    hintText: "No File Selected",
                    hintTextColor: ColorGlobalVariables.blackColor,
                    isSuffixIconRequired: false,
                    isPrefixIconRequired: true,
                    prefixIconData: Icons.file_copy_outlined,
                    editingController: companyDocuments,
                    isFieldHeightRequired: true,
                    fieldWidth: double.infinity,
                    maxLines: 1,
                    minLines: 1,

                  ),
                  const SizedBox(height: 40,),
                  CustomTextButton(
                      buttonTextType: "Become A Dealer",
                      textTypeColor: ColorGlobalVariables.whiteColor,
                      isFullButtonWidthRequired: true,
                      buttonBackgroundColor: ColorGlobalVariables.redColor,
                      onClickFunction: (){},
                      buttonVerticalPadding: 18,
                  )
                ],
              ),
            ),
          ),
        )
    );
  }
}
