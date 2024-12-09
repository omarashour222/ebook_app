import 'package:ebook_app/features/helpers/dio_helper.dart';
import 'package:ebook_app/features/helpers/hive_helper.dart';
import 'package:ebook_app/features/home_screen/books_dio_helper/books_dio_helper.dart';
import 'package:ebook_app/features/home_screen/cubit/home_screen_cubit.dart';
import 'package:ebook_app/features/profile_screen/cubit/image_picker_cubit.dart';
import 'package:ebook_app/features/profile_screen/cubit/switch_cubit.dart';
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
  await Hive.openBox('onboardingBox');
  await Hive.openBox(HiveHelper.loginBox);
  await Hive.openBox(HiveHelper.token);
  await Hive.openBox('USER_BOX');
  await Hive.openBox('IMAGE_BOX');

  DioHelper.init();
  BooksDioHelper.init();

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
          ),
          BlocProvider(
            create: (context) => SwitchCubit(),
          ),
          BlocProvider(
            create: (context) => ImagePickerCubit(userEmail: ''),
          ),
          BlocProvider(
            create: (context) => HomeScreenCubit()..gettingBooks(),
          ),
        ],
        child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          home: SplashView(),
        ));
  }
}
