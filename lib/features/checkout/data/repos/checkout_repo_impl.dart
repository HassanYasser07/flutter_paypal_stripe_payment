import 'package:dartz/dartz.dart';

import 'package:flutter_paypal_stripe_payment/core/errors/failure.dart';
import 'package:flutter_paypal_stripe_payment/core/utils/stripe_services.dart';

import 'package:flutter_paypal_stripe_payment/features/checkout/data/models/payment_intent_input_model.dart';

import 'checkot_repo.dart';


class CheckoutRepoImpl extends CheckoutRepo{
  @override
  Future<Either<Failure, void>> makePayment({required PaymentIntentInputModel paymentIntentInputModel})async {
    StripeServices stripeServices = StripeServices();
    try{
     await stripeServices.makePayment(paymentIntentInputModel: paymentIntentInputModel);
     return const Right(null);

    }  catch(e){
      return Left(ServerFailure(message: e.toString()));

    }

  }
}