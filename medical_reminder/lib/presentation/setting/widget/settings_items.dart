import 'package:flutter/material.dart';
import 'package:medical_reminder/core/theme/app_colors.dart';

class SettingsItems extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  const SettingsItems({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.bgColor,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: AppColors.bgBtnColor,
          child: Icon(icon, color: AppColors.icon),
        ),
        title: Text(title, style: TextStyle(fontWeight: FontWeight.w500)),
        trailing: Icon(Icons.arrow_forward_ios_rounded, size: 17),
        onTap: onTap,
      ),
    );
  }
}
