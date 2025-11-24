import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:medical_reminder/common/widget/common_button.dart';
import 'package:medical_reminder/core/constant/app_constant.dart';
import 'package:medical_reminder/core/route/app_route.dart';
import 'package:medical_reminder/core/theme/app_colors.dart';
import 'package:medical_reminder/common/widget/custom_text_field.dart';
import 'package:medical_reminder/presentation/auth/sign_up/view/sign_up_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final textData = TextConstant.login;
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
              Container(
                decoration: BoxDecoration(
                  color: AppColors.icon,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.shadow,
                      blurRadius: 4,
                      spreadRadius: 1,
                      offset: Offset(2, 3),
                    ),
                  ],
                ),
                padding: EdgeInsets.all(8),
                child: Icon(
                  EneftyIcons.hospital_outline,
                  size: 50,
                  color: AppColors.white,
                ),
              ),
              SizedBox(height: 15),
              Text(
                textData['LoginTitle'],
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                textData['LoginText'],
                style: TextStyle(color: Colors.black87, fontSize: 20),
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      CustomTextField(
                        text: 'Email',
                        text1: 'Email',
                        controller: _emailController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Email cannot be empty";
                          } else if (!value.contains('@gmail.com')) {
                            return "invalid email";
                          }
                          return null;
                        },
                      ),
                      CustomTextField(
                        text: 'Password',
                        text1: 'Password',
                        controller: _passwordController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Password cannot be empty";
                          } else if (value.length < 6) {
                            return "At least 6 characters";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10),
                      CommonButton(
                        text: textData['LoginBtnText'],
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            Navigator.pushReplacementNamed(
                              context,
                              AppRoute.mainPage,
                            );
                          }
                        },
                        textColor: AppColors.white,
                        bgColor: AppColors.btnColor,
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(textData['LoginTexts']),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, AppRoute.signUp);
                    },
                    child: Text(
                      'Sign Up',
                      style: TextStyle(color: AppColors.textColor),
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
