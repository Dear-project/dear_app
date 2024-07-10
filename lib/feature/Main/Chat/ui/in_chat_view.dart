import 'package:dear_app/Feature/Main/Chat/component/message_cell.dart';
import 'package:dear_app/Feature/Main/Chat/ui/chat_profile_view.dart';
import 'package:dear_app/Shared/theme/dear_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class InChatView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _InChatViewState();
}

class _InChatViewState extends State<InChatView> {
  final _textEditController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF1F1F1),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 50,
        scrolledUnderElevation: 0.0,
        title: CupertinoButton(
          onPressed: () {
            Get.bottomSheet(
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  clipBehavior: Clip.antiAlias,
                  height: MediaQuery.of(context).size.height * 0.9,
                  child: ChatProfileView()
                ),
              isScrollControlled: true
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "이해준",
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: "Pretendard",
                    fontSize: 18,
                    fontWeight: FontWeight.w700),
              ),
              Text(
                "영남이공대 펭귄과 ›",
                style: TextStyle(
                    fontFamily: "Pretendard",
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: Color(0xffAAAAAA)),
              ),
            ],
          ),
        ),
        leading: Padding(
          padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
          child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
            CupertinoButton(
                padding: EdgeInsets.zero,
                child: Image(
                  image: DearIcons.back.image,
                  width: 24,
                  height: 24,
                  fit: BoxFit.fitWidth,
                  color: Colors.black,
                ),
                onPressed: () {
                  Get.back();
                }),
          ]),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
                child: Column(
              children: [
                for (int i = 0; i < 20; i++) MessageCell(isSelf: i % 2 != 0, message: "${i}")
              ],
            )),
          ),
          ColoredBox(
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: Column(
                  children: [
                    CupertinoTextField(
                      minLines: 1,
                      maxLines: 4,
                      cursorColor: Colors.black,
                      controller: _textEditController,
                      autocorrect: false,
                      padding: EdgeInsets.all(25),
                      decoration: BoxDecoration(),
                      keyboardType: TextInputType.multiline,
                      placeholder: "메시지를 입력해보세요.",
                      style: TextStyle(fontFamily: "Pretendard", fontSize: 15),
                    ),
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25),
                        child: Row(
                          children: [
                            Image(
                              image: DearIcons.attach.image,
                              width: 26,
                              height: 26,
                              fit: BoxFit.fitWidth,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Image(
                              image: DearIcons.photo.image,
                              width: 26,
                              height: 26,
                              fit: BoxFit.fitWidth,
                            ),
                            Spacer(),
                            Image(
                              image: DearIcons.send.toFill(false).image,
                              width: 25,
                              height: 25,
                              fit: BoxFit.fitWidth,
                            )
                          ],
                        ))
                  ],
                ),
              ))
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        padding: EdgeInsets.zero,
        height: 0,
        color: Colors.white,
        elevation: 0.0,
      ),
    );
  }
}
