import 'package:dear_app/Feature/Main/Profile/component/profile_button.dart';
import 'package:dear_app/Shared/component/dearLogo.dart';
import 'package:dear_app/Shared/theme/dear_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF8F9F9),
      appBar: AppBar(
          leading: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: DearLogo()
          ),
        leadingWidth: 200,
      ),
      body: Center(
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
                    Image(
                      image: DearIcons.my.image,
                      fit: BoxFit.fill,
                      width: 100,

                      height: 100,
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
