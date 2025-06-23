import 'package:flutter/material.dart';
import 'package:gag_cars_frontend/Pages/Authentication/Services/authService.dart';
import 'package:gag_cars_frontend/Routes/routeClass.dart';
import 'package:gag_cars_frontend/GeneralComponents/KwekuComponents/buttons/custom_button.dart';
import 'package:gag_cars_frontend/GeneralComponents/KwekuComponents/inputs/app_icons.dart';
import 'package:gag_cars_frontend/GeneralComponents/KwekuComponents/inputs/custom_text_field.dart';
import 'package:gag_cars_frontend/Utils/utils.dart';
import 'package:get/get.dart';

class SignInWithEmailPage extends StatefulWidget {
  const SignInWithEmailPage({super.key});

  @override
  State<SignInWithEmailPage> createState() => _SignInWithEmailPageState();
}

class _SignInWithEmailPageState extends State<SignInWithEmailPage> {
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();
    bool _isLoading = false;
    // form validation
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    
    Future<void> _login() async {
    setState(() => _isLoading = true);
    try {
      await AuthService.logInWithEmail(
        email: _emailController.text,
        password: _passwordController.text,
      );
      Get.offNamed(RouteClass.getHomePage()); // Navigate after success
    } catch (e) {
      showCustomSnackBar(
        context: context, 
        message: "Error, ${e.toString()}"
        );
    } finally {
      setState(() => _isLoading = false);
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
                      Text("Login ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
                             Text("Welcome to GAGcars",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400),),
                    SizedBox(
                      height: 20,
                    ),
                             
                                 CustomTextField(
                                  controller: _emailController,
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
                                         CustomTextField(
                                          controller: _passwordController,
                                          hintText: "Password", 
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
                                             GestureDetector(
                                              onTap: (){
                                                    Get.offNamed(RouteClass.getForgotPasswordPage());
                                              },
                                              child: Text("Forgot Password?",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500),)),
                    
                                                 SizedBox(
                                                  height: 20,
                                                 ),
                    CustomButton(
                      buttonName: 'Login', 
                      onPressed: _login, 
                      isLoading: _isLoading,
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
                    
                             Text("Login with",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500 ,color: Color.fromRGBO(159, 16, 16, 1)),),
                    
                    
                             SizedBox(height: 14,),
                    
                             SizedBox(
                              width: 200,
                               child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  
                                  Image.asset(AppIcons.facebook ,width: 24,),
                                     Image.asset(AppIcons.apple_logo ,width: 24,),
                                        Image.asset(AppIcons.google_logo ,width: 24,),
                                           GestureDetector(
                                            onTap: (){
                                              Get.offNamed(RouteClass.getSignInWithPhonePage());
                                            },
                                            child: Image.asset(AppIcons.phone_call_logo ,width: 24,)),
                                              Image.asset(AppIcons.email_logo ,width: 24,),
                                ],
                               ),
                             ),
                    
                            SizedBox(
                              height: 30,
                            ),
                            GestureDetector(
                              onTap: (){
                          Get.offNamed(RouteClass.getSignUpWithEmailPage());
                              },
                              child: RichText(
                                                  text: TextSpan(
                                                    text: 'Already have an account? ',
                                                    style: TextStyle(color: Colors.black87, fontSize: 16),
                                                    children: <TextSpan>[
                                                      TextSpan(
                              text: 'Sign Up',
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