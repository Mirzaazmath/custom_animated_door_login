import 'package:flutter/material.dart';
class MyClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    Path path= Path();
    path.moveTo(size.width/2, 0);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) =>true;
}