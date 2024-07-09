import 'dart:ffi';
import 'dart:io';

import 'package:dear_app/Feature/Main/Discover/model/discover_request.dart';
import 'package:dear_app/Feature/Main/Discover/model/discover_response.dart';
import 'package:dear_app/Feature/Main/Discover/repository/discover_repository.dart';
import 'package:dear_app/Shared/model/api_response.dart';
import 'package:dear_app/Shared/model/response_data.dart';
import 'package:get/get.dart';

class DiscoverViewModel extends GetxController {
  final DiscoverRepository _repository = DiscoverRepositoryImpl();

  Rxn<List<DiscoverResponse>> model = Rxn<List<DiscoverResponse>>([]);

  final DiscoverRequest _request = DiscoverRequest(page: 1, size: 10);

  void getProfessor() async {
    ApiResponse response =
        await _repository.getProfessor(discoverRequest: _request);

    if (response.statusCode == HttpStatus.ok) {
      ResponseData<List<DiscoverResponse>> responseData = ResponseData.fromJson(
          response.data,
          (json) =>
              (json as List).map((e) => DiscoverResponse.fromJson(e)).toList());

      model.value = responseData.data;
    }
  }
}
