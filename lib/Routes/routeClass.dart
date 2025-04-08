
import 'package:gag_cars_frontend/Pages/Authentication/Screens/forgotPasswordPage.dart';
import 'package:gag_cars_frontend/Pages/Authentication/Screens/resetPasswordPage.dart';
import 'package:gag_cars_frontend/Pages/Authentication/Screens/verifyCodePage.dart';
import 'package:gag_cars_frontend/Pages/Splash/Screens/welcomePage.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

import '../Pages/Authentication/Screens/signInWithEmailPage.dart';
import '../Pages/Authentication/Screens/signInWithPhonePage.dart';
import '../Pages/Authentication/Screens/signUpWithEmailPage.dart';
import '../Pages/Authentication/Screens/signUpWithPhonePage.dart';


class RouteClass{

    static String signUpWithEmailPage = "/sign-up-with-email";
    static String signUpWithPhonePage = "/sign-up-with-phone";
    static String signInWithEmailPage = "/sign-in-with-email";
    static String signInWithPhonePage = "/sign-in-with-phone";
    static String welcomePage = "/welcome";
    static String verifyCodePage = "/verify-code";
    static String forgotPasswordPage = "/forgot-password";
    static String resetPassowrdPage = "/reset-password";


    static String getSignUpWithEmailPage() => signUpWithEmailPage;
    static String getSignUpWithPhonePage() => signUpWithPhonePage;
    static String getSignInWithEmailPage() => signInWithEmailPage;
    static String getSignInWithPhonePage() => signInWithPhonePage;
    static String getWelcomePage() => welcomePage;
    static String getVerifyCodePage() => verifyCodePage;
    static String getForgotPasswordPage() => forgotPasswordPage;
    static String getResetPasswordPage() => resetPassowrdPage;
  

  static List<GetPage> routes = [
    GetPage(
      page: ()=> const SignUpWithEmailPage(), 
      name: signUpWithEmailPage, 
      transition: Transition.noTransition, 
      transitionDuration: const Duration(milliseconds: 350),
      ),
    GetPage(
      page: ()=> const SignUpWithPhonePage(), 
      name: signUpWithPhonePage, 
      transition: Transition.noTransition, 
      transitionDuration: const Duration(milliseconds: 350),
      ),
    GetPage(
      page: ()=> const SignInWithEmailPage(), 
      name: signInWithEmailPage, 
      transition: Transition.noTransition, 
      transitionDuration: const Duration(milliseconds: 350),
      ),
    GetPage(
      page: ()=> const SignInWithPhonePage(), 
      name: signInWithPhonePage, 
      transition: Transition.noTransition, 
      transitionDuration: const Duration(milliseconds: 350),
      ),
    GetPage(
      page: ()=> const WelcomePage(), 
      name: welcomePage, 
      transition: Transition.noTransition, 
      transitionDuration: const Duration(milliseconds: 350),
      ),
    GetPage(
      page: ()=> const VerifyCodePage(), 
      name: verifyCodePage, 
      transition: Transition.noTransition, 
      transitionDuration: const Duration(milliseconds: 350),
      ),
    GetPage(
      page: ()=> const ForgotPasswordPage(), 
      name: forgotPasswordPage, 
      transition: Transition.noTransition, 
      transitionDuration: const Duration(milliseconds: 350),
      ),
    GetPage(
      page: ()=> const ResetPasswordPage(), 
      name: resetPassowrdPage, 
      transition: Transition.noTransition, 
      transitionDuration: const Duration(milliseconds: 350),
      ),
  ];
}