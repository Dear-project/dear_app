import 'package:flutter/material.dart';

class ProfessorProfileCell extends StatelessWidget {
  const ProfessorProfileCell({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Text(
            "2021.02.02",
            style: TextStyle(
                fontFamily: "Pretendard",
                fontWeight: FontWeight.w600,
                fontSize: 13),
          ),
          Spacer(flex: 1),
          Text(
            "포항 제철고등학교 졸업",
            style: TextStyle(
                fontFamily: "Pretendard",
                fontWeight: FontWeight.w600,
                fontSize: 13),
          ),
        ],
      ),
    );
  }
}
