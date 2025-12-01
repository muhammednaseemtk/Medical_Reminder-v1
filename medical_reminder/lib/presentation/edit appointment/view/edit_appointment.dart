import 'package:flutter/material.dart';
import 'package:medical_reminder/common/widget/common_button.dart';
import 'package:medical_reminder/core/theme/app_colors.dart';
import 'package:medical_reminder/presentation/adding appointment/function/appointment_add.dart';
import 'package:medical_reminder/presentation/adding appointment/model/appointment_model.dart';
import 'package:medical_reminder/presentation/adding view report/widget/add_report.dart';
import 'package:medical_reminder/presentation/adding view report/widget/report_date.dart';

class EditAppointment extends StatefulWidget {
  final AppointmentModel appointment;
  final int index;

  const EditAppointment({
    super.key,
    required this.appointment,
    required this.index,
  });

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
  void initState() {
    super.initState();

    /// PREFILL VALUES
    appointmentController.text = widget.appointment.title;
    nameController.text = widget.appointment.name;
    dateController.text = widget.appointment.date;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        foregroundColor: AppColors.white,
        backgroundColor: AppColors.icon,
        title: Text(
          'Edit Appointment',
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
                    texts: 'Enter title',
                    controller: appointmentController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Appointment title required';
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
                            ? 'dd/mm/yyyy'
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
                    text: 'Doctor Name',
                    texts: 'Enter name',
                    controller: nameController,
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
                    text: 'Save Appointment',
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        final updatedAppointment = AppointmentModel(
                          title: appointmentController.text,
                          name: nameController.text,
                          date: dateController.text,
                        );

                        await editAppointment(widget.index, updatedAppointment);

                        Navigator.pop(context);
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
