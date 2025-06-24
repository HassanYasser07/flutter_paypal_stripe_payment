import 'package:flutter/material.dart';
import 'package:flutter_paypal_stripe_payment/features/checkout/presentation/views/success_view.dart';
import 'package:flutter_paypal_stripe_payment/features/checkout/presentation/views/widgets/custom_button.dart';
import 'package:flutter_paypal_stripe_payment/features/checkout/presentation/views/widgets/payment_method_list_view.dart';

import 'custom_credit_card.dart';
class PaymentDetailsViewBody extends StatefulWidget {
  const PaymentDetailsViewBody({super.key});

  @override
  State<PaymentDetailsViewBody> createState() => _PaymentDetailsViewBodyState();
}

class _PaymentDetailsViewBodyState extends State<PaymentDetailsViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: PaymentMethodsListView()),
        SliverToBoxAdapter(child: CustomCreditCard(formKey: formKey, autoValidateMode: autoValidateMode,)),
        SliverFillRemaining(
            hasScrollBody: false,
            child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
          padding: const EdgeInsets.only(bottom: 12,right:16 ,left:16 ,),
          child: CustomButton(
              text: 'Pay',onTap: (){
                if(formKey.currentState!.validate()){
                  formKey.currentState!.save();}
                else{

                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SuccessView(),));

                  autoValidateMode = AutovalidateMode.always;
                setState(() {});}
          }),
        ))),
      ]
    );
  }
}
