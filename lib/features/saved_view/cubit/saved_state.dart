part of 'saved_cubit.dart';

@immutable
abstract class SavedState {}

class SavedInitial extends SavedState {}
class SavedLoading extends SavedState {}

class SavedBooks extends SavedState {
  final List<Items> savedBooks;
  SavedBooks(this.savedBooks);
}

class RemoveSavedBooks extends SavedState {}
