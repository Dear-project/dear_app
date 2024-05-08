import 'package:dear_app/Feature/Auth/Shared/component/bottomButton.dart';
import 'package:dear_app/Feature/Auth/Signup/component/dearTextField.dart';
import 'package:dear_app/Feature/Auth/Signup/ui/fifthSignupView.dart';
import 'package:dear_app/Shared/component/dearLogo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FourthSignupView extends StatefulWidget {
  FourthSignupView({super.key});

  bool? isPwDifferent;
  bool isObscurePw = true;
  bool isObscurePwCheck = true;

  @override
  State<FourthSignupView> createState() => _FourthSignupViewState();
}

class _FourthSignupViewState extends State<FourthSignupView> {
  final _topTextEditController = TextEditingController();
  final _bottomTextEditController = TextEditingController();

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
                    Spacer(flex: 1),
                  ],
                ),
              ),
              SizedBox(height: 45),
              // DearTextField(
              //   TextFieldType.pw,
              //   _topTextEditController,
              // ),
              Container(
                width: 340,
                // height: 80,
                child: Stack(
                  // alignment: Alignment.center,
                  children: [
                    DearTextField(
                      TextFieldType.pw,
                      _topTextEditController,
                      showErrorText: widget.isObscurePw,
                      isObscureText: widget.isObscurePw,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Spacer(flex: 1),
                          IconButton(
                            // splashColor: Colors.transparent,
                            // highlightColor: Colors.transparent,
                            onPressed: () {
                              setState(() {
                                widget.isObscurePw = !widget.isObscurePw!;
                              });
                              print("${widget.isObscurePw}");
                            },
                            icon: Icon(
                              CupertinoIcons.eye_slash_fill,
                              color: Color(0xffAAAAAA),
                            ),
                          ),
                          SizedBox(width: 15),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              Container(
                width: 340,
                // height: 80,
                child: Stack(
                  // alignment: Alignment.center,
                  children: [
                    DearTextField(
                      TextFieldType.pwCheck,
                      _bottomTextEditController,
                      showErrorText: widget.isPwDifferent,
                      isObscureText: widget.isObscurePwCheck,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Spacer(flex: 1),
                          IconButton(
                            // splashColor: Colors.transparent,
                            // highlightColor: Colors.transparent,
                            onPressed: () {
                              setState(() {
                                widget.isObscurePwCheck = !widget.isObscurePwCheck!;
                              });
                              print("${widget.isObscurePw}");
                            },
                            icon: Icon(
                              CupertinoIcons.eye_slash_fill,
                              color: Color(0xffAAAAAA),
                            ),
                          ),
                          SizedBox(width: 15),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(flex: 1),
              BottomButton(action: () {
                if (_topTextEditController.text !=
                    _bottomTextEditController.text) {
                  setState(() {
                    widget.isPwDifferent = true;
                  });
                  print("비밀번호가 달라요!, ${widget.isPwDifferent}");
                } else {
                  setState(() {
                    widget.isPwDifferent = false;
                  });
                  print("비밀번호가 같아요!, ${widget.isPwDifferent}");
                }

                if (widget.isPwDifferent != null) {
                  if (!widget.isPwDifferent!) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FifthSignupView()));
                  }
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
