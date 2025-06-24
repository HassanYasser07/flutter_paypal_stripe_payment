import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
class PaymentMethodItem extends StatelessWidget {
  const PaymentMethodItem({super.key, required this.isActive, required this.image});
final bool isActive;
final String image;
  @override
  Widget build(BuildContext context) {
    return  AnimatedContainer(
      width: 103,
      height: 63,
      decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: BorderSide(color:isActive? Color(0xff34A853):
            Color(0xff000080), width: 1.5),
            borderRadius: BorderRadius.circular(15),

          ),
          shadows:[BoxShadow(
              color:isActive? Color(0xff34A853):Colors.white,
              blurRadius: 4,
              offset: Offset(0, 0),
              spreadRadius: 0
          )]

      ),
      duration: Duration(milliseconds: 300),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white
        ),
        child: Center(
          child:
          SvgPicture.asset(image,),
        ),
      ),
    );
  }
}
