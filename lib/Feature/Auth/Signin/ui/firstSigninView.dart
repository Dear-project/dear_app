import 'package:dear_app/Feature/Auth/Shared/component/dearTextField.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../Shared/component/dearLogo.dart';
import '../../Shared/component/bottomButton.dart';

class FirstSigninView extends StatefulWidget {
  FirstSigninView({super.key});

  final _topTextEditController = TextEditingController();
  final _bottomTextEditController = TextEditingController();

  bool showAlert = false;

  @override
  State<FirstSigninView> createState() => _FirstSigninViewState();
}

class _FirstSigninViewState extends State<FirstSigninView> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            backgroundColor: Colors.white,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                CupertinoIcons.chevron_left,
                color: Color(0xffAAAAAA),
                size: 30,
              ),
            )),
        body: Center(
          child: Column(
            children: [
              SizedBox(height: 50),
              DearLogo(size: 55),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 36),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "기다리고 있었어요!",
                      style: TextStyle(
                        height: 1.2,
                        fontFamily: "Pretendard",
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 45),
              DearTextField(TextFieldType.email, widget._topTextEditController),
              SizedBox(height: 15),
              DearTextField(TextFieldType.pw, widget._bottomTextEditController),
              Padding(
                padding: EdgeInsets.fromLTRB(30, 8, 30, 0),
                child: SizedBox(
                  height: 18,
                  child: TextButton(
                    style: TextButton.styleFrom(
                        minimumSize: Size.zero,
                        padding: EdgeInsets.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                    onPressed: () {},
                    child: Row(
                      children: [
                        if (widget.showAlert)
                          Text(
                            "이메일 또는 비밀번호가 올바르지 않습니다.",
                            style: TextStyle(
                              fontFamily: "Pretendard",
                              fontWeight: FontWeight.w600,
                              color: Color(0xffEA0C0C),
                              fontSize: 12,
                            ),
                          ),
                        Spacer(flex: 1),
                        Text(
                          style: TextStyle(
                              height: 1.2,
                              fontFamily: "Pretendard",
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff0E2764),
                              decoration: TextDecoration.underline),
                          "비밀번호 찾기",
                        ),
                        // SizedBox(width: 29),
                      ],
                    ),
                  ),
                ),
              ),
              Spacer(flex: 1),
              BottomButton(
                action: () {
                  // 이메일 비밀번호 오류
                  setState(() {
                    widget.showAlert = !widget.showAlert;
                  });
                  print("${widget.showAlert}");
                },
                buttonText: "로그인",
              ),
              SizedBox(height: 45),
            ],
          ),
        ),
      ),
    );
  }
}
