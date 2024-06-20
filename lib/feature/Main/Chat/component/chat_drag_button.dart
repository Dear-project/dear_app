import 'package:flutter/material.dart';

enum ChatDragButtonType { silent, block, exit }

class ChatDragButton extends StatelessWidget {
  ChatDragButtonType buttonType;

  ChatDragButton({required this.buttonType, super.key});

  String getButtonText() {
    switch (this.buttonType) {
      case ChatDragButtonType.silent:
        return "무음";
      case ChatDragButtonType.block:
        return "차단";
      case ChatDragButtonType.exit:
        return "나가기";
    }
  }

  Color getButtonColor() {
    switch (this.buttonType) {
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
    return MaterialButton(
      minWidth: 0,
      padding: EdgeInsets.zero,
      shape: Border(),
      onPressed: () {
        print("버튼 클릭 됨");
      },
      color: getButtonColor(),
      child: Container(
        width: 56,
        height: 70,
        alignment: Alignment.center,
        // color: getButtonColor(),
        child: Text(
          "${getButtonText()}",
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
