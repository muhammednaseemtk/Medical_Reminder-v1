import 'package:hive_flutter/adapters.dart';
import 'package:medical_reminder/presentation/auth/model/user_model.dart';

class UserFunctions {
  final Box<UserModel> userBox = Hive.box<UserModel>('users');
  Future<bool> addUser(UserModel user) async {
    await userBox.put(user.email, user);
    return true;
  }

  Future<bool> loginUser(String email, String password)async{
    if (!userBox.containsKey(email)) {
      return false;
    }
    final user = userBox.get(email);
     await Hive.openBox(email);
    return user!.password == password;
  }
  UserModel? getUser(String email){
    return userBox.get(email);
  }
}
