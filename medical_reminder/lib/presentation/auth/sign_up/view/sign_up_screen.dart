import 'package:flutter/material.dart';
import 'package:medical_reminder/common/widget/common_button.dart';
import 'package:medical_reminder/common/widget/custom_text_field.dart';
import 'package:medical_reminder/core/constant/app_constant.dart';
import 'package:medical_reminder/core/route/app_route.dart';
import 'package:medical_reminder/core/theme/app_colors.dart';
import 'package:medical_reminder/presentation/auth/login/view/login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final signUpText = TextConstant.signUp;
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                signUpText['SignUpTitle'],
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                signUpText['SignUpText'],
                style: TextStyle(fontSize: 20, color: AppColors.txtColor),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      CustomTextField(
                        text: 'Username',
                        text1: 'Username',
                        controller: _usernameController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Username cannot be empty';
                          }
                        },
                      ),
                      CustomTextField(
                        text: 'Email',
                        text1: 'Email',
                        controller: _emailController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Email cannot be empty';
                          } else if (!value.contains('@gmail.com')) {
                            return 'invalid email';
                          }
                          return null;
                        },
                      ),
                      CustomTextField(
                        text: 'Password',
                        text1: 'Pasword',
                        controller: _passwordController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Password cannot be empty';
                          } else if (value.length < 6) {
                            return 'At least 6 characters';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 15),
                      CommonButton(
                        text: signUpText['SignUpBtnText'],
                        onTap: () {},
                        textColor: AppColors.white,
                        bgColor: AppColors.btnColor,
                      ),
                      SizedBox(height: 15),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    signUpText['SignUpTexts'],
                    style: TextStyle(color: AppColors.txtColor),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, AppRoute.login);
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(color: AppColors.btnColor),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
