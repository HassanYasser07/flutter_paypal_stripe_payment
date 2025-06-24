import 'package:flutter/material.dart';
class CustomCheckIcon extends StatelessWidget {
  const CustomCheckIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(backgroundColor:Color(0xffD9D9D9),radius: 50,
      child: CircleAvatar(backgroundColor:Colors.green ,radius: 40,child: Icon(Icons.check  ,size: 40,),

      ),);
  }
}