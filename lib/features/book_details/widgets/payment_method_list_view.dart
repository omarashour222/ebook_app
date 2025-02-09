import 'package:ebook_app/features/book_details/widgets/payment_method_item.dart';
import 'package:flutter/material.dart';

class PaymentMethodListView extends StatefulWidget {
  PaymentMethodListView({super.key});

  @override
  State<PaymentMethodListView> createState() => _PaymentMethodListViewState();
}

class _PaymentMethodListViewState extends State<PaymentMethodListView> {
  final List<String> paymentMethodItems = [
    'assets/images/card.png',
    'assets/images/paypal.png'
  ];
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 62,
      child: ListView.builder(
          itemCount: paymentMethodItems.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (c, i) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: GestureDetector(
                onTap: () {
                  activeIndex = i;
                  setState(() {});
                },
                child: PaymentMethodItem(
                  image: paymentMethodItems[i],
                  isActive: activeIndex == i,
                ),
              ),
            );
          }),
    );
  }
}
