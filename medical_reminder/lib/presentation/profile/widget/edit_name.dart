import 'package:flutter/material.dart';
import 'package:medical_reminder/core/theme/app_colors.dart';

class EditNameDialog extends StatelessWidget {
  final String currentName;
  final Function(String) onSave;

  const EditNameDialog({
    super.key,
    required this.currentName,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller =
        TextEditingController(text: currentName);

    return AlertDialog(
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),

      title:  Text(
        'Edit Username',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),

      content: TextField(
        cursorColor: AppColors.lightShade,
        controller: controller,
        decoration: InputDecoration(
          hintText: "New username",
          labelStyle: TextStyle(color: AppColors.lightShade),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: AppColors.lightShade)
          )
        ),
      ),

      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            'Cancel',
            style: TextStyle(color: AppColors.txtColor),
          ),
        ),
        TextButton(
          onPressed: () {
            final newName = controller.text.trim();
            onSave(newName);
            Navigator.pop(context);
          },
          child: Text(
            'Save',
            style: TextStyle(color: AppColors.txtColor),
          ),
        ),
      ],
    );
  }
}
