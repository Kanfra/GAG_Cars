import 'package:flutter/material.dart';
import '../../../GlobalVariables/sizeGlobalVariables.dart';
import '../Text/textSmall.dart';

class CustomTextButton extends StatelessWidget {
  final String buttonTextType;
  final Color textTypeColor;
  final FontWeight? fontWeight;
  final double? borderRadius;
  final double? textButtonHeight;
  final double? textButtonWidth;
  final double? textSize;
  final Color? borderColor;
  final double? borderThickness;
  final bool isFullButtonWidthRequired;
  final Color buttonBackgroundColor;
  final double? containerMarginHorizontal;
  final double? buttonHorizontalPadding;
  final double? buttonVerticalPadding;
  final VoidCallback? onClickFunction; // Changed to nullable

  const CustomTextButton({
    required this.buttonTextType,
    required this.textTypeColor,
    this.borderRadius,
    this.textSize,
    this.fontWeight,
    this.textButtonHeight,
    this.textButtonWidth,
    this.borderColor,
    this.borderThickness,
    required this.isFullButtonWidthRequired,
    required this.buttonBackgroundColor,
    this.containerMarginHorizontal,
    this.buttonHorizontalPadding,
    this.buttonVerticalPadding,
    this.onClickFunction, // Made optional
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return isFullButtonWidthRequired ? Padding(
      padding: EdgeInsets.symmetric(
        horizontal: containerMarginHorizontal ?? SizeGlobalVariables.zero,
      ),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius ?? SizeGlobalVariables.double_size_eight),
          color: Colors.transparent,
        ),
        child: TextButton(
          onPressed: onClickFunction, // Now accepts null
          style: TextButton.styleFrom(
            elevation: SizeGlobalVariables.one_point_two,
            backgroundColor: buttonBackgroundColor,
            padding: EdgeInsets.symmetric(
              horizontal: buttonHorizontalPadding ?? 5, 
              vertical: buttonVerticalPadding ?? 5
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? SizeGlobalVariables.double_size_eight),
              side: BorderSide(
                color: borderColor ?? Colors.transparent,
                width: borderThickness ?? SizeGlobalVariables.zero,
              ),
            ),
          ),
          child: TextSmall(
            title: buttonTextType,
            textColor: textTypeColor, 
            fontWeight: fontWeight ?? FontWeight.normal,
            textSize: textSize,
          ),
        ),
      ),
    ) : Container(
      width: textButtonWidth,
      height: textButtonHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius ?? SizeGlobalVariables.double_size_eight),
        color: Colors.transparent,
      ),
      child: TextButton(
        onPressed: onClickFunction, // Now accepts null
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(
            horizontal: buttonHorizontalPadding ?? 5, 
            vertical: buttonVerticalPadding ?? 5
          ),
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
        child: TextSmall(
          title: buttonTextType,
          textColor: textTypeColor, 
          fontWeight: fontWeight ?? FontWeight.normal,
          textSize: textSize,
        ),
      ),
    );
  }
}