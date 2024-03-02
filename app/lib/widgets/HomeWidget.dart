import 'package:flutter/material.dart';

class CurvedBottomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path(); // 1.  top left
    path.lineTo(0, size.height - 50); //2.  bottom left
    path.quadraticBezierTo(
        size.width / 2, // 3. bottom center
        size.height, // 3.
        size.width, // 4.  bottom right
        size.height - 50 // 4.
        );
    path.lineTo(size.width, 0); // 5. top right
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}


