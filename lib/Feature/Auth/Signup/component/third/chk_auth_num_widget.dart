
import 'package:dear_app/Feature/Auth/Signup/model/email_auth_number_request.dart';
import 'package:dear_app/Feature/Auth/Signup/ui/signup_password_view.dart';
import 'package:dear_app/Feature/Auth/Signup/view_model/signup_view_model.dart';
import 'package:dear_app/Shared/component/round_button.dart';
import 'package:dear_app/Shared/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChkAuthNumWidget extends StatelessWidget {
  ChkAuthNumWidget({Key? key}) : super(key: key);
  final _signUpVM = Get.put(SignUpViewModel());

  @override
  Widget build(BuildContext context) {
    return Obx(() => RoundButton(
        width: 73,
        height: 40,
        title: '인증확인',
        loading: _signUpVM.loading.value,
        onPress: () async {
          if (_signUpVM.emailController.value.text.isEmpty ||
              _signUpVM.emailAuthNumberController.value.text.isEmpty) {
            return;
          }

          EmailAuthNumberRequest emailAuthNumberRequest =
          EmailAuthNumberRequest(
              email: _signUpVM.emailController.value.text,
              authCode: _signUpVM.emailAuthNumberController.value.text);

          if (await _signUpVM.verificationAuthNumber(
              emailAuthNumberRequest: emailAuthNumberRequest)) {
            _signUpVM.isVerifiedEmailAddress.value = true;
            Get.to(() => const SignupPasswordView());
          } else {
            Utils.toastMessage("인증 번호를 확인해 주세요.");
          }
        }));
  }
}
