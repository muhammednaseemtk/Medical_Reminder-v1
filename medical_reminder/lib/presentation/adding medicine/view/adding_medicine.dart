import 'package:flutter/material.dart';
import 'package:medical_reminder/common/widget/common_button.dart';
import 'package:medical_reminder/core/theme/app_colors.dart';
import 'package:medical_reminder/presentation/adding medicine/widget/adding_container.dart';
import 'package:medical_reminder/presentation/adding medicine/widget/date_box.dart';
import 'package:medical_reminder/presentation/adding medicine/widget/frequency_drop_down.dart';
import 'package:medical_reminder/presentation/adding view report/widget/report_date.dart';
import 'package:medical_reminder/presentation/adding%20medicine/widget/type_drop_down.dart';
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

  final List<String> medicineTypes = [
    'Pills',
    'Drops',
    'Syrup',
    'Injection',
  ];

  String format(DateTime? date) {
    if (date == null) return "Select";
    return "${date.day}/${date.month}/${date.year}";
  }

  Future<void> pickDate({required bool isStart}) async {
    final DateTime? picked = await showModalBottomSheet<DateTime>(
      context: context,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => ReportDate(
        initialDate: isStart
            ? startDate ?? DateTime.now()
            : endDate ?? DateTime.now(),
      ),
    );

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
      backgroundColor: AppColors.white,
      appBar: AppBar(
        foregroundColor: AppColors.white,
        backgroundColor: AppColors.icon,
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
              MedicineTypeDropdown(
                items: medicineTypes,
                onChanged: (value) {
                  selectedMedicineType = value;
                },
              ),
              SizedBox(height: 25),
              AddContainer(
                text: 'Medicine Name',
                texts: 'Enter medicine name',
                controller: nameController,
                validator: (value) {},
              ),
              SizedBox(height: 15),
              AddContainer(
                text: 'Dosage',
                texts: 'Enter the dosage',
                controller: dosageController,
                validator: (value) {},
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DateBox(
                    label: "Start Date",
                    value: format(startDate),
                    onTap: () => pickDate(isStart: true),
                  ),
                  SizedBox(width: 12),
                  DateBox(
                    label: "End Date",
                    value: format(endDate),
                    onTap: () => pickDate(isStart: false),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 11),
                child: Text(
                  'Select Frequency',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(height: 5),
              FrequencyDropDown(
                onTimeChanged: (list) {
                  selectedTimes = list;
                },
              ),
              SizedBox(height: 60),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 38),
                child: CommonButton(
                  text: 'Save Medicine',
                  onTap: () {
                    print("TYPE: $selectedMedicineType");
                    print("NAME: ${nameController.text}");
                    print("DOSAGE: ${dosageController.text}");
                  },
                  textColor: AppColors.white,
                  bgColor: AppColors.icon,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
