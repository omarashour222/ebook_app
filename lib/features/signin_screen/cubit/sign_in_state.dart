part of 'sign_in_cubit.dart';

@immutable
sealed class SignInState {}

final class SignInInitial extends SignInState {}

final class ClearText extends SignInState {}
final class ClearEmailText extends SignInState {}
final class ClearPhoneNumber extends SignInState {}


final class ShowingPass extends SignInState {}

final class LogInLoading extends SignInState {}

final class LogInFailed extends SignInState {
  //h3ml attrubute msg we atlobo fe constructor 3shan lw khdt el class el failed da ab3tlo message feha hwa failed leh
  final String msg;
  LogInFailed(this.msg);
}

final class LogInSuccess extends SignInState {}
