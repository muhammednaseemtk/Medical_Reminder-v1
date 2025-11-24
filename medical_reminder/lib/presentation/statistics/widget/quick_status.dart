import 'package:flutter/material.dart';

class QuickStatus extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color bgColor;
  final String text;
  final String text1;
  final String values;

  const QuickStatus({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.bgColor,
    required this.text,
    required this.text1,
    required this.values,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: bgColor,
          child: Icon(icon, color: iconColor),
        ),
        SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text,
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              Text(
                text1,
                style: TextStyle(fontSize: 13),
              ),
            ],
          ),
        ),
        Text(
          values,
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
        ),
      ],
    );
  }
}
