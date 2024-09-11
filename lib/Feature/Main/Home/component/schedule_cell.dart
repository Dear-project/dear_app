import 'package:dear_app/Feature/Main/Home/component/schedule_in_cell.dart';
import 'package:flutter/material.dart';

class ScheduleCell extends StatelessWidget {
  const ScheduleCell({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        height: 232,
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
                  Text(
                    "학사일정",
                    style: TextStyle(
                      fontFamily: "Pretendard",
                      fontWeight: FontWeight.w700,
                      fontSize: 12,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 22),
              ScheduleInCell(),
              SizedBox(height: 10),
              ScheduleInCell(),
              SizedBox(height: 10),
              ScheduleInCell(),
            ],
          ),
        ),
      ),
    );
  }
}
