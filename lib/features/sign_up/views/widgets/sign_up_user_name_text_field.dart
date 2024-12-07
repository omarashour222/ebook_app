import 'package:ebook_app/constants.dart';
import 'package:ebook_app/features/signin_screen/cubit/sign_in_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpUserNameTextField extends StatelessWidget {
  const SignUpUserNameTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final cubit = context.read<SignInCubit>();

    return TextFormField(
        controller: cubit.userNameController,
        validator: (val) {
          if (val!.length < 3) {
            return 'Name should be at least 3 charachters';
          }
          return null;
        },
        decoration: InputDecoration(
            hintText: ' Username',
            hintStyle: const TextStyle(
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
              onTap: () {
                cubit.clearText();
              },
              child: const Icon(
                Icons.cancel,
                color: Color.fromARGB(255, 149, 149, 149),
              ),
            )),
        onTapOutside: (event) {
          FocusScope.of(context).unfocus();
        });
  }
}
