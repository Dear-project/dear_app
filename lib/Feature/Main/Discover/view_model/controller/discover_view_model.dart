import 'dart:io';

import 'package:dear_app/Feature/Auth/School/model/school_info.dart';
import 'package:dear_app/Feature/Auth/School/model/search_school_request.dart';
import 'package:dear_app/Feature/Auth/School/model/search_school_response.dart';
import 'package:dear_app/Feature/Auth/School/repository/school_repository.dart';
import 'package:dear_app/Feature/Main/Discover/model/discover_request.dart';
import 'package:dear_app/Feature/Main/Discover/model/discover_response.dart';
import 'package:dear_app/Feature/Main/Discover/model/matching_request.dart';
import 'package:dear_app/Feature/Main/Discover/repository/discover_repository.dart';
import 'package:dear_app/Shared/enums/school_type.dart';
import 'package:dear_app/Shared/model/api_response.dart';
import 'package:dear_app/Shared/model/response_data.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class DiscoverViewModel extends GetxController {
  final DiscoverRepository _repository = DiscoverRepositoryImpl();

  final SchoolRepository _schoolRepository = SchoolRepositoryImpl();


  final PagingController<int, DiscoverResponse> pagingController = PagingController(firstPageKey: 1);

  Rxn<List<SchoolInfo>> univeristyList = Rxn<List<SchoolInfo>>([]);
  Rxn<List<DiscoverResponse>> suggestProfessorList = Rxn<List<DiscoverResponse>>([]);

  Future<void> getProfessor(int pageKey) async {
    ApiResponse response =
        await _repository.getProfessor(discoverRequest: DiscoverRequest(page: pageKey, size: 10));

    print([response.statusCode, response.errorMessage, response.data]);

    if (response.statusCode == HttpStatus.ok) {
      ResponseData<List<DiscoverResponse>> responseData = ResponseData.fromJson(
          response.data,
          (json) =>
              (json as List).map((e) => DiscoverResponse.fromJson(e)).toList());

      if (responseData.data.length < 10) {
        pagingController.appendLastPage(responseData.data);
      } else {
        final nextPageKey = pageKey + 1;
        pagingController.appendPage(responseData.data, nextPageKey);
      }
    }
  }

  void sendMatchingRequest(MatchingRequest? matchingRequest) async {
    ApiResponse response =
        await _repository.sendMatchingRequest(matchingRequest: matchingRequest);

    if (response.statusCode == HttpStatus.ok) {
      print("매칭 요청 성공");
      print("${response.statusCode} ${response.errorMessage}");
    } else {
      print("매칭 요청 실패");
      print("${response.statusCode} ${response.errorMessage}");
    }
  }

  void getMatchingRequest() async {}

  void getUniversity() async {
    ApiResponse response = await _schoolRepository.search(
        searchSchoolRequest:
            SearchSchoolRequest(gubunType: SchoolType.UNIV.key, keyword: ""));

    SearchSchoolResponse searchSchoolResponse =
        response.data as SearchSchoolResponse;

    univeristyList.value = searchSchoolResponse.data;
  }

  void getSuggestProfessor() async {
    ApiResponse response = await _repository.getProfessor(
      discoverRequest: DiscoverRequest(page: 1, size: 3)
    );

    if (response.statusCode == HttpStatus.ok) {
      ResponseData<List<DiscoverResponse>> responseData = ResponseData.fromJson(
          response.data,
              (json) =>
              (json as List).map((e) => DiscoverResponse.fromJson(e)).toList());

      suggestProfessorList.value = responseData.data;
    }
  }
}
