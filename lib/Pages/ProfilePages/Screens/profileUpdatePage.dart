import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/customImage.dart';
import 'package:gag_cars_frontend/GlobalVariables/colorGlobalVariables.dart';
import 'package:gag_cars_frontend/Pages/Authentication/Models/user_model.dart';
import 'package:gag_cars_frontend/Pages/Authentication/Providers/userProvider.dart';
import 'package:gag_cars_frontend/Pages/ProfilePages/Models/countryModel.dart';
import 'package:gag_cars_frontend/Pages/ProfilePages/Providers/countryProvider.dart';
import 'package:gag_cars_frontend/Utils/ApiUtils/apiUtils.dart';
import 'package:gag_cars_frontend/Utils/WidgetUtils/widgetUtils.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class ProfileUpdatePage extends StatefulWidget {
  const ProfileUpdatePage({super.key});

  @override
  State<ProfileUpdatePage> createState() => _ProfileUpdatePageState();
}

class _ProfileUpdatePageState extends State<ProfileUpdatePage> {
  final ImagePicker _picker = ImagePicker();
  File? _pendingProfileImage;
  Country? _selectedCountry;
  bool _initializedCountries = false;
  bool _hasNewImageSelected = false;
  final TextEditingController _searchController = TextEditingController();
  List<Country> _filteredCountries = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initializeCountries();
    });
  }

  void _initializeCountries() {
    if (_initializedCountries) return;
    
    final countryProvider = Provider.of<CountryProvider>(context, listen: false);
    
    if (!countryProvider.isInitialized && !countryProvider.isLoading) {
      countryProvider.loadCountries();
    }
    _initializedCountries = true;
  }

  Future<void> _updateProfileImage() async {
    showImageSourceDialog(
      picker: _picker,
      setStateFunction: (pickedFile) {
        setState(() {
          _pendingProfileImage = File(pickedFile.path);
          _hasNewImageSelected = true;
        });
      },
    );
  }

  Future<void> _handleUpdateProfile() async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final user = userProvider.user;
    
    if (user == null) {
      showCustomAppSnackBar(
        context: context, 
        message: 'No user logged in',
      );
      return;
    }

    final currentName = user.name;
    final currentEmail = user.email;
    final currentPhone = user.phoneNumber ?? '';

    if(currentName.isEmpty){
      showCustomAppSnackBar(
        context: context, 
        message: 'Please enter your name',
      );
      return;
    }
    
    if(currentEmail.isEmpty){
      showCustomAppSnackBar(
        context: context, 
        message: 'Please enter your email',
      );
      return;
    }

    try {
      // Store current profile image before update to prevent loss
      final currentProfileImage = user.profileImage;
      
      await userProvider.updateUserProfile(
        profileImage: _hasNewImageSelected ? _pendingProfileImage : null,
        userName: currentName,
        phoneNumber: currentPhone,
        email: currentEmail,
        countryId: _selectedCountry?.id,
      );

      // Only clear the pending image if it was actually uploaded
      if (_hasNewImageSelected) {
        setState(() {
          _pendingProfileImage = null;
          _hasNewImageSelected = false;
        });
      } else {
        // If no new image was selected, ensure the profile image is preserved
        if (userProvider.user?.profileImage == null && currentProfileImage != null) {
          final updatedUser = userProvider.user?.copyWith(profileImage: currentProfileImage);
          if (updatedUser != null) {
            userProvider.setUser(updatedUser);
          }
        }
      }

      showCustomAppSnackBar(
        context: context, 
        message: 'Profile updated successfully',
        backgroundColor: ColorGlobalVariables.greenColor,
      );
      
      Get.back();
    } catch(e) {
      final errorMessage = userProvider.error ?? 'Failed to update profile';
      showCustomAppSnackBar(
        context: context, 
        message: errorMessage,
      );
    }
  }

  void _showEditDialog(
    String fieldName,
    String currentValue,
    ValueChanged<String> onSave,
  ) {
    final controller = TextEditingController(text: currentValue);
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    
    Get.dialog(
      AlertDialog(
        backgroundColor: isDarkMode ? const Color(0xFF424242) : Colors.white,
        title: Text(
          "Edit $fieldName",
          style: TextStyle(
            color: isDarkMode ? Colors.white : Colors.black87,
          ),
        ),
        content: TextField(
          controller: controller,
          style: TextStyle(
            color: isDarkMode ? Colors.white : Colors.black87,
          ),
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            filled: isDarkMode,
            fillColor: isDarkMode ? const Color(0xFF303030) : null,
          ),
          onChanged: (_) {
            userProvider.clearError();
          },
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: Text(
              "Cancel",
              style: TextStyle(
                color: isDarkMode ? Colors.white70 : Colors.black54,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              if (controller.text.trim().isNotEmpty) {
                onSave(controller.text.trim());
                Get.back();
              } else {
                Get.snackbar(
                  'Error',
                  '$fieldName cannot be empty',
                  backgroundColor: Colors.red,
                  colorText: Colors.white,
                );
              }
            },
            child: const Text("Save"),
          ),
        ],
      ),
    );
  }

  void _showCountrySelectionDialog() {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final countryProvider = Provider.of<CountryProvider>(context, listen: false);
    final countries = countryProvider.countriesSortedByName;
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
              // Header
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

              // Search Bar
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
                        _filteredCountries = countries.where((country) {
                          return country.name.toLowerCase().contains(value.toLowerCase()) ||
                              country.iso2.toLowerCase().contains(value.toLowerCase()) ||
                              country.phoneCode.contains(value);
                        }).toList();
                      });
                    },
                  ),
                ),
              ),

              // Countries List
              Expanded(
                child: countryProvider.isLoading && !countryProvider.isInitialized
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
                                'Failed to load countries',
                                style: TextStyle(
                                  color: isDarkMode ? Colors.white70 : Colors.grey[600],
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 16),
                              ElevatedButton(
                                onPressed: () {
                                  countryProvider.loadCountries();
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
                                            // Flag
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
                                            
                                            // Country Info
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
                                                    '+${country.phoneCode} • ${country.iso2}',
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      color: isDarkMode ? Colors.white60 : Colors.grey[600],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            
                                            // Selection Indicator
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
  }

  String _getFlagEmoji(String countryCode) {
    final codePoints = countryCode.toUpperCase().codeUnits.map((codeUnit) => codeUnit + 127397).toList();
    return String.fromCharCodes(codePoints);
  }

  Widget _getProfileImage(UserModel? user) {
    if (_pendingProfileImage != null) {
      return Image.file(_pendingProfileImage!, fit: BoxFit.cover);
    }
    
    if (user?.profileImage != null && user!.profileImage!.isNotEmpty) {
      return CustomImage(
        imagePath: getImageUrl(user.profileImage!, ""),
        isAssetImage: false,
        imageHeight: 120,
        imageWidth: 120, 
        isImageBorderRadiusRequired: false,
      );
    }
    
    return Container(
      color: ColorGlobalVariables.brownColor.withOpacity(0.1),
      child: Icon(
        Icons.person,
        size: 60,
        color: ColorGlobalVariables.brownColor.withOpacity(0.6),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    
    return Consumer2<UserProvider, CountryProvider>(
      builder: (context, userProvider, countryProvider, child){
        final user = userProvider.user;
        final hasExistingCountry = user?.countryId != null;
        
        if (_selectedCountry == null && hasExistingCountry) {
          final countryId = user!.countryId;
          final int? parsedCountryId = countryId;
          
          if (parsedCountryId != null) {
            final userCountry = countryProvider.getCountryById(parsedCountryId);
            if (userCountry != null) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                setState(() {
                  _selectedCountry = userCountry;
                });
              });
            }
          }
        }

        return Scaffold(
          backgroundColor: isDarkMode ? const Color(0xFF303030) : Colors.grey[100],
          appBar: _buildAppBar(isDarkMode),
          body: Stack(
            children: [
              _buildProfileForm(userProvider, countryProvider, user, hasExistingCountry, isDarkMode),
              if(userProvider.isLoading)
              Container(
                color: ColorGlobalVariables.blackColor.withOpacity(0.3),
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  AppBar _buildAppBar(bool isDarkMode) {
    return AppBar(
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios_new, 
          size: 20,
          color: isDarkMode ? Colors.white : Colors.black87,
        ),
        onPressed: () => Get.back(),
      ),
      title: Text(
        "Edit Profile",
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: isDarkMode ? Colors.white : ColorGlobalVariables.brownColor,
        ),
      ),
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
    );
  }

  Widget _buildProfileForm(UserProvider userProvider, CountryProvider countryProvider, UserModel? user, bool hasExistingCountry, bool isDarkMode) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Column(
        children: [
          _buildProfileHeader(user, countryProvider, hasExistingCountry, isDarkMode),
          const SizedBox(height: 32),
          _buildEditableField(
            label: "Full Name",
            value: user?.name ?? "Guest User",
            onTap: () => _showEditDialog("Name", user?.name ?? "", (value) async {
              final updatedUser = user?.copyWith(name: value);
              if (updatedUser != null) userProvider.setUser(updatedUser);
            }),
            isDarkMode: isDarkMode,
          ),
          const SizedBox(height: 20),
          _buildEditableField(
            label: "Phone Number",
            value: user?.phoneNumber ?? "Not provided",
            onTap: () => _showEditDialog("Phone Number", user?.phoneNumber ?? "", (value) async {
              final updatedUser = user?.copyWith(phoneNumber: value);
              if (updatedUser != null) userProvider.setUser(updatedUser);
            }),
            isDarkMode: isDarkMode,
          ),
          const SizedBox(height: 20),
          _buildEditableField(
            label: "Email Address",
            value: user?.email ?? "Not provided",
            onTap: () => _showEditDialog("Email", user?.email ?? "", (value) async {
              final updatedUser = user?.copyWith(email: value);
              if (updatedUser != null) userProvider.setUser(updatedUser);
            }),
            isDarkMode: isDarkMode,
          ),
          const SizedBox(height: 20),
          _buildCountrySelectionField(hasExistingCountry, isDarkMode),
          const SizedBox(height: 40),
          _buildUpdateButton(userProvider),
        ],
      ),
    );
  }

  Widget _buildProfileHeader(UserModel? user, CountryProvider countryProvider, bool hasExistingCountry, bool isDarkMode) {
    String? countryName;
    String? countryFlag;
    
    if (hasExistingCountry) {
      final countryId = user!.countryId;
      final int? parsedCountryId = countryId;
      
      if (parsedCountryId != null) {
        final userCountry = countryProvider.getCountryById(parsedCountryId);
        countryName = userCountry?.name;
        countryFlag = userCountry != null ? _getFlagEmoji(userCountry.iso2) : null;
      }
    }

    return Column(
      children: [
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: ColorGlobalVariables.brownColor.withOpacity(0.2),
                  width: 1,
                ),
              ),
              child: ClipOval(
                child: _getProfileImage(user),
              ),
            ),
            GestureDetector(
              onTap: _updateProfileImage,
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: ColorGlobalVariables.brownColor,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white,
                    width: 2,
                  ),
                ),
                child: const Icon(
                  Icons.camera_alt,
                  size: 18,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Text(
          user?.name ?? "Guest User",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: isDarkMode ? Colors.white : ColorGlobalVariables.blackColor,
          ),
        ),
        const SizedBox(height: 4),
        if (hasExistingCountry && countryName != null) 
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (countryFlag != null) 
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Text(
                    countryFlag,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              Text(
                countryName,
                style: TextStyle(
                  fontSize: 12,
                  color: isDarkMode ? Colors.white70 : ColorGlobalVariables.blackColor.withOpacity(0.6),
                ),
              ),
            ],
          ),
        Text(
          user?.createdAt != null 
            ? "Joined ${user!.createdAt!.toLocal().toString().split(' ')[0]}"
            : "Not available",
          style: TextStyle(
            fontSize: 12,
            color: isDarkMode ? Colors.white60 : ColorGlobalVariables.blackColor.withOpacity(0.6),
          ),
        ),
      ],
    );
  }

  Widget _buildEditableField({
    required String label,
    required String value,
    required VoidCallback onTap,
    required bool isDarkMode,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          color: isDarkMode ? const Color(0xFF424242) : Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: TextStyle(
                      fontSize: 12,
                      color: isDarkMode ? Colors.white60 : ColorGlobalVariables.blackColor.withOpacity(0.6),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    value,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: isDarkMode ? Colors.white : ColorGlobalVariables.blackColor,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.edit_outlined,
              size: 20,
              color: ColorGlobalVariables.brownColor,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCountrySelectionField(bool hasExistingCountry, bool isDarkMode) {
    final displayCountry = _selectedCountry;
    final hasSelectedCountry = displayCountry != null;

    return GestureDetector(
      onTap: _showCountrySelectionDialog,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          color: isDarkMode ? const Color(0xFF424242) : Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "Country",
                        style: TextStyle(
                          fontSize: 12,
                          color: isDarkMode ? Colors.white60 : ColorGlobalVariables.blackColor.withOpacity(0.6),
                        ),
                      ),
                      if (hasExistingCountry)
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                            decoration: BoxDecoration(
                              color: ColorGlobalVariables.greenColor.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              "Current",
                              style: TextStyle(
                                fontSize: 10,
                                color: ColorGlobalVariables.greenColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  hasSelectedCountry
                    ? Row(
                        children: [
                          Container(
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: isDarkMode ? Colors.grey[700] : Colors.grey[100],
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              _getFlagEmoji(displayCountry!.iso2),
                              style: const TextStyle(fontSize: 12),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  displayCountry.name,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: isDarkMode ? Colors.white : ColorGlobalVariables.blackColor,
                                  ),
                                ),
                                if (hasExistingCountry)
                                  Text(
                                    "Tap to change country",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: isDarkMode ? Colors.white60 : ColorGlobalVariables.blackColor.withOpacity(0.5),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                          Text(
                            '+${displayCountry.phoneCode}',
                            style: TextStyle(
                              fontSize: 14,
                              color: isDarkMode ? Colors.white60 : ColorGlobalVariables.blackColor.withOpacity(0.6),
                            ),
                          ),
                        ],
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Select your country",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: isDarkMode ? Colors.white60 : ColorGlobalVariables.blackColor.withOpacity(0.4),
                            ),
                          ),
                          Text(
                            "Required for full profile setup",
                            style: TextStyle(
                              fontSize: 12,
                              color: ColorGlobalVariables.redColor.withOpacity(0.7),
                            ),
                          ),
                        ],
                      ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_drop_down_rounded,
              size: 24,
              color: ColorGlobalVariables.brownColor,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUpdateButton(UserProvider userProvider) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: userProvider.isLoading ? null : _handleUpdateProfile,
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorGlobalVariables.brownColor,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 2,
          shadowColor: ColorGlobalVariables.brownColor.withOpacity(0.3),
        ),
        child: userProvider.isLoading 
        ? const SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(
              color: Colors.white,
              strokeWidth: 2,
            ),
          )
        : const Text(
            "UPDATE PROFILE",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
      ),
    );
  }
}