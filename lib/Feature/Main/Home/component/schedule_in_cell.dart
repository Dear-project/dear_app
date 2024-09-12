import 'package:dear_app/Shared/theme/dear_color.dart';
import 'package:flutter/material.dart';

class ScheduleInCell extends StatefulWidget {

  String title;
  String date;

  ScheduleInCell({required this.title, required this.date, super.key});

  @override
  State<ScheduleInCell> createState() => _ScheduleInCellState();
}

class _ScheduleInCellState extends State<ScheduleInCell> {
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
              "${widget.title}",
              style: TextStyle(
                fontFamily: "Pretendard",
                fontWeight: FontWeight.w700,
                fontSize: 12,
                color: Colors.black,
              ),
            ),
            Spacer(flex: 1),
            Text(
              "${widget.date}",
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
