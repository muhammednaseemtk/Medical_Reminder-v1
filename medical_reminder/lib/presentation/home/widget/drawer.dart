import 'dart:io';

import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:medical_reminder/core/route/app_route.dart';
import 'package:medical_reminder/core/theme/app_colors.dart';
import 'package:medical_reminder/presentation/profile/function/profile_function.dart';
import 'package:medical_reminder/presentation/setting/widget/logout_dailog.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({super.key});

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.white,
      child: Column(
        children: [
          ValueListenableBuilder(
            valueListenable: currentProfile,
            builder: (context, value, child) {
              final hasImage = value?.imagePath != null &&
                  value!.imagePath!.isNotEmpty;

              return UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: AppColors.icon),
                accountName: Text(value?.username ?? ''),
                accountEmail: Text(value?.email ?? ''),
                currentAccountPicture: hasImage
                    ? CircleAvatar(
                        backgroundImage: FileImage(
                          File(value!.imagePath!),
                        ),
                      )
                    : CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(
                          EneftyIcons.profile_circle_outline,
                          size: 42,
                          color: AppColors.icon,
                        ),
                      ),
              );
            },
          ),

          ListTile(
            leading: Icon(EneftyIcons.profile_circle_outline, color: AppColors.icon),
            title: const Text('Profile'),
            onTap: () {
              Navigator.pushNamed(context, AppRoute.profile);
            },
          ),

          ListTile(
            leading: Icon(Icons.info_outline, color: AppColors.icon),
            title: const Text('About'),
            onTap: () {},
          ),

          ListTile(
            leading: Icon(Icons.policy_outlined, color: AppColors.icon),
            title: const Text('Privacy Policy'),
            onTap: () {},
          ),

          ListTile(
            leading: Icon(EneftyIcons.logout_outline, color: AppColors.icon),
            title: const Text("Logout"),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => const LogoutDialog(),
              );
            },
          ),
        ],
      ),
    );
  }
}
