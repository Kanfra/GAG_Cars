import 'package:flutter/material.dart';
import 'package:gag_cars_frontend/GeneralComponents/KwekuComponents/buttons/custom_button.dart';
import 'package:gag_cars_frontend/GeneralComponents/KwekuComponents/inputs/app_icons.dart';
import 'package:gag_cars_frontend/GeneralComponents/KwekuComponents/inputs/custom_text_field.dart';
import 'package:gag_cars_frontend/GlobalVariables/colorGlobalVariables.dart';
import 'package:gag_cars_frontend/Pages/Authentication/Services/authService.dart';
import 'package:gag_cars_frontend/Routes/routeClass.dart';
import 'package:gag_cars_frontend/Utils/WidgetUtils/widgetUtils.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class ResetPasswordPage extends StatefulWidget {
  final Map<String, dynamic> allJson;
  const ResetPasswordPage({
    super.key,
    required this.allJson,
  });

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> with SingleTickerProviderStateMixin {
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  bool _isLoading = false;
  bool _obscureText1 = true;
  bool _obscureText2 = true;

  // Animation controllers
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _slideAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<double> _iconScaleAnimation;
  late Animation<Color?> _containerColorAnimation;

  // Password strength indicators
  double _passwordStrength = 0.0;
  String _passwordFeedback = '';

  @override
  void initState() {
    super.initState();
    _initAnimations();
    _newPasswordController.addListener(_checkPasswordStrength);
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

    _containerColorAnimation = ColorTween(
      begin: Colors.transparent,
      end: Colors.green.withOpacity(0.1),
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    _animationController.forward();
  }

  void _checkPasswordStrength() {
    final password = _newPasswordController.text;
    double strength = 0.0;
    String feedback = '';

    if (password.length >= 8) strength += 0.3;
    if (RegExp(r'[A-Z]').hasMatch(password)) strength += 0.2;
    if (RegExp(r'[a-z]').hasMatch(password)) strength += 0.2;
    if (RegExp(r'[0-9]').hasMatch(password)) strength += 0.2;
    if (RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(password)) strength += 0.1;

    if (password.isEmpty) {
      feedback = '';
    } else if (strength < 0.4) {
      feedback = 'Weak password';
    } else if (strength < 0.7) {
      feedback = 'Good password';
    } else {
      feedback = 'Strong password';
    }

    setState(() {
      _passwordStrength = strength;
      _passwordFeedback = feedback;
    });
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

  @override
  void dispose() {
    _animationController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _resetPassword() async {
    if (_newPasswordController.text.isEmpty || _confirmPasswordController.text.isEmpty) {
      showCustomSnackBar(
        message: 'Please fill in all fields',
        backgroundColor: ColorGlobalVariables.redColor,
        textColor: ColorGlobalVariables.whiteColor,
      );
      _errorShakeAnimation();
      return;
    }
    if (_newPasswordController.text != _confirmPasswordController.text) {
      showCustomSnackBar(
        message: 'Passwords do not match',
        backgroundColor: ColorGlobalVariables.redColor,
        textColor: ColorGlobalVariables.whiteColor,
      );
      _errorShakeAnimation();
      return;
    }

    if (_newPasswordController.text.length < 8) {
      showCustomSnackBar(
        message: 'Password must be at least 8 characters',
        backgroundColor: ColorGlobalVariables.redColor,
        textColor: ColorGlobalVariables.whiteColor,
      );
      _errorShakeAnimation();
      return;
    }
    
    setState(() => _isLoading = true);
    try {
      final logger = Logger();
      logger.w("allData: ${widget.allJson}");
      await AuthService.resetPassword( 
        phone: widget.allJson["phone"],
        email: widget.allJson["email"], 
        otp: widget.allJson["otp"],
        newPassword: _newPasswordController.text,
      );
      
      await _successAnimation();
      
      showCustomSnackBar(
        title: 'Success',
        message: 'Password reset successfully',
        backgroundColor: ColorGlobalVariables.greenColor,
        textColor: ColorGlobalVariables.whiteColor,
      );

      // navigate to login page after successful reset
      Get.offAllNamed(RouteClass.getSignInWithEmailPage());
    } on http.ClientException catch (e) {
      showCustomSnackBar(
        message: 'Error: ${e.message}',
        backgroundColor: ColorGlobalVariables.redColor,
        textColor: ColorGlobalVariables.whiteColor
      );
    } catch (e) {
      showCustomSnackBar(
        message: 'Failed to reset password. Please try again',
        backgroundColor: ColorGlobalVariables.redColor,
        textColor: ColorGlobalVariables.whiteColor,
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Color _getPasswordStrengthColor() {
    if (_passwordStrength < 0.4) return Colors.red;
    if (_passwordStrength < 0.7) return Colors.orange;
    return Colors.green;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? const Color(0xFF121212) : Colors.white,
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
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Lock Icon with scale animation
                              ScaleTransition(
                                scale: _iconScaleAnimation,
                                child: Container(
                                  width: 120,
                                  height: 120,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        (ColorGlobalVariables.brownColor ?? const Color(0xFF8B4513)).withOpacity(0.2),
                                        (ColorGlobalVariables.brownColor ?? const Color(0xFF8B4513)).withOpacity(0.1),
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                        color: (ColorGlobalVariables.brownColor ?? const Color(0xFF8B4513)).withOpacity(0.3),
                                        blurRadius: 20,
                                        spreadRadius: 2,
                                      ),
                                    ],
                                  ),
                                  child: Icon(
                                    Icons.lock_reset_rounded,
                                    size: 50,
                                    color: ColorGlobalVariables.brownColor ?? const Color(0xFF8B4513),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 40),
                              
                              // Title with slide animation
                              Transform.translate(
                                offset: Offset(-_slideAnimation.value, 0),
                                child: Text(
                                  'Create New Password',
                                  style: TextStyle(
                                    fontSize: 32,
                                    fontWeight: FontWeight.w700,
                                    color: isDark ? Colors.white : Colors.black87,
                                    letterSpacing: -0.5,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              
                              const SizedBox(height: 16),
                              
                              // Subtitle with slide animation
                              Transform.translate(
                                offset: Offset(_slideAnimation.value, 0),
                                child: Text(
                                  'Create a strong and secure password to protect your account',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: isDark ? Colors.white70 : const Color.fromRGBO(0, 0, 0, 0.6),
                                    height: 1.5,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              
                              const SizedBox(height: 40),
                              
                              // Input Section Container
                              Container(
                                padding: const EdgeInsets.all(24),
                                decoration: BoxDecoration(
                                  color: isDark ? const Color(0xFF1E1E1E) : Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      color: isDark ? Colors.black.withOpacity(0.4) : Colors.grey.withOpacity(0.1),
                                      blurRadius: 30,
                                      offset: const Offset(0, 10),
                                    ),
                                  ],
                                  border: Border.all(
                                    color: isDark ? const Color(0xFF333333) : Colors.grey.shade100,
                                    width: 1,
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    // New password field
                                    _buildPasswordField(
                                      controller: _newPasswordController,
                                      hintText: 'New Password',
                                      obscureText: _obscureText1,
                                      onToggle: () => setState(() => _obscureText1 = !_obscureText1),
                                      isFirst: true,
                                    ),
                                    
                                    // Password strength indicator
                                    if (_newPasswordController.text.isNotEmpty) ...[
                                      const SizedBox(height: 16),
                                      _buildPasswordStrengthIndicator(isDark),
                                    ],
                                    
                                    const SizedBox(height: 20),
                                    
                                    // Confirm password field
                                    _buildPasswordField(
                                      controller: _confirmPasswordController,
                                      hintText: 'Confirm Password',
                                      obscureText: _obscureText2,
                                      onToggle: () => setState(() => _obscureText2 = !_obscureText2),
                                      isFirst: false,
                                    ),
                                    
                                    // Password match indicator
                                    if (_confirmPasswordController.text.isNotEmpty && _newPasswordController.text.isNotEmpty) ...[
                                      const SizedBox(height: 16),
                                      _buildPasswordMatchIndicator(isDark),
                                    ],
                                  ],
                                ),
                              ),
                              
                              const SizedBox(height: 40),
                              
                              // Reset Button with scale animation
                              Transform.translate(
                                offset: Offset(0, _slideAnimation.value * 0.5),
                                child: CustomButton(
                                  buttonName: 'Reset Password',
                                  onPressed: _resetPassword, 
                                  isLoading: _isLoading,
                                ),
                              ),
                              
                              const SizedBox(height: 20),
                              
                              // Security Tips
                              _buildSecurityTips(isDark),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              
              // Back Button with fade animation
              Positioned(
                top: 60,
                left: 0,
                child: FadeTransition(
                  opacity: _fadeAnimation,
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: isDark ? const Color(0xFF2D2D2D) : Colors.grey.shade100,
                          shape: BoxShape.circle,
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
      ),
    );
  }

  Widget _buildPasswordField({
    required TextEditingController controller,
    required String hintText,
    required bool obscureText,
    required VoidCallback onToggle,
    required bool isFirst,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          hintText,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: isDark ? Colors.white : Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        CustomTextField(
          controller: controller,
          hintText: hintText, 
          prefixImage: AppIcons.lock_icon,
          textInputType: TextInputType.visiblePassword,
          obscureText: obscureText,
          suffixIcon: obscureText ? Icons.visibility_rounded : Icons.visibility_off_rounded,
          onSuffixIconPressed: onToggle,
        ),
      ],
    );
  }

  Widget _buildPasswordStrengthIndicator(bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Password Strength',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: isDark ? Colors.white70 : Colors.grey.shade600,
              ),
            ),
            Text(
              _passwordFeedback,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: _getPasswordStrengthColor(),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Container(
          height: 6,
          decoration: BoxDecoration(
            color: isDark ? Colors.grey.shade800 : Colors.grey.shade300,
            borderRadius: BorderRadius.circular(3),
          ),
          child: AnimatedFractionallySizedBox(
            duration: const Duration(milliseconds: 300),
            widthFactor: _passwordStrength,
            alignment: Alignment.centerLeft,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    _getPasswordStrengthColor(),
                    _getPasswordStrengthColor().withOpacity(0.7),
                  ],
                ),
                borderRadius: BorderRadius.circular(3),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordMatchIndicator(bool isDark) {
    final passwordsMatch = _newPasswordController.text == _confirmPasswordController.text;
    final isNotEmpty = _confirmPasswordController.text.isNotEmpty;
    
    return Row(
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            color: isNotEmpty 
                ? (passwordsMatch ? Colors.green : Colors.red)
                : Colors.transparent,
            shape: BoxShape.circle,
            border: Border.all(
              color: isNotEmpty 
                  ? (passwordsMatch ? Colors.green : Colors.red)
                  : Colors.grey.shade400,
            ),
          ),
          child: isNotEmpty
              ? Icon(
                  passwordsMatch ? Icons.check_rounded : Icons.close_rounded,
                  size: 14,
                  color: Colors.white,
                )
              : null,
        ),
        const SizedBox(width: 12),
        Text(
          isNotEmpty
              ? (passwordsMatch ? 'Passwords match' : 'Passwords do not match')
              : 'Confirm your password',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: isNotEmpty
                ? (passwordsMatch ? Colors.green : Colors.red)
                : (isDark ? Colors.white70 : Colors.grey.shade600),
          ),
        ),
      ],
    );
  }

  Widget _buildSecurityTips(bool isDark) {
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
              Icons.security_rounded,
              color: isDark ? const Color(0xFF64B5F6) : Colors.blue.shade600,
              size: 20,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Security Tips',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: isDark ? const Color(0xFFE3F2FD) : Colors.blue.shade800,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Use at least 8 characters with a mix of letters, numbers, and symbols for better security.',
                    style: TextStyle(
                      fontSize: 12,
                      color: isDark ? const Color(0xFFBBDEFB) : Colors.blue.shade700,
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AnimatedFractionallySizedBox extends ImplicitlyAnimatedWidget {
  final double widthFactor;
  final Alignment alignment;
  final Widget? child;

  const AnimatedFractionallySizedBox({
    super.key,
    required this.widthFactor,
    required this.alignment,
    this.child,
    super.duration = const Duration(milliseconds: 300),
    super.curve = Curves.easeInOut,
  });

  @override
  ImplicitlyAnimatedWidgetState<ImplicitlyAnimatedWidget> createState() => _AnimatedFractionallySizedBoxState();
}

class _AnimatedFractionallySizedBoxState extends AnimatedWidgetBaseState<AnimatedFractionallySizedBox> {
  Tween<double>? _widthFactor;

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _widthFactor = visitor(
      _widthFactor,
      widget.widthFactor,
      (dynamic value) => Tween<double>(begin: value as double),
    ) as Tween<double>?;
  }

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: _widthFactor?.evaluate(animation) ?? 0.0,
      alignment: widget.alignment,
      child: widget.child,
    );
  }
}