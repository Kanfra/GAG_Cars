import 'package:flutter/material.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/Appbar/customAppbarOne.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/Text/textLarge.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/Text/textMedium.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/Text/textSmall.dart';
import 'package:gag_cars_frontend/GlobalVariables/colorGlobalVariables.dart';

class SellCarTwoPage extends StatefulWidget {
  const SellCarTwoPage({super.key});

  @override
  State<SellCarTwoPage> createState() => _SellCarTwoPageState();
}

class _SellCarTwoPageState extends State<SellCarTwoPage> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CustomAppbar(
        onLeadingIconClickFunction: (){}, 
        isLeadingWidgetExist: ColorGlobalVariables.trueValue,
        leadingIconData: Icons.arrow_back_ios, 
        appbarBackgroundColor: ColorGlobalVariables.whiteColor,
        titleText: 'Packages',
        titleTextColor: ColorGlobalVariables.brownColor,
        centerTitle: ColorGlobalVariables.trueValue,
        ),
      body: SafeArea(
        child: Container(
          width: screenSize.width,
          height: screenSize.height,
          decoration: BoxDecoration(
            color: ColorGlobalVariables.whiteColor
          ),
          child: ListView.builder(
            itemCount: packages.length,
            shrinkWrap: true,
            primary: false,
            itemBuilder: (context, index){
              final package = packages[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                child: Card(
                  shadowColor: Colors.grey,
                  elevation: 1,
                  color: ColorGlobalVariables.whiteColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // column for package name and number of uploads
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // package name
                            TextLarge(
                              title: package['packageName'], 
                              fontWeight: FontWeight.bold, 
                              textColor: ColorGlobalVariables.blackColor
                              ),
                            // number of uploads
                            TextSmall(
                              title: "${package['noOfUpload'].toString()} uploads", 
                              fontWeight: FontWeight.normal, 
                              textColor: ColorGlobalVariables.blackColor
                              ),
                          ],
                          ),
                        // price
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 5,
                            vertical: 5 
                            ),
                          decoration: BoxDecoration(
                            color: ColorGlobalVariables.greenColor,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: TextMedium(
                            title: "GHS ${package['price'].toString()}", 
                            fontWeight: FontWeight.bold, 
                            textColor: ColorGlobalVariables.whiteColor
                            ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }
            ),
        ),
      ),
    );
  }

  // package jsonList
  List<Map<String, dynamic>> packages = [
    {
      "packageName": "Silver",
      "noOfUpload": 3,
      "price": 40.00
    },
     {
      "packageName": "Gold",
      "noOfUpload": 10,
      "price": 150.00
    },
     {
      "packageName": "Diamond",
      "noOfUpload": 30,
      "price": 500.00
    },
  ];
}