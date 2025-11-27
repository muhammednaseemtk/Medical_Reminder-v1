import 'dart:io';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medical_reminder/core/theme/app_colors.dart';

class UploadReport extends StatelessWidget {
  final VoidCallback onTap;

  const UploadReport({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: AppColors.shadow,
            width: 1,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(EneftyIcons.document_upload_outline, size: 40, color: AppColors.icon1,),

            SizedBox(height: 10),

             Text(
              "Upload Report File",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),

             SizedBox(height: 8),

            Text(
              "Tap to upload report file (PDF, JPG, PNG)",
              style: TextStyle(fontSize: 14, color: AppColors.shadow),
            ),

           SizedBox(height: 20),

            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
              decoration: BoxDecoration(
                color: AppColors.icon1,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                "Upload",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
