import 'package:flutter/material.dart';
import 'package:medical_reminder/core/theme/app_colors.dart';

class NotificationCard extends StatelessWidget {
  final Color containerColor;
  final IconData icon;
  final Color iconColor;
  final String text;
  final String text1;
  final String time;
  const NotificationCard({
    super.key,
    required this.containerColor,
    required this.icon,
    required this.iconColor,
    required this.text,
    required this.text1,
    required this.time,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 11),
      child: Card(
        color: AppColors.bgColor,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: containerColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Icon(icon, color: iconColor, size: 25),
              ),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      text,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(text1, style: TextStyle(fontSize: 14)),
                    Text(time, style: TextStyle(fontSize: 13)),
                  ],
                ),
              ),
              SizedBox(
                height: 60,
                child: Align(
                  alignment: Alignment.topRight,
                  child: Icon(Icons.close_sharp, size: 19),
                ),
              ),
              SizedBox(width: 10),
            ],
          ),
        ),
      ),
    );
  }
}
