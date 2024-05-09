import 'package:dear_app/Feature/Auth/Shared/component/bottomButton.dart';
import 'package:dear_app/Feature/Auth/Signup/component/bottomDots.dart';
import 'package:dear_app/Feature/Auth/Signup/ui/secondSignupView.dart';
import 'package:dear_app/Shared/component/dearLogo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class FirstSignupView extends StatefulWidget {
  const FirstSignupView({super.key});

  @override
  State<FirstSignupView> createState() => _FirstSignupViewState();
}

class _FirstSignupViewState extends State<FirstSignupView> {
  var isClicked = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xffFFFFFF),
          actions: [
            IconButton(
                padding: EdgeInsets.symmetric(horizontal: 30),
                onPressed: () {
                  Get.back();
                },
                icon: Icon(CupertinoIcons.xmark,
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
              Spacer(flex: 1),

              BottomDots(Dots.first),
              SizedBox(
                height: 30,
              ),
              BottomButton(
                action: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SecondSignupView()));
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

class CustomCheckbox extends StatefulWidget {
  const CustomCheckbox({
    Key? key,
    this.width = 25.0,
    this.height = 25.0,
    this.color,
    this.iconSize = 18.0,
    this.onChanged,
    this.checkColor,
  }) : super(key: key);

  final double width;
  final double height;
  final Color? color;

  // Now you can set the checkmark size of your own
  final double? iconSize;
  final Color? checkColor;
  final Function(bool?)? onChanged;

  @override
  State<CustomCheckbox> createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      child: InkWell(
        radius: 16,
        onTap: () {
          setState(() => isChecked = !isChecked);
          widget.onChanged?.call(isChecked);
        },
        child: AnimatedContainer(
          duration: Duration(milliseconds: 100),
          curve: Easing.standard,
          // width: 25,
          // height: 25,
          width: isChecked ? 25 : 24,
          height: isChecked ? 25 : 24,
          // decoration: BoxDecoration(
          //   border: isChecked
          //       ? Border.all(color: Colors.green, width: 2)
          //       : Border.all(color: Colors.grey, width: 1.5),
          //   borderRadius: BorderRadius.circular(10),
          // ),
          decoration: BoxDecoration(
            border: Border.all(
              color: widget.color ?? Color(0xffC5D0DA),
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(16.0),
            color: isChecked ? Color(0xffE6EDF7) : Color(0xffF1F2F3),
          ),
          child: Container(
            width: widget.width,
            height: widget.height,
            // decoration: BoxDecoration(
            //   border: Border.all(
            //     color: widget.color ?? Color(0xffC5D0DA),
            //     width: 2.0,
            //   ),
            //   borderRadius: BorderRadius.circular(16.0),
            //   color: isChecked ? Color(0xffE6EDF7) : Color(0xffF1F2F3),
            // ),
            child: isChecked
                ? Icon(
                    Icons.check,
                    size: widget.iconSize,
                    color: widget.checkColor,
                  )
                : null,
          ),
        ),
      ),
    );
  }
}
