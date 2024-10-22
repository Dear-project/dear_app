import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum ChatDragButtonType { silent, block, exit }

class ChatDragButton extends StatelessWidget {
  ChatDragButtonType buttonType;

  ChatDragButton({required this.buttonType, super.key});

  String getButtonText() {
    switch (buttonType) {
      case ChatDragButtonType.silent:
        return "무음";
      case ChatDragButtonType.block:
        return "차단";
      case ChatDragButtonType.exit:
        return "나가기";
    }
  }

  Color getButtonColor() {
    switch (buttonType) {
      case ChatDragButtonType.silent:
        return Color(0xff534E4E);
      case ChatDragButtonType.block:
        return Color(0xffE5432D);
      case ChatDragButtonType.exit:
        return Color(0xff7B7878);
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () {
        print("버튼 클릭 됨");
      },
      child: Container(
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: getButtonColor()
        ),
        width: 56,
        height: 70,
        alignment: Alignment.center,
        // color: getButtonColor(),
        child: Text(
          getButtonText(),
          style: TextStyle(
            fontFamily: "Pretendard",
            fontWeight: FontWeight.w500,
            fontSize: 12,
            color: Color(0xffFFFFFF),
          ),
        ),
      ),
    );
  }
}
