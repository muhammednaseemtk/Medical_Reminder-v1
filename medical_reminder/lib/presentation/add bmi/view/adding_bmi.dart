import 'package:flutter/material.dart';
import 'package:medical_reminder/common/widget/common_button.dart';
import 'package:medical_reminder/core/theme/app_colors.dart';
import 'package:medical_reminder/presentation/adding%20view%20report/widget/add_report.dart';

class AddingBmi extends StatefulWidget {
  const AddingBmi({super.key});

  @override
  State<AddingBmi> createState() => _AddingBmiState();
}

class _AddingBmiState extends State<AddingBmi> {
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        foregroundColor: AppColors.white,
        backgroundColor: AppColors.icon,
        title: Text('Add BMI', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                AddContainer(
                  text: 'Height',
                  texts: 'cm',
                  controller: heightController,
                  validator: (value) {},
                ),
                SizedBox(height: 20),
                AddContainer(
                  text: 'Weight',
                  texts: 'kg',
                  controller: weightController,
                  validator: (value) {},
                ),
              ],
            ),
          ),
          Column(
            children: [
              CommonButton(text: 'Save BMI', onTap: (){}, textColor: AppColors.white, bgColor: AppColors.icon),
              SizedBox(height: 20,)
            ],
          )
        ],
      ),
    );
  }
}
