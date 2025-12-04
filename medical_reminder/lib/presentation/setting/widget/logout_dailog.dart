import 'package:flutter/material.dart';
import 'package:medical_reminder/core/theme/app_colors.dart';
import 'package:medical_reminder/core/route/app_route.dart';

class LogoutDialog extends StatelessWidget {
  const LogoutDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      title: Text(
        'Logout Conform',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      content: Text(
        'Are you sure you want to logout?',
        style: TextStyle(fontSize: 13),
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
            Navigator.pop(context);  
            Navigator.pushReplacementNamed(context, AppRoute.login);
          },
          child: Text(
            'Logout',
            style: TextStyle(color: AppColors.icon2),
          ),
        ),
      ],
    );
  }
}
