import 'package:flutter/material.dart';
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
          appBar: CustomAppbar(onLeadingIconClickFunction: (){},
              isLeadingWidgetExist: true,
              leadingIconData: Icons.arrow_back_ios_new_outlined,
              titleText: "Security",
          ),
          body:  Padding(
            padding: const EdgeInsets.only(left: 25, right: 25,top: 20),
            child: GestureDetector(
              child: const Row(
                children: [
                  Icon(Icons.lock_outline_sharp,),
                  SizedBox(width: 20,),
                  Text("Change Password",style: TextStyle(fontSize: 18),)
                ],
              ),
            ),
          ),
        )
    );
  }
}
