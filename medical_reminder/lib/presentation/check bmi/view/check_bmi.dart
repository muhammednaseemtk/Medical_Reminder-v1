import 'package:flutter/material.dart';
import 'package:medical_reminder/core/route/app_route.dart';
import 'package:medical_reminder/core/theme/app_colors.dart';
import 'package:medical_reminder/presentation/add bmi/function/bmi_add.dart';
import 'package:medical_reminder/presentation/add bmi/model/bmi_model.dart';

class CheckBmiScreen extends StatefulWidget {
  const CheckBmiScreen({super.key});

  @override
  State<CheckBmiScreen> createState() => _CheckBmiScreenState();
}

class _CheckBmiScreenState extends State<CheckBmiScreen> {
  @override
  void initState() {
    super.initState();
    getAllBmi(); // Load all BMI on opening screen
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        foregroundColor: AppColors.white,
        backgroundColor: AppColors.icon,
        title: const Text(
          'Check BMI',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),

      // -----------------------------------------------------
      // BMI LIST VIEW WITH CARD DESIGN
      // -----------------------------------------------------
      body: ValueListenableBuilder<List<BmiModel>>(
        valueListenable: bmiList,
        builder: (context, list, _) {
          if (list.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('asset/image/bmi.jpg', width: 280),
                  const SizedBox(height: 10),
                  Text(
                    'No BMI data found',
                    style: TextStyle(color: AppColors.lightShade),
                  )
                ],
              ),
            );
          }

          return ListView.separated(
            padding: const EdgeInsets.all(15),
            itemBuilder: (context, index) {
              final bmi = list[index];

              return Card(
                color: AppColors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Height: ${bmi.height} cm",
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            "Weight: ${bmi.weight} kg",
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit, color: Colors.green),
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                AppRoute.editBmi,
                                arguments: {
                                  "index": index,
                                  "model": bmi,
                                },
                              );
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete, color: AppColors.icon),
                            onPressed: () {
                              deleteBmi(index);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (_, __) => const SizedBox(height: 10),
            itemCount: list.length,
          );
        },
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, AppRoute.addingBmi);
          },
          backgroundColor: AppColors.icon,
          child: Icon(Icons.add, color: AppColors.white),
        ),
      ),
    );
  }
}
