import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  final Function action;
  // BottomButton({super.key});

  BottomButton({required this.action});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
        onPressed: () {
          if(action != null) {
            action();
          }
        },

        padding: EdgeInsets.symmetric(),
        color: Color(0xff0E2764),
        borderRadius: BorderRadius.all(Radius.circular(16)),
        child: Container(
            width: 340,
            height: 55,
            child: Center(
              child: Text(
                "다음",
                style: TextStyle(
                    fontFamily: "Pretendard",
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              ),
            )));
  }
}
