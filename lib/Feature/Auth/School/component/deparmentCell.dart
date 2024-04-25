import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class DeparmentCell extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("가정교육과", style:  TextStyle(
              fontFamily: "Pretendard",
              fontSize: 17,
              fontWeight: FontWeight.w600,
              color: Color(0xff787878)
          )
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
            child: Divider(
              color: Color(0xffD9D9D9),
            ),
          )

        ],
      ),
    );
  }

}