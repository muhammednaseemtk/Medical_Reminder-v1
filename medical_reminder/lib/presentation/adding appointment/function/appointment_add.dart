import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:medical_reminder/presentation/adding%20appointment/model/appointment_model.dart';
import 'package:medical_reminder/presentation/auth/function/auth_function.dart';

ValueNotifier<List<AppointmentModel>> appointmentList = ValueNotifier([]);

Future<Box<AppointmentModel>> _appointmentBox() async {
  final boxName = '${UserFunctions.loggedInUserEmail}_appointments';
  log(UserFunctions.loggedInUserEmail ?? 'no email');
  return await Hive.openBox<AppointmentModel>(boxName);
}

Future<void> addAppointment(AppointmentModel value) async {
  final appointmentAdd = await _appointmentBox();
  await appointmentAdd.add(value);
  getAllAppointment();
}

Future<void> getAllAppointment() async {
  final appointmentAdd = await _appointmentBox();
  appointmentList.value.clear();
  appointmentList.value.addAll(appointmentAdd.values);
  appointmentList.notifyListeners();
}

Future<void> deleteAppointment(int index) async {
  final appointmentAdd = await _appointmentBox();
  await appointmentAdd.deleteAt(index);
  getAllAppointment();
}

Future<void> editAppointment(int index, AppointmentModel value) async {
  final appointmentAdd = await _appointmentBox();
  await appointmentAdd.putAt(index, value);
  getAllAppointment();
}
