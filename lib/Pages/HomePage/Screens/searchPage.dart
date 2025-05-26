import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:lottie/lottie.dart';

// Import your custom components here (replace with actual paths)
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/Buttons/customTextButton.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/IconButtons/customRoundIconButton.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/Links/links.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/Text/textLarge.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/Text/textMedium.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/Text/textSmall.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/TextFormFields/customTextFormField.dart';
import 'package:gag_cars_frontend/GlobalVariables/colorGlobalVariables.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController searchEditingController = TextEditingController();
  bool searchNotFound = false;
  SfRangeValues _priceRange = const SfRangeValues(700, 2000);
  List<String> recents = [
    "McLaren", "Mustang", "Camaro", "Audi Sports", 
    "BMW M4", "Tesla", "Mercedes Benz", "Toyota"
  ];

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: screenSize.width,
          height: screenSize.height,
          color: ColorGlobalVariables.whiteColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              // Search field
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: CustomTextFormField(
                  obscureText: false,
                  textInputType: TextInputType.text,
                  hintText: 'Search',
                  cursorColor: ColorGlobalVariables.fadedBlackColor,
                  fillColor: ColorGlobalVariables.textFieldColor,
                  enabledBorderColor: ColorGlobalVariables.textFieldDeeperShadeColor,
                  focusedBorderColor: ColorGlobalVariables.textFieldDeeperShadeColor,
                  prefixIconData: Icons.search,
                  fieldWidth: double.infinity,
                  fieldHeight: 14,
                  suffixIconData: FontAwesomeIcons.sliders,
                  onSuffixIconClickFunction: _showFilterBottomSheet,
                  onChangeFunction: (value) {
                    setState(() {
                      searchEditingController.text = value;
                      searchNotFound = value.isNotEmpty;
                    });
                  },
                  isSuffixIconRequired: true,
                  isPrefixIconRequired: true,
                  editingController: searchEditingController,
                  isFieldHeightRequired: false,
                ),
              ),
              const SizedBox(height: 20),
              // Results header
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: TextMedium(
                        title: searchNotFound 
                          ? "Result for \"${searchEditingController.text}\"" 
                          : "Recent",
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis,
                        textColor: ColorGlobalVariables.blackColor,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Links(
                      linkTextType: searchNotFound ? "0 found" : "Clear All",
                      linkTextColor: ColorGlobalVariables.blackColor,
                      isTextSmall: true,
                      textDecoration: TextDecoration.none,
                      linkFontWeight: FontWeight.bold,
                      isIconWidgetRequiredAtEnd: false,
                      isIconWidgetRequiredAtFront: false,
                      onClickFunction: () {},
                    ),
                  ],
                ),
              ),
              // Divider
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Divider(
                  color: ColorGlobalVariables.fadedBlackColor,
                  height: 8,
                  thickness: 0.1,
                ),
              ),
              // Results list
              Expanded(
                child: searchNotFound
                    ? _buildNotFoundWidget()
                    : ListView.builder(
                        itemCount: recents.length,
                        shrinkWrap: true,
                        primary: true,
                        itemBuilder: (context, index) {
                          return ListTile(
                            contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                            leading: TextSmall(
                              title: recents[index],
                              fontWeight: FontWeight.normal,
                              textColor: ColorGlobalVariables.fadedBlackColor,
                            ),
                            trailing: CustomRoundIconButton(
                              iconData: Icons.close,
                              iconDataColor: ColorGlobalVariables.fadedBlackColor,
                              isBorderSlightlyCurved: false,
                              onIconButtonClickFunction: () {},
                            ),
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNotFoundWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Lottie.asset(
          'assets/lotties/search_not_found.json',
          width: 250,
          height: 250,
          fit: BoxFit.contain,
          repeat: true,
          animate: true,
        ),
        const SizedBox(height: 40),
        TextLarge(
          title: "Not Found",
          fontWeight: FontWeight.bold,
          textColor: ColorGlobalVariables.blackColor,
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextSmall(
            title: "Sorry, the keyword you entered cannot be found. Please check again or search with another keyword.",
            fontWeight: FontWeight.normal,
            textAlign: TextAlign.center,
            textColor: ColorGlobalVariables.blackColor,
          ),
        ),
      ],
    );
  }

  void _showFilterBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => _FilterBottomSheetContent(
        priceRange: _priceRange,
        onPriceRangeChanged: (newRange) {
          setState(() => _priceRange = newRange);
        },
      ),
    );
  }
}

class _FilterBottomSheetContent extends StatefulWidget {
  final SfRangeValues priceRange;
  final ValueChanged<SfRangeValues> onPriceRangeChanged;

  const _FilterBottomSheetContent({
    required this.priceRange,
    required this.onPriceRangeChanged,
  });

  @override
  State<_FilterBottomSheetContent> createState() => _FilterBottomSheetContentState();
}

class _FilterBottomSheetContentState extends State<_FilterBottomSheetContent> {
  late SfRangeValues _priceRange;
  String selectedType = "Economy";
  String selectedCharacteristic = "Air-conditioning";

  @override
  void initState() {
    super.initState();
    _priceRange = widget.priceRange;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: ColorGlobalVariables.whiteColor,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Drag handle
            Center(
              child: Container(
                width: 50,
                height: 3,
                color: ColorGlobalVariables.fadedBlackColor,
              ),
            ),
            const SizedBox(height: 20),
            
            // Price Range
            TextMedium(
              title: "Price Range",
              fontWeight: FontWeight.bold,
              textColor: ColorGlobalVariables.blackColor,
            ),
            const SizedBox(height: 8),
            SfRangeSlider(
              min: 0,
              max: 10000,
              values: _priceRange,
              interval: 1000,
              activeColor: ColorGlobalVariables.lemonGreenColor,
              //inactiveColor: ColorGlobalVariables.fadedBlackColor,
              showTicks: true,
              enableTooltip: true,
              tooltipTextFormatterCallback: (value, _) => '\$${value.toInt()}',
              onChanged: (values) {
                setState(() => _priceRange = values);
                widget.onPriceRangeChanged(values);
              },
            ),
            const SizedBox(height: 40),
            
            // Vehicle Types
            TextMedium(
              title: "Types",
              fontWeight: FontWeight.bold,
              textColor: ColorGlobalVariables.blackColor,
            ),
            const SizedBox(height: 15),
            _buildTypeButtons(),
            const SizedBox(height: 40),
            
            // Characteristics
            TextMedium(
              title: "Vehicle Characteristics",
              fontWeight: FontWeight.bold,
              textColor: ColorGlobalVariables.blackColor,
            ),
            const SizedBox(height: 20),
            _buildCharacteristicButtons(),
            const SizedBox(height: 40),
            
            // Action Buttons
            Row(
              children: [
                Expanded(
                  child: CustomTextButton(
                    buttonTextType: 'Clear All',
                    textTypeColor: ColorGlobalVariables.blackColor,
                    buttonVerticalPadding: 15,
                    buttonBackgroundColor: ColorGlobalVariables.textFieldColor,
                    onClickFunction: () => Navigator.pop(context), 
                    isFullButtonWidthRequired: false,
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: CustomTextButton(
                    buttonTextType: 'Apply',
                    textTypeColor: ColorGlobalVariables.blackColor,
                    buttonVerticalPadding: 15,
                    buttonBackgroundColor: ColorGlobalVariables.lemonGreenColor,
                    onClickFunction: () => Navigator.pop(context), 
                    isFullButtonWidthRequired: false,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildTypeButtons() {
    const types = ["Economy", "Luxury", "Sedan", "Compact", "Hatchback", "SUV"];
    
    return Column(
      children: [
        // First row of buttons
        Row(
          children: [
            for (final type in types.take(4))
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: CustomTextButton(
                    buttonTextType: type,
                    borderColor: selectedType == type 
                        ? ColorGlobalVariables.lemonGreenColor 
                        : ColorGlobalVariables.blackColor,
                    textTypeColor: selectedType == type 
                        ? ColorGlobalVariables.lemonGreenColor 
                        : ColorGlobalVariables.blackColor,
                    borderThickness: selectedType == type ? 0.8 : 0.1,
                    buttonBackgroundColor: Colors.white,
                    onClickFunction: () => setState(() => selectedType = type), 
                    isFullButtonWidthRequired: false,
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(height: 10),
        // Second row of buttons
        Row(
          children: [
            for (final type in types.skip(4))
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: CustomTextButton(
                    buttonTextType: type,
                    borderColor: selectedType == type 
                        ? ColorGlobalVariables.lemonGreenColor 
                        : ColorGlobalVariables.blackColor,
                    textTypeColor: selectedType == type 
                        ? ColorGlobalVariables.lemonGreenColor 
                        : ColorGlobalVariables.blackColor,
                    borderThickness: selectedType == type ? 0.8 : 0.1,
                    buttonBackgroundColor: Colors.white,
                    onClickFunction: () => setState(() => selectedType = type), 
                    isFullButtonWidthRequired: false,
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }

  Widget _buildCharacteristicButtons() {
    const characteristics = [
      "Air-conditioning", 
      "Automatic", 
      "Manual"
    ];
    
    return Row(
      children: [
        for (final char in characteristics)
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 15),
              child: CustomTextButton(
                buttonTextType: char,
                borderColor: selectedCharacteristic == char 
                    ? ColorGlobalVariables.lemonGreenColor 
                    : ColorGlobalVariables.blackColor,
                textTypeColor: selectedCharacteristic == char 
                    ? ColorGlobalVariables.lemonGreenColor 
                    : ColorGlobalVariables.blackColor,
                borderThickness: selectedCharacteristic == char ? 0.8 : 0.1,
                buttonBackgroundColor: Colors.white,
                onClickFunction: () => setState(() => selectedCharacteristic = char), 
                isFullButtonWidthRequired: false,
              ),
            ),
          ),
      ],
    );
  }
}