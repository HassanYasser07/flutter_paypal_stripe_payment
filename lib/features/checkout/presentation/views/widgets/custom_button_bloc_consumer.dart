import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_stripe_payment/features/checkout/presentation/manger/payment_cubit.dart';

import '../../../data/models/payment_intent_input_model.dart';
import '../payment_details.dart';
import '../success_view.dart';
import 'custom_button.dart';

class CustomButtonBlocConsumer extends StatelessWidget {
  const CustomButtonBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentState>(
      listener: (context, state) {
        if (state is PaymentSuccess) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const SuccessView()),
          );
        } else if (state is PaymentFailure) {
          Navigator.of(context).pop();
          SnackBar snackBar=SnackBar(content:
          Text(state.errorMessage));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      builder: (context, state) {
        return CustomButton(

          isLoading: state is PaymentLoading ? true : false,
          text: 'Continue',
          onTap: () {
            PaymentIntentInputModel paymentIntentInputModel = PaymentIntentInputModel(amount: '100', currency: 'USD', customerId: 'cus_SabgRrbOos64wC');
            BlocProvider.of<PaymentCubit>(context).makePayment(paymentIntentInputModel: paymentIntentInputModel);
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const PaymentDetailsView(),
              ),
            );

          },
        );
      },
    );
  }
}
