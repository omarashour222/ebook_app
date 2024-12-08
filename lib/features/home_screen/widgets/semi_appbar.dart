import 'package:ebook_app/constants.dart';
import 'package:flutter/material.dart';

Widget semiAppBar() {
  return Row(
    children: [
      Icon(
        Icons.menu,
        size: 33,
      ),
      Spacer(),
      Icon(
        Icons.notifications,
        size: 33,
      ),
      SizedBox(
        width: 10,
      ),
      CircleAvatar(
        backgroundImage: AssetImage(imagePath + 'profile pic placeholder.webp'),
        radius: 18,
      )
    ],
  );
}
