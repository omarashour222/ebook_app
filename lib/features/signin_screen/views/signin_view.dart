import 'package:ebook_app/constants.dart';
import 'package:ebook_app/features/signin_screen/cubit/sign_in_cubit.dart';
import 'package:ebook_app/features/signin_screen/widgets/password_text.dart';
import 'package:ebook_app/features/signin_screen/widgets/signin_button.dart';
import 'package:ebook_app/features/signin_screen/widgets/username_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SigninView extends StatelessWidget {
  const SigninView({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final cubit = context.read<SignInCubit>();
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.08),
        child: Form(
          key: formKey,
          child: BlocBuilder<SignInCubit, SignInState>(
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: height * 0.055),
                    child: SizedBox(
                        width: double.infinity,
                        child: Image.asset(imagePath + 'logo2.png')),
                  ),
                  userNameTextFormField(height, width, context),
                  SizedBox(
                    height: height * 0.032,
                  ),
                  passWordTextFormField(height, width, context),
                  signInButton(height, context, cubit.userNameController.text,
                      cubit.passwordController.text, formKey),
                  SizedBox(
                    height: height * 0.023,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Dont\'t have and account yet?',
                        style: TextStyle(
                            color: const Color.fromARGB(255, 96, 96, 96),
                            fontSize: 15),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                        ),
                        onPressed: () {},
                        child: Text(
                          '  Sign up here',
                          style: TextStyle(
                              color: const Color.fromARGB(255, 82, 82, 82),
                              fontSize: 15),
                        ),
                      )
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
