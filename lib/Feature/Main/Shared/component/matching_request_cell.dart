import 'package:dear_app/Shared/theme/dear_images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MatchingRequestCell extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
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
              image: null != null
                  ? null != null
                      ? NetworkImage("")
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
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              children: [
                Text(
                  "이름",
                  style: TextStyle(
                      fontFamily: "Pretendard",
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Colors.black),
                ),
                Text("영남이공대학"),
              ],
            ),
            Text(
              "하이",
              style: TextStyle(
                  fontFamily: "Pretendard",
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff787878)),
            ),
            Row(
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
                    onPressed: () {}),
                SizedBox(width: 5),
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
                    onPressed: () {})
              ],
            )
          ],
        ),
      ],
    );
  }
}
