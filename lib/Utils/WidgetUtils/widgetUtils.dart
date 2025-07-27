import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';

import '../../GlobalVariables/colorGlobalVariables.dart';

// format number
String formatNumber({
  required bool shortenerRequired,
  required int number
  }){
  if(shortenerRequired){
    if(number >= 1000000){
      return '${NumberFormat("#,##0").format((number / 1000000))}M';
    }
    else if(number >= 1000){
      return '${NumberFormat("#,##0").format(number / 1000)}K';
    }
    else {
      return NumberFormat.decimalPattern().format(number);
    }
  }
  return NumberFormat("#,##0.00").format(number);
}

// date time formatter
String formatTimeAgo(String isoDate) {
  final date = Jiffy.parse(isoDate);
  final now = Jiffy.now();
  final diffInDays = now.diff(date, unit: Unit.day);

  // Less than 1 day ago (show relative time)
  if (diffInDays == 0) {
    final diffInHours = now.diff(date, unit: Unit.hour);
    if (diffInHours > 0) {
      return '$diffInHours ${diffInHours == 1 ? 'hour' : 'hours'} ago';
    } else {
      final diffInMinutes = now.diff(date, unit: Unit.minute);
      return diffInMinutes > 1 ? '$diffInMinutes minutes ago' : 'Just now';
    }
  } 
  // 1-30 days ago (show "X days ago" + time)
  else if (diffInDays <= 30) {
    return '${diffInDays} ${diffInDays == 1 ? 'day' : 'days'} ago at ${date.format(pattern: "h:mm a")}';
  }
  // 1-12 months ago (show "X months ago" + time)
  else if (diffInDays <= 365) {
    final months = (diffInDays / 30).floor();
    return '$months ${months == 1 ? 'month' : 'months'} ago at ${date.format(pattern: "h:mm a")}';
  }
  // Older than 1 year (show full date + time)
  else {
    return date.format(pattern: "MMM d, y 'at' h:mm a");
  }
}
// snackbar
void showCustomSnackBar({
  String? title,
  String? message,
  Color? backgroundColor,
  Color? textColor,
  Duration? duration,
  SnackPosition? position,
  Widget? mainButton,
  bool isGetSnackBar = true, // Choose between Get.snackbar or ScaffoldMessenger
  BuildContext? context, // Only needed if isGetSnackBar = false
  SnackBarAction? action, // Only works with ScaffoldMessenger
}) {
  try {
    if (isGetSnackBar) {
      // Using GetX snackbar (recommended)
      Get.snackbar(
        title ?? '',
        message ?? 'An error occurred',
        backgroundColor: backgroundColor ?? ColorGlobalVariables.redColor,
        colorText: textColor ?? ColorGlobalVariables.whiteColor,
        duration: duration ?? const Duration(seconds: 3),
        snackPosition: position ?? SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(16),
        borderRadius: 12,
        // mainButton: mainButton,
      );
    } else {
      // Fallback to ScaffoldMessenger (when context is available)
      if (context == null || !context.mounted) return;
      
      final scaffoldMessenger = ScaffoldMessenger.of(context);
      scaffoldMessenger.clearSnackBars();

      final snackBar = SnackBar(
        content: Text(
          message ?? "An error occurred",
          style: TextStyle(color: textColor ?? ColorGlobalVariables.whiteColor),
        ),
        backgroundColor: backgroundColor ?? ColorGlobalVariables.redColor,
        duration: duration ?? const Duration(seconds: 3),
        action: action,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      );

      scaffoldMessenger.showSnackBar(snackBar);
    }
  } catch (e) {
    debugPrint("Failed to show snackbar: $e");
  }
}

void showFilterBottomSheet({
  required BuildContext context,
  required Widget widget,
}) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => widget
    );
  }
