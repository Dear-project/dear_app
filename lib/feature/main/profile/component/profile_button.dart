import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum ProfileButtonType {
  Alert,
  ServicePolicy,
  Version,
  Support,
  Logout,
  MemberSecession,
}

class ProfileButton extends StatelessWidget {
  ProfileButtonType buttonType;
  Function onPressed;

  ProfileButton({required this.buttonType, required this.onPressed, super.key});

  String getProfileButtonText() {
    switch (buttonType) {
      case ProfileButtonType.Alert:
        return "알림설정";
      case ProfileButtonType.ServicePolicy:
        return "서비스 정책";
      case ProfileButtonType.Version:
        return "버전";
      case ProfileButtonType.Support:
        return "고객센터";
      case ProfileButtonType.Logout:
        return "로그아웃";
      case ProfileButtonType.MemberSecession:
        return "탈퇴하기";
    }
  }

  Color getProfileButtonColor() {
    switch (buttonType) {
      case ProfileButtonType.Logout:
        return Color(0xffF90707);
      case ProfileButtonType.MemberSecession:
        return Color(0xffF90707);
      default:
        return Color(0xff000000);
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () {
        onPressed();
      },
      child: Container(
          color: Colors.white,
          height: 70,
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 34),
            child: Row(
              children: [
                Text(
                  "${getProfileButtonText()}",
                  style: TextStyle(
                    fontFamily: "Pretendard",
                    fontSize: 18,
                    color: getProfileButtonColor(),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Spacer(flex: 1),
              ],
            ),
          )),
    );
  }
}
