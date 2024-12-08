import 'package:bloc/bloc.dart';
import 'package:ebook_app/constants.dart';
import 'package:ebook_app/features/home_screen/books_dio_helper/books_dio_helper.dart';
import 'package:ebook_app/features/home_screen/model/books_model.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'home_screen_state.dart';

class HomeScreenCubit extends Cubit<HomeScreenState> {
  HomeScreenCubit() : super(HomeScreenInitial());
  TextEditingController searchController = TextEditingController();

  BooksModel booksModel = BooksModel();
  List<Items> booksList = [];
    List<Items> allbooksList = [];


  void gettingBooks() async {
    emit(GettingBooksLoading());

    try {
      final response = await BooksDioHelper.getUrls(Url: booksApiUrl, params: {
        'q': 'coding',
      });

      booksModel = BooksModel.fromJson(response.data);
      if (response.statusCode == 200) {
        booksList = (response.data['items'] as List)
            .map((e) => Items.fromJson(e))
            .toList();
allbooksList = List.from(booksList);
        print('Books List: ${booksList.length} items');
        print(booksList);
        emit(GettingBooksSuccess());
      } else {
        emit(GettingBooksFailed(msg: 'couldnt load books (response error)'));
      }
    } catch (e) {
      print("Error in gettingBooks: $e"); // Log the error to check the cause
      emit(GettingBooksFailed(msg: 'couldnt load books (code error)'));
    }
  }
  void searchBooks(String query) {
    if (query.isEmpty) {
       booksList = List.from(allbooksList); // عرض كل الكتب عند عدم وجود بحث
    } else {
      booksList = allbooksList
          .where((book) => book.volumeInfo?.title
              ?.toLowerCase()
              .contains(query.toLowerCase()) ??
              false)
          .toList();
           print("Filtered Books: ${booksList.length}");
    }
    emit(GettingBooksSearch()); 
  }
}
