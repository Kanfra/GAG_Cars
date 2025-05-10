
import 'package:gag_cars_frontend/Pages/Authentication/Screens/forgotPasswordPage.dart';
import 'package:gag_cars_frontend/Pages/Authentication/Screens/resetPasswordPage.dart';
import 'package:gag_cars_frontend/Pages/Authentication/Screens/verifyCodePage.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Screens/NewsBlog/newsBlogPage.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Screens/allMakesPage.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Screens/detailPage.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Screens/homePage.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Screens/mainNewsPage.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Screens/myListingsPage.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Screens/notificationPage.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Screens/searchPage.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Screens/sellCarPage.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Screens/sellCarTwoPage.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Screens/specialOffersPage.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Screens/wishlistPage.dart';
import 'package:gag_cars_frontend/Pages/Splash/Screens/splash_page.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
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
    static String splashPage = "/splash";
    static String verifyCodePage = "/verify-code";
    static String forgotPasswordPage = "/forgot-password";
    static String resetPassowrdPage = "/reset-password";

    static String homePage = "/home";
    static String detailPage = "/detail";
    static String newsBlogPage = "/news-blog";
    static String mainNewsPage = "/main-news";
    static String myListingsPage = "/my-listings";
    static String wishlistPage = "/wishlist";
    static String sellCarPage = "/sell-car";
    static String sellCarTwoPage = "/sell-car-two";
    static String allMakesPage = "/all-makes";
    static String specialOfferPage = "/special-offer";
    static String notificationsPage = "/notifications";
    static String searchPage = "/search";


    static String getSignUpWithEmailPage() => signUpWithEmailPage;
    static String getSignUpWithPhonePage() => signUpWithPhonePage;
    static String getSignInWithEmailPage() => signInWithEmailPage;
    static String getSignInWithPhonePage() => signInWithPhonePage;
    static String getSplashPage() => splashPage;
    static String getVerifyCodePage() => verifyCodePage;
    static String getForgotPasswordPage() => forgotPasswordPage;
    static String getResetPasswordPage() => resetPassowrdPage;

    static String getHomePage() => homePage;
    static String getDetailPage() => detailPage;
    static String getNewsBlogPage() => newsBlogPage;
    static String getMainNewsPage() => mainNewsPage;
    static String getMyListingsPage() => myListingsPage;
    static String getMyWishlistPage() => wishlistPage;
    static String getSellCarPage() => sellCarPage;
    static String getSellCarTwoPage() => sellCarTwoPage;
    static String getAllMakesPage() => allMakesPage;
    static String getSpecialOfferPage() => specialOfferPage;
    static String getNotificationsPage() => notificationsPage;
    static String getSearchPage() => searchPage;
 
  static List<GetPage> routes = [
    //Sign up 
    GetPage(
      page: ()=> const SignUpWithEmailPage(), 
      name: signUpWithEmailPage, 
      transition: Transition.noTransition, 
      transitionDuration: const Duration(milliseconds: 350),
      ),
      //Splash page 
        GetPage(
      page: ()=> const SplashPage(), 
      name: splashPage, 
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
    // GetPage(
    //   page: ()=> const WelcomePage(), 
    //   name: welcomePage, 
    //   transition: Transition.noTransition, 
    //   transitionDuration: const Duration(milliseconds: 350),
    //   ),
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

      GetPage(
      page: ()=> const HomePage(), 
      name: homePage, 
      transition: Transition.noTransition, 
      transitionDuration: const Duration(milliseconds: 350),
      ),
      GetPage(
      page: ()=> const DetailPage(), 
      name: detailPage, 
      transition: Transition.noTransition, 
      transitionDuration: const Duration(milliseconds: 350),
      ),
      GetPage(
      page: ()=> const NewsBlogPage(), 
      name: newsBlogPage, 
      transition: Transition.noTransition, 
      transitionDuration: const Duration(milliseconds: 350),
      ),
      // navigation with parameters
       GetPage(
      page: ()=> MainNewsPage(
        allJson: Get.arguments ?? {},
      ), 
      name: mainNewsPage, 
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
      page: ()=> const WishlistPage(), 
      name: wishlistPage, 
      transition: Transition.noTransition, 
      transitionDuration: const Duration(milliseconds: 350),
      ),
      GetPage(
      page: ()=> const SellCarPage(), 
      name: sellCarPage, 
      transition: Transition.noTransition, 
      transitionDuration: const Duration(milliseconds: 350),
      ),
      GetPage(
      page: ()=> const SellCarTwoPage(), 
      name: sellCarTwoPage, 
      transition: Transition.noTransition, 
      transitionDuration: const Duration(milliseconds: 350),
      ),
       GetPage(
      page: ()=> const AllMakesPage(), 
      name: allMakesPage, 
      transition: Transition.noTransition, 
      transitionDuration: const Duration(milliseconds: 350),
      ),
      GetPage(
      page: ()=> const SpecialOffersPage(), 
      name: specialOfferPage, 
      transition: Transition.noTransition, 
      transitionDuration: const Duration(milliseconds: 350),
      ),
       GetPage(
      page: ()=> const NotificationsPage(), 
      name: notificationsPage, 
      transition: Transition.noTransition, 
      transitionDuration: const Duration(milliseconds: 350),
      ),
      GetPage(
      page: ()=> const SearchPage(), 
      name: searchPage, 
      transition: Transition.noTransition, 
      transitionDuration: const Duration(milliseconds: 350),
      ),
  ];
}