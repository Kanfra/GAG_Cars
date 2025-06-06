import 'package:flutter/material.dart';
import 'package:gag_cars_frontend/GeneralComponents/KwekuComponents/buttons/custom_button.dart';
import 'package:gag_cars_frontend/GeneralComponents/KwekuComponents/inputs/app_icons.dart';
import 'package:gag_cars_frontend/GeneralComponents/KwekuComponents/inputs/custom_text_field.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
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
                        
                                              CustomTextField(hintText: 'New Password', prefixImage: AppIcons.lock_icon),
                                                                                          SizedBox(height: 10,),
                                                                                 CustomTextField(hintText: 'New Password', prefixImage: AppIcons.lock_icon),



                                                                                SizedBox(height: 50,),

                                                                            CustomButton(buttonName: 'Reset  Password',onPressed: (){},)
                        
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