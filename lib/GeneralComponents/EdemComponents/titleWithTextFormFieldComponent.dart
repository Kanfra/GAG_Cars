// import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/Text/textMedium.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/Text/textSmall.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/TextFormFields/customTextFormField.dart';
import 'package:gag_cars_frontend/GeneralComponents/EdemComponents/customIcon.dart';
import 'package:gag_cars_frontend/GlobalVariables/colorGlobalVariables.dart';

class TitleWithTextformfieldComponent extends StatelessWidget {
  // for textSmall
  final String title;
  final FontWeight fontWeight;
  final TextOverflow? overflow;
  final Color textColor;
  final double? textSize;
  final TextAlign? textAlign;
  final TextDecoration? textDecoration;
  final Color? textDecorationColor;

  // for customtextformfield
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

  // isTitleWithContainerWidgetRequired
  final bool isTitleWithContainerWidgetRequired;
  final VoidCallback? onTitleWithContainerWidgetClickFunction;
  final bool isIconAtFrontRequiredOfContainerWidgetRequired;
  final IconData? iconData;
  final Color? iconColor;

  const TitleWithTextformfieldComponent({
    super.key,
    required this.title,
    required this.fontWeight,
    this.overflow,
    required this.textColor,
    this.textSize,
    this.textAlign,
    this.textDecoration,
    this.textDecorationColor,

    required this.obscureText,
    required this.isTitleWithContainerWidgetRequired,
    this.isIconAtFrontRequiredOfContainerWidgetRequired = false,

    this.textInputType,
    this.editingController,
    this.onChangeFunction,
    this.validatorFunction,
    this.onSuffixIconClickFunction,
    this.focusNode,
    required this.hintText,
    this.prefixIconData,
    this.suffixIconData,
    required this.isSuffixIconRequired,
    required this.isPrefixIconRequired,
    this.hintTextColor,
    required this.isFieldHeightRequired,
    this.fieldWidth,
    this.fieldHeight,
    this.maxLines,
    this.minLines,
    this.fillColor,
    this.enabledBorderColor,
    this.focusedBorderColor,
    this.cursorColor,    
    this.onTitleWithContainerWidgetClickFunction,
    this.iconData,
    this.iconColor,
    });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // title
        TextMedium(
          title: title,
          fontWeight: fontWeight,
          overflow: overflow,
          textColor: textColor,
          textSize: textSize,
          textAlign: textAlign,
          textDecoration: textDecoration,
          textDecorationColor: textDecorationColor,
          ),
        const SizedBox(height: 8,),
        isTitleWithContainerWidgetRequired ? GestureDetector(
          onTap: onTitleWithContainerWidgetClickFunction,
          child: Container(
                    width: fieldWidth,
                    padding: EdgeInsets.symmetric(
                      horizontal: 5, 
                      vertical: fieldHeight ?? 15
                      ),
                    decoration: BoxDecoration(
                      color: ColorGlobalVariables.textFieldColor.withOpacity(0.99),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: ColorGlobalVariables.greenColor,
                        width: 0.2,
                      )
                    ),
                    child: Row(
                      children: [
                        // icon 
                        isIconAtFrontRequiredOfContainerWidgetRequired ? CustomIcon(
                          iconData: iconData ?? Icons.location_on, 
                          isFaIcon: false, 
                          iconColor: iconColor ?? ColorGlobalVariables.fadedBlackColor,
                          ) : const SizedBox(),
                        isIconAtFrontRequiredOfContainerWidgetRequired ? const SizedBox(width: 8,) : const SizedBox(),
                        // hinttext
                        Expanded(
                          child: TextSmall(
                            title: hintText, 
                            fontWeight: FontWeight.normal, 
                            textColor: ColorGlobalVariables.fadedBlackColor,
                            ),
                        ),
                      ],
                    ),
                  ),
        ) :  CustomTextFormField(
          // for customtextformfield
          obscureText: obscureText,
          textInputType: textInputType,
          editingController: editingController,
          onChangeFunction: onChangeFunction,
          validatorFunction: validatorFunction,
          onSuffixIconClickFunction: onSuffixIconClickFunction,
          focusNode: focusNode,
          hintText: hintText,
          prefixIconData: prefixIconData,
          suffixIconData: suffixIconData,
          isSuffixIconRequired: isSuffixIconRequired,
          isPrefixIconRequired: isPrefixIconRequired,
          hintTextColor: hintTextColor,
          isFieldHeightRequired: isFieldHeightRequired,
          fieldWidth: fieldWidth,
          fieldHeight: fieldHeight,
          maxLines: maxLines,
          minLines: minLines,
          fillColor: fillColor,
          enabledBorderColor: enabledBorderColor,
          focusedBorderColor: focusedBorderColor,
          cursorColor: cursorColor,
          ),
      ],
    );
  }
}