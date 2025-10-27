import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  bool _otpSent = false;
  late String _phoneNumber;
  late bool _isSignIn;
  late String _email;
  final logger = Logger();

  // Clipboard auto-fill variables
  bool _isAutoFilling = false;

  @override
  void initState() {
    super.initState();
    // get phone number from arguments
    final args = Get.arguments as Map<String, dynamic>? ?? {};
    _phoneNumber = args["phone"]?.toString() ?? ""; // Ensure string
    _isSignIn = args["isSignIn"] ?? false;
    _email = args["email"]?.toString() ?? ""; // Ensure string
    logger.i("Phone number parsed: $_phoneNumber, email: $_email, isSignIn parsed: $_isSignIn");
    
    if (kIsWeb) BrowserContextMenu.disableContextMenu();
    formKey = GlobalKey<FormState>();
    pinController = TextEditingController();
    focusNode = FocusNode();
    
    // automatically send otp when page loads
    _sendInitialOtp();
    _startCountdown();
    
    // Start clipboard monitoring
    _startClipboardMonitoring();
  }
  
  void _startClipboardMonitoring() {
    // Check clipboard periodically for OTP
    Future.delayed(const Duration(seconds: 2), () {
      _checkClipboardForOtp();
    });
  }

  void _checkClipboardForOtp() async {
    if (_isAutoFilling || _isLoading) return;
    
    try {
      final clipboardData = await Clipboard.getData('text/plain');
      if (clipboardData?.text != null) {
        final text = clipboardData!.text!.trim();
        // Look for 6-digit OTP pattern
        final otpMatch = RegExp(r'\b\d{6}\b').firstMatch(text);
        if (otpMatch != null) {
          final otp = otpMatch.group(0)!;
          _handleAutoFillCode(otp);
        }
      }
    } catch (e) {
      print("Clipboard monitoring failed: $e");
    }
  }

  void _handleAutoFillCode(String code) {
    setState(() {
      _isAutoFilling = true;
    });

    // Fill the OTP field automatically
    pinController.text = code;

    // Auto-verify after a short delay
    Future.delayed(const Duration(milliseconds: 500), () {
      _verifyCode();
    });

    // Show auto-fill success message
    _showAutoFillSuccess();
  }

  void _showAutoFillSuccess() {
    showCustomSnackBar(
      title: "Auto-filled",
      message: 'OTP automatically detected and filled',
      backgroundColor: ColorGlobalVariables.greenColor,
      textColor: Colors.white,
    );
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
    });

    try{
      await AuthService.sendOtp(
        _phoneNumber, 
        _email, 
      );
      setState(() => _otpSent = true);
      showCustomSnackBar(
        title: "OTP Sent",
        message: "Verification code sent to your phone",
        backgroundColor: ColorGlobalVariables.blueColor,
      );
    }catch(e){
      // Show user-friendly error message
      _showUserFriendlyError(e, "send OTP");
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
      // Show user-friendly error message
      _showUserFriendlyError(e, "verify code");
    } finally{
      if(mounted){
        setState(() {
          _isLoading = false;
          _isAutoFilling = false;
        });
      }
    }
  }

  // resend otp function
  Future<void> _resendOtp() async {
    setState(() {
      _isLoading = true;
    });

    try{
      await AuthService.sendOtp(
        _phoneNumber, 
        _email, 
      );
      setState(() {
        _remainingSeconds = 60;
        _otpSent = true;
      });
      _startCountdown();
      showCustomSnackBar(
        title: "OTP Resent",
        message: "New verification code sent to your phone",
        backgroundColor: ColorGlobalVariables.greenColor,
      );
    }catch(e){
      // Show user-friendly error message
      _showUserFriendlyError(e, "resend OTP");
    } finally{
      if(mounted){
        setState(() => _isLoading = false);
      }
    }
  }

  void _pasteFromClipboard() async {
    try {
      final clipboardData = await Clipboard.getData('text/plain');
      if (clipboardData?.text != null) {
        final text = clipboardData!.text!.trim();
        if (text.length == 6 && text.contains(RegExp(r'^\d+$'))) {
          _handleAutoFillCode(text);
        } else {
          showCustomSnackBar(
            title: "Invalid OTP",
            message: 'Clipboard does not contain a valid 6-digit code',
            backgroundColor: ColorGlobalVariables.redColor,
          );
        }
      } else {
        showCustomSnackBar(
          title: "No OTP Found",
          message: 'No verification code found in clipboard',
          backgroundColor: ColorGlobalVariables.redColor,
        );
      }
    } catch (e) {
      showCustomSnackBar(
        title: "Paste Failed",
        message: 'Unable to paste from clipboard. Please try again.',
        backgroundColor: ColorGlobalVariables.redColor,
      );
    }
  }

  // Helper method to show user-friendly error messages
  void _showUserFriendlyError(dynamic error, String operation) {
    String errorMessage = "An error occurred";
    String errorTitle = "Error";

    if (error is String) {
      // If error is already a string, try to make it user-friendly
      errorMessage = _makeErrorMessageUserFriendly(error);
    } else if (error is FormatException) {
      errorMessage = "Invalid data format. Please try again.";
    } else if (error is TimeoutException) {
      errorMessage = "Request timed out. Please check your connection and try again.";
    } else {
      errorMessage = "Failed to $operation. Please try again.";
    }

    showCustomSnackBar(
      title: errorTitle,
      message: errorMessage,
      backgroundColor: ColorGlobalVariables.redColor,
      textColor: Colors.white,
    );
  }

  // Method to convert technical error messages to user-friendly ones
  String _makeErrorMessageUserFriendly(String error) {
    // Convert common technical errors to user-friendly messages
    if (error.toLowerCase().contains('timeout') || error.toLowerCase().contains('timed out')) {
      return "Request timed out. Please check your internet connection.";
    } else if (error.toLowerCase().contains('network') || error.toLowerCase().contains('connection')) {
      return "Network error. Please check your internet connection.";
    } else if (error.toLowerCase().contains('invalid') && error.toLowerCase().contains('otp')) {
      return "Invalid verification code. Please check the code and try again.";
    } else if (error.toLowerCase().contains('expired')) {
      return "Verification code has expired. Please request a new one.";
    } else if (error.toLowerCase().contains('too many attempts')) {
      return "Too many failed attempts. Please wait before trying again.";
    } else if (error.toLowerCase().contains('user not found')) {
      return "Account not found. Please check your phone number.";
    } else {
      // Generic fallback - remove technical details
      return "Something went wrong. Please try again.";
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
                    Text(
                      'Verify Code',
                      style: TextStyle(fontSize:32, fontWeight: FontWeight.w500),
                    ),
                    
                    // Auto-fill info
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.blue.shade50,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.blue.shade100),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.auto_awesome_motion, size: 16, color: Colors.blue.shade600),
                          SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              'Paste OTP from clipboard for auto-fill',
                              style: TextStyle(fontSize: 12, color: Colors.blue.shade800),
                            ),
                          ),
                          TextButton(
                            onPressed: _pasteFromClipboard,
                            child: Text(
                              'Paste',
                              style: TextStyle(
                                color: ColorGlobalVariables.brownColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    
                    // pinput field
                    SizedBox(height: 20),
                    (_isLoading || userProvider.isLoading) 
                      ? CircularProgressIndicator(
                        color: ColorGlobalVariables.brownColor,
                      ) 
                      : Pinput(
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
                            _verifyCode();
                          },
                          onChanged: (value) {
                            debugPrint('Changed: $value');
                          },
                        ),
                    const SizedBox(height: 20),
                    
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
                    
                    const SizedBox(height: 10),
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
                    
                    SizedBox(height: 40),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: CustomButton(
                        buttonName: _isAutoFilling ? 'Verifying...' : 'Verify Code',
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
              child: Icon(Icons.arrow_back_ios,size: 30,color: Colors.black,),
            ),
          ),
        ],
      ),
    );
  }
}