import 'package:dear_app/Feature/Auth/Signup/view_model/signup_view_model.dart';
import 'package:dear_app/Shared/component/round_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReqAuthNumWidget extends StatelessWidget {
  VoidCallback callback;

  ReqAuthNumWidget({Key? key, required this.callback}) : super(key: key);
  final _loginVM = Get.put(SignUpViewModel());

  @override
  Widget build(BuildContext context) {
    return Obx(() => RoundButton(
        width: 73,
        height: 40,
        title: '인증요청',
        loading: _loginVM.loading.value,
        onPress: callback));
  }
}
