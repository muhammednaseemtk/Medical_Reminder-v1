import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:medical_reminder/presentation/auth/function/auth_function.dart';
import 'package:medical_reminder/presentation/auth/sign_up/view/sign_up_screen.dart';
import 'package:medical_reminder/presentation/home/widget/main_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    goLogin();
  }
  final userFunctions = UserFunctions();
  Future<void> goLogin() async {
    await Future.delayed(Duration(seconds: 3));
    final bool check = await userFunctions.checkUserLogined();
    log(check.toString());
    if(check){
      Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => MainPage()),
    );
    }else{
      Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => SignUpScreen()),
    );
    }
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Image.asset('asset/image/1.png')],
          ),
        ),
      );
  }
}
