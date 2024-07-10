import 'package:dear_app/Shared/theme/dear_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
          scrolledUnderElevation: 0.0,
          leading: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child:
                Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
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
                    Navigator.pop(context);
                  }),
              SizedBox(width: 5),
              Image(
                image: DearIcons.my.image,
                width: 40,
                height: 40,
                fit: BoxFit.fitWidth,
              ),
              SizedBox(width: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "이해준",
                    style: TextStyle(
                        fontFamily: "Pretendard",
                        fontSize: 17,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    "영남이공대 펭귄과",
                    style: TextStyle(
                        fontFamily: "Pretendard",
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Color(0xffAAAAAA)),
                  )
                ],
              )
            ]),
          ),
          leadingWidth: double.infinity,
          actions: [
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Image(
                  image: DearIcons.detailVertical.image,
                  width: 29,
                  height: 30,
                  fit: BoxFit.fitWidth,
                ))
          ],
        ),
        body: Column(
          children: [
            Flexible(
                child: Center(
              child: Text("s"),
            )),
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
                        style:
                            TextStyle(fontFamily: "Pretendard", fontSize: 15),
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
