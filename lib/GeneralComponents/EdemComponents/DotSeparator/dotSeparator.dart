import 'package:flutter/material.dart';

import '../../../GlobalVariables/colorGlobalVariables.dart';


class DotSeparator extends StatelessWidget {
  final double? dotSize;
  final Color? dotColor;
  final Color? dotBorderColor;
  final double? dotBorderWidth;
  const DotSeparator({
    this.dotSize,
    this.dotColor,
    this.dotBorderColor,
    this.dotBorderWidth,
    super.key
    });

  @override
  Widget build(BuildContext context) {
    return Container(
              width: dotSize ?? 2,
              height: dotSize ?? 2,
              decoration: BoxDecoration(
                color: dotColor ?? ColorGlobalVariables.fadedBlackColor,
                borderRadius: BorderRadius.circular(dotSize ?? 2),
                border: Border.all(
                  color: dotBorderColor ?? ColorGlobalVariables.blackColor,
                  width: dotBorderWidth ?? 1.0
                )
              ),
            );
  }
}