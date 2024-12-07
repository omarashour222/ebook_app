part of 'sign_in_cubit.dart';

@immutable
sealed class SignInState {}

final class SignInInitial extends SignInState {}

final class ClearText extends SignInState {}

final class ShowingPass extends SignInState {}
