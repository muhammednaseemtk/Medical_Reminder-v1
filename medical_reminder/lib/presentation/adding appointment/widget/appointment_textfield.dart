import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:medical_reminder/core/theme/app_colors.dart';

class AppointmentTextfield extends StatelessWidget {
  final String text;
  final String texts;
  final IconData icon;
  final double width;
  const AppointmentTextfield({
    super.key,
    required this.text,
    required this.texts,
    required this.icon,
    required this.width
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(text,style: TextStyle(fontSize: 18),),
        ),
        SizedBox(height: 5),
        SizedBox(
          width: width,
          child: TextField(
            cursorColor: AppColors.txtColor,
            decoration: InputDecoration(
              prefixIcon: Icon(icon,color: AppColors.lightShade,),
              hintText: texts,
              hintStyle: TextStyle(color: AppColors.txtColor),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(18)),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.txtColor),
                borderRadius: BorderRadius.circular(18),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
