import 'package:ebook_app/constants.dart';
import 'package:ebook_app/features/saved_view/cubit/saved_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookButtom extends StatelessWidget {
  final String text;
  const BookButtom({
    super.key,
    required this.text,
    this.onTap,
    this.isLoading = false,
  });
  final void Function()? onTap;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SavedCubit, SavedState>(
      builder: (context, savedBooks) {
        return GestureDetector(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Container(
              height: 55,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: kPrimaryColor,
              ),
              child: Center(
                child: isLoading
                    ? CircularProgressIndicator()
                    : Text(
                        text,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
              ),
            ),
          ),
        );
      },
    );
  }
}
