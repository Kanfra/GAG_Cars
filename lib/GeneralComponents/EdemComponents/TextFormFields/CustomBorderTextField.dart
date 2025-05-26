import 'package:flutter/material.dart';

import '../../GlobalVariables/colorGlobalVariables.dart';
import '../../GlobalVariables/sizeGlobalVariables.dart';

class CustomBorderTextFormField extends StatelessWidget {
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

  const CustomBorderTextFormField({
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
    super.key,
  });

  InputDecoration _buildInputDecoration() {
    return InputDecoration(
      contentPadding: EdgeInsets.symmetric(
        vertical: SizeGlobalVariables.double_size_ten,
        horizontal: SizeGlobalVariables.double_size_ten,
      ),
      filled: true,
      fillColor: ColorGlobalVariables.textFieldColor,
      hintText: hintText,
      hintStyle: TextStyle(
        color: hintTextColor ?? Colors.black.withOpacity(0.5),
        fontSize: SizeGlobalVariables.double_size_fourteen,
      ),
      prefixIcon: isPrefixIconRequired && prefixIconData != null
          ? Icon(prefixIconData, color: Colors.black)
          : null,
      suffixIcon: isSuffixIconRequired
          ? GestureDetector(
        onTap: onSuffixIconClickFunction,
        child: Icon(
          obscureText ? Icons.visibility : Icons.visibility_off,
          color: Colors.black,
        ),
      )
          : null,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(SizeGlobalVariables.double_size_eight),
        borderSide: BorderSide(color: Colors.black, width: SizeGlobalVariables.one_point_two),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(SizeGlobalVariables.double_size_eight),
        borderSide: BorderSide(color: ColorGlobalVariables.greenColor, width: SizeGlobalVariables.one_point_two),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(SizeGlobalVariables.double_size_eight),
        borderSide: BorderSide(color: ColorGlobalVariables.redColor, width: SizeGlobalVariables.one_point_two),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(SizeGlobalVariables.double_size_eight),
        borderSide: BorderSide(color: ColorGlobalVariables.redColor, width: SizeGlobalVariables.one_point_two),
      ),
      errorStyle: TextStyle(
        color: ColorGlobalVariables.redColor,
        fontSize: SizeGlobalVariables.double_size_fourteen,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: fieldWidth ?? SizeGlobalVariables.double_size_eighty,
      padding: isFieldHeightRequired
          ? EdgeInsets.symmetric(vertical: SizeGlobalVariables.double_size_five)
          : null,
      height: isFieldHeightRequired ? null : SizeGlobalVariables.double_size_forty,
      child: TextFormField(
        controller: editingController,
        focusNode: focusNode,
        onChanged: onChangeFunction,
        validator: validatorFunction,
        obscureText: obscureText,
        keyboardType: textInputType,
        minLines: isFieldHeightRequired ? (minLines ?? 1) : 1,
        maxLines: isFieldHeightRequired ? (maxLines ?? 5) : 1,
        cursorColor: Colors.black,
        style: TextStyle(
          fontSize: SizeGlobalVariables.double_size_fourteen,
          color: Colors.black,
        ),
        decoration: _buildInputDecoration(),
      ),
    );
  }
}
