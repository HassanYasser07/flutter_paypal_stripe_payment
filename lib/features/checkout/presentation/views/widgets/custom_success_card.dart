import 'package:flutter/material.dart';
import 'package:flutter_paypal_stripe_payment/features/checkout/presentation/views/widgets/payment_item_info.dart';
import 'package:flutter_paypal_stripe_payment/features/checkout/presentation/views/widgets/total_value.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../../core/utils/app_style.dart';
import 'credit_info_widget.dart';
class CustomSuccessCard extends StatelessWidget {
  const CustomSuccessCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: ShapeDecoration(shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),color: Color(0xffEDEDED)),
      child: Padding(
        padding: const EdgeInsets.only(top: 50.0+16,left: 22,right: 22),
        child: Column(
          children: [
            Text('Thank You!',style: Styles.style25,textAlign: TextAlign.center,),
            Text('Your transaction was successful',style: Styles.style20,textAlign: TextAlign.center,),
            SizedBox(height: 40,),
            PaymentItemInfo(title: 'Date', value: '01/24/2023',),
            SizedBox(height: 20,),
            PaymentItemInfo(title: 'Time', value: '10:15 AM',),
            SizedBox(height: 20,),
            PaymentItemInfo(title: 'To', value: 'Sam Louis',),
            Divider(
              height: 60,
              thickness: 2,
            ),
            TotalValue(title: 'Total', value: r'$50.97'),
            SizedBox(height: 30,),
            CardInfoWidget(),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  FontAwesomeIcons.barcode,
                  size: 64,
                ),
                Container(
                  width: 113,
                  height: 58,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                          width: 1.50, color: Color(0xFF34A853)),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'PAID',
                      textAlign: TextAlign.center,
                      style: Styles.style24
                          .copyWith(color: const Color(0xff34A853)),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: ((MediaQuery.sizeOf(context).height * .2 + 20) / 2) - 29,
            ),
          ],
        ),
      ),
    );
  }
}