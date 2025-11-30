import 'package:hive/hive.dart';

part 'user_model.g.dart';

@HiveType(typeId: 0)
class UserModel {
  @HiveField(0)
  String username;

  @HiveField(1)
  String email;

  @HiveField(2)
  String password;

  @HiveField(3)
  String phoneNumber;

  UserModel({
    required this.username,
    required this.email,
    required this.password,
    required this.phoneNumber
  });
}