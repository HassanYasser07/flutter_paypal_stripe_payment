import 'package:flutter/material.dart';
import 'package:flutter_paypal_stripe_payment/core/utils/app_style.dart';
import 'package:flutter_paypal_stripe_payment/features/checkout/presentation/views/widgets/my_cart_view_body.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/widgets/custom_app_bar.dart';
class MyCartView extends StatelessWidget {
  const MyCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: 'My Cart',),
      body: MyCartViewBody(),

    );
  }


}
