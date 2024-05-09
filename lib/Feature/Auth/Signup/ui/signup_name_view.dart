import 'package:dear_app/Feature/Auth/Shared/component/bottomButton.dart';
import 'package:dear_app/Feature/Auth/Signup/component/name/input_birthdate_widget.dart';
import 'package:dear_app/Feature/Auth/Signup/component/name/input_name_widget.dart';

import 'package:dear_app/Feature/Auth/Signup/view_model/controller/signup_view_model.dart';
import 'package:dear_app/Shared/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupNameView extends StatefulWidget {
  const SignupNameView({super.key});

  @override
  State<SignupNameView> createState() => _SignupNameViewState();
}

class _SignupNameViewState extends State<SignupNameView> {

  final _loginVM = Get.put(SignUpViewModel());

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
              onPressed: () => Get.back(),
              icon: Icon(
                CupertinoIcons.chevron_left,
                color: Color(0xffAAAAAA),
                size: 30,
              )),
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
              Form(
                  child: Container(
                    width: 340,
                    child: Column(
                      children: [
                        InputNameWidget(),
                        SizedBox(height: 15),
                        InputBirthdateWidget(),
                      ],
                    ),
                  )),
              Spacer(flex: 1),
              SizedBox(height: 30),
              BottomButton(action: () async {
                if (_loginVM.nameController.value.text.isEmpty) {
                  Utils.snackBar('알림', '이름을 입력해 주세요.');
                  _loginVM.nameFocusNode.value.requestFocus();
                  return;
                }

                if (_loginVM.birthdateController.value.text.isEmpty) {
                  Utils.snackBar('알림', '생년월일을 선택해 주세요.');
                  return;
                }

                await _loginVM.signup();

              }),
              SizedBox(height: 45),
            ],
          ),
        ),
      ),
    );
  }
}
