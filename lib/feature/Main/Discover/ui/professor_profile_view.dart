import 'package:dear_app/Feature/Main/Chat/model/room_request.dart';
import 'package:dear_app/Feature/Main/Chat/view_model/chat_view_model.dart';
import 'package:dear_app/Feature/Main/Discover/model/discover_response.dart';
import 'package:dear_app/Feature/Main/Discover/component/professor_profile_cell.dart';
import 'package:dear_app/Feature/Main/Discover/model/matching_request.dart';
import 'package:dear_app/Feature/Main/Discover/view_model/controller/discover_view_model.dart';
import 'package:dear_app/shared/theme/dear_color.dart';
import 'package:dear_app/shared/theme/dear_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfessorProfileView extends StatelessWidget {
  DiscoverResponse? professorInfo;
  final _discoverVM = Get.put(DiscoverViewModel());
  final _chatVM = Get.put(ChatViewModel());

  ProfessorProfileView({this.professorInfo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0.0,
        leading: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: CupertinoButton(
              padding: EdgeInsets.zero,
              child: Image(
                image: DearIcons.back.image,
                width: 36,
                height: 36,
                fit: BoxFit.fitWidth,
                color: Colors.black,
              ),
              onPressed: () {
                Get.back();
              }),
        ),
        title: Text(
          "교수 소개서",
          style: TextStyle(
              fontFamily: "Pretendard",
              fontWeight: FontWeight.w600,
              fontSize: 20),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 27),
            child: DearIcons.bell,
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 27),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${professorInfo != null ? professorInfo!.name : ""}",
                      style: TextStyle(
                        fontFamily: "Pretendard",
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      "${professorInfo?.school != null ? professorInfo!.school : ""}${professorInfo?.major != null ? " ${professorInfo!.major}" : ""}",
                      style: TextStyle(
                        fontFamily: "Pretendard",
                        fontSize: 12,
                        color: Color(0xff787878),
                      ),
                    ),
                  ],
                ),
                Spacer(flex: 1),
                DearIcons.communityProfile,
              ],
            ),
          ),
          // Padding(
          //   padding: EdgeInsets.symmetric(horizontal: 27),
          //   child: Row(
          //     children: [
          //       Transform.scale(
          //         scale: 0.3,
          //         child: DearIcons.book,
          //       ),
          //       Text(
          //         "전문과목 : 수능영어, 고등진로",
          //         style: TextStyle(
          //             fontFamily: "Pretendard",
          //             fontSize: 10,
          //             color: Color(0xff787878),
          //             height: 1.2),
          //       ),
          //     ],
          //   ),
          // ),
          // Padding(
          //   padding: EdgeInsets.symmetric(horizontal: 27),
          //   child: Text(
          //     "헤어 봉사하는것을 좋아합니다",
          //     style: TextStyle(
          //       fontFamily: "Pretendard",
          //       fontWeight: FontWeight.w700,
          //       fontSize: 13,
          //       color: Color(0xffAAAAAA),
          //     ),
          //   ),
          // ),
          // SizedBox(height: 36),
          // Padding(
          //   padding: EdgeInsets.symmetric(horizontal: 27),
          //   child: Text(
          //     "경력",
          //     style: TextStyle(
          //       fontFamily: "Pretendard",
          //       fontWeight: FontWeight.w700,
          //       fontSize: 20,
          //     ),
          //   ),
          // ),
          // SizedBox(height: 20),
          // SizedBox(
          //   height: 430,
          //   child: SingleChildScrollView(
          //     child: Column(
          //       children: [
          //         for (int i = 0; i < 20; i++)
          //           Padding(
          //             padding: EdgeInsets.symmetric(horizontal: 27),
          //             child: ProfessorProfileCell(),
          //           ),
          //       ],
          //     ),
          //   ),
          // ),
          Spacer(flex: 1),
        ],
      ),
      bottomSheet: ColoredBox(
        color: DearColors.white,
        child: Padding(
          padding: EdgeInsets.only(bottom: 44),
          child: SizedBox(
            width: MediaQuery.of(context).size.width - 54,
            child: CupertinoButton(
              onPressed: () {
                if (professorInfo != null) {
                  _chatVM.createRoom(RoomRequest(roomName: professorInfo!.name,
                      joinUserId: professorInfo!.professorId ?? 0));
                }
              },
              color: DearColors.main,
              child: Container(
                height: 20,
                alignment: Alignment.center,
                child: Text(
                  "채팅하기",
                  style: TextStyle(
                    fontFamily: "Pretendard",
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
