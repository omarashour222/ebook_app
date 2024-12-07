import 'package:ebook_app/constants.dart';
import 'package:ebook_app/features/signin_screen/cubit/sign_in_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget passWordTextFormField(
    double height, double width, BuildContext context) {
  final cubit = context.read<SignInCubit>();
  return BlocBuilder<SignInCubit, SignInState>(
    builder: (context, state) {
      return TextFormField(
          controller: cubit.passwordController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'This field cannot be empty';
            }
            return null;
          },
          decoration: InputDecoration(
              hintText: ' Password',
              hintStyle: TextStyle(
                color: Color.fromARGB(255, 149, 149, 149),
              ),
              contentPadding: EdgeInsets.symmetric(
                vertical: height * 0.024,
                horizontal: width * 0.05,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: kPrimaryColor,
                ),
                borderRadius: BorderRadius.circular(5),
              ),
              suffixIcon: GestureDetector(
                onTap: cubit.showingPass,
                child: Icon(cubit.istextObsecured
                    ? CupertinoIcons.eye_slash
                    : Icons.remove_red_eye_rounded),
              )),
          obscureText: cubit.istextObsecured,
          onTapOutside: (event) {
            FocusScope.of(context).unfocus();
          });
    },
  );
}
