import 'package:dear_app/Feature/Main/Profile/component/profile_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Color(0xffF8F9F9),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ColoredBox(
              color: Color(0xffFFFFFF),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 210,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      // CupertinoIcons.profile_circled,
                      CupertinoIcons.person_crop_circle,
                      size: 120,
                      color: Color(0xffD1D1D1),
                    ),
                    Text(
                      "이해준",
                      style: TextStyle(
                          fontFamily: "Pretendard",
                          fontSize: 24,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                )
              ),
            ),
            ProfileButton(buttonType: ProfileButtonType.NotificationSettings),
            SizedBox(height: 10),
            ProfileButton(buttonType: ProfileButtonType.SeeMyReview),
            ProfileButton(buttonType: ProfileButtonType.ServicePolicy),
            ProfileButton(buttonType: ProfileButtonType.Inquiry),
            Divider(
              height: 1,
              color: Color(0xffE6E6E6),
            ),
            ProfileButton(buttonType: ProfileButtonType.Logout),
            ProfileButton(buttonType: ProfileButtonType.MemberSecession),
            Spacer(flex: 1),
          ],
        ),
      ),
    );
  }
}
