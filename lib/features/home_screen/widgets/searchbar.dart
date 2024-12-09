import 'package:ebook_app/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget searchBar(double height, double width, BuildContext context) {
  return TextFormField(
      decoration: InputDecoration(
          hintText: '   Search here',
          hintStyle: const TextStyle(
              color: Color.fromARGB(255, 135, 135, 135), fontSize: 20),
          contentPadding: EdgeInsets.symmetric(
            vertical: height * 0.026,
            horizontal: width * 0.05,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: kPrimaryColor,
            ),
            borderRadius: BorderRadius.circular(14),
          ),
          suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Icon(
              CupertinoIcons.search,
              size: 30,
            ),
          )),
      onTapOutside: (event) {
        FocusScope.of(context).unfocus();
      });
}
