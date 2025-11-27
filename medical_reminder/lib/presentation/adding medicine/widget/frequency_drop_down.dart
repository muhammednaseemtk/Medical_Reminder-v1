import 'package:flutter/material.dart';
import 'package:medical_reminder/core/theme/app_colors.dart';

class FrequencyDropDown extends StatefulWidget {
  final Function(List<String>) onTimeChanged;

  const FrequencyDropDown({super.key, required this.onTimeChanged});

  @override
  State<FrequencyDropDown> createState() => _FrequencyDropDownState();
}

class _FrequencyDropDownState extends State<FrequencyDropDown> {
  String? selectedFrequency;
  List<TimeOfDay?> times = [];

  final List<String> frequencyOptions = [
    "1 time a day",
    "2 times a day",
    "3 times a day",
  ];

  void updateTimes(String frequency) {
    int count = int.parse(frequency[0]);
    times = List.generate(count, (_) => null);
    widget.onTimeChanged(times.map((t) => t?.format(context) ?? "").toList());
    setState(() {});
  }

  Future<void> pickTime(int index) async {
    TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      
    );

    if (picked != null) {
      times[index] = picked;
      widget.onTimeChanged(times.map((t) => t?.format(context) ?? "").toList());
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DropdownButtonFormField<String>(
          decoration: InputDecoration(
            hintText: "Select Frequency",
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: AppColors.lightShade),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          dropdownColor: AppColors.white,
          borderRadius: BorderRadius.circular(15),
          value: selectedFrequency,
          items: frequencyOptions
              .map(
                (f) => DropdownMenuItem(
                  value: f,
                  child: Text(f),
                ),
              )
              .toList(),
          onChanged: (value) {
            selectedFrequency = value;
            updateTimes(value!);
          },
        ),
        SizedBox(height: 20),
        if (times.isNotEmpty)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(times.length, (index) {
              return Padding(
                padding: const EdgeInsets.only(right: 10),
                child: GestureDetector(
                  onTap: () => pickTime(index),
                  child: Container(
                    width: 100,
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 14),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.lightShade),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          times[index]?.format(context) ?? "Time ${index + 1}",
                          style: TextStyle(fontSize: 14),
                        ),
                        Icon(Icons.access_time, size: 18),
                      ],
                    ),
                  ),
                ),
              );
            }),
          ),
      ],
    );
  }
}
