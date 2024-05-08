import 'package:dear_app/Feature/Auth/Signup/ui/thirdSignupView.dart';
import 'package:dear_app/Shared/component/dearLogo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../Shared/component/bottomButton.dart';

class SecondSignupView extends StatelessWidget {
  const SecondSignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xffFFFFFF),
        appBar: AppBar(
            backgroundColor: Color(0xffFFFFFF),
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // SizedBox(height: 50),
              DearLogo(size: 55),
              SizedBox(height: 40),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 36),
                child: Row(
                  children: [
                    Text(
                      "회원 타입을 선택해 주세요.",
                      style: TextStyle(
                          fontSize: 22,
                          fontFamily: "Pretendard",
                          fontWeight: FontWeight.w700),
                    ),
                    Spacer(flex: 1)
                  ],
                ),
              ),
              SizedBox(height: 55),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  typeSelectButton("학생"),
                  SizedBox(width: 8),
                  typeSelectButton("교수"),
                ],
              ),
              Spacer(flex: 1),
              BottomButton(
                action: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ThirdSignupView()));
                },
              ),
              SizedBox(height: 45),
            ],
          ),
        ),
      ),
    );
  }
}

class typeSelectButton extends StatefulWidget {
  final String text;

  typeSelectButton(this.text, {super.key});

  @override
  State<typeSelectButton> createState() => _typeSelectButtonState(text);
}

class _typeSelectButtonState extends State<typeSelectButton> {
  bool isClicked = false;
  final String text;

  _typeSelectButtonState(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 165,
      height: 260,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Color(isClicked ? 0xffEBEFFF : 0xffF4F5F9),
        border: Border.all(color: Color(isClicked ? 0xff0E2764 : 0xffC5D0DA)),
      ),
      child: Column(
        children: [
          SizedBox(height: 3),
          Transform.scale(
              scale: 1.4,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 18),
                child: Row(
                  children: [
                    Checkbox(
                      value: isClicked,
                      onChanged: (value) {
                        setState(() {
                          isClicked = value!;
                        });
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      side: MaterialStateBorderSide.resolveWith(
                        (states) => BorderSide(color: Color(0xffC5D0DA)),
                      ),
                      fillColor: MaterialStatePropertyAll(
                          Color(isClicked ? 0xffE6EDF7 : 0xffF1F2F3)),
                      checkColor: Color(0xff0E2764),
                    ),
                    Spacer(flex: 1),
                  ],
                ),
              )),
          SizedBox(height: 130),
          Text(
            "$text",
            style: TextStyle(
              fontFamily: "Pretendard",
              fontWeight: FontWeight.w700,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
