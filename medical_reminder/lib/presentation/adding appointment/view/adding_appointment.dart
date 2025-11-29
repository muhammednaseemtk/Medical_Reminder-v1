import 'package:flutter/material.dart';
import 'package:medical_reminder/core/theme/app_colors.dart';
import 'package:medical_reminder/presentation/adding%20appointment/widget/appointment_textfield.dart';
import 'package:medical_reminder/presentation/adding%20view%20report/widget/add_report.dart';

class AddingAppointment extends StatefulWidget {
  const AddingAppointment({super.key});

  @override
  State<AddingAppointment> createState() => _AddingAppointmentState();
}

class _AddingAppointmentState extends State<AddingAppointment> {
 final TextEditingController titleController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        foregroundColor: AppColors.white,
        backgroundColor: AppColors.icon,
        title: Text(
          'Add Appointment',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            AddContainer(
              text: 'Appointment Title',
              texts: 'e.g., Chemotherapy Session', controller: titleController, validator: (value) {  },
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AppointmentTextfield(
                  text: 'Date',
                  texts: '24 July,2024',
                  icon: Icons.calendar_today,
                  width: 170,
                ),
                AppointmentTextfield(
                  text: 'Time',
                  texts: '10:30 AM',
                  icon: Icons.access_time,
                  width: 170,
                ),
              ],
            ),
            SizedBox(height: 15),
            AppointmentTextfield(
              text: 'Doctor/Specialist',
              texts: 'e.g., Dr.Smith',
              icon: Icons.person,
              width: 400,
            ),
          ],
        ),
      ),
    );
  }
}
