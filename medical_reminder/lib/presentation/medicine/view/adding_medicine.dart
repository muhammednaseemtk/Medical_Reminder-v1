import 'package:flutter/material.dart';
import 'package:medical_reminder/common/widget/common_button.dart';
import 'package:medical_reminder/core/theme/app_colors.dart';
import 'package:medical_reminder/presentation/report/widget/report_date.dart';
import 'package:medical_reminder/presentation/medicine/function/medicone_add.dart';
import 'package:medical_reminder/presentation/medicine/model/medicine_model.dart';
import 'package:medical_reminder/presentation/report/widget/add_report.dart';

class AddingMedicine extends StatefulWidget {
  const AddingMedicine({super.key});

  @override
  State<AddingMedicine> createState() => _AddingMedicineState();
}

class _AddingMedicineState extends State<AddingMedicine> {
  final nameController = TextEditingController();
  final dosageController = TextEditingController();

  final startDateController = TextEditingController();
  final endDateController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  Future<DateTime?> pickDate(BuildContext context) {
    return showModalBottomSheet<DateTime>(
      context: context,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return ReportDate(initialDate: DateTime.now());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.icon,
        foregroundColor: AppColors.white,
        title: Text(
          "Add Medicine",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
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
                    text: 'Medicine name',
                    texts: 'name',
                    controller: nameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'name is required';
                      }else {
                        return null;
                      }
                    }
                  ),
                  SizedBox(height: 15),
                  AddContainer(
                    text: 'Dosage',
                    texts: 'text',
                    controller: dosageController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'dosage is required';
                      }else {
                        return null;
                      }
                    }
                  ),
                  SizedBox(height: 15),
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () async {
                            DateTime? picked = await pickDate(context);
                            if (picked != null) {
                              setState(() {
                                startDateController.text =
                                    "${picked.day}/${picked.month}/${picked.year}";
                              });
                            }
                          },
                          child: AbsorbPointer(
                            child: AddContainer(
                              text: 'Start Date',
                              texts: startDateController.text.isEmpty
                                  ? 'mm/dd/yyyy'
                                  : startDateController.text,
                              controller: startDateController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'date not add';
                                }else{
                                  return null;
                                }
                              }
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 15),
                      Expanded(
                        child: GestureDetector(
                          onTap: () async {
                            DateTime? picked = await pickDate(context);
                            if (picked != null) {
                              setState(() {
                                endDateController.text =
                                    "${picked.day}/${picked.month}/${picked.year}";
                              });
                            }
                          },
                          child: AbsorbPointer(
                            child: AddContainer(
                              text: 'End Date',
                              texts: endDateController.text.isEmpty
                                  ? 'mm/dd/yyyy'
                                  : endDateController.text,
                              controller: endDateController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'date not add';
                                }else{
                                  return null;
                                }
                              },                                
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  CommonButton(
                    text: 'Save Medicine',
                    textColor: AppColors.white,
                    bgColor: AppColors.icon,
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        final medicine = MedicineModel(
                          name: nameController.text,
                          dosage: dosageController.text,
                          startDate: startDateController.text,
                          endDate: endDateController.text,
                        );
                        await addMedicine(medicine);
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Medicine Added")),
                        );
                      }
                    },
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
