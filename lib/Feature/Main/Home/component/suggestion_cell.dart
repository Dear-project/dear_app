import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SuggestionCell extends StatelessWidget {
  String title;
  Widget? leading;
  Widget? content;

  SuggestionCell({required this.title, this.leading, this.content});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: Container(
          height: 330,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: EdgeInsets.fromLTRB(25, 24, 25, 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [
                  Text(
                    title,
                    style: TextStyle(
                        fontFamily: "Pretendard",
                        fontWeight: FontWeight.w800,
                        fontSize: 20),
                  ),
                  Spacer(),
                  leading ?? Container()
                ]),
                content ?? Container()
              ],
            ),
          )),
    );
  }
}
