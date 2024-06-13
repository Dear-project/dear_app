import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DearLogo extends StatelessWidget {
  final double? size;
  final Color? color;

  DearLogo({this.size = 28, this.color = const Color(0xff0E2764)});

  @override
  Widget build(BuildContext context) {
    return Text(
          "DEAR.",
          style: TextStyle(
            fontFamily: "Assistant",
            fontWeight: FontWeight.w800,
            fontSize: size,
            color: color,
          ),
        );
  }
}
