import 'package:flutter/material.dart';
import 'package:horizontal_week_calendar/horizontal_week_calendar.dart';
import 'package:medical_reminder/core/route/app_route.dart';
import 'package:medical_reminder/core/theme/app_colors.dart';

class ManageMedicineScreen extends StatefulWidget {
  const ManageMedicineScreen({super.key});

  @override
  State<ManageMedicineScreen> createState() => _ManageMedicineScreenState();
}

class _ManageMedicineScreenState extends State<ManageMedicineScreen> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        foregroundColor: AppColors.white,
        backgroundColor: AppColors.icon,
        title: Text(
          'Manage Medicine',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: HorizontalWeekCalendar(
              minDate: DateTime(2023, 1, 31),
              maxDate: DateTime(2026, 1, 31),
              initialDate: DateTime(2024, 1, 15),
              weekStartFrom: WeekStartFrom.Monday,
              onDateChange: (date) {
                setState(() {
                  selectedDate = date;
                });
              },
              activeBackgroundColor: AppColors.icon,
              activeTextColor: AppColors.white,
              inactiveBackgroundColor: AppColors.white,
              inactiveTextColor: AppColors.txtColor,
              disabledBackgroundColor: AppColors.shadow,
              disabledTextColor: AppColors.shadow,
              borderRadius: BorderRadius.circular(35),
              monthColor: AppColors.txtColor,
              showNavigationButtons: false,
            ),
          ),
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('asset/image/medicine.jpg', width: 240),
                  Text(
                    'Add Medicine Reminder',
                    style: TextStyle(fontSize: 15),
                  ),
                  Text('No reminders available. Tap the button below to create one',style: TextStyle(color: AppColors.lightShade,fontSize: 12),)
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, AppRoute.addingMedicine);
          },
          backgroundColor: AppColors.icon,
          child: Icon(Icons.add, color: AppColors.white),
        ),
      ),
    );
  }
}
