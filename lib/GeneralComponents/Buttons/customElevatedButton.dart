
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../GlobalVariables/sizeGlobalVariables.dart';
import '../Text/textExtraSmall.dart';
import '../Text/textSmall.dart';

class CustomElevatedButton extends StatelessWidget {
  final String buttonTextType;
  final Color textTypeColor;
  final bool isTextSmall;
  final FontWeight? textFontWeight;
  final double? borderRadius;
  final Color? borderColor;
  final double? borderThickness;
  final bool isFullButtonWidthRequired;
  final Color buttonBackgroundColor;
  final VoidCallback? onClickFunction;
  const CustomElevatedButton({
    required this.buttonTextType,
    required this.textTypeColor,
    required this.isTextSmall,
    this.textFontWeight,
    this.borderRadius,
    this.borderColor,
    this.borderThickness,
    required this.isFullButtonWidthRequired,
    required this.buttonBackgroundColor,
    this.onClickFunction,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return isFullButtonWidthRequired ? Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius ?? SizeGlobalVariables.double_size_eight),
        color: Colors.transparent,
      ),
      child: ElevatedButton(
        onPressed: onClickFunction,
        style: ElevatedButton.styleFrom(
          elevation: SizeGlobalVariables.one_point_two,
          backgroundColor: buttonBackgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? SizeGlobalVariables.double_size_eight),
            side: BorderSide(
              color: borderColor ?? Colors.transparent,
              width: borderThickness ?? SizeGlobalVariables.zero,
            ),
          ),
        ),
        child: isTextSmall ? TextSmall(
          title: buttonTextType,
          textColor: textTypeColor, 
          fontWeight: textFontWeight ?? FontWeight.normal,
        ) : TextExtraSmall(
          title: buttonTextType, 
          textColor: textTypeColor,
          fontWeight: textFontWeight ?? FontWeight.normal,
          ),
      ),
    ) : Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius ?? SizeGlobalVariables.double_size_eight),
        color: Colors.transparent,
      ),
      child: ElevatedButton(
        onPressed: onClickFunction,
        style: ElevatedButton.styleFrom(
          elevation: SizeGlobalVariables.one_point_two,
          backgroundColor: buttonBackgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? SizeGlobalVariables.double_size_eight),
            side: BorderSide(
              color: borderColor ?? Colors.transparent,
              width: borderThickness ?? SizeGlobalVariables.zero,
            ),
          ),
        ),
        child: isTextSmall ? TextSmall(
          title: buttonTextType,
          textColor: textTypeColor, 
          fontWeight: textFontWeight ?? FontWeight.normal,
        ) : TextExtraSmall(
          title: buttonTextType, 
          textColor: textTypeColor,
          fontWeight: textFontWeight ?? FontWeight.normal,
          ),
      ),);
  }
}
