import 'package:ebook_app/features/home_screen/cubit/home_screen_cubit.dart';
import 'package:ebook_app/features/home_screen/widgets/actual_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget gridBuilder(BuildContext context, ) {
  final booksCubit = context.read<HomeScreenCubit>();
  if (booksCubit.booksList.isEmpty) {
    return Center(
        child: Text(
      "No books found!",
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    ));
  }
  return GridView.builder(
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 5,
        childAspectRatio: 0.8,
        mainAxisExtent: 350),
    itemCount: booksCubit.booksList.length,
    itemBuilder: (context, index) {
      final books = booksCubit.booksList[index];
      return actualItems(books: books);
    },
  );
}
