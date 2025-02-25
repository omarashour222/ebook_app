import 'package:dartz/dartz.dart';
import 'package:ebook_app/core/erorrs/failures.dart';
import 'package:ebook_app/core/utils/stripe_service.dart';
import 'package:ebook_app/data/models/payment_intent_input_model.dart';
import 'package:ebook_app/data/repos/checkout_repo.dart';

class CheckoutRepoImpl extends CheckoutRepo {
  final StripeService stripeService = StripeService();
  @override
  Future<Either<Failure, void>> makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    try {
      await stripeService.makePayment(
          paymentIntentInputModel: paymentIntentInputModel);

      return right(null);
    } catch (e) {
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
}
