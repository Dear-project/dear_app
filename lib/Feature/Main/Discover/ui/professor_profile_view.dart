import 'package:dear_app/Feature/Main/Chat/view_model/chat_view_model.dart';
import 'package:dear_app/Feature/Main/Discover/model/discover_response.dart';
import 'package:dear_app/Feature/Main/Discover/component/professor_profile_cell.dart';
import 'package:dear_app/Feature/Main/Discover/model/matching_request.dart';
import 'package:dear_app/Feature/Main/Discover/view_model/controller/discover_view_model.dart';
import 'package:dear_app/Feature/Main/Notification/components/notification_bell.dart';
import 'package:dear_app/Shared/theme/dear_color.dart';
import 'package:dear_app/Shared/theme/dear_icons.dart';
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
      backgroundColor: Color(0xffF4F5F9),
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0.0,
        leading: Padding(
          padding: EdgeInsets.only(left: 20.0),
          child: CupertinoButton(
              padding: EdgeInsets.zero,
              child: Image(
                image: DearIcons.arrowLeft.toIcon().image,
                width: 24,
                height: 24,
                fit: BoxFit.fitWidth,
                color: Colors.black,
              ),
              onPressed: () {
                Get.back();
              }),
        ),
        title: Text(
          professorInfo!.name,
          style: TextStyle(
              fontFamily: "Pretendard",
              fontWeight: FontWeight.w600,
              fontSize: 20),
        ),
        actions: [
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Container(
                  width: 22,
                  height: 25,
                  child: NotificationBell()
              )
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              height: context.height * 0.2,
              decoration: BoxDecoration(color: Colors.white),
              child: Column(
                children: [
                  SizedBox(height: 16),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 27),
                    child: Row(
                      children: [
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${professorInfo?.school ?? ""} ${professorInfo?.major ?? "컴퓨터공학과"}",
                              maxLines: 3,
                              style: TextStyle(
                                fontFamily: "Pretendard",
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                              ),
                            )
                          ],
                        )),
                        SizedBox(width: 20),
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: professorInfo?.profileImage != null
                                  ? NetworkImage(professorInfo!.profileImage!)
                                  : DearIcons.communityProfile.toIcon().image
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
          SizedBox(height: 12),
          Container(
              height: context.height * 0.3,
              decoration: BoxDecoration(color: Colors.white),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  children: [
                    Stack(
                      alignment: Alignment.bottomLeft,
                      children: [
                        Container(
                          height: 1,
                          decoration: BoxDecoration(color: Color(0xffD1D1D1)),
                          margin: EdgeInsets.only(bottom: 5),
                        ),
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 28),
                            child: CupertinoButton(
                                padding: EdgeInsets.zero,
                                onPressed: () {},
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Color(0xff0E2764),
                                              width: 3))),
                                  padding: EdgeInsets.only(bottom: 12),
                                  child: Text(
                                    "교수님 정보",
                                    style: TextStyle(
                                      color: Color(0xff0E2764),
                                      fontFamily: "Pretendard",
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                )))
                      ],
                    ),
                    Expanded(
                        child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 28),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "재직중인 대학",
                                  style: TextStyle(
                                      fontFamily: "Pretendard",
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700),
                                ),
                                ProfessorProfileCell(title: "대학명", content: professorInfo!.school ?? ""),
                                ProfessorProfileCell(title: "학과", content: professorInfo!.major ?? "컴퓨터공학과"),
                                ProfessorProfileCell(title: "이메일", content: professorInfo!.email ?? "")
                              ],
                            )))
                  ],
                ),
              ))
        ],
      ),
      bottomSheet: ColoredBox(
        color: DearColors.white,
        child: Padding(
          padding: EdgeInsets.only(bottom: 44),
          child: SizedBox(
            width: MediaQuery.of(context).size.width - 54,
            child: CupertinoButton(
                padding: EdgeInsets.zero,
                minSize: 56,
                onPressed: () {
                  if (professorInfo != null) {
                    _discoverVM.sendMatchingRequest(MatchingRequest(
                        subjectId: professorInfo!.userId));
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: DearColors.main,
                  ),
                  height: 56,
                  alignment: Alignment.center,
                  child: Text(
                    "노크하기",
                    style: TextStyle(
                      color: DearColors.white,
                      fontFamily: "Pretendard",
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                )),
          ),
        ),
      ),
    );
  }
}
