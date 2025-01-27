import 'package:dear_app/Feature/Auth/Signup/view_model/signup_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InputAuthNumberWidget extends StatelessWidget {
  InputAuthNumberWidget({Key? key}) : super(key: key);

  final _signupVM = Get.put(SignUpViewModel());

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _signupVM.emailAuthNumberController.value,
      onChanged: (value) {},
      cursorColor: Color(0xff0E2764),
      decoration: InputDecoration(
        hintText: "인증번호",
        hintStyle: TextStyle(
          height: 1.3,
          fontFamily: "Pretendard",
          fontSize: 17,
          fontWeight: FontWeight.w300,
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xff0E2764), width: 0.0),
            borderRadius: BorderRadius.all(Radius.circular(16)),
            gapPadding: BorderSide.strokeAlignCenter),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          borderSide: BorderSide(color: Color(0xffC5D0DA), width: 1.0),
        ),
      ),
      maxLines: 1,
    );
  }
}