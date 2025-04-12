import 'package:flutter/material.dart';
import 'package:gag_cars_frontend/Routes/routeClass.dart';
import 'package:gag_cars_frontend/shared/inputs/app_icons.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    // Wait 3 seconds and navigate
    Future.delayed(const Duration(seconds: 3), () {
  Get.offNamed(RouteClass.signUpWithEmailPage);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(159, 16, 16, 1),
      body: Stack(
        children: [
          // Centered content
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(AppIcons.splashIcon, width: 329),
                const SizedBox(height: 20),
                const Text(
                  'Your trusted car marketplace',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),

          // Bottom text
          const Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 70.0),
              child: Text(
                'Proudly Powered by IStyle Technologies',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
