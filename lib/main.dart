import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gag_cars_frontend/Pages/Messages/Screens/mockUpScreenPage.dart';
import 'package:gag_cars_frontend/Pages/Profile%20Pages/Screens/customerServicePage.dart';
import 'package:gag_cars_frontend/Pages/Profile%20Pages/Screens/dealerLoginPage.dart';
import 'package:gag_cars_frontend/Pages/Profile%20Pages/Screens/faq.dart';
import 'package:gag_cars_frontend/Pages/Profile%20Pages/Screens/getVerifiedPage.dart';
import 'package:gag_cars_frontend/Pages/Profile%20Pages/Screens/listingsDetail.dart';
import 'package:gag_cars_frontend/Pages/Profile%20Pages/Screens/profileUpdatePage.dart';
import 'package:gag_cars_frontend/Pages/Profile%20Pages/Screens/promotionsPage.dart';
import 'package:gag_cars_frontend/Pages/Profile%20Pages/Screens/settingsPage.dart';
import 'package:gag_cars_frontend/Pages/Profile%20Pages/Screens/settingsOnePage.dart';
import 'package:gag_cars_frontend/Pages/Profile%20Pages/Screens/securityOnePage.dart';
import 'package:gag_cars_frontend/Pages/Profile%20Pages/Screens/securityPage.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'GlobalVariables/colorGlobalVariables.dart';
import 'Pages/Authentication/Screens/forgotPasswordPage.dart';
import 'Pages/Authentication/Screens/signUpWithEmailPage.dart';
import 'Pages/Messages/Screens/messagesPage.dart';
import 'Pages/Profile Pages/Screens/helpCenterPage.dart';
import 'Pages/Profile Pages/Screens/myListingsPage.dart';
import 'Routes/routeClass.dart';

void main() {
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
      // initialRoute: RouteClass.getVerifyCodePage(),
      // getPages: RouteClass.routes,
      home: const MockUpScreenPage()
    );
  }
}

