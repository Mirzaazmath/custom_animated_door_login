import 'package:flutter/cupertino.dart';

class BezierClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height * 0.75);

    path.quadraticBezierTo(
        size.width * 0.25,
        size.height * 0.5,
        size.width * 0.5,
        size.height * 0.75
    );
    //
    path.quadraticBezierTo(
        size.width * 0.75,
        size.height * 1,
        size.width,
        size.height * 0.75
    );
    path.lineTo(size.width,0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}