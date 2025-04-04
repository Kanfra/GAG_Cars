

import 'package:flutter/material.dart';

import '../../GlobalVariables/colorGlobalVariables.dart';
import '../../GlobalVariables/sizeGlobalVariables.dart';
import '../Text/textSmall.dart';
import '../customIcon.dart';

class CustomShowMenuButton extends StatelessWidget {
  final String buttonTextType;
  final Color textTypeColor;
  final double? borderRadius;
  final Color? borderColor;
  final double? borderThickness;
  final Color buttonBackgroundColor;
  final VoidCallback onClickFunction;
  final IconData iconData;
  final Color? iconColor;
  final double? iconSize;
  
  const CustomShowMenuButton({
    required this.buttonTextType,
    required this.textTypeColor,
    this.borderRadius,
    this.borderColor,
    this.borderThickness,
    required this.buttonBackgroundColor,
    required this.iconData,
    this.iconColor,
    this.iconSize,
    required this.onClickFunction,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius ?? SizeGlobalVariables.double_size_eight),
        color: Colors.transparent,
      ),
      child: TextButton(
        onPressed: onClickFunction,
        style: TextButton.styleFrom(
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
        child: Row(
          children: [
            SizedBox(width: SizeGlobalVariables.double_size_five,),
            // icon type
            CustomIcon(
              iconData: iconData, 
              isFaIcon: ColorGlobalVariables.falseValue,
              iconColor: iconColor,
              iconSize: iconSize,
              ),
              SizedBox(width: SizeGlobalVariables.double_size_five,),
              // text type
              TextSmall(
                title: buttonTextType,
                textColor: textTypeColor, fontWeight: FontWeight.normal,
              ),
              const Spacer(),
              // drop down arrow button
              CustomIcon(
                iconData: Icons.expand_more, 
                isFaIcon: ColorGlobalVariables.falseValue,
                iconColor: ColorGlobalVariables.greyColor
                ),
              SizedBox(width: SizeGlobalVariables.double_size_five,),
          ],
        ),
      ),
    ); 
  }
}
