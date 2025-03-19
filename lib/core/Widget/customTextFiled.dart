import 'package:flutter/material.dart';
import 'package:flutter_application_8/core/ColorsApp/ColorsApp.dart';

typedef MyValidator = String? Function(String?)?;

class CustomTextField extends StatelessWidget {
  final Color? color;
  final String? hintText;
  final String? labelText;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final int? maxLines;
  final TextEditingController? controller;
  final MyValidator validator;

  const CustomTextField({
    super.key,
    this.color,
    required this.hintText,
    this.labelText,
    this.hintStyle,
    this.labelStyle,
    this.prefixIcon,
    this.suffixIcon,
    this.controller,
    this.validator,
    this.obscureText = false,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      maxLines: obscureText ? 1 : maxLines,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        hintStyle: hintStyle ?? const TextStyle(fontSize: 16, color: AppColors.greyColor),
        labelStyle: labelStyle ?? const TextStyle(fontSize: 16, color: AppColors.greyColor),
        filled: color != null,
        fillColor: color,
        
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(width: 2, color: AppColors.greyColor),
        ),
        
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(width: 2, color: AppColors.primaryLight),
        ),
        
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(width: 2, color: AppColors.redColor),
        ),
        
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(width: 2, color: AppColors.redColor),
        ),
      ),
    );
  }
}
