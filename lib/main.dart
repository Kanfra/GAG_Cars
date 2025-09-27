import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:gag_cars_frontend/Pages/Authentication/Providers/userProvider.dart';
import 'package:gag_cars_frontend/Pages/Authentication/Screens/forgotPasswordPage.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Providers/getBlogPostsProvider.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Providers/getItemCategoriesProvider.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Providers/getItemCategoryProvider.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Providers/getWishlistProvider.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Providers/homeProvider.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Providers/makeAndModelProvider.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Providers/wishlistManager.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Providers/wishlistToggleProvider.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Screens/mainBottomNavigationPage.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Screens/postItemPage.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Screens/sellCarPage.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Screens/sellCarTwoPage.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Screens/specialOffersPage.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Screens/wishlistPage.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Services/BlogPostService/blogPostService.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Services/HomeService/homeService.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Services/ItemCategoryService/itemCategoryService.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Services/MakeAndModelService/makeAndModelService.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Services/VehicleService/cloudinaryService.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Services/WishlistService/wishlistService.dart';
import 'package:gag_cars_frontend/Pages/Messages/Screens/mockUpScreenPage.dart';
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
        ChangeNotifierProvider<MakeAndModelProvider>(
          create: (context) => MakeAndModelProvider(MakeAndModelService()),
        ),
        ChangeNotifierProvider<ItemCategoriesProvider>(
          create: (context) => ItemCategoriesProvider(
            ItemCategoryService()
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => UserProvider()
          ),
         ChangeNotifierProvider(
          create: (context) => WishlistToggleProvider(),
          ),
         ChangeNotifierProvider(
          create: (context) => WishlistFetchProvider()
          ),
         ChangeNotifierProvider(create: (context) => CategoryDetailProvider()),
          ChangeNotifierProvider<BlogPostProvider>(
          create: (context) => BlogPostProvider(BlogPostService()),
        ), 
        ChangeNotifierProvider( // ADD THIS NEW PROVIDER
          create: (context) => WishlistManager(),
        ),           
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
      home: SplashPage(),
      // home: ListingDetailPage(),
      // home: PostItemPage(),
      // home: MainBottomNavigationPage(),
      getPages: RouteClass.routes,
    );
  }
}
