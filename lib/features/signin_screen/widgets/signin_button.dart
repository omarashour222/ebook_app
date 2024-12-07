import 'package:ebook_app/constants.dart';
import 'package:ebook_app/features/signin_screen/cubit/sign_in_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget signInButton(double height, BuildContext context, String email,
    String password, GlobalKey<FormState> key) {
  final cubit = context.read<SignInCubit>();
  return Padding(
    padding: EdgeInsets.only(top: height * 0.070),
    child: GestureDetector(
      onTap: () {
        if (key.currentState!.validate()) {
          cubit.logIn(email: email, password: password);
        }
      },
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
    ),
  );
}
