import 'package:ebook_app/constants.dart';
import 'package:flutter/material.dart';

Padding signInButton(double height) {
  return Padding(
    padding: EdgeInsets.only(top: height * 0.070),
    child: Container(
      width: double.infinity,
      height: height * 0.070,
      decoration: BoxDecoration(
          color: kPrimaryColor, borderRadius: BorderRadius.circular(12)),
      child: Center(
          child: Text(
        'Sign In',
        style: TextStyle(color: Colors.white, fontSize: 20),
      )),
    ),
  );
}
