import 'package:ebook_app/features/book_details/widgets/custom_button_bloc_consumer.dart';
import 'package:ebook_app/features/book_details/widgets/payment_method_list_view.dart';
import 'package:flutter/material.dart';

class PaymentMethodBottomSheet extends StatefulWidget {

  const PaymentMethodBottomSheet({super.key});

  @override
  State<PaymentMethodBottomSheet> createState() => _PaymentMethodBottomSheetState();
}

class _PaymentMethodBottomSheetState extends State<PaymentMethodBottomSheet> {
  int selectedPaymentMethod = 0;

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
          PaymentMethodListView(
             onPaymentSelected: (index) {
            setState(() {
              selectedPaymentMethod = index;
            });
          },
          ),
          SizedBox(
            height: 32,
          ),
          CustomBottonBlocConsumer(selectedPaymentMethod: selectedPaymentMethod,),
        ],
      ),
    );
  }
}

