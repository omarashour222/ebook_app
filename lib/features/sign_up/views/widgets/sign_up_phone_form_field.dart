import 'package:ebook_app/constants.dart';
import 'package:ebook_app/features/signin_screen/cubit/sign_in_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpPhoneFormField extends StatelessWidget {
  const SignUpPhoneFormField({super.key});
  bool isPhone(String input) =>
      RegExp(r'^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$')
          .hasMatch(input);
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final cubit = context.read<SignInCubit>();
    return TextFormField(
        controller: cubit.phoneController,
        validator: (val) {
          if (!isPhone(val!)) {
            return 'Please enter a valid phone number.';
          }
          return null;
        },
        decoration: InputDecoration(
            hintText: ' phone number',
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
                cubit.clearPhoneNumber();
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
