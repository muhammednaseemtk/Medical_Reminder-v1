import 'package:hive/hive.dart';

part 'bmi_model.g.dart';

@HiveType(typeId:4)
class BmiModel {
  @HiveField(0)
  String height;

  @HiveField(1)
  String weight;

  BmiModel({
    required this.height,
    required this.weight
  });
}