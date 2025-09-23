import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';
import 'package:logger/logger.dart';
import 'package:uuid/uuid.dart';

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

// pick an image
Future<void>  pickImage(ImageSource source, ImagePicker picker, ValueChanged setStateFunction) async {
  try{
    final pickedFile = await picker.pickImage(source: source);
    if(pickedFile != null){
      setStateFunction(pickedFile);
    }
  }catch(e){
    showCustomSnackBar(
      title: "Error",
      message: "Failed to pick image: ${e.toString()}"
    );
  }
}

// pick image dialog
  void showImageSourceDialog({
    required ImagePicker picker, 
    required ValueChanged setStateFunction
    }) {
    Get.bottomSheet(
      Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20)),
        ),
        child: Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('Take Photo'),
              onTap: () {
                Get.back();
                pickImage(ImageSource.camera, picker, setStateFunction);
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Choose from Gallery'),
              onTap: () {
                Get.back();
                pickImage(ImageSource.gallery, picker, setStateFunction);
              },
            ),
          ],
        ),
      ),
    );
  }
// bubble snackbar for sign up
void showCustomSnackBar({
  String? title,
  String? message,
  Color? backgroundColor = ColorGlobalVariables.redColor,
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
        title ?? 'Error',
        message ?? 'An error occurred',
        backgroundColor: backgroundColor,
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

// snackbar for other pages
void showCustomAppSnackBar({
  required BuildContext context, 
  required String message,
  Color backgroundColor = ColorGlobalVariables.redColor,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: backgroundColor,
      ),
    );
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

String createSlug({required String name, required bool isUniqueRandomSlugRequiredOrTimestampSlug}){
  String input = name.toLowerCase().replaceAll(RegExp(r'[^a-z0-9\s-]'), ''). trim().replaceAll(RegExp(r'\s+'), '-').replaceAll(RegExp(r'-+'), '-');
  if(isUniqueRandomSlugRequiredOrTimestampSlug){
    final uniqueId = const Uuid().v4().split('-').first;
    return '$input-$uniqueId';
  }
  else{
    return '$input-${DateTime.now().millisecondsSinceEpoch}';
  }
}

Future<void> showFieldInputDialog({
  required String fieldLabel,
  required String fieldName,
  required String fieldType,
  required String selectedField,
  required BuildContext context,
  required ValueChanged<String> setStateFunction,
}) async {
  final logger = Logger();
  final controller = TextEditingController(text: selectedField);
  // degugging lifecycle
  logger.i("Dialog TextEditingController created");

  final theme = Theme.of(context);
  final isDarkMode = theme.brightness == Brightness.dark;

  final result = await showDialog<String>(
    context: context,
    barrierDismissible: false,
    // this ensures controller is disposed when dialog is closed
    builder: (context) => DisposableBuilder(
      dispose: (){
        controller.dispose();
        logger.i("Dialog TextEditingController disposed");
      },
      // actual disposal log
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
          ),
        backgroundColor: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: isDarkMode ? Colors.grey[900] : Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 10,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Enter $fieldLabel',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: isDarkMode ? Colors.white : Colors.grey[800],
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: controller,
                keyboardType: fieldType.toLowerCase() == "number" 
                    ? TextInputType.number 
                    : TextInputType.text,
                style: TextStyle(
                  color: isDarkMode ? Colors.white : Colors.grey[800],
                  fontSize: 16,
                ),
                decoration: InputDecoration(
                  hintText: "Enter $fieldLabel...",
                  labelText: fieldName,
                  labelStyle: TextStyle(
                    color: isDarkMode ? Colors.grey[400] : Colors.grey[600],
                  ),
                  filled: true,
                  fillColor: isDarkMode ? Colors.grey[800] : Colors.grey[100],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16, vertical: 14),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: theme.primaryColor,
                      width: 2,
                    ),
                  ),
                ),
                autofocus: true,
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    ),
                    child: Text(
                      'Cancel',
                      style: TextStyle(
                        color: isDarkMode ? Colors.grey[400] : Colors.grey[600],
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  ElevatedButton(
                    onPressed: () {
                      final value = controller.text.trim();
                      if (value.isNotEmpty) {
                        Navigator.pop(context, value);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: theme.primaryColor,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                      elevation: 0,
                      shadowColor: Colors.transparent,
                    ),
                    child: Text(
                      'Confirm',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );

  if (result != null && result.isNotEmpty) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setStateFunction(result);
    });
  }
}

// helper widget for proper disposal
class DisposableBuilder extends StatefulWidget {
  final VoidCallback dispose;
  final Widget child;

  const DisposableBuilder({
    required this.dispose,
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  _DisposableBuilderState createState() => _DisposableBuilderState();
}

class _DisposableBuilderState extends State<DisposableBuilder> {
  @override
  void dispose() {
    widget.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
