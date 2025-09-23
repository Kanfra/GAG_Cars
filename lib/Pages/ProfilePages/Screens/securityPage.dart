import 'package:flutter/material.dart';
import 'package:gag_cars_frontend/GeneralComponents/AtillahComponents/customListTile.dart';
import 'package:gag_cars_frontend/Routes/routeClass.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../GeneralComponents/EdemComponents/Appbar/customAppbarOne.dart';

class SecurityPage extends StatefulWidget {
  const SecurityPage({super.key});

  @override
  State<SecurityPage> createState() => _SecurityPageState();
}

class _SecurityPageState extends State<SecurityPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: CustomAppbar(
            onLeadingIconClickFunction: (){
              Get.back();
            },
            isLeadingWidgetExist: true,
            leadingIconData: Icons.arrow_back_ios_new_outlined,
            titleText: "Security",
          ),
          body:  CustomListTile(leadingIcon: Icons.lock_outline_sharp, title: "Change Password", isTrailingIconRequired: false,
      onTap: (){
        Get.toNamed(
          RouteClass.getChangePassword(),
        );
      }
      ),
        )
    );
  }
}
