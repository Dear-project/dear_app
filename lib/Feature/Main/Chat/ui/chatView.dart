import 'package:dear_app/Feature/Main/Chat/component/chatCell.dart';
import 'package:dear_app/Feature/Main/Chat/component/chatDragButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// class ChatView extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//         child: Text("챗뷰")
//     );
//   }
//
// }

class ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          ChatCell(),
          ChatCell(),
          ChatCell(),
        ],
      ),
    );
  }
}