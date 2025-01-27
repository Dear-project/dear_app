import 'package:flutter/material.dart';

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
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 24),
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