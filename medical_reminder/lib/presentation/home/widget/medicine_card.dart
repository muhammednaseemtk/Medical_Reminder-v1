import 'package:flutter/material.dart';
import 'package:medical_reminder/core/theme/app_colors.dart';

class MedicineCard extends StatelessWidget {
  final String name;
  final String dose;
  final String time;
  final IconData icon;
  final String isTaken;
  final Color containerColor;
  final Color iconColor;
  final Color textColor;
  final double height;
  final double width;
  const MedicineCard({
    super.key,
    required this.name,
    required this.dose,
    required this.time,
    required this.isTaken,
    required this.icon,
    required this.containerColor,
    required this.iconColor,
    required this.textColor,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: containerColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Icon(
                Icons.medication_outlined,
                color: iconColor,
                size: 25,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: TextStyle(fontSize: 17)),
                SizedBox(height: 5),
                Text('$dose - $time'),
              ],
            ),
            SizedBox(width: 30),
            Container(
              decoration: BoxDecoration(
                color: containerColor,
                borderRadius: BorderRadius.circular(15),
              ),
              width: width,
              height: height,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(icon, size: 15, color: iconColor),
                  SizedBox(width: 10),
                  Text(
                    isTaken,
                    style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
