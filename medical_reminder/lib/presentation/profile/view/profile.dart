import 'dart:io';
import 'dart:developer'; // 👈 ADDED LOG
import 'package:flutter/material.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:medical_reminder/common/widget/common_button.dart';
import 'package:medical_reminder/presentation/profile/widget/edit_name.dart';
import 'package:medical_reminder/presentation/profile/model/profile_model.dart';
import 'package:medical_reminder/presentation/profile/function/profile_function.dart';
import 'package:medical_reminder/core/theme/app_colors.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File? _imageFile;

  @override
  void initState() {
    super.initState();
    log("INIT: Loading profile...");
    loadProfile();
  }

  Future<void> _pickImage() async {
    try {
      final picker = ImagePicker();
      log("IMAGE: Opening gallery...");
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);

      if (image == null) {
        log("IMAGE: No image selected.");
        return;
      }

      log("IMAGE PICKED: ${image.path}");

      final directory = await getApplicationDocumentsDirectory();
      final newPath = '${directory.path}/${image.name}';

      log("COPYING IMAGE TO: $newPath");

      final File newImage = await File(image.path).copy(newPath);

      setState(() => _imageFile = newImage);

      log("IMAGE SAVED SUCCESSFULLY");
    } catch (e) {
      log("IMAGE PICK ERROR: $e");
    }
  }

  void _editName(String currentName) {
    log("EDIT NAME CLICKED: currentName = $currentName");

    showDialog(
      context: context,
      builder: (context) => EditNameDialog(
        currentName: currentName,
        onSave: (newName) {
          log("NEW NAME SAVED: $newName");

          final profile = currentProfile.value;
          if (profile == null) {
            log("ERROR: Profile is null when saving name");
            return;
          }

          final updated = ProfileModel(
            username: newName,
            email: profile.email,
            imagePath: profile.imagePath,
          );

          saveProfile(updated);
        },
      ),
    );
  }

  Future<void> _saveProfile() async {
    final profile = currentProfile.value;

    if (profile == null) {
      log("SAVE PROFILE FAILED: profile null");
      return;
    }

    log("SAVING PROFILE...");
    log("NEW IMAGE PATH: ${_imageFile?.path}");

    final updatedProfile = ProfileModel(
      username: profile.username,
      email: profile.email,
      imagePath: _imageFile?.path ?? profile.imagePath,
    );

    await saveProfile(updatedProfile);

    log("PROFILE SAVED SUCCESSFULLY!");

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Profile Updated Successfully")),
    );
  }

  @override
  Widget build(BuildContext context) {
    log("BUILDING PROFILE SCREEN");

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        centerTitle: true,
        title: Text("Profile", style: TextStyle(fontWeight: FontWeight.w600)),
      ),

      body: ValueListenableBuilder(
        valueListenable: currentProfile,
        builder: (context, profile, _) {
          if (profile == null) {
            log("PROFILE NULL → SHOW LOADER");
            return Center(child: CircularProgressIndicator());
          }

          log("PROFILE LOADED: ${profile.username}, ${profile.email}"); 

          final username = profile.username;
          final email = profile.email;
          final imagePath = _imageFile?.path ?? profile.imagePath;

          log("CURRENT IMAGE PATH: $imagePath");

          return Column(
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
                        color: AppColors.bgBtnColor,
                      ),
                      child: imagePath != null
                          ? ClipOval(
                              child: Image.file(
                                File(imagePath),
                                width: 110,
                                height: 110,
                                fit: BoxFit.cover,
                              ),
                            )
                          : Icon(EneftyIcons.profile_outline,
                              size: 50, color: AppColors.icon),
                    ),
                    Positioned(
                      bottom: 4,
                      right: 4,
                      child: GestureDetector(
                        onTap: _pickImage,
                        child: Container(
                          padding: EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: AppColors.icon,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(EneftyIcons.edit_2_outline,
                              size: 18, color: AppColors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              Text(
                username,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 5),
              Text(
                email,
                style: TextStyle(fontSize: 14, color: AppColors.lightShade),
              ),
              SizedBox(height: 25),
              ListTile(
                leading: Icon(EneftyIcons.edit_outline),
                title: Text("Change Username"),
                onTap: () => _editName(username),
              ),
              ListTile(
                leading: Icon(Icons.privacy_tip_outlined),
                title: Text("Privacy"),
                onTap: () {},
              ),
              SizedBox(height: 50),
              CommonButton(
                text: "Save",
                onTap: _saveProfile,
                textColor: AppColors.white,
                bgColor: AppColors.icon,
              ),
            ],
          );
        },
      ),
    );
  }
}
