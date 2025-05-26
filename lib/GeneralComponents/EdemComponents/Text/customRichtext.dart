import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../GlobalVariables/sizeGlobalVariables.dart';



class CustomRichtext extends StatelessWidget {
  final String firstTextTitle;
  final Color firstTextColor;
  final double firstTextSize;
  final TextOverflow overflow;
  final TextAlign? textAlign;
  final FontWeight firstTextFontWeight;
  final List<TextSpan> textspans;
  const CustomRichtext({
    required this.firstTextTitle,
    this.textAlign,
    required this.firstTextColor,
    required this.firstTextSize,
    required this.overflow,
    required this.firstTextFontWeight,
    required this.textspans,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      overflow: overflow,
      textAlign: textAlign ?? TextAlign.start,
      text: TextSpan(
          text: firstTextTitle,
          style: GoogleFonts.inter(
            color: firstTextColor,
            height: SizeGlobalVariables.one_point_five,
            fontWeight: firstTextFontWeight,
            fontSize: firstTextSize,
          ),
          children: textspans,
      ),
    );
  }
}
