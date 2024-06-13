import 'package:dear_app/Feature/Main/Chat/component/chat_drag_button.dart';
import 'package:dear_app/Feature/Main/Chat/ui/in_chat_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatCell extends StatefulWidget {
  ChatCell({super.key});

  // double x = 0.0;

  @override
  State<ChatCell> createState() => _ChatCellState();
}

class _ChatCellState extends State<ChatCell> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: ClampingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          MaterialButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => InChatView()));
            },
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(16))),
            child: SizedBox(
              height: 70,
              width: MediaQuery.of(context).size.width,
              child: ColoredBox(
                color: Colors.transparent,
                child: Row(
                  children: [
                    SizedBox(width: 27),
                    Transform.scale(
                      scale: 2.5,
                      child: Icon(
                        CupertinoIcons.person_crop_circle_fill,
                        color: Color(0xffD1D1D1),
                      ),
                    ),
                    SizedBox(width: 20),
                    Column(
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "이해준",
                              style: TextStyle(
                                  fontFamily: "Pretendard",
                                  fontWeight: FontWeight.w500,
                                  fontSize: 17),
                            ),
                            SizedBox(width: 10),
                            Text(
                              "영남이공대학 박승철 헤어과",
                              style: TextStyle(
                                fontFamily: "Pretendard",
                                fontSize: 11,
                                color: Color(0xffAAAAAA),
                              ),
                            ),
                            SizedBox(width: 78),
                            Text(
                              "어제",
                              style: TextStyle(
                                fontFamily: "Pretendard",
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff787878),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "하이",
                              style: TextStyle(
                                fontFamily: "Pretendard",
                                fontSize: 15,
                                color: Color(0xff787878),
                              ),
                            ),
                            SizedBox(width: 250),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          ChatDragButton(buttonType: ChatDragButtonType.silent),
          ChatDragButton(buttonType: ChatDragButtonType.block),
          ChatDragButton(buttonType: ChatDragButtonType.exit),
        ],
      ),
    );
  }
}

/*
Positioned(
          left: widget.x,
          top: 200,
          child: GestureDetector(
            onPanUpdate: (details) {
              setState(() {
                print("${widget.x}");
                if (widget.x > -195) {
                  if (details.delta.dx < 0) {
                    if (widget.x + details.delta.dx > -195) {
                      widget.x += details.delta.dx;
                    }
                  } else {
                    if (widget.x + details.delta.dx <= 0) {
                      widget.x += details.delta.dx;
                    }
                  }
                }
              });
            },
            child: Row(
              children: [
                // Padding(
                //   padding: EdgeInsets.symmetric(horizontal: 27, vertical: 10),
                //   child:
                // ),
                SizedBox(width: 27),
                SizedBox(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: ColoredBox(
                    color: Colors.transparent,
                    child: Row(
                      children: [
                        Transform.scale(
                          scale: 2.3,
                          child: Icon(
                            CupertinoIcons.person_crop_circle_fill,
                            color: Color(0xffD1D1D1),
                          ),
                        ),
                        SizedBox(width: 20),
                        Column(
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "이해준",
                                  style: TextStyle(
                                      fontFamily: "Pretendard",
                                      fontWeight: FontWeight.w500,
                                      fontSize: 17),
                                ),
                                SizedBox(width: 10),
                                Text(
                                  "영남이공대학 박승철 헤어과",
                                  style: TextStyle(
                                    fontFamily: "Pretendard",
                                    fontSize: 11,
                                    color: Color(0xffAAAAAA),
                                  ),
                                ),
                                SizedBox(width: 100),
                                Text(
                                  "어제",
                                  style: TextStyle(
                                    fontFamily: "Pretendard",
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xff787878),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 5),
                            Padding(
                              padding: EdgeInsets.only(right: 250),
                              child: Text(
                                "하이",
                                style: TextStyle(
                                  fontFamily: "Pretendard",
                                  fontSize: 15,
                                  color: Color(0xff787878),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                ChatDragButton(buttonType: ChatDragButtonType.silent),
                ChatDragButton(buttonType: ChatDragButtonType.block),
                ChatDragButton(buttonType: ChatDragButtonType.exit),
              ],
            ),
          ),
        )
 */
