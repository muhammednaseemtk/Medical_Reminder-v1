import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:medical_reminder/core/route/app_route.dart';
import 'package:medical_reminder/presentation/appointment/view/appointment_screen.dart';
import 'package:medical_reminder/presentation/appointment/model/appointment_model.dart';
import 'package:medical_reminder/presentation/appointment/view/adding_appointment.dart';
import 'package:medical_reminder/presentation/bmi/model/bmi_model.dart';
import 'package:medical_reminder/presentation/bmi/view/adding_bmi.dart';
import 'package:medical_reminder/presentation/medicine/model/medicine_model.dart';
import 'package:medical_reminder/presentation/medicine/view/adding_medicine.dart';
import 'package:medical_reminder/presentation/home/widget/drawer.dart';
import 'package:medical_reminder/presentation/profile/model/profile_model.dart';
import 'package:medical_reminder/presentation/profile/view/profile.dart';
import 'package:medical_reminder/presentation/report/model/report_model.dart';
import 'package:medical_reminder/presentation/report/view/adding_view_report.dart';
import 'package:medical_reminder/presentation/auth/model/user_model.dart';
import 'package:medical_reminder/presentation/bmi/view/check_bmi.dart';
import 'package:medical_reminder/presentation/report/view/edit_report.dart';
import 'package:medical_reminder/presentation/appointment/view/edit_appointment.dart';
import 'package:medical_reminder/presentation/bmi/view/edit_bmi.dart';
import 'package:medical_reminder/presentation/medicine/view/edit_medicine.dart';
import 'package:medical_reminder/presentation/home/view/home_screen.dart';
import 'package:medical_reminder/presentation/auth/login/view/login_screen.dart';
import 'package:medical_reminder/presentation/auth/sign_up/view/sign_up_screen.dart';
import 'package:medical_reminder/presentation/home/widget/main_page.dart';
import 'package:medical_reminder/presentation/medicine/view/manage_medicine_screen.dart';
import 'package:medical_reminder/presentation/report/view/view_report_screen.dart';
import 'package:medical_reminder/presentation/setting/view/setting_screen.dart';
import 'package:medical_reminder/presentation/splash/view/splash_screen.dart';
import 'package:medical_reminder/presentation/statistics/view/statistics_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  Hive.registerAdapter(UserModelAdapter());
  Hive.registerAdapter(MedicineModelAdapter());
  Hive.registerAdapter(ReportModelAdapter());
  Hive.registerAdapter(AppointmentModelAdapter());
  Hive.registerAdapter(BmiModelAdapter());
  Hive.registerAdapter(ProfileModelAdapter());

  await Hive.openBox<UserModel>('users');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoute.splash,

      routes: {
        AppRoute.splash: (context) => const SplashScreen(),
        AppRoute.login: (context) => LoginScreen(),
        AppRoute.signUp: (context) => SignUpScreen(),
        AppRoute.home: (context) => HomeScreen(),

        AppRoute.viewReport: (context) => ViewReportScreen(),
        AppRoute.addingViewReport: (context) => AddingViewReport(),

        AppRoute.editViewReport: (context) {
          final args = ModalRoute.of(context)!.settings.arguments as Map;
          return EditViewReport(report: args["report"], index: args["index"]);
        },

        AppRoute.addAppointment: (context) => AppointmentScreen(),
        AppRoute.addingAppointment: (context) => AddingAppointment(),
        AppRoute.editAppointment: (context) {
          final args = ModalRoute.of(context)!.settings.arguments as Map;
          return EditAppointment(
            appointment: args["appointment"],
            index: args["index"],
          );
        },

        AppRoute.manageMedicine: (context) => ManageMedicineScreen(),
        AppRoute.addingMedicine: (context) => AddingMedicine(),
        AppRoute.editMedicine:(context) {
          final args = ModalRoute.of(context)!.settings.arguments as Map;
          return EditMedicine(medicine: args['medicines'],index: args['index'],);
        },
        AppRoute.checkBmi: (context) => CheckBmiScreen(),
        AppRoute.addingBmi: (context) => AddingBmi(),
        AppRoute.editBmi: (context) {
          final args = ModalRoute.of(context)!.settings.arguments as Map;
          return EditBmi(bmi: args["bmi"], index: args['index']);
        },
        AppRoute.statistics: (context) => StatisticsScreen(),
        AppRoute.setting: (context) => SettingScreen(),
        AppRoute.drawer: (context) => DrawerScreen(),
        AppRoute.profile: (context) => ProfileScreen(),
        AppRoute.mainPage: (context) => MainPage(),
      },
    );
  }
}
