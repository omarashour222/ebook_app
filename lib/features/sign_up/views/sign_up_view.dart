import 'package:ebook_app/features/sign_up/cubit/sign_up_cubit.dart';
import 'package:ebook_app/features/sign_up/views/widgets/sign_up_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is RegisterErrorState) {
          Get.snackbar(
            "Error",
            state.msg,
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
        } else if (state is RegisterSuccessState) {
          Get.snackbar(
            "Success",
            state.msge,
            backgroundColor: Colors.green,
            colorText: Colors.white,
          );
        }
        // TODO: implement listener
      },
      child: Scaffold(
        body: SignUpViewBody(),
      ),
    );
  }
}
