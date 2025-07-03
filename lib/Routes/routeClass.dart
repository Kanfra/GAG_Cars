import 'package:gag_cars_frontend/Pages/Messages/Screens/messagesPage.dart';
import 'package:gag_cars_frontend/Pages/Messages/Screens/mockUpScreenPage.dart';
import 'package:get/get.dart';

import 'package:gag_cars_frontend/Pages/Authentication/Screens/forgotPasswordPage.dart';
import 'package:gag_cars_frontend/Pages/Authentication/Screens/resetPasswordPage.dart';
import 'package:gag_cars_frontend/Pages/Authentication/Screens/verifyCodePage.dart';
import 'package:gag_cars_frontend/Pages/Authentication/Screens/signInWithEmailPage.dart';
import 'package:gag_cars_frontend/Pages/Authentication/Screens/signInWithPhonePage.dart';
import 'package:gag_cars_frontend/Pages/Authentication/Screens/signUpWithEmailPage.dart';
import 'package:gag_cars_frontend/Pages/Authentication/Screens/signUpWithPhonePage.dart';

import 'package:gag_cars_frontend/Pages/HomePage/Screens/NewsBlog/newsBlogPage.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Screens/allMakesPage.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Screens/detailPage.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Screens/homePage.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Screens/mainNewsPage.dart';

import 'package:gag_cars_frontend/Pages/HomePage/Screens/notificationPage.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Screens/searchPage.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Screens/sellCarPage.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Screens/sellCarTwoPage.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Screens/specialOffersPage.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Screens/wishlistPage.dart';

import 'package:gag_cars_frontend/Pages/Profile%20Pages/Screens/customerServicePage.dart';
import 'package:gag_cars_frontend/Pages/Profile%20Pages/Screens/dealerLoginPage.dart';
import 'package:gag_cars_frontend/Pages/Profile%20Pages/Screens/getVerifiedPage.dart';
import 'package:gag_cars_frontend/Pages/Profile%20Pages/Screens/helpCenterPage.dart';
import 'package:gag_cars_frontend/Pages/Profile%20Pages/Screens/promotionsPage.dart';
import 'package:gag_cars_frontend/Pages/Profile%20Pages/Screens/securityOnePage.dart';
import 'package:gag_cars_frontend/Pages/Profile%20Pages/Screens/securityPage.dart';
import 'package:gag_cars_frontend/Pages/Profile%20Pages/Screens/settingsOnePage.dart';
import 'package:gag_cars_frontend/Pages/Profile%20Pages/Screens/myListingsPage.dart';
import 'package:gag_cars_frontend/Pages/Profile%20Pages/Screens/settingsPage.dart';

import 'package:gag_cars_frontend/Pages/Splash/Screens/splash_page.dart';

class RouteClass {
  // Route names
  static String signUpWithEmailPage = "/sign-up-with-email";
  static String signUpWithPhonePage = "/sign-up-with-phone";
  static String signInWithEmailPage = "/sign-in-with-email";
  static String signInWithPhonePage = "/sign-in-with-phone";
  static String splashPage = "/splash";
  static String verifyCodePage = "/verify-code";
  static String forgotPasswordPage = "/forgot-password";
  static String resetPasswordPage = "/reset-password";

  // Profile pages
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

  // Homepage
  static String homePage = "/home";
  static String detailPage = "/detail";
  static String newsBlogPage = "/news-blog";
  static String mainNewsPage = "/main-news";
  static String wishlistPage = "/wishlist";
  static String sellCarPage = "/sell-car";
  static String sellCarTwoPage = "/sell-car-two";
  static String allMakesPage = "/all-makes";
  static String specialOfferPage = "/special-offer";
  static String notificationsPage = "/notifications";
  static String searchPage = "/search";

  //message
  static String messagePage = "/messagePage";
  static String mockUpScreenPage = "/mockUpScreenPage";

  // Getters
  static String getSignUpWithEmailPage() => signUpWithEmailPage;
  static String getSignUpWithPhonePage() => signUpWithPhonePage;
  static String getSignInWithEmailPage() => signInWithEmailPage;
  static String getSignInWithPhonePage() => signInWithPhonePage;
  static String getSplashPage() => splashPage;
  static String getVerifyCodePage() => verifyCodePage;
  static String getForgotPasswordPage() => forgotPasswordPage;
  static String getResetPasswordPage() => resetPasswordPage;

  static String getSettingsPage() => settingsPage;
  static String getSettingsOnePage() => settingsOnePage;
  static String getSecurityPage() => securityPage;
  static String getSecurityOnePage() => securityOnePage;
  static String getPromotionsPage() => promotionsPage;
  static String getProfileUpdatePage() => profileUpdatePage;
  static String getMyListingsPage() => myListingsPage;
  static String getHelpCenterPage() => helpCenterPage;
  static String getGetVerifiedPage() => getVerifiedPage;
  static String getDealerLoginPage() => dealerLoginPage;
  static String getCustomerServicePage() => customerServicePage;

  static String getHomePage() => homePage;
  static String getDetailPage() => detailPage;
  static String getNewsBlogPage() => newsBlogPage;
  static String getMainNewsPage() => mainNewsPage;
  static String getWishlistPage() => wishlistPage;
  static String getSellCarPage() => sellCarPage;
  static String getSellCarTwoPage() => sellCarTwoPage;
  static String getAllMakesPage() => allMakesPage;
  static String getSpecialOfferPage() => specialOfferPage;
  static String getNotificationsPage() => notificationsPage;
  static String getSearchPage() => searchPage;

  static String getMessagesPage() => messagePage;
  static String getMockUpScreenPage() => mockUpScreenPage;

  // Routes
  static List<GetPage> routes = [
    GetPage(page: () => const SignUpWithEmailPage(), name: signUpWithEmailPage, transition: Transition.noTransition),
    GetPage(page: () => SignUpWithPhonePage(allJson: Get.arguments ?? {}), name: signUpWithPhonePage, transition: Transition.noTransition),
    GetPage(page: () => const SignInWithEmailPage(), name: signInWithEmailPage, transition: Transition.noTransition),
    GetPage(page: () => const SignInWithPhonePage(), name: signInWithPhonePage, transition: Transition.noTransition),
    GetPage(page: () => const SplashPage(), name: splashPage, transition: Transition.noTransition),
    GetPage(page: () => VerifyCodePage(allJson: Get.arguments ?? {}), name: verifyCodePage, transition: Transition.noTransition),
    GetPage(page: () => const ForgotPasswordPage(), name: forgotPasswordPage, transition: Transition.noTransition),
    GetPage(page: () => const ResetPasswordPage(), name: resetPasswordPage, transition: Transition.noTransition),

    // Profile
    GetPage(page: () => const SettingsPage(), name: settingsPage, transition: Transition.noTransition),
    GetPage(page: () => const SettingsOnePage(), name: settingsOnePage, transition: Transition.noTransition),
    GetPage(page: () => const SecurityPage(), name: securityPage, transition: Transition.noTransition),
    GetPage(page: () => const SecurityOnePage(), name: securityOnePage, transition: Transition.noTransition),
    GetPage(page: () => const PromotionsPage(), name: promotionsPage, transition: Transition.noTransition),
    GetPage(page: () => const MyListingPage(), name: myListingsPage, transition: Transition.noTransition),
    GetPage(page: () => const HelpCenterPage(), name: helpCenterPage, transition: Transition.noTransition),
    GetPage(page: () => const GetVerifiedPage(), name: getVerifiedPage, transition: Transition.noTransition),
    GetPage(page: () => const DealerLoginPage(), name: dealerLoginPage, transition: Transition.noTransition),
    GetPage(page: () => const CustomerServicePage(), name: customerServicePage, transition: Transition.noTransition),

    // Home & others
    GetPage(page: () => const HomePage(), name: homePage, transition: Transition.noTransition),
    GetPage(page: () => const DetailPage(), name: detailPage, transition: Transition.noTransition),
    GetPage(page: () => const NewsBlogPage(), name: newsBlogPage, transition: Transition.noTransition),
    GetPage(page: () => MainNewsPage(allJson: Get.arguments ?? {}), name: mainNewsPage, transition: Transition.noTransition),
    GetPage(page: () => const WishlistPage(), name: wishlistPage, transition: Transition.noTransition),
    GetPage(page: () => const SellCarPage(), name: sellCarPage, transition: Transition.noTransition),
    GetPage(page: () => const SellCarTwoPage(), name: sellCarTwoPage, transition: Transition.noTransition),
    GetPage(page: () => const AllMakesPage(), name: allMakesPage, transition: Transition.noTransition),
    GetPage(page: () => const SpecialOffersPage(), name: specialOfferPage, transition: Transition.noTransition),
    GetPage(page: () => const NotificationsPage(), name: notificationsPage, transition: Transition.noTransition),
    GetPage(page: () => const SearchPage(), name: searchPage, transition: Transition.noTransition),

    //message
    GetPage(page: () => const MessagesPage(), name: messagePage, transition: Transition.noTransition),
    GetPage(page: () => const MockUpScreenPage(), name: mockUpScreenPage, transition: Transition.noTransition),
  ];
}




