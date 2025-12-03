import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';

import 'package:medical_reminder/core/route/app_route.dart';
import 'package:medical_reminder/core/theme/app_colors.dart';

import 'package:medical_reminder/presentation/home/widget/appointment_card.dart';

import 'package:medical_reminder/presentation/home/widget/medicine_card.dart';
import 'package:medical_reminder/presentation/home/widget/menu_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('asset/image/profile.png'),
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Muhammed Naseem T K ',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  MenuCard(
                    image: 'asset/image/viewreport.jpg',
                    text: 'View Report',
                    onTap: () {
                      Navigator.pushNamed(context, AppRoute.viewReport);
                    },
                  ),
                  MenuCard(
                    image: 'asset/image/managemedicine.jpg',
                    text: 'Medicine',
                    onTap: () {
                      Navigator.pushNamed(context, AppRoute.manageMedicine);
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  MenuCard(
                    image: 'asset/image/addappointment.jpg',
                    text: 'Appointment',
                    onTap: () {
                      Navigator.pushNamed(context, AppRoute.addAppointment);
                    },
                  ),
                  MenuCard(
                    image: 'asset/image/checkbmi.jpeg',
                    text: 'BMI',
                    onTap: () {
                      Navigator.pushNamed(context, AppRoute.checkBmi);
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Today`s Medicine',
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.w500),
              ),
            ),
            MedicineCard(
              name: 'Metformin',
              dose: '500mg',
              time: '9:00 AM',
              isTaken: 'Taken',
              icon: EneftyIcons.tick_circle_outline,
              containerColor: AppColors.bgBtnColor,
              iconColor: AppColors.icon,
              textColor: AppColors.textColor,
              height: 35,
              width: 85,
            ),
            MedicineCard(
              name: 'Lisinporil',
              dose: '10mg',
              time: '9:00 AM',
              isTaken: 'Upcoming',
              icon: EneftyIcons.timer_2_outline,
              containerColor: AppColors.bgBtnColor1,
              iconColor: AppColors.icon1,
              textColor: AppColors.textColor1,
              height: 35,
              width: 110,
            ),
            MedicineCard(
              name: 'Atorvastain',
              dose: '20mg',
              time: '9:00 PM',
              isTaken: 'Missed',
              icon: EneftyIcons.close_circle_outline,
              containerColor: AppColors.bgBtnColor2,
              iconColor: AppColors.icon2,
              textColor: AppColors.textColor2,
              height: 35,
              width: 100,
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Upcoming Appointments',
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.w500),
              ),
            ),
            AppointmentCard(
              containerColor: AppColors.bgBtnColor1,
              iconColor: AppColors.icon1,
              name: 'Dr.Smith - Annual Checkup',
              date: 'Oct 26',
              time: '2:00 PM',
            ),
            SizedBox(height: 10),
            AppointmentCard(
              containerColor: AppColors.bgBtnColor1,
              iconColor: AppColors.icon1,
              name: 'Dental Cleaning',
              date: 'Nov 15',
              time: '11:30 AM',
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
