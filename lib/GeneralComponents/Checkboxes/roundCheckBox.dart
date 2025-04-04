


import 'package:flutter/material.dart';

import '../../GlobalVariables/colorGlobalVariables.dart';
import '../../GlobalVariables/sizeGlobalVariables.dart';
import '../Text/textSmall.dart';
import '../customIcon.dart';

class RoundCheckBox extends StatelessWidget {
  final VoidCallback? onTap;
  final String checkboxTextType;
  final bool isChecked;
  final double? checkBoxBorderRadius;
  final bool isIconAtFrontRequired;
  final IconData? iconAtFrontData;
  final Color? iconAtFrontColor;
  final double? iconAtFrontSize;
  final Color? isCheckedColor;
  final Color? checkBoxTextColor;
  final FontWeight? checkBoxTextFontWeight;
  final double? checkBoxTextSize;
  const RoundCheckBox({
    required this.checkboxTextType,
    this.isCheckedColor,
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
                    borderRadius: BorderRadius.circular( checkBoxBorderRadius ?? SizeGlobalVariables.double_size_eighteen),
                    border: Border.all(
                      color: isChecked ? isCheckedColor ?? ColorGlobalVariables.greenColor : ColorGlobalVariables.greyColor,
                      ),
                  ),
                  child: Container(
                    margin: const EdgeInsets.all(1),
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: isChecked ? isCheckedColor ?? ColorGlobalVariables.greenColor : ColorGlobalVariables.whiteColor,
                      borderRadius: BorderRadius.circular(checkBoxBorderRadius ?? SizeGlobalVariables.double_size_eighteen),
                      border: Border.all(
                        color: isChecked ? isCheckedColor ?? ColorGlobalVariables.greenColor : ColorGlobalVariables.whiteColor
                      ),
                    ),
                  )
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