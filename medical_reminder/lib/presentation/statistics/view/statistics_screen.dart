import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:medical_reminder/core/theme/app_colors.dart';
import 'package:medical_reminder/presentation/appointment/model/appointment_model.dart';
import 'package:medical_reminder/presentation/auth/function/auth_function.dart';
import 'package:medical_reminder/presentation/bmi/model/bmi_model.dart';
import 'package:medical_reminder/presentation/medicine/model/medicine_model.dart';
import 'package:medical_reminder/presentation/report/model/report_model.dart';

class StatisticsScreen extends StatefulWidget {
  const StatisticsScreen({super.key});

  @override
  State<StatisticsScreen> createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<StatisticsScreen> {
  int appointmentCount = 0;
  int bmiCount = 0;
  int medicineCount = 0;
  int reportCount = 0;
@override
void initState() {
  super.initState();
  loadCounts();
  setupListeners();
}

void setupListeners() async {
  final email = UserFunctions.loggedInUserEmail;

  final appointmentBox =
      await Hive.openBox<AppointmentModel>("${email}_appointments");
  final bmiBox = await Hive.openBox<BmiModel>("${email}_bmi");
  final medicineBox =
      await Hive.openBox<MedicineModel>("${email}_medicines");
  final reportBox =
      await Hive.openBox<ReportModel>("${email}_reports");

  appointmentBox.listenable().addListener(() => loadCounts());
  bmiBox.listenable().addListener(() => loadCounts());
  medicineBox.listenable().addListener(() => loadCounts());
  reportBox.listenable().addListener(() => loadCounts());
}


  Future<void> loadCounts() async {
    
    final email = UserFunctions.loggedInUserEmail;

    final appointmentBox =
        await Hive.openBox<AppointmentModel>("${email}_appointments");
    final bmiBox = await Hive.openBox<BmiModel>("${email}_bmi");
    final medicineBox =
        await Hive.openBox<MedicineModel>("${email}_medicines");
    final reportBox = await Hive.openBox<ReportModel>("${email}_reports");

    setState(() {
      appointmentCount = appointmentBox.length;
      bmiCount = bmiBox.length;
      medicineCount = medicineBox.length;
      reportCount = reportBox.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    final total = appointmentCount + bmiCount + medicineCount + reportCount;

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title:  Text(
          'Statistics',
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 25),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize:  Size.fromHeight(1),
          child: Container(color: AppColors.shadow, height: 1),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
             SizedBox(height: 20),
            if (total == 0)
              const Padding(
                padding: EdgeInsets.only(top: 100),
                child: Text("No data available",
                    style: TextStyle(fontSize: 20)),
              )
            else
              SizedBox(
                height: 350,
                child: PieChart(
                  PieChartData(
                    sectionsSpace: 3,
                    centerSpaceRadius: 40,
                    sections: [
                      PieChartSectionData(
                        color: AppColors.icon1,
                        value: appointmentCount.toDouble(),
                        title: "Appointments\n$appointmentCount",
                        radius: 90,
                        titleStyle:  TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: AppColors.white),
                      ),
                      PieChartSectionData(
                        color: AppColors.icon,
                        value: bmiCount.toDouble(),
                        title: "BMI\n$bmiCount",
                        radius: 90,
                        titleStyle:  TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: AppColors.white),
                      ),
                      PieChartSectionData(
                        color: AppColors.icon3,
                        value: medicineCount.toDouble(),
                        title: "Medicine\n$medicineCount",
                        radius: 90,
                        titleStyle:  TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: AppColors.white),
                      ),
                      PieChartSectionData(
                        color: AppColors.icon2,
                        value: reportCount.toDouble(),
                        title: "Reports\n$reportCount",
                        radius: 90,
                        titleStyle:  TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: AppColors.white),
                      ),
                    ],
                  ),
                ),
              ),
             SizedBox(height: 20),
            infoTile("Total Appointments", appointmentCount, AppColors.icon1),
            infoTile("BMI Records", bmiCount, AppColors.icon),
            infoTile("Medicines", medicineCount, AppColors.icon3),
            infoTile("Reports", reportCount, AppColors.icon2),
             SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
  Widget infoTile(String title, int count, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      child: Row(
        children: [
          Container(
            width: 15,
            height: 15,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: color),
          ),
           SizedBox(width: 10),
          Text("$title: $count",
              style:  TextStyle(fontSize: 17)),
        ],
      ),
    );
  }
}
