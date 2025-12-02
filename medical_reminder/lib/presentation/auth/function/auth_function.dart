import 'package:hive_flutter/adapters.dart';
import 'package:medical_reminder/presentation/add%20bmi/model/bmi_model.dart';
import 'package:medical_reminder/presentation/add%20appointment/model/appointment_model.dart';
import 'package:medical_reminder/presentation/add%20medicine/model/medicine_model.dart';
import 'package:medical_reminder/presentation/add%20view%20report/model/report_model.dart';
import 'package:medical_reminder/presentation/auth/model/user_model.dart';

class UserFunctions {
  final Box<UserModel> userBox = Hive.box<UserModel>('users');
  Future<bool> addUser(UserModel user) async {
    await userBox.put(user.email, user);
    return true;
  }
  static String? loggedInUserEmail;

Future<bool> loginUser(String email, String password) async {
  if (!userBox.containsKey(email)) return false;

  final user = userBox.get(email);
  if (user!.password != password) return false;

  loggedInUserEmail = email;

  await Hive.openBox<MedicineModel>('${email}_medicines');
  await Hive.openBox<ReportModel>('${email}_reports');
  await Hive.openBox<AppointmentModel>('${email}_appointments');
  await Hive.openBox<BmiModel>('${email}_bmis');

  return true;
}

  UserModel? getUser(String email) {
    return userBox.get(email);
  }
}
