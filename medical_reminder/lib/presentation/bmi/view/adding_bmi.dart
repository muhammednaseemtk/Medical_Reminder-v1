import 'package:flutter/material.dart';
import 'package:medical_reminder/common/widget/common_button.dart';
import 'package:medical_reminder/core/theme/app_colors.dart';
import 'package:medical_reminder/presentation/bmi/function/bmi_add.dart';
import 'package:medical_reminder/presentation/bmi/model/bmi_model.dart';
import 'package:medical_reminder/presentation/report/widget/add_report.dart';

class AddingBmi extends StatefulWidget {
  const AddingBmi({super.key});

  @override
  State<AddingBmi> createState() => _AddingBmiState();
}

class _AddingBmiState extends State<AddingBmi> {
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final formKey = GlobalKey<FormState>();

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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  AddContainer(
                    text: 'Height',
                    texts: 'cm',
                    controller: heightController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'height is required';
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(height: 20),
                  AddContainer(
                    text: 'Weight',
                    texts: 'kg',
                    controller: weightController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'weight is required';
                      } else {
                        return null;
                      }
                    },
                  ),
                ],
              ),
              Column(
                children: [
                  CommonButton(
                    text: 'Save BMI',
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        final bmi = BmiModel(
                          height: heightController.text.trim(),
                          weight: weightController.text.trim(),
                        );
                        await addBmi(bmi);

                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Bmi Added Successfully"),
                          ),
                        );
                      }
                    },
                    textColor: AppColors.white,
                    bgColor: AppColors.icon,
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
