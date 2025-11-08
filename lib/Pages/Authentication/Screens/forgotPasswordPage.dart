import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/IconButtons/customRoundIconButton.dart';
import 'package:gag_cars_frontend/GeneralComponents/KwekuComponents/buttons/custom_button.dart';
import 'package:gag_cars_frontend/GeneralComponents/KwekuComponents/inputs/app_icons.dart';
import 'package:gag_cars_frontend/GeneralComponents/KwekuComponents/inputs/country_code_text_field.dart';
import 'package:gag_cars_frontend/GeneralComponents/KwekuComponents/inputs/custom_text_field.dart';
import 'package:gag_cars_frontend/GlobalVariables/colorGlobalVariables.dart';
import 'package:gag_cars_frontend/Pages/Authentication/Services/authService.dart';
import 'package:gag_cars_frontend/Routes/routeClass.dart';
import 'package:gag_cars_frontend/Utils/WidgetUtils/widgetUtils.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> with SingleTickerProviderStateMixin {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  bool _isLoading = false;
  final logger = Logger();
  String? _errorMessage;
  String _countryCode = "+233"; // default to Ghana code
  
  // Animation controllers
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _slideAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<double> _iconScaleAnimation;
  
  // Form key for validation
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _initAnimations();
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

    _iconScaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.1, 0.5, curve: Curves.elasticOut),
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

  Future<void> _handlePasswordReset() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    // Validate phone number
    if (_phoneController.text.isEmpty) {
      setState(() => _errorMessage = "Please enter your phone number");
      return;
    }

    final email = _emailController.text.trim();
    // Combine country code with phone number
    final fullPhoneNumber = "$_countryCode${_phoneController.text}";

    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      await AuthService.sendPasswordResetEmail(
        phone: fullPhoneNumber,
        email: email,
      );
      
      logger.i("SendPasswordResetEmail done.. now show snackbar");
      
      await _successAnimation();
      
      showCustomSnackBar(
        title: "Success",
        message: 'Password reset instructions sent to your email and phone',
        backgroundColor: ColorGlobalVariables.greenColor,
        textColor: ColorGlobalVariables.whiteColor,
      );
      
      // Navigate to the enter OTP page
      Get.toNamed(
        RouteClass.getEnterOtpPage(),
        arguments: {
          'email': email, 
          'phone': fullPhoneNumber,
        },
      );
    } catch (e) {
      String errorMessage = "An error occurred";
      if (e is FormatException) {
        errorMessage = e.message;
      } else if (e is http.ClientException) {
        errorMessage = e.message;
      } else {
        errorMessage = "Failed to send reset instructions";
      }

      showCustomSnackBar(
        title: "Error",
        message: errorMessage,
        backgroundColor: ColorGlobalVariables.redColor,
        textColor: ColorGlobalVariables.whiteColor,
      );
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email address';
    }
    if (!value.isEmail) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  bool _isValidPhoneNumber(String phone) {
    final phoneRegex = RegExp(r'^[0-9]{9,15}$');
    return phoneRegex.hasMatch(phone);
  }

  void _onCountryChanged(Country country) {
    setState(() {
      _countryCode = "+${country.phoneCode}";
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Stack(
            children: [
              Center(
                child: SingleChildScrollView(
                  child: AnimatedBuilder(
                    animation: _animationController,
                    builder: (context, child) {
                      return Transform(
                        transform: Matrix4.identity()
                          ..scale(_scaleAnimation.value),
                        alignment: Alignment.center,
                        child: Opacity(
                          opacity: _fadeAnimation.value,
                          child: Form(
                            key: _formKey,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // Header Section with Icon
                                _buildHeaderSection(isDark),
                                const SizedBox(height: 40),
                                
                                // Input Fields Section
                                Transform.translate(
                                  offset: Offset(0, _slideAnimation.value),
                                  child: _buildInputSection(isDark),
                                ),
                                const SizedBox(height: 40),

                                // Reset Button
                                Transform.translate(
                                  offset: Offset(0, _slideAnimation.value * 0.5),
                                  child: _buildResetButton(isDark),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              
              // Back Button
              Positioned(
                top: 60,
                child: FadeTransition(
                  opacity: _fadeAnimation,
                  child: CustomRoundIconButton(
                    iconData: Icons.arrow_back_ios,
                    isBorderSlightlyCurved: false,
                    onIconButtonClickFunction: Get.back,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderSection(bool isDark) {
    return Column(
      children: [
        // Icon Container with scale animation
        ScaleTransition(
          scale: _iconScaleAnimation,
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: (ColorGlobalVariables.brownColor ?? const Color(0xFF8B4513)).withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.lock_reset,
              size: 45,
              color: ColorGlobalVariables.brownColor ?? const Color(0xFF8B4513),
            ),
          ),
        ),
        const SizedBox(height: 24),
        
        // Title with slide animation
        Transform.translate(
          offset: Offset(-_slideAnimation.value, 0),
          child: Text(
            'Reset Your Password',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w700,
              color: isDark ? const Color(0xFFFFFFFF) : Colors.black87,
              letterSpacing: -0.5,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 12),
        
        // Description with slide animation
        Transform.translate(
          offset: Offset(_slideAnimation.value, 0),
          child: Text(
            'Enter your email and phone number to receive verification code for password reset',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: isDark ? const Color(0xB3FFFFFF) : Colors.black54,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  Widget _buildInputSection(bool isDark) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF424242) : Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: isDark
            ? [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 20,
                  offset: const Offset(0, 4),
                ),
              ]
            : [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 20,
                  offset: const Offset(0, 4),
                ),
              ],
        border: Border.all(
          color: isDark ? const Color(0xFF616161) : Colors.grey.shade100,
          width: 1,
        ),
      ),
      child: Column(
        children: [
          // Email Field with fade animation
          FadeTransition(
            opacity: _fadeAnimation,
            child: _buildEmailField(isDark),
          ),
          const SizedBox(height: 20),
          
          // Phone Field with fade animation
          FadeTransition(
            opacity: _fadeAnimation,
            child: _buildPhoneField(isDark),
          ),
        ],
      ),
    );
  }

  Widget _buildEmailField(bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Email Address',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: isDark ? const Color(0xFFFFFFFF) : Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        CustomTextField(
          controller: _emailController,
          textInputType: TextInputType.emailAddress,
          hintText: 'Enter your email address',
          prefixImage: AppIcons.email_icon,
          validator: _validateEmail,
        ),
      ],
    );
  }

  Widget _buildPhoneField(bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Phone Number',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: isDark ? const Color(0xFFFFFFFF) : Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        
        // Error message display
        if (_errorMessage != null) 
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: Padding(
              key: ValueKey(_errorMessage),
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                _errorMessage!,
                style: TextStyle(
                  color: ColorGlobalVariables.redColor,
                  fontSize: 12,
                ),
              ),
            ),
          ),
        
        // Country code text field with phone input
        CountryCodeTextField(
          controller: _phoneController,
          onCountryChanged: _onCountryChanged,
          hintText: '552018754', // Example phone number hint
          onPhoneNumberChanged: (value) {
            // Clear error when user types
            if (_errorMessage != null && value.isNotEmpty) {
              setState(() => _errorMessage = null);
            }
          },
        ),
        
        // Helper text below the phone field
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text(
            'Enter your phone number without the country code',
            style: TextStyle(
              fontSize: 12,
              color: isDark ? const Color(0xB3FFFFFF) : Colors.grey[600],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildResetButton(bool isDark) {
    return Column(
      children: [
        CustomButton(
          buttonName: 'Reset Password',
          onPressed: _handlePasswordReset,
          isLoading: _isLoading,
        ),
        const SizedBox(height: 20),
        _buildAlternativeOptions(isDark),
        const SizedBox(height: 24),
        _buildHelpText(isDark),
      ],
    );
  }

  Widget _buildAlternativeOptions(bool isDark) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Remember your password? ',
            style: TextStyle(
              fontSize: 14,
              color: isDark ? const Color(0xB3FFFFFF) : Colors.grey[600],
            ),
          ),
          GestureDetector(
            onTap: () {
              Get.back(); // Navigate back to login
            },
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                child: Text(
                  'Sign In',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: ColorGlobalVariables.brownColor ?? const Color(0xFF8B4513),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHelpText(bool isDark) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isDark ? const Color(0xFF1E3A5F) : Colors.blue.shade50,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isDark ? const Color(0xFF2D4F7C) : Colors.blue.shade100,
          ),
        ),
        child: Row(
          children: [
            Icon(
              Icons.info_outline,
              color: isDark ? const Color(0xFF64B5F6) : Colors.blue.shade600,
              size: 20,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                'We will send verification codes to both your email and phone for security. Your phone number should include the country code.',
                style: TextStyle(
                  fontSize: 12,
                  color: isDark ? const Color(0xFFE3F2FD) : Colors.blue.shade800,
                  height: 1.4,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}