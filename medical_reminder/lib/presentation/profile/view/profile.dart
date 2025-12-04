import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:medical_reminder/core/theme/app_colors.dart';
import 'package:medical_reminder/presentation/profile/widget/profile_menu_item.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File? image; 

  pickImage() async {
    final XFile? photo =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (photo == null) return;

    setState(() {
      image = File(photo.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title:  Text(
          'Profile',
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: 30),
          Center(
            child: Stack(
              children: [
                CircleAvatar(
                  radius: 55,
                  backgroundImage: image != null
                      ? FileImage(image!)
                      :  AssetImage('asset/image/profile.png')
                          as ImageProvider,
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: InkWell(
                    onTap: pickImage,
                    child: CircleAvatar(
                      radius: 18,
                      backgroundColor: AppColors.icon,
                      child:  Icon(
                        EneftyIcons.edit_2_outline,
                        size: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
           SizedBox(height: 15),
           Text(
            "Muhammed Naseem T K",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
           SizedBox(height: 5),
          Text(
            "naseem@gmail.com",
            style: TextStyle(
              fontSize: 14,
              color: AppColors.lightShade,
            ),
          ),
           SizedBox(height: 25),
          ProfileMenuItem(
            icon: EneftyIcons.edit_outline,
            title: 'Username change',
            onTap: () {},
          ),
          ProfileMenuItem(
            icon: Icons.privacy_tip_outlined,
            title: 'Privacy',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
