import 'package:hive_flutter/hive_flutter.dart';
import 'package:medical_reminder/presentation/auth/model/user_model.dart';
import 'package:medical_reminder/presentation/profile/function/profile_function.dart';
import 'package:medical_reminder/presentation/profile/model/profile_model.dart';
import 'package:medical_reminder/presentation/bmi/model/bmi_model.dart';
import 'package:medical_reminder/presentation/appointment/model/appointment_model.dart';
import 'package:medical_reminder/presentation/medicine/model/medicine_model.dart';
import 'package:medical_reminder/presentation/report/model/report_model.dart';

class UserFunctions {
  final Box<UserModel> userBox = Hive.box<UserModel>('users');

  static String? loggedInUserEmail;

  Future<bool> addUser(UserModel user) async {
    await userBox.put(user.email, user);

    // Create profile
    final profileBox = await Hive.openBox<ProfileModel>('${user.email}_profile');

    final profile = ProfileModel(
      username: user.username,
      email: user.email,
      imagePath: null,
    );

    await profileBox.put('profile', profile);
    currentProfile.value = profile; // global update

    return true;
  }

  Future<bool> loginUser(String email, String password) async {
    if (!userBox.containsKey(email)) return false;

    final user = userBox.get(email);
    if (user!.password != password) return false;

    loggedInUserEmail = email;

    await Hive.openBox<MedicineModel>('${email}_medicines');
    await Hive.openBox<ReportModel>('${email}_reports');
    await Hive.openBox<AppointmentModel>('${email}_appointments');
    await Hive.openBox<BmiModel>('${email}_bmis');

    final profileBox = await Hive.openBox<ProfileModel>('${email}_profile');
    currentProfile.value = profileBox.get('profile');

    return true;
  }
}
