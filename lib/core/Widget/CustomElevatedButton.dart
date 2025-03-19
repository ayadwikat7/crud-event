import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onClick;
  final Color? backgroundColor;
  final Color? textColor;
  final double? borderRadius;
  final double? height;
  final double? width;
  final bool isDisabled;

  const CustomElevatedButton({
    super.key,
    required this.text,
    required this.onClick,
    this.backgroundColor,
    this.textColor,
    this.borderRadius = 12.0,
    this.height = 50,
    this.width = double.infinity,
    this.isDisabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: isDisabled ? null : onClick, // Disables button if `isDisabled` is true
        style: ElevatedButton.styleFrom(
          backgroundColor: isDisabled
              ? Colors.grey
              : backgroundColor ?? Theme.of(context).primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius!),
          ),
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: textColor ?? Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
