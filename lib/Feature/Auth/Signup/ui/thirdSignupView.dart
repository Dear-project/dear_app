import 'package:dear_app/Feature/Auth/Shared/component/bottomButton.dart';
import 'package:dear_app/Feature/Auth/Signup/component/bottomDots.dart';
import 'package:dear_app/Feature/Auth/Signup/component/third/chk_auth_num_widget.dart';
import 'package:dear_app/Feature/Auth/Signup/component/third/req_auth_num_widget.dart';
import 'package:dear_app/Feature/Auth/Signup/component/third/input_auth_number_widget.dart';
import 'package:dear_app/Feature/Auth/Signup/component/third/input_email_widget.dart';
import 'package:dear_app/Feature/Auth/Signup/ui/signup_password_view.dart';
import 'package:dear_app/Feature/Auth/Signup/view_model/controller/signup_view_model.dart';
import 'package:dear_app/Shared/theme/dearColors.dart';
import 'package:dear_app/Shared/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:async';
import 'package:get/get.dart';

enum AuthStep { first, second, third }

class ThirdSignupView extends StatefulWidget {
  const ThirdSignupView({super.key});

  @override
  State<ThirdSignupView> createState() => _ThirdSignupViewState();
}

class _ThirdSignupViewState extends State<ThirdSignupView> {
  final _signupVM = Get.put(SignUpViewModel());

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
          leading: IconButton(
            onPressed: () {
              Get.back();
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
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
                  children: const [
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
                        InputEmailWidget(),
                      ],
                    ),
                  ),
                  Obx(() => Visibility(
                        visible: !_signupVM.isSentVerificationNumber.value
                            ? true
                            : false,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: ReqAuthNumWidget(
                            callback: () async {
                              if (_signupVM
                                  .emailController.value.text.isEmpty) {
                                return;
                              }
                              if (await _signupVM.requestEmailAuthNumber(
                                  email:
                                      _signupVM.emailController.value.text)) {
                                _startTimer();
                                _signupVM.isSentVerificationNumber.value = true;
                                Utils.toastMessage("인증 번호를 발송했습니다.");
                              }
                            },
                          ),
                        ),
                      ))
                ],
              ),
              SizedBox(height: 15),
              Obx(() => Visibility(
                  visible:
                      _signupVM.isSentVerificationNumber.value ? true : false,
                  child: Column(
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
                                InputAuthNumberWidget(),
                                Row(
                                  children: [
                                    Spacer(
                                      flex: 1,
                                    ),
                                    Text('${_seconds ~/ 60}:',
                                        style: TextStyle(
                                          height: 1.2,
                                          fontFamily: "Pretendard",
                                          color: DearColors.main,
                                          fontSize: 15,
                                        )),
                                    Text('${(_seconds % 60)}'.padLeft(2, "0"),
                                        style: TextStyle(
                                          height: 1.2,
                                          fontFamily: "Pretendard",
                                          color: DearColors.main,
                                          fontSize: 15,
                                        )),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 16),
                                      child: ChkAuthNumWidget(),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          // if (isAuthButtonClicked && !isAuthChecked)
                        ],
                      ),
                      SizedBox(height: 31),
                    ],
                  ))),
              Spacer(flex: 1),
              BottomDots(Dots.third),
              SizedBox(height: 30),
              BottomButton(action: () {
                if (_signupVM.isVerifiedEmailAddress.value) {
                  Get.to(() => const SignupPasswordView());
                } else {
                  Utils.snackBar('알림', '이메일 인증을 해주세요.');
                }
              }),
              SizedBox(height: 45),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();

  }
}
