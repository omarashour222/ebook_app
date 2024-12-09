import 'package:ebook_app/constants.dart';
import 'package:ebook_app/features/home_screen/views/home_view.dart';
import 'package:ebook_app/features/profile_screen/views/profile_view.dart';
import 'package:ebook_app/features/settings_screen/views/setting_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainView extends StatefulWidget {
  static final GlobalKey<_MainViewState> mainViewKey =
      GlobalKey<_MainViewState>();
  final int initialIndex;
  const MainView({super.key, this.initialIndex = 0});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  late int selectIndex;

  @override
  void initState() {
    super.initState();
    selectIndex = widget.initialIndex;
  }

  List<Widget> screens = [
    const HomeView(),
    const SettingView(),
    const ProfileView(),
  ];

  void updateIndex(int index) {
    setState(() {
      selectIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 90,
        child: BottomNavigationBar(
            selectedItemColor: kPrimaryColor,
            unselectedItemColor: Color(0xFF92929D),
            showSelectedLabels: true,
            showUnselectedLabels: true,
            currentIndex: selectIndex,
            type: BottomNavigationBarType.fixed,
            onTap: (index) {
              updateIndex(index);
            },
            selectedIconTheme: IconThemeData(size: 28),
            unselectedIconTheme: IconThemeData(size: 28),
            backgroundColor: Colors.white,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings_outlined), label: 'Settings'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline), label: 'Profile'),
            ]),
      ),
      body: screens[selectIndex],
    );
  }
}
