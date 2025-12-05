import 'package:hive/hive.dart';

part 'profile_model.g.dart';

@HiveType(typeId: 5)
class ProfileModel {
  @HiveField(0)
  String username;

  @HiveField(1)
  String email;

  @HiveField(2)
  String? imagePath;

  ProfileModel({
    required this.username,
    required this.email,
    this.imagePath,
  });
}
