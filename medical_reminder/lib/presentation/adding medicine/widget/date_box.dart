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
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 11),
            child: Text(label, style: TextStyle(fontWeight: FontWeight.w500)),
          ),
          SizedBox(height: 6),

          Container(
            width: 175,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColors.lightShade),
            ),

            child: Row(
              children: [
                Icon(EneftyIcons.calendar_outline, color: AppColors.icon1),
                SizedBox(width: 8),

                Text(value, style: TextStyle(fontSize: 15)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
