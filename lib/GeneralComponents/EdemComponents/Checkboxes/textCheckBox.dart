import 'package:flutter/material.dart';

import '../../../GlobalVariables/colorGlobalVariables.dart';
import '../../../GlobalVariables/sizeGlobalVariables.dart';
import '../Text/textSmall.dart';
import '../customIcon.dart';

class TextCheckBox extends StatelessWidget {
  final VoidCallback? onTap;
  final String checkboxTextType;
  final bool isChecked;
  final Color? checkBoxIconColor;
  final double? checkBoxBorderRadius;
  final bool isIconAtFrontRequired;
  final IconData? iconAtFrontData;
  final Color? iconAtFrontColor;
  final double? iconAtFrontSize;
  final Color? isCheckedColor;
  final Color? checkBoxTextColor;
  final FontWeight? checkBoxTextFontWeight;
  final double? checkBoxTextSize;
  const TextCheckBox({
    required this.checkboxTextType,
    this.isCheckedColor,
    this.checkBoxIconColor,
    required this.isChecked,
    this.checkBoxBorderRadius,
    required this.isIconAtFrontRequired,
    this.iconAtFrontData,
    this.iconAtFrontColor,
    this.iconAtFrontSize,
    this.checkBoxTextColor,
    this.checkBoxTextFontWeight,
    this.checkBoxTextSize,
    this.onTap,
    super.key, 
    });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
              children: [
                // isIcon
                isIconAtFrontRequired ? CustomIcon(
                  iconData: iconAtFrontData ?? Icons.error_outline,
                  isFaIcon: ColorGlobalVariables.falseValue, 
                  iconColor: iconAtFrontColor ??  ColorGlobalVariables.redColor,
                  iconSize: iconAtFrontSize,
                  ) : Container(
                  alignment: Alignment.center,
                  width: SizeGlobalVariables.double_size_eighteen,
                  height: SizeGlobalVariables.double_size_eighteen,
                  decoration: BoxDecoration(
                    color: isChecked ? isCheckedColor : ColorGlobalVariables.whiteColor,
                    borderRadius: BorderRadius.circular( checkBoxBorderRadius ?? SizeGlobalVariables.double_size_four),
                    border: Border.all(
                      color: isCheckedColor ?? ColorGlobalVariables.greenColor,
                      ),
                  ),
                  child: CustomIcon(
                    iconData: Icons.check, 
                    isFaIcon: ColorGlobalVariables.falseValue,
                    iconSize: SizeGlobalVariables.double_size_fourteen,
                    iconColor: isChecked ? checkBoxIconColor ?? ColorGlobalVariables.blackColor : ColorGlobalVariables.whiteColor
                    ),
                ),
                SizedBox(width: SizeGlobalVariables.double_size_five,),
                // check box info
                TextSmall(
                  title: checkboxTextType, 
                  textSize: checkBoxTextSize,
                  fontWeight: checkBoxTextFontWeight ?? FontWeight.w500, 
                  textColor: checkBoxTextColor ?? ColorGlobalVariables.blackColor
                  ),
              ],
        ),
);
  }
}