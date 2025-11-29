import 'package:flutter/material.dart';
import 'package:medical_reminder/core/theme/app_colors.dart';

class AddingBmi extends StatefulWidget {
  const AddingBmi({super.key});

  @override
  State<AddingBmi> createState() => _AddingBmiState();
}

class _AddingBmiState extends State<AddingBmi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        foregroundColor: AppColors.white,
        backgroundColor: AppColors.icon,
        title: Text('Add BMI',style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
          ],
        ),
      ),
    );
  }
}