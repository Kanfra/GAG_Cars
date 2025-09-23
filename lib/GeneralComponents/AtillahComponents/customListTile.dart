import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final IconData leadingIcon;
  final String title;
  final IconData trailingIcon;
  final bool isTrailingIconRequired;
final VoidCallback? onTap;
  final Color? iconColor;
  final Color? textColor;
  final double? iconSize;
  final double? fontSize;
  final EdgeInsetsGeometry? padding;

  const CustomListTile({
    super.key,
    required this.leadingIcon,
    required this.isTrailingIconRequired,
    required this.title,
    this.trailingIcon = Icons.arrow_forward_ios,
    this.onTap,
    this.iconColor,
    this.textColor,
    this.iconSize = 24,
    this.fontSize = 16,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: padding ?? const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  leadingIcon,
                  size: iconSize,
                  color: iconColor ?? Theme.of(context).primaryColor,
                ),
                const SizedBox(width: 16),
                Text(
                  title,
                  style: TextStyle(
                    color: textColor ?? Colors.black,
                    fontSize: fontSize,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            isTrailingIconRequired ? Icon(
              trailingIcon,
              size: 20,
              color: iconColor ?? Colors.grey[600],
            ) : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
