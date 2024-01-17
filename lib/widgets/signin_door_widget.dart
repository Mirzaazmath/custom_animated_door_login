import 'package:flutter/material.dart';
class SignInDoorWidget extends StatelessWidget {
  const SignInDoorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: MediaQuery.sizeOf(context).width/2,
      padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 40),
      decoration:const  BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Colors.grey,
              offset:   Offset(-5,-0),
              blurRadius: 10
          ),

        ],
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end:Alignment.bottomCenter,
            colors:  [
              Color(0xff59a0fd),
              Color(0xffe65d9d)
            ]),
        color: Colors.purple,
        borderRadius:  BorderRadius.only(topLeft: Radius.circular(30),bottomLeft: Radius.circular(30) ),
      ),
      alignment: Alignment.topRight,
      child: const  Text("SIGN-UP",style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold,fontSize: 17),),
    );
  }
}
