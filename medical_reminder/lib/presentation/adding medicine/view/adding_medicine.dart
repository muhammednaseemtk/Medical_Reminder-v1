import 'package:flutter/material.dart';
import 'package:medical_reminder/common/widget/common_button.dart';
import 'package:medical_reminder/core/theme/app_colors.dart';
import 'package:medical_reminder/presentation/adding medicine/widget/frequency_drop_down.dart';
import 'package:medical_reminder/presentation/adding view report/widget/report_date.dart';
import 'package:medical_reminder/presentation/adding%20medicine/function/medicone_add.dart';
import 'package:medical_reminder/presentation/adding%20medicine/model/medicine_model.dart';
import 'package:medical_reminder/presentation/adding%20medicine/widget/type_drop_down.dart';
import 'package:medical_reminder/presentation/adding medicine/widget/date_box.dart';
import 'package:medical_reminder/presentation/adding%20view%20report/widget/add_report.dart';

class AddingMedicine extends StatefulWidget {
  const AddingMedicine({super.key});

  @override
  State<AddingMedicine> createState() => _AddingMedicineState();
}

class _AddingMedicineState extends State<AddingMedicine> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController dosageController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  DateTime? startDate;
  DateTime? endDate;

  List<String> selectedTimes = [];
  String? selectedMedicineType;
  final List<String> medicineTypes = ['Pills', 'Drops', 'Syrup', 'Injection'];

  String format(DateTime? date) {
    if (date == null) return "mm/dd/yyyy";
    return "${date.day}/${date.month}/${date.year}";
  }

  Future<DateTime?> pickReportDate(DateTime initialDate) {
    return showModalBottomSheet<DateTime>(
      context: context,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => ReportDate(initialDate: initialDate),
    );
  }

  Future<void> pickDate({required bool isStart}) async {
    final DateTime initial =
        isStart ? (startDate ?? DateTime.now()) : (endDate ?? DateTime.now());
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
        title: Text(
          "Add Medicine",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    // ------------------------
                    // MEDICINE TYPE VALIDATION
                    // ------------------------
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Medicine Type",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    FormField<String>(
                      validator: (value) {
                        if (selectedMedicineType == null) {
                          return "Medicine type is required";
                        }
                        return null;
                      },
                      builder: (field) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MedicineTypeDropdown(
                              items: medicineTypes,
                              onChanged: (value) {
                                setState(() {
                                  selectedMedicineType = value;
                                  field.didChange(value);
                                });
                              },
                            ),
                            if (field.hasError)
                              Padding(
                                padding: const EdgeInsets.only(left: 5, top: 5),
                                child: Text(
                                  field.errorText!,
                                  style: TextStyle(color: Colors.red, fontSize: 12),
                                ),
                              )
                          ],
                        );
                      },
                    ),
            
                    SizedBox(height: 20),
                    AddContainer(
                      text: "Medicine Name",
                      texts: "Enter medicine name",
                      controller: nameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) return "name required";
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
            
                    AddContainer(
                      text: "Dosage",
                      texts: "Enter dosage",
                      controller: dosageController,
                      validator: (value) {
                        if (value == null || value.isEmpty) return "dosage required";
                        return null;
                      },
                    ),
            
                    SizedBox(height: 20),
            
                    // ------------------------
                    // DATE VALIDATION
                    // ------------------------
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: FormField<DateTime>(
                            validator: (value) =>
                                startDate == null ? 'Start date is required' : null,
                            builder: (field) {
                              return Column(
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
                                    Padding(
                                      padding: EdgeInsets.only(top: 5, left: 5),
                                      child: Text(field.errorText!,
                                          style: TextStyle(
                                              color: Colors.red, fontSize: 12)),
                                    )
                                ],
                              );
                            },
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: FormField<DateTime>(
                            validator: (value) =>
                                endDate == null ? 'End date is required' : null,
                            builder: (field) {
                              return Column(
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
                                    Padding(
                                      padding: EdgeInsets.only(top: 5, left: 5),
                                      child: Text(field.errorText!,
                                          style: TextStyle(
                                              color: Colors.red, fontSize: 12)),
                                    )
                                ],
                              );
                            },
                          ),
                        ),
                      ],
                    ),
            
                    SizedBox(height: 20),
            
                    // ----------------------------
                    // FREQUENCY VALIDATION
                    // ----------------------------
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Select Frequency",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    FormField<List<String>>(
                      validator: (value) {
                        if (selectedTimes.isEmpty) {
                          return "Please select at least one time";
                        }
                        return null;
                      },
                      builder: (field) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FrequencyDropDown(
                              onTimeChanged: (list) {
                                selectedTimes = list;
                                field.didChange(list);
                              },
                            ),
                            if (field.hasError)
                              Padding(
                                padding: const EdgeInsets.only(left: 5, top: 5),
                                child: Text(
                                  field.errorText!,
                                  style: TextStyle(color: Colors.red, fontSize: 12),
                                ),
                              )
                          ],
                        );
                      },
                    ),
                  ],
                ),
            
                // ------------------------------
                // SAVE BUTTON
                // ------------------------------
                Column(
                  children: [
                    CommonButton(
                      text: "Save Medicine",
                      onTap: () async {
                        if (formKey.currentState!.validate()) {
                          final medicine = MedicineModel(
                            name: nameController.text,
                            dosage: dosageController.text,
                            type: selectedMedicineType!,
                            startDate: startDate.toString(),
                            endDate: endDate.toString(),
                            times: selectedTimes,
                          );
            
                          await addMedicine(medicine);
                          Navigator.pop(context);
            
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Medicine Added")),
                          );
                        }
                      },
                      bgColor: AppColors.icon,
                      textColor: AppColors.white,
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
