import 'package:ebook_app/constants.dart';
import 'package:ebook_app/features/onboarding/presentation/views/widgets/custom_bottom.dart';
import 'package:flutter/material.dart';

class OnboardingViewBody extends StatelessWidget {
  const OnboardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 80,
        ),
        Image.asset('assets/images/onboarding logo.jpeg'),
        Text(
          'Welcome',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 35,
            color: Colors.white,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          'Read witout limits',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
        Spacer(),
        CustomButtom(
          color: Colors.white,
          text: 'Create Account',
          textColor: kPrimaryColor,
        ),
        SizedBox(
          height: 20,
        ),
        CustomButtom(
          color: kPrimaryColor,
          text: 'Log In as Guest',
          textColor: Colors.white,
        ),
        SizedBox(
          height: 70,
        ),
      ],
    );
  }
}