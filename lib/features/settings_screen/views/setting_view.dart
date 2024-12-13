import 'package:ebook_app/features/settings_screen/widgets/app_theme.dart';
import 'package:ebook_app/features/settings_screen/widgets/notifications.dart';
import 'package:ebook_app/features/settings_screen/widgets/profile.dart';
import 'package:ebook_app/theme_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingView extends StatefulWidget {
  const SettingView({
    super.key,
  });

  @override
  State<SettingView> createState() => _SettingViewState();
}

class _SettingViewState extends State<SettingView> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 22, right: 15, top: 55),
        child: SingleChildScrollView(
          child: Column(
            children: [
              appTheme(themeProvider),
              SizedBox(
                height: 12,
              ),
              options(
                  text: 'Profile',
                  opt1: 'Edit Profile',
                  opt2: 'Change Password',
                  icn1: CupertinoIcons.person_crop_circle_badge_exclam,
                  icn2: Icons.key),
              SizedBox(
                height: 20,
              ),
              Notifications(),
              SizedBox(
                height: 12,
              ),
              options(
                  text: 'Regional',
                  opt1: 'Language',
                  opt2: 'Logout',
                  icn1: Icons.language,
                  icn2: Icons.logout),
              SizedBox(
                height: 20,
              ),
              options(
                  text: 'Help & Support',
                  opt1: 'Reach Us',
                  opt2: 'About',
                  icn1: Icons.question_answer,
                  icn2: Icons.question_mark),
              SizedBox(
                height: 20,
              ),
              options(
                  text: 'Terms',
                  opt1: 'Terms and Conditions',
                  opt2: 'Privacy Policy',
                  icn1: Icons.subject_rounded,
                  icn2: Icons.privacy_tip_outlined)
            ],
          ),
        ),
      ),
    );
  }
}
