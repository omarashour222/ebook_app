import 'package:ebook_app/constants.dart';
import 'package:ebook_app/features/home_screen/views/home_view.dart';
import 'package:ebook_app/features/profile_screen/views/profile_view.dart';
import 'package:ebook_app/features/saved_view/views/saved_view.dart';
import 'package:ebook_app/features/settings_screen/views/setting_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainViewController extends GetxController {
  var selectedIndex = 0.obs;

  void updateIndex(int index) {
    selectedIndex.value = index;
  }
}

class MainView extends StatelessWidget {
  MainView({Key? key}) : super(key: key);

  final MainViewController controller = Get.put(MainViewController());

  final List<Widget> screens = [
    const HomeView(),
    const SavedView(),
    const SettingView(),
    const ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(() => SizedBox(
            height: 90,
            child: BottomNavigationBar(
              selectedItemColor: kPrimaryColor,
              unselectedItemColor: const Color(0xFF92929D),
              showSelectedLabels: true,
              showUnselectedLabels: true,
              currentIndex: controller.selectedIndex.value,
              type: BottomNavigationBarType.fixed,
              onTap: (index) {
                controller.updateIndex(index);
              },
              selectedIconTheme: const IconThemeData(size: 28),
              unselectedIconTheme: const IconThemeData(size: 28),
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.heart),
                  label: 'Saved',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings_outlined),
                  label: 'Settings',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline),
                  label: 'Profile',
                ),
              ],
            ),
          )),
      body: Obx(() => screens[controller.selectedIndex.value]),
    );
  }
}
