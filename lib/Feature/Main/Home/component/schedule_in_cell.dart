import 'package:dear_app/Shared/theme/dear_color.dart';
import 'package:flutter/material.dart';

class ScheduleInCell extends StatelessWidget {
  const ScheduleInCell({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 41,
      decoration: BoxDecoration(
        color: Color(0xffF7F8FA),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 11),
        child: Row(
          children: [
            Text(
              "정보처리산업기사시험",
              style: TextStyle(
                fontFamily: "Pretendard",
                fontWeight: FontWeight.w700,
                fontSize: 12,
                color: Colors.black,
              ),
            ),
            Spacer(flex: 1),
            Text(
              "2024.9.04(수)",
              style: TextStyle(
                fontFamily: "Pretendard",
                fontWeight: FontWeight.w500,
                fontSize: 11,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
