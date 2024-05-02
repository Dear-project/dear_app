import 'package:dear_app/Feature/Auth/Shared/component/bottomButton.dart';
import 'package:dear_app/Feature/Auth/Signup/component/bottomDots.dart';
import 'package:dear_app/Feature/Auth/Signup/component/dearTextFieldButton.dart';
import 'package:dear_app/Feature/Auth/Signup/component/dearTimer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';

enum AuthStep { first, second, third }

class ThirdSignupView extends StatefulWidget {
  const ThirdSignupView({super.key});

  @override
  State<ThirdSignupView> createState() => _ThirdSignupViewState();
}

class _ThirdSignupViewState extends State<ThirdSignupView> {
  bool isAuthButtonClicked = false;
  bool isAuthChecked = false;

  bool? isAuthenticated;

  AuthStep authStep = AuthStep.first;

  final _topTextEditController = TextEditingController();
  final _bottomTextEditController = TextEditingController();

  // 타이머
  int _seconds = 300;
  late Timer _timer;

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_seconds > 0) {
          _seconds--;
        }
      });
    });
  }

  Function getHint = (AuthStep authStep, String type) {
    String hint = "";
    switch (authStep) {
      case AuthStep.first:
        hint = (type == "top") ? "이메일" : "인증확인";
      case AuthStep.second:
        hint = (type == "top") ? "비밀번호" : "비밀번호 확인";
      case AuthStep.third:
        hint = (type == "top") ? "이름" : "생년월일";
    }
    return hint;
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: Icon(
            CupertinoIcons.chevron_left,
            color: Color(0xffAAAAAA),
            size: 30,
          ),
        ),
        body: Center(
          child: Column(
            children: [
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "DEAR",
                    style: TextStyle(
                      fontFamily: "Assistant",
                      fontWeight: FontWeight.w800,
                      fontSize: 55,
                      color: Color(0xff0E2764),
                    ),
                  ),
                  Text(
                    ".",
                    style: TextStyle(
                      fontFamily: "Assistant",
                      fontWeight: FontWeight.w800,
                      fontSize: 45,
                      color: Color(0xff0E2764),
                    ),
                  ),
                ],
              ),
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
                  Container(
                    width: 340,
                    height: 56,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        TextField(
                          controller: _topTextEditController,
                          onChanged: (value) {
                            print("${value}");
                          },
                          cursorColor: Color(0xff0E2764),
                          decoration: InputDecoration(
                            hintText: "${getHint(authStep, "top")}",
                            hintStyle: TextStyle(
                              height: 1.3,
                              fontFamily: "Pretendard",
                              fontSize: 17,
                              fontWeight: FontWeight.w300,
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xff0E2764), width: 0.0),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16)),
                                gapPadding: BorderSide.strokeAlignCenter),
                            enabledBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16)),
                              borderSide: BorderSide(
                                  color: Color(0xffC5D0DA), width: 1.0),
                            ),
                          ),
                          maxLines: 1,
                        ),
                      ],
                    ),
                  ),
                  if (!isAuthButtonClicked)
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: DearTextFieldButton(
                        action: () {
                          _startTimer();
                          setState(() {
                            isAuthButtonClicked = true;
                          });
                        },
                        buttonText: "인증요청",
                      ),
                    ),
                ],
              ),
              SizedBox(height: 15),
              isAuthButtonClicked
                  ? Column(
                      children: [
                        Stack(
                          alignment: Alignment.centerRight,
                          children: [
                            Container(
                              width: 340,
                              height: 56,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  if (isAuthenticated == null)
                                    TextField(
                                      controller: _bottomTextEditController,
                                      onChanged: (value) {
                                        print("${value}");
                                      },
                                      cursorColor: Color(0xff0E2764),
                                      decoration: InputDecoration(
                                        hintText:
                                            "${getHint(authStep, "bottom")}",
                                        hintStyle: TextStyle(
                                          height: 1.3,
                                          fontFamily: "Pretendard",
                                          fontSize: 17,
                                          fontWeight: FontWeight.w300,
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color(0xff0E2764),
                                                width: 0.0),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(16)),
                                            gapPadding:
                                                BorderSide.strokeAlignCenter),
                                        enabledBorder: const OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(16)),
                                          borderSide: BorderSide(
                                              color: Color(0xffC5D0DA),
                                              width: 1.0),
                                        ),
                                      ),
                                      maxLines: 1,
                                    ),
                                  if (isAuthenticated != null &&
                                      isAuthenticated!)
                                    TextField(
                                      controller: _bottomTextEditController,
                                      onChanged: (value) {
                                        print("${value}");
                                      },
                                      cursorColor: Color(0xff0E2764),
                                      decoration: InputDecoration(
                                        hintText:
                                            "${getHint(authStep, "bottom")}",
                                        hintStyle: TextStyle(
                                          height: 1.3,
                                          fontFamily: "Pretendard",
                                          fontSize: 17,
                                          fontWeight: FontWeight.w300,
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color(0xff0E2764),
                                                width: 0.0),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(16)),
                                            gapPadding:
                                                BorderSide.strokeAlignCenter),
                                        enabledBorder: const OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(16)),
                                          borderSide: BorderSide(
                                              color: Color(0xffC5D0DA),
                                              width: 1.0),
                                        ),
                                      ),
                                      maxLines: 1,
                                    ),
                                  if (isAuthenticated != null &&
                                      !isAuthenticated!)
                                    TextField(
                                      controller: _bottomTextEditController,
                                      onChanged: (value) {
                                        print("${value}");
                                      },
                                      cursorColor: Color(0xff0E2764),
                                      decoration: InputDecoration(
                                        hintText:
                                            "${getHint(authStep, "bottom")}",
                                        hintStyle: TextStyle(
                                          height: 1.3,
                                          fontFamily: "Pretendard",
                                          fontSize: 17,
                                          fontWeight: FontWeight.w300,
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color(0xffEA0C0C),
                                                width: 1.4),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(16)),
                                            gapPadding:
                                                BorderSide.strokeAlignCenter),
                                        enabledBorder: const OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(16)),
                                          borderSide: BorderSide(
                                              color: Color(0xffEA0C0C),
                                              width: 1),
                                        ),
                                      ),
                                      maxLines: 1,
                                    ),
                                  // if (TextFieldType.authCheck == TextFieldType.authCheck)
                                  if (authStep == AuthStep.first)
                                    Row(
                                      children: [
                                        Spacer(
                                          flex: 1,
                                        ),
                                        Text('${_seconds ~/ 60}:',
                                            style: TextStyle(
                                              height: 1.2,
                                              fontFamily: "Pretendard",
                                              color: Color(0xff0E2764),
                                              fontSize: 15,
                                            )),
                                        Text(
                                            '${(_seconds % 60)}'
                                                .padLeft(2, "0"),
                                            style: TextStyle(
                                              height: 1.2,
                                              fontFamily: "Pretendard",
                                              color: Color(0xff0E2764),
                                              fontSize: 15,
                                            )),
                                        SizedBox(width: 100),
                                      ],
                                    ),
                                ],
                              ),
                            ),
                            if (isAuthButtonClicked && !isAuthChecked)
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16),
                                child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      isAuthChecked = true;
                                      isAuthenticated =
                                          (_bottomTextEditController.text ==
                                                  "123")
                                              ? true
                                              : false;
                                    });
                                    if (_bottomTextEditController.text ==
                                        "123") {
                                      print("인증번호 맞음");
                                    } else {
                                      print("인증번호 틀림");
                                    }
                                    print("${isAuthenticated}");
                                  },
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: Size.zero,
                                    padding: EdgeInsets.zero,
                                    fixedSize: Size(73, 40),
                                    foregroundColor: Colors.white,
                                    backgroundColor: Color(0xff0E2764),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  child: Text(
                                    "인증확인",
                                    style: TextStyle(
                                      height: 1.2,
                                      fontFamily: "Pretendard",
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                        SizedBox(height: 31),
                      ],
                    )
                  : SizedBox(height: 0, width: 0),
              if (isAuthButtonClicked && authStep == AuthStep.first)
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
              BottomDots(Dots.third),
              SizedBox(height: 30),
              BottomButton(
                  action: () {
                print("${_topTextEditController.text}");
                _topTextEditController.text = "";

                print("${_bottomTextEditController.text.characters}");
                _bottomTextEditController.text = "";

                setState(() {
                  authStep = (authStep == AuthStep.first)
                      ? AuthStep.second
                      : AuthStep.third;
                });
              }),
              SizedBox(height: 45),
            ],
          ),
        ),
      ),
    );
  }
}
