import 'package:flutter/material.dart';
import 'package:medical_reminder/common/widget/common_button.dart';
import 'package:medical_reminder/core/theme/app_colors.dart';
import 'package:medical_reminder/presentation/adding medicine/widget/adding_container.dart';
import 'package:medical_reminder/presentation/adding view report/widget/add_report.dart';
import 'package:medical_reminder/presentation/adding%20medicine/widget/date_box.dart';
import 'package:medical_reminder/presentation/adding%20medicine/widget/frequency_drop_down.dart';

class AddingMedicine extends StatefulWidget {
  const AddingMedicine({super.key});

  @override
  State<AddingMedicine> createState() => _AddingMedicineState();
}

class _AddingMedicineState extends State<AddingMedicine> {
  DateTime? startDate;
  DateTime? endDate;

  List<String> selectedTimes = [];

  String format(DateTime? date) {
    if (date == null) return "Select";
    return "${date.day}/${date.month}/${date.year}";
  }

  Future<void> pickStartDate() async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: AppColors.icon1,
              onPrimary: AppColors.white,
              onSurface: AppColors.txtColor,
            ),
          ),
          child: child!,
        );
      },
    );
    if (date != null) {
      setState(() => startDate = date);
    }
  }

  Future<void> pickEndDate() async {
    final date = await showDatePicker(
      context: context,
      initialDate: startDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: AppColors.icon1,
              onPrimary: AppColors.white,
              onSurface: AppColors.txtColor,
            ),
          ),
          child: child!,
        );
      },
    );

    if (date != null) {
      setState(() => endDate = date);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        foregroundColor: AppColors.white,
        backgroundColor: AppColors.icon1,
        title: Text(
          'Add Medicine',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 11),
                child: Text(
                  "Medicine Type",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  AddingContainer(
                    image: 'asset/image/pills.jpeg',
                    text: 'Pills',
                  ),
                  AddingContainer(
                    image: 'asset/image/drops.jpeg',
                    text: 'Drop',
                  ),
                  AddingContainer(
                    image: 'asset/image/pills.jpeg',
                    text: 'Syrup',
                  ),
                  AddingContainer(
                    image: 'asset/image/injection.jpeg',
                    text: 'Injection',
                  ),
                ],
              ),
              SizedBox(height: 25),
              AddContainer(text: 'Medicine Name', texts: 'Enter medicine name'),
              SizedBox(height: 15),
              AddContainer(text: 'Dosage', texts: 'Enter the dosage'),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DateBox(
                    label: "Start Date",
                    value: format(startDate),
                    onTap: pickStartDate,
                  ),
                  SizedBox(width: 12),
                  DateBox(
                    label: "End Date",
                    value: format(endDate),
                    onTap: pickEndDate,
                  ),
                ],
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 11),
                child: Text(
                  'Select Frequency',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(height: 5,),
              FrequencyDropDown(
                onTimeChanged: (list) {
                  selectedTimes = list;
                },
              ),SizedBox(height: 70,),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 38),
                child: CommonButton(text: 'Save Medicine', onTap: (){}, textColor: AppColors.white, bgColor: AppColors.icon1),
              )
            ],
          ),
        ),
      ),
    );
  }
}