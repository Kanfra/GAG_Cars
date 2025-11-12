import 'package:flutter/material.dart';
import 'package:gag_cars_frontend/GeneralComponents/KwekuComponents/buttons/custom_button.dart';
import 'package:gag_cars_frontend/GeneralComponents/KwekuComponents/inputs/app_icons.dart' show AppIcons;
import 'package:gag_cars_frontend/GlobalVariables/colorGlobalVariables.dart';
import 'package:gag_cars_frontend/Pages/ProfilePages/Models/countryModel.dart';
import 'package:gag_cars_frontend/Pages/ProfilePages/Providers/countryProvider.dart';
import 'package:gag_cars_frontend/Routes/routeClass.dart';
import 'package:gag_cars_frontend/Utils/WidgetUtils/widgetUtils.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

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
  Country? _selectedCountry;
  bool _initializedCountries = false;

  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _slideAnimation;
  late Animation<double> _scaleAnimation;

  final TextEditingController _searchController = TextEditingController();
  List<Country> _filteredCountries = [];

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
    if (_selectedCountry == null) {
      setState(() => _errorMessage = "Please select your country");
      _shakeErrorAnimation();
      return;
    }

    if (_phoneController.text.isEmpty) {
      setState(() => _errorMessage = "Please enter your phone number");
      _shakeErrorAnimation();
      return;
    }

    if (!_isValidPhoneNumber(_phoneController.text)) {
      setState(() => _errorMessage = "Please enter a valid phone number (9-15 digits)");
      _shakeErrorAnimation();
      return;
    }

    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final _fullPhoneNumber = "+${_selectedCountry!.phoneCode}${_phoneController.text}";
      
      await _successAnimation();
      
      Get.offNamed(
        RouteClass.getVerifyCodePage(),
        arguments: {
          'phone': _fullPhoneNumber,
          'isSignIn': true,
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
          Container(
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
                      AppIcons.phone_call_logo,
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

  void _onSocialAuthTap(String platform) {
    _animationController.animateBack(0.9, duration: const Duration(milliseconds: 100))
        .then((_) => _animationController.forward());
  }

  @override
  void dispose() {
    _animationController.dispose();
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
                          Transform.translate(
                            offset: Offset(0, -_slideAnimation.value * 0.5),
                            child: Image.asset(
                              AppIcons.gag_logo_red,
                              width: 210,
                            ),
                          ),
                          
                          const SizedBox(height: 30),
                          
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
                                            child: Text(
                                              key: ValueKey(_errorMessage),
                                              _errorMessage!,
                                              style: TextStyle(
                                                color: ColorGlobalVariables.redColor,
                                                fontSize: 14,
                                              ),
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
                          
                          Transform.translate(
                            offset: Offset(_slideAnimation.value, 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 4, bottom: 6),
                                  child: Text(
                                    "Phone Number",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: isDark ? Colors.white60 : Colors.grey[600],
                                    ),
                                  ),
                                ),
                                _buildPhoneNumberField(),
                              ],
                            ),
                          ),
                          
                          const SizedBox(height: 14),
                          const SizedBox(height: 20),
                          
                          Transform.translate(
                            offset: Offset(0, _slideAnimation.value),
                            child: CustomButton(
                              buttonName: 'Sign In',
                              onPressed: _handleSignIn,
                              isLoading: _isLoading,
                            ),
                          ),
                          
                          const SizedBox(height: 20),
                          
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
                          
                          FadeTransition(
                            opacity: _fadeAnimation,
                            child: Text(
                              "Sign In with",
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
                          
                          SizedBox(
                            width: 200,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
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
                          
                          FadeTransition(
                            opacity: _fadeAnimation,
                            child: GestureDetector(
                              onTap: () {
                                Get.offNamed(RouteClass.getSignUpWithEmailPage());
                              },
                              child: MouseRegion(
                                cursor: SystemMouseCursors.click,
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