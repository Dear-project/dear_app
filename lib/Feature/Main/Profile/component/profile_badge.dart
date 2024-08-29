import 'package:flutter/cupertino.dart';

class ProfileBadge extends StatelessWidget {
  final String content;
  ProfileBadge({required this.content, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xffEBEFFF),
        borderRadius: BorderRadius.circular(7)
      ),
      child: Padding(
          padding: EdgeInsets.all(10),
          child: Text(content,
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