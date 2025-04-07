import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'GlobalVariables/colorGlobalVariables.dart';
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
      initialRoute: RouteClass.getWelcomePage(),
      getPages: RouteClass.routes,
      //home: const SignUpPage(),
    );
  }
}

