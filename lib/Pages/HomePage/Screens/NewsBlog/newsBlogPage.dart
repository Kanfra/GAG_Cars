import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/Appbar/customAppbarOne.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/IconButtons/customRoundIconButton.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/Links/links.dart';
import 'package:gag_cars_frontend/GlobalVariables/colorGlobalVariables.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Screens/NewsBlog/allPage.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Screens/NewsBlog/evPage.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Screens/NewsBlog/popularPage.dart';

class NewsBlogPage extends StatefulWidget {
  const NewsBlogPage({super.key});

  @override
  State<NewsBlogPage> createState() => _NewsBlogPageState();
}

class _NewsBlogPageState extends State<NewsBlogPage> { 
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<Widget> newsBlogTabPages = const [
    AllPage(),
    PopularPage(),
    EVPage()
  ];

  @override
  void initState() {
    super.initState();
    _pageController.addListener(_handlePageChange);
  }

  void _handlePageChange() {
    final newPage = _pageController.page?.round() ?? 0;
    if (_currentIndex != newPage) {
      setState(() => _currentIndex = newPage);
    }
  }

  void _onTabTapped(int index) {
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  @override
  void dispose() {
    _pageController.removeListener(_handlePageChange);
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        onLeadingIconClickFunction: (){}, 
        isLeadingWidgetExist: ColorGlobalVariables.trueValue, 
        leadingIconData: Icons.menu,
        leadingIconDataColor: ColorGlobalVariables.fadedBlackColor,
        titleText: 'GAG News',
        titleTextColor: ColorGlobalVariables.redColor,
        centerTitle: ColorGlobalVariables.trueValue,
        actions: [
          const SizedBox(width: 5,),
          // globe icon button
          CustomRoundIconButton(
            iconData: FontAwesomeIcons.globe, 
            buttonSize: 35,
            iconSize: 18,
            isBorderSlightlyCurved: ColorGlobalVariables.falseValue, 
            onIconButtonClickFunction: (){}
            ),
          const SizedBox(width: 3,),
          // bell notification icon
          Stack(
            children: [
              CustomRoundIconButton(
                iconData: Icons.notifications, 
                iconSize: 18,
                buttonSize: 35,
                isBorderSlightlyCurved: ColorGlobalVariables.falseValue, 
                onIconButtonClickFunction: (){}
                ),
              Positioned(
                right: 2,
                top: 3,
                child: Container(
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors.red, // Dot color
                    shape: BoxShape.circle,
                  ),
                  constraints: BoxConstraints(
                    minWidth: 8,
                    minHeight: 8,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 5,),
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Tab Links Row
            Row(
              children: [
                _buildTabLink(0, "All"),
                const SizedBox(width: 15),
                _buildTabLink(1, "Popular"),
                const SizedBox(width: 15),
                _buildTabLink(2, "EV"),
              ],
            ),
            
            // PageView Content - Takes full width
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) => setState(() => _currentIndex = index),
                children: newsBlogTabPages,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabLink(int tabIndex, String text) {
    final isSelected = _currentIndex == tabIndex;
    return Links(
            linkTextType: text, 
            isTextSmall: ColorGlobalVariables.trueValue, 
            linkTextColor: isSelected ? ColorGlobalVariables.blackColor : ColorGlobalVariables.fadedBlackColor, 
            textDecoration: isSelected ? TextDecoration.underline : TextDecoration.none,
            linkFontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
            isIconWidgetRequiredAtEnd: ColorGlobalVariables.falseValue, 
            isIconWidgetRequiredAtFront: ColorGlobalVariables.falseValue, 
            onClickFunction: () => _onTabTapped(tabIndex)
                    );
    // GestureDetector(
    //   onTap: () => _onTabTapped(tabIndex),
    //   child: Text(
    //     text,
    //     style: TextStyle(
    //       color: isSelected 
    //           ? ColorGlobalVariables.blackColor 
    //           : ColorGlobalVariables.fadedBlackColor,
    //       fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
    //       fontSize: isSelected ? 16 : 14,
    //       decoration: isSelected 
    //           ? TextDecoration.underline 
    //           : TextDecoration.none,
    //     ),
    //   ),
    // );
  }
}