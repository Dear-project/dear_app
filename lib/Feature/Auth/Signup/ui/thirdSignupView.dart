import 'package:dear_app/Feature/Auth/Shared/component/bottomButton.dart';
import 'package:dear_app/Feature/Auth/Shared/component/dearTextField.dart';
import 'package:dear_app/Feature/Auth/Signup/component/dearTextFieldButton.dart';
import 'package:dear_app/Feature/Auth/Signup/ui/fourthSignupView.dart';
import 'package:dear_app/Shared/component/dearLogo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class ThirdSignupView extends StatefulWidget {
  ThirdSignupView({super.key});

  bool isAuthButtonClicked = false;
  bool? isAuthenticated;

  bool isRunning = false;
  Timer timer = Timer.periodic(Duration(seconds: 1), (timer) {});

  @override
  State<ThirdSignupView> createState() => _ThirdSignupViewState();
}

class _ThirdSignupViewState extends State<ThirdSignupView> {
  final _topTextEditController = TextEditingController();
  final _bottomTextEditController = TextEditingController();

  int _seconds = 300;

  void _startTimer() {
    widget.timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_seconds > 0) {
          _seconds--;
        }
      });
    });
  }

  void _resetTimer() {
    setState(() {
      _seconds = 300;
    });
  }

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
          ),
        ),
        body: Center(
          child: Column(
            children: [
              SizedBox(height: 50),
              DearLogo(size: 55),
              SizedBox(height: 21),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 36),
                child: Row(
                  children: [
                    Text(
                      "계정에 필요한\n정보를 입력해 주세요.",
                      style: TextStyle(
                        height: 1.2,
                        fontFamily: "Pretendard",
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Spacer(
                      flex: 1,
                    )
                  ],
                ),
              ),
              SizedBox(height: 45),
              Stack(
                alignment: Alignment.centerRight,
                children: [
                  DearTextField(TextFieldType.email, _topTextEditController),
                  if (!widget.isAuthButtonClicked)
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: DearTextFieldButton(
                        action: () {
                          _startTimer();
                          setState(() {
                            widget.isAuthButtonClicked = true;
                          });
                        },
                        buttonText: "인증요청",
                      ),
                    ),
                ],
              ),
              SizedBox(height: 15),
              widget.isAuthButtonClicked
                  ? Container(
                      width: 340,
                      height: 80,
                      child: Stack(
                        // alignment: Alignment.center,
                        children: [
                          if (widget.isAuthButtonClicked)
                            DearTextField(
                              TextFieldType.authCheck,
                              _bottomTextEditController,
                              showErrorText: widget.isAuthenticated,
                            ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(30, 20, 0, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Spacer(flex: 1),
                                Text('${_seconds ~/ 60}:',
                                    style: TextStyle(
                                      height: 1.2,
                                      fontFamily: "Pretendard",
                                      color: Color(0xff0E2764),
                                      fontSize: 15,
                                    )),
                                Text(
                                  '${(_seconds % 60)}'.padLeft(2, "0"),
                                  style: TextStyle(
                                    height: 1.2,
                                    fontFamily: "Pretendard",
                                    color: Color(0xff0E2764),
                                    fontSize: 15,
                                  ),
                                ),
                                SizedBox(width: 27),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  : SizedBox(height: 0, width: 0),
              SizedBox(height: 31),
              if (widget.isAuthButtonClicked)
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          CupertinoIcons.question_circle,
                          size: 9,
                        ),
                        SizedBox(width: 4),
                        Text(
                            style: TextStyle(
                              height: 1.2,
                              fontFamily: "Pretendard",
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                            ),
                            "인증에 어려움이 있나요?"),
                      ],
                    ),
                    SizedBox(height: 8),
                    TextButton(
                      style: TextButton.styleFrom(
                          minimumSize: Size.zero,
                          padding: EdgeInsets.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                      onPressed: () {
                        print("인증번호 재전송 버튼 클릭됨");
                        // 인증번호 재전송
                        _resetTimer();
                      },
                      child: Text(
                        style: TextStyle(
                            height: 1.2,
                            fontFamily: "Pretendard",
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff0E2764),
                            decoration: TextDecoration.underline),
                        "인증번호 재전송",
                      ),
                    )
                  ],
                ),
              Spacer(flex: 1),
              BottomButton(action: () {
                if (_bottomTextEditController.text == "123") {
                  setState(() {
                    widget.isAuthenticated = true;
                  });
                } else {
                  setState(() {
                    widget.isAuthenticated = false;
                  });
                }

                if (widget.isAuthenticated ?? false) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FourthSignupView()));
                }
              }),
              SizedBox(height: 45),
            ],
          ),
        ),
      ),
    );
  }
}
