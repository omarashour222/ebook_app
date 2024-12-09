import 'package:ebook_app/constants.dart';
import 'package:ebook_app/features/main_views/views/bottom_nav.dart';
import 'package:ebook_app/features/profile_screen/views/profile_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget semiAppBar() {
  return Row(
    children: [
      Icon(
        Icons.menu,
        size: 33,
      ),
      Spacer(),
      Icon(
        CupertinoIcons.bell,
        size: 33,
      ),
      SizedBox(
        width: 10,
      ),
      GestureDetector(
        onTap: () {
          final mainViewState = MainView.mainViewKey.currentState;
          if (mainViewState != null) {
            mainViewState.updateIndex(2);
          } else {
            // Navigate to MainView with index 2 if GlobalKey fails
            Get.offAll(() => const MainView(initialIndex: 2));
          }
        },
        child: CircleAvatar(
          backgroundImage:
              AssetImage(imagePath + 'profile pic placeholder.webp'),
          radius: 18,
        ),
      )
    ],
  );
}
