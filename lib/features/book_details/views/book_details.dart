import 'package:ebook_app/features/book_details/widgets/book_buttom.dart';
import 'package:ebook_app/features/book_details/widgets/book_description.dart';
import 'package:ebook_app/features/book_details/widgets/book_image.dart';
import 'package:ebook_app/features/book_details/widgets/book_rate.dart';
import 'package:flutter/material.dart';

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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
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
              child: BookButtom(),
            ),
          ],
        ),
      ),
    );
  }
}
