import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:medical_reminder/presentation/adding%20view%20report/model/report_model.dart';

ValueNotifier<List<ReportModel>> reportList = ValueNotifier([]);

Future<void> addReport(ReportModel value) async {
  final reportMoedicine = await Hive.openBox<ReportModel>('reportMoedicine');
  await reportMoedicine.add(value);
  getAllReports();
}

Future<void> getAllReports() async {
  final reportMoedicine = await Hive.openBox<ReportModel>('reportMoedicine');
  reportList.value.clear();
  reportList.value.addAll(reportMoedicine.values);
  reportList.notifyListeners();
}

Future<void> deleteReport(int index) async {
  final reportMoedicine = await Hive.openBox<ReportModel>('reportMoedicine');
  await reportMoedicine.deleteAt(index);
  getAllReports();
}

Future<void> editReport(int index, ReportModel value) async {
  final reportMoedicine = await Hive.openBox<ReportModel>('reportMoedicine');
  await reportMoedicine.putAt(index, value);
  getAllReports();
}
