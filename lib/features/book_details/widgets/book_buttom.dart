import 'package:ebook_app/constants.dart';
import 'package:ebook_app/features/book_details/widgets/payment_method_list_view.dart';
import 'package:ebook_app/features/saved_view/cubit/saved_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookButtom extends StatelessWidget {
  final String text;
  const BookButtom({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SavedCubit, SavedState>(
      builder: (context, savedBooks) {
        return GestureDetector(
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
                child: Text(
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

class PaymentMethodBottomSheet extends StatelessWidget {
  const PaymentMethodBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 16,
          ),
          PaymentMethodListView(),
          SizedBox(
            height: 32,
          ),
          BookButtom(text: 'Continue'),
        ],
      ),
    );
  }
}
