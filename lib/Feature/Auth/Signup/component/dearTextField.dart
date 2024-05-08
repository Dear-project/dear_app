import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum TextFieldType { email, authCheck, pw, pwCheck, name, birth }

class DearTextField extends StatefulWidget {
  final TextFieldType textFieldType;
  final _TextEditController;

  bool isObscureText;

  bool? showErrorText;

  DearTextField(this.textFieldType, this._TextEditController,
      {this.isObscureText = false, this.showErrorText = null});

  @override
  State<DearTextField> createState() => _DearTextFieldState();
}

class _DearTextFieldState extends State<DearTextField> {
  @override
  void dispose() {
    widget._TextEditController.dispose();
    super.dispose();
  }

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

  _DearTextFieldState();

  String getHint(TextFieldType type) {
    String hintText = "";
    switch (type) {
      case TextFieldType.email:
        hintText = "이메일";
      case TextFieldType.authCheck:
        hintText = "인증확인";
      case TextFieldType.pw:
        hintText = "비밀번호";
      case TextFieldType.pwCheck:
        hintText = "비밀번호 확인";
      case TextFieldType.name:
        hintText = "이름";
      case TextFieldType.birth:
        hintText = "생년월일";
    }
    return hintText;
  }

  String? checkErrorText() {
    switch (widget.textFieldType) {
      case TextFieldType.authCheck:
        if (widget.showErrorText != null) {
          if (!widget.showErrorText!) {
            return "인증번호가 옳지 않습니다.";
          }
        }
      case TextFieldType.pwCheck:
        if (widget.showErrorText != null) {
          if (widget.showErrorText!) {
            return "비밀번호가 일치하지 않습니다.";
          }
        }
      default:
        return null;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 340,
      child: Stack(
        alignment: Alignment.center,
        children: [
          (widget.textFieldType == TextFieldType.authCheck ||
                  widget.textFieldType == TextFieldType.pwCheck)
              ? TextFormField(
                  controller: widget._TextEditController,
                  autovalidateMode: AutovalidateMode.always,
                  onChanged: (value) {
                    setState(() {});
                    print("${widget.showErrorText}");
                    debugPrint('change $value');
                  },
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    fontFamily: "Pretendard",
                  ),
                  cursorColor: Color(0xff0E2764),
                  obscureText: widget.isObscureText ?? false,
                  decoration: InputDecoration(
                    hintText: "${getHint(widget.textFieldType)}",
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                    hintStyle: TextStyle(
                      height: 1.3,
                      fontFamily: "Pretendard",
                      fontSize: 17,
                      fontWeight: FontWeight.w300,
                    ),
                    errorText: checkErrorText(),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      borderSide:
                          BorderSide(color: Color(0xffEA0C0C), width: 1.0),
                      gapPadding: BorderSide.strokeAlignCenter,
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xffEA0C0C), width: 1.2),
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        gapPadding: BorderSide.strokeAlignCenter),
                    errorStyle: const TextStyle(
                      fontFamily: "Pretendard",
                      fontWeight: FontWeight.w600,
                      color: Color(0xffEA0C0C),
                      fontSize: 12,
                    ),
                    errorMaxLines: 1,
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xff0E2764), width: 0.0),
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        gapPadding: BorderSide.strokeAlignCenter),
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      borderSide:
                          BorderSide(color: Color(0xffC5D0DA), width: 1.0),
                    ),
                  ),
                  maxLines: 1,
                )
              : TextField(
                  controller: widget._TextEditController,
                  onChanged: (value) {
                    print("${widget.showErrorText}");
                    print("${value}");
                  },
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    fontFamily: "Pretendard",
                  ),
                  cursorColor: Color(0xff0E2764),
                  obscureText: widget.isObscureText ?? false,
                  decoration: InputDecoration(
                    hintText: "${getHint(widget.textFieldType)}",
                    hintStyle: TextStyle(
                      height: 1.3,
                      fontFamily: "Pretendard",
                      fontSize: 17,
                      fontWeight: FontWeight.w300,
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xff0E2764), width: 0.0),
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        gapPadding: BorderSide.strokeAlignCenter),
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      borderSide: BorderSide(
                        color: Color(0xffC5D0DA),
                        width: 1.0,
                      ),
                    ),
                  ),
                  maxLines: 1,
                )
        ],
      ),
    );
  }
}
