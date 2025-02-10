part of 'switch_cubit.dart';

@immutable
sealed class SwitchState {}

final class SwitchInitial extends SwitchState {}

final class AuthSwitch extends SwitchState {}

final class FaceIdSwitch extends SwitchState {}

final class PassCodeLockSwitch extends SwitchState {}
