import 'package:flutter/material.dart';
import 'package:medical_reminder/core/route/app_route.dart';
import 'package:medical_reminder/core/theme/app_colors.dart';

class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen({super.key});

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        foregroundColor: AppColors.white,
        backgroundColor: AppColors.icon,
        title: Text(
          'Appointment',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('asset/image/appointment.jpg',width: 250,height: 260,),
            Text('No Appointments Yet!', style: TextStyle(fontSize: 15)),
            Text('Add your first appointment to get started',style: TextStyle(color: AppColors.lightShade),)
          ],
        ),
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
