import 'package:ebook_app/features/book_details/widgets/custom_button_bloc_consumer.dart';
import 'package:ebook_app/features/book_details/widgets/payment_method_list_view.dart';
import 'package:flutter/material.dart';

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
          CustomBottonBlocConsumer(),
        ],
      ),
    );
  }
}

