import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/customImage.dart';
import 'package:gag_cars_frontend/GlobalVariables/colorGlobalVariables.dart';
import 'package:gag_cars_frontend/Pages/Authentication/Models/user_model.dart';
import 'package:gag_cars_frontend/Pages/Authentication/Providers/userProvider.dart';
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
  bool _hasNewImageSelected = false;
  
  // Local State for pending changes
  String? _pendingName;
  String? _pendingEmail;
  String? _pendingPhone;

  @override
  void initState() {
    super.initState();
    _initializePendingData();
  }

  void _initializePendingData() {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final user = userProvider.user;
    
    if (user != null) {
      _pendingName = user.name;
      _pendingEmail = user.email;
      _pendingPhone = user.phoneNumber;
    }
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
    
    if (_pendingName == null || _pendingName!.isEmpty) {
      showCustomAppSnackBar(
        context: context, 
        message: 'Please enter your name',
      );
      return;
    }
    
    if (_pendingEmail == null || _pendingEmail!.isEmpty) {
      showCustomAppSnackBar(
        context: context, 
        message: 'Please enter your email',
      );
      return;
    }

    try {
      final currentUser = userProvider.user;
      final currentProfileImage = currentUser?.profileImage;
      
      // Get the current countryId from the user to preserve it
      final currentCountryId = currentUser?.countryId;
      
      await userProvider.updateUserProfile(
        profileImage: _hasNewImageSelected ? _pendingProfileImage : null,
        userName: _pendingName!,
        phoneNumber: _pendingPhone ?? '',
        email: _pendingEmail!,
        // Pass the current countryId to preserve it
        countryId: currentCountryId,
      );

      if (_hasNewImageSelected) {
        setState(() {
          _pendingProfileImage = null;
          _hasNewImageSelected = false;
        });
      } else {
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
      color: ColorGlobalVariables.brownColor.withValues(alpha: 0.1),
      child: Icon(
        Icons.person,
        size: 60,
        color: ColorGlobalVariables.brownColor.withValues(alpha: 0.6),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    
    return Consumer<UserProvider>(
      builder: (context, userProvider, child){
        final user = userProvider.user;
        
        final displayName = _pendingName ?? user?.name ?? "Guest User";
        final displayEmail = _pendingEmail ?? user?.email ?? "Not provided";
        final displayPhone = _pendingPhone ?? user?.phoneNumber ?? "Not provided";
        
        final hasCountry = user?.countryId != null;
        final countryName = user?.countryName;
        final countryCode = user?.countryCode;

        return Scaffold(
          backgroundColor: isDarkMode ? const Color(0xFF303030) : Colors.grey[100],
          appBar: _buildAppBar(isDarkMode),
          body: Stack(
            children: [
              _buildProfileForm(userProvider, displayName, displayEmail, displayPhone, hasCountry, countryName, countryCode, isDarkMode),
              if(userProvider.isLoading)
              Container(
                color: ColorGlobalVariables.blackColor.withValues(alpha: 0.3),
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

  Widget _buildProfileForm(UserProvider userProvider, String displayName, String displayEmail, String displayPhone, bool hasCountry, String? countryName, String? countryCode, bool isDarkMode) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Column(
        children: [
          _buildProfileHeader(userProvider.user, hasCountry, countryName, countryCode, isDarkMode),
          const SizedBox(height: 32),
          _buildEditableField(
            label: "Full Name",
            value: displayName,
            onTap: () => _showEditDialog("Name", displayName, (value) {
              setState(() {
                _pendingName = value;
              });
            }),
            isDarkMode: isDarkMode,
          ),
          const SizedBox(height: 20),
          _buildEditableField(
            label: "Phone Number",
            value: displayPhone,
            onTap: () => _showEditDialog("Phone Number", displayPhone, (value) {
              setState(() {
                _pendingPhone = value;
              });
            }),
            isDarkMode: isDarkMode,
          ),
          const SizedBox(height: 20),
          _buildEditableField(
            label: "Email Address",
            value: displayEmail,
            onTap: () => _showEditDialog("Email", displayEmail, (value) {
              setState(() {
                _pendingEmail = value;
              });
            }),
            isDarkMode: isDarkMode,
          ),
          const SizedBox(height: 20),
          _buildCountryDisplayField(hasCountry, countryName, countryCode, isDarkMode),
          const SizedBox(height: 40),
          _buildUpdateButton(userProvider),
        ],
      ),
    );
  }

  Widget _buildProfileHeader(UserModel? user, bool hasCountry, String? countryName, String? countryCode, bool isDarkMode) {
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
                  color: ColorGlobalVariables.brownColor.withValues(alpha: 0.2),
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
          _pendingName ?? user?.name ?? "Guest User",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: isDarkMode ? Colors.white : ColorGlobalVariables.blackColor,
          ),
        ),
        const SizedBox(height: 4),
        if (hasCountry && countryName != null) 
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (countryCode != null) 
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Text(
                    _getFlagEmoji(countryCode),
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              Text(
                countryName,
                style: TextStyle(
                  fontSize: 12,
                  color: isDarkMode ? Colors.white70 : ColorGlobalVariables.blackColor.withValues(alpha: 0.6),
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
            color: isDarkMode ? Colors.white60 : ColorGlobalVariables.blackColor.withValues(alpha: 0.6),
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
              color: Colors.black.withValues(alpha: 0.05),
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
                      color: isDarkMode ? Colors.white60 : ColorGlobalVariables.blackColor.withValues(alpha: 0.6),
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

  Widget _buildCountryDisplayField(bool hasCountry, String? countryName, String? countryCode, bool isDarkMode) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        color: isDarkMode ? const Color(0xFF424242) : Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
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
                        color: isDarkMode ? Colors.white60 : ColorGlobalVariables.blackColor.withValues(alpha: 0.6),
                      ),
                    ),
                    if (hasCountry)
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: ColorGlobalVariables.greenColor.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            "Selected",
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
                hasCountry && countryName != null
                  ? Row(
                      children: [
                        if (countryCode != null)
                          Container(
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: isDarkMode ? Colors.grey[700] : Colors.grey[100],
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              _getFlagEmoji(countryCode),
                              style: const TextStyle(fontSize: 12),
                            ),
                          ),
                        if (countryCode != null) const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            countryName,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: isDarkMode ? Colors.white : ColorGlobalVariables.blackColor,
                            ),
                          ),
                        ),
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "No country selected",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: isDarkMode ? Colors.white60 : ColorGlobalVariables.blackColor.withValues(alpha: 0.6),
                          ),
                        ),
                        Text(
                          "Country information not available",
                          style: TextStyle(
                            fontSize: 12,
                            color: ColorGlobalVariables.brownColor.withValues(alpha: 0.7),
                          ),
                        ),
                      ],
                    ),
              ],
            ),
          ),
          Icon(
            Icons.lock_outline,
            size: 20,
            color: isDarkMode ? Colors.white60 : ColorGlobalVariables.blackColor.withValues(alpha: 0.4),
          ),
        ],
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
          shadowColor: ColorGlobalVariables.brownColor.withValues(alpha: 0.3),
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