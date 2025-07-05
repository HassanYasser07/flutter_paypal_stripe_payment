import 'package:dio/dio.dart';
import 'package:flutter_paypal_stripe_payment/core/utils/api_key.dart';
import 'package:flutter_paypal_stripe_payment/core/utils/api_services.dart';
import 'package:flutter_paypal_stripe_payment/features/checkout/data/models/ephemeral_key_model.dart';
import 'package:flutter_paypal_stripe_payment/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:flutter_paypal_stripe_payment/features/checkout/data/models/payment_intent_model.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

import '../../features/checkout/data/models/init_payment_sheet_input_model.dart';

class StripeServices {
  ApiServices apiServices = ApiServices();

  Future<PaymentIntentModel> createPaymentIntent(
      PaymentIntentInputModel paymentIntentInputModel,) async {
    var response = await apiServices.post(
      contentType: Headers.formUrlEncodedContentType,
      url: 'https://api.stripe.com/v1/payment_intents',
      body: paymentIntentInputModel.toJson(),
      token: ApiKey.secretKey,
    );
    var paymentIntentModel = PaymentIntentModel.fromJson(response.data);
    return paymentIntentModel;
  }

  Future initPaymentSheet(
      {required InitPaymentSheetInputModel initPaymentSheetInputModel}) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: initPaymentSheetInputModel.clientSecret,
        customerEphemeralKeySecret: initPaymentSheetInputModel
            .ephemeralKeySecret,
        customerId: initPaymentSheetInputModel.customerID,
        merchantDisplayName: "Flutter Stripe Payment",
      ),
    );
  }

  Future displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future makePayment({
    required PaymentIntentInputModel paymentIntentInputModel,
  }) async {
    var paymentIntentModel = await createPaymentIntent(paymentIntentInputModel);
    var ephemeralKey = await createEphemeralKey(customerID: paymentIntentInputModel.customerId);
    var initPaymentSheetInputModel = InitPaymentSheetInputModel(
        clientSecret: paymentIntentModel.clientSecret,
        ephemeralKeySecret:ephemeralKey.secret,
        customerID:paymentIntentInputModel.customerId);


    await initPaymentSheet(
   initPaymentSheetInputModel: initPaymentSheetInputModel,
    );

    await
    displayPaymentSheet
    (
    );
  }

  Future<EphemeralKeyModel> createEphemeralKey({
    required String customerID,
  }) async {
    var response = await apiServices.post(
      contentType: Headers.formUrlEncodedContentType,
      url: 'https://api.stripe.com/v1/ephemeral_keys',
      body: {'customer': customerID},
      token: ApiKey.secretKey,
      headers: {
        'Authorization': 'Bearer ${ApiKey.secretKey}',
        'Stripe-Version': '2025-05-28.basil',
      },
    );
    var ephemeralKey = EphemeralKeyModel.fromJson(response.data);
    return ephemeralKey;
  }
}
