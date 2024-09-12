import 'dart:io';

import 'package:dear_app/Feature/Main/Home/model/banner_response.dart';
import 'package:dear_app/Feature/Main/Home/model/schedule_response.dart';
import 'package:dear_app/Feature/Main/Home/repository/home_repository.dart';
import 'package:dear_app/shared/model/api_response.dart';
import 'package:dear_app/shared/model/response_data.dart';
import 'package:get/get.dart';

class HomeViewModel extends GetxController {
  final HomeRepository _repository = HomeRepositoryImpl();
  Rxn<List<BannerResponse>> model = Rxn<List<BannerResponse>>([]);
  Rxn<List<ScheduleResponse>> scheduleModel = Rxn<List<ScheduleResponse>>([]);

  void getBanner() async {
    print("배너");
    ApiResponse response = await _repository.getBanner();

    if (response.statusCode == HttpStatus.ok) {
      ResponseData<List<BannerResponse>> bannerResponse = ResponseData.fromJson(response.data, (json) => (json as List).map((e) => BannerResponse.fromJson(e)).toList());

      model.value = bannerResponse.data;
      print(bannerResponse);
      // model.value = bannerResponse.data;
    }

  }

  void getSchedule() async {
    print("학사일정");
    ApiResponse response = await _repository.getSchedule();

    if (response.statusCode == HttpStatus.ok) {
      ResponseData<List<ScheduleResponse>> scheduleResponse = ResponseData.fromJson(response.data, (json) => (json as List).map((e) => ScheduleResponse.fromJson(e)).toList());

      scheduleModel.value = scheduleResponse.data;
      print(scheduleResponse);
    }
  }
}