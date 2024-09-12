import 'package:dear_app/Feature/Main/Home/component/schedule_in_cell.dart';
import 'package:dear_app/Feature/Main/Home/model/schedule_response.dart';
import 'package:dear_app/Shared/theme/dear_icons.dart';
import 'package:dear_app/Shared/theme/dear_images.dart';
import 'package:flutter/material.dart';

class ScheduleCell extends StatefulWidget {
  List<ScheduleResponse>? list;

  ScheduleCell({super.key, required this.list});

  @override
  State<ScheduleCell> createState() => _ScheduleCellState();
}

class _ScheduleCellState extends State<ScheduleCell> {
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
                  Image(
                    image: DearIcons.calendar.image,
                    width: 32,
                    height: 32,
                  ),
                  SizedBox(width: 8),
                  Text(
                    "학사일정",
                    style: TextStyle(
                      fontFamily: "Pretendard",
                      fontWeight: FontWeight.w700,
                      fontSize: 19,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 22),
              if (widget.list != null)
                ...List.generate(
                  widget.list!.length <= 2 ? widget.list!.length : 2,
                  (index) => Column(
                    children: [
                      ScheduleInCell(
                        title: "${widget.list![index].scheduler}",
                        date: "${widget.list![index].date}",
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
