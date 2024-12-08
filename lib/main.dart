import 'package:ebook_app/features/helpers/dio_helper.dart';
import 'package:ebook_app/features/helpers/hive_helper.dart';
import 'package:ebook_app/features/home_screen/views/home_view.dart';
import 'package:ebook_app/features/main_views/views/bottom_nav.dart';
import 'package:ebook_app/features/sign_up/cubit/sign_up_cubit.dart';
import 'package:ebook_app/features/signin_screen/cubit/sign_in_cubit.dart';
import 'package:ebook_app/features/splash_screen/cubit/splash_screen_cubit.dart';
import 'package:ebook_app/features/splash_screen/view/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  await Hive.initFlutter();

  await Hive.openBox('LOGIN_BOX');
  await Hive.openBox(HiveHelper.token);
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
          ),
          BlocProvider(
            create: (context) => SignUpCubit(),
          )
        ],
        child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          home: SplashView(),
        ));
  }
}
