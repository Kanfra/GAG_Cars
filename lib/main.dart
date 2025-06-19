import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Screens/sellCarPage.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Screens/sellCarTwoPage.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Screens/specialOffersPage.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Screens/wishlistPage.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Services/VehicleService/cloudinaryService.dart';
import 'package:gag_cars_frontend/Pages/Messages/Screens/mockUpScreenPage.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'GlobalVariables/colorGlobalVariables.dart';
import 'Pages/Authentication/Screens/signUpWithEmailPage.dart';
import 'Routes/routeClass.dart';

void main()async{
  await dotenv.load(fileName: ".env");
  await CloudinaryService.init();
  runApp(const MyApp());
  
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.black.withOpacity(0.77), // Change this to your desired color
    statusBarBrightness: Brightness.light, // For iOS (light for dark background)
    statusBarIconBrightness: Brightness.light, // For Android (light for dark background)
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      debugShowCheckedModeBanner: ColorGlobalVariables.falseValue,

      home: SignUpWithEmailPage(),
      // getPages: RouteClass.routes,
      //initialRoute: RouteClass.splashPage,
      // intialRoute: RouteClass.signUpWithEmailPage,
      //initialRoute: RouteClass.signUpWithPhonePage,
      // initialRoute: RouteClass.SignInWithEmailPage,
       //initialRoute: RouteClass.signInWithPhonePage,
      //initialRoute: RouteClass.verifyCodePage,
      //initialRoute: RouteClass.forgotPasswordPage,
      //initialRoute: RouteClass.resetPassowrdPage,
      //initialRoute: RouteClass.detailPage,
      //initialRoute: RouteClass.newsBlogPage,
      //initialRoute: RouteClass.myListingsPage,
      //initialRoute: RouteClass.wishlistPage,
      // initialRoute: RouteClass.sellCarPage,
      // initialRoute: RouteClass.mockUpScreenPage,
      //initialRoute: RouteClass.sellCarTwoPage,
      //initialRoute: RouteClass.allMakesPage,
      //initialRoute: RouteClass.specialOfferPage,
      //initialRoute: RouteClass.notificationsPage,
      //initialRoute: RouteClass.searchPage,

        //home: const SignUpWithPhonePage(),
        //home: const SignInWithPhonePage()
        //home: const VerifyCodePage()
        //home: const ForgotPasswordPage(),
       //home: const ResetPasswordPage()
      //home: const SplashPage(),
      //home: const DetailPage(),
      //home: const NewsBlogPage()
      //home: const MyListingsPage()
      //home: const WishlistPage()
      // home:  const MockUpScreenPage(),
      //home: SellCarTwoPage()
      //home: AllMakesPage()
      //home: SpecialOffersPage()
      //home: NotificationsPage()
      //home: SearchPage(),

    );
  }
}

