import 'package:dear_app/Feature/Main/Discover/model/university_response.dart';
import 'package:dear_app/Shared/theme/dear_icons.dart';
import 'package:dear_app/Shared/theme/dear_images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UniversityCell extends StatelessWidget {
  UniversityResponse? universityResponse;
  final Function? action;

  UniversityCell({ this.universityResponse, this.action});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CupertinoButton(
            padding: EdgeInsets.symmetric(horizontal: 27, vertical: 0),
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
                      image: universityResponse != null
                          ? universityResponse!.img != null
                          ? NetworkImage(universityResponse!.img!)
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      universityResponse != null ? universityResponse!.name : "",
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
        Row(
          children: [
            Spacer(),
            CupertinoButton(
              child: Image(
                image: DearIcons.banner.image,
                width: 12,
                height: 17,
              ),
              onPressed: () {
                print("찜하기 버튼 클릭됨");
              },
            ),
            SizedBox(width: 27),
          ],
        ),
      ],
    );
  }

}