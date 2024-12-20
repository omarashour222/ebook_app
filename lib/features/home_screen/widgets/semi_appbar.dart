import 'package:ebook_app/constants.dart';
import 'package:ebook_app/features/main_views/views/bottom_nav.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget semiAppBar(BuildContext context) {
  final MainViewController controller = Get.find<MainViewController>();
  return Row(
    children: [
      Builder(builder: (context) {
        return GestureDetector(
          onTap: () {
            Scaffold.of(context).openDrawer();
          },
          child: Icon(
            Icons.menu,
            size: 33,
          ),
        );
      }),
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
          controller.updateIndex(3);
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
