import 'package:flutter/material.dart';
import 'package:gag_cars_frontend/GeneralComponents/Buttons/customTextButton.dart';
import 'package:gag_cars_frontend/GeneralComponents/TextFormFields/customTextFormField.dart';

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
          body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(25.00),
              width:double.infinity ,
              child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    Row(
                    children: [
                      const Icon(Icons.arrow_back_ios_new),
                      SizedBox(width:size.width*0.22),
                      const Text("Profile Update",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)
                    ],
                  ),
                  const SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Stack(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: size.width * 0.15,
                                child: ClipOval(
                                  child: Image.asset("assets/images/gag_logo_red.png",
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              Positioned(
                                top:0,
                                right: 4,
                                child: GestureDetector(
                                  onTap: (){},
                                  child: Container(
                                    padding: const EdgeInsets.all(6.00),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(5)

                                  ),
                                    child: const Icon(Icons.mode_edit_outline_outlined,size: 25,),
                              ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 10,),
                          const Text("Gordon Auto Garage",style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold),),
                          const Text("joined: 1st January 2025",style: TextStyle(fontSize: 10),),

                                                  ],
                      )
                    ],
                  ),
                  const SizedBox(height: 25,),
                   const Text("Name",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                   CustomTextFormField(obscureText: true,
                      textInputType: TextInputType.text,
                      hintText: "Gordon Auto Garage",
                      isSuffixIconRequired: false,
                      isPrefixIconRequired: false,
                      editingController: nameController ,
                      isFieldHeightRequired: true,
                   fieldWidth: double.infinity,
                     maxLines: 1,
                     minLines: 1,

                   ),
                    const SizedBox(height:6 ,),
                  const Text("Phone Number",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                  CustomTextFormField(obscureText: true,
                    textInputType: const TextInputType.numberWithOptions(),
                    hintText: "0240295342",
                    isSuffixIconRequired: false,
                    isPrefixIconRequired: false,
                    editingController: phoneController ,
                    isFieldHeightRequired: true,
                    fieldWidth: double.infinity,
                    maxLines: 1,
                    minLines: 1,

                  ),
                  const SizedBox(height:6 ,),
                  const Text("Email",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                  CustomTextFormField(obscureText: true,
                    textInputType: TextInputType.emailAddress,
                    hintText: "iamrosman@gmail.com",
                    isSuffixIconRequired: false,
                    isPrefixIconRequired: false,
                    editingController: emailController ,
                    isFieldHeightRequired: true,
                    fieldWidth: double.infinity,
                    maxLines: 1,
                    minLines: 1,

                  ),
                  SizedBox(height: size.height * 0.1,),
                  CustomTextButton(buttonTextType: "Update",
                    textSize: 25,
                    textTypeColor: Colors.white,
                    isFullButtonWidthRequired: true,
                    buttonBackgroundColor: Colors.red,
                    buttonVerticalPadding: 18,


                    onClickFunction: () {  },
                  )

                ],
              ),
            ),
          ),
        )
    );
  }
}
