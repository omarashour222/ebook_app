import 'package:bloc/bloc.dart';
import 'package:ebook_app/features/helpers/dio_helper.dart';
import 'package:ebook_app/features/helpers/hive_helper.dart';
import 'package:ebook_app/features/main_views/views/bottom_nav.dart';
import 'package:ebook_app/features/signin_screen/models/signin_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  String? username;
  SignInModel model = SignInModel();
  bool istextObsecured = true;
  SignInCubit() : super(SignInInitial());

  void clearText() {
    userNameController.text = '';
    emit(ClearText());
  }

  void clearEmailText() {
    emailController.text = '';
    emit(ClearEmailText());
  }

  void clearPhoneNumber() {
    phoneController.text = '';
    emit(ClearPhoneNumber());
  }

  void showingPass() {
    istextObsecured = !istextObsecured;
    emit(ShowingPass());
  }

  void setToken() {
    HiveHelper.setValueLoginBox();
    emit(SetToken());
  }

  void logIn({required String email, required String password}) async {
    emit(LogInLoading());
    try {
      final response = await DioHelper.postUrls(
        Url: 'login',
        body: {'email': email, 'password': password},
      );
      model = SignInModel.fromJson(response.data);
      if (model.status == true) {
        HiveHelper.setToken(model.data?.token ?? "");
        username = model.data?.name;

        var box = Hive.box('USER_BOX');
        box.put('username', username);
        HiveHelper.setValueLoginBox();
        Get.offAll(() => MainView(key: MainView.mainViewKey));
        emit(LogInSuccess());
      } else {
        emit(LogInFailed(model.message ?? 'couldn\'t find the error'));
      }
    } catch (e) {
      emit(LogInFailed('could not find the error'));
    }
  }
}
