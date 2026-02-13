import 'package:flutter/cupertino.dart';

import '../../../GlobalVariables/colorGlobalVariables.dart';

class ToggleButton extends StatelessWidget {
  final bool? isToggleOn;
  final ValueChanged<bool> onChangeFunction;
  final Color? activeColor;
  const ToggleButton({
    this.isToggleOn,
    required this.onChangeFunction,
    this.activeColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoSwitch(
      value: isToggleOn ?? ColorGlobalVariables.falseValue,
      activeTrackColor: activeColor ?? ColorGlobalVariables.buttonColor,
      onChanged: onChangeFunction,
    );
  }
}
