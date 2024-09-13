import 'package:dear_app/Feature/Auth/Onboarding/view_model/onboarding_view_model.dart';
import 'package:dear_app/Feature/Auth/Signin/component/input_email_widget.dart';
import 'package:dear_app/Feature/Auth/Signin/component/input_password_widget.dart';
import 'package:dear_app/Feature/Auth/Signin/view_model/controller/signin_view_model.dart';
import 'package:dear_app/Shared/component/dear_logo.dart';
import 'package:dear_app/Shared/component/round_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FirstSigninView extends StatefulWidget {
  FirstSigninView({super.key});

  @override
  State<FirstSigninView> createState() => _FirstSigninViewState();
}

class _FirstSigninViewState extends State<FirstSigninView> {
  final _signInVM = Get.put(SigninViewModel());
  final _obVM = Get.put(OnboardingViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
          scrolledUnderElevation: 0.0,
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
      body: SafeArea(
        child: InkWell(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Container(
            color: Colors.white,
            width: double.infinity,
            height: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 50),
                  DearLogo(size: 55),
                  SizedBox(height: 20),
                  Text(
                    "기다리고 있었어요!",
                    style: TextStyle(
                      height: 1.2,
                      fontFamily: "Pretendard",
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 55),
                  InputEmailWidget(),
                  SizedBox(height: 15),
                  InputPasswordWidget(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        style: TextButton.styleFrom(
                            minimumSize: Size.zero,
                            padding: EdgeInsets.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                        onPressed: () {},
                        child: Text(
                          style: TextStyle(
                              height: 1.2,
                              fontFamily: "Pretendard",
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff0E2764),
                              decoration: TextDecoration.underline),
                          "비밀번호 찾기",
                        ),
                        // SizedBox(width: 29),
                      ),
                    ),
                  ),
                  SizedBox(height: 220),
                  Obx(() => RoundButton(
                      width: 340,
                      height: 55,
                      title: '로그인',
                      loading: _signInVM.loading.value,
                      onPress: _signInVM.signIn)),
                  SizedBox(height: 45),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
