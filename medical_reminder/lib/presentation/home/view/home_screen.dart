import 'dart:io';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:medical_reminder/core/route/app_route.dart';
import 'package:medical_reminder/core/theme/app_colors.dart';
import 'package:medical_reminder/presentation/home/widget/appointment_card.dart';
import 'package:medical_reminder/presentation/home/widget/medicine_card.dart';
import 'package:medical_reminder/presentation/home/widget/menu_card.dart';
import 'package:medical_reminder/presentation/home/widget/drawer.dart';
import 'package:medical_reminder/presentation/auth/function/auth_function.dart';
import 'package:hive/hive.dart';
import 'package:medical_reminder/presentation/medicine/model/medicine_model.dart';
import 'package:medical_reminder/presentation/appointment/model/appointment_model.dart';
import 'package:medical_reminder/presentation/profile/function/profile_function.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<MedicineModel> todayMedicines = [];
  List<AppointmentModel> appointments = [];

  @override
  void initState() {
    super.initState();
    _loadMedicines();
    _loadAppointments();
  }

  Future<void> _loadMedicines() async {
    final email = UserFunctions.loggedInUserEmail;
    if (email == null) return;

    final box = await Hive.openBox<MedicineModel>('${email}_medicines');
    setState(() {
      todayMedicines = box.values.toList();
    });
  }

  Future<void> _loadAppointments() async {
    final email = UserFunctions.loggedInUserEmail;
    if (email == null) return;

    final box = await Hive.openBox<AppointmentModel>('${email}_appointments');
    setState(() {
      appointments = box.values.toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      drawer: DrawerScreen(),
    
      body: ValueListenableBuilder(
        valueListenable: currentProfile,
        builder: (context, profile, _) {
          if (profile == null) {
            return Center(child: CircularProgressIndicator());
          }
    
          final username = profile.username;
          final email = profile.email;
          final imagePath = profile.imagePath;
    
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20,),
                Builder(
                  builder: (context) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 15,
                      ),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Scaffold.of(context).openDrawer();
                            },
                            child: CircleAvatar(
                              radius: 22,
                              backgroundColor: AppColors.bgBtnColor,
                              backgroundImage: imagePath != null
                                  ? FileImage(File(imagePath))
                                  : null,
                              child: imagePath == null
                                  ? Icon(
                                      EneftyIcons.profile_outline,
                                      color: AppColors.icon,
                                    )
                                  : null,
                            ),
                          ),
                          SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                username,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                email,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: AppColors.lightShade,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
    
                Row(
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
    
                Row(
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
    
                SizedBox(height: 15),
    
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Today's Medicine",
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
          );
        },
      ),
    );
  }
}
