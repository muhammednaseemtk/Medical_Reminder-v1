import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:medical_reminder/presentation/view%20report/model/report_model.dart';
import 'package:medical_reminder/presentation/auth/function/auth_function.dart';

ValueNotifier<List<ReportModel>> reportList = ValueNotifier([]);

Future<Box<ReportModel>> _getReportBox() async {
  final boxName = '${UserFunctions.loggedInUserEmail}_reports';
  log(UserFunctions.loggedInUserEmail ?? 'no email');
  return await Hive.openBox<ReportModel>(boxName);
}

Future<void> addReport(ReportModel value) async {
  final reportBox = await _getReportBox();
  await reportBox.add(value);
  getAllReports();
}

Future<void> getAllReports() async {
  final reportBox = await _getReportBox();
  reportList.value.clear();
  reportList.value.addAll(reportBox.values);
  reportList.notifyListeners();
}

Future<void> deleteReport(int index) async {
  final reportBox = await _getReportBox();
  await reportBox.deleteAt(index);
  getAllReports();
}

Future<void> editReport(int index, ReportModel value) async {
  final reportBox = await _getReportBox();
  await reportBox.putAt(index, value);
  getAllReports();
}
