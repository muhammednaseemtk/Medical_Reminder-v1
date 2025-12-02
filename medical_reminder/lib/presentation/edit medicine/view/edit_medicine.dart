import 'package:flutter/material.dart';
import 'package:medical_reminder/common/widget/common_button.dart';
import 'package:medical_reminder/core/theme/app_colors.dart';
import 'package:medical_reminder/presentation/add%20view%20report/widget/report_date.dart';
import 'package:medical_reminder/presentation/add%20medicine/function/medicone_add.dart';
import 'package:medical_reminder/presentation/add%20medicine/model/medicine_model.dart';
import 'package:medical_reminder/presentation/add%20view%20report/widget/add_report.dart';

class EditMedicine extends StatefulWidget {
  final MedicineModel medicine;
  final int index;
  const EditMedicine({super.key, required this.medicine, required this.index});

  @override
  State<EditMedicine> createState() => _EditMedicineState();
}

class _EditMedicineState extends State<EditMedicine> {
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
  void initState() {
    super.initState();
    nameController.text = widget.medicine.name;
    dosageController.text = widget.medicine.dosage;
    startDateController.text = widget.medicine.startDate;
    endDateController.text = widget.medicine.endDate;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.icon,
        foregroundColor: AppColors.white,
        title: Text(
          "Edit Medicine",
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
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(height: 15),

                  AddContainer(
                    text: 'Dosage',
                    texts: 'text',
                    controller: dosageController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'dosage is required';
                      } else {
                        return null;
                      }
                    },
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
                                } else {
                                  return null;
                                }
                              },
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
                                } else {
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
                        final updateMedicine = MedicineModel(
                          name: nameController.text.trim(),
                          dosage: dosageController.text.trim(),
                          startDate: startDateController.text.trim(),
                          endDate: endDateController.text.trim(),
                        );
                        await editMedicine(widget.index,updateMedicine);
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Medicine edited")),
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
