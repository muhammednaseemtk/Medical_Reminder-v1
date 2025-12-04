import 'package:hive/hive.dart';

part 'profile_model.g.dart';

@HiveType(typeId: 5)
class ProfileModel {
  @HiveField(0)
  String image;

  ProfileModel({
    required this.image
  });
}