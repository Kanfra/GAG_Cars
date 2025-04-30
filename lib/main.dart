import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gag_cars_frontend/Pages/Profile%20Pages/Screens/customerServicePage.dart';
import 'package:gag_cars_frontend/Pages/Profile%20Pages/Screens/profileUpdatePage.dart';
import 'package:gag_cars_frontend/Pages/Profile%20Pages/Screens/settings.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'GlobalVariables/colorGlobalVariables.dart';
import 'Pages/Authentication/Screens/forgotPasswordPage.dart';
import 'Pages/Authentication/Screens/signUpWithEmailPage.dart';
import 'Pages/Profile Pages/Screens/helpCenterPage.dart';
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
      home:  CustomerServicePage() ,
    );
  }
}

