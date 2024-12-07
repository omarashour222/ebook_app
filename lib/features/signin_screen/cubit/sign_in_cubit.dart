import 'package:bloc/bloc.dart';
import 'package:ebook_app/features/helpers/dio_helper.dart';
import 'package:ebook_app/features/home_screen/views/home_view.dart';
import 'package:ebook_app/features/signin_screen/models/signin_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  SignInModel model = SignInModel();
  bool istextObsecured = true;
  SignInCubit() : super(SignInInitial());

  void clearText() {
    userNameController.text = '';
    emit(ClearText());
  }

  void showingPass() {
    istextObsecured = !istextObsecured;
    emit(ShowingPass());
  }

  void logIn({required String email, required String password}) async {
    emit(LogInLoading());
    try {
      final response = await DioHelper.getUrls(
        Url: 'login',
        body: {'email': email, 'password': password},
      );
      model = SignInModel.fromJson(response.data);
      if (model.status == true) {
        emit(LogInSuccess());
        Get.to(() => HomeView());
      } else {
        emit(LogInFailed(model.message ?? 'couldn\'t find the error'));
      }
    } catch (e) {
      emit(LogInFailed('could not find the error'));
    }
  }
}
