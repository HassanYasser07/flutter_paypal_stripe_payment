import 'package:flutter/material.dart';
import 'package:flutter_paypal_stripe_payment/features/checkout/data/repos/checkout_repo_impl.dart';
import 'package:flutter_paypal_stripe_payment/features/checkout/presentation/manger/payment_cubit.dart';
import 'package:flutter_paypal_stripe_payment/features/checkout/presentation/views/widgets/payment_methods_bottom_sheet.dart';
import 'package:flutter_paypal_stripe_payment/features/checkout/presentation/views/widgets/total_value.dart';
import 'custom_button.dart';
import 'order_info_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyCartViewBody extends StatelessWidget {
  const MyCartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Expanded(child: Image.asset('assets/images/Group 6.png')),
          SizedBox(height: 18),
          OrderInfoItem(title: 'Order Subtotal', value: '42.97'),
          OrderInfoItem(title: 'Discount ', value: '0'),
          OrderInfoItem(title: 'Shipping', value: '42.97'),
          Divider(thickness: 2, height: 34),
          TotalValue(title: 'Total', value: '42.97'),
          SizedBox(height: 30),
          CustomButton(
            text: 'Complete Payment',
            onTap: () {
              //     Navigator.of(context).push(MaterialPageRoute(
              //       builder: (context) => const PaymentDetailsView(),)
              // );
              showModalBottomSheet(
                context: context,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                builder: (context) {
                  return BlocProvider(
                    create: (context) => PaymentCubit(CheckoutRepoImpl()),
                    child: PaymentMethodsBottomSheet(),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
