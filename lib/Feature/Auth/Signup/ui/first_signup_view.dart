import 'package:dear_app/Feature/Auth/Shared/component/bottom_button.dart';
import 'package:dear_app/Feature/Auth/Signup/component/check_toggle.dart';
import 'package:dear_app/Feature/Auth/Signup/ui/second_signup_view.dart';
import 'package:dear_app/Shared/component/dear_logo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class FirstSignupView extends StatefulWidget {
  FirstSignupView({super.key});

  Map<String, bool> terms = {"a": false, "b": false, "c": false};

  bool entireTerms = false;

  bool get getEntireTerm {
    return terms["a"]! && terms["b"]! && terms["c"]!;
  }

  // set setEntireTerm(bool value) {
  //  terms = terms.values.map((e) => e = value) + terms]ys;
  // }

  @override
  State<FirstSignupView> createState() => _FirstSignupViewState();

}

class _FirstSignupViewState extends State<FirstSignupView> {

  @override
  void setState(VoidCallback fn) {
    super.setState((fn));
    // setState(() {
    //   widget.entireTerms = widget.getEntireTerm;
    // });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xffFFFFFF),
          actions: [
            CupertinoButton(
                padding: EdgeInsets.symmetric(horizontal: 30),
                onPressed: () {
                  Get.back();
                },
                child: Icon(CupertinoIcons.xmark,
                    size: 30, color: Color(0xffAAAAAA)))
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
                    CheckToggle(
                      toggle: widget.entireTerms,
                      onPressed: () {
                        setState(() {
                           widget.entireTerms = !widget.entireTerms;
                           widget.terms.updateAll((key, value) => value = widget.entireTerms);
                        });
                      },
                    ),
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
                        CheckToggle(
                          toggle: widget.terms["a"]!,
                          onPressed: () {
                            setState(() {
                              widget.terms["a"] = !widget.terms["a"]!;
                              widget.entireTerms = (widget.terms.values.skipWhile((val) => val == true).isEmpty) ? true : false;
                            });
                          },
                        ),
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
                        CheckToggle(
                          toggle: widget.terms["b"]!,
                          onPressed: () {
                            setState(() {
                              widget.terms["b"] = !widget.terms["b"]!;
                              widget.entireTerms = (widget.terms.values.skipWhile((val) => val == true).isEmpty) ? true : false;
                            });
                          },
                        ),
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
                        CheckToggle(
                          toggle: widget.terms["c"]!,
                          onPressed: () {
                            setState(() {
                              widget.terms["c"] = !widget.terms["c"]!;
                              widget.entireTerms = (widget.terms.values.skipWhile((val) => val == true).isEmpty) ? true : false;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Spacer(flex: 1),
              SizedBox(
                height: 30,
              ),
              BottomButton(
                action: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SecondSignupView()));
                },
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          elevation: 0.0,
          color: Colors.white,
          height: 30,
        ),
      ),
    );
  }
}
