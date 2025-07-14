import 'package:flutter/material.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/IconButtons/customRoundIconButton.dart';
import 'package:gag_cars_frontend/GeneralComponents/KwekuComponents/buttons/custom_button.dart';
import 'package:gag_cars_frontend/GeneralComponents/KwekuComponents/inputs/app_icons.dart';
import 'package:gag_cars_frontend/GeneralComponents/KwekuComponents/inputs/custom_text_field.dart';
import 'package:gag_cars_frontend/GlobalVariables/colorGlobalVariables.dart';
import 'package:gag_cars_frontend/Pages/Authentication/Services/authService.dart';
import 'package:gag_cars_frontend/Utils/WidgetUtils/widgetUtils.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {

  final TextEditingController _emailController = TextEditingController();
  bool _isLoading = false;

  Future<void> _handlePasswordReset() async {
    final email = _emailController.text.trim();
    if(email.isEmpty || !email.isEmail){
      showCustomSnackBar(
        message: 'Please enter a valid email address',
        backgroundColor: ColorGlobalVariables.redColor,
        textColor: ColorGlobalVariables.whiteColor
      );
      return;
    }
    setState(() => _isLoading = true);
    try{
      await AuthService.sendPasswordResetEmail(email: email);
      showCustomSnackBar(
        message: 'Password reset link sent to your email',
        backgroundColor: ColorGlobalVariables.greenColor,
        textColor: ColorGlobalVariables.whiteColor
      );
    } on FormatException catch(e){
      showCustomSnackBar(
        message: e.message,
        backgroundColor: ColorGlobalVariables.redColor,
        textColor: ColorGlobalVariables.whiteColor,
      );
    } finally{
      setState(() => _isLoading = false);
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
 
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Stack(
          
          children: [
            Center(
              child: SingleChildScrollView(
                child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                            Text(
                              'Forgot Password ?',
                              style: TextStyle(fontSize:32, fontWeight: FontWeight.w500 ),
                              ),
                            Text(
                              ''' Type your email, we’ll send you verification code in your email.''',
                              style: TextStyle(
                                      fontSize:15, 
                                      fontWeight: FontWeight.w500, 
                                      color: Color.fromRGBO(0, 0, 0, 0.6)), 
                                      textAlign: TextAlign.center,
                                      ),
                            SizedBox(height: 30,),
                            // email
                            CustomTextField(
                              controller: _emailController,
                              textInputType: TextInputType.emailAddress,
                              hintText: 'Email address', 
                              // onChanged: (value){},
                              // validator: (value){},
                              prefixImage: AppIcons.email_icon
                              ),
                            SizedBox(height: 10,),
                                    

                            SizedBox(height: 50,),

                            CustomButton(
                              buttonName: 'Reset  Password',
                              onPressed: _handlePasswordReset, 
                              isLoading: _isLoading,
                              ),

                ],),
              ),
            )
         ,
        
         Positioned(
          top: 78,
   
          child: CustomRoundIconButton(
            iconData: Icons.arrow_back_ios, 
            isBorderSlightlyCurved: false, 
            onIconButtonClickFunction: Get.back,
            ),
          // Icon(Icons.arrow_back_ios,size: 30,color: Colors.black,)
          ),
          ],
        ),
      ),
    );
  
  
  }
}