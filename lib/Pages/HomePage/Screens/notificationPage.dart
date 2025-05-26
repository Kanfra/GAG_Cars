import 'package:flutter/material.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/Appbar/customAppbarOne.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/Text/textMedium.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/Text/textSmall.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/customIcon.dart';
import 'package:gag_cars_frontend/GlobalVariables/colorGlobalVariables.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CustomAppbar(
        onLeadingIconClickFunction: (){}, 
        isLeadingWidgetExist: ColorGlobalVariables.trueValue,
        leadingIconData: Icons.arrow_back_ios, 
        appbarBackgroundColor: ColorGlobalVariables.whiteColor,
        titleText: 'Notifications',
        titleTextColor: ColorGlobalVariables.brownColor,
        centerTitle: ColorGlobalVariables.trueValue,
        ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20,),
        width: screenSize.width,
        height: screenSize.height,
        decoration: BoxDecoration(
          color: ColorGlobalVariables.whiteColor
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30,),
              // today text
              TextMedium(
                title: "Today", 
                fontWeight: FontWeight.bold, 
                textColor: ColorGlobalVariables.blackColor
                ),
              const SizedBox(height: 30,),
              // today list
              ListView.builder(
                itemCount: 1,
                shrinkWrap: true,
                primary: false,
                itemBuilder: (context, index){
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: ColorGlobalVariables.textFieldColor,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: ColorGlobalVariables.greyColor,
                          width: 0.1,
                        )
                      ),
                      child: Row(
                        children: [
                          // notification icon
                          CustomIcon(
                            iconData: Icons.notifications_outlined, 
                            isFaIcon: false,
                            iconSize: 40,
                            iconColor: ColorGlobalVariables.blackColor
                            ),
                          const SizedBox(width: 15,),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // header
                                TextMedium(
                                  title: "New Services Available", 
                                  fontWeight: FontWeight.bold, 
                                  textColor: ColorGlobalVariables.blackColor
                                  ),
                                const SizedBox(height: 15,),
                                // content
                                TextSmall(
                                  title: "Now you can sell and buy agricultural machinery on GAG cars", 
                                  textAlign: TextAlign.start,
                                  fontWeight: FontWeight.normal, 
                                  textColor: ColorGlobalVariables.blackColor
                                  ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }
                ),
              // yesterday text
              const SizedBox(height: 30,),
              // yesterday text
              TextMedium(
                title: "Yesterday", 
                fontWeight: FontWeight.bold, 
                textColor: ColorGlobalVariables.blackColor
                ),
              const SizedBox(height: 30,),
              // yesterday list
              ListView.builder(
                itemCount: 2,
                shrinkWrap: true,
                primary: false,
                itemBuilder: (context, index){
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: ColorGlobalVariables.textFieldColor,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: ColorGlobalVariables.greyColor,
                          width: 0.1,
                        )
                      ),
                      child: Row(
                        children: [
                          // notification icon
                          CustomIcon(
                            iconData: Icons.notifications_outlined, 
                            isFaIcon: false, 
                            iconSize: 40,
                            iconColor: ColorGlobalVariables.blackColor
                            ),
                          const SizedBox(width: 15,),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // header
                                TextMedium(
                                  title: "New Services Available", 
                                  fontWeight: FontWeight.bold, 
                                  textColor: ColorGlobalVariables.blackColor
                                  ),
                                const SizedBox(height: 15,),
                                // content
                                TextSmall(
                                  title: "Now you can sell and buy agricultural machinery on GAG cars", 
                                  textAlign: TextAlign.start,
                                  fontWeight: FontWeight.normal, 
                                  textColor: ColorGlobalVariables.blackColor
                                  ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }
                ),
              const SizedBox(height: 30,),
              // february 22, 2025
              TextMedium(
                title: "February 22, 2025", 
                fontWeight: FontWeight.bold, 
                textColor: ColorGlobalVariables.blackColor
                ),
              const SizedBox(height: 30,),
              // february 22, 2025 list
              ListView.builder(
                itemCount: 1,
                shrinkWrap: true,
                primary: false,
                itemBuilder: (context, index){
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: ColorGlobalVariables.textFieldColor,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: ColorGlobalVariables.greyColor,
                          width: 0.1,
                        )
                      ),
                      child: Row(
                        children: [
                          // notification icon
                          CustomIcon(
                            iconData: Icons.notifications_outlined, 
                            isFaIcon: false,
                            iconSize: 40, 
                            iconColor: ColorGlobalVariables.blackColor
                            ),
                          const SizedBox(width: 15,),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // header
                                TextMedium(
                                  title: "New Services Available", 
                                  fontWeight: FontWeight.bold, 
                                  textColor: ColorGlobalVariables.blackColor
                                  ),
                                const SizedBox(height: 15,),
                                // content
                                TextSmall(
                                  title: "Now you can sell and buy agricultural machinery on GAG cars", 
                                  textAlign: TextAlign.start,
                                  fontWeight: FontWeight.normal, 
                                  textColor: ColorGlobalVariables.blackColor
                                  ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }
                ),
              const SizedBox(height: 12,),
            ],
          ),
        ),
      ),
    );
  }
}