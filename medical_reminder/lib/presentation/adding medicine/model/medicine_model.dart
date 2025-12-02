import 'package:hive/hive.dart';

part 'medicine_model.g.dart';

@HiveType(typeId: 1)
class MedicineModel {
  @HiveField(0)
  String name;

  @HiveField(1)
  String dosage;

  @HiveField(3)
  String startDate;

  @HiveField(4)
  String endDate;


  MedicineModel({
    required this.name,
    required this.dosage,
    required this.startDate,
    required this.endDate,
  });
}