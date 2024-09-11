import 'dart:io';

import 'package:dear_app/Feature/Auth/School/ui/select_department_interest_view.dart';
import 'package:dear_app/Feature/Auth/School/ui/select_department_view.dart';
import 'package:dear_app/Feature/Auth/School/ui/select_school_view.dart';
import 'package:dear_app/Feature/Auth/Signin/ui/first_signin_view.dart';
import 'package:dear_app/Feature/Main/Home/ui/home_view.dart';
import 'package:dear_app/Feature/Main/Navigation/ui/main_view.dart';
import 'package:dear_app/Shared/enums/user_type.dart';
import 'package:dear_app/Shared/model/api_response.dart';
import 'package:dear_app/Shared/model/response_data.dart';
import 'package:dear_app/Shared/model/user_profile_response.dart';
import 'package:dear_app/Shared/repository/user_repository.dart';
import 'package:dear_app/Shared/service/secure_storage_service.dart';
import 'package:get/get.dart';

class OnboardingViewModel extends GetxController {
  final UserRepository _userRepository = UserRepositoryImpl();



  RxBool loading = false.obs;

  // late UserProfileResponse userProfileResponse;

  void login() async {
    loading.value = true;
    ApiResponse apiResponse = await _userRepository.getProfile();
    loading.value = false;
    if (apiResponse.statusCode == HttpStatus.ok) {
      ResponseData<UserProfileResponse> responseData = apiResponse.data;
      UserProfileResponse userProfileResponse = responseData.data;

      if (userProfileResponse.schoolName == null) {
        Get.to(() => SelectSchoolView());
      } else if (userProfileResponse.mClass == null) {
        Get.to(() => SelectDepartmentInterestView());
      } else {
        Get.delete<OnboardingViewModel>();
        Get.offAll(() => MainView());
      }
    } else if (apiResponse.statusCode == HttpStatus.notFound) {
      Get.to(() => FirstSigninView());
    } else {
      SecureStorageService().clearAllTokens();
    }
  }

}
