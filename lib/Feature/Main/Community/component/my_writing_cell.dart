import 'package:dear_app/Shared/theme/dear_color.dart';
import 'package:dear_app/Shared/theme/dear_icons.dart';
import 'package:flutter/material.dart';

class MyWritingCell extends StatelessWidget {
  String name;

  MyWritingCell({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: DearColors.white,
      child: SizedBox(
        // width: MediaQuery.of(context).size.width,
        height: 97,
        child: Padding(
          padding: EdgeInsets.fromLTRB(27, 20, 27, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              DearIcons.communityProfile,
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 14),
                    child: Text(
                      name,
                      style: TextStyle(
                        fontFamily: "Pretendard",
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Text(
                    "내가 쓴 글 ${2}",
                    style: TextStyle(
                      fontFamily: "Pretendard",
                      fontSize: 13,
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
