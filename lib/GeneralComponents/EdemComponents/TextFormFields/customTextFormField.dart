import 'package:flutter/material.dart';

import '../../../GlobalVariables/colorGlobalVariables.dart';
import '../../../GlobalVariables/sizeGlobalVariables.dart';

class CustomTextFormField extends StatelessWidget {
  final bool obscureText;
  final TextInputType? textInputType;
  final TextEditingController? editingController;
  final ValueChanged<String>? onChangeFunction;
  final String? Function(String?)? validatorFunction;
  final VoidCallback? onSuffixIconClickFunction;
  final FocusNode? focusNode;
  final String hintText;
  final IconData? prefixIconData;
  final IconData? suffixIconData;
  final bool isSuffixIconRequired;
  final bool isPrefixIconRequired;
  final Color? hintTextColor;
  final bool isFieldHeightRequired;
  final double? fieldWidth;
  final double? fieldHeight;
  final int? maxLines;
  final int? minLines;
  final Color? fillColor;
  final Color? enabledBorderColor;
  final Color? focusedBorderColor;
  final Color? cursorColor;
  final double? borderRadius;
  final double? borderWidth;

  const CustomTextFormField({
    required this.obscureText,
    this.focusNode,
    this.fillColor,
    this.enabledBorderColor,
    this.focusedBorderColor,
    this.cursorColor,
    this.borderWidth,
    this.borderRadius,
    this.textInputType,
    required this.hintText,
    this.hintTextColor,
    this.prefixIconData,
    this.suffixIconData,
    required this.isSuffixIconRequired,
    required this.isPrefixIconRequired,
    this.editingController,
    this.onChangeFunction,
    this.validatorFunction,
    this.maxLines,
    this.minLines,
    this.fieldWidth,
    this.fieldHeight,
    required this.isFieldHeightRequired,
    this.onSuffixIconClickFunction,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return isFieldHeightRequired ? Container(
      padding: EdgeInsets.symmetric(vertical: SizeGlobalVariables.double_size_fifteen,),
      alignment: Alignment.centerLeft,
      width: fieldWidth ?? SizeGlobalVariables.double_size_eighty,
      child: TextFormField(
        minLines: minLines ?? SizeGlobalVariables.integer_size_five,
        maxLines: maxLines ?? SizeGlobalVariables.integer_size_six,
        cursorColor: ColorGlobalVariables.greenColor,
        controller: editingController,
        onChanged: onChangeFunction,
        validator: validatorFunction,
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
          fillColor: fillColor ?? ColorGlobalVariables.textFieldColor.withValues(alpha: SizeGlobalVariables.zero_point_nine_nine),
          filled: ColorGlobalVariables.trueValue,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? SizeGlobalVariables.double_size_eight),
            borderSide: BorderSide(
              color: enabledBorderColor ?? ColorGlobalVariables.greenColor.withValues(alpha: SizeGlobalVariables.point_one),
              width: borderWidth ?? SizeGlobalVariables.one_point_two,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? SizeGlobalVariables.double_size_eight),
            borderSide: BorderSide(
              color: focusedBorderColor ?? ColorGlobalVariables.greenColor,
              width: borderWidth ?? SizeGlobalVariables.one_point_two,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? SizeGlobalVariables.double_size_eight),
            borderSide: BorderSide(
              color: ColorGlobalVariables.redColor,
              width: borderWidth ?? SizeGlobalVariables.one_point_two,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular( borderRadius ?? SizeGlobalVariables.double_size_eight),
            borderSide: BorderSide(
              color: ColorGlobalVariables.redColor,
              width: borderWidth ?? SizeGlobalVariables.one_point_two,
            ),
          ),
          errorStyle: TextStyle(
            color: ColorGlobalVariables.redColor,
              fontSize: SizeGlobalVariables.double_size_fourteen,
          ),
          hintText: hintText,
          hintStyle: TextStyle(
            color: hintTextColor ?? ColorGlobalVariables.fadedBlackColor.withValues(alpha: SizeGlobalVariables.point_two_two),
            fontSize: SizeGlobalVariables.double_size_fourteen,
          ),
        ),
      ),
    ) : SizedBox(
      width: fieldWidth ?? SizeGlobalVariables.double_size_eighty,
      //height: SizeGlobalVariables.double_size_forty,
      child: TextFormField(
        focusNode: focusNode,
        cursorColor: cursorColor ?? ColorGlobalVariables.greenColor,
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
            vertical: fieldHeight ?? SizeGlobalVariables.double_size_ten, // Adjust vertical padding
            horizontal: SizeGlobalVariables.double_size_ten,
          ),
          fillColor: fillColor ?? ColorGlobalVariables.textFieldColor,
          filled: ColorGlobalVariables.trueValue,
          prefixIcon: isPrefixIconRequired ? Icon(
            prefixIconData,
            color: ColorGlobalVariables.fadedBlackColor,
            size: SizeGlobalVariables.double_size_eighteen,

          ) : null,
          suffixIcon: isSuffixIconRequired ? GestureDetector(
            onTap: onSuffixIconClickFunction,
            child: Icon(
              obscureText ? suffixIconData ?? Icons.visibility_off : suffixIconData ?? Icons.visibility,
              color: ColorGlobalVariables.fadedBlackColor,
              size: SizeGlobalVariables.double_size_eighteen,
              ),
            ) : null,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? SizeGlobalVariables.double_size_eight),
            borderSide: BorderSide(
              color: enabledBorderColor ?? ColorGlobalVariables.greenColor.withValues(alpha: SizeGlobalVariables.point_one),
              width: borderWidth ?? SizeGlobalVariables.one_point_two,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular( borderRadius ?? SizeGlobalVariables.double_size_eight),
            borderSide: BorderSide(
              color: ColorGlobalVariables.redColor,
              width: borderWidth ?? SizeGlobalVariables.one_point_two,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular( borderRadius ?? SizeGlobalVariables.double_size_eight),
            borderSide: BorderSide(
              color: ColorGlobalVariables.redColor,
              width: borderWidth ?? SizeGlobalVariables.one_point_two,
            ),
          ),
          errorStyle: TextStyle(
            color: ColorGlobalVariables.redColor,
              fontSize: SizeGlobalVariables.double_size_fourteen,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? SizeGlobalVariables.double_size_eight),
            borderSide: BorderSide(
              color: focusedBorderColor ?? ColorGlobalVariables.greenColor,
              width: borderWidth ?? SizeGlobalVariables.one_point_two,
            ),
          ),
          hintText: hintText,
          hintStyle: TextStyle(
            color: ColorGlobalVariables.fadedBlackColor.withValues(alpha: SizeGlobalVariables.zero_point_six_six),
            fontSize: SizeGlobalVariables.double_size_fourteen,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
