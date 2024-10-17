import 'package:dear_app/Shared/theme/dear_color.dart';
import 'package:dear_app/Shared/theme/dear_icons.dart';
import 'package:flutter/material.dart';

class MyWritingCell extends StatelessWidget {
  final String name;

  MyWritingCell({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
        color: DearColors.white,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 16),
          child: ColoredBox(
              color: Color(0xffF4F5F9),
              child: Padding(
                  padding:
                  EdgeInsets.symmetric(vertical: 16, horizontal: 28),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image(
                        image: DearIcons.communityProfile.toIcon().image,
                        width: 45,
                        height: 45,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 14),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                name,
                                style: TextStyle(
                                  fontFamily: "Pretendard",
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                "내가 쓴 글 ${2}",
                                style: TextStyle(
                                  fontFamily: "Pretendard",
                                  fontSize: 13,
                                ),
                              ),
                            ]),
                      )
                    ],
                  ))),
        ));
  }
}
