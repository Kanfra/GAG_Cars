import 'package:flutter/material.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/Text/textMedium.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/Text/textSmall.dart';

class TitleWithRowComponent extends StatelessWidget {
  // for textSmall
  final String title;
  final FontWeight fontWeight;
  final TextOverflow? overflow;
  final Color textColor;
  final double? textSize;
  final TextAlign? textAlign;
  final TextDecoration? textDecoration;
  final Color? textDecorationColor;
  final List<Widget> children;

  const TitleWithRowComponent({
    super.key,
    required this.title,
    required this.fontWeight,
    this.overflow,
    required this.textColor,
    this.textSize,
    this.textAlign,
    this.textDecoration,
    this.textDecorationColor,
    required this.children,

    });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // title
        TextMedium(
          title: title, 
          fontWeight: fontWeight, 
          textColor: textColor
          ),
        const SizedBox(height: 15,),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: children,
        ),
      ],
    );
  }
}