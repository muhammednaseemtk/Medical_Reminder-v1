import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:medical_reminder/core/theme/app_colors.dart';

class AppointmentCard extends StatelessWidget {
  final Color iconColor;
  final Color containerColor;
  final String name;
  final String date;
  final String time;
  const AppointmentCard({
    super.key,
    required this.containerColor,
    required this.iconColor,
    required this.name,
    required this.date,
    required this.time
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 4),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.bgColor,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              spreadRadius: 1,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: containerColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Icon(
                EneftyIcons.calendar_outline,
                color: iconColor,
                size: 25,
              ),
            ),
            SizedBox(width: 20,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: TextStyle(fontSize: 17)),
                SizedBox(height: 5),
                Text('$date,$time'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
