import 'package:flutter/material.dart';
import 'package:gag_cars_frontend/GeneralComponents/Appbar/customAppbarOne.dart';
import 'package:gag_cars_frontend/GeneralComponents/CardContainers/promotionsCard.dart';
import 'package:gag_cars_frontend/GlobalVariables/colorGlobalVariables.dart';

class PromotionsPage extends StatefulWidget {
  const PromotionsPage({super.key});

  @override
  State<PromotionsPage> createState() => _PromotionsPageState();
}

class _PromotionsPageState extends State<PromotionsPage> {
  List<Map<String, String>> promotions = [
  {
    "startText" : "7 days",
    "endText" : "GHS 50.00"
  },
    {
      "startText" : "14 days",
      "endText" : "GHS 90.00"
    },
    {
      "startText" : "30 days",
      "endText" : "GHS 200.00"
    }
  ];
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
        child: Scaffold(
          backgroundColor: ColorGlobalVariables.whiteColor,
          appBar: CustomAppbar(
            appbarBackgroundColor: ColorGlobalVariables.whiteColor,
            onLeadingIconClickFunction: (){},
              isLeadingWidgetExist: true,
              leadingIconData: Icons.arrow_back_ios_new_outlined,
              titleText: "Promotions",
               centerTitle: true,
              titleTextColor: ColorGlobalVariables.redColor,
          ),
          body: Padding(
            padding: const EdgeInsets.all(25),
            child: ListView.builder(
              itemCount: promotions.length,
                itemBuilder: (context, index){
                final promotion = promotions[index];

                return   PromotionCard(
                     startText: promotion["startText"]!,
                     endText: promotion["endText"]!
                 ) ;
            }
            )

          ),
        )
    );
  }
}
