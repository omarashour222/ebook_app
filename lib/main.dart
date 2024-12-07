import 'package:ebook_app/features/helpers/dio_helper.dart';
import 'package:ebook_app/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:ebook_app/features/signin_screen/cubit/sign_in_cubit.dart';
import 'package:ebook_app/features/splash_screen/cubit/splash_screen_cubit.dart';
import 'package:ebook_app/features/splash_screen/view/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

void main() {
  DioHelper.init();
  runApp(const EbookApp());
}

class EbookApp extends StatelessWidget {
  const EbookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => SplashScreenCubit()..displayTheme(),
          ),
          BlocProvider(
            create: (context) => SignInCubit(),
          )
        ],
        child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          home: SplashView(),
        ));
  }
}
