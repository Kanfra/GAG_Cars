import 'package:flutter/material.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/Text/textSmall.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/customIcon.dart';
import 'package:gag_cars_frontend/GlobalVariables/colorGlobalVariables.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Screens/homePage.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Screens/sellCarPage.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Screens/wishlistPage.dart';
import 'package:gag_cars_frontend/Pages/Messages/Screens/messagesPage.dart';
import 'package:gag_cars_frontend/Pages/Profile%20Pages/Screens/settingsPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainBottomNavigationPage(),
    );
  }
}

class MainBottomNavigationPage extends StatefulWidget {
  @override
  _MainBottomNavigationPageState createState() => _MainBottomNavigationPageState();
}

class _MainBottomNavigationPageState extends State<MainBottomNavigationPage> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  final List<Widget> _pages = [
    const HomePage(),
    const WishlistPage(),
    const SellCarPage(),
    const MessagesPage(),
    const SettingsPage(),
  ];

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        children: _pages,
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
            ),
          ],
          color: Colors.white,
        ),
        child: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 8.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              _buildNavItem(Icons.home, "Home", 0),
              _buildNavItem(Icons.favorite, "Favorite", 1),
              SizedBox(width: 40), // space for the center button
              _buildNavItem(Icons.message, "Messages", 3),
              _buildNavItem(Icons.person, "Profile", 4),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _onItemTapped(2),
        child: Icon(Icons.add),
        backgroundColor: Colors.blueAccent,
        elevation: 4.0,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    final isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 2),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // icon
            Expanded(
              child: CustomIcon(
                iconData: icon,
                isFaIcon: false,
                iconSize: 25,
                iconColor: isSelected ? ColorGlobalVariables.blueColor : ColorGlobalVariables.greyColor,
                ),
            ),
            const SizedBox(height: 2),
            if (isSelected)
              TextSmall(
                title: label, 
                fontWeight: FontWeight.w500, 
                textColor: ColorGlobalVariables.blueColor,
                overflow: TextOverflow.ellipsis,
                ),
          ],
        ),
      ),
    );
  }
} 
