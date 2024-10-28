import 'package:dear_app/Feature/Main/Discover/model/matching_request.dart';
import 'package:dear_app/Feature/Main/Discover/model/matching_response.dart';
import 'package:dear_app/Feature/Main/Discover/view_model/controller/discover_view_model.dart';
import 'package:dear_app/Shared/theme/dear_icons.dart';
import 'package:dear_app/Shared/theme/dear_images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MatchingRequestCell extends StatelessWidget {

  final _discoverVM = Get.put(DiscoverViewModel());

  MatchingResponse model;

  MatchingRequestCell({required this.model});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
                image: model.userProfileImage != null
                    ? NetworkImage(model.userProfileImage!)
                    : DearIcons.my.toIcon().image
            )
          ),
        ),
        SizedBox(
          width: 15,
        ),
        Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  children: [
                    Text(
                      model.userName,
                      style: TextStyle(
                          fontFamily: "Pretendard",
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                    SizedBox(width: 10),
                    Text(
                      "${model?.schoolName?.padRight(model!.schoolName!.length + 1) ?? ""}${model?.majorName ?? "컴퓨터공학과"}",
                      style: TextStyle(
                        color: Color(0xffAAAAAA),
                        fontFamily: "Pretendard",
                        fontSize: 11,
                        overflow: TextOverflow.ellipsis
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CupertinoButton(
                        minSize: 8,
                        padding: EdgeInsets.zero,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color(0xffEBEFFF),
                              borderRadius: BorderRadius.circular(10)),
                          padding:
                          EdgeInsets.symmetric(horizontal: 40, vertical: 8),
                          child: Text(
                            "수락하기",
                            style: TextStyle(
                                fontFamily: "Pretendard",
                                fontSize: 15,
                                color: Color(0xff0E2764),
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        onPressed: () {
                          _discoverVM.acceptMatchingRequest(
                            MatchingRequest(subjectId: model.userId)
                          );
                        }),
                    CupertinoButton(
                        minSize: 8,
                        padding: EdgeInsets.zero,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color(0xffFFE0E0),
                              borderRadius: BorderRadius.circular(10)),
                          padding:
                          EdgeInsets.symmetric(horizontal: 40, vertical: 8),
                          child: Text(
                            "거절하기",
                            style: TextStyle(
                                fontFamily: "Pretendard",
                                fontSize: 15,
                                color: Color(0xff9F0000),
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        onPressed: () {
                          _discoverVM.rejectMatchingRequest(
                              MatchingRequest(subjectId: model.userId)
                          );
                        })
                  ],
                )
              ],
            )
        ),
      ],
    );
  }
}
