import 'dart:io';

import 'package:dear_app/Feature/Main/Home/model/banner_response.dart';
import 'package:dear_app/Feature/Main/Home/repository/home_repository.dart';
import 'package:dear_app/Shared/model/api_response.dart';
import 'package:dear_app/Shared/model/response_data.dart';
import 'package:get/get.dart';

class HomeViewModel extends GetxController {
  final HomeRepository _repository = HomeRepositoryImpl();
  Rxn<List<BannerResponse>> model = Rxn<List<BannerResponse>>([]);

  void getBanner() async {
    ApiResponse response = await _repository.getBanner();

    if (response.statusCode == HttpStatus.ok) {
      ResponseData<List<BannerResponse>> bannerResponse = ResponseData.fromJson(response.data, (json) => (json as List).map((e) => BannerResponse.fromJson(e)).toList());

      model.value = bannerResponse.data;
      print(bannerResponse);
      // model.value = bannerResponse.data;
    }

  }
}