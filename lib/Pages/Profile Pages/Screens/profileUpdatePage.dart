import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/customImage.dart';
import 'package:gag_cars_frontend/GlobalVariables/colorGlobalVariables.dart';
import 'package:gag_cars_frontend/GlobalVariables/imageStringGlobalVariables.dart';
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
  String? _tempImagePath;

  @override
  void initState() {
    super.initState();
  }

  Future<void> _updateProfileImage() async {
    showImageSourceDialog(
      picker: _picker,
      setStateFunction: (pickedFile) {
        setState(() {
          _pendingProfileImage = File(pickedFile.path);
          _tempImagePath = pickedFile.path;
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

    // Use current values from provider
    final currentName = user.name;
    final currentEmail = user.email;
    final currentPhone = user.phoneNumber ?? '';

    // basic validation
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

    try{
      // call the user provider's update method
      await userProvider.updateUserProfile(
        profileImage: _pendingProfileImage,
        userName: currentName,
        phoneNumber: currentPhone,
        email: currentEmail,
      );

      // Clear the pending image
      setState(() {
        _pendingProfileImage = null;
      });

      // show success message
      showCustomAppSnackBar(
        context: context, 
        message: 'Profile updated successfully',
        backgroundColor: ColorGlobalVariables.greenColor,
      );
      
      // navigate back
      Get.back();
    } catch(e){
      // show error message from provider
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
    
    Get.dialog(
      AlertDialog(
        title: Text("Edit $fieldName"),
        content: TextField(
          controller: controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          onChanged: (_) {
            userProvider.clearError();
          },
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text("Cancel"),
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

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
      builder: (context, userProvider, child){
        final user = userProvider.user;
        
        return Scaffold(
          backgroundColor: Colors.grey[40],
          appBar: _buildAppBar(),
          body: Stack(
            children: [
              _buildProfileForm(userProvider, user),
              
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

  AppBar _buildAppBar() {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new, size: 20),
        onPressed: () => Get.back(),
      ),
      title: Text(
        "Edit Profile",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: ColorGlobalVariables.blackColor,
        ),
      ),
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
    );
  }

  Widget _buildProfileForm(UserProvider userProvider, UserModel? user) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Column(
        children: [
          _buildProfileHeader(user),
          const SizedBox(height: 32),
          _buildEditableField(
            label: "Full Name",
            value: user?.name ?? "Guest User",
            onTap: () => _showEditDialog(
              "Name", 
              user?.name ?? "",
              (value) async {
                // Create updated user and update provider
                final updatedUser = user?.copyWith(name: value);
                if (updatedUser != null) {
                  userProvider.setUser(updatedUser);
                }
              }
            ),
          ),
          const SizedBox(height: 20),
          _buildEditableField(
            label: "Phone Number",
            value: user?.phoneNumber ?? "Not provided",
            onTap: () => _showEditDialog(
              "Phone Number", 
              user?.phoneNumber ?? "",
              (value) async {
                final updatedUser = user?.copyWith(phoneNumber: value);
                if (updatedUser != null) {
                  userProvider.setUser(updatedUser);
                }
              }
            ),
          ),
          const SizedBox(height: 20),
          _buildEditableField(
            label: "Email Address",
            value: user?.email ?? "Not provided",
            onTap: () => _showEditDialog(
              "Email", 
              user?.email ?? "",
              (value) async {
                final updatedUser = user?.copyWith(email: value);
                if (updatedUser != null) {
                  userProvider.setUser(updatedUser);
                }
              }
            ),
          ),
          const SizedBox(height: 40),
          _buildUpdateButton(userProvider),
        ],
      ),
    );
  }

  Widget _buildProfileHeader(UserModel? user) {
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
                  width: 2,
                ),
              ),
              child: ClipOval(
                child: _pendingProfileImage != null
                    ? Image.file(_pendingProfileImage!, fit: BoxFit.cover)
                    : user?.profileImage != null
                        ? CustomImage(
                            imagePath: getImageUrl(
                              user!.profileImage!, 
                              "${ImageStringGlobalVariables.imagePath}gordon_image_temporary.png"),
                            isAssetImage: false,
                            imageHeight: 120,
                            imageWidth: 120, 
                            isImageBorderRadiusRequired: false,
                          )
                        : Image.asset(
                            "${ImageStringGlobalVariables.imagePath}gordon_image_temporary.png",
                            fit: BoxFit.cover,
                          ),
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
            color: ColorGlobalVariables.blackColor,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          user?.createdAt != null 
            ? "Joined ${user!.createdAt!.toLocal().toString().split(' ')[0]}"
            : "Not available",
          style: TextStyle(
            fontSize: 12,
            color: ColorGlobalVariables.blackColor.withOpacity(0.6),
          ),
        ),
      ],
    );
  }

  Widget _buildEditableField({
    required String label,
    required String value,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white,
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
                      color: ColorGlobalVariables.blackColor.withOpacity(0.6),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    value,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: ColorGlobalVariables.blackColor,
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
        ),
        child: userProvider.isLoading 
        ? const SizedBox(
          width: 20,
          height: 20,
          child: CircularProgressIndicator(
            color: ColorGlobalVariables.whiteColor,
            strokeWidth: 2,
          ),
        ) : const Text(
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