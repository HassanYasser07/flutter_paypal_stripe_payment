import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../utils/app_style.dart';

AppBar buildAppBar({required String title}) {
  return AppBar(
    leading: Center(child: SvgPicture.asset('assets/images/Arrow 1.svg')),
    elevation: 0,
    centerTitle: true,
    title:  Text(
      title,
      textAlign: TextAlign.center,
      style: Styles.style25,

    ),

  );
}