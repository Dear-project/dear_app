import 'package:dear_app/Feature/Auth/School/model/school_info.dart';
import 'package:dear_app/Feature/Main/Discover/model/university_response.dart';
import 'package:dear_app/Shared/theme/dear_icons.dart';
import 'package:dear_app/Shared/theme/dear_images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class UniversityCell extends StatelessWidget {
  SchoolInfo? schoolInfo;
  final Function? action;

  UniversityCell({this.schoolInfo, this.action});

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
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: DearImages.schoolPlaceholder.image,
                    ),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      schoolInfo != null ? schoolInfo!.schoolName : "",
                      style: TextStyle(
                          fontFamily: "Pretendard",
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Colors.black),
                    ),
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
              image: DearIcons.banner.toIcon().image,
              width: 12,
              height: 17,
            ),
            onPressed: () {
              print("찜하기 버튼 클릭됨");
            },
          ),
        )


      ],
    );
  }
}
