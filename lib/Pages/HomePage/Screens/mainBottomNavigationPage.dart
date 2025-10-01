import 'package:flutter/material.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/Text/textSmall.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/customIcon.dart';
import 'package:gag_cars_frontend/GlobalVariables/colorGlobalVariables.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Screens/homePage.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Screens/postItemPage.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Screens/wishlistPage.dart';
import 'package:gag_cars_frontend/Pages/Messages/Screens/messagesPage.dart';
import 'package:gag_cars_frontend/Pages/ProfilePages/Screens/settingsPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
          selectedItemColor: ColorGlobalVariables.brownColor,
          unselectedItemColor: ColorGlobalVariables.greyColor,
        ),
      ),
      home: MainBottomNavigationPage(),
    );
  }
}

class MainBottomNavigationPage extends StatefulWidget {
  @override
  _MainBottomNavigationPageState createState() => _MainBottomNavigationPageState();
}

class _MainBottomNavigationPageState extends State<MainBottomNavigationPage> 
    with TickerProviderStateMixin {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();
  
  // Animation controllers for smooth transitions
  late AnimationController _scaleController;
  late Animation<double> _scaleAnimation;

  final List<BottomNavigationItem> _navItems = [
    BottomNavigationItem(
      icon: Icons.home_outlined,
      activeIcon: Icons.home_rounded,
      label: "Home",
      page: const HomePage(),
    ),
    BottomNavigationItem(
      icon: Icons.favorite_outline,
      activeIcon: Icons.favorite_rounded,
      label: "Favorite",
      page: const WishlistPage(),
    ),
    BottomNavigationItem(
      icon: Icons.add_circle_outline,
      activeIcon: Icons.add_circle_rounded,
      label: "Post",
      page: const PostItemPage(),
    ),
    BottomNavigationItem(
      icon: Icons.chat_bubble_outline,
      activeIcon: Icons.chat_bubble_rounded,
      label: "Messages",
      page: const MessagesPage(),
    ),
    BottomNavigationItem(
      icon: Icons.person_outline,
      activeIcon: Icons.person_rounded,
      label: "Profile",
      page: const SettingsPage(),
    ),
  ];

  @override
  void initState() {
    super.initState();
    _scaleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(parent: _scaleController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _scaleController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    if (index == 2) {
      // Special animation for the center button
      _scaleController.forward().then((_) {
        _scaleController.reverse();
      });
    }

    setState(() => _selectedIndex = index);
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: _navItems.map((item) => item.page).toList(),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 16,
            offset: const Offset(0, -2),
          ),
        ],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        child: BottomAppBar(
          elevation: 0,
          height: 70,
          padding: EdgeInsets.zero,
          color: Colors.white,
          surfaceTintColor: Colors.transparent,
          child: Row(
            children: [
              // Left side items
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildNavItem(0),
                    _buildNavItem(1),
                  ],
                ),
              ),
              
              // Center floating button
              SizedBox(
                width: 60,
                child: ScaleTransition(
                  scale: _scaleAnimation,
                  child: FloatingActionButton(
                    onPressed: () => _onItemTapped(2),
                    elevation: 0,
                    backgroundColor: ColorGlobalVariables.brownColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Icon(
                      _selectedIndex == 2 
                          ? _navItems[2].activeIcon
                          : _navItems[2].icon,
                      color: Colors.white,
                      size: 28,
                    ),
                  ),
                ),
              ),
              
              // Right side items
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildNavItem(3),
                    _buildNavItem(4),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(int index) {
    final item = _navItems[index];
    final isSelected = _selectedIndex == index;
    
    // Skip the center item in the side navigation
    if (index == 2) return const SizedBox.shrink();

    return GestureDetector(
      onTap: () => _onItemTapped(index),
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: isSelected 
              ? ColorGlobalVariables.brownColor.withOpacity(0.1)
              : Colors.transparent,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomIcon(
              iconData: isSelected ? item.activeIcon : item.icon,
              isFaIcon: false,
              iconSize: 24,
              iconColor: isSelected 
                  ? ColorGlobalVariables.brownColor 
                  : ColorGlobalVariables.greyColor,
            ),
            const SizedBox(height: 4),
            if (isSelected)
              AnimatedOpacity(
                duration: const Duration(milliseconds: 200),
                opacity: isSelected ? 1.0 : 0.0,
                child: TextSmall(
                  title: item.label,
                  fontWeight: FontWeight.w600,
                  textColor: ColorGlobalVariables.brownColor,
                  textSize: 11,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class BottomNavigationItem {
  final IconData icon;
  final IconData activeIcon;
  final String label;
  final Widget page;

  const BottomNavigationItem({
    required this.icon,
    required this.activeIcon,
    required this.label,
    required this.page,
  });
}