import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class speechBubble extends StatelessWidget {
  speechBubble({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: _speechBubbleClipper(),
      child: Container(
        // width: 145,
        // height: 40,
        width: 145,
        height: 40,
        color: Colors.yellow,
      ),
    );
  }
}

class _speechBubbleClipper extends CustomClipper<Path> {
  List<Offset> polygon = [
    Offset(145 / 4, 0),
    Offset(145 / 4 * 3, 0),
    Offset(145 / 2, 40)
  ];

  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;

    Path path = Path()
      ..addRRect(RRect.fromLTRBR(0, 0, 145, 20, Radius.circular(5)))
      ..quadraticBezierTo(w / 2, h / 2, w, 0)
      // ..lineTo(w, h)
      // ..lineTo(0, h)
      // ..addPolygon(polygon, false)
      // ..moveTo(0, 50)
      // ..lineTo(150, 0)
      // ..lineTo(200, 150)
      // ..lineTo(50, 200)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
