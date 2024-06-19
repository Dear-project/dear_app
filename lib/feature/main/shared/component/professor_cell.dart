import 'package:dear_app/shared/theme/dear_icons.dart';
import 'package:flutter/material.dart';

class ProfessorCell extends StatelessWidget {
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
            ),
            SizedBox(width: 15,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "이해준",
                  style: TextStyle(
                      fontFamily: "Pretendard",
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Colors.black),
                ),

                Text(
                  "영남이공대학 박승철 헤어과",
                  style: TextStyle(
                      fontFamily: "Pretendard",
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff787878)),
                ),
                Row(
                  children: [
                    Image(
                      image: DearIcons.book.image,
                      width: 7,
                      height: 9,
                    ),
                    SizedBox(width: 2),
                    Text(
                      "전문과목 : 수능영어, 고등진로",
                      style: TextStyle(
                          fontFamily: "Pretendard",
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff787878)),
                    )
                  ],
                ),
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
