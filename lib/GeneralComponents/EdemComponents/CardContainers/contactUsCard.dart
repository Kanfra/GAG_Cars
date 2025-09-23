import 'package:flutter/material.dart';
import '../../../GlobalVariables/colorGlobalVariables.dart';
import '../../../GlobalVariables/sizeGlobalVariables.dart';

class ContactUsCard extends StatelessWidget {
  final Size screenSize;
  final Color cardBackgroundColor;
  final double? paddingHorizontal;
  final double? paddingVertical;
  final Color? cardBorderColor;
  final List<Widget> rowItems;
  final bool isBoxShadowFeatureRequired;
  final MainAxisAlignment? mainAxisAlignment;
  final CrossAxisAlignment? crossAxisAlignment;
  final double? cardWidth;
  final double? cardBorderWidth;
  final double? marginBottom;
  final VoidCallback? onTapFunction;
  final double? borderRadius;
  final Color? splashColor;
  final Color? highlightColor;
  final Duration? animationDuration;

  const ContactUsCard({
    required this.screenSize,
    required this.cardBackgroundColor,
    this.paddingHorizontal,
    this.paddingVertical,
    this.cardBorderColor,
    required this.rowItems,
    required this.isBoxShadowFeatureRequired,
    this.mainAxisAlignment,
    this.onTapFunction,
    this.crossAxisAlignment,
    this.cardWidth,
    this.cardBorderWidth,
    this.marginBottom,
    this.borderRadius,
    this.splashColor,
    this.highlightColor,
    this.animationDuration,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    return Padding(
      padding: EdgeInsets.only(
        bottom: marginBottom ?? SizeGlobalVariables.double_size_sixteen,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTapFunction,
          borderRadius: BorderRadius.circular(
            borderRadius ?? SizeGlobalVariables.double_size_sixteen,
          ),
          splashColor: splashColor ?? theme.primaryColor.withOpacity(0.1),
          highlightColor: highlightColor ?? theme.primaryColor.withOpacity(0.05),
          child: AnimatedContainer(
            duration: animationDuration ?? const Duration(milliseconds: 200),
            curve: Curves.easeOutQuart,
            padding: EdgeInsets.symmetric(
              horizontal: paddingHorizontal ?? SizeGlobalVariables.double_size_sixteen,
              vertical: paddingVertical ?? SizeGlobalVariables.double_size_sixteen,
            ),
            width: cardWidth ?? double.infinity,
            decoration: BoxDecoration(
              color: isDarkMode 
                  ? cardBackgroundColor.withOpacity(0.9)
                  : cardBackgroundColor,
              borderRadius: BorderRadius.circular(
                borderRadius ?? SizeGlobalVariables.double_size_sixteen,
              ),
              boxShadow: isBoxShadowFeatureRequired
                  ? [
                      BoxShadow(
                        color: isDarkMode
                            ? Colors.black.withOpacity(0.4)
                            : ColorGlobalVariables.greyColor.withOpacity(0.2),
                        spreadRadius: SizeGlobalVariables.point_two,
                        blurRadius: SizeGlobalVariables.double_size_twelve,
                        offset: const Offset(0, 4),
                      ),
                    ]
                  : null,
              border: Border.all(
                color: cardBorderColor ?? 
                    (isDarkMode 
                        ? Colors.grey[800]! 
                        : Colors.grey[200]!),
                width: cardBorderWidth ?? SizeGlobalVariables.point_two,
              ),
              gradient: isBoxShadowFeatureRequired
                  ? LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        cardBackgroundColor,
                        cardBackgroundColor.withOpacity(0.95),
                      ],
                    )
                  : null,
            ),
            child: Row(
              mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
              crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
              children: rowItems.map((item) {
                return Flexible(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: item,
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
