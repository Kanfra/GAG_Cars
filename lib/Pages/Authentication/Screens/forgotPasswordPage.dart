import 'package:flutter/material.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/IconButtons/customRoundIconButton.dart';
import 'package:gag_cars_frontend/GeneralComponents/KwekuComponents/buttons/custom_button.dart';
import 'package:gag_cars_frontend/GeneralComponents/KwekuComponents/inputs/app_icons.dart' as AppIcons;
import 'package:gag_cars_frontend/GlobalVariables/colorGlobalVariables.dart';
import 'package:gag_cars_frontend/Pages/Authentication/Services/authService.dart';
import 'package:gag_cars_frontend/Pages/ProfilePages/Models/countryModel.dart';
import 'package:gag_cars_frontend/Pages/ProfilePages/Providers/countryProvider.dart';
import 'package:gag_cars_frontend/Routes/routeClass.dart';
import 'package:gag_cars_frontend/Utils/WidgetUtils/widgetUtils.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
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
  final TextEditingController _searchController = TextEditingController();
  bool _isLoading = false;
  final logger = Logger();
  String? _errorMessage;
  Country? _selectedCountry;
  bool _initializedCountries = false;
  List<Country> _filteredCountries = [];
  
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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initializeCountries();
    });
  }

  void _initializeCountries() {
    if (_initializedCountries) return;
    
    final countryProvider = Provider.of<CountryProvider>(context, listen: false);
    
    countryProvider.ensureCountriesLoaded().then((_) {
      if (_selectedCountry == null) {
        final providerCountry = countryProvider.selectedCountry;
        if (providerCountry != null) {
          setState(() {
            _selectedCountry = providerCountry;
          });
        } else {
          final ghana = countryProvider.getCountryByIso2('GH');
          if (ghana != null) {
            setState(() {
              _selectedCountry = ghana;
            });
          }
        }
      }
    });
    
    _initializedCountries = true;
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
    if (_selectedCountry == null) {
      setState(() => _errorMessage = "Please select your country");
      return;
    }

    if (_phoneController.text.isEmpty) {
      setState(() => _errorMessage = "Please enter your phone number");
      return;
    }

    if (!_isValidPhoneNumber(_phoneController.text)) {
      setState(() => _errorMessage = "Please enter a valid phone number (9-15 digits)");
      return;
    }

    final email = _emailController.text.trim();
    // Combine country code with phone number
    final fullPhoneNumber = "+${_selectedCountry!.phoneCode}${_phoneController.text}";

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

  void _showCountrySelectionDialog() {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final countryProvider = Provider.of<CountryProvider>(context, listen: false);
    
    countryProvider.ensureCountriesLoaded().then((_) {
      if (countryProvider.hasError) {
        showCustomSnackBar(
          message: countryProvider.errorMessage ?? 'Failed to load countries'
        );
        return;
      }

      final countries = countryProvider.countriesWithPopularFirst;
      _filteredCountries = countries;
      _searchController.clear();

      Get.dialog(
        Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: const EdgeInsets.all(20),
          child: Container(
            decoration: BoxDecoration(
              color: isDarkMode ? const Color(0xFF424242) : Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 30,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: ColorGlobalVariables.brownColor,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.location_on_rounded,
                        color: Colors.white,
                        size: 28,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          "Select Your Country",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.close_rounded,
                          color: Colors.white.withOpacity(0.8),
                          size: 24,
                        ),
                        onPressed: () => Get.back(),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Container(
                    decoration: BoxDecoration(
                      color: isDarkMode ? const Color(0xFF303030) : Colors.grey[50],
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: isDarkMode ? Colors.grey[700]! : Colors.grey[300]!,
                      ),
                    ),
                    child: TextField(
                      controller: _searchController,
                      style: TextStyle(
                        fontSize: 16,
                        color: isDarkMode ? Colors.white : Colors.grey[800],
                      ),
                      decoration: InputDecoration(
                        hintText: "Search countries...",
                        hintStyle: TextStyle(
                          color: isDarkMode ? Colors.white60 : Colors.grey[500],
                          fontSize: 16,
                        ),
                        border: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.search_rounded,
                          color: ColorGlobalVariables.brownColor,
                          size: 22,
                        ),
                        suffixIcon: _searchController.text.isNotEmpty
                            ? IconButton(
                                icon: Icon(
                                  Icons.clear_rounded,
                                  color: isDarkMode ? Colors.white60 : Colors.grey[500],
                                  size: 20,
                                ),
                                onPressed: () {
                                  _searchController.clear();
                                  _filteredCountries = countries;
                                  setState(() {});
                                },
                              )
                            : null,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 16,
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          if (value.isEmpty) {
                            _filteredCountries = countries;
                          } else {
                            _filteredCountries = countryProvider.searchCountries(value);
                          }
                        });
                      },
                    ),
                  ),
                ),

                Expanded(
                  child: countryProvider.isLoading
                      ? const Center(
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(ColorGlobalVariables.brownColor),
                          ),
                        )
                      : countryProvider.hasError
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.error_outline_rounded,
                                  color: isDarkMode ? Colors.grey[500] : Colors.grey[400],
                                  size: 48,
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  countryProvider.errorMessage ?? 'Failed to load countries',
                                  style: TextStyle(
                                    color: isDarkMode ? Colors.white70 : Colors.grey[600],
                                    fontSize: 16,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 16),
                                ElevatedButton(
                                  onPressed: () {
                                    countryProvider.refreshCountries();
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: ColorGlobalVariables.brownColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  child: const Text(
                                    'Try Again',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            )
                          : _filteredCountries.isEmpty
                              ? Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.search_off_rounded,
                                      color: isDarkMode ? Colors.grey[500] : Colors.grey[400],
                                      size: 48,
                                    ),
                                    const SizedBox(height: 16),
                                    Text(
                                      'No countries found',
                                      style: TextStyle(
                                        color: isDarkMode ? Colors.white70 : Colors.grey[600],
                                        fontSize: 16,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      'Try a different search term',
                                      style: TextStyle(
                                        color: isDarkMode ? Colors.white60 : Colors.grey[500],
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                )
                              : ListView.builder(
                                  padding: const EdgeInsets.only(bottom: 16),
                                  itemCount: _filteredCountries.length,
                                  itemBuilder: (context, index) {
                                    final country = _filteredCountries[index];
                                    final isSelected = _selectedCountry?.id == country.id;
                                    
                                    return Material(
                                      color: Colors.transparent,
                                      child: InkWell(
                                        onTap: () {
                                          setState(() {
                                            _selectedCountry = country;
                                          });
                                          Get.back();
                                        },
                                        child: Container(
                                          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                                          padding: const EdgeInsets.all(16),
                                          decoration: BoxDecoration(
                                            color: isSelected
                                                ? ColorGlobalVariables.brownColor.withOpacity(0.1)
                                                : Colors.transparent,
                                            borderRadius: BorderRadius.circular(12),
                                            border: Border.all(
                                              color: isSelected
                                                  ? ColorGlobalVariables.brownColor.withOpacity(0.3)
                                                  : Colors.transparent,
                                              width: 1.5,
                                            ),
                                          ),
                                          child: Row(
                                            children: [
                                              Container(
                                                width: 32,
                                                height: 32,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(6),
                                                  color: isDarkMode ? Colors.grey[700] : Colors.grey[100],
                                                ),
                                                alignment: Alignment.center,
                                                child: Text(
                                                  _getFlagEmoji(country.iso2),
                                                  style: const TextStyle(fontSize: 18),
                                                ),
                                              ),
                                              const SizedBox(width: 16),
                                              
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      country.name,
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight: FontWeight.w500,
                                                        color: isDarkMode ? Colors.white : Colors.grey[800],
                                                      ),
                                                    ),
                                                    const SizedBox(height: 4),
                                                    Text(
                                                      '+${country.phoneCode} • ${country.iso2} • ${country.currency}',
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                        color: isDarkMode ? Colors.white60 : Colors.grey[600],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              
                                              if (isSelected)
                                                Icon(
                                                  Icons.check_circle_rounded,
                                                  color: ColorGlobalVariables.brownColor,
                                                  size: 24,
                                                ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  String _getFlagEmoji(String countryCode) {
    final codePoints = countryCode.toUpperCase().codeUnits.map((codeUnit) => codeUnit + 127397).toList();
    return String.fromCharCodes(codePoints);
  }

  Widget _buildPhoneNumberField() {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    final hasSelectedCountry = _selectedCountry != null;

    return Container(
      decoration: BoxDecoration(
        color: isDarkMode ? const Color(0xFF424242) : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isDarkMode ? Colors.grey[700]! : Colors.grey[300]!,
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: GestureDetector(
              onTap: _showCountrySelectionDialog,
              child: Container(
                height: 56,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  color: isDarkMode ? const Color(0xFF303030) : Colors.grey[50],
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(11),
                    bottomLeft: Radius.circular(11),
                  ),
                  border: Border(
                    right: BorderSide(
                      color: isDarkMode ? Colors.grey[700]! : Colors.grey[300]!,
                      width: 1,
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (hasSelectedCountry)
                      Container(
                        width: 20,
                        alignment: Alignment.center,
                        child: Text(
                          _getFlagEmoji(_selectedCountry!.iso2),
                          style: const TextStyle(fontSize: 14),
                        ),
                      )
                    else
                      Icon(
                        Icons.flag_outlined,
                        size: 16,
                        color: isDarkMode ? Colors.white60 : Colors.grey[500],
                      ),
                    
                    const SizedBox(width: 6),
                    
                    Flexible(
                      child: Text(
                        hasSelectedCountry ? '+${_selectedCountry!.phoneCode}' : 'Code',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: hasSelectedCountry 
                              ? ColorGlobalVariables.brownColor
                              : (isDarkMode ? Colors.white60 : Colors.grey[500]),
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                    
                    const SizedBox(width: 2),
                    
                    Icon(
                      Icons.arrow_drop_down_rounded,
                      size: 18,
                      color: isDarkMode ? Colors.white60 : Colors.grey[500],
                    ),
                  ],
                ),
              ),
            ),
          ),
          
          Expanded(
            child: Container(
              height: 56,
              padding: const EdgeInsets.only(left: 8, right: 12),
              child: TextFormField(
                controller: _phoneController,
                style: TextStyle(
                  fontSize: 16,
                  color: isDarkMode ? Colors.white : Colors.black87,
                ),
                decoration: InputDecoration(
                  hintText: "552058745",
                  hintStyle: TextStyle(
                    color: isDarkMode ? Colors.white60 : Colors.grey[500],
                    fontSize: 16,
                  ),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(vertical: 16),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Image.asset(
                      AppIcons.AppIcons.phone_call_logo,
                      width: 18,
                      height: 18,
                      color: isDarkMode ? Colors.white70 : Colors.grey[600],
                    ),
                  ),
                  prefixIconConstraints: const BoxConstraints(
                    minWidth: 36,
                    minHeight: 18,
                  ),
                  isDense: true,
                ),
                keyboardType: TextInputType.phone,
                onChanged: (value) {
                  if (_errorMessage != null && value.isNotEmpty) {
                    setState(() => _errorMessage = null);
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _searchController.dispose();
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
        Container(
          decoration: BoxDecoration(
            color: isDark ? const Color(0xFF424242) : Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isDark ? Colors.grey[700]! : Colors.grey[300]!,
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              fontSize: 16,
              color: isDark ? Colors.white : Colors.black87,
            ),
            decoration: InputDecoration(
              hintText: 'Enter your email address',
              hintStyle: TextStyle(
                color: isDark ? Colors.white60 : Colors.grey[500],
                fontSize: 16,
              ),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              prefixIcon: Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Image.asset(
                  AppIcons.AppIcons.email_icon,
                  width: 18,
                  height: 18,
                  color: isDark ? Colors.white70 : Colors.grey[600],
                ),
              ),
              prefixIconConstraints: const BoxConstraints(
                minWidth: 36,
                minHeight: 18,
              ),
            ),
            validator: _validateEmail,
          ),
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
        
        // Updated phone number field with country selector
        _buildPhoneNumberField(),
        
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