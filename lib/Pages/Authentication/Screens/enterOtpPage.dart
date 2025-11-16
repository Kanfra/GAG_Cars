import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gag_cars_frontend/GlobalVariables/colorGlobalVariables.dart';
import 'package:gag_cars_frontend/Pages/Authentication/Providers/userProvider.dart';
import 'package:gag_cars_frontend/Pages/Authentication/Services/authService.dart';
import 'package:gag_cars_frontend/Routes/routeClass.dart';
import 'package:gag_cars_frontend/Utils/WidgetUtils/widgetUtils.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

class EnterOtpPage extends StatefulWidget {
  final Map<String, dynamic> allJson;
  
  const EnterOtpPage({
    super.key, 
    required this.allJson,  
  });

  @override
  State<EnterOtpPage> createState() => _EnterOtpPageState();
}

class _EnterOtpPageState extends State<EnterOtpPage> with SingleTickerProviderStateMixin {
  final List<TextEditingController> _otpControllers = List.generate(6, (index) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(6, (index) => FocusNode());
  bool _isLoading = false;
  bool _isError = false;
  String? _errorMessage;
  bool _isResending = false;
  bool _isAutoFilling = false;
  final logger = Logger();
  
  // Timer variables
  late Timer _timer;
  int _remainingSeconds = 60;
  bool _canResend = false;
  
  // Animation controllers
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _slideAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<double> _pulseAnimation;
  late Animation<Color?> _containerColorAnimation;

  @override
  void initState() {
    super.initState();
    _initAnimations();
    // Auto-focus first field
    _focusNodes[0].requestFocus();
    // Start timer countdown
    _startCountdown();
    // Start clipboard monitoring
    _startClipboardMonitoring();
  }

  void _initAnimations() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 0.6, curve: Curves.easeInOut),
      ),
    );

    _slideAnimation = Tween<double>(begin: 60.0, end: 0.0).animate(
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

    _containerColorAnimation = ColorTween(
      begin: Colors.transparent,
      end: Colors.red.withOpacity(0.1),
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    _animationController.forward();
  }

  void _startCountdown() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingSeconds == 0) {
        timer.cancel();
        setState(() {
          _canResend = true;
        });
      } else {
        setState(() {
          _remainingSeconds--;
        });
      }
    });
  }

  void _resetTimer() {
    setState(() {
      _remainingSeconds = 60;
      _canResend = false;
    });
    _startCountdown();
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
    _animationController.animateBack(0.1, duration: const Duration(milliseconds: 100))
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
      print("Clipboard monitoring failed: $e");
    }
  }

  void _handleAutoFillCode(String code) {
    setState(() {
      _isAutoFilling = true;
    });

    // Fill the OTP fields automatically
    for (int i = 0; i < code.length && i < 6; i++) {
      _otpControllers[i].text = code[i];
    }

    // Auto-verify after a short delay
    Future.delayed(500.ms, () {
      _verifyOTP();
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

  @override
  void dispose() {
    _timer.cancel();
    _animationController.dispose();
    for (var controller in _otpControllers) {
      controller.dispose();
    }
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  void _onOTPChanged(int index, String value) {
    if (value.length == 1 && index < 5) {
      _focusNodes[index].unfocus();
      _focusNodes[index + 1].requestFocus();
    } else if (value.isEmpty && index > 0) {
      _focusNodes[index].unfocus();
      _focusNodes[index - 1].requestFocus();
    }

    // Check if all fields are filled and auto-verify
    if (_otpControllers.every((controller) => controller.text.isNotEmpty)) {
      _verifyOTP();
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
            message: 'Clipboard does not contain a valid 6-digit OTP',
          );
        }
      }
    } catch (e) {
      print("Clipboard paste failed: $e");
      showCustomSnackBar(
        message: 'Failed to paste from clipboard',
      );
    }
  }

  Future<void> _verifyOTP() async {
    if (_isLoading) return;

    final userProvider = Provider.of<UserProvider>(context, listen: false);
    setState(() {
      _isLoading = true;
      _isError = false;
      _errorMessage = null;
    });

    userProvider.clearError();
    final enteredOTP = _otpControllers.map((c) => c.text).join();
    
    // Validate OTP length
    if (enteredOTP.length != 6) {
      setState(() {
        _isLoading = false;
        _isError = true;
        _errorMessage = 'Please enter a complete 6-digit OTP';
      });
      _errorShakeAnimation();
      return;
    }

    try {
      
      // Call your AuthService.verifyOtp method
      logger.w("phone: ${widget.allJson['phone']}, entered otp: $enteredOTP, userProvider: $userProvider");
      await AuthService.verifyOtp(
        phone: widget.allJson['phone'], 
        otp: enteredOTP, 
        userProvider: userProvider
      );

      // If we reach here, verification was successful
      await _successAnimation();
      
      showCustomSnackBar(
        title: "Success",
        message: 'OTP verified successfully',
        backgroundColor: ColorGlobalVariables.greenColor,
      );
      
      // Navigate to reset password page
      Get.toNamed(
        RouteClass.getResetPasswordPage(), 
        arguments: {
          'phone': widget.allJson['phone'],
          'email': widget.allJson['email'],
          'otp': enteredOTP
        }
      );
      
    } catch (e) {
      setState(() {
        _isError = true;
        _errorMessage = 'Invalid OTP. Please try again.';
      });
      _errorShakeAnimation();
      showCustomSnackBar(
        message: 'Invalid OTP. Please try again.',
      );
    } finally {
      if(mounted){
        setState(() {
          _isLoading = false;
          _isAutoFilling = false;
        });
      }
    }
  }

  Future<void> _resendOTP() async {
    if (_isResending || !_canResend) return;

    setState(() {
      _isResending = true;
    });

    try {
      await AuthService.sendPasswordResetEmail(
        phone: widget.allJson['phone'],
        email: widget.allJson['email'],
      );

      // Clear all fields and reset timer
      for (var controller in _otpControllers) {
        controller.clear();
      }
      _focusNodes[0].requestFocus();
      _resetTimer();

      setState(() {
        _isResending = false;
        _isError = false;
        _errorMessage = null;
      });

      if (mounted) {
        showCustomSnackBar(
          title: "OTP Resent",
          message: 'New OTP sent to your email and phone',
          backgroundColor: ColorGlobalVariables.greenColor,
        );
      }
    } catch (e) {
      setState(() {
        _isResending = false;
      });
      showCustomSnackBar(
        message: 'Failed to resend OTP. Please try again.',
      );
    }
  }

  void _clearAllFields() {
    for (var controller in _otpControllers) {
      controller.clear();
    }
    _focusNodes[0].requestFocus();
    setState(() {
      _isError = false;
      _errorMessage = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDarkMode ? const Color(0xFF121212) : Colors.grey[50],
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: AnimatedBuilder(
            animation: _animationController,
            builder: (context, child) {
              return Transform(
                transform: Matrix4.identity()
                  ..scale(_scaleAnimation.value),
                alignment: Alignment.center,
                child: Opacity(
                  opacity: _fadeAnimation.value,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Back button
                      Transform.translate(
                        offset: Offset(-_slideAnimation.value, 0),
                        child: IconButton(
                          icon: Icon(
                            Icons.arrow_back, 
                            color: isDarkMode ? Colors.white : ColorGlobalVariables.blackColor
                          ),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ),

                      const SizedBox(height: 20),

                      // Title
                      Transform.translate(
                        offset: Offset(_slideAnimation.value, 0),
                        child: Text(
                          'Verify OTP',
                          style: theme.textTheme.headlineMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: isDarkMode ? Colors.white : Colors.black87,
                          ),
                        ),
                      ),

                      const SizedBox(height: 8),

                      // Subtitle
                      Transform.translate(
                        offset: Offset(-_slideAnimation.value, 0),
                        child: RichText(
                          text: TextSpan(
                            text: 'Enter the 6-digit code sent to ',
                            style: theme.textTheme.bodyLarge?.copyWith(
                              color: isDarkMode ? Colors.white70 : Colors.black54,
                            ),
                            children: [
                              TextSpan(
                                text: widget.allJson['email'],
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: isDarkMode ? Colors.white : Colors.black87,
                                ),
                              ),
                              TextSpan(
                                text: ' and ',
                              ),
                              TextSpan(
                                text: widget.allJson['phone'],
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: isDarkMode ? Colors.white : Colors.black87,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      // Timer Section
                      const SizedBox(height: 16),
                      _buildTimerSection(isDarkMode),

                      // Auto-fill info card
                      const SizedBox(height: 16),
                      _buildAutoFillInfoCard(isDarkMode),

                      const SizedBox(height: 40),

                      // OTP Input Fields with Paste button
                      Transform.translate(
                        offset: Offset(0, _slideAnimation.value),
                        child: _buildOTPInputSection(theme, isDarkMode),
                      ),

                      if (_isError) ...[
                        const SizedBox(height: 20),
                        _buildErrorSection(theme, isDarkMode),
                      ],

                      const SizedBox(height: 40),

                      // Verify Button
                      Transform.translate(
                        offset: Offset(0, _slideAnimation.value * 0.5),
                        child: _buildVerifyButton(theme),
                      ),

                      const SizedBox(height: 20),

                      // Resend OTP
                      FadeTransition(
                        opacity: _fadeAnimation,
                        child: _buildResendSection(theme, isDarkMode),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildTimerSection(bool isDarkMode) {
    return ScaleTransition(
      scale: _pulseAnimation,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isDarkMode ? const Color(0xFF2D2D2D) : Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: _remainingSeconds < 10 
                ? Colors.red.withOpacity(0.5)
                : Colors.green.withOpacity(0.5),
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.timer_rounded,
              color: _remainingSeconds < 10 ? Colors.red : Colors.green,
              size: 24,
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Time Remaining',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: isDarkMode ? Colors.white70 : Colors.black54,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '$_remainingSeconds seconds',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: _remainingSeconds < 10 ? Colors.red : Colors.green,
                  ),
                ),
              ],
            ),
            const Spacer(),
            if (_remainingSeconds < 30)
              Icon(
                Icons.warning_amber_rounded,
                color: Colors.orange,
                size: 20,
              ),
          ],
        ),
      ),
    ).animate().fadeIn(delay: 200.ms).slideY();
  }

  Widget _buildAutoFillInfoCard(bool isDarkMode) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDarkMode ? const Color(0xFF1E3A5F) : Colors.blue.shade50,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isDarkMode ? const Color(0xFF2D4F7C) : Colors.blue.shade100,
        ),
      ),
      child: Row(
        children: [
          Icon(
            Icons.auto_awesome_motion,
            color: isDarkMode ? const Color(0xFF64B5F6) : Colors.blue.shade600,
            size: 24,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Auto-fill Available',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: isDarkMode ? const Color(0xFFE3F2FD) : Colors.blue.shade800,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Use the paste button or we\'ll auto-detect OTP from clipboard',
                  style: TextStyle(
                    fontSize: 12,
                    color: isDarkMode ? const Color(0xFFBBDEFB) : Colors.blue.shade700,
                  ),
                ),
              ],
            ),
          ),
          if (_isAutoFilling) ...[
            const SizedBox(width: 8),
            SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(
                  isDarkMode ? const Color(0xFF64B5F6) : Colors.blue.shade600
                ),
              ),
            ),
          ],
        ],
      ),
    ).animate().fadeIn(delay: 300.ms).slideY();
  }

  Widget _buildOTPInputSection(ThemeData theme, bool isDarkMode) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Enter 6-digit OTP',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: isDarkMode ? Colors.white : Colors.black87,
              ),
            ),
            GestureDetector(
              onTap: _pasteFromClipboard,
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: isDarkMode ? const Color(0xFF2D2D2D) : Colors.grey[100],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.paste,
                        size: 18,
                        color: ColorGlobalVariables.brownColor,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'Paste',
                        style: TextStyle(
                          color: ColorGlobalVariables.brownColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(6, (index) {
              return SizedBox(
                width: 52,
                height: 64,
                child: TextField(
                  controller: _otpControllers[index],
                  focusNode: _focusNodes[index],
                  cursorColor: ColorGlobalVariables.brownColor,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  maxLength: 1,
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: isDarkMode ? Colors.white : Colors.black87,
                  ),
                  decoration: InputDecoration(
                    counterText: '',
                    contentPadding: EdgeInsets.zero,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: _isError 
                          ? theme.colorScheme.error 
                          : isDarkMode ? Colors.grey[600]! : Colors.grey[400]!,
                        width: 2,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: _isError 
                          ? theme.colorScheme.error 
                          : ColorGlobalVariables.brownColor!,
                        width: 2,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: theme.colorScheme.error,
                        width: 2,
                      ),
                    ),
                    filled: true,
                    fillColor: isDarkMode 
                      ? const Color(0xFF2D2D2D)
                      : Colors.white,
                  ),
                  onChanged: (value) => _onOTPChanged(index, value),
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                ),
              ).animate().fadeIn(delay: (400 + (index * 100)).ms).slideY(begin: 0.3);
            }),
          ),
        ),
      ],
    );
  }

  Widget _buildErrorSection(ThemeData theme, bool isDarkMode) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDarkMode ? Colors.red.withOpacity(0.1) : Colors.red.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isDarkMode ? Colors.red.withOpacity(0.3) : Colors.red.shade200,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline,
            color: theme.colorScheme.error,
            size: 20,
          ),
          const SizedBox(width: 12),
          Flexible(
            child: Text(
              _errorMessage ?? 'Invalid OTP. Please try again.',
              style: TextStyle(
                color: theme.colorScheme.error,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(width: 12),
          GestureDetector(
            onTap: _clearAllFields,
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: Text(
                'Clear',
                style: TextStyle(
                  color: ColorGlobalVariables.brownColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    ).animate().shakeX(duration: 600.ms).fadeIn();
  }

  Widget _buildVerifyButton(ThemeData theme) {
    return SizedBox(
      width: double.infinity,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        child: FilledButton(
          onPressed: _isLoading ? null : _verifyOTP,
          style: FilledButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 18),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            backgroundColor: ColorGlobalVariables.brownColor,
            foregroundColor: Colors.white,
          ),
          child: _isLoading
              ? const SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Colors.white,
                  ),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (_isAutoFilling) ...[
                      Icon(Icons.auto_awesome, size: 20),
                      const SizedBox(width: 8),
                    ],
                    Text(
                      _isAutoFilling ? 'Verifying...' : 'Verify OTP',
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    ).animate().fadeIn(delay: 800.ms).slideY(begin: 0.5);
  }

  Widget _buildResendSection(ThemeData theme, bool isDarkMode) {
    return Center(
      child: Column(
        children: [
          Text(
            "Didn't receive code?",
            style: theme.textTheme.bodyMedium?.copyWith(
              color: isDarkMode ? Colors.white70 : Colors.black54,
            ),
          ),
          const SizedBox(height: 8),
          GestureDetector(
            onTap: _canResend ? _resendOTP : null,
            child: MouseRegion(
              cursor: _canResend ? SystemMouseCursors.click : SystemMouseCursors.basic,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                decoration: BoxDecoration(
                  color: _canResend 
                      ? ColorGlobalVariables.brownColor
                      : Colors.grey,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: _canResend
                      ? [
                          BoxShadow(
                            color: ColorGlobalVariables.brownColor!.withOpacity(0.3),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ]
                      : null,
                ),
                child: _isResending
                    ? Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Text(
                            'Resending...',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      )
                    : Text(
                        _canResend ? 'Resend Code' : 'Wait $_remainingSeconds seconds',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}