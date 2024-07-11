import 'package:dear_app/Feature/Main/Chat/component/chat_drag_button.dart';
import 'package:dear_app/Feature/Main/Chat/model/room_response.dart';
import 'package:dear_app/Feature/Main/Chat/ui/in_chat_view.dart';
import 'package:dear_app/Shared/theme/dear_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatCell extends StatefulWidget {
  final RoomResponse model;
  ChatCell({super.key, required this.model});

  @override
  State<ChatCell> createState() => _ChatCellState();
}

class _ChatCellState extends State<ChatCell> {
  final ScrollController _scrollController = ScrollController();
  bool _onScrolling = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _scrollController.position.isScrollingNotifier.addListener(() {
        double offset = _scrollController.offset;
        double max = _scrollController.position.maxScrollExtent;

        setState(() {
          _onScrolling = true;
        });

        if (!_scrollController.position.isScrollingNotifier.value) {
          if (offset > max / 2) {
            _scrollController
                .animateTo(max,
                    duration: Duration(milliseconds: 200), curve: Curves.linear)
                .then((value) => setState(() {
                      _onScrolling = false;
                    }));
          } else {
            _scrollController
                .animateTo(0,
                    duration: Duration(milliseconds: 200), curve: Curves.linear)
                .then((value) => setState(() {
                      _onScrolling = false;
                    }));
          }
        } else {}
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
        ignoring: _onScrolling,
        child: SingleChildScrollView(
          padding: EdgeInsets.zero,
          controller: _scrollController,
          physics: ClampingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      Get.to(() => InChatView());
                    },
                    child: Container(
                      color: Colors.white,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              image: DearIcons.my.image,
                              width: 50,
                              height: 50,
                            ),
                            SizedBox(width: 20),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width * 0.68,
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          widget.model.chatName,
                                          style: TextStyle(
                                              fontFamily: "Pretendard",
                                              fontWeight: FontWeight.w500,
                                              fontSize: 17,
                                              color: Colors.black),
                                        ),
                                        Spacer(),
                                        Text(
                                          widget.model.lastMessageTimeStamp.split('T').first,
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          widget.model.lastMessage,
                                          style: TextStyle(
                                            fontFamily: "Pretendard",
                                            fontSize: 15,
                                            color: Color(0xff787878),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ]),
                    ),
                  )),
              ChatDragButton(buttonType: ChatDragButtonType.silent),
              ChatDragButton(buttonType: ChatDragButtonType.block),
              ChatDragButton(buttonType: ChatDragButtonType.exit),
            ],
          ),
        ));
  }
}
