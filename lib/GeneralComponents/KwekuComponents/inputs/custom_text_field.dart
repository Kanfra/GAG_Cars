import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.controller,
    this.obscureText,
    this.textInputType,
    required this.hintText,
    required this.prefixImage,
    this.suffixIcon,
    this.onSuffixIconPressed,
    this.validator,
    this.onChanged,
  });

  final String hintText;
  final bool? obscureText;
  final String prefixImage;
  final TextInputType? textInputType;
  final IconData? suffixIcon;
  final VoidCallback? onSuffixIconPressed;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      height: 64,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: isDark
            ? [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.3),
                  offset: const Offset(0, 3),
                  blurRadius: 8,
                  spreadRadius: -1,
                ),
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.4),
                  offset: const Offset(0, 0),
                  blurRadius: 1,
                  spreadRadius: 0,
                ),
              ]
            : const [
                BoxShadow(
                  color: Color.fromRGBO(50, 50, 71, 0.05),
                  offset: Offset(0, 3),
                  blurRadius: 8,
                  spreadRadius: -1,
                ),
                BoxShadow(
                  color: Color.fromRGBO(12, 26, 75, 0.24),
                  offset: Offset(0, 0),
                  blurRadius: 1,
                  spreadRadius: 0,
                ),
              ],
      ),
      child: TextFormField(
        controller: controller,
        onChanged: onChanged,
        validator: validator,
        keyboardType: textInputType ?? TextInputType.text,
        obscureText: obscureText ?? false,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        style: TextStyle(
          color: isDark ? const Color(0xFFFFFFFF) : Colors.black,
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: isDark ? const Color(0xB3FFFFFF) : const Color.fromRGBO(168, 175, 185, 1),
          ),
          filled: true,
          fillColor: isDark ? const Color(0xFF424242) : Colors.white,
          contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Image.asset(
              prefixImage,
              width: 24,
              height: 24,
              color: isDark ? const Color(0xB3FFFFFF) : null, // Optional: adjust icon color for dark mode
            ),
          ),
          suffixIcon: suffixIcon != null
              ? IconButton(
                  icon: Icon(
                    suffixIcon,
                    color: isDark ? const Color(0xB3FFFFFF) : Colors.grey[600],
                  ),
                  onPressed: onSuffixIconPressed,
                )
              : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: isDark ? const Color(0xFFBB86FC) : const Color(0xFF2196F3), // Purple for dark, blue for light
              width: 1.5,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.red,
              width: 1.2,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.red,
              width: 1.4,
            ),
          ),
        ),
        cursorColor: isDark ? const Color(0xFFBB86FC) : const Color(0xFF2196F3),
      ),
    );
  }
}