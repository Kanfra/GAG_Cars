import 'package:flutter/material.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/Buttons/customTextButton.dart';
import 'package:gag_cars_frontend/GlobalVariables/colorGlobalVariables.dart';
import 'package:gag_cars_frontend/Pages/Authentication/Services/authService.dart';
import 'package:gag_cars_frontend/Routes/routeClass.dart';
import 'package:gag_cars_frontend/GeneralComponents/KwekuComponents/buttons/custom_button.dart';
import 'package:gag_cars_frontend/GeneralComponents/KwekuComponents/inputs/app_icons.dart';
import 'package:gag_cars_frontend/GeneralComponents/KwekuComponents/inputs/custom_text_field.dart';
import 'package:gag_cars_frontend/Utils/WidgetUtils/widgetUtils.dart';
import 'package:get/get.dart';

class SignInWithEmailPage extends StatefulWidget {
  const SignInWithEmailPage({super.key});

  @override
  State<SignInWithEmailPage> createState() => _SignInWithEmailPageState();
}

class _SignInWithEmailPageState extends State<SignInWithEmailPage> with SingleTickerProviderStateMixin {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;
  bool isObscurred = true;
  
  // Animation controllers
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _slideAnimation;
  late Animation<double> _scaleAnimation;
  
  // form validation
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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

  Future<void> _login() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);
      try {
        await AuthService.logInWithEmail(
          email: _emailController.text,
          password: _passwordController.text,
        );
        await _successAnimation();
        Get.offNamed(RouteClass.getMainBottomNavigationPage());
      } catch (e) {
        showCustomSnackBar(
          message: "Error, ${e.toString()}"
        );
      } finally {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
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
                                    "Login",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: theme.textTheme.titleLarge?.color,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    "Welcome to GAGcars",
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
                            
                            // Email field with animation
                            Transform.translate(
                              offset: Offset(_slideAnimation.value, 0),
                              child: CustomTextField(
                                controller: _emailController,
                                hintText: "Email address", 
                                prefixImage: AppIcons.email_icon,
                                onChanged: (value)=>{},
                                validator: (value){
                                  if(value == null || value.isEmpty){
                                    return "Please enter your email";
                                  }
                                  if(!GetUtils.isEmail(value)){
                                    return "Please enter a valid email";
                                  }
                                  return null;
                                },
                              ),
                            ),
                            
                            const SizedBox(height: 14),
                            
                            // Password field with animation
                            Transform.translate(
                              offset: Offset(-_slideAnimation.value, 0),
                              child: CustomTextField(
                                controller: _passwordController,
                                obscureText: isObscurred,
                                suffixIcon: isObscurred ? Icons.visibility : Icons.visibility_off,
                                onSuffixIconPressed: (){
                                  setState(() {
                                    isObscurred = !isObscurred;
                                  });
                                },
                                hintText: "Password", 
                                prefixImage: AppIcons.lock_icon,
                                onChanged: (value)=>{},
                                validator: (value){
                                  if(value == null || value.isEmpty){return "Please enter password";}
                                  if(value.length < 6){return "Password must be at least 6 characters";}
                                  return null;
                                },
                              ),
                            ),
                            
                            const SizedBox(height: 15),
                            
                            // Forgot password button with fade animation
                            FadeTransition(
                              opacity: _fadeAnimation,
                              child: CustomTextButton(
                                buttonTextType: 'Forgot Password?', 
                                fontWeight: FontWeight.w500,
                                borderColor: isDark ? const Color(0xFF616161) : ColorGlobalVariables.greyColor,
                                borderThickness: 0.09,
                                textTypeColor: isDark ? const Color(0xFFFFFFFF) : ColorGlobalVariables.blackColor, 
                                isFullButtonWidthRequired: false,
                                buttonBackgroundColor: Colors.transparent,
                                onClickFunction: () { 
                                  Get.toNamed(RouteClass.getForgotPasswordPage());
                                },
                              ),
                            ),
                            
                            const SizedBox(height: 20),
                            
                            // Login button with scale animation
                            Transform.translate(
                              offset: Offset(0, _slideAnimation.value),
                              child: CustomButton(
                                buttonName: 'Login', 
                                onPressed: _login, 
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
                                          ? const Color(0xFF616161)
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
                                            ? const Color(0xB3FFFFFF)
                                            : const Color.fromRGBO(196, 196, 196, 1),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Divider(
                                      color: isDark
                                          ? const Color(0xFF616161)
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
                                "Login with",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: isDark
                                      ? const Color(0xFFFFFFFF)
                                      : const Color.fromRGBO(159, 16, 16, 1),
                                ),
                              ),
                            ),
                            
                            const SizedBox(height: 14),
                            
                            // Social auth buttons with stagger animation
                            SizedBox(
                              width: 200,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
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
                                    AppIcons.phone_call_logo,
                                    'Phone',
                                    () {
                                      _onSocialAuthTap('phone');
                                      Get.offNamed(RouteClass.getSignInWithPhonePage());
                                    },
                                    delay: 300,
                                  ),
                                ],
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
                                              ? const Color(0xB3FFFFFF)
                                              : Colors.black87,
                                          fontSize: 16,
                                        ),
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: 'Sign Up',
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

  Widget _buildSocialAuthButton(String icon, String tooltip, VoidCallback onTap, {int delay = 0}) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500 + delay),
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