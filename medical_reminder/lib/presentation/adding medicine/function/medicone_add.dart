import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:medical_reminder/presentation/adding%20medicine/model/medicine_model.dart';
import 'package:medical_reminder/presentation/auth/function/auth_function.dart';

ValueNotifier<List<MedicineModel>> medicineList = ValueNotifier([]);

Future<void> addMedicine(MedicineModel value) async {
  final medicineAdd = await Hive.openBox<MedicineModel>("${UserFunctions.loggedInUserEmail}_medicines");
  await medicineAdd.add(value);
  getAllMedicines();
}

Future<void> getAllMedicines() async {
  final medicineAdd = await Hive.openBox<MedicineModel>("medicines");
  medicineList.value.clear();
  medicineList.value.addAll(medicineAdd.values);
  medicineList.notifyListeners();
}

Future<void> deleteMedicine(int index) async {
  final medicineAdd = await Hive.openBox<MedicineModel>("medicines");
  medicineAdd.deleteAt(index);
  getAllMedicines();
}

Future<void> editMedicine(int index, MedicineModel value) async {
  final medicineAdd = await Hive.openBox<MedicineModel>("medicines");
  medicineAdd.putAt(index, value);
  getAllMedicines();
}
