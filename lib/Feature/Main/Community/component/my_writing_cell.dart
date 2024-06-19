import 'package:dear_app/shared/theme/dear_icons.dart';
import 'package:flutter/material.dart';

class MyWritingCell extends StatelessWidget {
  const MyWritingCell({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Color(0xffF4F5F9),
      child: SizedBox(
        // width: MediaQuery.of(context).size.width,
        height: 81,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 27),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              DearIcons.communityProfile,
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "조영우",
                    style: TextStyle(
                      fontFamily: "Pretendard",
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 12),
                    child: Text(
                      "내가 쓴 글 ${2}",
                      style: TextStyle(
                        fontFamily: "Pretendard",
                        fontSize: 13,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
