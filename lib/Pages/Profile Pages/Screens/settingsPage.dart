import 'package:flutter/material.dart';
import 'package:gag_cars_frontend/GeneralComponents/customRow.dart';
import 'package:gag_cars_frontend/GlobalVariables/colorGlobalVariables.dart';
import '../../../GeneralComponents/EdemComponents/Appbar/customAppbarOne.dart';


class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsState();
}

class _SettingsState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppbar(
          onLeadingIconClickFunction: (){},
          isLeadingWidgetExist: true,
          leadingIconData: Icons.arrow_back_ios_new_outlined,
          titleText: "",
          centerTitle: true,
           actions: [
             IconButton(onPressed: (){},
                 icon: const Icon( Icons.notifications_none_outlined,color: ColorGlobalVariables.blackColor,)
             )
           ],
      ),
      body: SafeArea(
    child: SingleChildScrollView(
    child: Padding(
        padding: const EdgeInsets.all(25.0),
      child: Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      Center(
        child: Column(
          children: [
            CircleAvatar(
              backgroundColor: ColorGlobalVariables.whiteColor,
              radius: 60,
              child: ClipOval(
                child: Image.asset(
                  "assets/images/gag_logo_red.png",
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Text("Gordon Auto Garage",
                style:
                TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
            const Text("joined: 1st January 2025",
                style: TextStyle(fontSize: 10)),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                backgroundColor: ColorGlobalVariables.blueColor,
                padding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Get Verified', style: TextStyle(color: ColorGlobalVariables.whiteColor)),
                  SizedBox(width: 16),
                  Icon(Icons.check, color: ColorGlobalVariables.whiteColor),
                ],
              ),
            ),
          ],
        ),
      ),
      const SizedBox(height: 50),
      const CustomRow(icon: Icons.perm_identity, text: "Profile"),
      const CustomRow(icon: Icons.list_alt_rounded, text: "My Listings"),
      const CustomRow(icon: Icons.shield_outlined, text: "Security"),
      const CustomRow(icon: Icons.logout_rounded, text: "Dealer Login"),
      const CustomRow(icon: Icons.help_outline, text: "Help"),
      const CustomRow(icon: Icons.settings_outlined, text: "Settings"),
      const SizedBox(height: 70),
      const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.logout_rounded, size: 50),
          SizedBox(width: 10),
          Text("Logout",
              style: TextStyle(
                  color: Colors.red,
                  fontSize: 25,
                  fontWeight: FontWeight.bold)),
        ],
      ),
    ],
      ),
    ),
    ),
    ),


    );
  }
}
