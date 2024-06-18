import 'package:dear_app/Feature/Main/Chat/component/chat_profile_item.dart';
import 'package:dear_app/Feature/Main/Profile/component/dear_toggle_button.dart';
import 'package:dear_app/Shared/theme/dear_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF8F9F9),
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
        backgroundColor: Color(0xffF8F9F9),
        leading: CupertinoButton(
          onPressed: () {

          },
          child: DearIcons.back
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(
                image: DearIcons.my.image,
                fit: BoxFit.fill,
                width: 100,
                height: 100
            ),
            Text("이해준",
              style: TextStyle(
                  fontFamily: "Pretendard",
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                  color: Colors.black
              ),
            ),
            Text("영남이공대학 박승철 헤어과",
              style: TextStyle(
                fontFamily: "Assistant",
                fontSize: 15,
                color: Color(0xffAAAAAA)
              )
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 70
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ChatProfileItem(
                    image: DearIcons.profile,
                    title: "프로필",
                  ),
                  ChatProfileItem(
                    image: DearIcons.banner.toFill(true),
                    title: "즐겨찾기",
                  ),
                  ChatProfileItem(
                    image: DearIcons.detailH,
                    title: "옵션",
                  )

                ],
              )
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 26),
              child: Container(
                  height: 55,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16)
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("알림 숨기기"),
                        DearToggleButton()
                      ],
                    ),
                  )
              )
            )


          ],
        )
      )
    );
  }

}