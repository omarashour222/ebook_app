import 'package:ebook_app/constants.dart';
import 'package:ebook_app/features/helpers/hive_helper.dart';
import 'package:ebook_app/features/sign_up/cubit/sign_up_cubit.dart';
import 'package:ebook_app/features/sign_up/views/widgets/custom_sign_up_bottom.dart';
import 'package:ebook_app/features/sign_up/views/widgets/sign_up_email_text_field.dart';
import 'package:ebook_app/features/sign_up/views/widgets/sign_up_pass_text_field.dart';
import 'package:ebook_app/features/sign_up/views/widgets/sign_up_phone_form_field.dart';
import 'package:ebook_app/features/sign_up/views/widgets/sign_up_user_name_text_field.dart';
import 'package:ebook_app/features/signin_screen/cubit/sign_in_cubit.dart';
import 'package:ebook_app/features/signin_screen/views/signin_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignInCubit>();
    final height = MediaQuery.of(context).size.height;
    // final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(top: 70, right: 20, left: 20),
      child: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                imagePath + 'logo2.png',
                height: 120,
              ),
              SizedBox(
                height: height * 0.07,
              ),
              SignUpUserNameTextField(),
              SizedBox(
                height: height * 0.035,
              ),
              SignUpEmailTextField(),
              SizedBox(
                height: height * 0.035,
              ),
              SignUpPhoneFormField(),
              SizedBox(
                height: height * 0.035,
              ),
              SignUpPassTextField(),
              SizedBox(
                height: height * 0.05,
              ),
              CustomsignUpBottom(
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    context.read<SignUpCubit>().Register(
                        phone: cubit.phoneController.text,
                        name: cubit.userNameController.text,
                        email: cubit.emailController.text,
                        password: cubit.passwordController.text);
                    setState(() {
                      HiveHelper.setValueLoginBox();
                    });
                  }
                },
              ),
              SizedBox(
                height: height * 0.012,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account?',
                    style: TextStyle(
                        color: const Color.fromARGB(255, 96, 96, 96),
                        fontSize: 15),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                    ),
                    onPressed: () {
                      Get.to(SigninView());
                    },
                    child: Text(
                      '  Log in here',
                      style: TextStyle(
                          color: const Color.fromARGB(255, 82, 82, 82),
                          fontSize: 15),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
