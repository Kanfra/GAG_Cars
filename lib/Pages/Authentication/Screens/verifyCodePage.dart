import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/Text/textExtraSmall.dart';
import 'package:gag_cars_frontend/GeneralComponents/KwekuComponents/buttons/custom_button.dart';
import 'package:gag_cars_frontend/GlobalVariables/colorGlobalVariables.dart';
import 'package:gag_cars_frontend/Pages/Authentication/Providers/userProvider.dart';
import 'package:gag_cars_frontend/Pages/Authentication/Services/authService.dart';
import 'package:gag_cars_frontend/Routes/routeClass.dart';
import 'package:gag_cars_frontend/Utils/WidgetUtils/widgetUtils.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

class VerifyCodePage extends StatefulWidget {
  final Map<String, dynamic> allJson;
  const VerifyCodePage({
    super.key,
    required this.allJson,
    });

  @override
  State<VerifyCodePage> createState() => _VerifyCodePageState();
}

class _VerifyCodePageState extends State<VerifyCodePage> {
  late final TextEditingController pinController;
  late final FocusNode focusNode;
  late final GlobalKey<FormState> formKey;
  late Timer _timer;
  int _remainingSeconds = 60;
  bool _isLoading = false;
  String? _errorMessage;
  bool _otpSent = false;
  late String _phoneNumber;
  late bool _isSignIn;
  late String _token;
  late String _email;
  final logger = Logger();

  Null get buttonName => null;
  @override
  void initState() {
    super.initState();
    // get phone number from arguments
    final args = Get.arguments as Map<String, dynamic>? ?? {};
    _phoneNumber = args["phone"] ?? "";
    _isSignIn = args["isSignIn"] ?? false;
    _email = args["email"] ?? "";
    logger.i("Phone number parsed: $_phoneNumber, email: $_email, isSignIn parsed: $_isSignIn");
    if (kIsWeb) BrowserContextMenu.disableContextMenu();
    formKey = GlobalKey<FormState>();
    pinController = TextEditingController();
    focusNode = FocusNode();
        // automatically send otp when page loads
        _sendInitialOtp();
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

  Future<void> _sendInitialOtp() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try{
      await AuthService.sendOtp(
        _phoneNumber, 
        _email, 
        // _token
        );
      setState(() => _otpSent);
      showCustomSnackBar(
      message: "OTP sent to $_phoneNumber",
      backgroundColor: ColorGlobalVariables.blueColor,
      );
    }catch(e){
      setState(() => _errorMessage = e.toString());
      showCustomSnackBar(
        message: "Failed to send OTP: $_errorMessage"
      );
    } finally{
      if(mounted){
        setState(() => _isLoading = false);
      }
    }
  }
  
  // verify otp function
  Future<void> _verifyCode() async {
    if(!formKey.currentState!.validate()) return;
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    userProvider.clearError();
    
    try{

      final authResponse = await AuthService.verifyOtp(
        phone: _phoneNumber, 
        otp: pinController.text, 
        userProvider: userProvider,
        );
        
        // navigate based on auth status
        Get.offAllNamed(
          _isSignIn ? RouteClass.getMainBottomNavigationPage() : RouteClass.getSignInWithPhonePage()
        );

    }catch(e){
      setState(() => _errorMessage = e.toString());
      showCustomSnackBar(
        message: "Verification failed: $_errorMessage"
        );
    } finally{
      if(mounted){
        setState(() => _isLoading = false);
      }
    }
  }

  // resend otp function
  Future<void> _resendOtp() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try{
      await AuthService.sendOtp(
        _phoneNumber, 
        _email, 
        // _token
        );
      setState(() {
        _remainingSeconds = 60;
        _otpSent = true;
      });
      _startCountdown();
      showCustomSnackBar(message: "OTP resent successfully");
    }catch(e){
      setState(() => _errorMessage = e.toString());
      showCustomSnackBar(message: "Failed to resend OTP: $_errorMessage");
    } finally{
      if(mounted){
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  void dispose() {
    _timer.cancel();
    if (kIsWeb) BrowserContextMenu.enableContextMenu();
    pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
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
      width: 50,
      height: 50,
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
                    // verify code text
                    Text('Verify Code',style: TextStyle(fontSize:32, fontWeight: FontWeight.w500 ),),
                    // pinput field
                    SizedBox(height: 50,),
                    (_isLoading || userProvider.isLoading) ? CircularProgressIndicator() : Pinput(
                      controller: pinController,
                      focusNode: focusNode,
                      length: 6,
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
                        if(value == null || value.isEmpty){
                          return "Please enter the code";
                        }
                        if(value.length != 6){
                          return "Code must be 6 digits";
                        }
                        return null;
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
                    if(_errorMessage != null || userProvider.error != null)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: TextExtraSmall(
                        title: _errorMessage! ?? userProvider.error!, 
                        textColor: ColorGlobalVariables.redColor,
                        ),
                    ),
                    RichText(
                          text: TextSpan(
                            text: 'Time Remaining : ',
                            style: TextStyle(color: Colors.black87, fontSize: 16),
                            children: <TextSpan>[
                              TextSpan(
                                text: '$_remainingSeconds  seconds ',
                                style: TextStyle(
                                  color: _remainingSeconds < 10 ? ColorGlobalVariables.redColor : Color.fromRGBO(159, 16, 16, 1),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10,),
                        // button for resendOTP
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: CustomButton(
                            isLoading: _isLoading, 
                            buttonName: "Resend Code",
                            backgroundColor: _remainingSeconds == 0 ? Color.fromRGBO(159, 16, 16, 1) : Colors.grey,
                            onPressed: _remainingSeconds == 0 ? _resendOtp : null,
                            ),
                        ),
                        SizedBox(height: 40,),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: CustomButton(
                                buttonName: 'Verify Code',
                                backgroundColor: _remainingSeconds == 0 ? Colors.grey : Color.fromRGBO(159, 16, 16, 1), 
                                onPressed: _verifyCode, 
                                     isLoading: (_isLoading || userProvider.isLoading),
                                     ),
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
            if(_remainingSeconds > 0){
              Get.defaultDialog(
                title: "Warning",
                middleText: "Your OTP is still valid. Are you sure you want to go back?",
                textConfirm: "Yes",
                textCancel: "No",
                onConfirm: () => Get.offAllNamed(RouteClass.getSignInWithPhonePage())
              );
            } else{
              Get.offAllNamed(RouteClass.getSignInWithPhonePage());
            }
          },
          child: Icon(Icons.arrow_back_ios,size: 30,color: Colors.black,)))
       ,

   
        ],
      ),
    );
  
  
  
  }
}
