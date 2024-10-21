import 'dart:io';

import 'package:dear_app/Feature/Auth/Onboarding/view_model/onboarding_view_model.dart';
import 'package:dear_app/Feature/Auth/School/ui/select_department_interest_view.dart';
import 'package:dear_app/Feature/Auth/School/ui/select_school_view.dart';
import 'package:dear_app/Feature/Auth/Signin/model/signin_request.dart';
import 'package:dear_app/Feature/Auth/Signin/repository/signin_repository.dart';
import 'package:dear_app/Feature/Main/Navigation/ui/main_view.dart';
import 'package:dear_app/Shared/enums/user_type.dart';
import 'package:dear_app/Shared/model/api_response.dart';
import 'package:dear_app/Shared/model/user_profile_response.dart';
import 'package:dear_app/Shared/repository/user_repository.dart';
import 'package:dear_app/Shared/service/secure_storage_service.dart';
import 'package:dear_app/Shared/utils/utils.dart';
import 'package:dear_app/Shared/model/authentication.dart';
import 'package:dear_app/Shared/model/response_data.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SigninViewModel extends GetxController {
  final storageService = Get.find<SecureStorageService>();
  final SignInRepository _repository = SignInRepositoryImpl();
  final OnboardingViewModel _onboardingVM = Get.put(OnboardingViewModel());

  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;

  RxBool loading = false.obs;


  Future<bool> signIn() async {

    String? fcmToken;

    await FirebaseMessaging.instance.getToken().then((value) {
      fcmToken = value;
    });

    if (emailController.value.text.isEmpty) {
      Utils.snackBar('알림', '이메일을 입력해 주세요.');
      return false;
    }

    if (passwordController.value.text.isEmpty) {
      Utils.snackBar('알림', '비밀번호를 입력해 주세요.');
      return false;
    }

    loading.value = true;

    ApiResponse apiResponse = await _repository.signIn(
        signInRequest: SignInRequest(
            email: emailController.value.text,
            password: passwordController.value.text,
          fcmToken: fcmToken
        ));


    if (apiResponse.statusCode == HttpStatus.ok) {
      ResponseData<Authentication> responseData = apiResponse.data;
      Authentication authentication = responseData.data;
      await storageService.saveAccessToken(authentication.accessToken);
      await storageService.saveRefreshToken(authentication.refreshToken);

      _onboardingVM.login();

      Get.delete<SigninViewModel>();


      return true;

    } else if (apiResponse.statusCode == HttpStatus.notFound) {
      Utils.snackBar('알림', 'Dear 회원이 아닙니다.');
    } else {
      Utils.snackBar('알림', '이메일 또는 비밀번호를 다시 확인해 주세요.');
    }

    loading.value = false;
    return false;
  }
}