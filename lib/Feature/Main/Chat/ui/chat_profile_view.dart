import 'package:dear_app/Feature/Main/Chat/component/chat_profile_item.dart';
import 'package:dear_app/Feature/Main/Chat/model/room_response.dart';
import 'package:dear_app/Feature/Main/Profile/component/dear_toggle_button.dart';
import 'package:dear_app/Shared/theme/dear_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatProfileView extends StatelessWidget {

  RoomResponse roomResponse;

  ChatProfileView({super.key, required this.roomResponse});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffF8F9F9),
        appBar: AppBar(
          scrolledUnderElevation: 0.0,
          backgroundColor: Color(0xffF8F9F9),
          leading: CupertinoButton(onPressed: () {
            Get.back();
          }, child: DearIcons.back.toIcon()),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(
                image: DearIcons.my.toIcon().image,
                fit: BoxFit.fill,
                width: 100,
                height: 100),
            SizedBox(height: 18),
            Text(
              roomResponse.chatName,
              style: TextStyle(
                  fontFamily: "Pretendard",
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                  color: Colors.black),
            ),
            Text("대구소프트웨어고등학교 컴퓨터소프트웨어과",
                style: TextStyle(
                    fontFamily: "Assistant",
                    fontSize: 15,
                    color: Color(0xffAAAAAA))),
            Padding(
                padding: EdgeInsets.symmetric(vertical: 30, horizontal: 70),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ChatProfileItem(
                      image: DearIcons.profile.toIcon(),
                      title: "프로필",
                    ),
                    ChatProfileItem(
                      image: DearIcons.banner.toIcon(fill: true),
                      title: "즐겨찾기",
                    ),
                    ChatProfileItem(
                      image: DearIcons.detailHorizontal.toIcon(),
                      title: "옵션",
                    )
                  ],
                )),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 26),
                child: Container(
                    height: 55,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16)),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("알림 숨기기",
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: "Pretendard",
                                fontSize: 15,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                          DearToggleButton()
                        ],
                      ),
                    )))
          ],
        ));
  }
}