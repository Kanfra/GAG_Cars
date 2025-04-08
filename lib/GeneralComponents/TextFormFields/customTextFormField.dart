import 'package:flutter/material.dart';

import '../../GlobalVariables/colorGlobalVariables.dart';
import '../../GlobalVariables/sizeGlobalVariables.dart';

class CustomTextFormField extends StatelessWidget {
  final bool obscureText;
  final TextInputType textInputType;
  final TextEditingController editingController;
  final ValueChanged<String>? onChangeFunction;
  final String? Function(String?)? validatorFunction;
  final VoidCallback? onSuffixIconClickFunction;
  final FocusNode? focusNode;
  final String hintText;
  final IconData? prefixIconData;
  final bool isSuffixIconRequired;
  final bool isPrefixIconRequired;
  final Color? hintTextColor;
  final bool isFieldHeightRequired;
  final double? fieldWidth;
  final int? maxLines;
  final int? minLines;

  const CustomTextFormField({
    required this.obscureText,
    this.focusNode,
    required this.textInputType,
    required this.hintText,
    this.hintTextColor,
    this.prefixIconData,
    required this.isSuffixIconRequired,
    required this.isPrefixIconRequired,
    required this.editingController,
    this.onChangeFunction,
    this.validatorFunction,
    this.maxLines,
    this.minLines,
    this.fieldWidth,
    required this.isFieldHeightRequired,
    this.onSuffixIconClickFunction,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return isFieldHeightRequired ? Container(
      padding: EdgeInsets.symmetric(vertical: SizeGlobalVariables.double_size_five,),
      width: fieldWidth ?? SizeGlobalVariables.double_size_eighty,
      child: TextFormField(
        minLines: minLines ?? SizeGlobalVariables.integer_size_five,
        maxLines: maxLines ?? SizeGlobalVariables.integer_size_six,
        cursorColor: ColorGlobalVariables.greenColor,
        controller: editingController,
        onChanged: onChangeFunction,
        style: TextStyle(
          fontSize: SizeGlobalVariables.double_size_fourteen,
        ),
        keyboardType: textInputType,
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(
            vertical: SizeGlobalVariables.double_size_ten, // Adjust vertical padding
            horizontal: SizeGlobalVariables.double_size_ten,
          ),
          fillColor: ColorGlobalVariables.textFieldColor.withOpacity(SizeGlobalVariables.zero_point_nine_nine),
          filled: ColorGlobalVariables.trueValue,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(SizeGlobalVariables.double_size_eight),
            borderSide: BorderSide(
              color: ColorGlobalVariables.greenColor.withOpacity(SizeGlobalVariables.point_one),
              width: SizeGlobalVariables.one_point_two,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(SizeGlobalVariables.double_size_eight),
            borderSide: BorderSide(
              color: ColorGlobalVariables.greenColor,
              width: SizeGlobalVariables.one_point_two,
            ),
          ),
          hintText: hintText,
          hintStyle: TextStyle(
            color: hintTextColor ?? ColorGlobalVariables.fadedBlackColor.withOpacity(SizeGlobalVariables.point_two_two),
            fontSize: SizeGlobalVariables.double_size_fourteen,
          ),
        ),
      ),
    ) : SizedBox(
      width: fieldWidth ?? SizeGlobalVariables.double_size_eighty,
      height: SizeGlobalVariables.double_size_forty,
      child: TextFormField(
        focusNode: focusNode,
        cursorColor: ColorGlobalVariables.greenColor,
        controller: editingController,
        onChanged: onChangeFunction,
        obscureText: obscureText,
        style: TextStyle(
          fontSize: SizeGlobalVariables.double_size_fourteen,
          color: ColorGlobalVariables.blackColor,
        ),
        validator: validatorFunction, 
        keyboardType: textInputType,
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(
            vertical: SizeGlobalVariables.double_size_ten, // Adjust vertical padding
            horizontal: SizeGlobalVariables.double_size_ten,
          ),
          fillColor: ColorGlobalVariables.textFieldColor,
          filled: ColorGlobalVariables.trueValue,
          prefixIcon: isPrefixIconRequired ? Icon(
            prefixIconData,
            color: ColorGlobalVariables.fadedBlackColor,
            size: SizeGlobalVariables.double_size_eighteen,

          ) : null,
          suffixIcon: isSuffixIconRequired ? GestureDetector(
            onTap: onSuffixIconClickFunction,
            child: Icon(
              obscureText ? Icons.visibility : Icons.visibility_off,
              color: ColorGlobalVariables.fadedBlackColor,
              size: SizeGlobalVariables.double_size_eighteen,
              ),
            ) : null,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(SizeGlobalVariables.double_size_eight),
            borderSide: BorderSide(
              color: ColorGlobalVariables.greenColor.withOpacity(SizeGlobalVariables.point_one),
              width: SizeGlobalVariables.one_point_two,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(SizeGlobalVariables.double_size_eight),
            borderSide: BorderSide(
              color: ColorGlobalVariables.redColor,
              width: SizeGlobalVariables.one_point_two,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(SizeGlobalVariables.double_size_eight),
            borderSide: BorderSide(
              color: ColorGlobalVariables.redColor,
              width: SizeGlobalVariables.one_point_two,
            ),
          ),
          errorStyle: TextStyle(
            color: ColorGlobalVariables.redColor,
              fontSize: SizeGlobalVariables.double_size_fourteen,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(SizeGlobalVariables.double_size_eight),
            borderSide: BorderSide(
              color: ColorGlobalVariables.greenColor,
              width: SizeGlobalVariables.one_point_two,
            ),
          ),
          hintText: hintText,
          hintStyle: TextStyle(
            color: ColorGlobalVariables.fadedBlackColor.withOpacity(SizeGlobalVariables.zero_point_six_six),
            fontSize: SizeGlobalVariables.double_size_fourteen,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
