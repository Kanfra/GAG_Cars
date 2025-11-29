import 'package:flutter/material.dart';
import 'package:gag_cars_frontend/GeneralComponents/AtillahComponents/customListTile.dart';
import 'package:gag_cars_frontend/Routes/routeClass.dart';
import 'package:get/get.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/Appbar/customAppbarOne.dart';
import 'package:gag_cars_frontend/GlobalVariables/colorGlobalVariables.dart';

class SecurityPage extends StatefulWidget {
  const SecurityPage({super.key});

  @override
  State<SecurityPage> createState() => _SecurityPageState();
}

class _SecurityPageState extends State<SecurityPage> {
  // Security features state
  final bool _biometricEnabled = true;
  final bool _twoFactorEnabled = false;
  final bool _emailNotifications = true;
  final bool _smsAlerts = false;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final screenSize = MediaQuery.of(context).size;
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: isDarkMode ? const Color(0xFF303030) : Colors.grey[50],
      appBar: CustomAppbar(
        onLeadingIconClickFunction: () => Get.back(),
        isLeadingWidgetExist: true,
        leadingIconData: Icons.arrow_back_ios_new_outlined,
        leadingIconDataColor: isDarkMode ? Colors.white : Colors.black87,
        titleText: "Security",
        titleTextWeight: FontWeight.bold,
        titleTextSize: 22,
        centerTitle: true,
        titleTextColor: isDarkMode ? Colors.white : ColorGlobalVariables.brownColor,
      ),
      body: Column(
        children: [
          // Header Section
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  ColorGlobalVariables.brownColor.withOpacity(0.9),
                  ColorGlobalVariables.brownColor.withOpacity(0.7),
                ],
              ),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24),
              ),
            ),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.security_rounded,
                    size: 40,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Account Security',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Manage your security preferences and keep your account safe',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white.withOpacity(0.9),
                  ),
                ),
              ],
            ),
          ),

          // Security Options List
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Quick Actions Section
                  _buildSectionHeader(
                    title: 'Quick Actions',
                    icon: Icons.flash_on_rounded,
                    isDarkMode: isDarkMode,
                  ),
                  const SizedBox(height: 16),

                  // Change Password Card
                  _buildSecurityCard(
                    icon: Icons.lock_reset_rounded,
                    iconColor: Colors.blue,
                    iconBackground: isDarkMode ? Colors.blue.withOpacity(0.2) : Colors.blue[50],
                    title: 'Change Password',
                    subtitle: 'Update your account password regularly',
                    onTap: () {
                      Get.toNamed(RouteClass.getChangePassword());
                    },
                    trailing: Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 16,
                      color: isDarkMode ? Colors.white70 : Colors.grey[600],
                    ),
                    isDarkMode: isDarkMode,
                  ),
                  const SizedBox(height: 16),

                  // Security Settings Section
                  // _buildSectionHeader(
                  //   title: 'Security Settings',
                  //   icon: Icons.settings_rounded,
                  //   isDarkMode: isDarkMode,
                  // ),
                  // const SizedBox(height: 16),

                  // // Biometric Authentication
                  // _buildSecurityCard(
                  //   icon: Icons.fingerprint_rounded,
                  //   iconColor: Colors.green,
                  //   iconBackground: isDarkMode ? Colors.green.withOpacity(0.2) : Colors.green[50],
                  //   title: 'Biometric Authentication',
                  //   subtitle: 'Use fingerprint or face ID to login',
                  //   onTap: () {
                  //     setState(() {
                  //       _biometricEnabled = !_biometricEnabled;
                  //     });
                  //   },
                  //   trailing: Transform.scale(
                  //     scale: 0.8,
                  //     child: Switch(
                  //       value: _biometricEnabled,
                  //       onChanged: (value) {
                  //         setState(() {
                  //           _biometricEnabled = value;
                  //         });
                  //       },
                  //       activeColor: Colors.green,
                  //       activeTrackColor: isDarkMode ? Colors.green.withOpacity(0.5) : Colors.green[200],
                  //     ),
                  //   ),
                  //   isDarkMode: isDarkMode,
                  // ),
                  // const SizedBox(height: 12),

                  // // Two-Factor Authentication
                  // _buildSecurityCard(
                  //   icon: Icons.verified_user_rounded,
                  //   iconColor: Colors.orange,
                  //   iconBackground: isDarkMode ? Colors.orange.withOpacity(0.2) : Colors.orange[50],
                  //   title: 'Two-Factor Authentication',
                  //   subtitle: 'Add an extra layer of security',
                  //   onTap: () {
                  //     setState(() {
                  //       _twoFactorEnabled = !_twoFactorEnabled;
                  //     });
                  //   },
                  //   trailing: Transform.scale(
                  //     scale: 0.8,
                  //     child: Switch(
                  //       value: _twoFactorEnabled,
                  //       onChanged: (value) {
                  //         setState(() {
                  //           _twoFactorEnabled = value;
                  //         });
                  //       },
                  //       activeColor: Colors.orange,
                  //       activeTrackColor: isDarkMode ? Colors.orange.withOpacity(0.5) : Colors.orange[200],
                  //     ),
                  //   ),
                  //   isDarkMode: isDarkMode,
                  // ),
                  // const SizedBox(height: 12),

                  // // Email Notifications
                  // _buildSecurityCard(
                  //   icon: Icons.email_rounded,
                  //   iconColor: Colors.purple,
                  //   iconBackground: isDarkMode ? Colors.purple.withOpacity(0.2) : Colors.purple[50],
                  //   title: 'Email Notifications',
                  //   subtitle: 'Get alerts for security events',
                  //   onTap: () {
                  //     setState(() {
                  //       _emailNotifications = !_emailNotifications;
                  //     });
                  //   },
                  //   trailing: Transform.scale(
                  //     scale: 0.8,
                  //     child: Switch(
                  //       value: _emailNotifications,
                  //       onChanged: (value) {
                  //         setState(() {
                  //           _emailNotifications = value;
                  //         });
                  //       },
                  //       activeColor: Colors.purple,
                  //       activeTrackColor: isDarkMode ? Colors.purple.withOpacity(0.5) : Colors.purple[200],
                  //     ),
                  //   ),
                  //   isDarkMode: isDarkMode,
                  // ),
                  // const SizedBox(height: 12),

                  // // SMS Alerts
                  // _buildSecurityCard(
                  //   icon: Icons.sms_rounded,
                  //   iconColor: Colors.red,
                  //   iconBackground: isDarkMode ? Colors.red.withOpacity(0.2) : Colors.red[50],
                  //   title: 'SMS Security Alerts',
                  //   subtitle: 'Receive security alerts via SMS',
                  //   onTap: () {
                  //     setState(() {
                  //       _smsAlerts = !_smsAlerts;
                  //     });
                  //   },
                  //   trailing: Transform.scale(
                  //     scale: 0.8,
                  //     child: Switch(
                  //       value: _smsAlerts,
                  //       onChanged: (value) {
                  //         setState(() {
                  //           _smsAlerts = value;
                  //         });
                  //       },
                  //       activeColor: Colors.red,
                  //       activeTrackColor: isDarkMode ? Colors.red.withOpacity(0.5) : Colors.red[200],
                  //     ),
                  //   ),
                  //   isDarkMode: isDarkMode,
                  // ),

                  // Security Tips Section
                  const SizedBox(height: 32),
                  _buildSectionHeader(
                    title: 'Security Tips',
                    icon: Icons.lightbulb_rounded,
                    isDarkMode: isDarkMode,
                  ),
                  const SizedBox(height: 16),

                  _buildTipCard(
                    icon: Icons.update_rounded,
                    title: 'Regular Updates',
                    description: 'Change your password every 3 months',
                    isDarkMode: isDarkMode,
                  ),
                  const SizedBox(height: 12),
                  _buildTipCard(
                    icon: Icons.phonelink_lock_rounded,
                    title: 'Device Security',
                    description: 'Keep your device OS and apps updated',
                    isDarkMode: isDarkMode,
                  ),
                  const SizedBox(height: 12),
                  _buildTipCard(
                    icon: Icons.warning_rounded,
                    title: 'Suspicious Activity',
                    description: 'Report any unusual activity immediately',
                    isDarkMode: isDarkMode,
                  ),

                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),

      // Emergency Action Button
      // floatingActionButton: Container(
      //   margin: const EdgeInsets.only(bottom: 16),
      //   child: FloatingActionButton.extended(
      //     onPressed: () {
      //       _showEmergencyActions(context);
      //     },
      //     backgroundColor: Colors.red,
      //     foregroundColor: Colors.white,
      //     elevation: 4,
      //     icon: const Icon(Icons.emergency_rounded),
      //     label: const Text('Emergency'),
      //   ),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _buildSectionHeader({required String title, required IconData icon, required bool isDarkMode}) {
    return Row(
      children: [
        Icon(
          icon,
          size: 20,
          color: isDarkMode ? Colors.white70 : ColorGlobalVariables.brownColor,
        ),
        const SizedBox(width: 8),
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: isDarkMode ? Colors.white : Colors.grey[800],
          ),
        ),
      ],
    );
  }

  Widget _buildSecurityCard({
    required IconData icon,
    required Color? iconColor,
    required Color? iconBackground,
    required String title,
    required String subtitle,
    required Widget trailing,
    required VoidCallback onTap,
    required bool isDarkMode,
  }) {
    return Card(
      elevation: isDarkMode ? 4 : 2,
      color: isDarkMode ? const Color(0xFF424242) : Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              // Icon Container
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: iconBackground,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon,
                  size: 20,
                  color: iconColor,
                ),
              ),
              const SizedBox(width: 16),

              // Text Content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: isDarkMode ? Colors.white : Colors.grey[800],
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 12,
                        color: isDarkMode ? Colors.white70 : Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),

              // Trailing Widget
              trailing,
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTipCard({
    required IconData icon,
    required String title,
    required String description,
    required bool isDarkMode,
  }) {
    return Card(
      elevation: 1,
      color: isDarkMode ? Colors.blue.withOpacity(0.1) : Colors.blue[50],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: isDarkMode ? Colors.blue.withOpacity(0.3) : Colors.blue[100]!,
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Icon(
              icon,
              size: 20,
              color: isDarkMode ? Colors.blue[300] : Colors.blue[700],
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: isDarkMode ? Colors.blue[200] : Colors.blue[800],
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 12,
                      color: isDarkMode ? Colors.blue[300] : Colors.blue[700],
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

  void _showEmergencyActions(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    
    showModalBottomSheet(
      context: context,
      backgroundColor: isDarkMode ? const Color(0xFF424242) : Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: isDarkMode ? Colors.grey[600] : Colors.grey[300],
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Emergency Actions',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: isDarkMode ? Colors.white : Colors.grey[800],
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Immediate security measures you can take',
                style: TextStyle(
                  fontSize: 14,
                  color: isDarkMode ? Colors.white70 : Colors.grey[600],
                ),
              ),
              const SizedBox(height: 24),

              // Emergency Options
              _buildEmergencyOption(
                icon: Icons.lock_clock_rounded,
                title: 'Temporary Lock',
                subtitle: 'Lock your account temporarily',
                color: Colors.orange,
                isDarkMode: isDarkMode,
              ),
              const SizedBox(height: 12),
              _buildEmergencyOption(
                icon: Icons.devices_rounded,
                title: 'Logout All Devices',
                subtitle: 'Sign out from all connected devices',
                color: Colors.red,
                isDarkMode: isDarkMode,
              ),
              const SizedBox(height: 12),
              _buildEmergencyOption(
                icon: Icons.support_agent_rounded,
                title: 'Contact Support',
                subtitle: 'Get immediate help from our team',
                color: Colors.blue,
                isDarkMode: isDarkMode,
              ),
              const SizedBox(height: 24),

              // Cancel Button
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () => Navigator.pop(context),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: isDarkMode ? Colors.white70 : Colors.grey[600],
                    side: BorderSide(
                      color: isDarkMode ? Colors.grey[600]! : Colors.grey[300]!
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text('Cancel'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildEmergencyOption({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    required bool isDarkMode,
  }) {
    return Card(
      elevation: 1,
      color: isDarkMode ? const Color(0xFF424242) : Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: color.withOpacity(isDarkMode ? 0.2 : 0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                size: 20,
                color: color,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: color,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 12,
                      color: isDarkMode ? Colors.white70 : Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios_rounded,
              size: 16,
              color: isDarkMode ? Colors.white60 : Colors.grey[400],
            ),
          ],
        ),
      ),
    );
  }
}