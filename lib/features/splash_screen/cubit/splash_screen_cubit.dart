import 'dart:async';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:ebook_app/constants.dart';
import 'package:ebook_app/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

part 'splash_screen_state.dart';

class SplashScreenCubit extends Cubit<SplashScreenState> {
  SplashScreenCubit() : super(SplashScreenInitial());

  int chooseLogo = 1;
  Color backgroundColor = kPrimaryColor;

  void displayTheme() {
    const seconds = Duration(seconds: 1);
    var time = Timer.periodic(seconds, (Timer t) => changeTheme());

    Future.delayed(const Duration(seconds: 5)).then((val) {
      time.cancel();
      Get.off(() => const OnboardingView());
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
