import 'package:flutter/cupertino.dart';
import 'package:gag_cars_frontend/GlobalVariables/colorGlobalVariables.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../GlobalVariables/sizeGlobalVariables.dart';

class TextMedium extends StatelessWidget {
  final String title;
  final FontWeight fontWeight;
  TextOverflow? overflow;
  final Color textColor;
  final TextAlign? textAlign;
  final TextDecoration? textDecoration;
  final Color? textDecorationColor;
  double? textSize;
  TextMedium({
    required this.title,
    required this.fontWeight,
    this.overflow,
    required this.textColor,
    this.textAlign,
    this.textDecoration,
    this.textDecorationColor,
    this.textSize,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign,
      overflow: overflow ?? TextOverflow.ellipsis,
      style: GoogleFonts.inter(
        color: textColor,
        fontWeight: fontWeight,
        decoration: textDecoration ?? TextDecoration.none,
        decorationColor: textDecorationColor ?? ColorGlobalVariables.blackColor,
        fontSize: textSize ?? SizeGlobalVariables.double_size_sixteen,
      ),
    );
  }
}
