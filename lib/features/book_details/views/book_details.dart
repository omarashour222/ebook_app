import 'package:ebook_app/features/book_details/widgets/book_buttom.dart';
import 'package:ebook_app/features/book_details/widgets/book_description.dart';
import 'package:ebook_app/features/book_details/widgets/book_image.dart';
import 'package:ebook_app/features/book_details/widgets/book_rate.dart';
import 'package:ebook_app/features/book_details/widgets/payment_method_bottom_sheet.dart';
import 'package:ebook_app/features/book_details/widgets/saved_buttom.dart';
import 'package:ebook_app/features/home_screen/model/books_model.dart';
import 'package:ebook_app/features/saved_view/cubit/saved_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetails extends StatelessWidget {
  const BookDetails({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.author,
    required this.description,
  });

  final String imageUrl;
  final String title;
  final String author;
  final String description;

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
    final isSaved = cubit.isBookSaved(book);
    return Scaffold(
      appBar: AppBar(actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: SavedButtom(
            imageUrl: imageUrl,
            title: title,
            author: author,
            isSaved: isSaved,
            description: description,
          ),
        ),
      ]),
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20, bottom: 20),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  BookImage(imageUrl: imageUrl),
                  SizedBox(height: 10),
                  Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    author,
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(height: 10),
                  BookRate(),
                  SizedBox(height: 20),
                  BookDescription(description: description),
                  SizedBox(
                      height:
                          80), // Add space to prevent overlap with the button
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: BookButtom(
                text: 'Buy now',
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      builder: (context) {
                        return PaymentMethodBottomSheet();
                      });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
