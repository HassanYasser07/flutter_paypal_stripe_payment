import 'package:flutter/material.dart';
import 'custom_check_icon.dart';
import 'custom_dashed_line.dart';
import 'custom_success_card.dart';

class SuccessViewBody extends StatelessWidget {
  const SuccessViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          CustomSuccessCard(),
          Positioned(
            left: 28,
            right: 028,
            bottom: MediaQuery.of(context).size.height*0.2 +20,
            child: CustomDashedLine(),
          ),
          Positioned(
            left:-20 ,
            bottom: MediaQuery.of(context).size.height*0.2,
            child: CircleAvatar(backgroundColor: Colors.white,radius: 20,),),
          Positioned(
            right:-20 ,
            bottom: MediaQuery.of(context).size.height*0.2,
            child: CircleAvatar(backgroundColor:Colors.white,radius: 20,),),
          Positioned(
            top: -50,
            left: 0,
            right: 0,
            child: CustomCheckIcon(),
          ),
        ],
      ),
    );
  }
}



