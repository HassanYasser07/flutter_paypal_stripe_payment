import 'package:flutter/material.dart';
import 'package:flutter_paypal_stripe_payment/features/checkout/presentation/views/widgets/total_value.dart';

import '../payment_details.dart';
import 'custom_button.dart';
import 'order_info_item.dart';
class MyCartViewBody extends StatelessWidget {
  const MyCartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Expanded(child: Image.asset('assets/images/Group 6.png')),
          SizedBox(height: 18,),
          OrderInfoItem(title: 'Order Subtotal', value: '42.97',),
          OrderInfoItem(title: 'Discount ', value: '0',),
          OrderInfoItem(title: 'Shipping', value: '42.97',),
          Divider(
            thickness: 2,
            height: 34,
          ),
          TotalValue(title: 'Total', value: '42.97',),
      SizedBox(height: 30,),
      CustomButton(
        text: 'Complete Payment',
        onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const PaymentDetailsView(),));
      },)



        ]
      ),
    );
  }
}