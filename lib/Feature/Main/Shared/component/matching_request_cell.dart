import 'package:dear_app/Shared/theme/dear_icons.dart';
import 'package:dear_app/Shared/theme/dear_images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MatchingRequestCell extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          width: 50,
          height: 50,
          fit: BoxFit.fill,
          image: null != null
              ? null != null
                  ? NetworkImage("")
                  : DearIcons.my.toIcon().image
              : DearIcons.my.toIcon().image,
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
                      "이름",
                      style: TextStyle(
                          fontFamily: "Pretendard",
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                    SizedBox(width: 10),
                    Text(
                      "영남이공대학",
                      style: TextStyle(
                        color: Color(0xffAAAAAA),
                        fontFamily: "Pretendard",
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  "하이",
                  style: TextStyle(
                      fontFamily: "Pretendard",
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff787878)),
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
                        onPressed: () {}),
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
            )
        ),
      ],
    );
  }
}
