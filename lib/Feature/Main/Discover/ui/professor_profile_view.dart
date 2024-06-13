import 'package:dear_app/Feature/Main/Discover/component/professor_profile_cell.dart';
import 'package:dear_app/Shared/theme/dear_color.dart';
import 'package:dear_app/Shared/theme/dear_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfessorProfileView extends StatelessWidget {
  const ProfessorProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0.0,
        leading: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: CupertinoButton(
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
        ),
        title: Text(
          "교수 소개서",
          style: TextStyle(
              fontFamily: "Pretendard",
              fontWeight: FontWeight.w600,
              fontSize: 20),
        ),
        actions: [DearIcons.bell],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 27),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "이해준",
                      style: TextStyle(
                        fontFamily: "Pretendard",
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      "영남이공대학 박승철 헤어과 ",
                      style: TextStyle(
                        fontFamily: "Pretendard",
                        fontSize: 12,
                        color: Color(0xff787878),
                      ),
                    ),
                  ],
                ),
                Spacer(flex: 1),
                DearIcons.communityProfile,
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 27),
            child: Row(
              children: [
                Transform.scale(
                  scale: 0.3,
                  child: DearIcons.book,
                ),
                Text(
                  "전문과목 : 수능영어, 고등진로",
                  style: TextStyle(
                      fontFamily: "Pretendard",
                      fontSize: 10,
                      color: Color(0xff787878),
                      height: 1.2),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 27),
            child: Text(
              "헤어 봉사하는것을 좋아합니다",
              style: TextStyle(
                fontFamily: "Pretendard",
                fontWeight: FontWeight.w700,
                fontSize: 13,
                color: Color(0xffAAAAAA),
              ),
            ),
          ),
          SizedBox(height: 36),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 27),
            child: Text(
              "경력",
              style: TextStyle(
                fontFamily: "Pretendard",
                fontWeight: FontWeight.w700,
                fontSize: 20,
              ),
            ),
          ),
          SizedBox(height: 20),
          SizedBox(
            height: 430,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  for (int i = 0; i < 20; i++)
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 27),
                      child: ProfessorProfileCell(),
                    ),
                ],
              ),
            ),
          ),
          Spacer(flex: 1),
        ],
      ),
      bottomSheet: ColoredBox(
        color: DearColors.white,
        child: Padding(
          padding: EdgeInsets.only(bottom: 44),
          child: SizedBox(
            width: MediaQuery.of(context).size.width - 54,
            child: CupertinoButton(
              onPressed: () {
                print("채팅하기 button clicked!");
              },
              color: DearColors.main,
              child: Container(
                height: 20,
                alignment: Alignment.center,
                child: Text(
                  "채팅하기",
                  style: TextStyle(
                    fontFamily: "Pretendard",
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
