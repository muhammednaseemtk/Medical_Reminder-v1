import 'package:flutter/material.dart';
import 'package:medical_reminder/core/route/app_route.dart';
import 'package:medical_reminder/core/theme/app_colors.dart';
import 'package:medical_reminder/presentation/add%20%20appointment/function/appointment_add.dart';
import 'package:medical_reminder/presentation/edit%20appointment/view/edit_appointment.dart';

class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen({super.key});

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  @override
  void initState() {
    super.initState();
    getAllAppointment();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        foregroundColor: AppColors.white,
        backgroundColor: AppColors.icon,
        title: const Text(
          'Appointment',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),

      body: ValueListenableBuilder(
        valueListenable: appointmentList,
        builder: (context, list, child) {
          if (list.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('asset/image/appointment.jpg',
                      width: 250, height: 260),
                  const Text('No Appointments Yet!',
                      style: TextStyle(fontSize: 15)),
                  Text(
                    'Add your first appointment to get started',
                    style: TextStyle(color: AppColors.lightShade),
                  ),
                ],
              ),
            );
          }

          return ListView.separated(
            padding: const EdgeInsets.all(15),
            separatorBuilder: (_, __) => const SizedBox(height: 10),
            itemCount: list.length,
            itemBuilder: (context, index) {
              final data = list[index];

              return Card(
                color: AppColors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 1.5,

                child: ListTile(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 15),

                  title: Text(
                    data.title,
                    style: const TextStyle(
                        fontSize: 16,fontWeight: FontWeight.w500),
                  ),

                  subtitle: Text(
                    "Doctor: ${data.name}\nDate: ${data.date}",
                  ),

                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit, color: AppColors.icon),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EditAppointment(
                                appointment: data,
                                index: index,
                              ),
                            ),
                          );
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.delete, color: AppColors.icon),
                        onPressed: () {
                          deleteAppointment(index);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Appointment deleted")),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),

      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, AppRoute.addingAppointment);
          },
          backgroundColor: AppColors.icon,
          child: Icon(Icons.add, color: AppColors.white),
        ),
      ),
    );
  }
}
