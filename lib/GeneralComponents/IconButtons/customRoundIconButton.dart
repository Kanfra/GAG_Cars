import 'package:flutter/material.dart';

import '../../GlobalVariables/colorGlobalVariables.dart';
import '../../GlobalVariables/sizeGlobalVariables.dart';

class CustomRoundIconButton extends StatelessWidget {
  final VoidCallback onIconButtonClickFunction;
  final IconData iconData;
  final Color? iconDataColor;
  final double? iconSize;
  final double? buttonSize;
  final String? toolTipText;
  final bool isBorderSlightlyCurved;
  final double? paddingAll;
  final Color? backgroundColor; // New field for background color

  const CustomRoundIconButton({
    required this.iconData,
    this.iconSize,
    this.iconDataColor,
    this.buttonSize,
    this.toolTipText,
    required this.isBorderSlightlyCurved,
    this.paddingAll,
    this.backgroundColor, 
    required this.onIconButtonClickFunction,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: buttonSize ?? SizeGlobalVariables.double_size_forty,
      height: buttonSize ?? SizeGlobalVariables.double_size_forty,
      child: Material(
        color: backgroundColor ?? Colors.transparent, // Set background color
        shape: RoundedRectangleBorder(
          borderRadius: isBorderSlightlyCurved
              ? BorderRadius.circular(SizeGlobalVariables.double_size_five)
              : BorderRadius.circular(SizeGlobalVariables.double_size_thirty),
        ),
        child: IconButton(
          onPressed: onIconButtonClickFunction,
          tooltip: toolTipText,
          //iconSize: SizeGlobalVariables.double_size_forty.sp,
          //padding: EdgeInsets.all(SizeGlobalVariables.double_size_ten.w),
          icon: Icon(
            iconData,
            color: iconDataColor ?? ColorGlobalVariables.fadedBlackColor,
            size: iconSize ?? SizeGlobalVariables.double_size_twenty,
          ),
        ),
      ),
    );
  }
}
