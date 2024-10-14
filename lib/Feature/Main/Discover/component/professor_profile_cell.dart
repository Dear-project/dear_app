import 'package:flutter/material.dart';

class ProfessorProfileCell extends StatelessWidget {
  String title;
  String content;

  ProfessorProfileCell({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(
                color: Color(0xff787878),
                fontFamily: "Pretendard",
                fontWeight: FontWeight.w600,
                fontSize: 16),
          ),
          SizedBox(width: 16),
          Text(
            content,
            style: TextStyle(
                color: Color(0xff333333),
                fontFamily: "Pretendard",
                fontWeight: FontWeight.w600,
                fontSize: 16),

          )
        ],
      ),
    );
  }
}
