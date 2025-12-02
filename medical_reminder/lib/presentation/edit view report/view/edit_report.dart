import 'package:flutter/material.dart';
import 'package:medical_reminder/common/widget/common_button.dart';
import 'package:medical_reminder/core/theme/app_colors.dart';
import 'package:medical_reminder/presentation/add%20view%20report/widget/report_date.dart';
import 'package:medical_reminder/presentation/add%20view%20report/function/reports_add.dart';
import 'package:medical_reminder/presentation/add%20view%20report/model/report_model.dart';
import 'package:medical_reminder/presentation/add%20view%20report/widget/add_report.dart';

class EditViewReport extends StatefulWidget {
  final ReportModel report;
  final int index;

  const EditViewReport({
    super.key,
    required this.report,
    required this.index,
  });

  @override
  State<EditViewReport> createState() => _EditViewReportState();
}

class _EditViewReportState extends State<EditViewReport> {
  final reportDrNameController = TextEditingController();
  final reportNameController = TextEditingController();
  final dateController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future<DateTime?> ReportDatePicker(BuildContext context) {
    return showModalBottomSheet<DateTime>(
      context: context,
      shape: const RoundedRectangleBorder(
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
    reportNameController.text = widget.report.name;
    dateController.text = widget.report.date;
    reportDrNameController.text = widget.report.drName;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        foregroundColor: AppColors.white,
        backgroundColor: AppColors.icon,
        title:  Text(
          'Edit Report',
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
                        return 'Report name required';
                      }
                      return null;
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
                            return 'Date is required';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),

                   SizedBox(height: 20),

                  AddContainer(
                    text: 'Doctor’s Name',
                    texts: 'Name',
                    controller: reportDrNameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Doctor name required';
                      }
                      return null;
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
                        final updatedReport = ReportModel(
                          name: reportNameController.text,
                          date: dateController.text,
                          drName: reportDrNameController.text,
                        );

                        await editReport(widget.index, updatedReport);

                        Navigator.pop(context);
                         ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Report edited")),
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
