import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';

import '../../GlobalVariables/colorGlobalVariables.dart';

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
