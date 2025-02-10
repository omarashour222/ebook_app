import 'package:dartz/dartz.dart';
import 'package:ebook_app/core/erorrs/failures.dart';
import 'package:ebook_app/data/models/payment_intent_input_model.dart';

abstract class CheckoutRepo {
  Future<Either<Failure, void>> makePayment({required PaymentIntentInputModel paymentIntentInputModel});
}


