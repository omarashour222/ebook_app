import 'package:ebook_app/constants.dart';
import 'package:flutter/material.dart';

Widget actualItems() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(
        height: 280,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(23),
          child: Image.asset(
            imagePath + 'book placeholder.png',
            fit: BoxFit.fill,
          ),
        ),
      ),
      SizedBox(height: 8),
      Padding(
        padding: const EdgeInsets.only(left: 8),
        child: Text(
          'Book name will be here',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              overflow: TextOverflow.ellipsis),
        ),
      ),
    ],
  );
}
