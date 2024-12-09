import 'package:ebook_app/features/home_screen/model/books_model.dart';
import 'package:flutter/material.dart';

Widget actualItems({
  required Items books,
}) {
  final image = books.volumeInfo?.imageLinks?.thumbnail ??
      'https://bookstoreromanceday.org/wp-content/uploads/2020/08/book-cover-placeholder.png';
  final title = books.volumeInfo?.title ?? 'no title';
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(
        height: 280,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(23),
          child: Image.network(
            image,
            fit: BoxFit.fill,
          ),
        ),
      ),
      SizedBox(height: 8),
      Padding(
        padding: const EdgeInsets.only(left: 8),
        child: Text(
          title,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              overflow: TextOverflow.ellipsis),
        ),
      ),
    ],
  );
}
