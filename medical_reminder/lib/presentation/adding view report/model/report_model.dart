import 'package:hive/hive.dart';

part 'report_model.g.dart';

@HiveType(typeId: 2)
class ReportModel {
  @HiveField(0)
  String name;

  @HiveField(1)
  String date;

  @HiveField(2)
  String drName;

  ReportModel({
    required this.name,
    required this.date,
    required this.drName
  });
}