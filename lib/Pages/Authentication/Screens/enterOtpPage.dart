import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gag_cars_frontend/GlobalVariables/colorGlobalVariables.dart';
import 'package:gag_cars_frontend/Pages/Authentication/Providers/userProvider.dart';
import 'package:gag_cars_frontend/Pages/Authentication/Services/authService.dart';
import 'package:gag_cars_frontend/Routes/routeClass.dart';
import 'package:gag_cars_frontend/Utils/WidgetUtils/widgetUtils.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
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

class _EnterOtpPageState extends State<EnterOtpPage> {
  final List<TextEditingController> _otpControllers = List.generate(6, (index) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(6, (index) => FocusNode());
  bool _isLoading = false;
  bool _isError = false;
  String? _errorMessage;
  bool _isResending = false;
  bool _isAutoFilling = false;
  final logger = Logger();
  
  @override
  void initState() {
    super.initState();
    // Auto-focus first field
    _focusNodes[0].requestFocus();
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
    if (_isResending) return;

    setState(() {
      _isResending = true;
    });

    try {
      await AuthService.sendPasswordResetEmail(
        phone: widget.allJson['phone'],
        email: widget.allJson['email'],
      );

      // Clear all fields
      for (var controller in _otpControllers) {
        controller.clear();
      }
      _focusNodes[0].requestFocus();

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
      backgroundColor: isDarkMode ? Colors.grey[900] : Colors.grey[50],
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back button
              IconButton(
                icon: Icon(Icons.arrow_back, color: ColorGlobalVariables.blackColor),
                onPressed: () => Navigator.pop(context),
              ).animate().fadeIn().slideX(),

              const SizedBox(height: 20),

              // Title
              Text(
                'Verify OTP',
                style: theme.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.onBackground,
                ),
              ).animate().fadeIn(delay: 100.ms).slideY(),

              const SizedBox(height: 8),

              // Subtitle
              RichText(
                text: TextSpan(
                  text: 'Enter the 6-digit code sent to ',
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: theme.colorScheme.onBackground.withOpacity(0.7),
                  ),
                  children: [
                    TextSpan(
                      text: widget.allJson['email'],
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: ' and ',
                    ),
                    TextSpan(
                      text: widget.allJson['phone'],
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ).animate().fadeIn(delay: 200.ms).slideY(),

              // Auto-fill info card
              const SizedBox(height: 16),
              _buildAutoFillInfoCard(),

              const SizedBox(height: 40),

              // OTP Input Fields with Paste button
              _buildOTPInputSection(theme, isDarkMode),

              if (_isError) ...[
                const SizedBox(height: 20),
                _buildErrorSection(theme),
              ],

              const SizedBox(height: 40),

              // Verify Button
              _buildVerifyButton(theme),

              const SizedBox(height: 20),

              // Resend OTP
              _buildResendSection(theme),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAutoFillInfoCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.blue.shade100),
      ),
      child: Row(
        children: [
          Icon(
            Icons.auto_awesome_motion,
            color: Colors.blue.shade600,
            size: 20,
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
                    color: Colors.blue.shade800,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Use the paste button or we\'ll auto-detect OTP from clipboard',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.blue.shade700,
                  ),
                ),
              ],
            ),
          ),
          if (_isAutoFilling) ...[
            const SizedBox(width: 8),
            SizedBox(
              width: 16,
              height: 16,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue.shade600),
              ),
            ),
          ],
        ],
      ),
    ).animate().fadeIn(delay: 250.ms).slideY();
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
              ),
            ),
            TextButton.icon(
              onPressed: _pasteFromClipboard,
              icon: Icon(
                Icons.paste,
                size: 18,
                color: ColorGlobalVariables.brownColor,
              ),
              label: Text(
                'Paste',
                style: TextStyle(
                  color: ColorGlobalVariables.brownColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(6, (index) {
              return SizedBox(
                width: 50,
                height: 60,
                child: TextField(
                  controller: _otpControllers[index],
                  focusNode: _focusNodes[index],
                  cursorColor: ColorGlobalVariables.brownColor,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  maxLength: 1,
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: InputDecoration(
                    counterText: '',
                    contentPadding: EdgeInsets.zero,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: _isError 
                          ? theme.colorScheme.error 
                          : theme.colorScheme.outline.withOpacity(0.3),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: _isError 
                          ? theme.colorScheme.error 
                          : ColorGlobalVariables.brownColor,
                        width: 2,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: theme.colorScheme.error,
                      ),
                    ),
                    filled: true,
                    fillColor: isDarkMode 
                      ? Colors.grey[800]!.withOpacity(0.5) 
                      : Colors.white,
                  ),
                  onChanged: (value) => _onOTPChanged(index, value),
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                ),
              ).animate().fadeIn(delay: (300 + (index * 100)).ms).slideY();
            }),
          ),
        ),
      ],
    );
  }

  Widget _buildErrorSection(ThemeData theme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.error_outline,
          color: theme.colorScheme.error,
          size: 20,
        ),
        const SizedBox(width: 8),
        Flexible(
          child: Text(
            _errorMessage ?? 'Invalid OTP. Please try again.',
            style: TextStyle(color: theme.colorScheme.error),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(width: 8),
        GestureDetector(
          onTap: _clearAllFields,
          child: Text(
            'Clear',
            style: TextStyle(
              color: ColorGlobalVariables.brownColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    ).animate().shake().fadeIn();
  }

  Widget _buildVerifyButton(ThemeData theme) {
    return SizedBox(
      width: double.infinity,
      child: FilledButton(
        onPressed: _isLoading ? null : _verifyOTP,
        style: FilledButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          backgroundColor: ColorGlobalVariables.brownColor,
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
                    SizedBox(width: 8),
                  ],
                  Text(
                    _isAutoFilling ? 'Verifying...' : 'Verify',
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
      ),
    ).animate().fadeIn(delay: 900.ms).slideY();
  }

  Widget _buildResendSection(ThemeData theme) {
    return Center(
      child: TextButton(
        onPressed: _isResending ? null : _resendOTP,
        child: _isResending
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      color: ColorGlobalVariables.brownColor,
                      strokeWidth: 2,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Resending...',
                    style: TextStyle(
                      color: ColorGlobalVariables.brownColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              )
            : RichText(
                text: TextSpan(
                  text: "Didn't receive code? ",
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onBackground.withOpacity(0.7),
                  ),
                  children: [
                    TextSpan(
                      text: 'Resend',
                      style: TextStyle(
                        color: ColorGlobalVariables.brownColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
      ),
    ).animate().fadeIn(delay: 1000.ms).slideY();
  }
}