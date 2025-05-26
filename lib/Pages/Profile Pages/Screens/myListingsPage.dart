import 'package:flutter/material.dart';
import 'package:gag_cars_frontend/GeneralComponents/Appbar/customAppbarOne.dart';
import 'package:gag_cars_frontend/GlobalVariables/colorGlobalVariables.dart';
import 'package:gag_cars_frontend/Pages/Profile%20Pages/Screens/live.dart';
import 'package:gag_cars_frontend/Pages/Profile%20Pages/Screens/sold.dart';

class MyListingPage extends StatefulWidget {
  const MyListingPage({super.key});

  @override
  State<MyListingPage> createState() => _MyListingPageState();
}

class _MyListingPageState extends State<MyListingPage>
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
    // final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppbar(onLeadingIconClickFunction: (){},
            isLeadingWidgetExist: true,
            leadingIconData: Icons.arrow_back_ios_new_outlined,
            titleText: "My Listings",
          centerTitle: true,
            titleTextColor: ColorGlobalVariables.redColor,
          actions: [
            IconButton(onPressed: (){},
                icon: const Icon(Icons.notifications_none_outlined)
            )
          ],
        ),
        body: Container(
          padding: const EdgeInsets.all(25),
          child: Column(
            children: [
              // Custom Tab Header
              SizedBox(
                height: 70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildTabHeader("Live", 0),
                    const SizedBox(width: 20),
                    _buildTabHeader("Sold", 1),
                  ],
                ),
              ),

              // TabBarView content
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: const [
                     Padding(
                       padding: EdgeInsets.only(top: 25),
                       child: Live(),
                     ),
                    Padding(
                      padding: EdgeInsets.only(top: 25),
                      child: Sold(),
                    )
                  ],
                ),
              ),
            ],
          ),
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
