import 'package:hive/hive.dart';

part 'appointment_model.g.dart';

@HiveType(typeId: 3)
class AppointmentModel {
  @HiveField(0)
  String title;

  @HiveField(1)
  String date;

  @HiveField(2)
  String name;

  AppointmentModel({
    required this.title,
    required this.date,
    required this.name
  });
}