import 'package:flutter/material.dart';

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
        labelText: "Select Medicine Type",
        border: OutlineInputBorder(),
        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      ),
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
