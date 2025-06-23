import 'package:flutter/material.dart';

import '../../../../../core/utils/app_style.dart';
class TotalValue extends StatelessWidget {
  const TotalValue({super.key, required this.title, required this.value});
  final String title , value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title,style: Styles.style24,textAlign: TextAlign.center,),
        Spacer(),
        Text(value,style: Styles.style24,textAlign: TextAlign.center,),
      ],
    );
  }
}
