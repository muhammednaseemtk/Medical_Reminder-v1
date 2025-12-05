import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:medical_reminder/presentation/auth/function/auth_function.dart';
import 'package:medical_reminder/presentation/profile/model/profile_model.dart';

ValueNotifier<ProfileModel?> currentProfile = ValueNotifier(null);

Future<Box<ProfileModel>> _profileBox() async {
  final email = UserFunctions.loggedInUserEmail;
  final boxName = '${email}_profile';
  return await Hive.openBox<ProfileModel>(boxName);
}

Future<void> loadProfile() async {
  final box = await _profileBox();
  currentProfile.value = box.get('profile');
  currentProfile.notifyListeners();
}

Future<void> saveProfile(ProfileModel model) async {
  final box = await _profileBox();
  await box.put('profile', model);
  currentProfile.value = model;
  currentProfile.notifyListeners();
}
