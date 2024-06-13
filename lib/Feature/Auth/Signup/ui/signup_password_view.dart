import 'package:dear_app/Feature/Auth/Shared/component/bottom_button.dart';
import 'package:dear_app/Feature/Auth/Signup/component/password/input_password_confirm_widget.dart';
import 'package:dear_app/Feature/Auth/Signup/component/password/input_password_widget.dart';
import 'package:dear_app/Feature/Auth/Signup/ui/signup_name_view.dart';
import 'package:dear_app/Feature/Auth/Signup/view_model/signup_view_model.dart';
import 'package:dear_app/Shared/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupPasswordView extends StatefulWidget {
  const SignupPasswordView({super.key});

  @override
  State<SignupPasswordView> createState() => _SignupPasswordViewState();
}

class _SignupPasswordViewState extends State<SignupPasswordView> {
  final _loginVM = Get.put(SignUpViewModel());

  final _formkey = GlobalKey<FormState>();

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
                  key: _formkey,
                  child: Container(
                    width: 340,
                    child: Column(
                      children: [
                        InputPasswordWidget(),
                        SizedBox(height: 15),
                        InputPasswordConfirmWidget(),
                      ],
                    ),
                  )),
              Spacer(flex: 1),
              SizedBox(height: 30),
              BottomButton(action: () {
                if (_loginVM.passwordController.value.text.isEmpty) {
                  Utils.snackBar('알림', '비밀번호를 입력해 주세요.');
                  _loginVM.passwordFocusNode.value.requestFocus();
                  return;
                }

                if (_loginVM.passwordConfirmController.value.text.isEmpty) {
                  Utils.snackBar('알림', '비밀번호 확인을 입력해 주세요.');
                  _loginVM.passwordFocusNode.value.requestFocus();
                  return;
                }
                if(_loginVM.passwordController.value.text != _loginVM.passwordConfirmController.value.text){
                  Utils.snackBar('알림', '비밀번호를 확인해주세요.');
                  _loginVM.passwordFocusNode.value.requestFocus();
                  return;
                }

                Get.to(()=> const SignupNameView());

              }),
              SizedBox(height: 45),
            ],
          ),
        ),
      ),
    );
  }
}
