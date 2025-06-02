
import 'package:flutter/material.dart';

import '../../../GlobalVariables/colorGlobalVariables.dart';
import '../../../GlobalVariables/sizeGlobalVariables.dart';


class CardContainer extends StatelessWidget {
  final Size screenSize;
  final Color cardBackgroundColor;
  final double? paddingHorizontal;
  final double? paddingVertical;
  final Color? cardBorderColor;
  final List<Widget> columnList;
  final bool isBoxShadowFeatureRequired;
  final MainAxisAlignment? mainAxisAlignment;
  final CrossAxisAlignment? crossAxisAlignment;
  final double? cardWidth;
  final double? cardBorderWidth;
  final double? marginBottom;
  const CardContainer({
    required this.screenSize,
    required this.cardBackgroundColor,
    this.paddingHorizontal,
    this.paddingVertical,
    this.cardBorderColor,
    required this.columnList,
    required this.isBoxShadowFeatureRequired,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
    this.cardWidth,
    this.cardBorderWidth,
    this.marginBottom,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(
          bottom: marginBottom ?? screenSize.height*SizeGlobalVariables.point_zero_two,),
        padding: EdgeInsets.symmetric(
            horizontal: paddingHorizontal ?? SizeGlobalVariables.double_size_twelve,
            vertical: paddingVertical ?? SizeGlobalVariables.double_size_twelve,
        ),
        width: cardWidth ?? double.infinity,
        decoration: BoxDecoration(
          color: cardBackgroundColor,
          borderRadius: BorderRadius.circular(SizeGlobalVariables.double_size_eight),
          boxShadow: isBoxShadowFeatureRequired ? [
             BoxShadow(
              color: ColorGlobalVariables.greyColor,
              spreadRadius: SizeGlobalVariables.point_one,
              blurRadius: SizeGlobalVariables.point_one,
              offset: Offset(
                SizeGlobalVariables.point_one,
                SizeGlobalVariables.point_two
              ),
            ),
          ] : [],
          border: isBoxShadowFeatureRequired ? Border.all(
            color: Colors.transparent,
            width: SizeGlobalVariables.zero,
          ) : Border.all(
            color: cardBorderColor ?? Colors.transparent,
            width: cardBorderWidth ?? SizeGlobalVariables.point_one,
          ),
        ),
        child: Column(
          crossAxisAlignment: crossAxisAlignment ??  CrossAxisAlignment.start,
          mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
          children: columnList,
        ),
      );
  }  
}
