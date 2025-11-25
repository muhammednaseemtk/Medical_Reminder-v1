import 'package:flutter/material.dart';
import 'package:medical_reminder/core/theme/app_colors.dart';
import 'package:medical_reminder/presentation/adding%20medicine/widget/adding_container.dart';
import 'package:medical_reminder/presentation/adding%20medicine/widget/frequency_drop_down.dart';
import 'package:medical_reminder/presentation/adding%20view%20report/widget/add_report.dart';

class AddingMedicine extends StatefulWidget {
  const AddingMedicine({super.key});

  @override
  State<AddingMedicine> createState() => _AddingMedicineState();
}

class _AddingMedicineState extends State<AddingMedicine> {
  String selectedFrequency = 'Daily';
  List<String> frequencyList = [
    "Daily",
    "Weekly",
    "Monthly",
    "Every 6 Hours",
    "Every 8 Hours",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        foregroundColor: AppColors.white,
        backgroundColor: AppColors.icon1,
        title: Text('Add medicine',style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Medicine Type',style: TextStyle(fontWeight: FontWeight.w500),),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  AddingContainer(image: 'asset/image/pills.jpeg', text: 'Pills'),
                  AddingContainer(image: 'asset/image/drops.jpeg', text: 'Drop'),
                  AddingContainer(image: 'asset/image/pills.jpeg', text: 'Syrup'),
                  AddingContainer(image: 'asset/image/injection.jpeg', text: 'Injection')
                ],
              ),
              SizedBox(height: 30,),
              AddContainer(text: 'Medicine Name', texts: 'Enter medicine name'),
              SizedBox(height: 15,),
              AddContainer(text: 'Dosage', texts: 'Enter the dosage'),
              SizedBox(height: 15,),
              FrequencyDropdown(label: 'Frequency', value: selectedFrequency, items: frequencyList, onChanged: (newValue){
                setState(() {
                  selectedFrequency = newValue!;
                });
              })
            ],
          ),
        ),
      ),
    );
  }
} 