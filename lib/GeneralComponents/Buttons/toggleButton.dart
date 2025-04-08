import 'package:flutter/cupertino.dart';

import '../../GlobalVariables/colorGlobalVariables.dart';


class ToggleButton extends StatelessWidget {
  bool? isToggleOn;
  final ValueChanged<bool> onChangeFunction;
  Color? activeColor;
  ToggleButton({
    this.isToggleOn,
    required this.onChangeFunction,
    this.activeColor,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoSwitch(
      value: isToggleOn ?? ColorGlobalVariables.falseValue,
      activeColor: activeColor ?? ColorGlobalVariables.buttonColor,
      onChanged: onChangeFunction
    );
  }
}
