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
// Import your custom components here...

class ProfileUpdatePage extends StatefulWidget {
  const ProfileUpdatePage({super.key});

  @override
  State<ProfileUpdatePage> createState() => _ProfileUpdatePageState();
}

class _ProfileUpdatePageState extends State<ProfileUpdatePage> {
  String? name;
  String? phoneNumber;
  String? email;
  String? profileImage;
  String joinedDate = "Not available";
  final ImagePicker _picker = ImagePicker();
  File? _pendingProfileImage;
  String? _tempImagePath;

  @override
  void initState() {
    super.initState();
    _initializeUserData();
  }

  void _initializeUserData() {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final UserModel? user = userProvider.user;
    
    if (user?.createdAt != null) {
      joinedDate = "Joined ${user!.createdAt!.toLocal().toString().split(' ')[0]}";
    }

    setState(() {
      name = user?.name;
      phoneNumber = user?.phoneNumber;
      email = user?.email;
      profileImage = user?.profileImage;
    });
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[40],
      appBar: _buildAppBar(),
      body: _buildProfileForm(),
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

  Widget _buildProfileForm() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Column(
        children: [
          _buildProfileHeader(),
          const SizedBox(height: 32),
          _buildEditableField(
            label: "Full Name",
            value: name ?? "Guest User",
            onTap: () => _showEditDialog("Name", name!, (value) => setState(() => name = value)),
          ),
          const SizedBox(height: 20),
          _buildEditableField(
            label: "Phone Number",
            value: phoneNumber ?? "Not provided",
            onTap: () => _showEditDialog("Phone Number", phoneNumber!, (value) => setState(() => phoneNumber = value)),
          ),
          const SizedBox(height: 20),
          _buildEditableField(
            label: "Email Address",
            value: email ?? "Not provided",
            onTap: () => _showEditDialog("Email", email!, (value) => setState(() => email = value)),
          ),
          const SizedBox(height: 40),
          _buildUpdateButton(),
        ],
      ),
    );
  }

  Widget _buildProfileHeader() {
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
                    : profileImage != null
                        ? CustomImage(
                            imagePath: getImageUrl(
                              profileImage!, 
                              "${ImageStringGlobalVariables.imagePath}gordon_image_temporary.png"),
                            isAssetImage: false,
                            imageHeight: 120,
                            imageWidth: 120, isImageBorderRadiusRequired: false,
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
          name ?? "Guest User",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: ColorGlobalVariables.blackColor,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          joinedDate,
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

  Widget _buildUpdateButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          // Handle update logic
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorGlobalVariables.brownColor,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: const Text(
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

  void _showEditDialog(
    String fieldName,
    String currentValue,
    ValueChanged<String> onSave,
  ) {
    final controller = TextEditingController(text: currentValue);
    
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
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              onSave(controller.text);
              Get.back();
            },
            child: const Text("Save"),
          ),
        ],
      ),
    );
  }
}