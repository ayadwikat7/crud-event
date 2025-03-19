import 'package:flutter/material.dart';
import 'package:flutter_application_8/core/ColorsApp/ColorsApp.dart';

class TabeEventWidget extends StatelessWidget {
  final String eventName;
  final bool isSelected;

  TabeEventWidget({
    super.key,
    required this.eventName,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.primaryLight : Colors.white, // الخلفية
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppColors.primaryLight, // اللون الأزرق للإطار
          width: 2,
        ),
      ),
      child: Text(
        eventName,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: isSelected ? Colors.white : AppColors.primaryLight, // لون النص
        ),
      ),
    );
  }
}
