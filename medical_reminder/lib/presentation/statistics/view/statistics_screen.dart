import 'package:flutter/material.dart';
import 'package:medical_reminder/core/theme/app_colors.dart';
import 'package:medical_reminder/presentation/statistics/widget/quick_status.dart';

class StatisticsScreen extends StatefulWidget {
  const StatisticsScreen({super.key});

  @override
  State<StatisticsScreen> createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<StatisticsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: Text(
          'Statistics',
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 25),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Container(color: AppColors.shadow, height: 1),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10),
            Card(
              elevation: 2,
              color: AppColors.bgColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Quick Status',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 15),
                    QuickStatus(
                      icon: Icons.check_circle_outline_outlined,
                      iconColor: AppColors.icon,
                      bgColor: AppColors.bgBtnColor,
                      text: 'Current Streak',
                      text1: 'Days on track',
                      values: '12 days',
                    ),
                    SizedBox(height: 8,),
                    Divider(),
                    SizedBox(height: 8,),
                    QuickStatus(
                      icon: Icons.medication_outlined,
                      iconColor: AppColors.icon1,
                      bgColor: AppColors.bgBtnColor1,
                      text: 'Active Medicine',
                      text1: 'Currently taking',
                      values: '11',
                    ),
                    SizedBox(height: 8,),
                    Divider(),
                    SizedBox(height: 8,),
                    QuickStatus(
                      icon: Icons.calendar_month_outlined,
                      iconColor: AppColors.icon3,
                      bgColor: AppColors.bgBtnColor3,
                      text: 'Avg.Doses Per Day',
                      text1: 'This month',
                      values: '3.8',
                    ),
                    SizedBox(height: 8,),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
