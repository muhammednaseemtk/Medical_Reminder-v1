import 'package:flutter/material.dart';
import 'package:medical_reminder/core/route/app_route.dart';
import 'package:medical_reminder/core/theme/app_colors.dart';

class CheckBmiScreen extends StatefulWidget {
  const CheckBmiScreen({super.key});

  @override
  State<CheckBmiScreen> createState() => _CheckBmiScreenState();
}

class _CheckBmiScreenState extends State<CheckBmiScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        foregroundColor: AppColors.white,
        backgroundColor: AppColors.icon,
        title: Text('Check BMI',style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('asset/image/bmi.jpg',width: 280,),
            SizedBox(height: 10,),
            Text('No BMI data found',style: TextStyle(color: AppColors.lightShade),)
          ],
        ),
      ),
      floatingActionButton:  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 25),
        child: FloatingActionButton(onPressed: (){
          Navigator.pushNamed(context, AppRoute.addingBmi);
        },
        backgroundColor: AppColors.icon,
        child: Icon(Icons.add,color: AppColors.white,),
        ),
      ),
    );
  }
}