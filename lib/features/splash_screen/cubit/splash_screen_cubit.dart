import 'dart:async';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:ebook_app/constants.dart';
import 'package:ebook_app/features/helpers/hive_helper.dart';
import 'package:ebook_app/features/main_views/views/bottom_nav.dart';
import 'package:ebook_app/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

part 'splash_screen_state.dart';

class SplashScreenCubit extends Cubit<SplashScreenState> {
  SplashScreenCubit() : super(SplashScreenInitial());

  int chooseLogo = 1;
  Color backgroundColor = kPrimaryColor;

  Future<void> displayTheme() async {
    const seconds = Duration(seconds: 1);
    var time = Timer.periodic(seconds, (Timer t) => changeTheme());
    var box = Hive.box('onboardingBox');
    bool isOnboardingCompleted = box.get('ONBOARDING_KEY', defaultValue: false);
    await Future.delayed(const Duration(seconds: 5)).then((val) {
      time.cancel();
      if (isOnboardingCompleted) {
        if (HiveHelper.checkLoginValue()) {
          if (HiveHelper.getToken() != null) ;

          Get.offAll(() => MainView());
        }
      } else {
        Get.offAll(() => OnboardingView());
      }
    });
  }

  void changeTheme() {
    if (chooseLogo == 1) {
      chooseLogo = 2;
      backgroundColor = Colors.white;
    } else {
      backgroundColor = kPrimaryColor;
      chooseLogo = 1;
    }
    emit(ChangeLogo());
  }
}
