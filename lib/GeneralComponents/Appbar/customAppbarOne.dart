

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../GlobalVariables/colorGlobalVariables.dart';
import '../../GlobalVariables/sizeGlobalVariables.dart';
import '../IconButtons/customRoundIconButton.dart';
import '../Text/textLarge.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onLeadingIconClickFunction;
  final List<Widget>? actions;
  final IconData leadingIconData;
  final Color? leadingIconDataColor;
  final bool? centerTitle;
  final String titleText;
  final Color? titleTextColor;
  final bool isLeadingWidgetExist;
  final Color? appbarBackgroundColor;
  const CustomAppbar({
    required this.onLeadingIconClickFunction,
    this.actions,
    required this.isLeadingWidgetExist,
    required this.leadingIconData,
    this.leadingIconDataColor,
    this.centerTitle,
    required this.titleText,
    this.titleTextColor,

    this.appbarBackgroundColor,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: isLeadingWidgetExist ? CustomRoundIconButton(
          onIconButtonClickFunction: onLeadingIconClickFunction,
          iconData: leadingIconData,
          iconDataColor: leadingIconDataColor,
          isBorderSlightlyCurved: ColorGlobalVariables.falseValue,
      ) : const SizedBox(),
      elevation: SizeGlobalVariables.point_five,
      centerTitle: centerTitle ?? ColorGlobalVariables.falseValue,
      backgroundColor: appbarBackgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
      title: TextLarge(
        title: titleText,
        fontWeight: FontWeight.w600,
        textColor: titleTextColor ?? ColorGlobalVariables.blackColor,
      ),
      actions: actions ?? [],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
