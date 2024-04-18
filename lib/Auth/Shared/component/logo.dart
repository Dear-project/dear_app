import 'package:flutter/cupertino.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "DEAR",
      style: TextStyle(
        fontFamily: "Assistant",
        fontWeight: FontWeight.w800,
        fontSize: 55,
        color: Color(0xff0E2764),
      ),
    );
  }

}