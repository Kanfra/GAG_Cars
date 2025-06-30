import 'package:flutter/material.dart';
import 'package:gag_cars_frontend/GlobalVariables/colorGlobalVariables.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key, 
    required this.isLoading,
    required this.buttonName, 
    this.backgroundColor,
    this.onPressed
    });
final String buttonName;
final bool isLoading;
final Color? backgroundColor;
final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return 
                                           ElevatedButton(
  onPressed: onPressed,
  style: ElevatedButton.styleFrom(
    backgroundColor: backgroundColor ?? Color.fromRGBO(159, 16, 16, 1),
    minimumSize: Size(double.infinity, 64), // full width, 64 height
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    elevation: 0, // optional: remove shadow
  ),
  child: isLoading ? CircularProgressIndicator(color: ColorGlobalVariables.whiteColor,) : Text(
   buttonName,
    style: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: Color.fromRGBO(255, 255, 255, 1),
    ),
  ),
);

  }
}