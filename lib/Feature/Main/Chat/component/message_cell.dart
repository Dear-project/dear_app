import 'package:dear_app/Feature/Main/Chat/model/message_response.dart';
import 'package:dear_app/Shared/theme/dear_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MessageCell extends StatelessWidget {


  final MessageResponse message;
  final bool isSelf;

  MessageCell({super.key, required this.message, required this.isSelf});


  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment:
              isSelf ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: [
            if (!isSelf)
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 2, 20),
                child: Image(
                  image: DearIcons.my.toIcon().image,
                  width: 37,
                  height: 37,
                  fit: BoxFit.cover,
                ),
              ),
            if (isSelf)
              Text(
                message.getDate(),
                style: TextStyle(
                    color: Color(0xffAAAAAA),
                    fontFamily: "Pretendard",
                    fontSize: 10,
                    fontWeight: FontWeight.w400),
              ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (!isSelf)
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 4),
                        child: Text(
                          "민교수",
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: "Pretendard",
                              fontSize: 13,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    Row(children: [
                      Container(
                          decoration: BoxDecoration(
                              color: isSelf
                                  ? Color(0xffDDE6FB)
                                  : Color(0xffFFFFFF),
                              borderRadius: BorderRadius.circular(5)),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 7, horizontal: 10),
                            child: Text(
                              message.message,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Pretendard",
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400),
                            ),
                          )),
                    ])
                  ],
                )),
            if (!isSelf)
              Text(
                "오전 1:10",
                style: TextStyle(
                    color: Color(0xffAAAAAA),
                    fontFamily: "Pretendard",
                    fontSize: 10,
                    fontWeight: FontWeight.w400),
              ),
          ],
        ));
  }
}
