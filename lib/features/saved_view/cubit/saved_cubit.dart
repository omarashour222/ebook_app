// import 'package:bloc/bloc.dart';
// import 'package:ebook_app/features/home_screen/model/books_model.dart';
// import 'package:hive/hive.dart';
// import 'package:meta/meta.dart';

// part 'saved_state.dart';
// const favoritesBox = 'favorite_books';
    

// class SavedCubit extends Cubit<SavedState> {
//   late Box<Items> favoriteBooksBox;
//   SavedCubit() : super(SavedInitial()){
//     favoriteBooksBox = Hive.box(favoritesBox);
//   }

//   final List<Items> savedBooks = []; 

//   void saveBook(Items book) {
//     if (!savedBooks.contains(book)) {
//       savedBooks.add(book);
      
//       emit(SavedBooks(savedBooks)); 
//     }
//   }
//     bool isBookSaved(Items book) {
//     return savedBooks.any((savedBook) => savedBook.volumeInfo?.title == book.volumeInfo?.title);
//   }
//   void removeBook(Items book) {
//   savedBooks.removeWhere((savedBook) => savedBook.volumeInfo?.title == book.volumeInfo?.title);
//   emit(RemoveSavedBooks()); 
// }
// }
import 'package:bloc/bloc.dart';
import 'package:ebook_app/features/home_screen/model/books_model.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

part 'saved_state.dart';

const favoritesBox = 'favorite_books';

class SavedCubit extends Cubit<SavedState> {
  late Box<Items> favoriteBooksBox;  // تأكد من استخدام late هنا لتأكيد ان الـ Box سيُحمل لاحقًا

  SavedCubit() : super(SavedInitial()) {
    _initHive();
  }

  final List<Items> savedBooks = []; 


  Future<void> _initHive() async {
     emit(SavedLoading());
    favoriteBooksBox = await Hive.openBox<Items>(favoritesBox);
    _loadSavedBooks(); 
  }

  void _loadSavedBooks() {
    savedBooks.clear();
    savedBooks.addAll(favoriteBooksBox.values);
    emit(SavedBooks(savedBooks));  
  }

  
  void saveBook(Items book) {
    if (!savedBooks.contains(book)) {
      savedBooks.add(book);
      favoriteBooksBox.add(book);  
      emit(SavedBooks(savedBooks)); 
    }
  }

  bool isBookSaved(Items book) {
    return savedBooks.any((savedBook) => savedBook.volumeInfo?.title == book.volumeInfo?.title);
  }

void removeBook(Items book) {
  savedBooks.removeWhere((savedBook) => savedBook.volumeInfo?.title == book.volumeInfo?.title);
  
  final keyToDelete = favoriteBooksBox.keys.firstWhere(
    (key) => favoriteBooksBox.get(key)?.volumeInfo?.title == book.volumeInfo?.title,
    orElse: () => null,
  );
  
  if (keyToDelete != null) {
    favoriteBooksBox.delete(keyToDelete);
  }
  
   
  emit(RemoveSavedBooks());
}

}
