import 'package:flutter/cupertino.dart';

class ProfileBadge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xffEBEFFF),
        borderRadius: BorderRadius.circular(7)
      ),
      child: Padding(
          padding: EdgeInsets.all(10),
          child: Text("대구소프트웨어마이스터고등학교",
            style: TextStyle(
              color: Color(0xff000000),
              fontFamily: "Pretendard",
              fontWeight: FontWeight.w500,
              fontSize: 15
            ),
          ),
    ));
  }

}