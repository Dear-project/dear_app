import 'package:flutter/material.dart';

class DearTextFieldButton extends StatelessWidget {

  Function action;
  String buttonText;

  DearTextFieldButton({
    required this.action,
    required this.buttonText
  });
  // const DearTextFieldButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        action();
      },
      style: ElevatedButton.styleFrom(
        minimumSize: Size.zero,
        padding: EdgeInsets.zero,
        fixedSize: Size(73, 40),
        foregroundColor: Colors.white,
        backgroundColor: Color(0xff0E2764),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(
        "${buttonText}",
        style: TextStyle(
          height: 1.2,
          fontFamily: "Pretendard",
          fontSize: 15,
        ),
      ),
    );
  }

}