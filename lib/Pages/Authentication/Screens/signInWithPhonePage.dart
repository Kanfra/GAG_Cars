import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/Text/textExtraSmall.dart';
import 'package:gag_cars_frontend/GlobalVariables/colorGlobalVariables.dart';
import 'package:gag_cars_frontend/Routes/routeClass.dart';
import 'package:gag_cars_frontend/GeneralComponents/KwekuComponents/buttons/custom_button.dart';
import 'package:gag_cars_frontend/GeneralComponents/KwekuComponents/inputs/app_icons.dart' show AppIcons;
import 'package:gag_cars_frontend/GeneralComponents/KwekuComponents/inputs/country_code_text_field.dart';
import 'package:gag_cars_frontend/Utils/WidgetUtils/widgetUtils.dart';
import 'package:get/get.dart';

class SignInWithPhonePage extends StatefulWidget {
  final Map<String, dynamic> allJson;
  const SignInWithPhonePage({
    super.key,
    required this.allJson,
  });

  @override
  State<SignInWithPhonePage> createState() => _SignInWithPhonePageState();
}

class _SignInWithPhonePageState extends State<SignInWithPhonePage> with SingleTickerProviderStateMixin {
  final TextEditingController _phoneController = TextEditingController();
  bool _isLoading = false;
  String? _errorMessage;
  String _countryCode = "+233"; // default to Ghana code
  
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _slideAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _initAnimations();
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

    _slideAnimation = Tween<double>(begin: 50.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.2, 0.8, curve: Curves.easeOutCubic),
      ),
    );

    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.4, 1.0, curve: Curves.elasticOut),
      ),
    );

    _animationController.forward();
  }

  Future<void> _handleSignIn() async {
    // validate phone number
    if (_phoneController.text.isEmpty) {
      setState(() => _errorMessage = "Please enter your phone number");
      _shakeErrorAnimation();
      return;
    }

    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      // full phone number with country code
      final _fullPhoneNumber = "$_countryCode${_phoneController.text}";
      
      // Add success animation before navigation
      await _successAnimation();
      
      Get.offNamed(
        RouteClass.getVerifyCodePage(),
        arguments: {
          'phone': _fullPhoneNumber,
          'isSignIn': true, // to distinguish between sign up and login
        },
      );
    } catch (e) {
      setState(() => _errorMessage = e.toString());
      showCustomSnackBar(
        message: "Error $_errorMessage",
      );
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  void _shakeErrorAnimation() {
    _animationController.animateBack(0.1, duration: const Duration(milliseconds: 100))
        .then((_) => _animationController.forward());
  }

  Future<void> _successAnimation() async {
    await _animationController.animateTo(
      1.2,
      duration: const Duration(milliseconds: 300),
    );
    await _animationController.animateBack(
      1.0,
      duration: const Duration(milliseconds: 200),
    );
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

  void _onSocialAuthTap(String platform) {
    // Add tap animation for social auth buttons
    _animationController.animateBack(0.9, duration: const Duration(milliseconds: 100))
        .then((_) => _animationController.forward());
  }

  @override
  void dispose() {
    _animationController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Logo with bounce animation
                          Transform.translate(
                            offset: Offset(0, -_slideAnimation.value * 0.5),
                            child: Image.asset(
                              AppIcons.gag_logo_red,
                              width: 210,
                            ),
                          ),
                          
                          const SizedBox(height: 30),
                          
                          // Title section with slide animation
                          Transform.translate(
                            offset: Offset(-_slideAnimation.value, 0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Sign In",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                          color: theme.textTheme.titleLarge?.color,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        'Enter your phone number. We will send SMS to verify your number',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                          color: theme.textTheme.bodyMedium?.color,
                                        ),
                                      ),
                                      if (_errorMessage != null)
                                        Padding(
                                          padding: const EdgeInsets.only(top: 8),
                                          child: AnimatedSwitcher(
                                            duration: const Duration(milliseconds: 300),
                                            child: TextExtraSmall(
                                              key: ValueKey(_errorMessage),
                                              title: _errorMessage!,
                                              textColor: ColorGlobalVariables.redColor,
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          
                          const SizedBox(height: 20),
                          
                          // Phone input with slide animation
                          Transform.translate(
                            offset: Offset(_slideAnimation.value, 0),
                            child: CountryCodeTextField(
                              controller: _phoneController,
                              onCountryChanged: _onCountryChanged,
                              hintText: "552058723",
                              onPhoneNumberChanged: (value) {
                                // clear error when user types
                                if (_errorMessage != null && value.isNotEmpty) {
                                  setState(() => _errorMessage = null);
                                }
                              },
                            ),
                          ),
                          
                          const SizedBox(height: 14),
                          const SizedBox(height: 20),
                          
                          // Sign In button with scale animation
                          Transform.translate(
                            offset: Offset(0, _slideAnimation.value),
                            child: CustomButton(
                              buttonName: 'Sign In',
                              onPressed: _handleSignIn,
                              isLoading: _isLoading,
                            ),
                          ),
                          
                          const SizedBox(height: 20),
                          
                          // Divider with fade animation
                          FadeTransition(
                            opacity: _fadeAnimation,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Divider(
                                    color: isDark
                                        ? const Color(0xFF616161) // grey[700]
                                        : const Color.fromRGBO(196, 196, 196, 1),
                                    thickness: 1,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                                  child: Text(
                                    'OR',
                                    style: TextStyle(
                                      color: isDark
                                          ? const Color(0xB3FFFFFF) // white70
                                          : const Color.fromRGBO(196, 196, 196, 1),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Divider(
                                    color: isDark
                                        ? const Color(0xFF616161) // grey[700]
                                        : const Color.fromRGBO(196, 196, 196, 1),
                                    thickness: 1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          
                          const SizedBox(height: 14),
                          
                          // Social auth title with fade animation
                          FadeTransition(
                            opacity: _fadeAnimation,
                            child: Text(
                              "Sign In with",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: isDark
                                    ? const Color(0xFFFFFFFF) // white
                                    : const Color.fromRGBO(159, 16, 16, 1),
                              ),
                            ),
                          ),
                          
                          const SizedBox(height: 14),
                          
                          // Social auth buttons with stagger animation
                          SizedBox(
                            width: 200,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // _buildSocialAuthButton(
                                //   AppIcons.facebook,
                                //   'Facebook',
                                //   () => _onSocialAuthTap('facebook'),
                                //   delay: 0,
                                // ),
                                // _buildSocialAuthButton(
                                //   AppIcons.apple_logo,
                                //   'Apple',
                                //   () => _onSocialAuthTap('apple'),
                                //   delay: 100,
                                // ),
                                // _buildSocialAuthButton(
                                //   AppIcons.google_logo,
                                //   'Google',
                                //   () => _onSocialAuthTap('google'),
                                //   delay: 200,
                                // ),
                                _buildSocialAuthButton(
                                  AppIcons.email_logo,
                                  'Email',
                                  () {
                                    _onSocialAuthTap('email');
                                    Get.offNamed(RouteClass.getSignInWithEmailPage());
                                  },
                                  delay: 300,
                                ),
                              ].map((widget) => Expanded(child: widget)).toList(),
                            ),
                          ),
                          
                          const SizedBox(height: 30),
                          
                          // Sign up link with fade animation
                          FadeTransition(
                            opacity: _fadeAnimation,
                            child: GestureDetector(
                              onTap: () {
                                Get.offNamed(RouteClass.getSignUpWithEmailPage());
                              },
                              child: MouseRegion(
                                cursor: SystemMouseCursors.click,
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 200),
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    color: Colors.transparent,
                                  ),
                                  child: RichText(
                                    text: TextSpan(
                                      text: "Don't have an account? ",
                                      style: TextStyle(
                                        color: isDark
                                            ? const Color(0xB3FFFFFF) // white70
                                            : Colors.black87,
                                        fontSize: 16,
                                      ),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: 'Sign Up',
                                          style: TextStyle(
                                            color: isDark
                                                ? const Color(0xFFFFFFFF) // white
                                                : const Color.fromRGBO(159, 16, 16, 1),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSocialAuthButton(String icon, String tooltip, VoidCallback onTap, {int delay = 0}) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500 + delay),
      curve: Curves.elasticOut,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      child: Tooltip(
        message: tooltip,
        child: GestureDetector(
          onTap: onTap,
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.transparent,
              ),
              child: Image.asset(
                icon,
                width: 24,
                height: 24,
              ),
            ),
          ),
        ),
      ),
    );
  }
}