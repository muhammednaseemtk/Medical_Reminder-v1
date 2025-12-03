import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:medical_reminder/presentation/medicine/model/medicine_model.dart';
import 'package:medical_reminder/presentation/auth/function/auth_function.dart';

ValueNotifier<List<MedicineModel>> medicineList = ValueNotifier([]);

Future<Box<MedicineModel>> _medicineBox() async {
  final boxName = '${UserFunctions.loggedInUserEmail}_medicines';
  log(UserFunctions.loggedInUserEmail ?? 'no email');
  return await Hive.openBox<MedicineModel>(boxName);
}

Future<void> addMedicine(MedicineModel value) async {
  final medicineAdd = await _medicineBox();
  await medicineAdd.add(value);
  getAllMedicines();
}

Future<void> getAllMedicines() async {
  final medicineAdd = await _medicineBox();
  medicineList.value.clear();
  medicineList.value.addAll(medicineAdd.values);
  medicineList.notifyListeners();
  getDataCount();
}

void getDataCount(){
 int count = medicineList.value.length;
 log('medicine count ${count.toString()}');

}

Future<void> deleteMedicine(int index) async {
  final medicineAdd = await _medicineBox();
  medicineAdd.deleteAt(index);
  getAllMedicines();
}

Future<void> editMedicine(int index, MedicineModel value) async {
  final medicineAdd = await _medicineBox();
  medicineAdd.putAt(index, value);
  getAllMedicines();
}
