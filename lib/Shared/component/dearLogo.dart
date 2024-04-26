import 'package:flutter/cupertino.dart';

class DearLogo extends StatelessWidget {
  const DearLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Text(
          "DEAR",
          style: TextStyle(
            fontFamily: "Assistant",
            fontWeight: FontWeight.w800,
            fontSize: 28,
            color: Color(0xff0E2764),
          ),
        ),
        Text(
          ".",
          style: TextStyle(
            fontFamily: "Assistant",
            fontWeight: FontWeight.w200,
            fontSize: 28,
            color: Color(0xff0E2764),
          ),
        ),
      ],
    );
  }
}
