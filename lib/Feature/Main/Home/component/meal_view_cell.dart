import 'package:dear_app/Shared/theme/dear_color.dart';
import 'package:flutter/material.dart';

class MealViewCell extends StatefulWidget {
  String mealTimeText;
  List<List<String>> menu;

  MealViewCell({super.key, required this.mealTimeText, required this.menu});

  @override
  State<MealViewCell> createState() => _MealViewCellState();
}

class _MealViewCellState extends State<MealViewCell> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 323,
      height: widget.menu.length < 4 ? 88 : 102,
      decoration: BoxDecoration(
        color: DearColors.white,
        borderRadius: BorderRadius.all(Radius.circular(16)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 11, 15, 5),
            child: Row(
              children: [
                Text(
                  widget.mealTimeText,
                  style: TextStyle(
                    fontFamily: "Pretendard",
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                  ),
                ),
                Spacer(flex: 1),
                Text(
                  "608.19kcal",
                  style: TextStyle(
                    fontFamily: "Pretendard",
                    fontWeight: FontWeight.w500,
                    fontSize: 9,
                    color: Color(0xff999999),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, bottom: 16),
            child: Wrap(
              children: [
                for (var foods in widget.menu)
                Row(
                  children: [
                    SizedBox(
                      width: 110,
                      child: Text(
                        "${foods.length < 1 ? "" : foods[0]}",
                        style: TextStyle(
                          fontFamily: "Pretendard",
                          fontWeight: FontWeight.w500,
                          fontSize: 11,
                          height: 1.2,
                        ),
                      ),
                    ),
                    Text(
                      "${foods.length < 2 ? "" : foods[1]}",
                      style: TextStyle(
                        fontFamily: "Pretendard",
                        fontWeight: FontWeight.w500,
                        fontSize: 11,
                        height: 1.2,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
