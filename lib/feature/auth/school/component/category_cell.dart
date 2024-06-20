import 'package:flutter/cupertino.dart';

class CategoryCell extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 25),
        child: Text(
          "인문계열",
          style: TextStyle(
              fontFamily: "Pretendard",
              fontSize: 17,
              fontWeight: FontWeight.w500),
        ));
  }
}
