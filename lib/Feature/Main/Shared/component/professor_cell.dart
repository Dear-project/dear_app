import 'package:dear_app/Feature/Main/Discover/model/discover_response.dart';
import 'package:dear_app/Shared/theme/dear_icons.dart';
import 'package:dear_app/Shared/theme/dear_images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProfessorCell extends StatelessWidget {
  DiscoverResponse? professorInfo;

  final Function? action;

  ProfessorCell({this.professorInfo, this.action});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CupertinoButton(
            padding: EdgeInsets.zero,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 75,
                  height: 75,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: professorInfo != null
                          ? professorInfo!.profileImage != null
                          ? NetworkImage(professorInfo!.profileImage!)
                          : DearImages.professorPlaceholder.image
                          : DearImages.professorPlaceholder.image,
                    ),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      professorInfo != null ? professorInfo!.name : "",
                      style: TextStyle(
                          fontFamily: "Pretendard",
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Colors.black),
                    ),
                    Text(
                      "${professorInfo?.school ?? ""}${professorInfo?.major ?? "컴퓨터공학과"}",
                      style: TextStyle(
                          fontFamily: "Pretendard",
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff787878)),
                    ),
                    SizedBox(height: 30),
                  ],
                ),
                Spacer(),
              ],
            ),
            onPressed: () {
              if (action != null) {
                action!();
              }
            }),
        Align(
          alignment: Alignment.centerRight,
          child: CupertinoButton(
            child: Image(
              image: DearIcons.banner.image,
              width: 12,
              height: 17,
            ),
            onPressed: () {
              print("찜하기 버튼 클릭됨");
            },
          ),
        ),
      ],
    );
  }
}