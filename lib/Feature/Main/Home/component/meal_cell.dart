import 'package:dear_app/Shared/theme/dear_icons.dart';
import 'package:flutter/material.dart';

class MealCell extends StatefulWidget {
  const MealCell({super.key});

  @override
  State<MealCell> createState() => _MealCellState();
}

class _MealCellState extends State<MealCell> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(25, 24, 25, 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image(
                    image: DearIcons.meal.toIcon().image,
                    width: 32,
                    height: 32,
                  ),
                  SizedBox(width: 8),
                  Text(
                    "오늘의 급식",
                    style: TextStyle(
                      fontFamily: "Pretendard",
                      fontWeight: FontWeight.w700,
                      fontSize: 19,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xffF7F8FA),
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 30, top: 22, bottom: 16),
                  child: Wrap(
                    children: [
                      for (var foods in [
                        ["발아현미밥", "왕새우튀김"],
                        ["한국식마라탕", "배추김치"],
                        ["석쇠불고기", "오이고추된장무침"],
                      ])
                        Row(
                          children: [
                            SizedBox(
                              width: 110,
                              child: Text(
                                "${foods.length < 1 ? "" : foods[0]}",
                                style: TextStyle(
                                  fontFamily: "Pretendard",
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  height: 1.2,
                                  color: Colors.black
                                ),
                              ),
                            ),
                            Text(
                              "${foods.length < 2 ? "" : foods[1]}",
                              style: TextStyle(
                                  fontFamily: "Pretendard",
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  height: 1.2,
                                  color: Colors.black
                              ),
                            ),
                          ],
                        ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "123kcal",
                            style: TextStyle(
                              fontFamily: "Pretendard",
                              fontWeight: FontWeight.w500,
                              fontSize: 9,
                              color: Color(0xff999999),
                            ),
                          ),
                          SizedBox(width: 24),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
