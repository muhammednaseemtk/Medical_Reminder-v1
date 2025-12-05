import 'package:flutter/material.dart';
import 'package:medical_reminder/core/theme/app_colors.dart';

class ReportDate extends StatelessWidget {
  final DateTime initialDate;

  ReportDate({super.key, required this.initialDate});

  @override
  Widget build(BuildContext context) {
    DateTime selectedDate = initialDate;

    return Container(
      padding: EdgeInsets.all(16),
      height: 395,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Select Date",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: AppColors.icon),
          ),
          SizedBox(height: 10),
          Theme(
            data: Theme.of(context).copyWith(
              colorScheme: ColorScheme.light(
                primary: AppColors.icon,
                onPrimary: AppColors.white,
                onSurface: AppColors.txtColor
              )
            ),
            child: Expanded(
              child: CalendarDatePicker(
                initialDate: initialDate,
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),
                onDateChanged: (value) {
                  selectedDate = value;
                },
              ),
            ),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.icon,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: () {
              Navigator.pop(context, selectedDate);
            },
            child: Text(
              "Done",
              style: TextStyle(fontSize: 16, color: AppColors.white),
            ),
          ),
        ],
      ),
    );
  }
}
