import 'package:flutter/material.dart';

import '../../../../../core/utils/app_style.dart';
class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.onTap, required this.text,  this.isLoading=false});
  final void Function() onTap;
  final String text;
  final bool isLoading ;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap ,
      child: Container(
          width: double.infinity,
          height: 55,
          decoration: ShapeDecoration(shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15)),
              color: Color(0xff34A853)),
          child: Center(
            child:isLoading? CircularProgressIndicator(color: Colors.white,): Text(
              textAlign: TextAlign.center,
              style: Styles.style22,
              text,
            ),)
      ),
    );
  }
}