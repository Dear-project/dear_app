import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatProfileItem extends StatelessWidget {
  Image image;
  String title;

  ChatProfileItem({super.key, required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: () {},
      child: Column(
        children: [
          Image(
            image: image.image,
            width: 22,
            height: 22,
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            title,
            style: TextStyle(
                fontFamily: "Pretendard", fontSize: 10, color: Colors.black),
          )
        ],
      ),
    );
  }
}