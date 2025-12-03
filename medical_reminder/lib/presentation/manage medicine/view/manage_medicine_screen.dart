import 'package:flutter/material.dart';
import 'package:medical_reminder/core/route/app_route.dart';
import 'package:medical_reminder/core/theme/app_colors.dart';
import 'package:medical_reminder/presentation/manage%20medicine/function/medicone_add.dart';
import 'package:medical_reminder/presentation/manage%20medicine/model/medicine_model.dart';

class ManageMedicineScreen extends StatefulWidget {
  const ManageMedicineScreen({super.key});

  @override
  State<ManageMedicineScreen> createState() => _ManageMedicineScreenState();
}

class _ManageMedicineScreenState extends State<ManageMedicineScreen> {
  @override
  void initState() {
    super.initState();
    getAllMedicines(); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        foregroundColor: AppColors.white,
        backgroundColor: AppColors.icon,
        title: const Text(
          'Manage Medicine',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),

      body: ValueListenableBuilder<List<MedicineModel>>(
        valueListenable: medicineList,
        builder: (context, list, _) {
          if (list.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('asset/image/medicine.jpg', width: 280),
                  const SizedBox(height: 10),
                  const Text(
                    'No Medicine Reminder Found!',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Please add your first medicine reminder.',
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
              final item = list[index];
              return Card(
                color: AppColors.white,
                margin: const EdgeInsets.only(bottom: 12),
                child: ListTile(
                  title: Text(
                    item.name,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  subtitle: Text(
                    "Dosage: ${item.dosage}\n"
                    "Start: ${item.startDate}\nEnd: ${item.endDate}",
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit, color: AppColors.icon),
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            AppRoute.editMedicine,
                            arguments: {
                              "index": index,
                              "medicines": item,
                            },
                          );
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.delete, color: AppColors.icon),
                        onPressed: () => deleteMedicine(index),
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
            Navigator.pushNamed(context, AppRoute.addingMedicine);
          },
          backgroundColor: AppColors.icon,
          child: const Icon(Icons.add, color: AppColors.white),
        ),
      ),
    );
  }
}
