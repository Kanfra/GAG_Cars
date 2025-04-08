import 'package:flutter/material.dart';

import '../../../GeneralComponents/Buttons/customTextButton.dart';
import '../../../GeneralComponents/Text/textMedium.dart';
import '../../../GlobalVariables/colorGlobalVariables.dart';


class SignUpWithEmailPage extends StatefulWidget {
  const SignUpWithEmailPage({super.key});

  @override
  State<SignUpWithEmailPage> createState() => _SignUpWithEmailPageState();
}

class _SignUpWithEmailPageState extends State<SignUpWithEmailPage> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
            child: SizedBox(
                width: screenSize.width,
                height: screenSize.height,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                        TextMedium(
                            title: "Hello World", 
                            fontWeight: FontWeight.bold, 
                            textColor: ColorGlobalVariables.blackColor,
                            ),
                        const SizedBox(height: 10,),
                        CustomTextButton(
                          buttonBackgroundColor: Colors.green, 
                          buttonTextType: 'Submit', 
                          isFullButtonWidthRequired: true, 
                          onClickFunction: () {  }, 
                          textTypeColor: Colors.white,
                          containerMarginHorizontal: 10,
                          )
                    ],
                    ),
            ), 
            ),
    );
  }
}