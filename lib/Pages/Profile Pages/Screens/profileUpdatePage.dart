import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/Text/textExtraSmall.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/Text/textSmall.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/customImage.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/titleWithTextFormFieldComponent.dart';
import 'package:gag_cars_frontend/GlobalVariables/colorGlobalVariables.dart';
import 'package:gag_cars_frontend/GlobalVariables/imageStringGlobalVariables.dart';
import 'package:gag_cars_frontend/Pages/Authentication/Models/user_model.dart';
import 'package:gag_cars_frontend/Pages/Authentication/Providers/userProvider.dart';
import 'package:gag_cars_frontend/Utils/ApiUtils/apiUtils.dart';
import 'package:gag_cars_frontend/Utils/WidgetUtils/widgetUtils.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../../../GeneralComponents/EdemComponents/Appbar/customAppbarOne.dart';
import '../../../GeneralComponents/EdemComponents/Buttons/customTextButton.dart';
import '../../../GeneralComponents/EdemComponents/TextFormFields/customTextFormField.dart';

class ProfileUpdatePage extends StatefulWidget {
  const ProfileUpdatePage({super.key});

  @override
  State<ProfileUpdatePage> createState() => _ProfileUpdatePageState();
}

class _ProfileUpdatePageState extends State<ProfileUpdatePage> {
  // final TextEditingController nameController = TextEditingController() ;
  // final TextEditingController phoneController = TextEditingController() ;
  // final TextEditingController emailController = TextEditingController() ;
  
  // values to work with
  String? name;
  String? phoneNumber;
  String? email;
  String? profileImage;
  String joinedDate = "Not available";

  final ImagePicker _picker = ImagePicker();
  File? _pendingProfileImage;
  String? _tempImagePath;

  @override
  void dispose(){
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final UserModel? user = userProvider.user;
    if(user?.createdAt != null){
      joinedDate = "Joined: ${user!.createdAt!.toLocal().toString().split(' ')[0]}";
    }
    // set initial values for controllers and state
    setState(() {
      name = user?.name;
      phoneNumber = user?.phoneNumber;
      email = user?.email;
      profileImage = user?.profileImage;
    });
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
                                GestureDetector(
                                  onTap: () => showImageSourceDialog(
                                    picker: _picker, 
                                    setStateFunction: (pickedFile){
                                      setState(() {
                                        _pendingProfileImage = File(pickedFile.path);
                                        _tempImagePath = pickedFile.path;
                                        // _pendingProfileImage = imageFile;
                                      });
                                    }
                                    ),
                                  child: SizedBox(
                                    width: 105,
                                    height: 110,
                                    child: Stack(
                                      clipBehavior: Clip.none,
                                      children: [
                                        CustomImage(
                                          imagePath: _tempImagePath ?? getImageUrl("$profileImage", "${ImageStringGlobalVariables.imagePath}gordon_image_temporary.png"), 
                                          // profileImage == null ? "assets/images/gordon_image_temporary.png", 
                                          imageFile: _pendingProfileImage,
                                          isAssetImage: _pendingProfileImage == null && profileImage == null,
                                          isFileImage: _pendingProfileImage != null,                                      imageHeight: 100,
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
                                ),
                                const SizedBox(height: 10),
                                // user name text
                                TextSmall(
                                  title: name!, 
                                  fontWeight: FontWeight.w500, 
                                  overflow: TextOverflow.ellipsis,
                                  textColor: ColorGlobalVariables.blackColor,
                                  ),
                                const SizedBox(height: 2,),
                                TextExtraSmall(
                                  title: joinedDate, 
                                  textColor: ColorGlobalVariables.blackColor
                                  ),
                              ],
                            ),
                          ],
                        ),
                                
                                
                        const SizedBox(height: 30,),
                        // name
                        GestureDetector(
                          onTap: () => showFieldInputDialog(
                            fieldLabel: 'Name', 
                            fieldName: 'Name', 
                            fieldType: 'string', 
                            selectedField: name!, 
                            context: context, 
                            setStateFunction: (value) { 
                              setState(() {
                                name = value;
                              });
                             }),
                          child: TitleWithTextformfieldComponent(
                            title: 'Name', 
                            fontWeight: FontWeight.w500, 
                            textColor: ColorGlobalVariables.blackColor, 
                            obscureText: false, 
                            textInputType: TextInputType.text,
                            isTitleWithContainerWidgetRequired: true, 
                            hintText:  name ?? "Guest User", 
                            isSuffixIconRequired: false, 
                            isPrefixIconRequired: false, 
                            isFieldHeightRequired: false,
                            ),
                        ),
                        const SizedBox(height: 20,),
                        // phone number
                        GestureDetector(
                          onTap: () => showFieldInputDialog(
                            fieldLabel: 'Phone Number', 
                            fieldName: 'Phone Number', 
                            fieldType: 'number', 
                            selectedField: phoneNumber!, 
                            context: context, 
                            setStateFunction: (value){ 
                              setState(() {
                                phoneNumber = value;
                              });
                             }),
                          child: TitleWithTextformfieldComponent(
                            title: 'Phone Number', 
                            fontWeight: FontWeight.w500, 
                            textColor: ColorGlobalVariables.blackColor, 
                            obscureText: false, 
                            textInputType: TextInputType.text,
                            isTitleWithContainerWidgetRequired: true, 
                            hintText:  phoneNumber!, 
                            isSuffixIconRequired: false, 
                            isPrefixIconRequired: false, 
                            isFieldHeightRequired: false,
                            ),
                        ),
                        const SizedBox(height: 20,),
                        // email
                        GestureDetector(
                          onTap: () => showFieldInputDialog(
                            fieldLabel: 'Email', 
                            fieldName: 'Email', 
                            fieldType: 'string', 
                            selectedField: email!, 
                            context: context, 
                            setStateFunction: (value) { 
                              setState(() {
                                email = value;
                              });
                             }),
                          child: TitleWithTextformfieldComponent(
                            title: 'Email', 
                            fontWeight: FontWeight.w500, 
                            textColor: ColorGlobalVariables.blackColor, 
                            obscureText: false, 
                            textInputType: TextInputType.text,
                            isTitleWithContainerWidgetRequired: true, 
                            hintText:  email!, 
                            isSuffixIconRequired: false, 
                            isPrefixIconRequired: false, 
                            isFieldHeightRequired: false,
                            ),
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
