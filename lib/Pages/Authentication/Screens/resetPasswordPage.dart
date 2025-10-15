import 'package:flutter/material.dart';
import 'package:gag_cars_frontend/GeneralComponents/KwekuComponents/buttons/custom_button.dart';
import 'package:gag_cars_frontend/GeneralComponents/KwekuComponents/inputs/app_icons.dart';
import 'package:gag_cars_frontend/GeneralComponents/KwekuComponents/inputs/custom_text_field.dart';
import 'package:gag_cars_frontend/GlobalVariables/colorGlobalVariables.dart';
import 'package:gag_cars_frontend/Pages/Authentication/Services/authService.dart';
import 'package:gag_cars_frontend/Routes/routeClass.dart';
import 'package:gag_cars_frontend/Utils/WidgetUtils/widgetUtils.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class ResetPasswordPage extends StatefulWidget {
  // final String phone;
  // final String email; // email from email link
  // final String otp;
  final Map<String, dynamic> allJson;
  const ResetPasswordPage({
    super.key,
    required this.allJson,
    // required this.phone,
    // required this.email,
    // required this.otp,
    });

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {

  final TextEditingController _newPassowordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  bool _isLoading = false;
  bool _obscureText1 = true;
  bool _obscureText2 = true;

  @override
  void dispose(){
    _newPassowordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _resetPassword() async {
    if(_newPassowordController.text.isEmpty || _confirmPasswordController.text.isEmpty){
      showCustomSnackBar(
        message: 'Please fill in all fields',
        backgroundColor: ColorGlobalVariables.redColor,
        textColor: ColorGlobalVariables.whiteColor,
      );
      return;
    }
    if(_newPassowordController.text != _confirmPasswordController.text){
      showCustomSnackBar(
        message: 'Passwords do not match',
        backgroundColor: ColorGlobalVariables.redColor,
        textColor: ColorGlobalVariables.whiteColor,
      );
      return;
    }

    if(_newPassowordController.text.length < 8){
      showCustomSnackBar(
        message: 'Password must be at least 8 characters',
        backgroundColor: ColorGlobalVariables.redColor,
        textColor: ColorGlobalVariables.whiteColor,
      );
      return;
    }
    setState(() => _isLoading = true);
    try{
      final logger = Logger();
      logger.w("allData: ${widget.allJson}");
      await AuthService.resetPassword( 
        phone: widget.allJson["phone"],
        email: widget.allJson["email"], 
        otp: widget.allJson["otp"],
        newPassword: _newPassowordController.text,
        );
      showCustomSnackBar(
        message: 'Password reset successfully',
        backgroundColor: ColorGlobalVariables.greenColor,
        textColor: ColorGlobalVariables.whiteColor,
      );

      // navigate to login page after successful reset
      Get.offAllNamed(RouteClass.getSignInWithEmailPage());
    } on http.ClientException catch(e){
      showCustomSnackBar(
        message: 'Error: ${e.message}',
        backgroundColor: ColorGlobalVariables.redColor,
        textColor: ColorGlobalVariables.whiteColor
      );
    } catch(e){
      showCustomSnackBar(
        message: 'Failed to reset password. Please try again',
        backgroundColor: ColorGlobalVariables.redColor,
        textColor: ColorGlobalVariables.whiteColor,
      );
    } finally{
      setState(() => _isLoading = false);
    }
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
                                    Text('New Password',style: TextStyle(fontSize:32, fontWeight: FontWeight.w500 ),),
                             
                                           Text('Create your new Password to login.',style: TextStyle(fontSize:15, fontWeight: FontWeight.w500  ,color: Color.fromRGBO(0, 0, 0, 0.6)),),
                                              SizedBox(height: 30,),
                                              // new password
                                              CustomTextField(
                                                controller: _newPassowordController,
                                                hintText: 'New Password', 
                                                prefixImage: AppIcons.lock_icon,
                                                textInputType: TextInputType.visiblePassword,
                                                obscureText:  _obscureText1,
                                                suffixIcon: _obscureText1 ? Icons.visibility : Icons.visibility_off,
                                                onSuffixIconPressed: (){
                                                  setState(() => _obscureText1 = !_obscureText1);
                                                },
                                                ),
                                              SizedBox(height: 10,),
                                              // 
                                              CustomTextField(
                                                controller: _confirmPasswordController,
                                                hintText: 'Repeat Password', 
                                                prefixImage: AppIcons.lock_icon,
                                                obscureText: _obscureText2,
                                                suffixIcon: _obscureText2 ? Icons.visibility : Icons.visibility_off,
                                                onSuffixIconPressed: (){
                                                  setState(() => _obscureText2 = !_obscureText2);
                                                },
                                                textInputType: TextInputType.visiblePassword,
                                                ),



                                                SizedBox(height: 50,),

                                                CustomButton(
                                                  buttonName: 'Reset Password',
                                                  onPressed: _resetPassword, 
                                                  isLoading: _isLoading,
                                                  )
                        
                ],),
              ),
            )
         ,
        
         Positioned(
          top: 78,
   
          child: Icon(Icons.arrow_back_ios,size: 30,color: Colors.black,))
         ,
        
           
          ],
        ),
      ),
    );
  
  }
}
