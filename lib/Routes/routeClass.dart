
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

import '../Pages/Authentication/Screens/signUpPage.dart';
// import 'package:golfex_app_develop/Pages/Authentication/GetStarted/getStartedPage.dart';
// import 'package:golfex_app_develop/Pages/Authentication/createAccountPage.dart';
// import 'package:golfex_app_develop/Pages/Authentication/ForgotPassword/emailSentPage.dart';
// import 'package:golfex_app_develop/Pages/Authentication/ForgotPassword/forgotPasswordPage.dart';
// import 'package:golfex_app_develop/Pages/Authentication/loginPage.dart';
// import 'package:golfex_app_develop/Pages/Authentication/welcomePage.dart';
// import 'package:golfex_app_develop/Pages/SectionTwo/GolfClubCoursePages/golfClubCoursePage.dart';
// import 'package:golfex_app_develop/Pages/SectionTwo/clubWriteReviewsPage.dart';
// import 'package:golfex_app_develop/Pages/SectionTwo/golfClubCourseReviewsPage.dart';
// import 'package:golfex_app_develop/Pages/SectionTwo/golfClubsListPage.dart';
// import 'package:golfex_app_develop/Pages/SectionTwo/golfClubsPage.dart';
// import 'package:golfex_app_develop/Pages/SectionTwo/homeHCPCertificatePage.dart';
// import 'package:golfex_app_develop/Pages/SectionTwo/homeHCPTimelinePage.dart';
// import 'package:golfex_app_develop/Pages/SectionTwo/notificationsPage.dart';
// import 'package:golfex_app_develop/Pages/SectionTwo/BottomNavigationPages/sectionTwoBottomNavigationPage.dart.dart';
// import 'package:golfex_app_develop/Pages/SectionTwo/selectedGolfClubPage.dart';
// import 'package:golfex_app_develop/Pages/SectionTwo/selectedGolfClubProShopSelectedItemPage.dart';
// import 'package:golfex_app_develop/Pages/SectionTwo/selectedGolfClubRestaurantCartPage.dart';
// import 'package:golfex_app_develop/Pages/SectionTwo/selectedGolfClubRestaurantSelectedItemPage.dart';
// import 'package:golfex_app_develop/Pages/SectionTwo/wallPage.dart';

class RouteClass{

    static String signUpPage = "/sign-up";
  // static String welcomePage = "/welcomePage";
  // static String loginPage = "/loginPage";
  // static String forgotPasswordPage = "/forgotPasswordPage";
  // static String createAccountPage = "/createAccountPage";
  // static String getStartedPage = "/getStartedPage";
  // static String emailSentPage = "/emailSentPage";
  // static String sectionTwoBottomNavigationPage = "/sectionTwoBottomNavigationPage";
  // static String homeHCPTimelinePage = "/homeHCPTimelinePage";
  // static String homeHCPCertificatePage = "/homeHCPCertificatePage";
  // static String notificationsPage = "/notificationsPage";
  // static String wallPage = "/wallPage";
  // static String clubWriteReviewsPage = "/clubWriteReviewsPage";
  // static String golfClubCourseReviewsPage = "/golfClubCourseReviewsPage";
  // static String golfClubCoursePage = "/golfClubCoursePage";
  // static String golfClubsPage = "/golfClubsPage";
  // static String golfClubsListPage = "/golfClubsListPage";
  // static String selectedGolfClubRestaurantSelectedItemPage = "/selectedGolfClubRestaurantSelectedItemPage";
  // static String selectedGolfClubProShopSelectedItemPage = "/selectedGolfClubProShopSelectedItemPage";
  // static String selectedGolfClubRestaurantCartPage = "/selectedGolfClubRestaurantCartPage";
  // static String selectedGolfClubPage = "/selectedGolfClubPage";

    static String getSignUpPage() => signUpPage;
  // static String getWelcomePage() => welcomePage;
  // static String getLoginPage() => loginPage;
  // static String getForgotPasswordPage() => forgotPasswordPage;
  // static String getCreateAccountPage() => createAccountPage;
  // static String getGetStartedPage() => getStartedPage;
  // static String getEmailSentPage() => emailSentPage;
  // static String getSectionTwoBottomNavigationPage() => sectionTwoBottomNavigationPage;
  // static String getHomeHCPTimelinePage() => homeHCPTimelinePage;
  // static String getHomeHCPCertificatePage() => homeHCPCertificatePage;
  // static String getNotificationsPage() => notificationsPage;
  // static String getWallPage() => wallPage;
  // static String getClubWriteReviewsPage() => clubWriteReviewsPage;
  // static String getGolfClubCourseReviewsPage() => golfClubCourseReviewsPage;
  // static String getGolfClubCoursePage() => golfClubCoursePage;
  // static String getGolfClubsPage() => golfClubsPage;
  // static String getGolfClubsListPage() => golfClubsListPage;
  // static String getSelectedGolfClubRestaurantSelectedItemPage() => selectedGolfClubRestaurantSelectedItemPage;
  // static String getSelectedGolfClubProShopPage() => selectedGolfClubProShopSelectedItemPage;
  // static String getSelectedGolfClubRestaurantCartPage() => selectedGolfClubRestaurantCartPage;
  // static String getSelectedGolfClubPage() => selectedGolfClubPage;

  static List<GetPage> routes = [
    GetPage(
      page: ()=> const SignUpPage(), 
      name: signUpPage, 
      transition: Transition.noTransition, 
      transitionDuration: const Duration(milliseconds: 350),
      ),
    // GetPage(page: ()=>const WelcomePage(), name: welcomePage, transition: Transition.noTransition, transitionDuration: const Duration(milliseconds: 350),),
    // GetPage(page: ()=>const LoginPage(), name: loginPage, transition: Transition.noTransition, transitionDuration: const Duration(milliseconds: 350),),
    // GetPage(page: ()=>const ForgotPasswordPage(), name: forgotPasswordPage, transition: Transition.noTransition, transitionDuration: const Duration(milliseconds: 350),),
    // GetPage(page: ()=>const CreateAccountPage(), name: createAccountPage, transition: Transition.noTransition, transitionDuration: const Duration(milliseconds: 350),),
    // GetPage(page: ()=>const GetStartedPage(), name: getStartedPage, transition: Transition.noTransition, transitionDuration: const Duration(milliseconds: 350),),
    // GetPage(page: ()=>const EmailSentPage(), name: emailSentPage, transition: Transition.noTransition, transitionDuration: const Duration(milliseconds: 350),),
    // GetPage(page: ()=>const SectionTwoBottomNavigationPage(), name: sectionTwoBottomNavigationPage, transition: Transition.noTransition, transitionDuration: const Duration(milliseconds: 350),),
    // GetPage(page: ()=>const HomeHCPTimelinePage(), name: homeHCPTimelinePage, transition: Transition.noTransition, transitionDuration: const Duration(milliseconds: 350),),
    // GetPage(page: ()=>const HomeHCPCertificatePage(), name: homeHCPCertificatePage, transition: Transition.noTransition, transitionDuration: const Duration(milliseconds: 350),),
    // GetPage(page: ()=>const NotificationsPage(), name: notificationsPage, transition: Transition.noTransition, transitionDuration: const Duration(milliseconds: 350),),
    // GetPage(page: ()=>const WallPage(), name: wallPage, transition: Transition.noTransition, transitionDuration: const Duration(milliseconds: 350),),
    // GetPage(page: ()=>const ClubWriteReviewsPage(), name: clubWriteReviewsPage, transition: Transition.noTransition, transitionDuration: const Duration(milliseconds: 350),),
    // GetPage(page: ()=>const GolfClubCourseReviewsPage(), name: golfClubCourseReviewsPage, transition: Transition.noTransition, transitionDuration: const Duration(milliseconds: 350),),
    // GetPage(page: ()=>const GolfClubCoursePage(), name: golfClubCoursePage, transition: Transition.noTransition, transitionDuration: const Duration(milliseconds: 350),),
    // GetPage(page: ()=>const GolfClubsPage(), name: golfClubsPage, transition: Transition.noTransition, transitionDuration: const Duration(milliseconds: 350),),
    // GetPage(page: ()=>const GolfClubsListPage(), name: golfClubsListPage, transition: Transition.noTransition, transitionDuration: const Duration(milliseconds: 350),),
    // GetPage(page: ()=>const SelectedGolfClubRestaurantSelectedItemPage(), name: selectedGolfClubRestaurantSelectedItemPage, transition: Transition.noTransition, transitionDuration: const Duration(milliseconds: 350),),
    // GetPage(page: ()=>const SelectedGolfClubProShopSelectedItemPage(), name: selectedGolfClubProShopSelectedItemPage, transition: Transition.noTransition, transitionDuration: const Duration(milliseconds: 350),),
    // GetPage(page: ()=>const SelectedGolfClubRestaurantCartPage(), name: selectedGolfClubRestaurantCartPage, transition: Transition.noTransition, transitionDuration: const Duration(milliseconds: 350),),
    // GetPage(page: ()=>const SelectedGolfClubPage(), name: selectedGolfClubPage, transition: Transition.noTransition, transitionDuration: const Duration(milliseconds: 350),),
  ];
}