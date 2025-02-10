part of 'sign_up_cubit.dart';

@immutable
sealed class SignUpState {}

final class SignUpInitial extends SignUpState {}

final class RegisterLoadingState extends SignUpState {}

final class RegisterSuccessState extends SignUpState {
  final String msge;
  RegisterSuccessState(this.msge);
}

final class RegisterErrorState extends SignUpState {
  final String msg;
  RegisterErrorState(this.msg);
}
