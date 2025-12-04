import 'package:flutter/material.dart';
import 'package:medical_reminder/core/theme/app_colors.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
                Container(
                  width: 110,
                  height: 110,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image:  DecorationImage(
                      image: AssetImage('asset/image/profile.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 4,
                  right: 4,
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration:  BoxDecoration(
                      color: AppColors.icon,
                      shape: BoxShape.circle,
                    ),
                    child:  Icon(
                      Icons.edit,
                      size: 18,
                      color: AppColors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
           SizedBox(height: 15),
           Text(
            "John Doe",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
           SizedBox(height: 5),
          Text(
            "john.doe@example.com",
            style: TextStyle(
              fontSize: 14,
              color: AppColors.lightShade,
            ),
          ),
           SizedBox(height: 25),
        ],
      ),
    );
  }
}
