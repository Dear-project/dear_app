import 'package:flutter/cupertino.dart';

class SchoolCell extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("대구소프트웨어마이스터고등학교", style:  TextStyle(
              fontFamily: "Pretendard",
              fontSize: 20,
              fontWeight: FontWeight.w700
          )),
          SizedBox(height: 8,),
          Text("대구광역시 달성 구지면 창리로11길 93", style: TextStyle(
            fontFamily: "Pretendard",
            fontSize: 15,
            fontWeight: FontWeight.w300
          ),)
        ],
      ),
    );
  }

}