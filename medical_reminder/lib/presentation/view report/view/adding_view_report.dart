import 'package:flutter/material.dart';
import 'package:medical_reminder/common/widget/common_button.dart';
import 'package:medical_reminder/common/widget/custom_text_field.dart';
import 'package:medical_reminder/core/route/app_route.dart';
import 'package:medical_reminder/core/theme/app_colors.dart';
import 'package:medical_reminder/presentation/view%20report/widget/report_date.dart';
import 'package:medical_reminder/presentation/view%20report/function/reports_add.dart';
import 'package:medical_reminder/presentation/view%20report/model/report_model.dart';
import 'package:medical_reminder/presentation/view%20report/widget/add_report.dart';

class AddingViewReport extends StatefulWidget {
  const AddingViewReport({super.key});

  @override
  State<AddingViewReport> createState() => _AddingViewReportState();
}

class _AddingViewReportState extends State<AddingViewReport> {
  final TextEditingController reportDrNameController = TextEditingController();
  final TextEditingController reportNameController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future<DateTime?> ReportDatePicker(BuildContext context) {
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
        foregroundColor: AppColors.white,
        backgroundColor: AppColors.icon,
        title: Text(
          'Add Report',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  AddContainer(
                    text: 'Report Name',
                    texts: 'Blood Test Results',
                    controller: reportNameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'name not required';
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(height: 20),
                  GestureDetector(
                    onTap: () async {
                      DateTime? picked = await ReportDatePicker(context);
                      if (picked != null) {
                        setState(() {
                          dateController.text =
                              "${picked.day}/${picked.month}/${picked.year}";
                        });
                      }
                    },
                    child: AbsorbPointer(
                      child: AddContainer(
                        text: 'Date of Report',
                        texts: dateController.text.isEmpty
                            ? 'mm/dd/yyyy'
                            : dateController.text,
                        controller: dateController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'date not required';
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  AddContainer(
                    text: 'Doctor`s Name',
                    texts: 'name',
                    controller: reportDrNameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'dr name not required';
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
                    text: 'Save Report',
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        final ReportModel report = ReportModel(
                          name: reportNameController.text,
                          drName: reportDrNameController.text,
                          date: dateController.text,
                        );
                        await addReport(report);
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Add report"),
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
