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
          
          // ✅ FIX 5: Enhanced unknown route with beautiful UI
          unknownRoute: GetPage(
            name: '/not-found',
            page: () => const _NotFoundScreen(),
          ),
          
          // ✅ FIX 6: Disable route restoration completely
          navigatorKey: NavigatorKey.key, // Fresh navigation key
        );
      },
    );
  }
}

// Beautiful Not Found Screen for Deep Linking Fallback
class _NotFoundScreen extends StatelessWidget {
  const _NotFoundScreen();

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final brownColor = ColorGlobalVariables.brownColor;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: isDark
                ? [
                    Colors.grey[900]!,
                    Colors.grey[850]!,
                    Colors.grey[800]!,
                  ]
                : [
                    brownColor.withOpacity(0.08),
                    brownColor.withOpacity(0.04),
                    Colors.white,
                  ],
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Animated Icon with Brown Color
              Container(
                width: 140,
                height: 140,
                decoration: BoxDecoration(
                  color: brownColor.withOpacity(0.1),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: brownColor.withOpacity(0.2),
                      blurRadius: 15,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Icon(
                  Icons.search_off_rounded,
                  size: 70,
                  color: brownColor,
                ),
              ),
              
              const SizedBox(height: 32),
              
              // Title with Brown Color
              Text(
                'Page Not Found',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: brownColor,
                ),
              ),
              
              const SizedBox(height: 16),
              
              // Description
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  'The page you\'re looking for doesn\'t exist or the link might be broken. '
                  'This could happen with deep links if the content is no longer available.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: isDark ? Colors.white70 : Colors.grey[700],
                    height: 1.5,
                  ),
                ),
              ),
              
              const SizedBox(height: 40),
              
              // Action Buttons with Brown Color
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  children: [
                    // Go Back Button
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          if (Navigator.of(context).canPop()) {
                            Navigator.of(context).pop();
                          } else {
                            _navigateToHome(context);
                          }
                        },
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          side: BorderSide(color: brownColor, width: 2),
                        ),
                        child: Text(
                          'Go Back',
                          style: TextStyle(
                            color: brownColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    
                    const SizedBox(width: 16),
                    
                    // Home Button with Brown Color
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => _navigateToHome(context),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: brownColor,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 4,
                          shadowColor: brownColor.withOpacity(0.4),
                        ),
                        child: const Text(
                          'Go to Home',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 32),
              
              // Additional Help Section
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 24),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: isDark ? Colors.grey[800] : brownColor.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: brownColor.withOpacity(0.2),
                  ),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.help_outline,
                      color: brownColor,
                      size: 24,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Need Assistance?',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: brownColor,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Our support team is here to help you with any issues.',
                            style: TextStyle(
                              fontSize: 14,
                              color: isDark ? Colors.white70 : Colors.grey[700],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 24),
              
              // Support Text with Brown Color
              TextButton(
                onPressed: () {
                  // TODO: Implement support contact
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Support contact will be implemented soon',
                        style: TextStyle(color: Colors.white),
                      ),
                      backgroundColor: brownColor,
                      behavior: SnackBarBehavior.floating,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  );
                },
                child: Text(
                  'Contact Support Team',
                  style: TextStyle(
                    color: brownColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToHome(BuildContext context) {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => const SplashPage()),
      (route) => false,
    );
  }
}

// Create a fresh navigation key to prevent restoration conflicts
class NavigatorKey {
  static final GlobalKey<NavigatorState> key = GlobalKey<NavigatorState>();
}