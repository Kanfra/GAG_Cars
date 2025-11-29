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
  // Add null/empty check at the beginning
  if (isoDate.isEmpty) {
    return 'Recently';
  }
  
  try {
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
      return '$diffInDays ${diffInDays == 1 ? 'day' : 'days'} ago at ${date.format(pattern: "h:mm a")}';
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
  } catch (e) {
    // Handle any parsing errors
    return 'Recently';
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
  final isDarkMode = Get.isDarkMode;
  
  Get.bottomSheet(
    Container(
      decoration: BoxDecoration(
        color: isDarkMode ? const Color(0xFF424242) : Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20)),
      ),
      child: Wrap(
        children: [
          ListTile(
            leading: Icon(
              Icons.camera_alt,
              color: isDarkMode ? Colors.white70 : Colors.black87,
            ),
            title: Text(
              'Take Photo',
              style: TextStyle(
                color: isDarkMode ? Colors.white : Colors.black87,
              ),
            ),
            onTap: () {
              Get.back();
              pickImage(ImageSource.camera, picker, setStateFunction);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.photo_library,
              color: isDarkMode ? Colors.white70 : Colors.black87,
            ),
            title: Text(
              'Choose from Gallery',
              style: TextStyle(
                color: isDarkMode ? Colors.white : Colors.black87,
              ),
            ),
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
  final isDarkMode = Theme.of(context).brightness == Brightness.dark;
  
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      backgroundColor: backgroundColor,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.all(16),
    ),
  );
}

void showFilterBottomSheet({
  required BuildContext context,
  required Widget widget,
}) {
  final isDarkMode = Theme.of(context).brightness == Brightness.dark;
  
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: isDarkMode ? const Color(0xFF424242) : Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
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
            color: isDarkMode ? const Color(0xFF424242) : Colors.white,
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
                  hintStyle: TextStyle(
                    color: isDarkMode ? Colors.white60 : Colors.grey[600],
                  ),
                  labelText: fieldName,
                  labelStyle: TextStyle(
                    color: isDarkMode ? Colors.grey[400] : Colors.grey[600],
                  ),
                  filled: true,
                  fillColor: isDarkMode ? const Color(0xFF303030) : Colors.grey[100],
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
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: isDarkMode ? Colors.grey[700]! : Colors.grey[300]!,
                      width: 1,
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
                        color: isDarkMode ? Colors.white70 : Colors.grey[600],
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

// Enhanced image picker with dark mode support
Future<void> showEnhancedImageSourceDialog({
  required ImagePicker picker, 
  required ValueChanged setStateFunction,
  BuildContext? context,
}) async {
  final isDarkMode = context != null 
      ? Theme.of(context).brightness == Brightness.dark
      : Get.isDarkMode;

  await Get.bottomSheet(
    Container(
      decoration: BoxDecoration(
        color: isDarkMode ? const Color(0xFF424242) : Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: isDarkMode ? Colors.grey[700]! : Colors.grey[200]!,
                  ),
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.photo_camera,
                    color: isDarkMode ? Colors.white70 : Colors.black87,
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'Choose Photo',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: isDarkMode ? Colors.white : Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
            // Options
            ListTile(
              leading: Icon(
                Icons.camera_alt,
                color: isDarkMode ? Colors.white70 : ColorGlobalVariables.brownColor,
              ),
              title: Text(
                'Take Photo',
                style: TextStyle(
                  color: isDarkMode ? Colors.white : Colors.black87,
                  fontWeight: FontWeight.w500,
                ),
              ),
              subtitle: Text(
                'Use your camera',
                style: TextStyle(
                  color: isDarkMode ? Colors.white60 : Colors.grey[600],
                ),
              ),
              onTap: () {
                Get.back();
                pickImage(ImageSource.camera, picker, setStateFunction);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.photo_library,
                color: isDarkMode ? Colors.white70 : ColorGlobalVariables.brownColor,
              ),
              title: Text(
                'Choose from Gallery',
                style: TextStyle(
                  color: isDarkMode ? Colors.white : Colors.black87,
                  fontWeight: FontWeight.w500,
                ),
              ),
              subtitle: Text(
                'Select from your photos',
                style: TextStyle(
                  color: isDarkMode ? Colors.white60 : Colors.grey[600],
                ),
              ),
              onTap: () {
                Get.back();
                pickImage(ImageSource.gallery, picker, setStateFunction);
              },
            ),
            // Cancel Button
            Container(
              padding: const EdgeInsets.all(16),
              child: SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () => Get.back(),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    side: BorderSide(
                      color: isDarkMode ? Colors.grey[700]! : Colors.grey[300]!,
                    ),
                  ),
                  child: Text(
                    'Cancel',
                    style: TextStyle(
                      color: isDarkMode ? Colors.white70 : Colors.grey[700],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

// Enhanced snackbar with dark mode detection
void showEnhancedCustomSnackBar({
  String? title,
  required String message,
  Color? backgroundColor,
  Color? textColor,
  Duration? duration,
  SnackPosition? position,
  bool success = false,
  bool warning = false,
  bool error = false,
}) {
  final isDarkMode = Get.isDarkMode;
  
  // Determine background color based on type
  Color bgColor;
  if (backgroundColor != null) {
    bgColor = backgroundColor;
  } else if (success) {
    bgColor = ColorGlobalVariables.greenColor;
  } else if (warning) {
    bgColor = Colors.orange;
  } else if (error) {
    bgColor = ColorGlobalVariables.redColor;
  } else {
    bgColor = isDarkMode ? Colors.grey[800]! : ColorGlobalVariables.brownColor;
  }

  Get.snackbar(
    title ?? (success ? 'Success' : warning ? 'Warning' : error ? 'Error' : 'Info'),
    message,
    backgroundColor: bgColor,
    colorText: textColor ?? Colors.white,
    duration: duration ?? const Duration(seconds: 3),
    snackPosition: position ?? SnackPosition.BOTTOM,
    margin: const EdgeInsets.all(16),
    borderRadius: 12,
    boxShadows: [
      BoxShadow(
        color: Colors.black.withOpacity(0.1),
        blurRadius: 8,
        offset: const Offset(0, 2),
      ),
    ],
    isDismissible: true,
    dismissDirection: DismissDirection.horizontal,
  );
}

// helper widget for proper disposal
class DisposableBuilder extends StatefulWidget {
  final VoidCallback dispose;
  final Widget child;

  const DisposableBuilder({
    required this.dispose,
    required this.child,
    super.key,
  });

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