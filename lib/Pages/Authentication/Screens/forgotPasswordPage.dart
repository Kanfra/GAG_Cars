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

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  bool _isLoading = false;
  final logger = Logger();
  String? _errorMessage;
  String _countryCode = "+233"; // default to Ghana code
  
  // Form key for validation
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Stack(
            children: [
              Center(
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Header Section with Icon
                        _buildHeaderSection(),
                        const SizedBox(height: 40),
                        
                        // Input Fields Section
                        _buildInputSection(),
                        const SizedBox(height: 40),

                        // Reset Button
                        _buildResetButton(),
                        
                        // Additional Help Text
                        _buildHelpText(),
                      ],
                    ),
                  ),
                ),
              ),
              
              // Back Button
              Positioned(
                top: 60,
                child: CustomRoundIconButton(
                  iconData: Icons.arrow_back_ios,
                  isBorderSlightlyCurved: false,
                  onIconButtonClickFunction: Get.back,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderSection() {
    return Column(
      children: [
        // Icon Container
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: (ColorGlobalVariables.brownColor ?? const Color(0xFF8B4513)).withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.lock_reset,
            size: 40,
            color: ColorGlobalVariables.brownColor ?? const Color(0xFF8B4513),
          ),
        ),
        const SizedBox(height: 24),
        Text(
          'Reset Your Password',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w700,
            color: Colors.black87,
            letterSpacing: -0.5,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 12),
        Text(
          'Enter your email and phone number to receive verification code for password reset',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: Colors.black54,
            height: 1.5,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildInputSection() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(
          color: Colors.grey.shade100,
          width: 1,
        ),
      ),
      child: Column(
        children: [
          // Email Field
          _buildEmailField(),
          const SizedBox(height: 20),
          
          // Phone Field
          _buildPhoneField(),
        ],
      ),
    );
  }

  Widget _buildEmailField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Email Address',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
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

  Widget _buildPhoneField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Phone Number',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        
        // Error message display
        if (_errorMessage != null) 
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(
              _errorMessage!,
              style: TextStyle(
                color: ColorGlobalVariables.redColor,
                fontSize: 12,
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
              color: Colors.grey[600],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildResetButton() {
    return Column(
      children: [
        CustomButton(
          buttonName: 'Reset Password',
          onPressed: _handlePasswordReset,
          isLoading: _isLoading,
        ),
        const SizedBox(height: 20),
        _buildAlternativeOptions(),
      ],
    );
  }

  Widget _buildAlternativeOptions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Remember your password? ',
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[600],
          ),
        ),
        GestureDetector(
          onTap: () {
            Get.back(); // Navigate back to login
          },
          child: Text(
            'Sign In',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: ColorGlobalVariables.brownColor ?? const Color(0xFF8B4513),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildHelpText() {
    return Container(
      margin: const EdgeInsets.only(top: 24),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.blue.shade100,
        ),
      ),
      child: Row(
        children: [
          Icon(
            Icons.info_outline,
            color: Colors.blue.shade600,
            size: 20,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              'We will send verification codes to both your email and phone for security. Your phone number should include the country code.',
              style: TextStyle(
                fontSize: 12,
                color: Colors.blue.shade800,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}