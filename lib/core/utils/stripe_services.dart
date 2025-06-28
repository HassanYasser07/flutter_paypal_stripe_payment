import 'package:flutter_paypal_stripe_payment/core/utils/api_key.dart';
import 'package:flutter_paypal_stripe_payment/core/utils/api_services.dart';
import 'package:flutter_paypal_stripe_payment/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:flutter_paypal_stripe_payment/features/checkout/data/models/payment_intent_model.dart';

class StripeServices {
  ApiServices apiServices = ApiServices();

  Future<PaymentIntentModel> createPaymentIntent(
    PaymentIntentInputModel paymentIntentInputModel,
  ) async {
    var response = await apiServices.post(
      url: 'https://api.stripe.com/v1/payment_intents',
      body: paymentIntentInputModel.toJson(),
      token: ApiKey.secretKey,
    );
    var paymentIntentModel = PaymentIntentModel.fromJson(response.data);
    return paymentIntentModel;
  }
}
