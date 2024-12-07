import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  final TextEditingController userNameController = TextEditingController();
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
}
