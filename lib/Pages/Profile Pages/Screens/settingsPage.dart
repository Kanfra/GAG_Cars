import 'package:flutter/material.dart';
import 'package:gag_cars_frontend/GeneralComponents/AtillahComponents/customListTile.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/Text/textExtraSmall.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/Text/textSmall.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/customImage.dart';
import 'package:gag_cars_frontend/GlobalVariables/colorGlobalVariables.dart';
import 'package:gag_cars_frontend/GlobalVariables/imageStringGlobalVariables.dart';
import 'package:gag_cars_frontend/Pages/Authentication/Models/user_model.dart';
import 'package:gag_cars_frontend/Pages/Authentication/Providers/userProvider.dart';
import 'package:gag_cars_frontend/Pages/Authentication/Services/authService.dart';
import 'package:gag_cars_frontend/Routes/routeClass.dart';
import 'package:gag_cars_frontend/Utils/ApiUtils/apiUtils.dart';
import 'package:gag_cars_frontend/Utils/WidgetUtils/widgetUtils.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../../../GeneralComponents/EdemComponents/Appbar/customAppbarOne.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsState();
}

class _SettingsState extends State<SettingsPage> {
  bool _isLoggingOut = false;

  Future<void> _handleLogout(BuildContext context) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final theme = Theme.of(context);

    // Show confirmation dialog
    final shouldLogout = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Logout', style: theme.textTheme.titleMedium),
        content: Text('Are you sure you want to logout?', 
               style: theme.textTheme.bodyMedium),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text('Cancel', style: theme.textTheme.bodyMedium),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text('Logout', 
                   style: theme.textTheme.bodyMedium?.copyWith(color: Colors.red)),
          ),
        ],
      ),
    );

    if (shouldLogout == true) {
      setState(() => _isLoggingOut = true);

      try {
        final result = await AuthService.logoutUser();
        if (result['success'] == true) {
          userProvider.clearUser();
          Get.offAllNamed(RouteClass.getSignInWithPhonePage());
        } else {
          showCustomSnackBar(
            title: "Error",
            message: "${result['message']}",
            backgroundColor: ColorGlobalVariables.redColor
          );
        }
      } finally {
        if (mounted) {
          setState(() => _isLoggingOut = false);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    final userProvider = Provider.of<UserProvider>(context);
    final UserModel? user = userProvider.user;
    
    // Format the joined date
    String joinedDate = "Not available";
    if (user?.createdAt != null) {
      joinedDate = "Joined ${user!.createdAt!.toLocal().toString().split(' ')[0]}";
    }

    return Scaffold(
      backgroundColor: isDarkMode ? Colors.grey[900] : Colors.grey[50],
      appBar: CustomAppbar(
        onLeadingIconClickFunction: () => Get.back(),
        isLeadingWidgetExist: true,
        leadingIconData: Icons.arrow_back_ios_new_outlined,
        titleText: "Settings",
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => Get.toNamed(RouteClass.notificationsPage),
            icon: Icon(
              Icons.notifications_none_outlined,
              color: isDarkMode 
                  ? Colors.white 
                  : ColorGlobalVariables.blackColor,
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Profile Card
                  Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    color: isDarkMode ? Colors.grey[800] : Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          // Profile Image
                          CustomImage(
                            imagePath: getImageUrl(
                              "${user?.profileImage}", 
                              "${ImageStringGlobalVariables.imagePath}gordon_image_temporary.png"
                            ), 
                            isAssetImage: user?.profileImage == null,
                            imageHeight: 100,
                            imageWidth: 100,
                            imageBorderRadius: 50,
                            isImageBorderRadiusRequired: true,
                          ),
                          const SizedBox(height: 16),
                          // Profile Name
                          Text(
                            user?.name ?? "Guest User",
                            style: theme.textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 4),
                          // Joined Date
                          Text(
                            joinedDate,
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: isDarkMode 
                                  ? Colors.grey[400] 
                                  : Colors.grey[600],
                            ),
                          ),
                          const SizedBox(height: 16),
                          // Get Verified Button
                          if (user != null && !userProvider.isPaidSeller)
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: theme.primaryColor,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 24, vertical: 12),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: const Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'Get Verified', 
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  SizedBox(width: 8),
                                  Icon(Icons.verified, color: Colors.white, size: 18),
                                ],
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Settings Sections
                  _buildSettingsSection(
                    context,
                    title: "Account",
                    items: [
                      _buildSettingsItem(
                        context,
                        icon: Icons.person_outline,
                        title: "Profile",
                        onTap: () => Get.toNamed(RouteClass.getProfileUpdatePage()),
                      ),
                      _buildSettingsItem(
                        context,
                        icon: Icons.car_rental_outlined,
                        title: "My Listings",
                        onTap: () => Get.toNamed(RouteClass.getMyListingPage()),
                      ),
                      _buildSettingsItem(
                        context,
                        icon: Icons.security_outlined,
                        title: "Security",
                        onTap: () => Get.toNamed(RouteClass.getSecurityPage()),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  _buildSettingsSection(
                    context,
                    title: "App",
                    items: [
                      _buildSettingsItem(
                        context,
                        icon: Icons.business_center_outlined,
                        title: "Dealer Login",
                        onTap: () => Get.toNamed(RouteClass.getDealerLoginPage()),
                      ),
                      _buildSettingsItem(
                        context,
                        icon: Icons.help_outline,
                        title: "Help Center",
                        onTap: () => Get.toNamed(RouteClass.getHelpCenterPage()),
                      ),
                      _buildSettingsItem(
                        context,
                        icon: Icons.settings_outlined,
                        title: "App Settings",
                        onTap: () => Get.toNamed(RouteClass.getSettingsOnePage()),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),

                  // Logout Button
                  OutlinedButton(
                    onPressed: _isLoggingOut ? null : () => _handleLogout(context),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      side: BorderSide(
                        color: Colors.red.withOpacity(0.5),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: _isLoggingOut
                        ? const SizedBox(
                            height: 24,
                            width: 24,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.logout_rounded,
                                color: Colors.red[400],
                              ),
                              const SizedBox(width: 12),
                              Text(
                                "Logout",
                                style: TextStyle(
                                  color: Colors.red[400],
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
          if (_isLoggingOut)
            const ModalBarrier(
              dismissible: false,
              color: Colors.black54,
            ),
        ],
      ),
    );
  }

  Widget _buildSettingsSection(
    BuildContext context, {
    required String title,
    required List<Widget> items,
  }) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8, bottom: 8),
          child: Text(
            title,
            style: theme.textTheme.titleSmall?.copyWith(
              color: isDarkMode ? Colors.grey[400] : Colors.grey[600],
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          color: isDarkMode ? Colors.grey[800] : Colors.white,
          child: Column(
            children: items,
          ),
        ),
      ],
    );
  }

  Widget _buildSettingsItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Row(
          children: [
            Icon(
              icon,
              color: isDarkMode ? Colors.grey[300] : Colors.grey[700],
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Icon(
              Icons.chevron_right_rounded,
              color: isDarkMode ? Colors.grey[500] : Colors.grey[400],
            ),
          ],
        ),
      ),
    );
  }
}