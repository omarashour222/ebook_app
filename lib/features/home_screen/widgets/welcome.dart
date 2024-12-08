import 'package:ebook_app/constants.dart';
import 'package:ebook_app/features/signin_screen/cubit/sign_in_cubit.dart';
import 'package:flutter/material.dart';

Widget welcome(SignInCubit signInCubit) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(
        height: 11,
      ),
      Text(
        'Hello, ${signInCubit.model.data?.name ?? 'N/A'}',
        style: TextStyle(
            color: kPrimaryColor, fontWeight: FontWeight.bold, fontSize: 27),
      ),
      SizedBox(
        height: 4,
      ),
      Text(
        'What do you want to read today?',
        style: TextStyle(fontSize: 17),
      ),
    ],
  );
}
