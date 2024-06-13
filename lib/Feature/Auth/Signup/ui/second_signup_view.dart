import 'package:dear_app/Feature/Auth/Signup/component/third/select_type_widget.dart';
import 'package:dear_app/Feature/Auth/Signup/ui/third_signup_view.dart';
import 'package:dear_app/Feature/Auth/Signup/view_model/signup_view_model.dart';
import 'package:dear_app/Shared/enums/user_type.dart';
import 'package:dear_app/Shared/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../../Shared/component/bottom_button.dart';

class SecondSignupView extends StatefulWidget {
  const SecondSignupView({super.key});

  @override
  State<SecondSignupView> createState() => _SecondSignupViewState();
}

class _SecondSignupViewState extends State<SecondSignupView> {
  final _loginVM = Get.put(SignUpViewModel());
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xffFFFFFF),
        appBar: AppBar(
          scrolledUnderElevation: 0.0,
          elevation: 0.0,
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
              SizedBox(height: 40),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 36),
                child: Row(
                  children: const [
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
                  SelectTypeWidget(userType: UserType.STUDENT),
                  // TypeSelectButton("학생"),
                  SizedBox(width: 8),
                  SelectTypeWidget(userType: UserType.PROFESSOR),
                  // TypeSelectButton("교수"),
                ],
              ),
              SizedBox(
                height: 87,
              ),
              SizedBox(height: 30),
              BottomButton(action: (){
                if(_loginVM.type.value == null){
                  Utils.snackBar('알림', '회원 타입을 선택해 주세요.');
                  return;
                }
                Get.to(() => ThirdSignupView());
              },),
            ],
          ),
        ),
      ),
    );
  }
}

class TypeSelectButton extends StatefulWidget {
  final String text;

  TypeSelectButton(this.text, {super.key});

  @override
  State<TypeSelectButton> createState() => _TypeSelectButtonState(text);
}

class _TypeSelectButtonState extends State<TypeSelectButton> {
  bool isClicked = false;
  final String text;

  _TypeSelectButtonState(this.text);

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
