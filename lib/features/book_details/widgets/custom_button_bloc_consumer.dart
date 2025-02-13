import 'dart:developer';

import 'package:ebook_app/core/utils/api_keys.dart';
import 'package:ebook_app/data/models/amount_model/amount_model.dart';
import 'package:ebook_app/data/models/amount_model/details.dart';
import 'package:ebook_app/data/models/item_list_model/item.dart';
import 'package:ebook_app/data/models/item_list_model/item_list_model.dart';
import 'package:ebook_app/data/models/payment_intent_input_model.dart';
import 'package:ebook_app/features/book_details/widgets/book_buttom.dart';
import 'package:ebook_app/features/main_views/views/bottom_nav.dart';
import 'package:ebook_app/features/manger/cubit/payment_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:get/get.dart';

class CustomBottonBlocConsumer extends StatelessWidget {
  final int selectedPaymentMethod;
  const CustomBottonBlocConsumer({
    super.key,
    required this.selectedPaymentMethod,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentState>(
      listener: (context, state) {
        if (state is PaymentSuccess) {
          Get.to(MainView());
        }
        if (state is PaymentFailure) {
          Get.back();
          SnackBar snackBar = SnackBar(
            content: Text(state.errMessage),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      builder: (context, state) {
        return BookButtom(
          text: 'Continue',
          isLoading: state is PaymentLoading ? true : false,
          onTap: () {
            if (selectedPaymentMethod == 0) {
              PaymentIntentInputModel paymentIntentInputModel =
                  PaymentIntentInputModel(
                amount: '100',
                currency: 'USD',
                customerId: 'cus_RFqTz521xYdEf4',
              );
              BlocProvider.of<PaymentCubit>(context).makePayment(
                  paymentIntentInputModel: paymentIntentInputModel);
            } else {
              var transactionsData = getTrasactionsData();
              excutePaypalPayment(context, transactionsData);
            }
          },
        );
      },
    );
  }

  void excutePaypalPayment(BuildContext context,
      ({AmountModel amount, ItemListModel itemList}) transactionsData) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) => PaypalCheckoutView(
        sandboxMode: true,
        clientId: ApiKeys.clientId,
        secretKey: ApiKeys.paypalSecretKey,
        transactions: [
          {
            "amount": transactionsData.amount.toJson(),
            "description": "The payment transaction description.",
            // "payment_options": {
            //   "allowed_payment_method":
            //       "INSTANT_FUNDING_SOURCE"
            // },
            "item_list": transactionsData.itemList.toJson(),
          }
        ],
        note: "Contact us for any questions on your order.",
        onSuccess: (Map params) async {
          log("onSuccess: $params");
          Navigator.pop(context);
        },
        onError: (error) {
          log("onError: $error");
          Navigator.pop(context);
        },
        onCancel: () {
          print('cancelled:');
          Navigator.pop(context);
        },
      ),
    ));
  }

  ({AmountModel amount, ItemListModel itemList}) getTrasactionsData() {
    var amount = AmountModel(
        currency: "USD",
        total: '100',
        details: Details(
          shipping: '0',
          shippingDiscount: 0,
          subtotal: '100',
        ));

    List<OrderItemModel> orders = [
      OrderItemModel(
        currency: 'USD',
        name: 'Apple',
        price: '4',
        quantity: 10,
      ),
      OrderItemModel(
        currency: 'USD',
        name: 'Apple',
        price: '5',
        quantity: 12,
      )
    ];

    var itemList = ItemListModel(
      orders: orders,
    );

    return (amount: amount, itemList: itemList);
  }
}
