import 'package:flutter/material.dart';
import 'package:medical_reminder/core/theme/app_colors.dart';

class MedicineTypeDropdown extends StatefulWidget {
  final List<String> items;                
  final Function(String) onChanged;       
  final String? initialValue;             

  const MedicineTypeDropdown({
    super.key,
    required this.items,
    required this.onChanged,
    this.initialValue,
  });

  @override
  State<MedicineTypeDropdown> createState() => _MedicineTypeDropdownState();
}

class _MedicineTypeDropdownState extends State<MedicineTypeDropdown> {
  String? selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        hintText: "Select Medicine Type",
        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: AppColors.lightShade), 
        ),
      ),
      dropdownColor: AppColors.white,
      value: selectedValue,
      items: widget.items.map((value) {
        return DropdownMenuItem(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (value) {
        setState(() {
          selectedValue = value;
        });
        widget.onChanged(value!);
      },
    );
  }
}
