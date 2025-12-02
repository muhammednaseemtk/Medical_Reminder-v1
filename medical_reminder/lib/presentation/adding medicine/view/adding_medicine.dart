import 'package:flutter/material.dart';
import 'package:medical_reminder/common/widget/common_button.dart';
import 'package:medical_reminder/core/theme/app_colors.dart';
import 'package:medical_reminder/presentation/adding view report/widget/report_date.dart';
import 'package:medical_reminder/presentation/adding%20medicine/function/medicone_add.dart';
import 'package:medical_reminder/presentation/adding%20medicine/model/medicine_model.dart';
import 'package:medical_reminder/presentation/adding medicine/widget/date_box.dart';
import 'package:medical_reminder/presentation/adding%20view%20report/widget/add_report.dart';

class AddingMedicine extends StatefulWidget {
  const AddingMedicine({super.key});

  @override
  State<AddingMedicine> createState() => _AddingMedicineState();
}

class _AddingMedicineState extends State<AddingMedicine> {
  final nameController = TextEditingController();
  final dosageController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  DateTime? startDate;
  DateTime? endDate;

  String format(DateTime? date) {
    if (date == null) return "mm/dd/yyyy";
    return "${date.day}/${date.month}/${date.year}";
  }
  Future<DateTime?> pickReportDate(DateTime initialDate) {
    return showModalBottomSheet<DateTime>(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => ReportDate(initialDate: initialDate),
    );
  }

  Future<void> pickDate({required bool isStart}) async {
    final initial = isStart ? (startDate ?? DateTime.now()) : (endDate ?? DateTime.now());

    DateTime? picked = await pickReportDate(initial);

    if (picked != null) {
      setState(() {
        if (isStart) {
          startDate = picked;
        } else {
          endDate = picked;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.icon,
        foregroundColor: AppColors.white,
        title:  Text("Add Medicine", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                AddContainer(
                  text: "Medicine Name",
                  texts: "Enter medicine name",
                  controller: nameController,
                  validator: (v) => v!.isEmpty ? "Name required" : null,
                ),
                 SizedBox(height: 20),
                AddContainer(
                  text: "Dosage",
                  texts: "Enter dosage",
                  controller: dosageController,
                  validator: (v) => v!.isEmpty ? "Dosage required" : null,
                ),
                 SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: FormField<DateTime>(
                        validator: (v) => startDate == null ? "Start date required" : null,
                        builder: (field) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () async {
                                await pickDate(isStart: true);
                                field.didChange(startDate);
                              },
                              child: AbsorbPointer(
                                child: DateBox(
                                  label: "Start Date",
                                  value: format(startDate),
                                  onTap: () {},
                                ),
                              ),
                            ),
                            if (field.hasError)
                              Text(field.errorText!, style:  TextStyle(color: Colors.red, fontSize: 12)),
                          ],
                        ),
                      ),
                    ),
                     SizedBox(width: 10),
                    Expanded(
                      child: FormField<DateTime>(
                        validator: (v) => endDate == null ? "End date required" : null,
                        builder: (field) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () async {
                                await pickDate(isStart: false);
                                field.didChange(endDate);
                              },
                              child: AbsorbPointer(
                                child: DateBox(
                                  label: "End Date",
                                  value: format(endDate),
                                  onTap: () {},
                                ),
                              ),
                            ),
                            if (field.hasError)
                              Text(field.errorText!, style:  TextStyle(color: Colors.red, fontSize: 12)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                 SizedBox(height: 20),
                CommonButton(
                  text: "Save Medicine",
                  bgColor: AppColors.icon,
                  textColor: AppColors.white,
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      final medicine = MedicineModel(
                        name: nameController.text,
                        dosage: dosageController.text,
                        startDate: startDate.toString(),
                        endDate: endDate.toString(),
                      );
                      await addMedicine(medicine);
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Medicine Added")),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
