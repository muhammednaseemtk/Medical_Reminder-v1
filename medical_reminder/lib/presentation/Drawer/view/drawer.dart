import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:medical_reminder/core/theme/app_colors.dart';

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
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: AppColors.icon
            ),
            accountName: Text("Muhammed Naseem"),
            accountEmail: Text("naseem@gmail.com"),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('asset/image/profile.png'),
            ),
          ),
          ListTile(
            leading: Icon(EneftyIcons.profile_circle_outline,color: AppColors.icon,),
            title: Text('Profile'),
            onTap: (){},
          ),
          ListTile(
            leading: Icon(Icons.info_outline,color: AppColors.icon,),
            title: Text('About'),
            onTap: (){},
          ),
          ListTile(
            leading: Icon(Icons.policy_outlined,color: AppColors.icon,),
            title: Text('Privacy Policy'),
            onTap: (){},
          ),
          ListTile(
            leading: Icon(EneftyIcons.logout_outline,color: AppColors.icon,),
            title: Text("Logout"),
            onTap: () {},
          )
        ],
      ),
    );
  }
}
