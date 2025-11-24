import 'package:flutter/material.dart';
import 'package:medical_reminder/core/route/app_route.dart';
import 'package:medical_reminder/core/theme/app_colors.dart';

class ViewReportScreen extends StatefulWidget {
  const ViewReportScreen({super.key});

  @override
  State<ViewReportScreen> createState() => _ViewReportScreenState();
}

class _ViewReportScreenState extends State<ViewReportScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        foregroundColor: AppColors.white,
        backgroundColor: AppColors.icon1,
        title: Text('View Report',style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Column(
            children: [
              Image.asset('asset/image/report.jpeg',width: 280,),
              Text('No Medical Report Found!'),
              Text('Please add your first report to get started.',style: TextStyle(color: AppColors.lightShade),)
            ],
          ))
        ],
      ),
     floatingActionButton:  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 25),
        child: FloatingActionButton(onPressed: (){
          Navigator.pushNamed(context, AppRoute.addingViewReport);
        },
        backgroundColor: AppColors.icon1,
        child: Icon(Icons.add,color: AppColors.white,),
        ),
      ),
    );
  }
}