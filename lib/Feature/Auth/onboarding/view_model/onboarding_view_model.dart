import 'dart:io';

import 'package:dear_app/Feature/Auth/School/ui/select_school_view.dart';
import 'package:dear_app/shared/model/api_response.dart';
import 'package:dear_app/Shared/repository/user_repository.dart';
import 'package:dear_app/Shared/service/secure_storage_service.dart';
import 'package:get/get.dart';

class OnboardingViewModel extends GetxController {

  final UserRepository _userRepository = UserRepositoryImpl();


  RxBool loading = false.obs;

  void login() async {
    loading.value = true;
    ApiResponse apiResponse = await _userRepository.getProfile();
    loading.value = false;
    if(apiResponse.statusCode == HttpStatus.ok){
      print("login OK");
    }else if(apiResponse.statusCode == HttpStatus.notFound){
      print("login not found");
      Get.to(() => SelectSchoolView());
    }else{

    }

  }

}