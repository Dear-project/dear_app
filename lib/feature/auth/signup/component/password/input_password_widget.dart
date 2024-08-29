import 'package:dear_app/Feature/Auth/Signup/view_model/signup_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InputPasswordWidget extends StatelessWidget {
  InputPasswordWidget({Key? key}) : super(key: key);

  final _signupVM = Get.put(SignUpViewModel());

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _signupVM.passwordController.value,
      focusNode: _signupVM.passwordFocusNode.value,
      obscureText: true,
      onChanged: (value) {},
      validator: (value) {
        // if(value!.isEmpty){
        //   Utils.snackBar('비밀번호', '비밀번호를 입력해 주세요.');
        // }
      },
      cursorColor: Color(0xff0E2764),
      decoration: InputDecoration(
        hintText: "비밀번호",
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
