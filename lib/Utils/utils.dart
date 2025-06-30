import 'package:flutter/material.dart';

import '../GlobalVariables/colorGlobalVariables.dart';

void showCustomSnackBar({
  BuildContext? context,
  String? message,
  Color? backgroundColor,
  Color? textColor,
  Duration? duration,
  SnackBarAction? action,
}) {
   // early exit if context is null or invalid
  if(context == null || !context.mounted) return;
  try{
    final scaffoldMessenger = ScaffoldMessenger.of(context);
  // Remove any currently showing snackbars
  scaffoldMessenger.clearSnackBars();

  final snackBar = SnackBar(
    content: Text(
      message ?? "An error occured",
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
  }catch(e){
    debugPrint("Failed to show snackbar: $e");
  }
}
