import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:gag_cars_frontend/Pages/Authentication/Providers/userProvider.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Providers/getBlogPostsProvider.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Providers/getBrandItemsProvider.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Providers/getItemCategoriesProvider.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Providers/getItemCategoryProvider.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Providers/getNotificationsProvider.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Providers/getSimilarItemsProvider.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Providers/getUserDetailsProvider.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Providers/getUserListingsProvider.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Providers/getWishlistProvider.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Providers/homeProvider.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Providers/makeAndModelProvider.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Providers/searchProvider.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Providers/wishlistManager.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Providers/wishlistToggleProvider.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Services/BlogPostService/blogPostService.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Services/HomeService/homeService.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Services/ItemCategoryService/itemCategoryService.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Services/MakeAndModelService/makeAndModelService.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Services/VehicleService/cloudinaryService.dart';
import 'package:gag_cars_frontend/Pages/Messages/Providers/contactsProvider.dart';
import 'package:gag_cars_frontend/Pages/Messages/Providers/messagesProvider.dart';
import 'package:gag_cars_frontend/Pages/PaymentPage/Providers/packageProvider.dart';
import 'package:gag_cars_frontend/Pages/ProfilePages/Providers/countryProvider.dart';
import 'package:gag_cars_frontend/Pages/ProfilePages/Providers/faqProvider.dart';
import 'package:gag_cars_frontend/Pages/ProfilePages/Providers/themeProvider.dart';
import 'package:gag_cars_frontend/Pages/Splash/Screens/splash_page.dart';
import 'package:gag_cars_frontend/Themes/appThemes.dart';
import 'package:gag_cars_frontend/Utils/native_deep_linking_service.dart';
import 'package:get/get.dart';

import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';

// Import the new theme provider and themes
import 'GlobalVariables/colorGlobalVariables.dart';
import 'Routes/routeClass.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await CloudinaryService.init();
  
  // Initialize native deep linking
  await NativeDeepLinkService.initDeepLinking();
  
  // Set system UI overlay style before running app
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.black.withOpacity(0.77),
    statusBarBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.light,
  ));
  
  runApp(
    MultiProvider(
      providers: [
        // Add ThemeProvider first so it's available to all other providers
        ChangeNotifierProvider<ThemeProvider>(
          create: (context) => ThemeProvider(),
        ),
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
        ChangeNotifierProvider(
          create: (context) => WishlistManager(),
        ),
        ChangeNotifierProvider(
          create: (context) => PackageProvider(),
        ),     
        ChangeNotifierProvider(
          create: (context) => CountryProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => SimilarItemsProvider(),
        ), 
        ChangeNotifierProvider(
          create: (context) => BrandItemsProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => NotificationProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => SearchProvider()
        ),
        ChangeNotifierProvider(
          create: (context) => FaqProvider()
        ),
        ChangeNotifierProvider(
          create: (context) => UserDetailsProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ContactsProvider()
        ),
        ChangeNotifierProvider(
          create: (context) => MessagesProvider()
        ),
        ChangeNotifierProvider(
          create:(context) => UserListingsProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return GetMaterialApp(
          title: 'GAGcars',
          theme: AppThemes.lightTheme,
          darkTheme: AppThemes.darkTheme,
          themeMode: themeProvider.themeMode,
          debugShowCheckedModeBanner: ColorGlobalVariables.falseValue,
          
          // ✅ FIX 1: Use ONLY home (remove initialRoute)
          home: const SplashPage(),
          
          // ✅ FIX 2: Keep getPages but with safety wrapper
          getPages: RouteClass.routes,
          
          // ✅ FIX 3: Remove navigatorObservers (causing conflicts)
          // navigatorObservers: [],
          
          // ✅ FIX 4: Remove routingCallback (causing conflicts)
          // routingCallback: null,
          
          // ✅ FIX 5: Add proper unknown route with safety
          unknownRoute: GetPage(
            name: '/not-found',
            page: () => Scaffold(
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.error_outline, size: 64, color: Colors.grey),
                    SizedBox(height: 16),
                    Text(
                      'Page Not Found',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: () {
                        // Use Navigator instead of Get for safety
                        Navigator.of(Get.context!).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (context) => const SplashPage()),
                          (route) => false,
                        );
                      },
                      child: Text('Go to Home'),
                    ),
                  ],
                ),
              ),
            ),
          ),
          
          // ✅ FIX 6: Disable route restoration completely
          navigatorKey: NavigatorKey.key, // Fresh navigation key
        );
      },
    );
  }
}

// Create a fresh navigation key to prevent restoration conflicts
class NavigatorKey {
  static final GlobalKey<NavigatorState> key = GlobalKey<NavigatorState>();
}