import 'package:dear_app/Feature/Main/Home/component/meal_view_cell.dart';
import 'package:dear_app/Feature/Main/Notification/components/notification_bell.dart';
import 'package:dear_app/Shared/component/dear_logo.dart';
import 'package:dear_app/Shared/theme/dear_badge.dart';
import 'package:dear_app/Shared/theme/dear_color.dart';
import 'package:dear_app/Shared/theme/dear_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MealView extends StatelessWidget {
  const MealView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DearColors.white,
      appBar: AppBar(
        toolbarHeight: 40,
        scrolledUnderElevation: 0.0,
        elevation: 0,
        title: Text(
          "식단표",
          style: TextStyle(
              fontFamily: "Pretendard",
              fontSize: 20,
              fontWeight: FontWeight.w600),
        ),
        backgroundColor: DearColors.white,
        actions: [
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Container(
                  width: 22,
                  height: 25,
                  child: NotificationBell()
              )
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 15),
            Padding(
                padding: const EdgeInsets.only(left: 35),
                child: Row(
                  children: [
                    Text(
                      "10월 23일 수요일",
                      style: TextStyle(
                        fontFamily: "Pretendard",
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Container(
                      width: 6,
                      height: 6,
                      decoration: BoxDecoration(
                        color: Color(0xffF90707),
                        shape: BoxShape.circle,
                      ),
                    )
                  ],
                )),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(left: 35),
              child: MealViewCell(
                mealTimeText: "아침",
                menu: [
                  ["퀴노아녹두죽", "크로와상샌드위치"],
                  [
                    "깍두기",
                    "그래놀라크랜베리아몬드",
                  ],
                  ["우유", "스테비아대추방울토마토"]
                ],
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(left: 35),
              child: MealViewCell(mealTimeText: "저녁", menu: [
                ["발아현미밥", "한국식마라탕"],
                ["석쇠불고기", "왕새우튀김"],
                ["타르타르소스", "배추김치"],
                ["오이고추된장무침"]
              ]),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Container(
                height: 1,
                color: Color(0xffd1d1d1),
              ),
            ),
            SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.only(left: 35),
              child: Text(
                "10월 24일 목요일",
                style: TextStyle(
                  fontFamily: "Pretendard",
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(left: 35),
              child: MealViewCell(mealTimeText: "아침", menu: [
                ["영양닭죽", "김부각"],
                ["어묵말이소떡꼬치", "석박지"],
                ["오레오오즈", "우유"],
                ["오렌지"]
              ]),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(left: 35),
              child: MealViewCell(mealTimeText: "점심", menu: [
                ["차슈덮밥", "맑은한우샤브샤브"],
                ["콩나물무침", "반고개무침납작만두"],
                ["배추김치", "청포도주스"]
              ]),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Container(
                height: 1,
                color: Color(0xffd1d1d1),
              ),
            ),
            SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.only(left: 35),
              child: Text(
                "10월 25일 금요일",
                style: TextStyle(
                  fontFamily: "Pretendard",
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(left: 35, top: 15, bottom: 10),
              child: Text(
                "급식이 없습니다.",
                style: TextStyle(
                  fontFamily: "Pretendard",
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Container(
                height: 1,
                color: Color(0xffd1d1d1),
              ),
            ),
            SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.only(left: 35),
              child: Text(
                "10월 26일 토요일",
                style: TextStyle(
                  fontFamily: "Pretendard",
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(left: 35, top: 15, bottom: 10),
              child: Text(
                "급식이 없습니다.",
                style: TextStyle(
                  fontFamily: "Pretendard",
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Container(
                height: 1,
                color: Color(0xffd1d1d1),
              ),
            ),
            SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.only(left: 35),
              child: Text(
                "10월 27일 일요일",
                style: TextStyle(
                  fontFamily: "Pretendard",
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(left: 35, top: 15, bottom: 10),
              child: Text(
                "급식이 없습니다.",
                style: TextStyle(
                  fontFamily: "Pretendard",
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Container(
                height: 1,
                color: Color(0xffd1d1d1),
              ),
            ),
            SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.only(left: 35),
              child: Text(
                "10월 28일 월요일",
                style: TextStyle(
                  fontFamily: "Pretendard",
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(left: 35),
              child: MealViewCell(mealTimeText: "아침", menu: [["현미밥", "갈릭허니브레드"], ["팽이미소된장국", "시금치무침"], ["지파이", "배추김치"]]),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(left: 35),
              child: MealViewCell(mealTimeText: "점심", menu: [["현미밥", "우육탕"], ["짜조", "마라샹궈"], ["나박김치"]]),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(left: 35),
              child: MealViewCell(mealTimeText: "저녁", menu: [["현미밥", "맑은쇠고기무국"], ["쑥갓두부무침", "오징어떡볶음"], ["배추김치", "비타500주스"]]),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Container(
                height: 1,
                color: Color(0xffd1d1d1),
              ),
            ),
            SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.only(left: 35),
              child: Text(
                "10월 29일 화요일",
                style: TextStyle(
                  fontFamily: "Pretendard",
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(left: 35),
              child: MealViewCell(mealTimeText: "아침", menu: [["참소라야채죽", "전남친베이글"], ["떡갈비구이", "배추김치"], ["고래밥시리얼", "우유"]]),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(left: 35),
              child: MealViewCell(mealTimeText: "점심", menu: [["혼합잡곡밥", "나가사끼짬뽕국"], ["온두부", "김치볶음"], ["연탄대패불고기", "깻잎김치"], ["요거트초코볼"]]),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(left: 35),
              child: MealViewCell(mealTimeText: "저녁", menu: [["흑미밥", "닭개장"], ["참나물사과무침", "눈꽃로제돈까스"], ["소스", "석박지"]]),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Container(
                height: 1,
                color: Color(0xffd1d1d1),
              ),
            ),
            SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.only(left: 35),
              child: Text(
                "10월 30일 수요일",
                style: TextStyle(
                  fontFamily: "Pretendard",
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(left: 35),
              child: MealViewCell(mealTimeText: "아침", menu: [["쇠고기야채죽", "불고기치즈파니니"], ["배추김치", "완숙토마토"], ["발사믹드레싱", "시리얼"], ["우유"]]),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(left: 35),
              child: MealViewCell(mealTimeText: "점심", menu: [["추가밥", "돈코츠라멘"], ["지코바숯불치킨", "오이생채"], ["배추김치", "감귤"]]),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(left: 35),
              child: MealViewCell(mealTimeText: "저녁", menu: [["현미밥", "돼지국밥"], ["김자반", "연어훈제"], ["타르타르소스", "석박지"], ["오렌지"]]),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Container(
                height: 1,
                color: Color(0xffd1d1d1),
              ),
            ),
            SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.only(left: 35),
              child: Text(
                "10월 31일 목요일",
                style: TextStyle(
                  fontFamily: "Pretendard",
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(left: 35),
              child: MealViewCell(mealTimeText: "아침", menu: [["나시고랭", "우동국"], ["북성로간장불고기", "깍두기"], ["치아바타샌드위치", "윌미니"]]),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(left: 35),
              child: MealViewCell(mealTimeText: "점심", menu: [["3구초밥", "후리카케멸치밥"], ["팽이미소된장국", "도라지오이무침"], ["닭꼬치", "타코야끼"], ["깍두기", "달밤라뗴"]]),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(left: 35),
              child: MealViewCell(mealTimeText: "저녁", menu: [["발아현미밥", "사각동태국"], ["단배추무침", "제육볶음"], ["배추김치", "초코칩트위스트"]]),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
