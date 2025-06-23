import 'package:flutter/material.dart';
import 'package:gag_cars_frontend/Pages/Authentication/Services/authService.dart';
import 'package:gag_cars_frontend/Routes/routeClass.dart';
import 'package:gag_cars_frontend/GeneralComponents/KwekuComponents/buttons/custom_button.dart';
import 'package:gag_cars_frontend/GeneralComponents/KwekuComponents/inputs/app_icons.dart';
import 'package:gag_cars_frontend/GeneralComponents/KwekuComponents/inputs/custom_text_field.dart';
import 'package:gag_cars_frontend/Utils/utils.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';



class SignUpWithEmailPage extends StatefulWidget {
  const SignUpWithEmailPage({super.key});

  @override
  State<SignUpWithEmailPage> createState() => _SignUpWithEmailPageState();
}

class _SignUpWithEmailPageState extends State<SignUpWithEmailPage> {

  final logger = Logger();

  // form validation
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _isLoading = false;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

   Future<void> _signUp() async {
    if (_formKey.currentState!.validate()) {
      setState(()=>_isLoading = true);
      try{
        final user = await AuthService.signUpWithEmail(
          name: nameController.text, 
          email: emailController.text, 
          password: passwordController.text
          );

        // navigate to another page
        Get.offNamed(RouteClass.getHomePage());
        showCustomSnackBar(
          context: context, 
          message: "Success, Account created successfully!"
          );

      }catch(e){
        showCustomSnackBar(
          context: context,
          message: "Error, ${e.toString()}"
          );
      }finally{
        setState(()=>_isLoading = false);
      }
    }
    else{
      
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
        body: SafeArea(
            child: Form(
              key: _formKey,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30 ,vertical: 20),
                  child: SingleChildScrollView(
                    child: Column(
                               crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(AppIcons.gag_logo_red,width: 210,),
                      Text("Sign Up",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
                             Text("Buy or sell your car!",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400),),
                    SizedBox(
                      height: 20,
                    ),
                                // full name
                                 CustomTextField(
                                  controller: nameController,
                                  hintText: "Full Name", 
                                  prefixImage: AppIcons.profile_icon,
                                  onChanged: (value) => {},
                                  validator: (value){
                                    if(value == null || value.isEmpty){
                                      return "Please enter your name";
                                    }
                                    return null;
                                  },
                                  ),
                                SizedBox(
                                  height: 14,
                                ),
                                // email 
                                 CustomTextField(
                                  controller: emailController,
                                  hintText: "Email address", 
                                  prefixImage: AppIcons.email_icon,
                                  onChanged: (value)=>{},
                                  validator: (value){
                                    if(value == null || value.isEmpty){
                                      return "Please enter your email";
                                    }
                                    if(!GetUtils.isEmail(value)){
                                      return "Please enter a valid email";
                                    }
                                    return null;
                                  },
                                  ),
                                     SizedBox(
                                  height: 14,
                                ),
                                  // password
                                  CustomTextField(
                                    controller: passwordController,
                                    hintText: "Password", 
                                    obscureText: true,
                                    prefixImage: AppIcons.lock_icon,
                                    onChanged: (value)=>{},
                                    validator: (value){
                                      if(value == null || value.isEmpty){return "Please enter password";}
                                      if(value.length < 6){return "Password must be at least 6 characters";}
                                      return null;
                                    },
                                    ),
                                             SizedBox(
                                  height: 14,
                                ),
            
                                  // confirm password
                                  CustomTextField(
                                    controller: confirmPasswordController,
                                    hintText: "Repeat  Password",
                                    obscureText: true,
                                    prefixImage: AppIcons.lock_icon,
                                    onChanged: (value)=>{},
                                    validator: (value){
                                      if(value == null || value.isEmpty){return "Please confirm password";}
                                      if(value != passwordController.text){return "Passwords don't match";}
                                      return null;
                                    },
                                    ),
                    
                                                 SizedBox(
                                                  height: 20,
                                                 ),
                    // sign up with email button
                    CustomButton(
                      isLoading: _isLoading,
                      buttonName: 'Sign Up', 
                      onPressed: _signUp,
                      ),
                    
                    SizedBox(height: 20,),
                    
                    Row(
                      children: [
                        Expanded(
                          child: Divider(
                            color: Color.fromRGBO(196, 196, 196, 1),
                            thickness: 1,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Text(
                            'OR',
                            style: TextStyle(
                              color: Color.fromRGBO(196, 196, 196, 1),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            color: Color.fromRGBO(196, 196, 196, 1),
                            thickness: 1,
                          ),
                        ),
                     
                     
                      ],
                    )
                    
                    ,
                    SizedBox(height: 14,),
                    
                             Text("Sign Up with",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500 ,color: Color.fromRGBO(159, 16, 16, 1)),),
                    
                    
                             SizedBox(height: 14,),
                    
                             SizedBox(
                              width: 200,
                               child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  
                                  Image.asset(AppIcons.facebook ,width: 24,),
                                     Image.asset(AppIcons.apple_logo ,width: 24,),
                                        Image.asset(AppIcons.google_logo ,width: 24,),

                                          // sign up with phone number button
                                           GestureDetector(
                                            onTap: (){
                                                      Get.offNamed(RouteClass.getSignUpWithPhonePage());
                                            },
                                            child: Image.asset(AppIcons.phone_call_logo ,width: 24,)),
                                              Image.asset(AppIcons.email_logo ,width: 24,),
                                ],
                               ),
                             ),
                    
                            SizedBox(
                              height: 30,
                            ),

                            // sign in with email button
                            GestureDetector(
                              onTap: (){

                                       Get.offNamed(RouteClass.getSignInWithEmailPage());
                              },
                              child: RichText(
                                                  text: TextSpan(
                                                    text: 'Already have an account? ',
                                                    style: TextStyle(color: Colors.black87, fontSize: 16),
                                                    children: <TextSpan>[
                                                      TextSpan(
                              text: 'Sign In',
                              style: TextStyle(
                                color: Color.fromRGBO(159, 16, 16, 1),
                                fontWeight: FontWeight.bold,
                              ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                            )
                    
                    
                      ],
                    ),
                  ),
                ),
              ),
            )
            ),
    
    
    );
  
  
  }
}