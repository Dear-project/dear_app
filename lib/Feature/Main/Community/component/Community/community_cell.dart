import 'package:dear_app/Feature/Main/Community/ui/community/in_community_view.dart';
import 'package:dear_app/Shared/theme/dearColors.dart';
import 'package:dear_app/Shared/theme/dear_icons.dart';
import 'package:flutter/material.dart';

class CommunityCell extends StatelessWidget {
  const CommunityCell({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: MaterialButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => InCommunityView()));
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                Text(
                  "스프링부트 알려주실 분 찾습니다ㅜㅜ",
                  style: TextStyle(
                      fontFamily: "Pretendard",
                      fontSize: 17,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 5),
                Text(
                  "2024년 6월 8일 오후 2시 11분",
                  style: TextStyle(
                    fontFamily: "Pretendard",
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff787878),
                  ),
                ),
                SizedBox(height: 11),
                Text(
                  "지금 서버공부하고 싶은데 어떻게 시작하는지 모르겠어요ㅜㅜ스프링부트좀 알려주세요",
                  style: TextStyle(
                    fontFamily: "Pretendard",
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 11),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 27),
          child: Wrap(
            children: [
              ColoredBox(
                color: Color(0xffD1D1D1),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 0.5,
                ),
              ),
              SizedBox(height: 18),
              Row(
                children: [
                  SizedBox(
                    width: 14,
                    height: 14,
                    child: DearIcons.communityProfile,
                  ),
                  SizedBox(width: 7),
                  Text(
                    "박유현 • 2024.06.08",
                    style: TextStyle(
                      fontFamily: "Pretendard",
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      color: Color(0xff787878),
                    ),
                  ),
                  Spacer(flex: 1),
                  DearIcons.communityChat,
                  SizedBox(width: 5),
                  Text(
                    "2",
                    style: TextStyle(
                      fontFamily: "Pretendard",
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      color: Color(0xff787878),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 18),
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
