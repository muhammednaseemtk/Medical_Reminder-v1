import 'dart:math';

import 'package:flutter/material.dart';
import 'package:medical_reminder/core/theme/app_colors.dart';
import 'package:medical_reminder/presentation/Notification/widget/notification_card.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: Text(
          'Notifications',
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 25),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Container(color: AppColors.shadow, height: 1),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'TODAY',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
          NotificationCard(
            containerColor: AppColors.bgBtnColor,
            icon: Icons.medication_outlined,
            iconColor: AppColors.icon,
            text: 'Medicine Reminder',
            text1: 'Take 1 pill of Paracetamol',
            time: 'Today at 2:00 PM',
          ),
          NotificationCard(
            containerColor: AppColors.bgBtnColor2,
            icon: Icons.monitor_heart_outlined,
            iconColor: AppColors.icon2,
            text: 'Health Log Prompt',
            text1: 'Don`t forget to log your blood pressure today',
            time: '1 hour ago',
          ),
          NotificationCard(
            containerColor: AppColors.bgBtnColor3,
            icon: Icons.note_alt_outlined,
            iconColor: AppColors.icon3,
            text: 'Refill Reminder',
            text1: 'Low on Lisinopril Time to refill.',
            time: '5 min ago',
          ),
        ],
      ),
    );
  }
}
