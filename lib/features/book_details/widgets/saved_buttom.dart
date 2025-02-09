import 'package:ebook_app/features/home_screen/model/books_model.dart';
import 'package:ebook_app/features/saved_view/cubit/saved_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SavedButtom extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String author;
  final String description;
  final bool isSaved;
  const SavedButtom({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.author,
    required this.description,
    required this.isSaved,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SavedCubit>();
    final book = Items(
      volumeInfo: VolumeInfo(
        title: title,
        authors: [author],
        description: description,
        imageLinks: ImageLinks(thumbnail: imageUrl),
      ),
    );
    return BlocBuilder<SavedCubit, SavedState>(
      builder: (context, state) {
        final isSaved = cubit.isBookSaved(book);
        return IconButton(
          onPressed: () {
            if (isSaved) {
              cubit.removeBook(book);
              Get.snackbar('Removed', 'Book Removed from saved',
                  backgroundColor: Colors.red);
            } else {
              cubit.saveBook(book);
              Get.snackbar('Successful', 'Book Added to saved',
                  backgroundColor: Colors.green);
            }
          },
          icon: isSaved
              ? Icon(
                  CupertinoIcons.heart_fill,
                  color: Colors.red,
                  size: 30,
                )
              : Icon(
                  CupertinoIcons.heart,
                  size: 30,
                ),
        );
      },
    );
  }
}
