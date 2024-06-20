import 'dart:io';

import 'package:dear_app/feature/auth/school/ui/select_school_view.dart';
import 'package:dear_app/feature/main/home/ui/home_view.dart';
import 'package:dear_app/shared/model/api_response.dart';
import 'package:dear_app/shared/model/response_data.dart';
import 'package:dear_app/shared/model/user_profile_response.dart';
import 'package:dear_app/shared/repository/user_repository.dart';
import 'package:get/get.dart';

class OnboardingViewModel extends GetxController {

  final UserRepository _userRepository = UserRepositoryImpl();


  RxBool loading = false.obs;

  void login() async {
    loading.value = true;
    ApiResponse apiResponse = await _userRepository.getProfile();
    loading.value = false;
    if(apiResponse.statusCode == HttpStatus.ok){
      // 프로필 처리
      print("login OK");
      ResponseData<UserProfileResponse> responseData = apiResponse.data;
      UserProfileResponse userProfileResponse = responseData.data;
      if(userProfileResponse.schoolName == null ){
        Get.to(() => SelectSchoolView());
      } else {
        Get.offAll(() => HomeView());
      }
    }else if(apiResponse.statusCode == HttpStatus.notFound){
      print("login not found");
      Get.to(() => SelectSchoolView());
    }else{

    }

  }

}