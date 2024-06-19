import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OnboardingButton extends StatelessWidget {
  String content;
  Color background;
  Color foreground;
  void Function() onPressed;

  OnboardingButton({ super.key, required this.content, required this.background, required this.foreground, required this.onPressed  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.symmetric(vertical: 4),
      onPressed: onPressed,
      child: Container(
        width: 342,
        height: 56,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: background
        ),
        child: Center(
          child: Text(
            content,
            style: TextStyle(
                fontSize: 16,
                fontFamily: "Pretendard",
                color: foreground,
                fontWeight: FontWeight.bold),
          ),
        )
      ),
    );
  }

}