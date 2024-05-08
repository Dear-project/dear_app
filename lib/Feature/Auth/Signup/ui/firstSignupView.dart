import 'package:dear_app/Feature/Auth/Signup/ui/secondSignupView.dart';
import 'package:dear_app/Shared/component/dearLogo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FirstSignupView extends StatelessWidget {
  var isClicked = false;

  FirstSignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xffFFFFFF),
          actions: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  CupertinoIcons.xmark,
                  size: 30,
                  color: Color(0xffAAAAAA),
                ),
              ),
            ),
          ],
        ),
        backgroundColor: Color(0xffFFFFFF),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DearLogo(size: 55),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 36),
                child: Row(
                  children: [
                    Text(
                      "서비스 이용을 위해\n이용약관 동의가 필요해요",
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
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 36),
                child: Row(
                  children: [
                    Text(
                      "전체동의",
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: "Pretendard",
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Spacer(
                      flex: 1,
                    ),
                    tosSelectButton(),
                  ],
                ),
              ),
              SizedBox(
                height: 9,
              ),
              Wrap(
                runSpacing: 17,
                children: [
                  Divider(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 36),
                    child: Row(
                      children: [
                        Text(
                          "이용약관 및 개인정보취급방침(필수)",
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: "Pretendard",
                            fontWeight: FontWeight.w700,
                            color: Color(0xff787878),
                          ),
                        ),
                        Spacer(
                          flex: 1,
                        ),
                        tosSelectButton(),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 36),
                    child: Row(
                      children: [
                        Text(
                          "만 14세 이상 확인(필수)",
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: "Pretendard",
                            fontWeight: FontWeight.w700,
                            color: Color(0xff787878),
                          ),
                        ),
                        Spacer(
                          flex: 1,
                        ),
                        tosSelectButton(),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 36),
                    child: Row(
                      children: [
                        Text(
                          "마케팅 활용 동의(선택)",
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: "Pretendard",
                            fontWeight: FontWeight.w700,
                            color: Color(0xff787878),
                          ),
                        ),
                        Spacer(
                          flex: 1,
                        ),
                        tosSelectButton(),
                      ],
                    ),
                  ),
                ],
              ),
              // CustomCheckbox(),
              const SizedBox(
                height: 160,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xff0E2764),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Container(
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xffD9D9D9),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Container(
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xffD9D9D9),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SecondSignupView()));
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(342, 56),
                  foregroundColor: Colors.white,
                  backgroundColor: Color(0xff0E2764),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: Text(
                  "다음",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class tosSelectButton extends StatefulWidget {
  const tosSelectButton({super.key});

  @override
  State<tosSelectButton> createState() => _tosSelectButtonState();
}

class _tosSelectButtonState extends State<tosSelectButton> {
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Transform.scale(
            scale: 1.4,
            child: Container(
              width: 25,
              height: 25,
              child: Checkbox(
                value: isClicked,
                onChanged: (bool? value) {
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
                splashRadius: 0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
