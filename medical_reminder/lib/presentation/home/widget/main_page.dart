import 'package:flutter/material.dart';
import 'package:medical_reminder/presentation/Notification/view/notification_screen.dart';
import 'package:medical_reminder/presentation/home/view/home_screen.dart';
import 'package:medical_reminder/presentation/setting/view/setting_screen.dart';
import 'package:medical_reminder/presentation/statistics/view/statistics_screen.dart';

import 'bottom_nav_bar.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;
  final List<Widget> screens = [
    HomeScreen(),
    NotificationScreen(),
    StatisticsScreen(),
    SettingScreen(),
  ];

  void _onNavTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: currentIndex, children: screens),
      bottomNavigationBar: BottomNavBar(index: currentIndex, onTap: _onNavTap),
    );
  }
}
