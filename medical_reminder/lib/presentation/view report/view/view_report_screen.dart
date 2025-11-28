import 'package:flutter/material.dart';
import 'package:medical_reminder/core/route/app_route.dart';
import 'package:medical_reminder/core/theme/app_colors.dart';
import 'package:medical_reminder/presentation/adding%20view%20report/function/reports_add.dart';

class ViewReportScreen extends StatefulWidget {
  const ViewReportScreen({super.key});

  @override
  State<ViewReportScreen> createState() => _ViewReportScreenState();
}

class _ViewReportScreenState extends State<ViewReportScreen> {
  @override
  void initState() {
    super.initState();
    getAllReports();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        foregroundColor: AppColors.white,
        backgroundColor: AppColors.icon1,
        title: Text(
          'View Report',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),

      body: ValueListenableBuilder(
        valueListenable: reportList,
        builder: (context, list, value) {
          if (list.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('asset/image/report.jpeg', width: 280),
                  Text('No Medical Report Found!'),
                  Text(
                    'Please add your first report to get started.',
                    style: TextStyle(color: AppColors.lightShade),
                  ),
                ],
              ),
            );
          }

          return ListView.builder(
            padding: EdgeInsets.all(10),
            itemCount: list.length,
            itemBuilder: (context, index) {
              final report = list[index];
              return Card(
                color: AppColors.white,
                child: ListTile(
                  title: Text(report.name),
                  subtitle: Text("Date: ${report.date}\nDr: ${report.drName}"),
                  trailing: IconButton(
                    icon: Icon(Icons.delete, color: AppColors.icon1),
                    onPressed: () => deleteReport(index),
                  ),
                ),
              );
            },
          );
        },
      ),

      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 25),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, AppRoute.addingViewReport);
          },
          backgroundColor: AppColors.icon1,
          child: Icon(Icons.add, color: AppColors.white),
        ),
      ),
    );
  }
}
