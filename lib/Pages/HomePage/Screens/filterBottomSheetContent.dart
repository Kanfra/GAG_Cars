import 'package:flutter/material.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/Buttons/customTextButton.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/Text/textMedium.dart';
import 'package:gag_cars_frontend/GlobalVariables/colorGlobalVariables.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class FilterBottomSheetContent extends StatefulWidget {
  final SfRangeValues priceRange;
  final ValueChanged<SfRangeValues> onPriceRangeChanged;

  const FilterBottomSheetContent({
    required this.priceRange,
    required this.onPriceRangeChanged,
  });

  @override
  State<FilterBottomSheetContent> createState() => FilterBottomSheetContentState();
}
class FilterBottomSheetContentState extends State<FilterBottomSheetContent> {
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