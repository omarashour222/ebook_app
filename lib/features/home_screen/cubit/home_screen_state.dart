part of 'home_screen_cubit.dart';

@immutable
sealed class HomeScreenState {}

final class HomeScreenInitial extends HomeScreenState {}

final class GettingBooksSuccess extends HomeScreenState {}

final class GettingBooksFailed extends HomeScreenState {
  final String msg;
  GettingBooksFailed({required this.msg});
}

final class GettingBooksLoading extends HomeScreenState {}
final class GettingBooksSearch extends HomeScreenState {}

