import 'package:flutter/material.dart';
import 'package:gag_cars_frontend/GeneralComponents/Appbar/customAppbarOne.dart';

class MockUpScreenPage extends StatefulWidget {
  const MockUpScreenPage({super.key});

  @override
  State<MockUpScreenPage> createState() => _MockUpScreenPageState();
}

class _MockUpScreenPageState extends State<MockUpScreenPage> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
        child: Scaffold(
          appBar: CustomAppbar(
              onLeadingIconClickFunction: (){},
              isLeadingWidgetExist: true,
              leadingIconData: Icons.arrow_back_ios_new_outlined,
              titleText: "name",
            centerTitle: true,
            actions: [
              IconButton(
                  onPressed: (){},
                  icon: const Icon(Icons.phone)
              )
            ],
          ),
        )
    );
  }
}















