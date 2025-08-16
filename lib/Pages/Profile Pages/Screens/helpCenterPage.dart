import 'package:flutter/material.dart';
import 'package:gag_cars_frontend/GlobalVariables/colorGlobalVariables.dart';
import 'package:gag_cars_frontend/Pages/Profile%20Pages/Screens/contactUs.dart';
import 'package:gag_cars_frontend/Pages/Profile%20Pages/Screens/faq.dart';
import 'package:get/get.dart';
import '../../../GeneralComponents/EdemComponents/Appbar/customAppbarOne.dart';

class HelpCenterPage extends StatefulWidget {
  const HelpCenterPage({super.key});

  @override
  State<HelpCenterPage> createState() => _HelpCenterPageState();
}

class _HelpCenterPageState extends State<HelpCenterPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final double _tabIndicatorHeight = 3.0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDarkMode ? Colors.grey[900] : Colors.grey[50],
      appBar: CustomAppbar(
        onLeadingIconClickFunction: () => Get.back(),
        isLeadingWidgetExist: true,
        appbarBackgroundColor: ColorGlobalVariables.whiteColor,
        leadingIconData: Icons.arrow_back_ios_new_outlined,
        titleText: 'Help Center',
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Custom Tab Bar with smooth animation
          Container(
            decoration: BoxDecoration(
              color: isDarkMode ? Colors.grey[850] : Colors.white,
              boxShadow: [
                if (!isDarkMode)
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  ),
              ],
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: TabBar(
                    controller: _tabController,
                    indicator: UnderlineTabIndicator(
                      borderSide: BorderSide(
                        width: _tabIndicatorHeight,
                        color: theme.primaryColor,
                      ),
                      insets: EdgeInsets.only(
                        bottom: _tabIndicatorHeight / 2,
                      ),
                    ),
                    labelColor: theme.primaryColor,
                    unselectedLabelColor: isDarkMode 
                        ? Colors.grey[400] 
                        : Colors.grey[600],
                    labelStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                    unselectedLabelStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    tabs: const [
                      Tab(text: 'FAQs'),
                      Tab(text: 'Contact Us'),
                    ],
                  ),
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  height: _tabIndicatorHeight,
                  color: isDarkMode ? Colors.grey[800] : Colors.grey[200],
                ),
              ],
            ),
          ),

          // TabBarView content with fade transition
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildPageWithPadding(const Faq()),
                _buildPageWithPadding(const ContactUs()),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPageWithPadding(Widget child) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: child,
    );
  }
}