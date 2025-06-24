import 'package:flutter/material.dart';
import 'package:flutter_paypal_stripe_payment/features/checkout/presentation/views/widgets/payment_method_list_view.dart';

import '../payment_details.dart';
import 'custom_button.dart';
class PaymentMethodsBottomSheet extends StatelessWidget {
  const PaymentMethodsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 16,),
          PaymentMethodsListView(),
          SizedBox(height: 32,),
          CustomButton(
            text: 'Continue',
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const PaymentDetailsView(),
              ));
            },
          ),
        ],
      ),
    );
  }
}
