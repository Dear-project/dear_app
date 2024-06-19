
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum ProfileButtonType {
  SeeMyReview,
  ServicePolicy,
  Inquiry,
  Logout,
  MemberSecession,
}

class ProfileButton extends StatelessWidget {
  ProfileButtonType buttonType;

  ProfileButton({required this.buttonType, super.key});

  String getProfileButtonText() {
    switch (buttonType) {
      case ProfileButtonType.SeeMyReview:
        return "내가 남긴 후기보기";
      case ProfileButtonType.ServicePolicy:
        return "서비스 정책";
      case ProfileButtonType.Inquiry:
        return "문의 하기";
      case ProfileButtonType.Logout:
        return "로그아웃";
      case ProfileButtonType.MemberSecession:
        return "회원 탈퇴";
    }
  }

  Color getProfileButtonColor() {
    switch (buttonType) {
      case ProfileButtonType.SeeMyReview:
        return Color(0xff000000);
      case ProfileButtonType.ServicePolicy:
        return Color(0xff000000);
      case ProfileButtonType.Inquiry:
        return Color(0xff000000);
      case ProfileButtonType.Logout:
        return Color(0xffF90707);
      case ProfileButtonType.MemberSecession:
        return Color(0xffF90707);
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () {},
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
        )
      ),
    );
  }
}
