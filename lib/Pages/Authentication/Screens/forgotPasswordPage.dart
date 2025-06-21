import 'package:flutter/material.dart';
import 'package:gag_cars_frontend/GeneralComponents/KwekuComponents/buttons/custom_button.dart';
import 'package:gag_cars_frontend/GeneralComponents/KwekuComponents/inputs/app_icons.dart';
import 'package:gag_cars_frontend/GeneralComponents/KwekuComponents/inputs/custom_text_field.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
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
                                    Text('Forgot Password ?',style: TextStyle(fontSize:32, fontWeight: FontWeight.w500 ),),
                             
                                           Text(''' Type your email, we’ll send you verification code
 in your email.''',style: TextStyle(fontSize:15, fontWeight: FontWeight.w500  ,color: Color.fromRGBO(0, 0, 0, 0.6)), textAlign: TextAlign.center,),
                                              SizedBox(height: 30,),
                        
                                              CustomTextField(hintText: 'Email address', prefixImage: AppIcons.email_icon),
                                                                                          SizedBox(height: 10,),
                                    

                                                                                SizedBox(height: 50,),

                                                                            CustomButton(
                                                                              buttonName: 'Reset  Password',
                                                                              onPressed: (){}, 
                                                                              isLoading: false,)
                        
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