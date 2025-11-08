import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:gag_cars_frontend/GeneralComponents/KwekuComponents/inputs/country_code_text_field.dart';
import 'package:gag_cars_frontend/GlobalVariables/colorGlobalVariables.dart';
import 'package:gag_cars_frontend/Pages/Authentication/Services/authService.dart';
import 'package:gag_cars_frontend/Routes/routeClass.dart';
import 'package:gag_cars_frontend/GeneralComponents/KwekuComponents/buttons/custom_button.dart';
import 'package:gag_cars_frontend/GeneralComponents/KwekuComponents/inputs/app_icons.dart';
import 'package:gag_cars_frontend/GeneralComponents/KwekuComponents/inputs/custom_text_field.dart';
import 'package:gag_cars_frontend/Utils/WidgetUtils/widgetUtils.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class SignUpWithEmailPage extends StatefulWidget {
  const SignUpWithEmailPage({super.key});

  @override
  State<SignUpWithEmailPage> createState() => _SignUpWithEmailPageState();
}

class _SignUpWithEmailPageState extends State<SignUpWithEmailPage> with SingleTickerProviderStateMixin {
  final logger = Logger();

  // form validation
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _isLoading = false;
  String? _errorMessage;
  String _countryCode = "+233";
  String _fullPhoneNumber = "";
  String _token = "";
  bool obscureText = true;

  // Animation controllers
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _slideAnimation;
  late Animation<double> _scaleAnimation;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

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

  void _onSocialAuthTap(String platform) {
    _animationController.animateBack(0.95, duration: const Duration(milliseconds: 100))
        .then((_) => _animationController.forward());
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

  Future<void> _signUp() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);
      _fullPhoneNumber = "$_countryCode${phoneController.text}";
      try {
        final user = await AuthService.signUpWithEmail(
          name: nameController.text, 
          email: emailController.text, 
          password: passwordController.text,
          phone: _fullPhoneNumber,
        );

        if (context.mounted) {
          await _successAnimation();
          // navigate to verifyCodePage
          Get.offNamed(
            RouteClass.getVerifyCodePage(),
            arguments: {
              'phone': user?.user.phoneNumber,
              'email': user?.user.email,
              'isSignUp': true
            }
          );
        }
      } catch (e) {
        if (context.mounted) {
          logger.e("Error, ${e.toString()}");
          showCustomSnackBar(
            context: context,
            message: "Error, ${e.toString()}"
          );
        }
      } finally {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: Form(
          key: _formKey,
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
                            
                            const SizedBox(height: 20),
                            
                            // Title section with slide animation
                            Transform.translate(
                              offset: Offset(-_slideAnimation.value, 0),
                              child: Column(
                                children: [
                                  Text(
                                    "Sign Up",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: theme.textTheme.titleLarge?.color,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    "Buy or sell your car!",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: theme.textTheme.bodyMedium?.color,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            
                            const SizedBox(height: 20),
                            
                            // Form fields with staggered animation
                            _buildAnimatedFormField(
                              child: CustomTextField(
                                controller: nameController,
                                hintText: "Full Name", 
                                prefixImage: AppIcons.profile_icon,
                                onChanged: (value) => {},
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Please enter your name";
                                  }
                                  return null;
                                },
                              ),
                              index: 0,
                            ),
                            
                            const SizedBox(height: 14),
                            
                            _buildAnimatedFormField(
                              child: CustomTextField(
                                controller: emailController,
                                hintText: "Email address", 
                                prefixImage: AppIcons.email_icon,
                                onChanged: (value) => {},
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Please enter your email";
                                  }
                                  if (!GetUtils.isEmail(value)) {
                                    return "Please enter a valid email";
                                  }
                                  return null;
                                },
                              ),
                              index: 1,
                            ),
                            
                            const SizedBox(height: 14),
                            
                            _buildAnimatedFormField(
                              child: CountryCodeTextField(
                                controller: phoneController,
                                onCountryChanged: _onCountryChanged,
                                onPhoneNumberChanged: (value) {
                                  if (_errorMessage != null && value.isNotEmpty) {
                                    setState(() => _errorMessage = null);
                                  }
                                },
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your phone number';
                                  }
                                  if (!_isValidPhoneNumber(value)) {
                                    return 'Please enter a valid phone number (9-15 digits)';
                                  }
                                  return null;
                                },
                              ),
                              index: 2,
                            ),
                            
                            const SizedBox(height: 14),
                            
                            _buildAnimatedFormField(
                              child: CustomTextField(
                                controller: passwordController,
                                hintText: "Password", 
                                obscureText: obscureText,
                                suffixIcon: obscureText ? Icons.visibility_off : Icons.visibility,
                                prefixImage: AppIcons.lock_icon,
                                onChanged: (value) => {},
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Please enter password";
                                  }
                                  if (value.length < 8) {
                                    return "Password must be at least 8 characters";
                                  }
                                  return null;
                                },
                                onSuffixIconPressed: () {
                                  setState(() {
                                    obscureText = !obscureText;
                                  });
                                },
                              ),
                              index: 3,
                            ),
                            
                            const SizedBox(height: 14),
                            
                            _buildAnimatedFormField(
                              child: CustomTextField(
                                controller: confirmPasswordController,
                                hintText: "Repeat Password",
                                suffixIcon: obscureText ? Icons.visibility_off : Icons.visibility,
                                obscureText: obscureText,
                                prefixImage: AppIcons.lock_icon,
                                onChanged: (value) => {},
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Please confirm password";
                                  }
                                  if (value != passwordController.text) {
                                    return "Passwords don't match";
                                  }
                                  return null;
                                },
                                onSuffixIconPressed: () {
                                  setState(() {
                                    obscureText = !obscureText;
                                  });
                                },
                              ),
                              index: 4,
                            ),
                            
                            const SizedBox(height: 20),
                            
                            // Sign Up button with scale animation
                            Transform.translate(
                              offset: Offset(0, _slideAnimation.value),
                              child: CustomButton(
                                isLoading: _isLoading,
                                buttonName: 'Sign Up', 
                                onPressed: _signUp,
                              ),
                            ),
                            
                            const SizedBox(height: 30),
                            
                            // Divider with fade animation
                            // FadeTransition(
                            //   opacity: _fadeAnimation,
                            //   child: Row(
                            //     children: [
                            //       Expanded(
                            //         child: Divider(
                            //           color: isDark
                            //               ? const Color(0xFF616161)
                            //               : const Color.fromRGBO(196, 196, 196, 1),
                            //           thickness: 1,
                            //         ),
                            //       ),
                            //       Padding(
                            //         padding: const EdgeInsets.symmetric(horizontal: 12.0),
                            //         child: Text(
                            //           'OR',
                            //           style: TextStyle(
                            //             color: isDark
                            //                 ? const Color(0xB3FFFFFF)
                            //                 : const Color.fromRGBO(196, 196, 196, 1),
                            //             fontWeight: FontWeight.w500,
                            //           ),
                            //         ),
                            //       ),
                            //       Expanded(
                            //         child: Divider(
                            //           color: isDark
                            //               ? const Color(0xFF616161)
                            //               : const Color.fromRGBO(196, 196, 196, 1),
                            //           thickness: 1,
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // ),
                            
                            // const SizedBox(height: 14),
                            
                            // // Social auth title with fade animation
                            // FadeTransition(
                            //   opacity: _fadeAnimation,
                            //   child: Text(
                            //     "Sign Up with",
                            //     style: TextStyle(
                            //       fontSize: 14,
                            //       fontWeight: FontWeight.w500,
                            //       color: isDark
                            //           ? const Color(0xFFFFFFFF)
                            //           : const Color.fromRGBO(159, 16, 16, 1),
                            //     ),
                            //   ),
                            // ),
                            
                            // const SizedBox(height: 14),
                            
                            // // Social auth buttons with stagger animation
                            // SizedBox(
                            //   width: 240,
                            //   child: Row(
                            //     mainAxisAlignment: MainAxisAlignment.center,
                            //     children: [
                            //       _buildSocialAuthButton(
                            //         AppIcons.email_logo,
                            //         'Email',
                            //         () => _onSocialAuthTap('email'),
                            //       ),
                            //     ],
                            //   ),
                            // ),
                            
                            // const SizedBox(height: 30),
                            
                            // Sign in link with fade animation
                            FadeTransition(
                              opacity: _fadeAnimation,
                              child: GestureDetector(
                                onTap: () {
                                  Get.offNamed(RouteClass.getSignInWithPhonePage());
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
                                        text: 'Already have an account? ',
                                        style: TextStyle(
                                          color: isDark
                                              ? const Color(0xB3FFFFFF)
                                              : Colors.black87,
                                          fontSize: 16,
                                        ),
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: 'Sign In',
                                            style: TextStyle(
                                              color: isDark
                                                  ? const Color(0xFFFFFFFF)
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
      ),
    );
  }

  Widget _buildAnimatedFormField({required Widget child, required int index}) {
    final delay = index * 0.1;
    final start = 0.3 + delay;
    final end = 0.8 + delay;
    
    // Ensure the interval doesn't exceed 1.0
    final adjustedEnd = end > 1.0 ? 1.0 : end;
    
    final animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(start, adjustedEnd, curve: Curves.easeOut),
      ),
    );

    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, (1 - animation.value) * 20),
          child: Opacity(
            opacity: animation.value,
            child: child,
          ),
        );
      },
      child: child,
    );
  }

  Widget _buildSocialAuthButton(String icon, String tooltip, VoidCallback onTap) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 600),
      curve: Curves.elasticOut,
      margin: const EdgeInsets.symmetric(horizontal: 2),
      child: Tooltip(
        message: tooltip,
        child: GestureDetector(
          onTap: onTap,
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.transparent,
              ),
              child: Image.asset(
                icon,
                width: 22,
                height: 22,
              ),
            ),
          ),
        ),
      ),
    );
  }
}