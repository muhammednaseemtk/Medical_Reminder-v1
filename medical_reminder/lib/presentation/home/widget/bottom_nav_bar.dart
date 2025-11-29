import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:medical_reminder/core/theme/app_colors.dart';

class BottomNavBar extends StatelessWidget {
  final int index;
  final ValueChanged<int> onTap;
  const BottomNavBar({super.key, required this.index, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return  BottomNavigationBar(
      backgroundColor: AppColors.white,
        currentIndex: index,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.icon,
        unselectedItemColor: AppColors.txtColor,
        onTap: onTap,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(EneftyIcons.house_outline),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(EneftyIcons.notification_outline),
            label: 'Notification',
          ),
          BottomNavigationBarItem(
            icon: Icon(EneftyIcons.chart_4_outline),
            label: 'Statistics',
          ),

          BottomNavigationBarItem(icon: Icon(EneftyIcons.setting_outline), label: 'Settings'),
        ],
      );
  }
}
