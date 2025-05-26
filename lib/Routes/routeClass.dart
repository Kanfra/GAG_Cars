
import 'package:gag_cars_frontend/Pages/Authentication/Screens/forgotPasswordPage.dart';
import 'package:gag_cars_frontend/Pages/Authentication/Screens/resetPasswordPage.dart';
import 'package:gag_cars_frontend/Pages/Authentication/Screens/verifyCodePage.dart';
import 'package:gag_cars_frontend/Pages/Profile%20Pages/Screens/customerServicePage.dart';
import 'package:gag_cars_frontend/Pages/Profile%20Pages/Screens/dealerLoginPage.dart';
import 'package:gag_cars_frontend/Pages/Profile%20Pages/Screens/getVerifiedPage.dart';
import 'package:gag_cars_frontend/Pages/Profile%20Pages/Screens/helpCenterPage.dart';
import 'package:gag_cars_frontend/Pages/Profile%20Pages/Screens/myListingsPage.dart';
import 'package:gag_cars_frontend/Pages/Profile%20Pages/Screens/promotionsPage.dart';
import 'package:gag_cars_frontend/Pages/Profile%20Pages/Screens/securityOnePage.dart';
import 'package:gag_cars_frontend/Pages/Profile%20Pages/Screens/securityPage.dart';
import 'package:gag_cars_frontend/Pages/Profile%20Pages/Screens/settingsOnePage.dart';
import 'package:gag_cars_frontend/Pages/Splash/Screens/welcomePage.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

import '../Pages/Authentication/Screens/signInWithEmailPage.dart';
import '../Pages/Authentication/Screens/signInWithPhonePage.dart';
import '../Pages/Authentication/Screens/signUpWithEmailPage.dart';
import '../Pages/Authentication/Screens/signUpWithPhonePage.dart';
import '../Pages/Profile Pages/Screens/settingsPage.dart';


class RouteClass{

    static String signUpWithEmailPage = "/sign-up-with-email";
    static String signUpWithPhonePage = "/sign-up-with-phone";
    static String signInWithEmailPage = "/sign-in-with-email";
    static String signInWithPhonePage = "/sign-in-with-phone";
    static String welcomePage = "/welcome";
    static String verifyCodePage = "/verify-code";
    static String forgotPasswordPage = "/forgot-password";
    static String resetPassowrdPage = "/reset-password";
    // profile pages
    static String settingsPage = "/settings-page";
    static String settingsOnePage = "/settings-one-page";
    static String securityPage = "/security-page";
    static String securityOnePage = "/security-one-page";
    static String promotionsPage = "/promotions-page";
    static String profileUpdatePage = "/profile-update-page";
    static String myListingsPage = "/my-listings-page";
    static String helpCenterPage = "/help-center-page";
    static String getVerifiedPage = "/get-verified-page";
    static String dealerLoginPage = "/dealer-login-page";
    static String customerServicePage = "/customer-service-page";


    static String getSignUpWithEmailPage() => signUpWithEmailPage;
    static String getSignUpWithPhonePage() => signUpWithPhonePage;
    static String getSignInWithEmailPage() => signInWithEmailPage;
    static String getSignInWithPhonePage() => signInWithPhonePage;
    static String getWelcomePage() => welcomePage;
    static String getVerifyCodePage() => verifyCodePage;
    static String getForgotPasswordPage() => forgotPasswordPage;
    static String getResetPasswordPage() => resetPassowrdPage;
    // profile pages
    static String getSettingsPage() => settingsPage;
    static String getSettingsOnePage() => settingsOnePage;
    static String getSecurityPage() => securityPage;
    static String getSecurityOnePage() => settingsOnePage;
    static String getPromotionsPage() => promotionsPage;
    static String getProfileUpdatePage() => profileUpdatePage;
    static String getNyListingsPage() => myListingsPage;
    static String getHelpCenterPage() => helpCenterPage;
    static String getGetVerifiedPage() => getVerifiedPage;
    static String getDealerLoginPage() => dealerLoginPage;
    static String getCustomerServicePage() =>customerServicePage;

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
    // profile pages
    GetPage(
      page: ()=> const ResetPasswordPage(),
      name: resetPassowrdPage,
      transition: Transition.noTransition,
      transitionDuration: const Duration(milliseconds: 350),
    ),
    GetPage(
      page: ()=> const SettingsPage(),
      name: settingsPage,
      transition: Transition.noTransition,
      transitionDuration: const Duration(milliseconds: 350),
    ),
    GetPage(
      page: ()=> const SettingsOnePage(),
      name: settingsOnePage,
      transition: Transition.noTransition,
      transitionDuration: const Duration(milliseconds: 350),
    ),
    GetPage(
      page: ()=> const SecurityPage(),
      name: securityPage,
      transition: Transition.noTransition,
      transitionDuration: const Duration(milliseconds: 350),
    ),
    GetPage(
      page: ()=> const SecurityOnePage(),
      name: securityOnePage,
      transition: Transition.noTransition,
      transitionDuration: const Duration(milliseconds: 350),
    ),
    GetPage(
      page: ()=> const PromotionsPage(),
      name: promotionsPage,
      transition: Transition.noTransition,
      transitionDuration: const Duration(milliseconds: 350),
    ),
    GetPage(
      page: ()=> const MyListingsPage(),
      name: myListingsPage,
      transition: Transition.noTransition,
      transitionDuration: const Duration(milliseconds: 350),
    ),
    GetPage(
      page: ()=> const HelpCenterPage(),
      name: helpCenterPage,
      transition: Transition.noTransition,
      transitionDuration: const Duration(milliseconds: 350),
    ),
    GetPage(
      page: ()=> const GetVerifiedPage(),
      name: getVerifiedPage,
      transition: Transition.noTransition,
      transitionDuration: const Duration(milliseconds: 350),
    ),
    GetPage(
      page: ()=> const DealerLoginPage(),
      name: dealerLoginPage,
      transition: Transition.noTransition,
      transitionDuration: const Duration(milliseconds: 350),
    ),
    GetPage(
      page: ()=> const CustomerServicePage(),
      name: customerServicePage,
      transition: Transition.noTransition,
      transitionDuration: const Duration(milliseconds: 350),
    ),

  ];
}