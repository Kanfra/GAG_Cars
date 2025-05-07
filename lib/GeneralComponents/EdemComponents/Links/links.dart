import 'package:flutter/material.dart';
import '../../../GlobalVariables/colorGlobalVariables.dart';
import '../../../GlobalVariables/sizeGlobalVariables.dart';
import '../Text/textExtraSmall.dart';
import '../Text/textSmall.dart';
import '../customIcon.dart';

class Links extends StatelessWidget {
  final String linkTextType;
  final Color linkTextColor;
  final bool isTextSmall;
  final bool isIconWidgetRequiredAtEnd;
  final bool isIconWidgetRequiredAtFront;
  final VoidCallback onClickFunction;
  final TextDecoration? textDecoration;
  final Color? textDecorationColor;
  final FontWeight? linkFontWeight;
  final IconData? iconData;
  final Color? backgroundColor;
  final double? linkBorderRadius;
  final Color? iconColor;
  final Color? borderColor;
  final double? iconSize;

  const Links({
    required this.linkTextType,
    required this.linkTextColor,
    required this.isTextSmall,
    this.iconSize,
    required this.isIconWidgetRequiredAtEnd,
    required this.isIconWidgetRequiredAtFront,
    this.textDecoration,
    this.textDecorationColor,
    required this.onClickFunction,
    this.linkFontWeight,
    this.linkBorderRadius,
    this.iconData,
    this.backgroundColor,
    this.iconColor,
    this.borderColor,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onClickFunction,
      style: TextButton.styleFrom(
        padding: EdgeInsets.all(SizeGlobalVariables.double_size_five),
        backgroundColor: backgroundColor ?? Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(linkBorderRadius ?? SizeGlobalVariables.double_size_five),
          side: BorderSide(
            color: borderColor ?? Colors.transparent, // Provide a default color
            width: 0.5, // You should also specify a width for the border
          ),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // front icon
          isIconWidgetRequiredAtFront ? CustomIcon(
            iconData: iconData ?? Icons.edit,
            isFaIcon: ColorGlobalVariables.falseValue,
            iconSize: iconSize,
            iconColor: iconColor ?? ColorGlobalVariables.buttonColor,
          ) : const SizedBox(),
          SizedBox(width: SizeGlobalVariables.double_size_four,),
          // iconTextType
          isTextSmall ? TextSmall(
            title: linkTextType,
            fontWeight: linkFontWeight ?? FontWeight.normal,
            textColor: linkTextColor,
            textDecoration: textDecoration ?? TextDecoration.underline,
            textDecorationColor: textDecorationColor ?? ColorGlobalVariables.blackColor,
          ) : TextExtraSmall(
            title: linkTextType,
            fontWeight: linkFontWeight ?? FontWeight.normal,
            textColor: linkTextColor,
            textDecoration: textDecoration ?? TextDecoration.underline,
            textDecorationColor: textDecorationColor ?? ColorGlobalVariables.blackColor,
          ),
          SizedBox(width: SizeGlobalVariables.double_size_four,),
          // iconType
          isIconWidgetRequiredAtEnd ? CustomIcon(
              iconData: iconData ?? Icons.arrow_forward,
              iconSize: iconSize,
              isFaIcon: ColorGlobalVariables.falseValue,
              iconColor: iconColor ?? ColorGlobalVariables.buttonColor,
          ) : const SizedBox(),
        ],
      ),
    );
  }
}