import 'package:ebook_app/constants.dart';
import 'package:flutter/material.dart';

class BookButtom extends StatelessWidget {
  const BookButtom({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: kPrimaryColor,
      ),
      child: Center(
        child: Text(
          'Save Book',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
