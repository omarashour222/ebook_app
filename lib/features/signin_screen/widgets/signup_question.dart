import 'package:ebook_app/features/sign_up/views/sign_up_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget signUpQuestion() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        'Dont\'t have and account yet?',
        style: TextStyle(
            color: const Color.fromARGB(255, 96, 96, 96), fontSize: 15),
      ),
      TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
        ),
        onPressed: () {
          Get.to(() => const SignUpView());
        },
        child: Text(
          '  Sign up here',
          style: TextStyle(
              color: const Color.fromARGB(255, 82, 82, 82), fontSize: 15),
        ),
      )
    ],
  );
}
