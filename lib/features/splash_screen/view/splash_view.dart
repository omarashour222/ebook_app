import 'package:ebook_app/constants.dart';
import 'package:ebook_app/features/splash_screen/cubit/splash_screen_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SplashScreenCubit>();
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return BlocBuilder<SplashScreenCubit, SplashScreenState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: cubit.backgroundColor,
          body: Center(
            child: SizedBox(
                width: width * 0.40,
                height: height * 0.20,
                child: Image.asset(imagePath + 'logo${cubit.chooseLogo}.png')),
          ),
        );
      },
    );
  }
}
