import 'package:ebook_app/constants.dart';
import 'package:ebook_app/features/home_screen/views/home_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int selectIndex = 0;

  List<Widget> screens = [
    HomeView(),
    Center(
      child: Text('Saved'),
    ),
    Center(
      child: Text('Profile'),
    ),
    Center(
      child: Text('Setting'),
    ),
  ];
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
              selectIndex = index;
              setState(() {});
            },
            selectedIconTheme: IconThemeData(size: 28),
            unselectedIconTheme: IconThemeData(size: 28),
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.heart), label: 'Saved'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline), label: 'Profile'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings_outlined), label: 'Settings')
            ]),
      ),
      body: screens[selectIndex],
    );
  }
}
