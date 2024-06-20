import 'package:dear_app/Shared/theme/dear_icons.dart';
import 'package:flutter/material.dart';

class MentoringContextCell extends StatelessWidget {
  const MentoringContextCell({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 27),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          border: Border.all(
            style: BorderStyle.solid,
            color: Color(0xffD1D1D1),
          ),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(Radius.circular(7)),
        ),
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width - 54,
              height: 40,
              child: Text(
                "해당 오류는 Optional 객체가 비어 있을 때 객체를 불러 객체의 값을 찾지못해 그런데 이럴땐 Optional을 풀어서...",
                style: TextStyle(
                    fontFamily: "Pretendard",
                    fontWeight: FontWeight.w500,
                    fontSize: 14),
              ),
            ),
            SizedBox(height: 9),
            Row(
              children: [
                SizedBox(
                  width: 14,
                  height: 14,
                  child: DearIcons.communityProfile,
                ),
                SizedBox(width: 7),
                Text(
                  "조영우 • 2024.06.08 오후 3:28",
                  style: TextStyle(
                    fontFamily: "Pretendard",
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    color: Color(0xff787878),
                  ),
                ),
              ],
            ),
            SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}
