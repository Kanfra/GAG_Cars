import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gag_cars_frontend/GlobalVariables/colorGlobalVariables.dart';
import 'package:gag_cars_frontend/GlobalVariables/sizeGlobalVariables.dart';
import '../../../GeneralComponents/EdemComponents/Appbar/customAppbarOne.dart';


class SettingsOnePage extends StatefulWidget {
  const SettingsOnePage({super.key});

  @override
  State<SettingsOnePage> createState() => _SettingsOnePageState();
}

class _SettingsOnePageState extends State<SettingsOnePage> {
  bool isNotificationActive = false;
  bool isDarkModeActive = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: CustomAppbar(onLeadingIconClickFunction: (){},
              isLeadingWidgetExist: true,
              leadingIconData: Icons.arrow_back_ios_new_outlined,
              titleText: "Settings",
            centerTitle: true,
          ),
      body: Container(
        padding: const EdgeInsets.all(25),
        child:   Column(
          children: [
            Row(children: [
              const Icon(Icons.notifications_active_outlined,size: 35,),
              const SizedBox(width: SizeGlobalVariables.double_size_twenty,),
              const Text("Push Notifications",
                style: TextStyle(fontSize: SizeGlobalVariables.double_size_eighteen,fontWeight: FontWeight.w500),
              ),

           const Spacer(),

            AnimatedContainer(
          duration: const Duration(milliseconds: 200),
            height: SizeGlobalVariables.double_size_thirty,
            width: 45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: isNotificationActive ? Colors.green : Colors.grey,
            ),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isNotificationActive = !isNotificationActive;
                });
              },
              child: Align(
                alignment: isNotificationActive ? Alignment.centerRight : Alignment.centerLeft,
                child: Container(
                  width: 25,
                  height: 25,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
          )



    ],),
            const SizedBox(height: 10,),
            Row(children: [
              IconButton(
                icon: const FaIcon(FontAwesomeIcons.circleHalfStroke),
                onPressed: () {
                },
              ),
              const SizedBox(width: 20,),
              const Text("Dark Mode",
                style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),
              ),

              const Spacer(),

              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                height: 30,
                width: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: isDarkModeActive ? ColorGlobalVariables.blackColor : ColorGlobalVariables.greyColor,
                ),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isDarkModeActive = !isDarkModeActive;
                    });
                  },
                  child: Align(
                    alignment: isDarkModeActive ? Alignment.centerRight : Alignment.centerLeft,
                    child: Container(
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(
                        color: ColorGlobalVariables.whiteColor,
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),
              )



            ],),
            const SizedBox(height: 10,),
            Row(children: [
              IconButton(
                icon: const FaIcon(FontAwesomeIcons.language,size: 25,),
                onPressed: () {
                },
              ),
              const SizedBox(width: 20,),
              const Text("Push Notifications",
                style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),
              ),





            ],),
          ],
        ),
      ),
    ));
  }
}
