import 'package:flutter/material.dart';
import 'package:medical_reminder/core/theme/app_colors.dart';

class AddContainer extends StatelessWidget {
  final String text;
  final String texts;
  const AddContainer({super.key, required this.text, required this.texts});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(text,style: TextStyle(fontSize: 16),),
        ),
        SizedBox(height: 5,),
        TextField(cursorColor: AppColors.txtColor,
          decoration: 
          InputDecoration(
            hintText: texts,
            hintStyle: TextStyle(color: AppColors.lightShade),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18)
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.txtColor),
              borderRadius: BorderRadius.circular(18),
            ),
          ),
        ),
      ],
    );
  }
}
