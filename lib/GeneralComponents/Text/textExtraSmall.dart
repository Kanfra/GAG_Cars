import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../GlobalVariables/sizeGlobalVariables.dart';


class TextExtraSmall extends StatelessWidget {
  final String title;
  FontWeight? fontWeight;
  TextOverflow? overflow;
  final Color textColor;
  double? textSize;
  TextDecoration? textDecoration;
  Color? textDecorationColor;
  TextExtraSmall({
    required this.title,
    this.fontWeight,
    this.overflow,
    required this.textColor,
    this.textSize,
    this.textDecoration,
    this.textDecorationColor,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      overflow: overflow ?? TextOverflow.ellipsis,
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
