



import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../GlobalVariables/sizeGlobalVariables.dart';

class CustomIcon extends StatelessWidget {
  final IconData iconData;
  final bool isFaIcon;
  final double? iconSize;
  final Color iconColor;
  const CustomIcon({
    required this.iconData,
    required this.isFaIcon,
    this.iconSize,
    required this.iconColor,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return isFaIcon ? FaIcon(
      iconData,
      color: iconColor,
      size: iconSize ?? SizeGlobalVariables.double_size_eighteen,
    ) : Icon(
      iconData,
      color: iconColor,
      size: iconSize ?? SizeGlobalVariables.double_size_eighteen,
    );
  }
}
