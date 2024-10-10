import 'package:dear_app/Feature/Main/Home/component/meal_cell.dart';
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
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  CupertinoButton(
                      padding: EdgeInsets.zero,
                      child: DearIcons.bell,
                      onPressed: () {}),
                  DearBadge()
                ],
              ),
            ),
          ),
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
                      "9월 26일 목요일",
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
              child: MealCell(),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(left: 35),
              child: MealCell(),
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
                "9월 27일 금요일",
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
              child: MealCell(),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(left: 35),
              child: MealCell(),
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
                "9월 27일 금요일",
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
              child: MealCell(),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(left: 35),
              child: MealCell(),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
