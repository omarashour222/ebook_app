import 'package:ebook_app/constants.dart';
import 'package:ebook_app/features/home_screen/model/books_model.dart';
import 'package:ebook_app/features/saved_view/cubit/saved_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class BookButtom extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String author;
  final String description;
  final bool isSaved;
  const BookButtom({
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
      builder: (context, savedBooks) {
        final isSaved = cubit.isBookSaved(book);

        return GestureDetector(
          onTap: () {
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
          child: Container(
            height: 55,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: isSaved ? Colors.grey : kPrimaryColor,
            ),
            child: Center(
              child: Text(
                isSaved ? 'Remove from Saved' : 'Save Book',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
