import 'package:flutter/material.dart';
import 'package:medical_reminder/core/route/app_route.dart';
import 'package:medical_reminder/core/theme/app_colors.dart';
import 'package:medical_reminder/presentation/add%20view%20report/function/reports_add.dart';

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
        backgroundColor: AppColors.icon,
        title: const Text(
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
                  Image.asset('asset/image/report.jpg', width: 280),
                  const Text('No Medical Report Found!'),
                  Text(
                    'Please add your first report to get started.',
                    style: TextStyle(color: AppColors.lightShade),
                  ),
                ],
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(10),
            itemCount: list.length,
            itemBuilder: (context, i) {
              final index = list.length - 1 - i;
              final report = list[index];
              return Card(
                color: AppColors.white,
                child: ListTile(
                  title: Text(report.name,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                  subtitle: Text("Date: ${report.date}\nDr: ${report.drName}"),

                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit, color: AppColors.icon),
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            AppRoute.editViewReport,
                            arguments: {
                              "report": report,
                              "index": index,
                            },
                          );
                        },
                      ),

                      IconButton(
                        icon: Icon(Icons.delete, color: AppColors.icon),
                        onPressed: () => deleteReport(index),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),

      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, AppRoute.addingViewReport);
          },
          backgroundColor: AppColors.icon,
          child: Icon(Icons.add, color: AppColors.white),
        ),
      ),
    );
  }
}
