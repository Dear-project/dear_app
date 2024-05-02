import 'package:flutter/cupertino.dart';

class DearLogo extends StatelessWidget {
  final double? size;
  DearLogo({this.size = 28});

  @override
  Widget build(BuildContext context) {
    return Text(
          "DEAR.",
          style: TextStyle(
            fontFamily: "Assistant",
            fontWeight: FontWeight.w800,
            fontSize: size,
            color: Color(0xff0E2764),
          ),
        );
  }
}
