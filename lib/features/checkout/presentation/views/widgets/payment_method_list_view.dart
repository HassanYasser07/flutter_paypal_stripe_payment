import 'package:flutter/material.dart';
import 'package:flutter_paypal_stripe_payment/features/checkout/presentation/views/widgets/payment_method_item.dart';
class PaymentMethodsListView extends StatefulWidget {
  const PaymentMethodsListView({super.key});

  @override
  State<PaymentMethodsListView> createState() => _PaymentMethodsListViewState();
}

class _PaymentMethodsListViewState extends State<PaymentMethodsListView> {
  final List<String> paymentMethods= const['assets/images/SVGRepo_iconCarrier.svg','assets/images/Group.svg'];
int activeIndex=0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 63,
      child: ListView.builder(itemBuilder:
          (context, index) => Padding(
            padding: const EdgeInsets.symmetric(horizontal:16),
            child: GestureDetector(
              onTap:(){activeIndex=index;setState(() {});} ,
              child: PaymentMethodItem(
                      isActive:activeIndex==index, image: paymentMethods[index],),
            ),
          ),
        itemCount: paymentMethods.length,
        scrollDirection: Axis.horizontal,),
    );
  }
}
