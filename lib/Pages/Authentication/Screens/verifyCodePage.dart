import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
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
  const VerifyCodePage({super.key, required this.allJson});

  @override
  State<VerifyCodePage> createState() => _VerifyCodePageState();
}

class _VerifyCodePageState extends State<VerifyCodePage>
    with SingleTickerProviderStateMixin {
  late final TextEditingController pinController;
  late final FocusNode focusNode;
  late final GlobalKey<FormState> formKey;
  late Timer _timer;
  int _remainingSeconds = 60;
  bool _isLoading = false;
  late String _phoneNumber;
  late bool _isSignIn;
  late String _email;
  final logger = Logger();

  // Animation controllers
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _slideAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<double> _pulseAnimation;

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
    logger.i(
      "Phone number parsed: $_phoneNumber, email: $_email, isSignIn parsed: $_isSignIn",
    );

    if (kIsWeb) BrowserContextMenu.disableContextMenu();
    formKey = GlobalKey<FormState>();
    pinController = TextEditingController();
    focusNode = FocusNode();

    _initAnimations();

    // automatically send otp when page loads
    _sendInitialOtp();
    _startCountdown();

    // Start clipboard monitoring
    _startClipboardMonitoring();
  }

  void _initAnimations() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 0.6, curve: Curves.easeInOut),
      ),
    );

    _slideAnimation = Tween<double>(begin: 80.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.2, 0.8, curve: Curves.easeOutCubic),
      ),
    );

    _scaleAnimation = Tween<double>(begin: 0.9, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.4, 1.0, curve: Curves.elasticOut),
      ),
    );

    _pulseAnimation = Tween<double>(begin: 1.0, end: 1.05).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.6, 1.0, curve: Curves.easeInOut),
      ),
    );

    _animationController.forward();
  }

  Future<void> _successAnimation() async {
    await _animationController.animateTo(
      1.1,
      duration: const Duration(milliseconds: 300),
    );
    await _animationController.animateBack(
      1.0,
      duration: const Duration(milliseconds: 200),
    );
  }

  void _errorShakeAnimation() {
    _animationController
        .animateBack(0.1, duration: const Duration(milliseconds: 100))
        .then((_) => _animationController.forward());
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
      debugPrint("Clipboard monitoring failed: $e");
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

    try {
      await AuthService.sendOtp(_phoneNumber, _email);
      showCustomSnackBar(
        title: "OTP Sent",
        message: "Verification code sent to your phone",
        backgroundColor: ColorGlobalVariables.blueColor,
      );
    } catch (e) {
      // Show user-friendly error message
      _showUserFriendlyError(e, "send OTP");
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  // FIXED: verify otp function with proper error handling
  Future<void> _verifyCode() async {
    if (!formKey.currentState!.validate()) return;

    final userProvider = Provider.of<UserProvider>(context, listen: false);
    setState(() {
      _isLoading = true;
    });

    userProvider.clearError();

    try {
      logger.i("Verifying OTP: ${pinController.text} for phone: $_phoneNumber");

      // Call verifyOtp and wait for completion
      await AuthService.verifyOtp(
        phone: _phoneNumber,
        otp: pinController.text,
        userProvider: userProvider,
      );

      logger.i("OTP verification completed successfully");

      await _successAnimation();

      // Show success message BEFORE navigation
      showCustomSnackBar(
        title: "Success",
        message: "OTP verified successfully!",
        backgroundColor: ColorGlobalVariables.greenColor,
        textColor: Colors.white,
      );

      // Add a small delay to ensure snackbar is visible
      await Future.delayed(const Duration(milliseconds: 500));

      // Navigate based on auth status
      Get.offAllNamed(
        _isSignIn
            ? RouteClass.getMainBottomNavigationPage()
            : RouteClass.getSignInWithPhonePage(),
      );
    } catch (e, stackTrace) {
      // Log the full error for debugging
      logger.e("OTP verification failed", error: e, stackTrace: stackTrace);

      // Show user-friendly error message
      _showUserFriendlyError(e, "verify code");
      _errorShakeAnimation();
    } finally {
      if (mounted) {
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

    try {
      await AuthService.sendOtp(_phoneNumber, _email);
      setState(() {
        _remainingSeconds = 60;
      });
      _startCountdown();
      showCustomSnackBar(
        title: "OTP Resent",
        message: "New verification code sent to your phone",
        backgroundColor: ColorGlobalVariables.greenColor,
      );
    } catch (e) {
      // Show user-friendly error message
      _showUserFriendlyError(e, "resend OTP");
    } finally {
      if (mounted) {
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
      errorMessage =
          "Request timed out. Please check your connection and try again.";
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
    if (error.toLowerCase().contains('timeout') ||
        error.toLowerCase().contains('timed out')) {
      return "Request timed out. Please check your internet connection.";
    } else if (error.toLowerCase().contains('network') ||
        error.toLowerCase().contains('connection')) {
      return "Network error. Please check your internet connection.";
    } else if (error.toLowerCase().contains('invalid') &&
        error.toLowerCase().contains('otp')) {
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
    _animationController.dispose();
    if (kIsWeb) BrowserContextMenu.enableContextMenu();
    pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final basePinDecoration = BoxDecoration(
      color: isDark ? const Color(0xFF2D2D2D) : Colors.white,
      borderRadius: BorderRadius.circular(16),
      border: Border.all(
        color: isDark ? const Color(0xFF444444) : Colors.grey.shade300,
        width: 2,
      ),
      boxShadow: [
        if (!isDark)
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
      ],
    );

    final pinTheme = PinTheme(
      width: 60,
      height: 60,
      textStyle: TextStyle(
        fontSize: 22,
        color: isDark ? Colors.white : Colors.black,
        fontWeight: FontWeight.w700,
      ),
      decoration: basePinDecoration,
    );

    return Scaffold(
      backgroundColor: isDark ? const Color(0xFF121212) : Colors.white,
      body: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return Transform(
            transform: Matrix4.identity()
              ..scale(_scaleAnimation.value, _scaleAnimation.value, 1.0),
            alignment: Alignment.center,
            child: Opacity(
              opacity: _fadeAnimation.value,
              child: Stack(
                children: [
                  Center(
                    child: Form(
                      key: formKey,
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // Header with icon and title
                            Transform.translate(
                              offset: Offset(0, -_slideAnimation.value * 0.5),
                              child: Column(
                                children: [
                                  // Animated icon
                                  ScaleTransition(
                                    scale: _pulseAnimation,
                                    child: Container(
                                      width: 100,
                                      height: 100,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            (ColorGlobalVariables.brownColor ??
                                                    const Color(0xFF8B4513))
                                                .withValues(alpha: 0.2),
                                            (ColorGlobalVariables.brownColor ??
                                                    const Color(0xFF8B4513))
                                                .withValues(alpha: 0.1),
                                          ],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                        ),
                                        shape: BoxShape.circle,
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                (ColorGlobalVariables
                                                            .brownColor ??
                                                        const Color(0xFF8B4513))
                                                    .withValues(alpha: 0.3),
                                            blurRadius: 20,
                                            spreadRadius: 2,
                                          ),
                                        ],
                                      ),
                                      child: Icon(
                                        Icons.verified_user_rounded,
                                        size: 45,
                                        color:
                                            ColorGlobalVariables.brownColor ??
                                            const Color(0xFF8B4513),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 24),

                                  // Title
                                  Transform.translate(
                                    offset: Offset(-_slideAnimation.value, 0),
                                    child: Text(
                                      'Verify Code',
                                      style: TextStyle(
                                        fontSize: 36,
                                        fontWeight: FontWeight.w700,
                                        color: isDark
                                            ? Colors.white
                                            : Colors.black87,
                                        letterSpacing: -0.5,
                                      ),
                                    ),
                                  ),

                                  const SizedBox(height: 8),

                                  // Subtitle
                                  Transform.translate(
                                    offset: Offset(_slideAnimation.value, 0),
                                    child: Text(
                                      'Enter the 6-digit code sent to your phone',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: isDark
                                            ? Colors.white70
                                            : Colors.black54,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            const SizedBox(height: 40),

                            // Auto-fill info card
                            Container(
                              margin: const EdgeInsets.symmetric(
                                horizontal: 10,
                              ),
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: isDark
                                    ? const Color(0xFF1E3A5F)
                                    : Colors.blue.shade50,
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(
                                  color: isDark
                                      ? const Color(0xFF2D4F7C)
                                      : Colors.blue.shade100,
                                ),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.auto_awesome_motion_rounded,
                                    size: 20,
                                    color: isDark
                                        ? const Color(0xFF64B5F6)
                                        : Colors.blue.shade600,
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Auto-fill Available',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: isDark
                                                ? const Color(0xFFE3F2FD)
                                                : Colors.blue.shade800,
                                          ),
                                        ),
                                        const SizedBox(height: 2),
                                        Text(
                                          'Paste OTP from clipboard for quick verification',
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: isDark
                                                ? const Color(0xFFBBDEFB)
                                                : Colors.blue.shade700,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: _pasteFromClipboard,
                                    child: MouseRegion(
                                      cursor: SystemMouseCursors.click,
                                      child: AnimatedContainer(
                                        duration: const Duration(
                                          milliseconds: 200,
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 12,
                                          vertical: 8,
                                        ),
                                        decoration: BoxDecoration(
                                          color: isDark
                                              ? const Color(0xFF2D2D2D)
                                              : Colors.white,
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                          border: Border.all(
                                            color:
                                                ColorGlobalVariables
                                                    .brownColor ??
                                                const Color(0xFF8B4513),
                                          ),
                                        ),
                                        child: Text(
                                          'Paste',
                                          style: TextStyle(
                                            color:
                                                ColorGlobalVariables
                                                    .brownColor ??
                                                const Color(0xFF8B4513),
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ).animate().fadeIn(delay: 300.ms).slideY(),

                            const SizedBox(height: 40),

                            // OTP Input Section
                            Transform.translate(
                              offset: Offset(0, _slideAnimation.value),
                              child: Column(
                                children: [
                                  (_isLoading || userProvider.isLoading)
                                      ? SizedBox(
                                          height: 100,
                                          child: Center(
                                            child: CircularProgressIndicator(
                                              color: ColorGlobalVariables
                                                  .brownColor,
                                              strokeWidth: 3,
                                            ),
                                          ),
                                        )
                                      : Pinput(
                                          controller: pinController,
                                          focusNode: focusNode,
                                          length: 6,
                                          defaultPinTheme: pinTheme,
                                          separatorBuilder: (index) =>
                                              const SizedBox(width: 12),
                                          focusedPinTheme: pinTheme
                                              .copyDecorationWith(
                                                border: Border.all(
                                                  color:
                                                      ColorGlobalVariables
                                                          .brownColor ??
                                                      const Color(0xFF8B4513),
                                                  width: 2,
                                                ),
                                              ),
                                          submittedPinTheme: pinTheme.copyWith(
                                            decoration: basePinDecoration
                                                .copyWith(
                                                  border: Border.all(
                                                    color:
                                                        ColorGlobalVariables
                                                            .brownColor ??
                                                        const Color(0xFF8B4513),
                                                    width: 2,
                                                  ),
                                                ),
                                          ),
                                          errorPinTheme: pinTheme
                                              .copyBorderWith(
                                                border: Border.all(
                                                  color: Colors.redAccent,
                                                ),
                                              ),
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return "Please enter the code";
                                            }
                                            if (value.length != 6) {
                                              return "Code must be 6 digits";
                                            }
                                            return null;
                                          },
                                          hapticFeedbackType:
                                              HapticFeedbackType.lightImpact,
                                          onCompleted: (pin) {
                                            debugPrint('Completed: $pin');
                                            _verifyCode();
                                          },
                                          onChanged: (value) {
                                            debugPrint('Changed: $value');
                                          },
                                        ),

                                  const SizedBox(height: 30),

                                  // Timer with animation
                                  ScaleTransition(
                                    scale: _pulseAnimation,
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 20,
                                        vertical: 12,
                                      ),
                                      decoration: BoxDecoration(
                                        color: isDark
                                            ? const Color(0xFF2D2D2D)
                                            : Colors.grey.shade50,
                                        borderRadius: BorderRadius.circular(25),
                                        border: Border.all(
                                          color: _remainingSeconds < 10
                                              ? Colors.red.withValues(
                                                  alpha: 0.5,
                                                )
                                              : Colors.green.withValues(
                                                  alpha: 0.5,
                                                ),
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Icon(
                                            Icons.timer_rounded,
                                            color: _remainingSeconds < 10
                                                ? Colors.red
                                                : Colors.green,
                                            size: 20,
                                          ),
                                          const SizedBox(width: 8),
                                          Text(
                                            'Time Remaining: ',
                                            style: TextStyle(
                                              color: isDark
                                                  ? Colors.white70
                                                  : Colors.black54,
                                              fontSize: 14,
                                            ),
                                          ),
                                          Text(
                                            '$_remainingSeconds seconds',
                                            style: TextStyle(
                                              color: _remainingSeconds < 10
                                                  ? Colors.red
                                                  : Colors.green,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),

                                  const SizedBox(height: 30),

                                  // Buttons Section
                                  Column(
                                    children: [
                                      // Resend Button
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 20,
                                        ),
                                        child: CustomButton(
                                          isLoading: _isLoading,
                                          buttonName: "Resend Code",
                                          backgroundColor:
                                              _remainingSeconds == 0
                                              ? (ColorGlobalVariables
                                                        .brownColor ??
                                                    const Color(0xFF8B4513))
                                              : Colors.grey,
                                          onPressed: _remainingSeconds == 0
                                              ? _resendOtp
                                              : null,
                                        ),
                                      ),

                                      const SizedBox(height: 16),

                                      // Verify Button
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 20,
                                        ),
                                        child: CustomButton(
                                          buttonName: _isAutoFilling
                                              ? 'Verifying...'
                                              : 'Verify Code',
                                          backgroundColor:
                                              _remainingSeconds == 0
                                              ? Colors.grey
                                              : (ColorGlobalVariables
                                                        .brownColor ??
                                                    const Color(0xFF8B4513)),
                                          onPressed: _verifyCode,
                                          isLoading:
                                              (_isLoading ||
                                              userProvider.isLoading),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // Back Button
                  Positioned(
                    top: 60,
                    left: 24,
                    child: FadeTransition(
                      opacity: _fadeAnimation,
                      child: GestureDetector(
                        onTap: () {
                          if (_remainingSeconds > 0) {
                            Get.defaultDialog(
                              title: "Warning",
                              middleText:
                                  "Your OTP is still valid. Are you sure you want to go back?",
                              textConfirm: "Yes",
                              textCancel: "No",
                              onConfirm: () => Get.offAllNamed(
                                RouteClass.getSignInWithPhonePage(),
                              ),
                            );
                          } else {
                            Get.offAllNamed(
                              RouteClass.getSignInWithPhonePage(),
                            );
                          }
                        },
                        child: MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: isDark
                                  ? const Color(0xFF2D2D2D)
                                  : Colors.grey.shade100,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.1),
                                  blurRadius: 8,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Icon(
                              Icons.arrow_back_ios_rounded,
                              size: 20,
                              color: isDark ? Colors.white : Colors.black87,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
