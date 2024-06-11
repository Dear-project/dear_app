import 'package:dear_app/Shared/theme/dear_icons.dart';
import 'package:flutter/material.dart';

class InMentoringCell extends StatelessWidget {
  const InMentoringCell({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 22),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 27),
              child: Row(
                children: [
                  SizedBox(
                    width: 45,
                    height: 45,
                    child: DearIcons.communityProfile,
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "조영우",
                        style: TextStyle(
                            fontFamily: "Pretendard",
                            fontWeight: FontWeight.w700,
                            fontSize: 14),
                      ),
                      Text(
                        "영남이공대학 박승철 헤어과",
                        style: TextStyle(
                          fontFamily: "Pretendard",
                          fontSize: 10,
                          color: Color(0xff787878),
                        ),
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 10,
                            height: 12,
                            child: Transform.scale(
                              scale: 0.6,
                              child: DearIcons.book,
                            ),
                          ),
                          SizedBox(width: 2),
                          Text(
                            "전문과목 : 수능영어, 고등진로",
                            style: TextStyle(
                              fontFamily: "Pretendard",
                              fontSize: 8,
                              color: Color(0xff787878),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 22),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 27),
              child: Text(
                "해당 오류는 Optional 객체가 비어 있을 때 객체를 불러객체의 값을 찾지못해 그런데 이럴땐 Optional을 풀어 값이 없을 경우 null이 되도록 코드를 수정하면됩니다~~",
                style: TextStyle(
                  fontFamily: "Pretendard",
                  fontSize: 15,
                ),
              ),
            ),
            SizedBox(height: 17),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 27),
              child: Text(
                "2024.06.08. 오후 12:12",
                style: TextStyle(
                  fontFamily: "Pretendard",
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  color: Color(0xff787878),
                ),
              ),
            ),
            SizedBox(height: 17),
            ColoredBox(
              color: Color(0xffD1D1D1),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 0.5,
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(14, 8, 20, 8),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      print("답글 button clicked!");
                    },
                    style: IconButton.styleFrom(
                      minimumSize: Size.zero, // Set this
                      padding: EdgeInsets.zero, // and this
                    ),
                    constraints: BoxConstraints(),
                    icon: Transform.scale(
                      scale: 1.4,
                      child: DearIcons.communityChat,
                    ),
                  ),
                  Text(
                    "2",
                    style: TextStyle(
                      fontFamily: "Pretendard",
                      fontSize: 13,
                    ),
                  ),
                  Spacer(flex: 1),
                  SizedBox(
                    width: 20,
                    height: 40,
                    child: DearIcons.detail,
                  )
                ],
              ),
            ),
          ],
        ),
        ColoredBox(
          color: Color(0xffF4F5F9),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 8,
          ),
        ),
      ],
    );
  }
}
