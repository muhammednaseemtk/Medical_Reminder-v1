import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:medical_reminder/core/theme/app_colors.dart';

class DateBox extends StatelessWidget {
  final String label;
  final String value;
  final VoidCallback onTap;

  const DateBox({
    super.key,
    required this.label,
    required this.value,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: AppColors.txtColor,
            ),
          ),
        ),
        SizedBox(height: 6),

        GestureDetector(
          onTap: onTap,
          child: Container(
            width: 175,
            padding: EdgeInsets.symmetric(horizontal: 14, vertical: 14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: AppColors.lightShade),
            ),
            child: Row(
              children: [
                Icon(EneftyIcons.calendar_outline, color: AppColors.icon),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    value,
                    style: TextStyle(fontSize: 16, color: AppColors.txtColor),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
