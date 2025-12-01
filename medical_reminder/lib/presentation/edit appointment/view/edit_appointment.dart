import 'package:flutter/material.dart';
import 'package:medical_reminder/common/widget/common_button.dart';
import 'package:medical_reminder/core/theme/app_colors.dart';
import 'package:medical_reminder/presentation/adding appointment/widget/appointment_textfield.dart';
import 'package:medical_reminder/presentation/adding view report/widget/add_report.dart';
import 'package:medical_reminder/presentation/adding view report/widget/report_date.dart';

class EditAppointment extends StatefulWidget {
  const EditAppointment({super.key});

  @override
  State<EditAppointment> createState() => _EditAppointmentState();
}

class _EditAppointmentState extends State<EditAppointment> {
  final TextEditingController appointmentController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future<DateTime?> AppointmentDatePicker(BuildContext context) {
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
          'Add Appointment',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  AddContainer(
                    text: 'Appointment Title',
                    texts: 'title',
                    controller: appointmentController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'appointment title required';
                      }
                      return null;
                    },
                  ),

                  SizedBox(height: 20),

                  GestureDetector(
                    onTap: () async {
                      DateTime? picked = await AppointmentDatePicker(context);

                      if (picked != null) {
                        setState(() {
                          dateController.text =
                              "${picked.day}/${picked.month}/${picked.year}";
                        });
                      }
                    },
                    child: AbsorbPointer(
                      child: AddContainer(
                        text: 'Appointment Date',
                        texts: dateController.text.isEmpty
                            ? 'mm/dd/yyyy'
                            : dateController.text,
                        controller: dateController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'date is required';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  AddContainer(
                    text: 'Doctor name',
                    texts: 'name',
                    controller: nameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'name is required';
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
                    text: 'Save appointment',
                    onTap: () {},
                    textColor: AppColors.white,
                    bgColor: AppColors.icon,
                  ),
                  SizedBox(height: 20,)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
