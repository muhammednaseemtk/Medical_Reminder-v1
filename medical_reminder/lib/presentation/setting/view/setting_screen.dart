import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:medical_reminder/common/widget/common_button.dart';
import 'package:medical_reminder/core/route/app_route.dart';
import 'package:medical_reminder/core/theme/app_colors.dart';
import 'package:medical_reminder/presentation/setting/widget/logout_dailog.dart';
import 'package:medical_reminder/presentation/setting/widget/settings_items.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: Text(
          'Settings',
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 25),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Container(color: AppColors.shadow, height: 1),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 11),
                child: Text(
                  'NOTIFICATIONS',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),
              SettingsItems(
                icon: EneftyIcons.notification_bing_outline,
                title: 'Reminder Times',
                onTap: () {},
              ),
              SettingsItems(
                icon: EneftyIcons.musicnote_outline,
                title: 'Sound',
                onTap: () {},
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 11),
                child: Text(
                  'APP PREFERENCES',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),
              SettingsItems(
                icon: Icons.contrast_outlined,
                title: 'Theme',
                onTap: () {},
              ),
              SettingsItems(
                icon: Icons.language_outlined,
                title: 'Language',
                onTap: () {},
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 11),
                child: Text(
                  'HELP & SUPPORT',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),
              SettingsItems(
                icon: Icons.help_outline_outlined,
                title: 'FAQ',
                onTap: () {},
              ),
              SettingsItems(
                icon: Icons.support_agent_outlined,
                title: 'Contact Support',
                onTap: () {},
              ),
              SettingsItems(
                icon: Icons.bug_report_outlined,
                title: 'Report a Bug',
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
