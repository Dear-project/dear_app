import 'package:dear_app/Feature/Main/Community/component/Mentoring/mentoring_context_cell.dart';
import 'package:dear_app/Feature/Main/Community/ui/mentoring/in_mentoring_view.dart';
import 'package:dear_app/Shared/theme/dearColors.dart';
import 'package:flutter/material.dart';

class MentoringCell extends StatelessWidget {
  const MentoringCell({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 14),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 27),
          child: MaterialButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => InMentoringView()));
            },
            minWidth: 0,
            height: 0,
            padding: EdgeInsets.zero,
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 18),
                  child: Text(
                    "Q.",
                    style: TextStyle(
                      fontFamily: "Pretendard",
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                      color: DearColors.main,
                    ),
                  ),
                ),
                SizedBox(width: 6),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "이거 어떻게해요?",
                      style: TextStyle(
                          fontFamily: "Pretendard",
                          fontWeight: FontWeight.w600,
                          fontSize: 17),
                    ),
                    Text(
                      "2024.6.8. 오후 2:11",
                      style: TextStyle(
                        fontFamily: "Pretendard",
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: Color(0xff787878),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 10),
        MentoringContextCell(),
        SizedBox(height: 14),
        ColoredBox(
          color: Color(0xffF4F5F9),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 8,
          ),
        ),
      ],
    );
  }
}
