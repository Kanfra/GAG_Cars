import 'dart:async';
import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gag_cars_frontend/shared/buttons/custom_button.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pinput/pinput.dart';

class VerifyCodePage extends StatefulWidget {
  const VerifyCodePage({super.key});

  @override
  State<VerifyCodePage> createState() => _VerifyCodePageState();
}

class _VerifyCodePageState extends State<VerifyCodePage> {
  late final TextEditingController pinController;
  late final FocusNode focusNode;
  late final GlobalKey<FormState> formKey;
 late Timer _timer;
  int _remainingSeconds = 48;
  
  get buttonName => null;
  @override
  void initState() {
    super.initState();
    if (kIsWeb) {
      BrowserContextMenu.disableContextMenu();
    }
    formKey = GlobalKey<FormState>();
    pinController = TextEditingController();
    focusNode = FocusNode();
        _startCountdown();
  }
  void _startCountdown() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingSeconds == 0) {
        timer.cancel();
      } else {
        setState(() {
          _remainingSeconds--;
        });
      }
    });
  }

  @override
  void dispose() {
    if (kIsWeb) {
      BrowserContextMenu.enableContextMenu();
    }
    pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final basePinDecoration = BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        const BoxShadow(
          color: Color.fromRGBO(12, 26, 75, 0.24),
          blurRadius: 1,
          offset: Offset(0, 0),
        ),
        BoxShadow(
          color: Colors.black.withOpacity(0.25),
          blurRadius: 4,
          offset: const Offset(0, 4),
        ),
      ],
    );

    final pinTheme = PinTheme(
      width: 71,
      height: 66,
      textStyle: const TextStyle(
        fontSize: 20,
        color: Colors.black,
        fontWeight: FontWeight.w600,
      ),
      decoration: basePinDecoration,
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        
        children: [
          Center(
            child: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                          
                    Text('Verify Code',style: TextStyle(fontSize:32, fontWeight: FontWeight.w500 ),),
                    SizedBox(height: 50,),
                    Pinput(
                      controller: pinController,
                      focusNode: focusNode,
                      length: 4,
                      defaultPinTheme: pinTheme,
                      separatorBuilder: (index) => const SizedBox(width: 10),
                      focusedPinTheme: pinTheme.copyDecorationWith(
                        border: Border.all(color: const Color(0xFF2A2F5F)),
                      ),
                      submittedPinTheme: pinTheme.copyWith(
                        decoration: basePinDecoration.copyWith(
                          border: Border.all(color: const Color(0xFF2A2F5F)),
                        ),
                      ),
                      errorPinTheme: pinTheme.copyBorderWith(
                        border: Border.all(color: Colors.redAccent),
                      ),
                      validator: (value) {
                        return value == '2222' ? null : 'Incorrect Code';
                      },
                      hapticFeedbackType: HapticFeedbackType.lightImpact,
                      onCompleted: (pin) {
                        debugPrint('Completed: $pin');
                      },
                      onChanged: (value) {
                        debugPrint('Changed: $value');
                      },
                    ),
                    const SizedBox(height: 20),
                    // TextButton(
                    //   onPressed: () {
                    //     focusNode.unfocus();
                    //     formKey.currentState?.validate();
                    //   },
                    //   child: const Text('Validate'),
                    // ),
                  
                     RichText(
                          text: TextSpan(
                            text: 'Time Remaining :',
                            style: TextStyle(color: Colors.black87, fontSize: 16),
                            children: <TextSpan>[
                              TextSpan(
                                text: '$_remainingSeconds  seconds ',
                                style: TextStyle(
                                  color: Color.fromRGBO(159, 16, 16, 1),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                
                
                        SizedBox(height: 60,),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: CustomButton(buttonName: 'Verify Code', onPressed: (){
                                      
                                     },),
                            )
                  ],
                ),
              ),
            ),
          ),
       Positioned(
        top: 78,
        left: 30,
        child: GestureDetector(
          onTap: (){
          Get.back();
          },
          child: Icon(Icons.arrow_back_ios,size: 30,color: Colors.black,)))
       ,

   
        ],
      ),
    );
  
  
  
  }
}
