import 'dart:io';

import 'package:dear_app/Feature/Auth/School/ui/select_school_view.dart';
import 'package:dear_app/Feature/Main/Home/ui/home_view.dart';
import 'package:dear_app/Feature/Main/Navigation/ui/main_view.dart';
import 'package:dear_app/Shared/model/api_response.dart';
import 'package:dear_app/Shared/model/response_data.dart';
import 'package:dear_app/Shared/model/user_profile_response.dart';
import 'package:dear_app/Shared/repository/user_repository.dart';
import 'package:get/get.dart';

class OnboardingViewModel extends GetxController {
  final UserRepository _userRepository = UserRepositoryImpl();

  RxBool loading = false.obs;

  void login() async {
    loading.value = true;
    ApiResponse apiResponse = await _userRepository.getProfile();
    loading.value = false;
    if (apiResponse.statusCode == HttpStatus.ok) {
      // 프로필 처리
      print("login OK");
      ResponseData<UserProfileResponse> responseData = apiResponse.data;
      UserProfileResponse userProfileResponse = responseData.data;
      if (userProfileResponse.schoolName == null) {
        Get.to(() => SelectSchoolView());
      } else {
        Get.delete<OnboardingViewModel>();
        Get.offAll(() => MainView());
      }
    } else if (apiResponse.statusCode == HttpStatus.notFound) {
      print("login not found");
      Get.to(() => SelectSchoolView());
    } else {}
  }

}
