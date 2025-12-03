import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:medical_reminder/presentation/check%20bmi/model/bmi_model.dart';
import 'package:medical_reminder/presentation/auth/function/auth_function.dart';

ValueNotifier<List<BmiModel>> bmiList = ValueNotifier([]);

Future<Box<BmiModel>> _bmiBox() async {
  final boxName = '${UserFunctions.loggedInUserEmail}_bmi';
  log(UserFunctions.loggedInUserEmail ?? 'no email');
  return await Hive.openBox<BmiModel>(boxName);
}

Future<void> addBmi(BmiModel value) async {
  final bmiBox = await _bmiBox();
  await bmiBox.add(value);
  getAllBmi();
}

Future<void> getAllBmi() async {
  final bmiBox = await _bmiBox();
  bmiList.value.clear();
  bmiList.value.addAll(bmiBox.values);
  bmiList.notifyListeners();
}

Future<void> deleteBmi(int index) async {
  final bmiBox = await _bmiBox();
  await bmiBox.deleteAt(index);
  getAllBmi();
}

Future<void> editBmi(int index, BmiModel value) async {
  final bmiBox = await _bmiBox();
  await bmiBox.putAt(index, value);
  getAllBmi();
}
