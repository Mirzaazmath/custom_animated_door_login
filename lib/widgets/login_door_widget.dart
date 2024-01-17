import 'package:flutter/material.dart';
class LoginDoorWidget extends StatelessWidget {
  const LoginDoorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: MediaQuery
          .sizeOf(context)
          .width / 2,
      padding: const EdgeInsets.symmetric(
          horizontal: 25, vertical: 40),
      decoration:const BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Colors.grey,
              offset:  Offset(5, 5),
              blurRadius: 10
          ),

        ],
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors:   [
            Color(0xff59a0fd),
            Color(0xffe65d9d)
          ],),
        color: Colors.purple,
        borderRadius:  BorderRadius.only(topRight: Radius
            .circular(30), bottomRight: Radius.circular(30)),
      ),
      child:const  Text("LOGIN", style: TextStyle(color:  Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 17),),
    );
  }
}
