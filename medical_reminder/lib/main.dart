import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:medical_reminder/core/route/app_route.dart';
import 'package:medical_reminder/presentation/add appointment/view/appointment_screen.dart';
import 'package:medical_reminder/presentation/adding appointment/view/adding_appointment.dart';
import 'package:medical_reminder/presentation/adding bmi/view/adding_bmi.dart';
import 'package:medical_reminder/presentation/adding medicine/model/medicine_model.dart';
import 'package:medical_reminder/presentation/adding medicine/view/adding_medicine.dart';
import 'package:medical_reminder/presentation/adding view report/model/report_model.dart';
import 'package:medical_reminder/presentation/adding view report/view/adding_view_report.dart';
import 'package:medical_reminder/presentation/auth/model/user_model.dart';
import 'package:medical_reminder/presentation/check bmi/view/check_bmi.dart';
import 'package:medical_reminder/presentation/edit view report/view/edit_report.dart';
import 'package:medical_reminder/presentation/home/view/home_screen.dart';
import 'package:medical_reminder/presentation/auth/login/view/login_screen.dart';
import 'package:medical_reminder/presentation/auth/sign_up/view/sign_up_screen.dart';
import 'package:medical_reminder/presentation/home/widget/main_page.dart';
import 'package:medical_reminder/presentation/manage medicine/view/manage_medicine_screen.dart';
import 'package:medical_reminder/presentation/view report/view/view_report_screen.dart';
import 'package:medical_reminder/presentation/setting/view/setting_screen.dart';
import 'package:medical_reminder/presentation/splash/view/splash_screen.dart';
import 'package:medical_reminder/presentation/statistics/view/statistics_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  Hive.registerAdapter(UserModelAdapter());
  Hive.registerAdapter(MedicineModelAdapter());
  Hive.registerAdapter(ReportModelAdapter());

  await Hive.openBox<UserModel>('users');
  await Hive.openBox<MedicineModel>('medicines');
  await Hive.openBox<ReportModel>('reports');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoute.signUp,

      routes: {
        AppRoute.splash: (context) => const SplashScreen(),
        AppRoute.login: (context) => LoginScreen(),
        AppRoute.signUp: (context) => SignUpScreen(),
        AppRoute.home: (context) => HomeScreen(),

        AppRoute.viewReport: (context) => ViewReportScreen(),
        AppRoute.addingViewReport: (context) => AddingViewReport(),

        AppRoute.editViewReport: (context) {
          final args = ModalRoute.of(context)!.settings.arguments as Map;
          return EditViewReport(
            report: args["report"],
            index: args["index"],
          );
        },

        AppRoute.addAppointment: (context) => AppointmentScreen(),
        AppRoute.addingAppointment: (context) => AddingAppointment(),
        AppRoute.manageMedicine: (context) => ManageMedicineScreen(),
        AppRoute.addingMedicine: (context) => AddingMedicine(),
        AppRoute.checkBmi: (context) => CheckBmiScreen(),
        AppRoute.addingBmi: (context) => AddingBmi(),
       AppRoute.statistics: (context) => StatisticsScreen(),
        AppRoute.setting: (context) => SettingScreen(),
        AppRoute.mainPage: (context) => MainPage(),
      },
    );
  }
}
