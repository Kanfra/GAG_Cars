import 'package:flutter/material.dart';
import 'package:gag_cars_frontend/GeneralComponents/AtillahComponents/customListTile.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/Text/textExtraSmall.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/Text/textSmall.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/customImage.dart';
import 'package:gag_cars_frontend/GlobalVariables/colorGlobalVariables.dart';
import 'package:gag_cars_frontend/Pages/Authentication/Models/user_model.dart';
import 'package:gag_cars_frontend/Pages/Authentication/Providers/userProvider.dart';
import 'package:gag_cars_frontend/Routes/routeClass.dart';
import 'package:gag_cars_frontend/Utils/ApiUtils/apiUtils.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';
import '../../../GeneralComponents/EdemComponents/Appbar/customAppbarOne.dart';


class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsState();
}

class _SettingsState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final UserModel? user = userProvider.user;
    // format the joined date
    String joinedDate = "Not available";
    if(user?.createdAt != null){
      joinedDate = "Joined: ${user!.createdAt!.toLocal().toString().split(' ')[0]}";
    }
    return  Scaffold(
      appBar: CustomAppbar(
          onLeadingIconClickFunction: (){
            Get.back();
          },
          isLeadingWidgetExist: true,
          leadingIconData: Icons.arrow_back_ios_new_outlined,
          titleText: "",
          centerTitle: true,
           actions: [
             IconButton(onPressed: (){
              Get.toNamed(RouteClass.notificationsPage);
             },
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
            // profile image
            CustomImage(
              imagePath: getImageUrl("${user?.profileImage}", "assets/images/gordon_image_temporary.png"), 
              isAssetImage: user?.profileImage == null ? true : false, 
              imageHeight: 115,
              imageWidth: 115,
              imageBorderRadius: 80,
              isImageBorderRadiusRequired: true,
              ),
            const SizedBox(height: 10),
            // profile name
            TextSmall(
              title: user?.name ?? "Guest User", 
              fontWeight: FontWeight.w500, 
              overflow: TextOverflow.ellipsis,
              textColor: ColorGlobalVariables.blackColor,
              ),
            const SizedBox(height: 2,),
            // date
            TextExtraSmall(
              title: joinedDate, 
              textColor: ColorGlobalVariables.blackColor
              ),
            const SizedBox(height: 8,),
            // get verified button
            if(user != null && !userProvider.isPaidSeller)
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
      CustomListTile(leadingIcon: Icons.perm_identity, title: "Profile", isTrailingIconRequired: true,
      onTap: (){
        Get.toNamed(
          RouteClass.getProfileUpdatePage(),
        );
      }
      ),
      CustomListTile(leadingIcon: Icons.list_alt_rounded, title: "My Listings", isTrailingIconRequired: true,
      onTap: (){
        Get.toNamed(
          RouteClass.getMyListingPage(),
        );
      },
      ),
      CustomListTile(leadingIcon: Icons.shield_outlined, title: "Security", isTrailingIconRequired: true,
      onTap: (){
        Get.toNamed(
          RouteClass.getSecurityPage(),
        );
      },
      ),
      CustomListTile(leadingIcon: Icons.logout_rounded, title: "Dealer Login", isTrailingIconRequired: true,
      onTap: (){
        Get.toNamed(
          RouteClass.getDealerLoginPage(),
        );
      },
      ),
      CustomListTile(leadingIcon: Icons.help_outline, title: "Help", isTrailingIconRequired: true,
      onTap: (){
        Get.toNamed(
          RouteClass.getHelpCenterPage(),
        );
      },
      ),
      CustomListTile(leadingIcon: Icons.settings_outlined, title: "Settings", isTrailingIconRequired: true,
      onTap: (){
        Get.toNamed(
          RouteClass.getSettingsOnePage(),
        );
      },
      ),
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
