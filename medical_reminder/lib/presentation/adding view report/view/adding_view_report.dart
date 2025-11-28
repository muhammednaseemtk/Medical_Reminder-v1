import 'package:flutter/material.dart';
import 'package:medical_reminder/common/widget/custom_text_field.dart';
import 'package:medical_reminder/core/theme/app_colors.dart';
import 'package:medical_reminder/presentation/adding view report/widget/report_date.dart';
import 'package:medical_reminder/presentation/adding%20view%20report/widget/add_report.dart';

class AddingViewReport extends StatefulWidget {
  const AddingViewReport({super.key});

  @override
  State<AddingViewReport> createState() => _AddingViewReportState();
}

class _AddingViewReportState extends State<AddingViewReport> {
  TextEditingController dateController = TextEditingController();

  Future<DateTime?> showReportDatePicker(BuildContext context) {
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
        backgroundColor: AppColors.icon1,
        title: Text(
          'Add Report',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            AddContainer(
              text: 'Report Name',
              texts: 'e.g., Blood Test Results',
            ),
            SizedBox(height: 15),
            GestureDetector(
              onTap: () async {
                DateTime? picked = await showReportDatePicker(context);
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
                ),
              ),
            ),

            SizedBox(height: 15),
            AddContainer(
              text: 'Doctor`s Name(optional)',
              texts: 'e.g., Dr Smith',
            ),
            SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
