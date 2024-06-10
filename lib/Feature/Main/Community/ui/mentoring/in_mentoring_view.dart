import 'package:dear_app/Feature/Auth/Signup/component/dearTextFieldButton.dart';
import 'package:dear_app/Feature/Main/Community/component/Mentoring/in_mentoring_cell.dart';
import 'package:dear_app/Shared/theme/dearColors.dart';
import 'package:dear_app/Shared/theme/dear_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InMentoringView extends StatelessWidget {
  const InMentoringView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DearColors.white,
      appBar: AppBar(
        surfaceTintColor: DearColors.white,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CupertinoButton(
                  padding: EdgeInsets.zero,
                  child: Image(
                    image: DearIcons.back.image,
                    // 이 아이콘 피그마랑 다름. 추가해야함.
                    width: 36,
                    height: 36,
                    fit: BoxFit.fitWidth,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            ],
          ),
        ),
        leadingWidth: 64,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 27),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Q.",
                              style: TextStyle(
                                fontFamily: "Pretendard",
                                fontWeight: FontWeight.w700,
                                fontSize: 24,
                                color: DearColors.main,
                              ),
                            ), // 이 아이콘 추가하기
                            Text(
                              "이거 어떻게해요?",
                              style: TextStyle(
                                fontFamily: "Pretendard",
                                fontWeight: FontWeight.w700,
                                fontSize: 24,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 14),
                        Text(
                          "이해준 • 2024.6.8. 오후 2:11",
                          style: TextStyle(
                            fontFamily: "Pretendard",
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: Color(0xff787878),
                          ),
                        ),
                        SizedBox(height: 18),
                        Text(
                          "지금 서버공부 하고 있는데 무슨에러인지 모르겠어요~~!!ㅜㅜㅜ",
                          style: TextStyle(
                            fontFamily: "Pretendard",
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                        ),
                        // 게시물 이미지
                        SizedBox(height: 23),
                      ],
                    ),
                  ),
                  ColoredBox(
                    color: Color(0xffD1D1D1),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 0.5,
                    ),
                  ),
                  SizedBox(height: 15),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 27),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 17,
                          height: 17,
                          child: DearIcons.communityChat,
                        ),
                        Text("${2}"),
                        Spacer(flex: 1),
                        SizedBox(
                          width: 17,
                          height: 17,
                          child: DearIcons.detail,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  Column(
                    children: [
                      ColoredBox(
                        color: Color(0xffF4F5F9),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 8,
                        ),
                      ),
                      SizedBox(height: 12),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 27),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 30,
                              height: 30,
                              child: DearIcons.communityProfile,
                            ),
                            SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "김가영님,",
                                  style: TextStyle(
                                    fontFamily: "Pretendard",
                                    fontWeight: FontWeight.w500,
                                    fontSize: 11,
                                    color: Color(0xffAAAAAA),
                                  ),
                                ),
                                Text(
                                  "소중한 정보를 공유해 주세요.",
                                  style: TextStyle(
                                    fontFamily: "Pretendard",
                                    fontWeight: FontWeight.w600,
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                            Spacer(flex: 1),
                            Transform.scale(
                              scale: 0.8,
                              child: DearTextFieldButton(
                                  action: () {
                                    print("답변하기 button Clicked!");
                                  },
                                  buttonText: "답변하기"),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 12),
                      ColoredBox(
                        color: Color(0xffF4F5F9),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 8,
                        ),
                      ),
                      for (int i = 0; i < 10; i++) InMentoringCell(),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
