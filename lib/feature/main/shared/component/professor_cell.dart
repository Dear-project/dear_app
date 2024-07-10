import 'package:dear_app/Feature/Main/Discover/model/discover_response.dart';
import 'package:dear_app/Shared/theme/dear_icons.dart';
import 'package:dear_app/Shared/theme/dear_images.dart';
import 'package:flutter/material.dart';

class ProfessorCell extends StatelessWidget {
  DiscoverResponse? professorInfo;

  ProfessorCell({this.professorInfo});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 26),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 75,
              height: 75,
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  border: Border.all(color: Color(0xffD1D1D1)),
                  color: Colors.white),
              child: SizedBox(
                child: Image(
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${professorInfo != null ? professorInfo!.name : ""}",
                  style: TextStyle(
                      fontFamily: "Pretendard",
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Colors.black),
                ),
                Text(
                  "${professorInfo != null ? professorInfo!.school : ""} ${professorInfo != null ? professorInfo!.major : ""}",
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
            Image(
              image: DearIcons.banner.image,
              width: 12,
              height: 17,
            )
          ],
        ));
  }
}
