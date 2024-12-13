import 'package:ebook_app/constants.dart';
import 'package:ebook_app/features/home_screen/widgets/actual_items.dart';
import 'package:ebook_app/features/saved_view/cubit/saved_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SavedView extends StatelessWidget {
  const SavedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SavedCubit, SavedState>(
        builder: (context, state) {
          final cubit = context.read<SavedCubit>();
          final savedBooks = cubit.savedBooks;

          // Show loading indicator if books are still loading
          if (state is SavedLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          // If there are no saved books
          if (savedBooks.isEmpty) {
            return Center(
              child: Text(
                'No Saved Books Yet!',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: kPrimaryColor,
                ),
              ),
            );
          }

          // If books are loaded and available
          return Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 5,
                      childAspectRatio: 0.8,
                      mainAxisExtent: 350,
                    ),
                    itemCount: savedBooks.length,
                    itemBuilder: (context, index) {
                      final book = savedBooks[index];
                      return actualItems(books: book);
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
