import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../GlobalVariables/sizeGlobalVariables.dart';


class TextExtraSmall extends StatelessWidget {
  final String title;
  final FontWeight? fontWeight;
  final TextOverflow? overflow;
  final Color textColor;
  final double? textSize;
  final TextDecoration? textDecoration;
  final TextAlign? textAlign;
  final Color? textDecorationColor;
  const TextExtraSmall({
    required this.title,
    this.fontWeight,
    this.overflow,
    required this.textColor,
    this.textSize,
    this.textDecoration,
    this.textDecorationColor,
    this.textAlign,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      overflow: overflow ?? TextOverflow.ellipsis,
      textAlign: textAlign ?? TextAlign.start,
      style: GoogleFonts.inter(
        color: textColor,
        
        fontWeight: fontWeight ?? FontWeight.normal,
        fontSize: textSize ?? SizeGlobalVariables.double_size_twelve,
        decoration: textDecoration ?? TextDecoration.none,
        decorationColor: textDecorationColor ?? Colors.transparent,
      ),
    );
  }
}
