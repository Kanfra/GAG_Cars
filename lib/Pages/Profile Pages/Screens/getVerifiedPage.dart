import 'package:flutter/material.dart';
import 'package:gag_cars_frontend/GlobalVariables/sizeGlobalVariables.dart';
import '../../../GeneralComponents/EdemComponents/Appbar/customAppbarOne.dart';
import '../../../GeneralComponents/EdemComponents/Buttons/customTextButton.dart';
import '../../../GeneralComponents/EdemComponents/TextFormFields/CustomBorderTextField.dart';
import '../../../GlobalVariables/colorGlobalVariables.dart';
class GetVerifiedPage extends StatefulWidget {
  const GetVerifiedPage({super.key});

  @override
  State<GetVerifiedPage> createState() => _GetVerifiedPageState();
}

class _GetVerifiedPageState extends State<GetVerifiedPage> {
  final TextEditingController takeSelfie = TextEditingController();
  final TextEditingController nationalID = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: CustomAppbar(
              onLeadingIconClickFunction: (){},
              isLeadingWidgetExist: true,
              leadingIconData: Icons.arrow_back_ios_new_outlined,
              titleText: "Get Verified",
             centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 25,right: 25,top: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    child: const Text("Get Verified,so that customer will trust that they are dealing with genuine people",
                    ),
                  ),
                const SizedBox(height: 20,),
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
                  const SizedBox(height: 30,),
                  CustomTextButton(
                      buttonTextType: "Get Verified",
                      textTypeColor: ColorGlobalVariables.whiteColor,
                      isFullButtonWidthRequired: true,
                      buttonBackgroundColor: ColorGlobalVariables.redColor,
                      onClickFunction: (){},
                       buttonVerticalPadding: SizeGlobalVariables.double_size_eighteen,
                  )
                ],
              ),
            ),
          ),
        )
    );
  }
}
