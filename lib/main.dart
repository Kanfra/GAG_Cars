import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:gag_cars_frontend/Pages/Authentication/Screens/forgotPasswordPage.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Providers/homeProvider.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Providers/vehicleProvider.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Screens/mainBottomNavigationPage.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Screens/sellCarPage.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Screens/sellCarTwoPage.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Screens/specialOffersPage.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Screens/wishlistPage.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Services/HomeService/brandModelService.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Services/HomeService/homeService.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Services/HomeService/makeService.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Services/VehicleService/cloudinaryService.dart';
import 'package:gag_cars_frontend/Pages/Messages/Screens/mockUpScreenPage.dart';
import 'package:gag_cars_frontend/Pages/Profile%20Pages/Screens/changePasswordPage.dart';
import 'package:gag_cars_frontend/Pages/Splash/Screens/splash_page.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';
import 'GlobalVariables/colorGlobalVariables.dart';
import 'Pages/Authentication/Screens/signUpWithEmailPage.dart';
import 'Pages/HomePage/Screens/mainBottomNavigationPage.dart';
import 'Routes/routeClass.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  await CloudinaryService.init();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeProvider>(
          create: (context) => HomeProvider(HomeService()),
        ),
        ChangeNotifierProvider(create: (_) => VehicleProvider(
          MakeService(),
          BrandModelService(),
        )),
      ],
      child: const MyApp(),
    ),
  );
  
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.black.withOpacity(0.77),
    statusBarBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.light,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      debugShowCheckedModeBanner: ColorGlobalVariables.falseValue,
      home: MainBottomNavigationPage(),
      getPages: RouteClass.routes,
    );
  }
}