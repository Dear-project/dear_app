import 'dart:io';

import 'package:dear_app/Feature/Auth/Signup/model/email_auth_number_request.dart';
import 'package:dear_app/Feature/Auth/Signup/model/signup_request.dart';
import 'package:dear_app/Feature/Auth/Signup/repository/signup_repository.dart';
import 'package:dear_app/Feature/Main/Navigation/ui/mainView.dart';
import 'package:dear_app/Shared/enums/user_type.dart';
import 'package:dear_app/Shared/model/api_response.dart';
import 'package:dear_app/Shared/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';


class SignUpViewModel extends GetxController {
  final SignUpRepository _repository = SignUpRepositoryImpl();

  Rxn<UserType> type = Rxn<UserType>();

  // Verified email address
  RxBool isSentVerificationNumber = false.obs;
  RxBool isVerifiedEmailAddress = false.obs;
  RxBool loading = false.obs;

  final emailController = TextEditingController().obs;

  final emailAuthNumberController = TextEditingController().obs;

  final passwordController = TextEditingController().obs;

  final passwordFocusNode = FocusNode().obs;
  final passwordConfirmController = TextEditingController().obs;

  final passwordConfirmFocusNode = FocusNode().obs;

  final nameController = TextEditingController().obs;

  final nameFocusNode = FocusNode().obs;
  final birthdateController = TextEditingController().obs;

  Future<bool> requestEmailAuthNumber({required String email}) async {
    loading.value = true;
    ApiResponse apiResponse = await _repository.emailVerification(email: email);
    loading.value = false;
    if (apiResponse.statusCode == HttpStatus.conflict) {
      Utils.snackBar('알림', '이미 사용중인 이메일입니다.');
      return false;
    } else if (apiResponse.statusCode != HttpStatus.ok) {
      Utils.snackBar('알림', '이메일 주소를 확인해주세요.');
      return false;
    }
    return true;
  }

  Future<bool> verificationAuthNumber(
      {required EmailAuthNumberRequest emailAuthNumberRequest}) async {
    loading.value = true;
    ApiResponse apiResponse = await _repository.verificationAuthNumber(
        emailAuthNumberRequest: emailAuthNumberRequest);
    loading.value = false;
    if (apiResponse.statusCode == HttpStatus.ok) {
      return true;
    }
    return false;
  }

  Future<bool> signup() async {
    SignupRequest signupRequest = SignupRequest(
        email: emailController.value.text,
        password: passwordController.value.text,
        name: nameController.value.text,
        birthDay: birthdateController.value.text,
        type: type.value!.key);
    ApiResponse apiResponse = await _repository.signup(signupRequest: signupRequest);
    if(apiResponse.statusCode == HttpStatus.created){
      Get.delete<SignUpViewModel>();
      Get.offAll(MainView());

      return true;
    }
    return false;
  }
}
