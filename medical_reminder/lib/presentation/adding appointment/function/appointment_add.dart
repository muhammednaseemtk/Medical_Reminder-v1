import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:medical_reminder/presentation/adding appointment/model/appointment_model.dart';

ValueNotifier<List<AppointmentModel>> appointmentList = ValueNotifier([]);

Future<void> addAppointment(AppointmentModel value) async {
  final appointmentAdd = await Hive.openBox<AppointmentModel>('appointments');
  await appointmentAdd.add(value);
  getAllAppointment();
}

Future<void> getAllAppointment() async {
  final appointmentAdd = await Hive.openBox<AppointmentModel>('appointments');

  appointmentList.value.clear();
  appointmentList.value.addAll(appointmentAdd.values);
  appointmentList.notifyListeners();
}

Future<void> deleteAppointment(int index) async {
  final appointmentAdd = await Hive.openBox<AppointmentModel>('appointments');
  await appointmentAdd.deleteAt(index);
  getAllAppointment();
}

Future<void> editAppointment(int index, AppointmentModel value) async {
  final appointmentAdd = await Hive.openBox<AppointmentModel>('appointments');
  await appointmentAdd.putAt(index, value);
  getAllAppointment();
}
