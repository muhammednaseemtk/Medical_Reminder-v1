import 'package:hive/hive.dart';
import 'package:medical_reminder/presentation/adding%20medicine/model/medicine_model.dart';

class MedicineAdd{
  final Box<MedicineModel> medicineBox =
  Hive.box<MedicineModel> ('medicines');

  Future<void> addMed(MedicineModel medicine) async {
    await medicineBox.add(medicine);
  }

  List<MedicineModel> getAllMed() {
    return medicineBox.values.toList();
  }

  Future<void> deleteMed(int index) async {
    await medicineBox.deleteAt(index);
  }

  Future<void> updateMed(int index,MedicineModel medicine) async {
    await medicineBox.putAt(index, medicine);
  }
}