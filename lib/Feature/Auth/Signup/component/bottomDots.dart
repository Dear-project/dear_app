import 'package:flutter/cupertino.dart';

enum Dots { first, second, third, four, five }

class BottomDots extends StatelessWidget {

  Dots dotType;

  BottomDots(this.dotType, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 10,
          width: 10,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color((dotType == Dots.first) ? 0xff0E2764 : 0xffD9D9D9),
          ),
        ),
        SizedBox(
          width: 15,
        ),
        Container(
          height: 10,
          width: 10,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color((dotType == Dots.second) ? 0xff0E2764 : 0xffD9D9D9),
          ),
        ),
        SizedBox(
          width: 15,
        ),
        Container(
          height: 10,
          width: 10,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color((dotType == Dots.third) ? 0xff0E2764 : 0xffD9D9D9),
          ),
        ),
        SizedBox(
          width: 15,
        ),
        Container(
          height: 10,
          width: 10,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color((dotType == Dots.four) ? 0xff0E2764 : 0xffD9D9D9),
          ),
        ),
        SizedBox(
          width: 15,
        ),
        Container(
          height: 10,
          width: 10,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color((dotType == Dots.five) ? 0xff0E2764 : 0xffD9D9D9),
          ),
        ),
      ],
    );
  }
}
