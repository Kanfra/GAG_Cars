import 'package:flutter/material.dart';

import '../../../GlobalVariables/colorGlobalVariables.dart';
import '../../../GlobalVariables/sizeGlobalVariables.dart';
import '../Text/customRichtext.dart';
import '../customIcon.dart';


class RichTextCheckBox extends StatelessWidget {
  final String firstTextTitle;
  final TextAlign textAlign;
  final Color firstTextColor;
  final double firstTextSize;
  final TextOverflow overflow;
  final FontWeight firstTextFontWeight;
  final List<TextSpan> textspans;
  final bool isChecked;
  final VoidCallback onTap;
  const RichTextCheckBox({
    required this.firstTextTitle,
    required this.textAlign,
    required this.firstTextColor,
    required this.firstTextSize,
    required this.overflow,
    required this.firstTextFontWeight,
    required this.textspans,
    required this.isChecked,
    required this.onTap,
    super.key
    });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // checkbox container
                Padding(
                  padding: const EdgeInsets.only(top: SizeGlobalVariables.double_size_five,),
                  child: Container(
                    alignment: Alignment.center,
                    width: SizeGlobalVariables.double_size_eighteen,
                    height: SizeGlobalVariables.double_size_eighteen,
                    decoration: BoxDecoration(
                      color: isChecked ? ColorGlobalVariables.greenColor : ColorGlobalVariables.whiteColor,
                      borderRadius: BorderRadius.circular(SizeGlobalVariables.double_size_four),
                      border: Border.all(
                        color: isChecked ? ColorGlobalVariables.whiteColor : ColorGlobalVariables.fadedBlackColor,
                        ),
                    ),
                    child: CustomIcon(
                      iconData: Icons.check, 
                      isFaIcon: ColorGlobalVariables.falseValue,
                      iconSize: SizeGlobalVariables.double_size_fourteen,
                      iconColor: isChecked ? ColorGlobalVariables.whiteColor : ColorGlobalVariables.whiteColor
                      ),
                  ),
                ),
                SizedBox(width: SizeGlobalVariables.double_size_five,),
                // check box info
                CustomRichtext(
                  firstTextTitle: firstTextTitle, 
                  textAlign: textAlign,
                  firstTextColor: firstTextColor, 
                  firstTextSize: firstTextSize, 
                  overflow: overflow, 
                  firstTextFontWeight: firstTextFontWeight, 
                  textspans: textspans
                  ),
              ],
        ),
);
  }
}