import 'package:flutter/material.dart';
import 'package:flutter_application_8/core/ColorsApp/ColorsApp.dart';

class DropdownOnProfile extends StatefulWidget {
  final List<String> items;
  final String defaultValue; 
  final Function(String) onChanged; 

  const DropdownOnProfile({
    super.key,
    required this.items,
    required this.defaultValue,
    required this.onChanged,
  });

  @override
  _DropdownOnProfileState createState() => _DropdownOnProfileState();
}

class _DropdownOnProfileState extends State<DropdownOnProfile> {
  late String selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.defaultValue; 
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.primaryLight), 
        borderRadius: BorderRadius.circular(15), 
      ),
      child: DropdownButtonFormField<String>(
        value: selectedValue,
        decoration: const InputDecoration(
          border: InputBorder.none, 
        ),
        icon: const Icon(Icons.arrow_drop_down, color: AppColors.greyColor), 
        style: const TextStyle(color: Colors.black, fontSize: 16),
        items: widget.items.map((String item) {
          return DropdownMenuItem(value: item, child: Text(item));
        }).toList(),
        onChanged: (newValue) {
          setState(() {
            selectedValue = newValue!;
          });
          widget.onChanged(newValue!);
        },
      ),
    );
  }
}
