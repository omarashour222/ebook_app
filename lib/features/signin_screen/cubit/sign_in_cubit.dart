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
  String? emaill;
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
        HiveHelper.setValueLoginBox();
        username = model.data?.name;
        emaill = model.data?.email;
        var box = Hive.box('USER_BOX');
        box.put('username', username);
        box.put('email', emaill);
        String profileImageKey = 'profile_image_$email';
        var imagePath =
            box.get(profileImageKey); // Get stored image path if exists
        if (imagePath != null) {
          box.put(profileImageKey,
              imagePath); // Save image path for the specific user
        }
        debugPrint('User logged in successfully: Token = ${model.data?.token}');
        Get.offAll(MainView());
        emit(LogInSuccess());
      } else {
        emit(LogInFailed(model.message ?? 'couldn\'t find the error'));
      }
    } catch (e) {
      emit(LogInFailed('could not find the error'));
    }
  }
}
