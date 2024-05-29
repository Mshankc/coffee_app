import 'package:flutter/material.dart';

class CircularBottomRightClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width - 20, size.height);
    path.arcToPoint(
      Offset(size.width, size.height - 20),
      radius: Radius.circular(20),
      clockwise: false,
    );
    path.lineTo(size.width, 0);
    path.lineTo(20, 0);
    path.arcToPoint(
      Offset(0, 20),
      radius: Radius.circular(20),
      clockwise: false,
    );
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CircularBottomRightClipper oldClipper) => false;
}
