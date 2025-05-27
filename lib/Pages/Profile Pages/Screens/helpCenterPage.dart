import 'package:flutter/material.dart';
import 'package:gag_cars_frontend/Pages/Profile%20Pages/Screens/contactUs.dart';
import 'package:gag_cars_frontend/Pages/Profile%20Pages/Screens/faq.dart';
import '../../../GeneralComponents/EdemComponents/Appbar/customAppbarOne.dart';

class HelpCenterPage extends StatefulWidget {
  const HelpCenterPage({super.key});

  @override
  State<HelpCenterPage> createState() => _HelpCenterPageState();
}

class _HelpCenterPageState extends State<HelpCenterPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {}); // This updates the tab styling when selected
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppbar(onLeadingIconClickFunction: () {  },
          isLeadingWidgetExist: true,
          leadingIconData: Icons.arrow_back_ios_new_outlined,
          titleText: 'Help Center',
          centerTitle: true,
        ),
        body: Column(
          children: [
            // Custom Tab Header
            SizedBox(
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildTabHeader("FAQ", 0),
                  const SizedBox(width: 20),
                  _buildTabHeader("Contact Us", 1),
                ],
              ),
            ),

            // TabBarView content
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: const [
                  Faq(),
                  ContactUs()
                  // Center(child: Text('FAQ Content')),
                  // Center(child: Text('Contact Us Content')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabHeader(String title, int index) {
    bool isSelected = _tabController.index == index;

    return GestureDetector(
      onTap: () => _tabController.animateTo(index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: isSelected ? Colors.black : Colors.black26,
            ),
          ),
          const SizedBox(height: 6),
          Container(height: 2, width: 130, color:  isSelected ? Colors.transparent : Colors.black26),
          Container(height: 2, width: 130, color: isSelected ? Colors.black : Colors.transparent),
        ],
      ),
    );
  }
}
