import 'package:dear_app/Shared/theme/dear_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DearTextFieldButton extends StatelessWidget {
  Function action;
  String buttonText;

  DearTextFieldButton({required this.action, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
        onPressed: () {
          action();
        },
        child: Container(
            decoration: BoxDecoration(
                color: Color(0xff0E2764),
                border: Border.all(color: Color(0xff0E2764)),
                borderRadius: BorderRadius.circular(10)
            ),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                buttonText,
                style: TextStyle(
                    color: DearColors.white,
                    fontFamily: "Pretendard",
                    fontSize: 13,
                    fontWeight: FontWeight.w500
                ),
              ),
            )
        )
    );
  }
}